# `core_forest`

*Fichier : `lua/ge/extensions/core/forest.lua` · VM : Game Engine (GE) · 25 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_forest` : `extensions.load("core_forest")`, puis la globale `core_forest`

Extension GE `core_forest` : fournit un accès mis en cache à l'objet `Forest` de la scène (la forêt/végétation instanciée du niveau). Un moddeur l'utilise pour obtenir cet objet sans refaire une recherche dans la scène.

## Exemple

```lua
local forest = core_forest.getForestObject()
if forest then print(forest:getId()) end
```

## Remarques

- L'id du premier objet de classe Forest trouvé est mémorisé dans forestId ; si l'objet est supprimé, une nouvelle recherche est faite au prochain appel. Seul le premier Forest de la scène est utilisé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_forest.getForestObject()` | Renvoie l'objet Forest de la scène (premier de classe 'Forest'), avec cache de son id. | 9 |

### Détail des paramètres

#### `core_forest.getForestObject()`

Renvoie l'objet Forest de la scène (premier de classe 'Forest'), avec cache de son id.

- **renvoie** : userdata|nil Objet Forest, nil s'il n'y en a pas dans le niveau.

## Appels vers le moteur (C++)

- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/forest.lua`.*
