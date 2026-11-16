# `editor_bulkRename`

*Fichier : `lua/ge/extensions/editor/bulkRename.lua` · VM : Game Engine (GE) · 269 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_bulkRename` : `extensions.load("editor_bulkRename")`, puis la globale `editor_bulkRename`

Fenêtre « Bulk Rename » (menu Assets) de l'éditeur de niveaux : renomme en lot les objets de la scène. On choisit le champ à renommer (name ou internalName), l'ensemble d'objets (sélection courante, ou objets dont le nom correspond à un motif avec * et ?), et un motif de renommage où %n insère un compteur (%4n = 4 chiffres avec zéros), et %o l'ancien nom. Un tableau d'aperçu montre ancien nom, nouveau nom, ID et ID de collision ; le renommage passe par objectHistoryActions.changeObjectFieldMultipleValuesWithUndo (annulable).

## Exemple

```lua
-- motif de renommage : "barrier_%3n" -> barrier_001, barrier_002, ...
```

## Remarques

- Les collisions de noms sont détectées seulement pour le champ name (l'internalName peut être en double) ; le bouton RENAME n'est pas bloqué en cas de collision.
- Le motif de recherche est pris dans le filtre ImGui et passé à Sim.findObjectsByNameMask.
- Après renommage, editor_sceneTree.recacheAllNodes() est appelé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_bulkRename.onEditorActivated()` | Hook appelé à l'activation de l'éditeur ; fonction vide. *(interne)* *(hook)* | 245 |
| `editor_bulkRename.onEditorGui()` | Appelé chaque frame de l'éditeur : dessine la fenêtre Bulk Rename (options, motifs, bouton RENAME, tableau d'aperçu). *(interne)* *(hook)* | 139 |
| `editor_bulkRename.onEditorInitialized()` | Enregistre la fenêtre « bulkRename » (600x600) et l'entrée de menu « Bulk Rename » (groupe Assets). *(interne)* *(hook)* | 256 |
| `editor_bulkRename.onEditorObjectSelectionChanged()` | Hook appelé quand la sélection d'objets de l'éditeur change ; recalcule l'aperçu des noms. *(interne)* *(hook)* | 248 |
| `editor_bulkRename.onExtensionLoaded()` | Hook appelé au chargement de l'extension ; fonction vide. *(interne)* *(hook)* | 261 |

## Appels vers le moteur (C++)

- `Sim.` `findObjectsByNameMask`
- `obj:` `getGeneratedDisplayName`, `getID`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/bulkRename.lua`.*
