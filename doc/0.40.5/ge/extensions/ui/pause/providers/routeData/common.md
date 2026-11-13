# `ui_pause_providers_routeData_common`

*Fichier : `lua/ge/extensions/ui/pause/providers/routeData/common.lua` · VM : Game Engine (GE) · 90 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_pause_providers_routeData_common` : `extensions.load("ui_pause_providers_routeData_common")`, puis la globale `ui_pause_providers_routeData_common`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_pause_providers_routeData_common.asRailGroup(id, actions)` | Skip empty action lists so JSON encodes rail actions as arrays, not objects. | 81 |
| `ui_pause_providers_routeData_common.bool(value)` |  | 7 |
| `ui_pause_providers_routeData_common.registerPauseButton(button)` |  | 21 |
| `ui_pause_providers_routeData_common.runExit(exitFn, payload)` |  | 72 |
| `ui_pause_providers_routeData_common.tryPushStateSequence(states)` |  | 11 |
| `ui_pause_providers_routeData_common.withExitConfirm(button, context, texts)` | In career the text warns about unsaved progress; the UI fills {{time}} from confirmSince when the popup opens.<br> Without any save, "Save and exit" is offered only while saving is allowed (the onboarding tutorial blocks it). | 49 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `ExitGameTexts` | table |  |
| `ExitLevelTexts` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/pause/providers/routeData/common.lua`.*
