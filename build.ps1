param(
    [ValidateSet("Debug", "Release", "RelWithDebInfo", "MinSizeRel")]
    [string]$Config = "Debug",
    [string]$BuildDir = "build"
)

$ErrorActionPreference = "Stop"

$RootDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$BuildPath = Join-Path $RootDir $BuildDir

function Invoke-Step {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Command,
        [Parameter(ValueFromRemainingArguments = $true)]
        [string[]]$Arguments
    )

    & $Command @Arguments
    if ($LASTEXITCODE -ne 0) {
        throw "Command failed with exit code ${LASTEXITCODE}: $Command $($Arguments -join ' ')"
    }
}

Write-Host "Configuring project..."
Invoke-Step cmake -S $RootDir -B $BuildPath

Write-Host "Building project ($Config)..."
Invoke-Step cmake --build $BuildPath --config $Config

$ExeName = "hello"
if ($IsWindows -or $env:OS -eq "Windows_NT") {
    $ExeName = "hello.exe"
}

$CandidatePaths = @(
    (Join-Path (Join-Path $BuildPath $Config) $ExeName),
    (Join-Path $BuildPath $ExeName)
)

$ExePath = $CandidatePaths | Where-Object { Test-Path $_ } | Select-Object -First 1

if ($ExePath) {
    Write-Host "Build finished: $ExePath"
} else {
    Write-Host "Build finished. Executable was not found in the common output paths."
}
