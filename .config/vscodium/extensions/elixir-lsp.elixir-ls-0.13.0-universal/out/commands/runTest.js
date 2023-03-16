"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const child_process_1 = require("child_process");
async function runTest(args) {
    const command = buildTestCommand(args);
    console.log(command, args.cwd);
    return new Promise((resolve, reject) => {
        (0, child_process_1.exec)(command, { cwd: args.cwd }, (error, stdout, stderr) => {
            console.log("stdout", stdout);
            console.log("stderr", stderr);
            if (!error) {
                resolve(stdout);
            }
            else {
                reject(stdout);
            }
        });
    });
}
exports.default = runTest;
function buildTestCommand(args) {
    let line = "";
    if (typeof args.line === "number") {
        line = `:${args.line}`;
    }
    return `mix test ${args.filePath}${line}`;
}
//# sourceMappingURL=runTest.js.map