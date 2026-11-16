# `editor_vehicleEditor_staticEditor_vePartTree`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartTree.lua` · VM : Game Engine (GE) · 680 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_staticEditor_vePartTree` : `extensions.load("editor_vehicleEditor_staticEditor_vePartTree")`, puis la globale `editor_vehicleEditor_staticEditor_vePartTree`

Fenêtre « Part Tree » du Static Editor. Elle lit le fichier JBeam de la partie sélectionnée, le parse en AST (json-ast, avec les données Lua dans ast.transient.luaData / luaDataRaw) et l'affiche en arbre (clé, valeur, éléments). Pour chaque table, on peut la sélectionner (met en surbrillance les nœuds AST correspondants dans Part Text View), la masquer, ou l'envoyer dans Part Properties. Elle dessine aussi les nodes et beams de la partie dans la vue de rendu statique (debugDrawer) et permet de les picker à la souris (Maj pour multi-sélection) ; les nœuds référencés mais définis dans d'autres parties sont retrouvés et dessinés en bleu transparent (« virtuels »). Un bouton « Spawn » ré-instancie le véhicule avec la partie sélectionnée comme partie principale.

## Exemple

```lua
extensions.load('editor_vehicleEditor_staticEditor_vePartTree')
editor_vehicleEditor_staticEditor_vePartTree.open()
```

## Remarques

- Écrit dans l'état partagé vEditor : ast, astFilename, selectedASTNodeMap, scrollToNode, selectedBeams, propertyTableEditTarget ; lit vEditor.selectedPart, vehicle, vehData.ioCtx.
- Les champs internes __astNodeIdx, __selected, __hidden, __schemaProcessed, maxIDs et validTables sont écrits dans les tables de données et masqués dans l'affichage.
- Rayons de dessin : nodes 0,02 m (survol 0,04, sélection 0,03, collision 0,035) ; beams 0,0025 m (survol 0,01, collision 0,01).
- getNodefromAllParts parcourt toutes les parties disponibles en les copiant et en appliquant jbeam/tableSchema ; les nodes introuvables sont mémorisés dans brokenNodes pour ne pas répéter l'avertissement.
- Le bouton « Spawn » modifie playerVehicle.config.mainPartName, sérialise la config dans veh.partConfig et respawn l'objet (spawnObjectWithPosRot) à la position initiale du nœud de référence.
- Le bouton « Sync with AST » existe mais son corps est vide dans le code.
- Bug : le menu contextuel 'part_tree_ctx_menu' lit rightClickedPart qui n'est pas défini dans ce fichier (variable globale nil) ; ce menu n'est jamais ouvert dans ce fichier et provoquerait une erreur s'il l'était.
- Le fichier est relu quand le nom du fichier de la partie change ou que vEditor.ast est nil (par exemple après « Reload » de Part Text View).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_staticEditor_vePartTree.onEditorGui()` | Hook de l'éditeur appelé à chaque frame : charge l'AST de la partie sélectionnée, dessine l'arbre et appelle le rendu/picking des nodes et beams dans la vue statique. Sans effet sans véhicule, vehData ou partie sélectionnée. *(interne)* *(hook)* | 560 |
| `editor_vehicleEditor_staticEditor_vePartTree.onEditorInitialized()` | Hook de l'éditeur appelé à l'initialisation : enregistre la fenêtre (500x400, outil vehicleEditor). *(interne)* *(hook)* | 662 |
| `editor_vehicleEditor_staticEditor_vePartTree.onFileChanged(filename, type)` | Hook d'extension appelé quand un fichier surveillé change sur le disque. Si c'est le fichier JBeam actuellement chargé, invalide l'AST (ast = nil, vEditor.ast = nil) pour le relire au prochain frame. *(interne)* *(hook)* | 666 |
| `editor_vehicleEditor_staticEditor_vePartTree.open()` | Affiche la fenêtre « Part Tree » (editor.showWindow). | 658 |

### Détail des paramètres

#### `editor_vehicleEditor_staticEditor_vePartTree.onFileChanged(filename, type)`

Hook d'extension appelé quand un fichier surveillé change sur le disque. Si c'est le fichier JBeam actuellement chargé, invalide l'AST (ast = nil, vEditor.ast = nil) pour le relire au prochain frame.

- `filename` (*string*) : chemin du fichier modifié
- `type` (*string*) : type de changement (non utilisé)

## Champs

| Champ | Type | Description |
|---|---|---|
| `menuEntry` | string | Texte de l'entrée du menu Apps : « Part Tree ». |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawCylinder`, `drawLine`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartTree.lua`.*
