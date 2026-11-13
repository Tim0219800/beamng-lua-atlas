# `util_windDebug`

*Fichier : `lua/ge/extensions/util/windDebug.lua` · VM : Game Engine (GE) · 70 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_windDebug` : `extensions.load("util_windDebug")`, puis la globale `util_windDebug`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_windDebug.onPreRender(dtReal, dtSim)` | *(hook)* | 43 |
| `util_windDebug.setEnabled(v)` |  | 66 |
| `util_windDebug.toggle()` |  | 67 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `enabled` | boolean |  |

## Appels vers le moteur (C++)

- `be:` `getWindAt`
- `debugDrawer:` `drawLineInstance`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/windDebug.lua`.*
