---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/style.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Réglages de style des outils de splines de l'éditeur : couleurs 3D (curseur, nœuds, jonctions, splines, poignées, fils de prévisualisation) pour le dessin de debug, et palettes de couleurs ImGui par thème. Les thèmes disponibles sont blueRose, vapourStatic, canyonClay, terminalAurora, summerOfLove, deerPark, dreamMachine, headlights, crystal (défaut) et neoIndustrial.
--- Accès : extension `editor_toolUtilities_style` : `extensions.load("editor_toolUtilities_style")`, puis la globale `editor_toolUtilities_style`
---@class editor_toolUtilities_style
editor_toolUtilities_style = {}

--- Renvoie la palette de couleurs ImGui du thème demandé.
---Source : lua/ge/extensions/editor/toolUtilities/style.lua:379
---@param theme string|nil Nom du thème (voir module) ; 'crystal' par défaut.
---@return table  Palette de couleurs nommées (ImVec4).
function editor_toolUtilities_style.getImguiCols(theme) end

--- Renvoie les propriétés de style de l'interface : couleurs de curseur, nœuds, jonctions, splines (sélectionnée, estompée, liée), poignées, fils de prévisualisation, et quelques ImVec4 (greenD, blueB, blueD, redB, yellowB).
---Source : lua/ge/extensions/editor/toolUtilities/style.lua:14
---@return table  Table de couleurs nommées.
function editor_toolUtilities_style.getStyle() end

