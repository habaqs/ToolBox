# Dans ce fichier un script permettant de monter un lecteur mappé.
# By @habaqs


### Variables
$LettreDuLecteur = "L:"
$CheminReseau = "\\Serveur\NomDuPartage"
$NomUtilisateur = "MonDomaine\User01"
$MotDePasse = "UnFauxMotDePasse"

# Pour que le lecteur soit présent au prochain démarrage
$ConnexionAutomatique = $true

### Supprimer le lecteur mappé
Remove-PSDrive -Name $LettreDuLecteur -Force

### Créer un lecteur mappé
$Net = New-Object -ComObject WScript.Network
$Net.MapNetworkDrive($LettreDuLecteur, $CheminReseau, $ConnexionAutomatique, $NomUtilisateur, $MotDePasse)
