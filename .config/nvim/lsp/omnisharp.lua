local function strip_archive_subpath(path)
	-- Matches regex from zip.vim / tar.vim
	path = vim.fn.substitute(path, "zipfile://\\(.\\{-}\\)::[^\\\\].*$", "\\1", "")
	path = vim.fn.substitute(path, "tarfile:\\(.\\{-}\\)::.*$", "\\1", "")
	return path
end

local function search_ancestors(startpath, func)
	-- if nvim_eleven then
	-- 	validate("func", func, "function")
	-- end
	if func(startpath) then
		return startpath
	end
	local guard = 100
	for path in vim.fs.parents(startpath) do
		-- Prevent infinite recursion if our algorithm breaks
		guard = guard - 1
		if guard == 0 then
			return
		end

		if func(path) then
			return path
		end
	end
end

local function escape_wildcards(path)
	return path:gsub("([%[%]%?%*])", "\\%1")
end

local function root_pattern(...)
	local patterns = vim.tbl_flatten({ ... })
	return function(startpath)
		startpath = strip_archive_subpath(startpath)
		for _, pattern in ipairs(patterns) do
			local match = search_ancestors(startpath, function(path)
				for _, p in ipairs(vim.fn.glob(table.concat({ escape_wildcards(path), pattern }, "/"), true, true)) do
					if vim.uv.fs_stat(p) then
						return path
					end
				end
			end)

			if match ~= nil then
				local real = vim.uv.fs_realpath(match)
				return real or match -- fallback to original if realpath fails
			end
		end
	end
end

return {
	cmd = {
		"dotnet",
		"/Users/bailej9/Downloads/omnisharp-osx-arm64-net6.0/OmniSharp.dll",
		"-z", -- https://github.com/OmniSharp/omnisharp-vscode/pull/4300
		"--hostPID",
		tostring(vim.fn.getpid()),
		"DotNet:enablePackageRestore=false",
		"--encoding",
		"utf-8",
		"--languageserver",
	},
	filetypes = { "cs", "vb" },
	root_dir = function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		on_dir(
			root_pattern("*.sln")(fname)
				or root_pattern("*.csproj")(fname)
				or root_pattern("omnisharp.json")(fname)
				or root_pattern("function.json")(fname)
		)
	end,
	init_options = {},
	capabilities = {
		workspace = {
			workspaceFolders = false, -- https://github.com/OmniSharp/omnisharp-roslyn/issues/909
		},
	},
	handlers = {
		["textDocument/definition"] = require("omnisharp_extended").definition_handler,
		["textDocument/typeDefinition"] = require("omnisharp_extended").type_definition_handler,
		["textDocument/references"] = require("omnisharp_extended").references_handler,
		["textDocument/implementation"] = require("omnisharp_extended").implementation_handler,
	},
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
	-- settings = {
	--   FormattingOptions = {
	--     -- Enables support for reading code style, naming convention and analyzer
	--     -- settings from .editorconfig.
	--     EnableEditorConfigSupport = true,
	--     -- Specifies whether 'using' directives should be grouped and sorted during
	--     -- document formatting.
	--     OrganizeImports = true,
	--   },
	--   MsBuild = {
	--     -- If true, MSBuild project system will only load projects for files that
	--     -- were opened in the editor. This setting is useful for big C# codebases
	--     -- and allows for faster initialization of code navigation features only
	--     -- for projects that are relevant to code that is being edited. With this
	--     -- setting enabled OmniSharp may load fewer projects and may thus display
	--     -- incomplete reference lists for symbols.
	--     LoadProjectsOnDemand = nil,
	--   },
	--   RoslynExtensionsOptions = {
	--     -- Enables support for roslyn analyzers, code fixes and rulesets.
	--     EnableAnalyzersSupport = nil,
	--     -- Enables support for showing unimported types and unimported extension
	--     -- methods in completion lists. When committed, the appropriate using
	--     -- directive will be added at the top of the current file. This option can
	--     -- have a negative impact on initial completion responsiveness,
	--     -- particularly for the first few completion sessions after opening a
	--     -- solution.
	--     EnableImportCompletion = nil,
	--     -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
	--     -- true
	--     AnalyzeOpenDocumentsOnly = nil,
	--     -- Enables the possibility to see the code in external nuget dependencies
	--     EnableDecompilationSupport = nil,
	--   },
	--   RenameOptions = {
	--     RenameInComments = nil,
	--     RenameOverloads = nil,
	--     RenameInStrings = nil,
	--   },
	--   Sdk = {
	--     -- Specifies whether to include preview versions of the .NET SDK when
	--     -- determining which version to use for project loading.
	--     IncludePrereleases = true,
	--   },
	-- },
}
