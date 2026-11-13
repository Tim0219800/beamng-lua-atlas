# `gameplay_city`

*Fichier : `lua/ge/extensions/gameplay/city.lua` · VM : Game Engine (GE) · 140 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_city` : `extensions.load("gameplay_city")`, puis la globale `gameplay_city`

Extension qui charge le fichier city.sites.json du niveau courant (via gameplay_sites_sitesManager) et offre des requêtes sur ses zones et places de parking : zone de plus haute priorité à une position, valeurs fusionnées de champs personnalisés de zones, et tirage de deux places de parking distantes. La priorité d'une zone est le champ personnalisé 'priority' (0 par défaut). Les sites sont chargés au démarrage du niveau et libérés à la fin.

## Exemple

```lua
local zone = gameplay_city.getHighestPrioZone(getPlayerVehicle(0):getPosition())
```

## Remarques

- loadSites() sans argument utilise le dossier de getMissionFilename() + 'city.sites.json' ; rien n'est chargé si le fichier n'existe pas.
- getMergedFieldsFromZones fait ipairs(getHighestPrioZone(pos)), or cette fonction retourne une seule zone (table non tableau) ou nil : ipairs sur nil provoque une erreur et sur une zone n'itère rien d'utile. Bug probable du jeu.
- getRandomParkingSpots utilise sites directement sans test de nil ; elle plante si aucun site n'est chargé.
- Les champs de zone sont lus avec les suffixes '', '1', '2', '3', '4' (jusqu'à 5 groupes par zone).

**Dépendances (chargées avant) :** `gameplay_sites_sitesManager`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_city.getHighestPrioZone(pos)` | Retourne la première zone de plus haute priorité qui contient la position. | 30 |
| `gameplay_city.getMergedFieldsFromZones(pos, fieldName)` | Doit renvoyer les valeurs uniques, triées, des champs personnalisés fieldName (avec suffixes '' à '4') de la zone de plus haute priorité à la position. Voir notes : l'implémentation itère sur le résultat de getHighestPrioZone. | 47 |
| `gameplay_city.getRandomParkingSpots(minDist, startName)` | Tire deux places de parking au hasard dont la distance est au moins minDist, et donne la zone de plus haute priorité de chacune. | 61 |
| `gameplay_city.getSites()` | Retourne l'objet sites actuellement chargé. | 112 |
| `gameplay_city.getZonesByPrioForPosition(pos)` | Regroupe les zones contenant la position par priorité. | 13 |
| `gameplay_city.loadSites(file)` | Charge un fichier de sites via sitesManager.loadSites. Sans argument, charge city.sites.json du niveau courant (sauf si déjà chargé). | 97 |
| `gameplay_city.onClientEndMission(levelPath)` | Hook appelé à la fin d'un niveau : appelle reset(). *(interne)* *(hook)* | 124 |
| `gameplay_city.onClientStartMission(levelPath)` | Hook appelé au démarrage d'un niveau : charge les sites par défaut. *(interne)* *(hook)* | 120 |
| `gameplay_city.reset()` | Oublie les sites chargés (sites = nil). | 116 |

### Détail des paramètres

#### `gameplay_city.getHighestPrioZone(pos)`

Retourne la première zone de plus haute priorité qui contient la position.

- `pos` (*vec3*) : Position monde.
- **renvoie** : table|nil Zone, ou nil si aucun site chargé ou aucune zone.

#### `gameplay_city.getMergedFieldsFromZones(pos, fieldName)`

Doit renvoyer les valeurs uniques, triées, des champs personnalisés fieldName (avec suffixes '' à '4') de la zone de plus haute priorité à la position. Voir notes : l'implémentation itère sur le résultat de getHighestPrioZone.

- `pos` (*vec3*) : Position monde.
- `fieldName` (*string*) : Nom de base du champ personnalisé (ex. 'vehicleGroup').
- **renvoie** : table Tableau trié de valeurs ; vide si pos ou fieldName manque.

#### `gameplay_city.getRandomParkingSpots(minDist, startName)`

Tire deux places de parking au hasard dont la distance est au moins minDist, et donne la zone de plus haute priorité de chacune.

- `minDist` (*number|nil*) : Distance minimale en mètres (300 par défaut).
- `startName` (*string|nil*) : Nom imposé pour la place de départ, s'il existe.
- **renvoie** : string|nil Nom de la place de départ.
- **renvoie** : string Nom de la place d'arrivée.
- **renvoie** : string Nom de la zone de départ.
- **renvoie** : string Nom de la zone d'arrivée.

#### `gameplay_city.getSites()`

Retourne l'objet sites actuellement chargé.

- **renvoie** : table|nil Objet sites, ou nil.

#### `gameplay_city.getZonesByPrioForPosition(pos)`

Regroupe les zones contenant la position par priorité.

- `pos` (*vec3*) : Position monde.
- **renvoie** : table<number, table[]> Dictionnaire priorité -> liste de zones (la clé -math.huge existe toujours, avec une liste vide).
- **renvoie** : number Plus haute priorité trouvée (-math.huge si aucune).

#### `gameplay_city.loadSites(file)`

Charge un fichier de sites via sitesManager.loadSites. Sans argument, charge city.sites.json du niveau courant (sauf si déjà chargé).

- `file` (*string|nil*) : Chemin du fichier .sites.json.

#### `gameplay_city.onClientEndMission(levelPath)`

Hook appelé à la fin d'un niveau : appelle reset().

- `levelPath` (*string*) : Chemin du niveau.

#### `gameplay_city.onClientStartMission(levelPath)`

Hook appelé au démarrage d'un niveau : charge les sites par défaut.

- `levelPath` (*string*) : Chemin du niveau.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : {"gameplay_sites_sitesManager"}. |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/city.lua`.*
