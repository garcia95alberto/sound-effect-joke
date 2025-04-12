# Ruta donde guardar el sonido
$soundPath = "$env:APPDATA\fart.wav"

# Descargar el archivo de sonido
Invoke-WebRequest -Uri "https://tuservidor.com/fart.wav" -OutFile $soundPath

# Ruta del registro para cambiar el sonido de conexión de USB
$regPath = "HKCU:\AppEvents\Schemes\Apps\.Default\DeviceConnect\.Current"

# Cambiar el sonido del evento
Set-ItemProperty -Path $regPath -Name "(default)" -Value $soundPath
