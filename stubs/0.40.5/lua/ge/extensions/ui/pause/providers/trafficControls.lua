---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/providers/trafficControls.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fournisseur de données du panneau « contrôles du trafic » du menu pause. Il compte les véhicules de trafic (en circulation, garés, police, actifs/inactifs) via gameplay_traffic, gameplay_parking et gameplay_police, calcule les quantités à faire apparaître d'après les réglages (trafficAmount, trafficExtraAmount, trafficParkingAmount, trafficParkedVehicles) et construit les boutons (démarrer, arrêter, supprimer, faire apparaître du trafic normal, de police ou des véhicules garés, activer/désactiver). Les boutons sont exécutés par executeTrafficControlAction.
--- Accès : extension `ui_pause_providers_trafficControls` : `extensions.load("ui_pause_providers_trafficControls")`, puis la globale `ui_pause_providers_trafficControls`
---@class ui_pause_providers_trafficControls
ui_pause_providers_trafficControls = {}

--- Exécute l'action d'un bouton par son identifiant : démarrage, arrêt ou suppression du trafic, apparition de trafic normal, de police ou garé, ou bascule.
---Source : lua/ge/extensions/ui/pause/providers/trafficControls.lua:335
---@param buttonId any Identifiant du bouton, fourni par getData.
---@param payload any Données transmises au callback du bouton.
---@return boolean  false si buttonId est nil, sinon résultat du callback.
function ui_pause_providers_trafficControls.executeTrafficControlAction(buttonId, payload) end

--- Construit l'état du panneau de trafic : état du trafic, parking actif, enabled, canActivateExisting (plus d'un objet dans la scène), compteurs driving/parked/police/total ({total, active, inactive}) et boutons d'action (toggle, controls, spawn).
---Source : lua/ge/extensions/ui/pause/providers/trafficControls.lua:305
---@param payload table|nil requestId est renvoyé tel quel ; editable == false désactive tous les boutons.
---@return table  {requestId, state, parkingActive, enabled, canActivateExisting, driving, parked, police, total, actions}.
function ui_pause_providers_trafficControls.getData(payload) end

