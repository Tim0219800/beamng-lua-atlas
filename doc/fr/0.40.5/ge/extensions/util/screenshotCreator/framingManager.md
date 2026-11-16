# `util_screenshotCreator_framingManager`

*Fichier : `lua/ge/extensions/util/screenshotCreator/framingManager.lua` · VM : Game Engine (GE) · 124 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_framingManager` : `extensions.load("util_screenshotCreator_framingManager")`, puis la globale `util_screenshotCreator_framingManager`

Registre des modes de cadrage du créateur de captures. Il collecte les modes en diffusant le hook onScreenshotCreatorCollectFramingModes (chaque mode est une table {id, label, order, resolve, ...}), garde le mode choisi (par défaut « procedural ») et délègue le calcul de caméra à mode.resolve(context). Il sérialise le mode choisi pour survivre au rechargement des extensions.

## Remarques

- Un mode n'est retenu que si c'est une table avec un id string non vide, une fonction resolve et un id unique ; les modes sont triés par order (absent = en dernier) puis par id.
- Les modes sont recollectés (hook diffusé) à chaque appel de list, getSelected, set ou resolve : pas de cache.
- Si le mode choisi n'existe plus, getSelected revient à « procedural ».
- list/get/set/getSelected/setSelected/listModes/getSelectedModeId/setSelectedModeId sont des alias des mêmes fonctions ; migrateLegacyState est un alias de deserialize.
- deserialize accepte un ancien format : skipCustomCameras == false donne « configured », sinon « procedural ».

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_framingManager.deserialize(data)` | Restaure le mode sélectionné depuis un état sauvegardé (clés selectedModeId, framingModeId ou ancien skipCustomCameras) ; retombe sur « procedural » si invalide. Alias : migrateLegacyState, onDeserialized. | 88 |
| `util_screenshotCreator_framingManager.get()` | Alias de getSelected. | 54 |
| `util_screenshotCreator_framingManager.getSelected()` | Renvoie l'id du mode sélectionné (« procedural » si le mode mémorisé n'existe plus). Alias : get, getSelectedModeId. | 54 |
| `util_screenshotCreator_framingManager.getSelectedModeId()` | Alias de getSelected. | 54 |
| `util_screenshotCreator_framingManager.list()` | Renvoie la liste triée des modes de cadrage valides collectés par le hook. Alias : listModes. | 50 |
| `util_screenshotCreator_framingManager.listModes()` | Alias de list. | 50 |
| `util_screenshotCreator_framingManager.migrateLegacyState(data)` | Alias de deserialize (migration d'anciens états). | 88 |
| `util_screenshotCreator_framingManager.onDeserialized(data)` | Hook appelé après rechargement avec l'état sérialisé ; identique à deserialize. *(interne)* *(hook)* | 88 |
| `util_screenshotCreator_framingManager.onSerialize()` | Hook de sérialisation avant rechargement des extensions ; identique à serialize. *(interne)* *(hook)* | 84 |
| `util_screenshotCreator_framingManager.resolve(modeId, context)` | Calcule la caméra de cadrage avec le mode donné (ou le mode sélectionné). On peut appeler resolve(context) en omettant modeId : si le premier argument est une table et le second nil, il est pris comme contexte. | 66 |
| `util_screenshotCreator_framingManager.serialize()` | Renvoie l'état à sauvegarder : {selectedModeId = ...}. Alias de onSerialize. | 84 |
| `util_screenshotCreator_framingManager.set(modeId)` | Alias de setSelected. | 58 |
| `util_screenshotCreator_framingManager.setSelected(modeId)` | Sélectionne le mode de cadrage par son id. Alias : set, setSelectedModeId. | 58 |
| `util_screenshotCreator_framingManager.setSelectedModeId(modeId)` | Alias de setSelected. | 58 |

### Détail des paramètres

#### `util_screenshotCreator_framingManager.deserialize(data)`

Restaure le mode sélectionné depuis un état sauvegardé (clés selectedModeId, framingModeId ou ancien skipCustomCameras) ; retombe sur « procedural » si invalide. Alias : migrateLegacyState, onDeserialized.

- `data` (*table|nil*) : État sauvegardé.

#### `util_screenshotCreator_framingManager.get()`

Alias de getSelected.

- **renvoie** : string Id du mode.

#### `util_screenshotCreator_framingManager.getSelected()`

Renvoie l'id du mode sélectionné (« procedural » si le mode mémorisé n'existe plus). Alias : get, getSelectedModeId.

- **renvoie** : string Id du mode.

#### `util_screenshotCreator_framingManager.getSelectedModeId()`

Alias de getSelected.

- **renvoie** : string Id du mode.

#### `util_screenshotCreator_framingManager.list()`

Renvoie la liste triée des modes de cadrage valides collectés par le hook. Alias : listModes.

- **renvoie** : table[] Modes {id, label, order, resolve, ...}.

#### `util_screenshotCreator_framingManager.listModes()`

Alias de list.

- **renvoie** : table[] Modes de cadrage.

#### `util_screenshotCreator_framingManager.migrateLegacyState(data)`

Alias de deserialize (migration d'anciens états).

- `data` (*table|nil*) : État sauvegardé.

#### `util_screenshotCreator_framingManager.onDeserialized(data)`

Hook appelé après rechargement avec l'état sérialisé ; identique à deserialize.

- `data` (*table|nil*) : État sauvegardé.

#### `util_screenshotCreator_framingManager.onSerialize()`

Hook de sérialisation avant rechargement des extensions ; identique à serialize.

- **renvoie** : table {selectedModeId}.

#### `util_screenshotCreator_framingManager.resolve(modeId, context)`

Calcule la caméra de cadrage avec le mode donné (ou le mode sélectionné). On peut appeler resolve(context) en omettant modeId : si le premier argument est une table et le second nil, il est pris comme contexte.

- `modeId` (*string|table|nil*) : Id du mode, ou directement le contexte.
- `context` (*table*) : Contexte de cadrage transmis à mode.resolve (vehicle, resolution, fov…).
- **renvoie** : table|nil Résultat du mode (pos, rot, ...).
- **renvoie** : string|nil Erreur : mode inconnu ou contexte qui n'est pas une table.

#### `util_screenshotCreator_framingManager.serialize()`

Renvoie l'état à sauvegarder : {selectedModeId = ...}. Alias de onSerialize.

- **renvoie** : table {selectedModeId = string}.

#### `util_screenshotCreator_framingManager.set(modeId)`

Alias de setSelected.

- `modeId` (*string*) : Id du mode.
- **renvoie** : boolean Succès.
- **renvoie** : string|nil Erreur.

#### `util_screenshotCreator_framingManager.setSelected(modeId)`

Sélectionne le mode de cadrage par son id. Alias : set, setSelectedModeId.

- `modeId` (*string*) : Id d'un mode enregistré.
- **renvoie** : boolean true si le mode a été sélectionné.
- **renvoie** : string|nil « Unknown framing mode: … » en cas d'échec.

#### `util_screenshotCreator_framingManager.setSelectedModeId(modeId)`

Alias de setSelected.

- `modeId` (*string*) : Id du mode.
- **renvoie** : boolean Succès.
- **renvoie** : string|nil Erreur.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onScreenshotCreatorCollectFramingModes` — écouté par 4 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/framingManager.lua`.*
