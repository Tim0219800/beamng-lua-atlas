---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/materialSelectionMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre imgui « Material Selector » (300 x 500) pour choisir un matériau, avec vignettes et barre de recherche. Utilisée par les outils de décalques de l'éditeur. Elle liste les matériaux de Sim.getMaterialSet() filtrés par tag (decal pour les patchs de décalque, RoadAndPath pour les routes de décalque) et appelle un callback avec le nom du matériau choisi.
--- Accès : extension `editor_toolUtilities_materialSelectionMgr` : `extensions.load("editor_toolUtilities_materialSelectionMgr")`, puis la globale `editor_toolUtilities_materialSelectionMgr`
---@class editor_toolUtilities_materialSelectionMgr
editor_toolUtilities_materialSelectionMgr = {}

--- Masque la fenêtre de sélection de matériau.
---Source : lua/ge/extensions/editor/toolUtilities/materialSelectionMgr.lua:63
function editor_toolUtilities_materialSelectionMgr.closeWindow() end

--- Renvoie l'objet texture pour un chemin absolu, en le chargeant via editor.texObj si besoin (limité à 5 chargements par frame). Renvoie false si le chargement a échoué, nil si la limite est atteinte avant le premier essai.
---Source : lua/ge/extensions/editor/toolUtilities/materialSelectionMgr.lua:43
---@param absPath string Chemin absolu de l'image.
---@return table|boolean|nil  Objet texture (avec .tex), false ou nil.
function editor_toolUtilities_materialSelectionMgr.getTexObj(absPath) end

--- À appeler à chaque frame : dessine la fenêtre (recherche + liste défilante de matériaux avec vignette de la diffuseMap) et appelle onSelectMaterialFunct(nomMatériau) au clic. Masque la fenêtre s'il n'y a aucun matériau.
---Source : lua/ge/extensions/editor/toolUtilities/materialSelectionMgr.lua:66
---@param isDecal boolean true : patchs de décalque (tag 'decal') ; false : routes de décalque (tag 'RoadAndPath').
---@param onSelectMaterialFunct function|nil Callback appelé avec le nom du matériau choisi.
function editor_toolUtilities_materialSelectionMgr.handleMaterialSelectionSubWindow(isDecal, onSelectMaterialFunct) end

--- Affiche la fenêtre de sélection de matériau.
---Source : lua/ge/extensions/editor/toolUtilities/materialSelectionMgr.lua:60
function editor_toolUtilities_materialSelectionMgr.openWindow() end

--- Enregistre la fenêtre 'materialSelect' dans l'éditeur (editor.registerWindow).
---Source : lua/ge/extensions/editor/toolUtilities/materialSelectionMgr.lua:57
function editor_toolUtilities_materialSelectionMgr.registerWindow() end

