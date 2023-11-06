## Script utilisé pour désactiver toute les fonctions de virtualisations. 
## Je l'ai écris quand je n'arrivais pas a faire de la virtualisations imbriqué (VM windows dans une VM ESX)
## By @habaqs 

# Vérifier si le script est exécuté en tant qu'administrateur
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Ce script doit être exécuté en tant qu'administrateur." -ForegroundColor Red
    exit 1
}

# Désactiver Hyper-V et tous ses composants
Write-Host "Désactivation de Hyper-V..."

# Désactiver le rôle Hyper-V
Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All -NoRestart

# Désactiver le sous-composant Hyper-V Hypervisor
Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-Hypervisor -NoRestart

# Désactiver le sous-composant Hyper-V Management Tools
Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-Tools-All -NoRestart

# Désactiver le sous-composant Hyper-V Platform
Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-Platform -NoRestart

# Désactiver le sous-composant Hyper-V PowerShell Module
Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-PowerShell -NoRestart

# Désactiver le sous-composant Hyper-V Module for Windows PowerShell
Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-Management-PowerShell -NoRestart

# Redémarrer l'ordinateur pour appliquer les modifications
Write-Host "Les modifications ont été apportées avec succès. Redémarrage de l'ordinateur..."

dism /online /disable-feature /featurename:Microsoft-hyper-v-all
bcdedit /set hypervisorlaunchtype off

Restart-Computer -Timeout 30
