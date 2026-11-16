# `core_cameraControllerRegistry`

*Fichier : `lua/ge/extensions/core/cameraControllerRegistry.lua` · VM : Game Engine (GE) · 98 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_cameraControllerRegistry` : `extensions.load("core_cameraControllerRegistry")`, puis la globale `core_cameraControllerRegistry`

Couche de routage facultative placée devant le chemin d'entrée caméra. Des 'contrôleurs' enregistrés (par id, avec priorité) peuvent consommer certaines entrées (ex. onRelativeInput, onEditorMouseWheel) quand ils sont actifs ; ce qui n'est pas consommé continue vers la caméra active comme avant. Se charge avec require('core/cameraControllerRegistry') (ce n'est pas une extension). Utilisé par core/cameraInput.lua. Un moddeur l'utilise pour intercepter la souris/molette (ex. outil d'édition de caméra) sans casser les caméras normales.

## Exemple

```lua
local reg = require('core/cameraControllerRegistry')
reg.register('monOutil', {
  onRelativeInput = function(axis, val, player) return false end, -- true = consommé
}, 10)
if reg.acquire('monOutil') then --[[ capture exclusive ]] end
reg.release('monOutil')
```

## Remarques

- Un contrôleur est une table dont les clés sont des noms de méthodes (ex. onRelativeInput, onEditorMouseWheel) ; une méthode consomme l'évènement en renvoyant exactement true.
- Ordre d'appel : priorité décroissante, puis id alphabétique. Si un contrôleur a 'capturé' (acquire), seul celui-ci reçoit les évènements.
- acquire n'est autorisé que si aucun autre n'a capturé et si l'appelant est le contrôleur en cours de dispatch, ou le premier de l'ordre (priorité la plus haute) : on ne peut donc capturer que depuis son propre callback ou en étant en tête.
- unregister libère automatiquement la capture si ce contrôleur la détenait.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_cameraControllerRegistry.acquire(id)` | Prend la capture exclusive des entrées pour ce contrôleur (voir notes pour les conditions). | 70 |
| `core_cameraControllerRegistry.dispatch(method, ...)` | Envoie un évènement aux contrôleurs : au propriétaire de la capture seul s'il y en a un, sinon à tous dans l'ordre jusqu'à ce que l'un renvoie true. | 51 |
| `core_cameraControllerRegistry.isOwner(id)` | Teste si ce contrôleur détient la capture. | 88 |
| `core_cameraControllerRegistry.isRegistered(id, controller)` | Teste si l'id est enregistré (et, si controller est donné, qu'il s'agit de ce contrôleur). | 92 |
| `core_cameraControllerRegistry.register(id, controller, priority)` | Enregistre un contrôleur. Échoue (false) si l'id n'est pas une chaîne non vide, si controller n'est pas une table ou si l'id existe déjà. | 31 |
| `core_cameraControllerRegistry.release(id)` | Relâche la capture si ce contrôleur la détient. | 82 |
| `core_cameraControllerRegistry.unregister(id, controller)` | Retire un contrôleur. Si controller est donné, il doit correspondre à celui enregistré. Libère la capture si besoin. | 42 |

### Détail des paramètres

#### `core_cameraControllerRegistry.acquire(id)`

Prend la capture exclusive des entrées pour ce contrôleur (voir notes pour les conditions).

- `id` (*string*) : Identifiant d'un contrôleur enregistré
- **renvoie** : boolean true si la capture est (ou était déjà) à ce contrôleur

#### `core_cameraControllerRegistry.dispatch(method, ...)`

Envoie un évènement aux contrôleurs : au propriétaire de la capture seul s'il y en a un, sinon à tous dans l'ordre jusqu'à ce que l'un renvoie true.

- `method` (*string*) : Nom de la méthode à appeler sur les contrôleurs
- `...` (*any*) : Arguments passés à la méthode
- **renvoie** : boolean true si un contrôleur a consommé l'évènement

#### `core_cameraControllerRegistry.isOwner(id)`

Teste si ce contrôleur détient la capture.

- `id` (*string*) : Identifiant
- **renvoie** : boolean true si propriétaire

#### `core_cameraControllerRegistry.isRegistered(id, controller)`

Teste si l'id est enregistré (et, si controller est donné, qu'il s'agit de ce contrôleur).

- `id` (*string*) : Identifiant
- `controller` (*table|nil*) : Contrôleur attendu
- **renvoie** : boolean true si enregistré

#### `core_cameraControllerRegistry.register(id, controller, priority)`

Enregistre un contrôleur. Échoue (false) si l'id n'est pas une chaîne non vide, si controller n'est pas une table ou si l'id existe déjà.

- `id` (*string*) : Identifiant unique
- `controller` (*table*) : Table de callbacks nommés
- `priority` (*number|nil*) : Priorité (plus grand = appelé en premier), 0 par défaut
- **renvoie** : boolean true si enregistré

#### `core_cameraControllerRegistry.release(id)`

Relâche la capture si ce contrôleur la détient.

- `id` (*string*) : Identifiant
- **renvoie** : boolean true si relâchée

#### `core_cameraControllerRegistry.unregister(id, controller)`

Retire un contrôleur. Si controller est donné, il doit correspondre à celui enregistré. Libère la capture si besoin.

- `id` (*string*) : Identifiant
- `controller` (*table|nil*) : Contrôleur attendu (vérification facultative)
- **renvoie** : boolean true si retiré

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraControllerRegistry.lua`.*
