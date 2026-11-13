---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/roadDesignStandards.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Normes de conception routière partagées par plusieurs outils de l'éditeur. Définit six préréglages ordonnés, du plus rigoureux au plus rustique, chacun avec quatre contraintes : pente longitudinale maximale (ratio), rayon de courbure minimal (m), dévers maximal (degrés) et gradient de largeur maximal.
--- Accès : extension `editor_toolUtilities_roadDesignStandards` : `extensions.load("editor_toolUtilities_roadDesignStandards")`, puis la globale `editor_toolUtilities_roadDesignStandards`
---@class editor_toolUtilities_roadDesignStandards
editor_toolUtilities_roadDesignStandards = {}

--- Renvoie le tableau ordonné des noms de préréglages.
---Source : lua/ge/extensions/editor/toolUtilities/roadDesignStandards.lua:93
---@return string[]  Noms des six préréglages.
function editor_toolUtilities_roadDesignStandards.getPresetStrings() end

--- Renvoie la table nom de préréglage -> paramètres {maxSlope, minRadius, maxBanking, maxWidthGradient}.
---Source : lua/ge/extensions/editor/toolUtilities/roadDesignStandards.lua:97
---@return table<string, table>  Paramètres de chaque préréglage.
function editor_toolUtilities_roadDesignStandards.getPresetsMap() end

