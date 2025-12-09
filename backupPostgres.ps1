# Backup Postgres Docker volume to a tar.gz file
# Usage: ./backup.ps1

# --- Config ---
$VolumeName   = "escriptorium_postgres"   # Docker volume name
$BackupFolder = "C:/Users/Fiona Wilson/Documents/escriptorium/backup"
$BackupFile   = "postgres_data.tar.gz"

# --- Ensure backup folder exists ---
if (!(Test-Path $BackupFolder)) {
    New-Item -ItemType Directory -Path $BackupFolder | Out-Null
}

# --- Run backup ---
Write-Host "Backing up volume '$VolumeName' to $BackupFolder/$BackupFile ..."
docker run --rm `
    -v ${VolumeName}:/volume `
    -v "${BackupFolder}:/backup" `
    alpine tar -czf /backup/${BackupFile} /volume

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Backup complete: $BackupFolder/$BackupFile"
} else {
    Write-Host "❌ Backup failed"
}