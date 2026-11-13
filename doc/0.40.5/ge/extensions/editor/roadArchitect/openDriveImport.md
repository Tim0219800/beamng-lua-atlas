# `editor_roadArchitect_openDriveImport`

*Fichier : `lua/ge/extensions/editor/roadArchitect/openDriveImport.lua` · VM : Game Engine (GE) · 937 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_openDriveImport` : `extensions.load("editor_roadArchitect_openDriveImport")`, puis la globale `editor_roadArchitect_openDriveImport`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_openDriveImport.import(options)` | Opens the existing file picker and forwards the selected path to the headless importer. | 919 |
| `editor_roadArchitect_openDriveImport.importFromFile(filePath, options, fileContent)` | Imports an .xodr file from disk (or inline fileContent from the tech bridge). | 652 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicle`, `reloadCollision`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/openDriveImport.lua`.*
