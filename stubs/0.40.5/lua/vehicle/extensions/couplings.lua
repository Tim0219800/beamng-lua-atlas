---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/couplings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension de gestion des attelages de type sellette (fifth wheel). Elle réagit aux événements de beamstate (activation/désactivation de l'attelage automatique, détachement) en relayant aux contrôleurs 'couplings/fifthwheel' et répond aux questions de beamstate sur l'état d'attelage.
--- Accès : extension `couplings` : `extensions.load (VM véhicule)("couplings")`, puis la globale `couplings`
---@class couplings
couplings = {}

--- Appelé par le moteur/beamstate quand un coupleur s'attache : arrête le verrouillage automatique et désactive l'attelage auto.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/couplings.lua:30
---@param nodeId integer Nœud du coupleur.
---@param obj2id integer Identifiant de l'autre véhicule.
---@param obj2nodeId integer Nœud du coupleur de l'autre véhicule.
function couplings.couplingAttached(nodeId, obj2id, obj2nodeId) end

--- Appelé quand un coupleur se détache ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/couplings.lua:35
---@param nodeId integer Nœud du coupleur.
---@param obj2id integer Autre véhicule.
---@param obj2nodeId integer Nœud de l'autre véhicule.
function couplings.couplingDetached(nodeId, obj2id, obj2nodeId) end

--- Indique si l'attelage automatique est actif pour cette extension (toujours false).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/couplings.lua:39
---@return boolean  false.
function couplings.isAutoCouplingActive() end

--- Indique si au moins une sellette est attachée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/couplings.lua:44
---@return boolean|nil  true si attachée, sinon nil.
function couplings.isCouplerAttached() end

--- Appelé par beamstate à l'activation de l'attelage automatique : affiche l'indicateur de chaque sellette.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/couplings.lua:7
function couplings.onBeamstateActivateAutoCoupling() end

--- Appelé par beamstate pour détacher les coupleurs : détache chaque sellette.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/couplings.lua:23
function couplings.onBeamstateDetachCouplers() end

--- Appelé par beamstate à la désactivation de l'attelage automatique : masque l'indicateur de chaque sellette.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/couplings.lua:15
function couplings.onBeamstateDisableAutoLatching() end

--- Hook de reset du véhicule ; vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/couplings.lua:53
function couplings.onReset() end

