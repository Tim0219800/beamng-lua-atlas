# `editor_api_easeCurveUI`

*Fichier : `lua/ge/extensions/editor/api/easeCurveUI.lua` · VM : Game Engine (GE) · 203 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_easeCurveUI` : `extensions.load("editor_api_easeCurveUI")`, puis la globale `editor_api_easeCurveUI`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_easeCurveUI.draw(opts)` | opts:<br>   id          unique string id<br>   value       the EaseF value as the "dir type param0 param1" string<br>   setValue(valueString, editEnded) | 147 |

## Appels vers le moteur (C++)

- `worldEditorCppApi.` `getEaseCurveSamples`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/easeCurveUI.lua`.*
