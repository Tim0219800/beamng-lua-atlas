# `ui_extApp`

*Fichier : `lua/ge/extensions/ui/extApp.lua` · VM : Game Engine (GE) · 72 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_extApp` : `extensions.load("ui_extApp")`, puis la globale `ui_extApp`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_extApp.onExtensionLoaded()` | check if we need to enable/disable ourself *(hook)* | 26 |
| `ui_extApp.onExtensionUnloaded()` | *(hook)* | 32 |
| `ui_extApp.onUpdate()` | *(hook)* | 45 |
| `ui_extApp.requestUIData()` |  | 21 |

**Évènements UI (guihooks.trigger) :** `externalUIURL`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/extApp.lua`.*
