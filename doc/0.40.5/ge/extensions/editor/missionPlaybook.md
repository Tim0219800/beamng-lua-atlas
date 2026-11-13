# `editor_missionPlaybook`

*Fichier : `lua/ge/extensions/editor/missionPlaybook.lua` · VM : Game Engine (GE) · 471 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_missionPlaybook` : `extensions.load("editor_missionPlaybook")`, puis la globale `editor_missionPlaybook`

**Dépendances (chargées avant) :** `gameplay_missions_missions`, `editor_missionPlaybook_attributeViewer`, `editor_missionPlaybook_unlockedMissionsViewer`, `editor_missionPlaybook_missionTreeViewer`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_missionPlaybook.drawBookViewer()` |  | 430 |
| `editor_missionPlaybook.onDeserialized(data)` | *(hook)* | 454 |
| `editor_missionPlaybook.onEditorGui()` | display window *(hook)* | 251 |
| `editor_missionPlaybook.onEditorInitialized()` | *(hook)* | 408 |
| `editor_missionPlaybook.onEditorRegisterPreferences(prefsRegistry)` | *(hook)* | 415 |
| `editor_missionPlaybook.onSerialize()` | *(hook)* | 446 |
| `editor_missionPlaybook.show()` |  | 403 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `book` | any |  |
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onPlaybookLogAfterStep` — écouté par 3 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/missionPlaybook.lua`.*
