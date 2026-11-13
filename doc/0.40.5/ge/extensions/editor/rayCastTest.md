# `editor_rayCastTest`

*Fichier : `lua/ge/extensions/editor/rayCastTest.lua` · VM : Game Engine (GE) · 157 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_rayCastTest` : `extensions.load("editor_rayCastTest")`, puis la globale `editor_rayCastTest`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_rayCastTest.onEditorGui()` | *(hook)* | 32 |
| `editor_rayCastTest.onEditorInitialized()` | *(hook)* | 133 |
| `editor_rayCastTest.onEditorRegisterPreferences(prefsRegistry)` | *(hook)* | 123 |
| `editor_rayCastTest.onEditorToolWindowHide(wndName)` | *(hook)* | 145 |
| `editor_rayCastTest.onExtensionLoaded()` | *(hook)* | 47 |

## Appels vers le moteur (C++)

- `Engine.` `castRay`
- `debugDrawer:` `drawLine`, `drawSphere`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rayCastTest.lua`.*
