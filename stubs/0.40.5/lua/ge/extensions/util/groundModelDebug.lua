---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/groundModelDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre ImGui de débogage et de réglage des ground models (modèles de sol : friction, fluide de surface, type de collision). Elle permet d'afficher en 3D, autour du pointeur de la souris (ou du point de focus du debugger), la carte de hauteur des ground models, sa profondeur et les triangles de collision statiques, avec une couleur par ground model, et une densité de triangles de collision par tuile. Chaque ground model peut être modifié en direct (be:setGroundModel, aliases inclus) puis sauvegardé dans /art/groundmodels.json ; le bouton « Default » recharge les valeurs d'origine. Les réglages d'affichage sont mémorisés dans settings/editor/groundModelDebug_settings.json.
--- Accès : extension `util_groundModelDebug` : `extensions.load("util_groundModelDebug")`, puis la globale `util_groundModelDebug`
---@class util_groundModelDebug
---@field dependencies string[] {"ui_imguiUtils"} : utilisé pour charger l'atlas d'icônes de l'éditeur
util_groundModelDebug = {}

--- Hook de désérialisation : restaure l'état sauvegardé et réactive le débogage des collisions statiques côté moteur si nécessaire.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/groundModelDebug.lua:563
---@param data table Données renvoyées par onSerialize
function util_groundModelDebug.onDeserialized(data) end

--- Appelé au chargement : construit la liste des ground models depuis core_environment.groundModels et relit les réglages sauvegardés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/groundModelDebug.lua:551
function util_groundModelDebug.onExtensionLoaded() end

--- Hook de sérialisation avant un rechargement d'extensions : conserve l'état d'ouverture de la fenêtre, de l'affichage des triangles statiques et de la densité.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/groundModelDebug.lua:555
---@return table  {windowOpen, staticDebug, colDensityEnabled}
function util_groundModelDebug.onSerialize() end

--- Hook appelé chaque frame : tant que la fenêtre est ouverte, détermine le point de focus (raycast de la souris ou Lua.lastDebugFocusPos), dessine les visualisations debug de chaque ground model actif et l'interface ImGui.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/groundModelDebug.lua:232
---@param dt number Delta de temps en secondes (non utilisé)
function util_groundModelDebug.onUpdate(dt) end

--- Ouvre la fenêtre « GroundModel Debug Window ».
---Source : lua/ge/extensions/util/groundModelDebug.lua:207
function util_groundModelDebug.openWindow() end

