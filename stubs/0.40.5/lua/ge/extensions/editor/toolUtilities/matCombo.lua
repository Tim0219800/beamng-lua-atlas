---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/matCombo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sélecteur imgui de couche de matériau de terrain (liste déroulante) pour les outils de l'éditeur. Les couches sont indexées à partir de 0, comme l'index de peinture ; -1 signifie « auto », résolu via util.findMaterialIdx. Un bouton remet la valeur par défaut.
--- Accès : extension `editor_toolUtilities_matCombo` : `extensions.load("editor_toolUtilities_matCombo")`, puis la globale `editor_toolUtilities_matCombo`
---@class editor_toolUtilities_matCombo
editor_toolUtilities_matCombo = {}

--- Dessine une ligne de sélecteur (bouton de remise à zéro, puis liste déroulante). Renvoie la nouvelle valeur si l'utilisateur a changé la sélection ou remis le défaut, sinon nil.
---Source : lua/ge/extensions/editor/toolUtilities/matCombo.lua:28
---@param cur integer|string|nil Valeur courante (index de couche, -1 = auto) ; convertie par tonumber, sinon opts.default.
---@param opts table id (obligatoire, id imgui), label, default (valeur par défaut), allowAuto (propose l'entrée Auto), autoNames (noms à chercher pour l'auto), tooltip.
---@return integer|nil  Nouvel index choisi, ou nil si rien n'a changé.
function editor_toolUtilities_matCombo.draw(cur, opts) end

