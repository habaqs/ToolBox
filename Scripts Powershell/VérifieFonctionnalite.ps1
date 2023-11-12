# Vérifier si le script est exécuté en tant qu'administrateur
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Ce script doit être exécuté en tant qu'administrateur." -ForegroundColor Red
    exit 1
}


$features = @(
    "Microsoft-Hyper-V-All",
    "Microsoft-Hyper-V-Hypervisor",
    "Microsoft-Hyper-V-Tools-All",
    "Microsoft-Hyper-V-Management-PowerShell"
    # Ajoutez d'autres noms de fonctionnalités ici selon vos besoins
)

foreach ($feature in $features) {
    $featureInfo = Get-WindowsOptionalFeature -Online -FeatureName $feature

    $featureName = $featureInfo.FeatureName
    $state = $featureInfo.State

    if ($state -eq "Enabled") {
        Write-Host "Fonctionnalité : $featureName"
        Write-Host "État : $state"
        Write-Host ""
    } else {
        Write-Host "Fonctionnalité : $featureName" -ForegroundColor Red
        Write-Host "État : $state" -ForegroundColor Red
        Write-Host ""
    }
}
