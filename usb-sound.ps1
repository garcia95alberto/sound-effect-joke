# Rutas
$soundDir = "$env:APPDATA\Microsoft\Windows\Media"
$soundFile = "fart.wav"
$soundPath = Join-Path $soundDir $soundFile
$batFile = "$env:TEMP\setup.bat"
$ps1File = "$env:TEMP\changeSound.ps1"

# Crear carpeta de sonidos si no existe
if (!(Test-Path $soundDir)) {
    New-Item -ItemType Directory -Path $soundDir | Out-Null
}

# Descargar el archivo de sonido
Invoke-WebRequest -Uri "https://github.com/garcia95alberto/sound-effect-joke/blob/9dde30689d32c3747f1d2cf7ebedfa025b55b4de/fart.wav" -OutFile $soundPath

# Cambiar sonido del evento 'Device Connect'
$regPath = "HKCU:\AppEvents\Schemes\Apps\.Default\DeviceConnect\.Current"
Set-ItemProperty -Path $regPath -Name "" -Value $soundPath

# Forzar recarga del sonido (reinicia el explorador para aplicar sin reiniciar el equipo)
Stop-Process -Name explorer -Force
Start-Process explorer

# Espera un momento para que el sistema se estabilice
Start-Sleep -Seconds 3

# Eliminar archivos temporales
Remove-Item -Path $batFile -Force -ErrorAction SilentlyContinue
Remove-Item -Path $ps1File -Force -ErrorAction SilentlyContinue
