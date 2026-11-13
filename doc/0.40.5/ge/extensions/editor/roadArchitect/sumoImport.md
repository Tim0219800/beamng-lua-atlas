# `editor_roadArchitect_sumoImport`

*Fichier : `lua/ge/extensions/editor/roadArchitect/sumoImport.lua` · VM : Game Engine (GE) · 12 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_sumoImport` : `extensions.load("editor_roadArchitect_sumoImport")`, puis la globale `editor_roadArchitect_sumoImport`

Petit module d'aiguillage pour l'import SUMO (fichiers .nod.xml / .edg.xml) dans le Road Architect. Il ne contient pas de logique : il réexporte la fonction networkImport.importSumoFromFile sous deux noms. La fenêtre Road Network Import/Exporter l'appelle via require('editor/roadArchitect/sumoImport').importFromFile(filePath, options).

## Remarques

- importFromFile et importFromPrefix pointent vers la même fonction (networkImport.importSumoFromFile) ; importFromPrefix n'a donc pas de comportement propre.
- Le module est chargé avec require() par roadNetworkExporter, pas comme extension.

## Champs

| Champ | Type | Description |
|---|---|---|
| `importFromFile` | function | Alias de networkImport.importSumoFromFile : importe un réseau SUMO depuis un fichier (signature réelle dans editor/roadArchitect/networkImport ; roadNetworkExporter l'appelle avec (filePath, options)). |
| `importFromPrefix` | function | Alias identique de importFromFile. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/sumoImport.lua`.*
