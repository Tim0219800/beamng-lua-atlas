# `editor_audioEventsList`

*Fichier : `lua/ge/extensions/editor/audioEventsList.lua` · VM : Game Engine (GE) · 284 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_audioEventsList` : `extensions.load("editor_audioEventsList")`, puis la globale `editor_audioEventsList`

**Dépendances (chargées avant) :** `editor_main`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_audioEventsList.onEditorInitialized()` | *(hook)* | 273 |
| `editor_audioEventsList.onEditorToolWindowHide(windowName)` | *(hook)* | 263 |
| `editor_audioEventsList.onEditorToolWindowShow(windowName)` | *(hook)* | 257 |
| `editor_audioEventsList.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 214 |
| `editor_audioEventsList.onWindowMenuItem()` | *(hook)* | 269 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `Sim.` `getSFXTrackSet`, `upcast`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/audioEventsList.lua`.*
