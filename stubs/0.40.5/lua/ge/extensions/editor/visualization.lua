---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/visualization.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre « Visualization » de l'éditeur de monde. Trois onglets : Debug (cases à cocher pour les types de visualisation enregistrés : wireframe, bounding boxes, triggers, terrain, decals, frustums de lumière, graphes de navigation, vues Advanced Lighting, Material Debug...), Visible (affichage par classe d'objet) et Selectable (sélectionnabilité par classe, avec des presets). Elle ajoute aussi la visualisation « Lights Status » (sphères colorées et textes sur les lumières de la scène) et enregistre les préférences gizmos.visualization.*.
--- Accès : extension `editor_visualization` : `extensions.load("editor_visualization")`, puis la globale `editor_visualization`
---@class editor_visualization
---@field dependencies table<integer, string> {'editor_aiViz'} : extension chargée avant celle-ci.
editor_visualization = {}

--- Hook de l'éditeur appelé à chaque frame : dessine les sphères/textes de la visualisation des lumières, la fenêtre Visualization (filtre de recherche, trois onglets), la fenêtre de réglages des lumières et la légende de material debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/visualization.lua:225
function editor_visualization.onEditorGui() end

--- Hook de l'éditeur appelé à l'initialisation : initialise selectabilityPresets, enregistre les fenêtres, efface puis enregistre tous les types de visualisation (editor.registerVisualizationType), initialise materialDebugViz et calcule les valeurs par défaut de chaque type. Expose aussi editor.updateVisSettings.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/visualization.lua:440
function editor_visualization.onEditorInitialized() end

--- Hook de l'éditeur appelé quand une préférence change : applique visTypes, visible ou selectable aux objets de l'éditeur, synchronise le preset de sélectabilité, et bascule les chemins non persistants quand saveVisualizationSettings change.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/visualization.lua:359
---@param path string chemin de la préférence, ex. 'gizmos.visualization.visTypes'
---@param value any nouvelle valeur (table pour visTypes/visible/selectable, booléen pour saveVisualizationSettings)
function editor_visualization.onEditorPreferenceValueChanged(path, value) end

--- Hook de l'éditeur appelé à l'enregistrement des préférences : mémorise l'état initial visible/sélectionnable de chaque classe d'objet et enregistre la catégorie gizmos/visualization.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/visualization.lua:401
---@param prefsRegistry table registre de préférences de l'éditeur
function editor_visualization.onEditorRegisterPreferences(prefsRegistry) end

