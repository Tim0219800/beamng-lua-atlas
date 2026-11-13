# `ui_messagesDebugger`

*Fichier : `lua/ge/extensions/ui/messagesDebugger.lua` · VM : Game Engine (GE) · 112 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_messagesDebugger` : `extensions.load("ui_messagesDebugger")`, puis la globale `ui_messagesDebugger`

**Dépendances (chargées avant) :** `ui_imgui`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_messagesDebugger.hide()` |  | 38 |
| `ui_messagesDebugger.onUpdate(dtReal, dtSim, dtRaw)` | Draw the debug window *(hook)* | 42 |
| `ui_messagesDebugger.show()` | Public helpers (console) | 37 |
| `ui_messagesDebugger.toggle()` |  | 39 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

**Évènements UI (guihooks.trigger) :** `ClearAllMessages`, `Message`, `MessagesDebug`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/messagesDebugger.lua`.*
