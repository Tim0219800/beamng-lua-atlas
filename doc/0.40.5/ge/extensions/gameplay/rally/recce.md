# `gameplay_rally_recce`

*Fichier : `lua/ge/extensions/gameplay/rally/recce.lua` · VM : Game Engine (GE) · 295 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/recce")` (fichier sous extensions/ mais pas une extension classique)

Gestionnaire de haut niveau des enregistrements de reconnaissance (recce) d'un rallye. Il charge la driveline (points horodatés du parcours roulé, via recce/drivelineRecording) et les cuts (marqueurs vocaux du copilote avec leurs transcriptions, via recce/cutsRecording), les dessine en debug, et convertit les cuts en données de pacenotes (createPacenotesData) à partir d'un snaproad. Il sert surtout à l'éditeur de rallye du worldEditor (import et visualisation de recce).

## Exemple

```lua
local Recce = require('/lua/ge/extensions/gameplay/rally/recce')
local recce = Recce(missionDir)
recce:loadDrivelineAndCuts()
local pacenotes = recce:createPacenotesData(notebook)
```

## Remarques

- Le module renvoie un constructeur : Recce(missionDir) crée l'objet et appelle init.
- loadDrivelineAndCuts renvoie toujours true ; _loadedDrivelineAndCuts n'est vrai que si la driveline ET au moins un cut ont été trouvés (vérifiable avec drivelineAndCutsLoaded).
- createPacenotesData dépend de editor_rallyEditor.getPrefDefaultRadius() : il ne fonctionne donc que si l'éditeur de rallye est chargé.
- createPacenotesData fusionne les cuts consécutifs tombant sur le même point de snaproad : le texte du doublon est ajouté (séparé par un espace) à la note du pacenote précédent.
- Incohérence probable : createPacenotesData appelle Snaproad(self) avec l'objet Recce, alors que Snaproad lit driveline().points (rallyManager lui passe une PointList) ; la driveline du Recce est dans self.driveline.
- Les RecceSettings sont commentés dans ce fichier (non utilisés).

## Classe `C`

Objet Recce renvoyé par le constructeur du module.

Le module renvoie un constructeur : `local obj = require("gameplay_rally_recce")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_resetState()` | Remet self.driveline et self.cuts à nil. | 50 |
| `C:createPacenotesData(notebook)` | Convertit les cuts en tables de pacenotes pour un notebook : crée un Snaproad sur la driveline, place pour chaque cut un waypoint « corner end » au plus près du cut et un « corner start » reculé d'environ 2 fois le rayon par défaut, nomme la note (Import_<id> ... ou Pacenote ...) et y met la transcription dans la langue copilote par défaut. | 165 |
| `C:drawDebugCuts()` | Dessine chaque cut sous forme de petite voiture, avec le texte de sa transcription. | 95 |
| `C:drawDebugRecce(drawLabels, mouseInfo)` | Dessine la driveline (via PointList:drawDebug) puis les cuts. Ne fait rien sans driveline. | 89 |
| `C:drawLittleCar(pos, quat, txt)` | Dessine avec debugDrawer une voiture schématique (4,4 x 1,8 x 1,6 m, quatre roues en sphères, caisse en prisme) centrée sur pos et orientée par quat ; affiche txt derrière si fourni. | 106 |
| `C:drivelineAndCutsLoaded()` | Indique si driveline et cuts ont été chargés avec succès par loadDrivelineAndCuts. | 46 |
| `C:init(missionDir)` | Initialise l'objet : mémorise missionDir, marque driveline/cuts comme non chargés et remet l'état à zéro. | 36 |
| `C:loadCuts()` | Charge les cuts avec leurs transcriptions dans self.cuts. | 75 |
| `C:loadDriveline()` | Charge la driveline (PointList) dans self.driveline. | 80 |
| `C:loadDrivelineAndCuts()` | Charge la driveline puis les cuts, logue un avertissement pour chacun s'il manque (normal pour une nouvelle reconnaissance). | 55 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/recce.lua`.*
