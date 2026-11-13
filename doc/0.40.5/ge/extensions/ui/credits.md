# `ui_credits`

*Fichier : `lua/ge/extensions/ui/credits.lua` · VM : Game Engine (GE) · 163 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_credits` : `extensions.load("ui_credits")`, puis la globale `ui_credits`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_credits.onExtensionLoaded()` | *(hook)* | 123 |
| `ui_credits.onExtensionUnloaded()` | *(hook)* | 127 |
| `ui_credits.onUpdate(dtReal)` | *(hook)* | 132 |
| `ui_credits.startWithFade(duration)` |  | 85 |
| `ui_credits.stopWithFade(duration, onStopped)` |  | 105 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/credits.lua`.*
