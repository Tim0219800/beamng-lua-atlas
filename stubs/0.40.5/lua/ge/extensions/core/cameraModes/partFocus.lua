---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/partFocus.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode de cadrage de pièce. Champs : camRot, targetPos, currentPos, targetDistance, currentDistance, fov, transitionElapsed/Duration, hopDistance.
---@class core_cameraModes_partFocus
local core_cameraModes_partFocus = {}

--- Valeurs par défaut (voir notes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/partFocus.lua:21
function core_cameraModes_partFocus:init() end

--- Oublie le décalage et la distance courants (prochain update : saut) et remet l'orbite par défaut.
---Source : lua/ge/extensions/core/cameraModes/partFocus.lua:83
function core_cameraModes_partFocus:reset() end

--- Prépare le passage à la pièce suivante : snap saute directement (quand la transition de caméra globale fait le fondu) ; sinon la vue glisse depuis sa position actuelle pendant duration, avec un départ plus rapide si brisk. Pendant le glissement la caméra recule en proportion de la distance parcourue (jusqu'à 6 m).
---Source : lua/ge/extensions/core/cameraModes/partFocus.lua:53
---@param snap boolean saut direct sans glissement
---@param duration number|nil secondes (min 0.001)
---@param brisk boolean|nil courbe d'accélération rapide
function core_cameraModes_partFocus:retarget(snap, duration, brisk) end

--- Définit la distance cible, bornée à [0.6, 80] m.
---Source : lua/ge/extensions/core/cameraModes/partFocus.lua:77
---@param d number|nil mètres (> 0)
function core_cameraModes_partFocus:setDefaultDistance(d) end

--- Définit le point visé ; si la pièce s'est déplacée de plus de 5 m d'un coup hors glissement (reset/téléportation du véhicule), la vue saute dessus.
---Source : lua/ge/extensions/core/cameraModes/partFocus.lua:66
---@param pos vec3|nil point monde ; nil est ignoré
function core_cameraModes_partFocus:setRef(pos) end

--- Appelle extensions.core_vehicle_partFocusCamera.updateTarget(dt, self), lisse la position, gère orbite/zoom et écrit data.res.pos/rot/fov.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/partFocus.lua:90
---@param data table camData
---@return boolean  true tant que le pilote core_vehicle_partFocusCamera est actif, sinon false
function core_cameraModes_partFocus:update(data) end

