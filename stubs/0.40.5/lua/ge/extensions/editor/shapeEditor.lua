---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/shapeEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Éditeur de formes (Shape Editor) de l'éditeur de monde : fenêtre qui prévisualise un modèle 3D (.dae et autres) via l'objet C++ ShapePreview, avec une caméra orbitale et plusieurs onglets (Details, Render, Nodes, Sequence, Material, Imposter, et LOD WIP si createMeshLOD existe). Il permet d'exporter en Collada ou Wavefront obj, de lire les nodes, séquences d'animation et matériaux, de gérer l'imposteur et de générer des LOD. Les réglages de constructeur de mesh sont stockés dans un fichier .cs à côté du modèle (préfixe '//JSON:'). Un moddeur l'utilise pour inspecter un TSStatic ou un asset.
--- Accès : extension `editor_shapeEditor` : `extensions.load("editor_shapeEditor")`, puis la globale `editor_shapeEditor`
---@class editor_shapeEditor
editor_shapeEditor = {}

--- Hook de restauration après rechargement Lua : recrée ShapePreview, recharge le modèle et le matériau de surbrillance.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/shapeEditor.lua:927
---@param data table Données renvoyées par onSerialize.
function editor_shapeEditor.onDeserialized(data) end

--- Hook appelé à la désactivation de l'éditeur : restaure le matériau de l'aperçu et supprime le matériau de surbrillance.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/shapeEditor.lua:962
function editor_shapeEditor.onEditorDeactivated() end

--- Hook appelé à la sortie du niveau : vide la forme de l'aperçu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/shapeEditor.lua:938
function editor_shapeEditor.onEditorExitLevel() end

--- Hook de dessin appelé chaque frame : dessine la fenêtre, le rendu 3D et les onglets.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/shapeEditor.lua:436
function editor_shapeEditor.onEditorGui() end

--- Hook d'initialisation de l'éditeur : crée ShapePreview, ajoute l'entrée de menu 'Shape Editor' (groupe Assets) et enregistre la fenêtre (800x600).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/shapeEditor.lua:67
function editor_shapeEditor.onEditorInitialized() end

--- Hook appelé pour dessiner l'en-tête de l'inspecteur : ajoute le bouton 'Open in Shape Editor' pour le premier objet sélectionné s'il est de classe TSStatic.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/shapeEditor.lua:899
---@param inspectorInfo table Infos de l'inspecteur ; sa clé selection.object contient les ids sélectionnés.
function editor_shapeEditor.onEditorInspectorHeaderGui(inspectorInfo) end

--- Hook appelé quand la sélection change : si la fenêtre est visible et la préférence autoOpenSelectedObject est active, charge le modèle du TSStatic sélectionné.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/shapeEditor.lua:942
function editor_shapeEditor.onEditorObjectSelectionChanged() end

--- Hook : enregistre la catégorie shapeEditor et la préférence general.autoOpenSelectedObject.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/shapeEditor.lua:952
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_shapeEditor.onEditorRegisterPreferences(prefsRegistry) end

--- Hook de sérialisation (rechargement Lua) : renvoie meshFile et highlightMaterialName.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/shapeEditor.lua:920
---@return table  {meshFile, highlightMaterialName}.
function editor_shapeEditor.onSerialize() end

--- Charge un modèle dans l'aperçu : le définit dans ShapePreview, réinitialise l'orbite, affiche la fenêtre, lit les infos du shape (détails/LOD, séquences), le fichier .cs du mesh constructor et les réglages d'imposteur.
---Source : lua/ge/extensions/editor/shapeEditor.lua:907
---@param filename string Chemin du modèle 3D, ex. /levels/.../x.dae.
function editor_shapeEditor.showShapeEditorLoadFile(filename) end

