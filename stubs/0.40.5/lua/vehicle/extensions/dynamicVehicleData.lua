---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/dynamicVehicleData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil interne de génération automatique des fiches de performance des véhicules (fichiers vehicles/<modèle>/info_<config>.json), piloté depuis le GE par util_saveDynamicData. Une coroutine exécute des mesures statiques (poids, puissance, couple, régimes de pic, type de moteur, induction, carburant, transmission, layout, boîte englobante) puis dynamiques (accélérations, freinage, score tout-terrain) en repositionnant le véhicule, puis met à jour le fichier info par fusion récursive.
--- Accès : extension `dynamicVehicleData` : `extensions.load (VM véhicule)("dynamicVehicleData")`, puis la globale `dynamicVehicleData`
---@class dynamicVehicleData
dynamicVehicleData = {}

--- Détermine la disposition de la transmission du véhicule à partir des roues propulsées (valeur texte, 'Other' si indéterminée).
---Source : lua/vehicle/extensions/dynamicVehicleData.lua:499
---@return string  Disposition : 'FWD', 'RWD', 'AWD', '4WD', 'NxM' (roues x roues motrices) ou 'Other'.
function dynamicVehicleData.getPowertrainLayout() end

--- Hook d'initialisation ; vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/dynamicVehicleData.lua:86
function dynamicVehicleData.onInit() end

--- Même fonction que onInit.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/dynamicVehicleData.lua:86
function dynamicVehicleData.onReset() end

--- Lance la séquence complète (données statiques puis tests dynamiques) dans une coroutine pour le modèle et la configuration indiqués.
---Source : lua/vehicle/extensions/dynamicVehicleData.lua:1071
---@param _model_key string Nom du modèle (dossier vehicles/).
---@param _config_key string Nom de la configuration.
function dynamicVehicleData.performTests(_model_key, _config_key) end

--- Appelé chaque frame : incrémente le chronomètre interne, reprend la coroutine de test et envoie le heartbeat/killswitch au GE.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/dynamicVehicleData.lua:1053
---@param dt number Pas de temps en secondes.
function dynamicVehicleData.updateGFX(dt) end

