param(
    [Alias("u")]
    [switch]$update
)

$REQUESTED_VERSION="0.0"
$PROGRAM="azure-scripts"
$REPOSITORY="tdeheurles"
$SCRIPT="helpers.sh"

if (-Not (Test-Path ./.${PROGRAM}) -Or -Not (Test-Path ./.${PROGRAM}/${REQUESTED_VERSION}) -Or -Not (Test-Path ./.${PROGRAM}/${REQUESTED_VERSION}/${SCRIPT}) -Or $update )
{
    New-Item ${PROGRAM}/${REQUESTED_VERSION} -type directory -force | Out-Null
    
    Invoke-WebRequest `
        -OutFile ./.${PROGRAM}/${REQUESTED_VERSION}/${SCRIPT} `
        -Uri https://github.com/${REPOSITORY}/${PROGRAM}/releases/download/${REQUESTED_VERSION}/${SCRIPT}
}

./.${PROGRAM}/${REQUESTED_VERSION}/${SCRIPT} "$@"
