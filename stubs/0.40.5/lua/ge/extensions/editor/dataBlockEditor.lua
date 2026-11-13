---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dataBlockEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Éditeur de DataBlocks (SimDataBlock) du World Editor, accessible par le menu Assets > « DataBlock Editor ». Fenêtre à deux onglets : « Existing » (arbre des datablocks regroupés par classe, avec une * pour les datablocks modifiés, boutons Enregistrer et Supprimer) et « New » (choix d'une classe puis fenêtre « Create new DataBlock » avec nom et copie optionnelle des valeurs d'un datablock existant). L'édition des champs se fait dans l'inspecteur standard ; l'extension marque le datablock comme modifié quand un champ change. Ajoute aussi editor.openDatablockEditor(dataBlockId, previousInspectorObjectId) pour ouvrir l'éditeur depuis un autre outil.
--- Accès : extension `editor_dataBlockEditor` : `extensions.load("editor_dataBlockEditor")`, puis la globale `editor_dataBlockEditor`
---@class editor_dataBlockEditor
editor_dataBlockEditor = {}

--- Hook appelé à chaque frame de l'éditeur : dessine la fenêtre DataBlock Editor, la fenêtre de création et la confirmation de suppression si la fenêtre est visible.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dataBlockEditor.lua:138
function editor_dataBlockEditor.onEditorGui() end

--- Hook appelé à l'initialisation du World Editor : ajoute l'entrée de menu (groupe Assets), enregistre les fenêtres « dataBlockEditor » et « createDataBlock », charge la liste des classes et définit editor.openDatablockEditor.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dataBlockEditor.lua:114
function editor_dataBlockEditor.onEditorInitialized() end

--- Hook appelé quand un champ est modifié dans l'inspecteur ; si le premier objet sélectionné est un datablock, le marque comme modifié (editor.setDataBlockDirty).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dataBlockEditor.lua:285
---@param selectedIds integer[] ids des objets sélectionnés
---@param fieldName string champ modifié
---@param fieldValue any nouvelle valeur
---@param arrayIndex integer index dans le champ tableau
function editor_dataBlockEditor.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex) end

--- Hook appelé pour dessiner l'en-tête de l'inspecteur ; si un datablock est sélectionné après un appel à openDatablockEditor, affiche le bouton « << Back To Previously Selected Object » qui rétablit la sélection précédente.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dataBlockEditor.lua:101
---@param inspectorInfo table infos de l'inspecteur (inutilisé)
function editor_dataBlockEditor.onEditorInspectorHeaderGui(inspectorInfo) end

--- Hook appelé quand la sélection d'objets change ; oublie l'objet précédemment sélectionné pour le bouton « Back ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dataBlockEditor.lua:292
function editor_dataBlockEditor.onEditorObjectSelectionChanged() end

--- Hook appelé au chargement de l'extension ; écrit « initialized » dans le journal.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dataBlockEditor.lua:123
function editor_dataBlockEditor.onExtensionLoaded() end

