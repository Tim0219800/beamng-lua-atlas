# `editor_resourceChecker`

*Fichier : `lua/ge/extensions/editor/resourceChecker.lua` · VM : Game Engine (GE) · 1841 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_resourceChecker` : `extensions.load("editor_resourceChecker")`, puis la globale `editor_resourceChecker`

Fenêtre « Resources Checker » de l'éditeur (menu Assets) pour auditer les ressources du niveau courant. Trois onglets : « Materials Verification » (version des matériaux, doublons, suppression de pid, conversion en PNG, vérification des cartes/fichiers de textures, matériaux manquants ou factices), « Resources Explorer » (TSStatics chargés, ForestItems, terrains, matériaux/meshes/textures utilisés ou non, données de collision) et « Asset Stats » (scan des fichiers, treemap et liste par taille). Permet aussi d'aperçu d'images, de résoudre des doublons et de supprimer des fichiers inutilisés. Les calculs lourds sont faits par resourceUtil (extensions.editor_resourceChecker_resourceUtil) qui renvoie ses résultats par jobData.

## Remarques

- resourceUtil est lu à l'initialisation du fichier (extensions.editor_resourceChecker_resourceUtil) : il vaut nil si cette extension n'est pas déjà chargée à ce moment.
- jobData(type, data) : type 2 stocke le résultat du vérificateur de matériaux, type 3 celui de l'explorateur de ressources ; les autres types sont ignorés.
- onEditorActivated et onEditorDeactivated sont vides.
- Des actions de ce panneau suppriment des fichiers du niveau (« Remove selected files », « Remove all unused files ») : à utiliser avec prudence.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_resourceChecker.jobData(type, data)` | Reçoit le résultat d'un job asynchrone de resourceUtil et le range pour l'affichage. *(interne)* | 1805 |
| `editor_resourceChecker.onEditorActivated()` | Hook à l'activation de l'éditeur ; vide. *(interne)* *(hook)* | 1818 |
| `editor_resourceChecker.onEditorDeactivated()` | Hook à la désactivation de l'éditeur ; vide. *(interne)* *(hook)* | 1822 |
| `editor_resourceChecker.onEditorGui()` | Hook : dessine la fenêtre à onglets, l'aperçu d'image et le résolveur de doublons. *(interne)* *(hook)* | 1778 |
| `editor_resourceChecker.onEditorInitialized()` | Hook : ajoute l'entrée de menu « Resources Checker » (groupe Assets) et enregistre les trois fenêtres (principale, aperçu d'image, doublons). *(interne)* *(hook)* | 1826 |
| `editor_resourceChecker.onWindowMenuItem()` | Affiche la fenêtre « resourceChecker » (appelé par l'entrée de menu). *(interne)* *(hook)* | 17 |
| `editor_resourceChecker.updateDuplicateTable(data)` | Remplace la table des doublons affichée dans le résolveur de doublons. *(interne)* | 1814 |

### Détail des paramètres

#### `editor_resourceChecker.jobData(type, data)`

Reçoit le résultat d'un job asynchrone de resourceUtil et le range pour l'affichage.

- `type` (*integer*) : 2 = résultats de vérification des matériaux, 3 = résultats de l'explorateur de ressources.
- `data` (*any*) : Données du job.

#### `editor_resourceChecker.updateDuplicateTable(data)`

Remplace la table des doublons affichée dans le résolveur de doublons.

- `data` (*table*) : Table de doublons calculée par resourceUtil (déduit du code).

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `stat`
- `be:` `getPlayerVehicleID`
- `scenetree.` `findObject`, `getAllObjects`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/resourceChecker.lua`.*
