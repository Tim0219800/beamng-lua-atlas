# `editor_roadArchitect_importFile`

*Fichier : `lua/ge/extensions/editor/roadArchitect/importFile.lua` · VM : Game Engine (GE) · 136 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_importFile` : `extensions.load("editor_roadArchitect_importFile")`, puis la globale `editor_roadArchitect_importFile`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_importFile.ensureEditorHistory()` | Sync World Editor APIs needed for import/finalize without opening the UI.<br> setEditorActive is deferred across splash frames, so it cannot satisfy a<br> same-request BeamNGpy import. initializeModules creates history; preferences<br> attach during full activate via loadPreferences — ensurePreferencesApi covers<br> the headless case (roadRiver.getPreference during DecalRoad finalize). | 84 |
| `editor_roadArchitect_importFile.maybeFinalise(options)` | Lays DecalRoads / meshes, reloads collision, and rebuilds the navgraph.<br> Same work as Road Architect's Render/finalise toggle, without opening the UI.<br> options.finalize must be true (tech/BeamNGpy default); editor UI imports omit it. | 114 |
| `editor_roadArchitect_importFile.readTextFile(filePath)` |  | 16 |
| `editor_roadArchitect_importFile.stageText(filePath, fileContent)` |  | 60 |

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `native2Virtual`
- `scenetree.` `findObject`

**Charge les extensions :** `editor_main`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/importFile.lua`.*
