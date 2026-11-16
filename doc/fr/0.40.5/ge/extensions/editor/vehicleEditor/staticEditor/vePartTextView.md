# `editor_vehicleEditor_staticEditor_vePartTextView`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartTextView.lua` · VM : Game Engine (GE) · 337 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_staticEditor_vePartTextView` : `extensions.load("editor_vehicleEditor_staticEditor_vePartTextView")`, puis la globale `editor_vehicleEditor_staticEditor_vePartTextView`

Fenêtre « Part Text View » du Static Editor. Elle affiche le fichier JBeam de la partie sélectionnée comme une suite de nœuds d'arbre syntaxique (AST, bibliothèque json-ast) colorés (chaînes, commentaires, listes, objets), avec numéros de ligne et défilement automatique vers les nœuds sélectionnés ailleurs dans l'éditeur. Un double-clic sur un nœud chaîne, nombre ou booléen l'édite (fenêtre modale « Edit Node »). Le menu propose Reload, Save, Close et Delete.

## Exemple

```lua
extensions.load('editor_vehicleEditor_staticEditor_vePartTextView')
editor_vehicleEditor_staticEditor_vePartTextView.open()
```

## Remarques

- Save écrit vEditor.astFilename avec jsonAST.stringify(vEditor.ast.ast) : le fichier JBeam source est réécrit directement sur le disque.
- Delete appelle FS:removeFile(jbeamFilename) : il supprime le fichier JBeam de la partie (sans confirmation).
- Bug : l'entrée Delete exécute « ast = nil » (variable globale) au lieu de vEditor.ast = nil ; l'AST affiché n'est donc pas invalidé.
- Bug : le cas bool de la fenêtre d'édition utilise la variable nodeEditBoolInput jamais définie ; en pratique _editNode inverse directement un booléen et ne rouvre pas la modale pour ce type.
- Le rendu utilise ImGuiListClipper pour ne dessiner que les lignes visibles ; au premier rendu (initTextView) toutes les lignes sont parcourues pour calculer la largeur maximale.
- La partie est lue avec jbeamIO.getPart(ioCtx, partName) sous pcall ; en cas d'échec la fenêtre reste vide.
- Données lues dans vEditor : ast.ast.nodes, ast.transient.linesIndexes, hierarchy, nodeIdxToLineNum, selectedASTNodeMap, scrollToNode, selectedPart, vehData.ioCtx.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_staticEditor_vePartTextView.onEditorGui()` | Hook de l'éditeur appelé à chaque frame : charge la partie sélectionnée, dessine la barre de menu, les infos du fichier (dates de création et de modification), le tableau de nœuds AST et la fenêtre modale d'édition. Sans effet sans véhicule ni partie sélectionnée. *(interne)* *(hook)* | 175 |
| `editor_vehicleEditor_staticEditor_vePartTextView.onEditorInitialized()` | Hook de l'éditeur appelé à l'initialisation : enregistre la fenêtre (500x400, outil vehicleEditor) et la fenêtre modale « editASTNode ». *(interne)* *(hook)* | 327 |
| `editor_vehicleEditor_staticEditor_vePartTextView.open()` | Affiche la fenêtre « Part Text View » (editor.showWindow). | 323 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `menuEntry` | string | Texte de l'entrée du menu Apps : « Part Text View ». |

## Appels vers le moteur (C++)

- `FS:` `removeFile`, `stat`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartTextView.lua`.*
