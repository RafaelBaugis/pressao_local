# Valores padrão
$default_P_mar = 1013
$default_altitude = 500
$default_T_local = 17

# Solicitar valores ao usuário
$P_mar = Read-Host "Digite a pressao ao nivel do mar (padrao: $default_P_mar hPa)" 
if (-not $P_mar) { $P_mar = $default_P_mar } else { $P_mar = [double]::Parse($P_mar) }

$altitude = Read-Host "Digite a altitude da cidade (padrao: $default_altitude metros)" 
if (-not $altitude) { $altitude = $default_altitude } else { $altitude = [double]::Parse($altitude) }

$T_local = Read-Host "Digite a temperatura local em Celsius (padrao: $default_T_local C)" 
if (-not $T_local) { $T_local = $default_T_local } else { $T_local = [double]::Parse($T_local) }

# Convertendo temperatura de Celsius para Kelvin
$T_local_K = $T_local + 273.15

# Constante
$L = 0.0065

# Calculando a pressão ao nível da cidade
$T_mar = $T_local_K
$h = $altitude
$P_cidade = $P_mar * [math]::Pow((1 - ($L * $h / $T_mar)), 5.255)

# Exibindo valores intermediários para depuração
Write-Output "T_local_K: $T_local_K"
Write-Output "T_mar: $T_mar"
Write-Output "h: $h"
Write-Output "P_cidade: $P_cidade"

# Exibindo o resultado final
Write-Output "A pressao atmosferica ao nivel da cidade e aproximadamente: $([math]::Round($P_cidade, 2)) hPa"
