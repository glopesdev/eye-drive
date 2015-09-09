# Get subject name and current date time
$subjectName = Read-Host "Enter Subject Id"
$date = [DateTimeOffset]::Now

# Compute session data path
$dataPath = "..\data"
$dataPath = Join-Path -Path $dataPath -ChildPath $subjectName
$dataPath = Join-Path -Path $dataPath -ChildPath ($date).ToString("yyyy_MM_dd-HH_mm")

# Copy protocol control scripts
New-Item $dataPath -type directory
copy acquisition.bonsai* $dataPath

# Run bonsai
cd $dataPath
Write-Host $dataPath\acquisition.bonsai
& .\acquisition.bonsai
