# Script pour vider le cache de Microsoft Teams. vous devez arreter teams avant de l'executer 
# By @habaqs

$foldersTocleean=@(
    "$env:APPDATA\Microsoft\Teams\blob_storage\",
    "$env:APPDATA\Microsoft\Teams\Cache\",
    "$env:APPDATA\Microsoft\Teams\databases\",
    "$env:APPDATA\Microsoft\Teams\GPUCache\",
    "$env:APPDATA\Microsoft\Teams\IndexedDB\",
    "$env:APPDATA\Microsoft\Teams\Local Storage\",
    "$env:APPDATA\Microsoft\Teams\tmp\"
)

# voir fichier Fonctions
function CleanFolders {
    param (
        $folders
    )

    foreach($folder in $folders){ 
        Get-ChildItem -Path $folder | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
    }
}

CleanFolders($foldersTocleean)