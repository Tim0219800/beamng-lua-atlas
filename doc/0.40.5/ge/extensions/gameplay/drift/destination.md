# `gameplay_drift_destination`

*Fichier : `lua/ge/extensions/gameplay/drift/destination.lua` · VM : Game Engine (GE) · 226 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drift_destination` : `extensions.load("gameplay_drift_destination")`, puis la globale `gameplay_drift_destination`

Suivi d'itinéraire du mode drift (« A vers B »). setRacePath charge un chemin de course (gameplay/race/path) depuis un fichier JSON, éventuellement inversé, et en extrait les points. Chaque frame, il calcule la distance restante le long de ce chemin, la distance à la route prévue, si le véhicule roule à contresens, et cumule la distance parcourue à contresens : au-delà d'un seuil (10 m par défaut) wrongWayFail passe à true. Un moddeur de mission de drift lit ces valeurs pour afficher la progression ou faire échouer la mission.

## Exemple

```lua
gameplay_drift_destination.setRacePath({filePath = '/levels/west_coast_usa/race/driftRoute.race.json', reverse = false, maxWrongWayDist = 15})
local reste = gameplay_drift_destination.getRemainingDist()
```

## Remarques

- Le véhicule suivi est celui de gameplay_drift_drift.getVehId() (une seule voiture), contrairement à bounds.lua qui gère plusieurs véhicules.
- setRacePath complète data en place : reverse = false, maxWrongWayDist = 10 (defaultMaxWrongWayDist), disableWrongWayAndDist = false. Sans data.filePath, il logue un warning et ne fait rien.
- Contresens : vitesse > 0.5 m/s et produit scalaire (direction du segment, vitesse) <= 0 ; désactivé si disableWrongWayAndDist. Le hook onDriftWrongWay est émis à chaque frame tant que le véhicule est à contresens.
- wrongWayFail passe à true avec 0,2 s de délai (job asynchrone) pour laisser la priorité au message de reset du véhicule ; il revient à false dès que le véhicule n'est plus à contresens.
- reset() remet remainingDist, la distance de contresens cumulée et la dernière position à zéro mais ne remet pas wrongWayFail ni goingWrongWay à false.
- getRemainingDist, getGoingWrongWay et getWrongWayFail valent nil tant qu'aucun chemin n'est chargé ou calculé.
- Les distances sont en mètres.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drift_destination.getDisableWrongWayAndDist()` | Indique si la détection de contresens et le calcul de distance sont désactivés (valeur passée à setRacePath). | 196 |
| `gameplay_drift_destination.getDistToIntendedRoad()` | Distance (m) du véhicule au segment de route prévu le plus proche. | 192 |
| `gameplay_drift_destination.getDriftDebugInfo()` | Table de configuration du debug de l'extension : {default = false, canBeChanged = true}. | 184 |
| `gameplay_drift_destination.getGC()` | Garbage Lua produit par la dernière frame mesurée par le profileur. | 188 |
| `gameplay_drift_destination.getGoingWrongWay()` | Indique si le véhicule roule actuellement à contresens. | 176 |
| `gameplay_drift_destination.getPathData()` | Objet chemin de course chargé (gameplay/race/path). | 164 |
| `gameplay_drift_destination.getRemainingDist()` | Distance restante (m) le long du chemin jusqu'au dernier point. | 172 |
| `gameplay_drift_destination.getWaypoints()` | Positions des points du chemin (dans l'ordre de parcours, inversées si reverse). | 168 |
| `gameplay_drift_destination.getWrongWayFail()` | Vrai quand la distance cumulée à contresens dépasse maxWrongWayDist. | 180 |
| `gameplay_drift_destination.onUpdate()` | Hook par frame : met à jour distance restante, contresens et échec de contresens (rien si gameplay_drift_drift n'a pas de position de véhicule). *(interne)* *(hook)* | 147 |
| `gameplay_drift_destination.onVehicleResetted(vehicleId)` | Hook : véhicule réinitialisé ; remet la dernière position à zéro pour ne pas compter le saut de reset comme distance. *(interne)* *(hook)* | 206 |
| `gameplay_drift_destination.reset()` | Remet à zéro la distance restante, la distance cumulée à contresens et la dernière position (pas wrongWayFail). | 200 |
| `gameplay_drift_destination.setRacePath(data)` | Charge le chemin de course depuis data.filePath (JSON), l'inverse si data.reverse, applique autoConfig et extrait les positions des points de passage triés. | 27 |

### Détail des paramètres

#### `gameplay_drift_destination.getDisableWrongWayAndDist()`

Indique si la détection de contresens et le calcul de distance sont désactivés (valeur passée à setRacePath).

- **renvoie** : boolean|nil disableWrongWayAndDist, nil avant setRacePath.

#### `gameplay_drift_destination.getDistToIntendedRoad()`

Distance (m) du véhicule au segment de route prévu le plus proche.

- **renvoie** : number Distance, 0 par défaut.

#### `gameplay_drift_destination.getDriftDebugInfo()`

Table de configuration du debug de l'extension : {default = false, canBeChanged = true}.

- **renvoie** : table Infos de debug.

#### `gameplay_drift_destination.getGC()`

Garbage Lua produit par la dernière frame mesurée par le profileur.

- **renvoie** : number Quantité de garbage.

#### `gameplay_drift_destination.getGoingWrongWay()`

Indique si le véhicule roule actuellement à contresens.

- **renvoie** : boolean|nil true si contresens.

#### `gameplay_drift_destination.getPathData()`

Objet chemin de course chargé (gameplay/race/path).

- **renvoie** : table|nil Chemin, nil avant setRacePath.

#### `gameplay_drift_destination.getRemainingDist()`

Distance restante (m) le long du chemin jusqu'au dernier point.

- **renvoie** : number|nil Distance restante.

#### `gameplay_drift_destination.getWaypoints()`

Positions des points du chemin (dans l'ordre de parcours, inversées si reverse).

- **renvoie** : vec3[]|nil Liste de positions.

#### `gameplay_drift_destination.getWrongWayFail()`

Vrai quand la distance cumulée à contresens dépasse maxWrongWayDist.

- **renvoie** : boolean|nil Échec contresens.

#### `gameplay_drift_destination.onVehicleResetted(vehicleId)`

Hook : véhicule réinitialisé ; remet la dernière position à zéro pour ne pas compter le saut de reset comme distance.

- `vehicleId` (*integer*) : ID du véhicule réinitialisé.

#### `gameplay_drift_destination.setRacePath(data)`

Charge le chemin de course depuis data.filePath (JSON), l'inverse si data.reverse, applique autoConfig et extrait les positions des points de passage triés.

- `data` (*table*) : {filePath = string, reverse = boolean|nil, maxWrongWayDist = number|nil (défaut 10), disableWrongWayAndDist = boolean|nil}.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onDriftWrongWay`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/destination.lua`.*
