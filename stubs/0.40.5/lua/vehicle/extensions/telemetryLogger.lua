---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/telemetryLogger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Enregistreur de télémétrie simple : à chaque frame graphique (quand l'enregistrement est actif) il mémorise timestamp, position, vitesse, gaz, frein, direction, frein à main et forces G (sensors.gx2/gy2), puis saveDataToDisk écrit le tout dans un fichier CSV `telemetryData_HH-MM-SS.csv`. Pratique pour un moddeur qui veut exporter une session de conduite.
--- Accès : extension `telemetryLogger` : `extensions.load (VM véhicule)("telemetryLogger")`, puis la globale `telemetryLogger`
---@class telemetryLogger
telemetryLogger = {}

--- Hook appelé à l'initialisation du véhicule : vide les données, remet l'index et le timestamp à zéro et arrête l'enregistrement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/telemetryLogger.lua:72
function telemetryLogger.onInit() end

--- Hook appelé au reset du véhicule ; même fonction que onInit (efface les données et arrête l'enregistrement).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/telemetryLogger.lua:72
function telemetryLogger.onReset() end

--- Arrête l'enregistrement et écrit les données collectées dans `telemetryData_<heure>.csv`, puis réinitialise l'état.
---Source : lua/vehicle/extensions/telemetryLogger.lua:40
---@return boolean|nil  false si le fichier n'a pas pu être ouvert, nil sinon.
function telemetryLogger.saveDataToDisk() end

--- Active l'enregistrement : updateGFX ajoute un point de données à chaque frame. Ne remet pas les données à zéro (utiliser onInit/onReset ou saveDataToDisk pour cela).
---Source : lua/vehicle/extensions/telemetryLogger.lua:64
function telemetryLogger.startRecording() end

--- Suspend l'enregistrement sans vider les données déjà collectées.
---Source : lua/vehicle/extensions/telemetryLogger.lua:68
function telemetryLogger.stopRecording() end

--- Appelé à chaque frame graphique (extensions.hook('updateGFX')). Si l'enregistrement est actif, ajoute un point de données.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/telemetryLogger.lua:13
---@param dt number Pas de temps en secondes, ajouté au timestamp.
function telemetryLogger.updateGFX(dt) end

