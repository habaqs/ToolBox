
$foldersTocleean=@(
    "$env:APPDATA\Microsoft\Teams\blob_storage\",
    "$env:APPDATA\Microsoft\Teams\Cache\",
    "$env:APPDATA\Microsoft\Teams\databases\",
    "$env:APPDATA\Microsoft\Teams\GPUCache\",
    "$env:APPDATA\Microsoft\Teams\IndexedDB\",
    "$env:APPDATA\Microsoft\Teams\Local Storage\",
    "$env:APPDATA\Microsoft\Teams\tmp\"
)

function CleanFolders {
    param (
        $folders
    )

    foreach($folder in $folders){ 
#       Supprimer le contenu du dossier (fichiers et dossiers) sans supprimer le dossier lui-même
        Get-ChildItem -Path $folder | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
}
    
}

CleanFolders($foldersTocleean)