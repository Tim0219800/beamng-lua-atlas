# `ui_audio`

*Fichier : `lua/ge/extensions/ui/audio.lua` · VM : Game Engine (GE) · 150 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_audio` : `extensions.load("ui_audio")`, puis la globale `ui_audio`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_audio.cancelHoldActivateSound(instanceId)` |  | 140 |
| `ui_audio.completeHoldActivateSound(instanceId)` |  | 136 |
| `ui_audio.onFirstUpdate()` | *(hook)* | 10 |
| `ui_audio.playEventSound(className, eventName, instanceId)` |  | 119 |
| `ui_audio.startHoldActivateSound(instanceId)` |  | 132 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/audio.lua`.*
