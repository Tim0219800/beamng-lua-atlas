# `editor_roadArchitect_osmImport`

*Fichier : `lua/ge/extensions/editor/roadArchitect/osmImport.lua` · VM : Game Engine (GE) · 12 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_osmImport` : `extensions.load("editor_roadArchitect_osmImport")`, puis la globale `editor_roadArchitect_osmImport`

Petit module d'alias de Road Architect : il charge editor/roadArchitect/networkImport et réexporte sa fonction importOsmFromFile sous le nom importFromFile. Il sert de point d'entrée pour importer un fichier OpenStreetMap (.osm) dans l'éditeur Road Architect.

## Exemple

```lua
editor_roadArchitect_osmImport.importFromFile('C:/data/ville.osm', {placeMode = 3})
```

## Champs

| Champ | Type | Description |
|---|---|---|
| `importFromFile` | function | Alias de networkImport.importOsmFromFile(filePath, options) : importe un fichier .osm et renvoie un résumé { success, importedRoadCount, skippedRoadCount, warnings, … }. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/osmImport.lua`.*
