# `editor_dataBlockEditor`

*Fichier : `lua/ge/extensions/editor/dataBlockEditor.lua` · VM : Game Engine (GE) · 303 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dataBlockEditor` : `extensions.load("editor_dataBlockEditor")`, puis la globale `editor_dataBlockEditor`

Éditeur de DataBlocks (SimDataBlock) du World Editor, accessible par le menu Assets > « DataBlock Editor ». Fenêtre à deux onglets : « Existing » (arbre des datablocks regroupés par classe, avec une * pour les datablocks modifiés, boutons Enregistrer et Supprimer) et « New » (choix d'une classe puis fenêtre « Create new DataBlock » avec nom et copie optionnelle des valeurs d'un datablock existant). L'édition des champs se fait dans l'inspecteur standard ; l'extension marque le datablock comme modifié quand un champ change. Ajoute aussi editor.openDatablockEditor(dataBlockId, previousInspectorObjectId) pour ouvrir l'éditeur depuis un autre outil.

## Remarques

- Création, suppression et enregistrement passent par editor.history (annulation possible) et les fonctions editor.createDataBlock, removeDataBlockFromFile, saveDataBlockToFile, saveDirtyDataBlock.
- Après suppression, une fenêtre indique que le datablock est retiré de son fichier et cessera d'exister au redémarrage.
- La liste des classes est reconstruite à l'initialisation puis quand la taille de Sim.getDataBlockSet() change et que la fenêtre est visible.
- Les noms de classe sont extraits de enumerateConsoleClasses("SimDataBlock") avec le motif %a+ : un nom contenant un chiffre ou un tiret bas serait tronqué (déduit du code).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dataBlockEditor.onEditorGui()` | Hook appelé à chaque frame de l'éditeur : dessine la fenêtre DataBlock Editor, la fenêtre de création et la confirmation de suppression si la fenêtre est visible. *(interne)* *(hook)* | 138 |
| `editor_dataBlockEditor.onEditorInitialized()` | Hook appelé à l'initialisation du World Editor : ajoute l'entrée de menu (groupe Assets), enregistre les fenêtres « dataBlockEditor » et « createDataBlock », charge la liste des classes et définit editor.openDatablockEditor. *(interne)* *(hook)* | 114 |
| `editor_dataBlockEditor.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)` | Hook appelé quand un champ est modifié dans l'inspecteur ; si le premier objet sélectionné est un datablock, le marque comme modifié (editor.setDataBlockDirty). *(interne)* *(hook)* | 285 |
| `editor_dataBlockEditor.onEditorInspectorHeaderGui(inspectorInfo)` | Hook appelé pour dessiner l'en-tête de l'inspecteur ; si un datablock est sélectionné après un appel à openDatablockEditor, affiche le bouton « << Back To Previously Selected Object » qui rétablit la sélection précédente. *(interne)* *(hook)* | 101 |
| `editor_dataBlockEditor.onEditorObjectSelectionChanged()` | Hook appelé quand la sélection d'objets change ; oublie l'objet précédemment sélectionné pour le bouton « Back ». *(interne)* *(hook)* | 292 |
| `editor_dataBlockEditor.onExtensionLoaded()` | Hook appelé au chargement de l'extension ; écrit « initialized » dans le journal. *(interne)* *(hook)* | 123 |

### Détail des paramètres

#### `editor_dataBlockEditor.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)`

Hook appelé quand un champ est modifié dans l'inspecteur ; si le premier objet sélectionné est un datablock, le marque comme modifié (editor.setDataBlockDirty).

- `selectedIds` (*integer[]*) : ids des objets sélectionnés
- `fieldName` (*string*) : champ modifié
- `fieldValue` (*any*) : nouvelle valeur
- `arrayIndex` (*integer*) : index dans le champ tableau

#### `editor_dataBlockEditor.onEditorInspectorHeaderGui(inspectorInfo)`

Hook appelé pour dessiner l'en-tête de l'inspecteur ; si un datablock est sélectionné après un appel à openDatablockEditor, affiche le bouton « << Back To Previously Selected Object » qui rétablit la sélection précédente.

- `inspectorInfo` (*table*) : infos de l'inspecteur (inutilisé)

## Appels vers le moteur (C++)

- `Sim.` `getDataBlockSet`
- `obj:` `isSubClassOf`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dataBlockEditor.lua`.*
