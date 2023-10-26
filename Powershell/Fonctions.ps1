# Dans ce fichier un regroupement de fonctions utile pour l'edition de script



function checkPowershellAdmin {
    <#
       .Description
       Retourne Vrais si la session powershell a été démarré en tant qu'administrateur.
    #>
    return ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}


function CleanFolders {
    <#
        .DESCRIPTION
        !!! La fonction ne demande aucune validation lors de la suppresion des fichiers/dossiers
        Supprimer le contenu du dossier (fichiers et dossiers) sans supprimer le dossier lui-même.
        En cas d'erreur le fichier est ignoré
        !!! La fonction ne demande aucune validation lors de la suppresion des fichiers/dossiers

        .PARAMETER $folder
        liste de dossiers a nettoyer 
    #>
    param (
        $folders
    )

    foreach($folder in $folders){ 
        Get-ChildItem -Path $folder | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
    }
}