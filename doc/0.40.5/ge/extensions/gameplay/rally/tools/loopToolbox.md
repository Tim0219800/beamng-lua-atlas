# `gameplay_rally_tools_loopToolbox`

*Fichier : `lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua` · VM : Game Engine (GE) · 1129 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/tools/loopToolbox")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_rally_tools_loopToolbox")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:applyManagerDrawFlags(manager)` |  | 102 |
| `C:draw(manager)` |  | 384 |
| `C:drawDebug()` |  | 1076 |
| `C:drawSignboardsDebug()` |  | 1081 |
| `C:drawValidation(manager)` |  | 356 |
| `C:findSignboards()` |  | 150 |
| `C:formatDuration(seconds, showSubseconds)` |  | 332 |
| `C:getSelectedMissionId()` |  | 139 |
| `C:init()` |  | 21 |
| `C:loadSettings()` |  | 62 |
| `C:refreshMissionList()` |  | 108 |
| `C:saveSettings()` |  | 48 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onGameplayInteract` — écouté par 2 module(s)

## Appels vers le moteur (C++)

- `Sim.` `upcast`
- `debugDrawer:` `drawTextAdvanced`
- `obj:` `at`, `getClassName`, `getCount`, `getDynamicFields`, `getField`, `getID`, `getName`, `getObject`, `getPosition`, `getTransform`, `size`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua`.*
