# `editor_roadRiverCacheHandler`

*Fichier : `lua/ge/extensions/editor/roadRiverCacheHandler.lua` · VM : Game Engine (GE) · 26 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadRiverCacheHandler` : `extensions.load("editor_roadRiverCacheHandler")`, puis la globale `editor_roadRiverCacheHandler`

Petit gestionnaire de l'éditeur qui maintient le cache des sommets des DecalRoad : il l'initialise pour tous les DecalRoad du niveau au démarrage de l'éditeur, et le met à jour quand un prefab est « explosé » (déballé) dans la scène. Aucune fonction n'est destinée à être appelée par un moddeur.

## Remarques

- Appelle editor.initializeLevelRoadsVertices() et editor.updateRoadVertices(object), fonctions fournies par l'éditeur (C++/Lua).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadRiverCacheHandler.onEditorInitialized()` | Hook appelé à l'initialisation de l'éditeur : initialise les sommets de toutes les routes du niveau (editor.initializeLevelRoadsVertices). *(interne)* *(hook)* | 18 |
| `editor_roadRiverCacheHandler.onEditorPrefabExploded(groups)` | Hook appelé quand un ou plusieurs prefabs sont explosés dans l'éditeur. Pour chaque objet de chaque groupe, si c'est un DecalRoad, recalcule ses sommets avec editor.updateRoadVertices. *(interne)* *(hook)* | 7 |

### Détail des paramètres

#### `editor_roadRiverCacheHandler.onEditorPrefabExploded(groups)`

Hook appelé quand un ou plusieurs prefabs sont explosés dans l'éditeur. Pour chaque objet de chaque groupe, si c'est un DecalRoad, recalcule ses sommets avec editor.updateRoadVertices.

- `groups` (*table*) : Liste de groupes (SimGroup) issus du prefab ; chaque groupe expose getObjects() (déduit du code).

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadRiverCacheHandler.lua`.*
