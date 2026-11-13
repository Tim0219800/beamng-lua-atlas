---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/groundMarkerArrows.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_groundMarkerArrows` : gère les grandes flèches flottantes affichées aux intersections de l'itinéraire de navigation (modèle s_mm_arrow_floating.dae, objets TSStatic dans le SimGroup 'arrowPool'). Elle est pilotée par core_groundMarkers (createArrowPool, updateArrows, clearArrows) ; un moddeur n'a normalement pas à l'appeler directement. Elle affiche aussi le message « mauvaise direction » quand le véhicule s'éloigne du chemin.
--- Accès : extension `core_groundMarkerArrows` : `extensions.load("core_groundMarkerArrows")`, puis la globale `core_groundMarkerArrows`
---@class core_groundMarkerArrows
core_groundMarkerArrows = {}

--- Supprime tous les objets flèche et le SimGroup 'arrowPool', vide les tables de suivi et remet le compteur de mauvaise direction à -20.
---Source : lua/ge/extensions/core/groundMarkerArrows.lua:29
function core_groundMarkerArrows.clearArrows() end

--- Crée le SimGroup 'arrowPool' avec 11 flèches TSStatic cachées (sans collision, canSave = false) et leurs proxies. Si le pool existe déjà, remet tous les proxies à 'unused' et cache les flèches.
---Source : lua/ge/extensions/core/groundMarkerArrows.lua:50
---@param floatingArrowColor number[]|nil Non utilisé (la couleur vient de core_groundMarkers.floatingArrowColor).
function core_groundMarkerArrows.createArrowPool(floatingArrowColor) end

--- Hook de sortie du moteur : alias de clearArrows.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/groundMarkerArrows.lua:29
function core_groundMarkerArrows.onExit() end

--- Hook de rendu : applique à chaque flèche non 'unused' sa position, rotation et échelle (taille lissée x alpha) et fait passer les flèches en fondu à l'état 'unused' une fois invisibles. Cache tout en mode photo.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/groundMarkerArrows.lua:246
---@param dt number Delta temps du rendu en secondes.
function core_groundMarkerArrows.onPreRender(dt) end

--- Met à jour les flèches d'après le chemin : crée/réutilise celles des intersections à guider, met en fondu celles qui ne sont plus utiles, et gère le message de mauvaise direction.
---Source : lua/ge/extensions/core/groundMarkerArrows.lua:122
---@param path table[] Chemin du routeur : éléments {pos = vec3, distToTarget, wp, linkCount}.
---@param pathLength number Distance totale du véhicule à la destination en mètres (distToVehicle = pathLength - path[i].distToTarget).
function core_groundMarkerArrows.updateArrows(path, pathLength) end

