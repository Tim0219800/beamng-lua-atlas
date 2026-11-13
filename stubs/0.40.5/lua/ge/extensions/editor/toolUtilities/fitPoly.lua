---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/fitPoly.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utilitaire qui ordonne un ensemble non ordonné d'objets en une polyligne. Pour chaque point de départ possible, il construit un chemin glouton (point le plus proche, bonus si la direction continue), puis garde le chemin au meilleur score (lissé de direction, longueur courte). Utile aux outils de l'éditeur qui reçoivent des objets sélectionnés sans ordre.
--- Accès : extension `editor_toolUtilities_fitPoly` : `extensions.load("editor_toolUtilities_fitPoly")`, puis la globale `editor_toolUtilities_fitPoly`
---@class editor_toolUtilities_fitPoly
editor_toolUtilities_fitPoly = {}

--- Réordonne les composants pour former la meilleure polyligne. Chaque composant doit avoir un champ obj avec getPosition(). Renvoie components tel quel s'il y en a moins de deux.
---Source : lua/ge/extensions/editor/toolUtilities/fitPoly.lua:118
---@param components table[] Liste de tables { obj = objet avec getPosition() }.
---@return table[]  Nouvelle liste des mêmes composants, dans l'ordre de la polyligne.
function editor_toolUtilities_fitPoly.fitPoly(components) end

