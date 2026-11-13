---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/measuresInspectorHeader.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petite extension de l'éditeur qui ajoute une ligne « Size: X x Y x Z » dans l'en-tête de l'inspecteur d'objets. Elle affiche la taille (boîte englobante, échelle comprise) de l'objet sélectionné, ou de la boîte englobante de la sélection s'il y en a plusieurs. Elle n'agit qu'une fois l'éditeur initialisé.
--- Accès : extension `editor_measuresInspectorHeader` : `extensions.load("editor_measuresInspectorHeader")`, puis la globale `editor_measuresInspectorHeader`
---@class editor_measuresInspectorHeader
editor_measuresInspectorHeader = {}

--- Hook appelé quand l'éditeur est initialisé ; active l'affichage de la taille.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/measuresInspectorHeader.lua:52
function editor_measuresInspectorHeader.onEditorInitialized() end

--- Hook appelé par l'inspecteur de l'éditeur pour dessiner son en-tête. Dessine le texte « Size » et son infobulle. Utilise inspectorInfo.selection si présent, sinon editor.selection. Ne fait rien tant que l'éditeur n'est pas initialisé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/measuresInspectorHeader.lua:10
---@param inspectorInfo table Informations de l'inspecteur ; le champ facultatif selection remplace editor.selection.
function editor_measuresInspectorHeader.onEditorInspectorHeaderGui(inspectorInfo) end

--- Hook de chargement de l'extension ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/measuresInspectorHeader.lua:49
function editor_measuresInspectorHeader.onExtensionLoaded() end

