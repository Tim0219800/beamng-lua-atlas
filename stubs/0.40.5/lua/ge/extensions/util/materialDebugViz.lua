---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/materialDebugViz.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Visualisations de débogage des matériaux (PBR) pour l'éditeur et les outils de rendu. Il définit 22 modes (aucun, quad overdraw, fil de fer, niveau de mipmap, couleur de base, opacité, métallique, rugosité, normales monde, occlusion ambiante, émissif, vernis, rugosité du vernis, UV0/UV1 avec damier et grille, matériau déprécié, nombre de couches, uniformité du Draw ID). Chaque mode active un drapeau de débogage dans le moteur (materialDebugSetFlag / enableMaterialDebug). Quand un mode est actif, une fenêtre de légende ImGui s'affiche en bas de l'écran (dégradé, pastilles de couleur et explications).
--- Accès : extension `util_materialDebugViz` : `extensions.load("util_materialDebugViz")`, puis la globale `util_materialDebugViz`
---@class util_materialDebugViz
util_materialDebugViz = {}

--- Dessine la fenêtre de légende du mode actif (au centre horizontal, à 80 % de la hauteur de la vue). Ne dessine rien si aucun mode n'est actif ou s'il n'a pas de légende. Aussi branchée comme onUpdate.
---Source : lua/ge/extensions/util/materialDebugViz.lua:361
function util_materialDebugViz.drawLegendWindow() end

--- Renvoie le pointeur ImGui entier (IntPtr) contenant l'index du mode courant (à partir de 0), utilisable avec un combo ImGui.
---Source : lua/ge/extensions/util/materialDebugViz.lua:359
---@return userdata  im.IntPtr de l'index courant
function util_materialDebugViz.getIndexPtr() end

--- Renvoie la liste des modes de visualisation (tables {type='Custom', name, displayName, setter, getter}), nil avant le chargement.
---Source : lua/ge/extensions/util/materialDebugViz.lua:358
---@return table[]|nil  Modes disponibles
function util_materialDebugViz.getTypes() end

--- Appelé au chargement : construit la table des modes de visualisation (type, name, displayName, setter, getter) et sélectionne l'index du mode déjà actif dans le moteur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/materialDebugViz.lua:257
function util_materialDebugViz.onExtensionLoaded() end

--- Hook appelé chaque frame ; alias de drawLegendWindow. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/materialDebugViz.lua:dyn
function util_materialDebugViz.onUpdate() end

--- Active un mode de visualisation par son nom ; sans argument ou avec Material_None, désactive la visualisation. Logue une erreur pour un nom inconnu.
---Source : lua/ge/extensions/util/materialDebugViz.lua:410
---@param mode string|nil Nom du mode, par exemple Material_Roughness
function util_materialDebugViz.set(mode) end

