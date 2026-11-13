# `editor_drivePathEditor_record`

*Fichier : `lua/ge/extensions/editor/drivePathEditor/record.lua` · VM : Game Engine (GE) · 151 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_drivePathEditor_record` : `extensions.load("editor_drivePathEditor_record")`, puis la globale `editor_drivePathEditor_record`

Enregistrement d'un trajet pour le Drive Path Editor : pendant que le joueur conduit un véhicule, le module échantillonne sa position et sa vitesse chaque seconde, puis à l'arrêt crée une nouvelle spline « Recorded_<nom> » liée à ce véhicule, simplifiée par l'algorithme RDP.

## Remarques

- Constantes : fréquence d'échantillonnage 1 s, tolérance RDP 3.0, largeur par défaut 10 m, limite de vitesse par défaut 100, vitesse minimale enregistrée 3 m/s, les nœuds distants de moins de ~2 m (distance² <= 4.1) sont fusionnés.
- La spline créée a routeSpeedMode = 'off' et speedProfileMode = 1 (vitesses par nœud) ; widths = 10, nmls = (0,0,1), velLimits = 100 pour tous les nœuds.
- stopRecord suppose qu'un enregistrement a été démarré : sans véhicule enregistré (recordingVehicle nil) la fonction provoquerait une erreur.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_drivePathEditor_record.getRecordingTime()` | Temps écoulé depuis le début de l'enregistrement. | 36 |
| `editor_drivePathEditor_record.handleRecord()` | À appeler chaque frame : fait avancer le chrono et ajoute un point (position, vitesse >= 3 m/s) toutes les secondes. Sans effet si aucun véhicule n'est enregistré. *(interne)* | 39 |
| `editor_drivePathEditor_record.startRecord(vehicle)` | Démarre l'enregistrement : mémorise le véhicule, y fait entrer le joueur (be:enterVehicle(0, …)), vide les données et enregistre le premier point. | 64 |
| `editor_drivePathEditor_record.stopRecord(sceneVehicles)` | Termine l'enregistrement : ajoute une spline de chemin liée au véhicule, copie positions et vitesses, retire les doublons proches, simplifie via rdp.simplifyNodesVels et remet l'état à zéro. | 86 |

### Détail des paramètres

#### `editor_drivePathEditor_record.getRecordingTime()`

Temps écoulé depuis le début de l'enregistrement.

- **renvoie** : number secondes

#### `editor_drivePathEditor_record.startRecord(vehicle)`

Démarre l'enregistrement : mémorise le véhicule, y fait entrer le joueur (be:enterVehicle(0, …)), vide les données et enregistre le premier point.

- `vehicle` (*table|nil*) : entrée de véhicule de l'éditeur avec .veh (objet véhicule) et .name

#### `editor_drivePathEditor_record.stopRecord(sceneVehicles)`

Termine l'enregistrement : ajoute une spline de chemin liée au véhicule, copie positions et vitesses, retire les doublons proches, simplifie via rdp.simplifyNodesVels et remet l'état à zéro.

- `sceneVehicles` (*table*) : véhicules de la scène ; l'entrée correspondante reçoit isLink = true et linkSplineId

## Appels vers le moteur (C++)

- `be:` `enterVehicle`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/drivePathEditor/record.lua`.*
