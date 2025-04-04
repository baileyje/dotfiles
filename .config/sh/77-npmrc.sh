## Medtronic Specific Scripts
# password changed

function npm-revpass {
  echo 'registry = https://case.artifacts.medtronic.com/artifactory/api/npm/teneo-npm-dev-virtual' > templates/.npmrc 
  curl -u$1 -s https://case.artifacts.medtronic.com:443/artifactory/api/npm/auth >> templates/.npmrc
  find . -name .npmrc | while read line; do install -v templates/.npmrc $line; done
}

