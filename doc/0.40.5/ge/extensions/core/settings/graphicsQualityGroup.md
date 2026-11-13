# `core_settings_graphicsQualityGroup`

*Fichier : `lua/ge/extensions/core/settings/graphicsQualityGroup.lua` · VM : Game Engine (GE) · 58 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/settings/graphicsQualityGroup")` (fichier sous extensions/ mais pas une extension classique)

Classe de base d'un groupe de qualité graphique. Elle charge un module de préréglages (par ex. meshQuality, terrainQuality), garde le niveau courant et applique un niveau en écrivant chaque clé dans VariableRegistry ; si une valeur a changé, elle appelle le hook onApply du module. Utilisée par graphic.lua, pas par les extensions classiques.

## Exemple

```lua
local group = require("extensions/core/settings/graphicsQualityGroup")("core_settings_meshQuality", "mesh")
group:applyLevel("High")
```

## Remarques

- Le module renvoie une fonction fabrique (qualityLevelsFilename, groupName, options) et non une table d'extension.
- La page auto indique init(groupName) mais le code réel est init(qualitiyLevelsFilename, groupName).
- applyLevel avec un niveau inconnu applique une table vide (aucun changement) mais mémorise tout de même le nom comme niveau courant.
- getCurrentLevel ignore son paramètre levelString et renvoie la table du niveau courant (nil si inconnu).

## Classe `C`

Groupe de qualité. Champs d'instance : currentQualityLevel (string, "" au départ), qualityLevels (copie de group.qualityLevels), name (string, 'unnamed_quality_group' par défaut), onApply (fonction du module, nop sinon).

Le module renvoie un constructeur : `local obj = require("core_settings_graphicsQualityGroup")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:apply(qualityLevel)` | Pour chaque paire clé/valeur du préréglage, lit VariableRegistry.get(clé), compare par tostring, puis VariableRegistry.set(clé, valeur). Si au moins une valeur a changé, appelle self:onApply(). | 36 |
| `C:applyLevel(levelString)` | Applique le niveau nommé (via apply) puis le mémorise comme niveau courant. Ne fait rien si levelString est nil. | 20 |
| `C:getCurrentLevel(levelString)` | Renvoie la table de préréglage du niveau courant. | 28 |
| `C:getCurrentLevelId()` | Renvoie le nom du niveau courant. | 32 |
| `C:init(qualitiyLevelsFilename, groupName)` | Constructeur appelé par la fabrique : require(qualityLevelsFilename) puis copie qualityLevels et récupère onApply. Sans nom de fichier, le groupe est vide. | 7 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/settings/graphicsQualityGroup.lua`.*
