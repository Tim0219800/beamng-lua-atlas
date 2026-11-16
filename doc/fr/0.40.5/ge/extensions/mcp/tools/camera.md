# `mcp_tools_camera`

*Fichier : `lua/ge/extensions/mcp/tools/camera.lua` · VM : Game Engine (GE) · 98 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `mcp_tools_camera` : `extensions.load("mcp_tools_camera")`, puis la globale `mcp_tools_camera`

Outils MCP pour la caméra du joueur : changer de mode, orbiter autour d'un véhicule (avec rotation continue), lire l'état de la caméra et placer la caméra libre. S'appuie sur core_camera. Module chargé par mcp_tools ; chaque M.xxx est un outil qui renvoie (texte, estErreur).

## Remarques

- La rotation continue de l'orbite (spin) est appliquée dans onUpdate ; changer de mode caméra avec set_camera (autre que orbit), set_free_camera ou spin=0 l'arrête.
- Les angles sont en degrés, la distance en mètres. get_camera_state renvoie la rotation sous forme de quaternion {x,y,z,w}.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `mcp_tools_camera.get_camera_state()` | État de la caméra en JSON : mode, pos, rot (quaternion), fov (degrés). | 46 |
| `mcp_tools_camera.onUpdate(dtReal)` | Appelé chaque frame (via le fan-out de mcp_tools) : si une orbite continue est active, incrémente le yaw de speed*dtReal (modulo 360) et applique core_camera.setRotation. *(interne)* *(hook)* | 12 |
| `mcp_tools_camera.orbit_camera(args)` | Passe en caméra orbit et règle distance, rotation ou rotation continue autour d'un véhicule. | 29 |
| `mcp_tools_camera.set_camera(args)` | Change le mode caméra du joueur 0 par son nom (core_camera.setByName). | 19 |
| `mcp_tools_camera.set_free_camera(args)` | Passe en caméra libre et la place (position, rotation quaternion, fov) via core_camera.globalCameraFunction. La pose persiste ensuite, la caméra libre se déplace avec les entrées. | 59 |

### Détail des paramètres

#### `mcp_tools_camera.get_camera_state()`

État de la caméra en JSON : mode, pos, rot (quaternion), fov (degrés).

- **renvoie** : string JSON.
- **renvoie** : boolean true si core_camera indisponible.

#### `mcp_tools_camera.onUpdate(dtReal)`

Appelé chaque frame (via le fan-out de mcp_tools) : si une orbite continue est active, incrémente le yaw de speed*dtReal (modulo 360) et applique core_camera.setRotation.

- `dtReal` (*number*) : Durée réelle de la frame (s).

#### `mcp_tools_camera.orbit_camera(args)`

Passe en caméra orbit et règle distance, rotation ou rotation continue autour d'un véhicule.

- `args` (*table|nil*) : {yaw?: number°, pitch?: number° (défaut 20), distance?: number m, spin?: number °/s (0 stoppe), id?: integer}
- **renvoie** : string Résumé.
- **renvoie** : boolean true en cas d'erreur.

#### `mcp_tools_camera.set_camera(args)`

Change le mode caméra du joueur 0 par son nom (core_camera.setByName).

- `args` (*table*) : {name: string} orbit, driver, chase, external, hood, top, dash… (obligatoire).
- **renvoie** : string Confirmation ou erreur.
- **renvoie** : boolean true en cas d'erreur.

#### `mcp_tools_camera.set_free_camera(args)`

Passe en caméra libre et la place (position, rotation quaternion, fov) via core_camera.globalCameraFunction. La pose persiste ensuite, la caméra libre se déplace avec les entrées.

- `args` (*table|nil*) : {pos?: {x,y,z}, rot?: {x,y,z,w}, fov?: number°}
- **renvoie** : string « free camera set ».
- **renvoie** : boolean true en cas d'erreur.

## Champs

| Champ | Type | Description |
|---|---|---|
| `schemas` | table<string, table> | Schémas des outils set_camera, orbit_camera, get_camera_state, set_free_camera. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/mcp/tools/camera.lua`.*
