# `mcp_shared`

*Fichier : `lua/ge/extensions/mcp/shared.lua` · VM : Game Engine (GE) · 44 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `mcp_shared` : `extensions.load("mcp_shared")`, puis la globale `mcp_shared`

État et petites aides partagés par les modules d'outils MCP (mcp/tools/*.lua). Chargé par `require('mcp/shared')`, donc singleton via le cache de require (ce n'est pas une extension chargée par extensions.load en usage normal). Contient les résultats des appels asynchrones (GE <-> VM véhicule / UI), le journal des instabilités physiques et des helpers pour résoudre l'id de véhicule et lire beamng.log.

## Exemple

```lua
local shared = require('mcp/shared')
local vid = shared.argVehId({id = 12})   -- 12, ou le véhicule joueur si id absent
local text, eof = shared.readLogFrom(nil) -- eof = taille actuelle du log
```

## Remarques

- readLogFrom ouvre `beamng.log` en relatif au répertoire courant (dossier du jeu / dossier utilisateur selon le lancement) ; renvoie nil si le fichier est introuvable.
- instabilityLog est alimenté par mcp/tools/vehicle.lua (hook onInstabilityDetected, 50 entrées max).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `mcp_shared.argModel(args)` | Modèle pris dans args.model, sinon le fichier JBeam du véhicule joueur courant. | 22 |
| `mcp_shared.argVehId(args)` | Id de véhicule pris dans args.id, sinon celui du véhicule joueur 0. | 16 |
| `mcp_shared.readLogFrom(pos)` | Lit beamng.log depuis l'octet `pos` jusqu'à la fin. Avec pos=nil, démarre à la fin (renvoie "") : sert à mesurer la taille actuelle. Si le fichier a rétréci (rotation, troncature), repart de 0. | 31 |
| `mcp_shared.vehData(args)` | Renvoie le paquet de données du véhicule spawné (parts, config, fichiers, ioCtx) via core_vehicle_manager.getVehicleData. | 19 |

### Détail des paramètres

#### `mcp_shared.argModel(args)`

Modèle pris dans args.model, sinon le fichier JBeam du véhicule joueur courant.

- `args` (*table|nil*) : Arguments de l'outil ; champ `model`.
- **renvoie** : string|nil Clé du modèle, nil s'il n'y a ni argument ni véhicule joueur.

#### `mcp_shared.argVehId(args)`

Id de véhicule pris dans args.id, sinon celui du véhicule joueur 0.

- `args` (*table|nil*) : Arguments de l'outil ; champ `id` lu avec tonumber.
- **renvoie** : integer Id du véhicule (peut être -1 ou invalide s'il n'y a pas de véhicule joueur).

#### `mcp_shared.readLogFrom(pos)`

Lit beamng.log depuis l'octet `pos` jusqu'à la fin. Avec pos=nil, démarre à la fin (renvoie "") : sert à mesurer la taille actuelle. Si le fichier a rétréci (rotation, troncature), repart de 0.

- `pos` (*integer|nil*) : Offset en octets où commencer.
- **renvoie** : string|nil Texte lu (nil si le fichier n'a pas pu être ouvert).
- **renvoie** : integer Taille du fichier (position de fin) à réutiliser comme prochain `pos`.

#### `mcp_shared.vehData(args)`

Renvoie le paquet de données du véhicule spawné (parts, config, fichiers, ioCtx) via core_vehicle_manager.getVehicleData.

- `args` (*table|nil*) : Arguments de l'outil (voir argVehId).
- **renvoie** : table|nil Données du véhicule, ou nil.

## Champs

| Champ | Type | Description |
|---|---|---|
| `asyncResults` | table<string, any> | Résultats des aller-retours asynchrones, indexés par type : `vue`, `ui`, `vehLua` (table vehId -> résultat), `ai`, `electrics`, `hydro`, `testConfigs`. Remplis par les callbacks `mcp_tools._cb.*`, consommés par l'appel d'outil suivant. |
| `instabilityLog` | table | Liste (max 50) des instabilités physiques détectées : {time, vid, jbeam}. Le commentaire du code dit à tort « async round-trip results » pour ce champ : il s'agit bien du journal d'instabilité. |
| `vehIdProp` | table | Fragment de schéma JSON réutilisé par les outils véhicule : {id = {type='integer', description='Vehicle id (default: current player vehicle)'}}. |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicle`, `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/mcp/shared.lua`.*
