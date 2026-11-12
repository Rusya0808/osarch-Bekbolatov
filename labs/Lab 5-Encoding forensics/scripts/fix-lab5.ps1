<#
.SYNOPSIS
    Lab 5 — Encoding Forensics Automation
#>
$ErrorActionPreference = "Stop"
$BaseDir     = Split-Path -Parent $PSScriptRoot
$EvidenceDir = Join-Path $BaseDir "evidence"

if (!(Test-Path $EvidenceDir)) { New-Item -ItemType Directory -Path $EvidenceDir -Force | Out-Null }

$InputFile  = Join-Path $EvidenceDir "staff-broken.csv"
$OutputFile = Join-Path $EvidenceDir "staff-fixed.csv"

if (!(Test-Path $InputFile)) {
    Write-Error "Файл staff-broken.csv не найден в папке evidence!"
    exit 1
}

$HashBefore = (Get-FileHash -Path $InputFile -Algorithm SHA256).Hash.ToLower()
"$HashBefore  staff-broken.csv" | Out-File -Encoding ascii (Join-Path $EvidenceDir "checksum-before.txt")

$RawBytes = [IO.File]::ReadAllBytes($InputFile)
@(
    "=== FILE INFO (BEFORE) ==="
    "File size: $($RawBytes.Length) bytes"
) | Out-File -Encoding utf8 (Join-Path $EvidenceDir "file-before.txt")

$Len = [Math]::Min(16, $RawBytes.Length)
$Hex16 = [System.BitConverter]::ToString($RawBytes, 0, $Len) -replace '-', ' '
$Ascii16 = -join ($RawBytes[0..($Len - 1)] | ForEach-Object { if ($_ -ge 32 -and $_ -le 126) { [char]$_ } else { '.' } })
"Offset 00000000: $Hex16  $Ascii16" | Out-File -Encoding ascii (Join-Path $EvidenceDir "hexdump-before.txt")

$SrcEnc = [Text.Encoding]::GetEncoding(1251)
$Text = [IO.File]::ReadAllText($InputFile, $SrcEnc)
$Utf8Bom = New-Object Text.UTF8Encoding($true)
[IO.File]::WriteAllText($OutputFile, $Text, $Utf8Bom)

$FixedBytes = [IO.File]::ReadAllBytes($OutputFile)
@(
    "=== FILE INFO (AFTER) ==="
    "File size: $($FixedBytes.Length) bytes"
) | Out-File -Encoding utf8 (Join-Path $EvidenceDir "file-after.txt")

Write-Host "Готово! Все файлы созданы." -ForegroundColor Green
