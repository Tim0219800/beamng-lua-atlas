---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicleMirrors.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_vehicleMirrors` : ébauche de rendu des reflets de rétroviseurs. Suit le véhicule du joueur 0, demande ses données de miroirs via le hook onVehicleMirrorsChanged, puis contient (renderMirrors) le code qui calcule la direction de réflexion et appelle veh:renderCameraToMaterial vers une texture 128x128 (FOV 70). En l'état, ce rendu est désactivé : l'appel à renderMirrors et à l'UI de réglage sont commentés dans onPreRender. L'extension est donc pratiquement inerte.
--- Accès : extension `core_vehicleMirrors` : `extensions.load("core_vehicleMirrors")`, puis la globale `core_vehicleMirrors`
---@class core_vehicleMirrors
core_vehicleMirrors = {}

--- Hook par frame avant le rendu : détecte un changement de véhicule du joueur 0 et déclenche une demande de données de miroirs (hook onVehicleMirrorsChanged). Le rendu des miroirs lui-même est commenté.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleMirrors.lua:108
---@param dtReal number temps réel (s)
---@param dtSim number temps de simulation (s)
---@param dtRaw number temps brut (s)
function core_vehicleMirrors.onPreRender(dtReal, dtSim, dtRaw) end

--- Hook (émis par ce module) : reçoit les données de miroirs du véhicule suivi (ignorées pour un autre véhicule), les mémorise et ajoute à chaque miroir un champ userCorrection (vec3 nul).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleMirrors.lua:128
---@param id integer véhicule
---@param data table table de miroirs
function core_vehicleMirrors.onVehicleMirrorsChanged(id, data) end

--- Hook : le joueur change de véhicule (ne fait rien).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleMirrors.lua:9
---@param oldVehId integer ancien véhicule
---@param newVehId integer nouveau véhicule
function core_vehicleMirrors.onVehicleSwitched(oldVehId, newVehId) end

