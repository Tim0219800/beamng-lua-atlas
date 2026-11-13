---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/vehiclePerformanceData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Collecte des données de performance du véhicule, surtout utilisée par l'UI/le jeu pour les fiches techniques et certifications. Deux volets : des données statiques (poids, répartition des roues motrices, type de boîte, carburants, type d'admission) via getStaticData, et des enregistrements dynamiques (pic de puissance, de couple, d'accélération longitudinale et latérale) démarrés par startRecording et lus par getRecordingData. L'extension n'active son updateGFX que pendant un enregistrement.
--- Accès : extension `vehiclePerformanceData` : `extensions.load (VM véhicule)("vehiclePerformanceData")`, puis la globale `vehiclePerformanceData`
---@class vehiclePerformanceData
---@field recordingTypes table<string, string> Types d'enregistrement dynamique : power, torque, speed, longitudinalAcceleration, lateralAcceleration.
---@field staticTypes table<string, string> Noms des données statiques : weight, powertrainLayout, transmissionStyle, propulsionType, fuelType, inductionType.
---@field updateGFX function|nil nil au repos ; défini par startRecording tant qu'un enregistrement est actif.
vehiclePerformanceData = {}

--- Renvoie les données collectées pour les types demandés.
---Source : lua/vehicle/extensions/vehiclePerformanceData.lua:262
---@param recordingTypes string[] Liste de valeurs de recordingTypes.
---@return table<string, table>  Table type -> données (nil pour un type jamais démarré).
function vehiclePerformanceData.getRecordingData(recordingTypes) end

--- Calcule et renvoie les données statiques du véhicule (poids, layout, boîte, carburants, admission).
---Source : lua/vehicle/extensions/vehiclePerformanceData.lua:270
---@return table  Table avec les clés de staticTypes.
function vehiclePerformanceData.getStaticData() end

--- Hook de chargement : initialise les tables d'enregistrement et associe chaque type à ses routines start/stop/update.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/vehiclePerformanceData.lua:281
function vehiclePerformanceData.onExtensionLoaded() end

--- Démarre les enregistrements demandés (initialise leurs données, appelle leur routine de démarrage) et active le hook updateGFX si nécessaire.
---Source : lua/vehicle/extensions/vehiclePerformanceData.lua:233
---@param recordingTypes string[] Liste de valeurs de recordingTypes.
function vehiclePerformanceData.startRecording(recordingTypes) end

--- Arrête les enregistrements demandés ; désactive updateGFX si plus aucun n'est actif. Les données restent lisibles.
---Source : lua/vehicle/extensions/vehiclePerformanceData.lua:248
---@param recordingTypes string[] Liste de valeurs de recordingTypes.
function vehiclePerformanceData.stopRecording(recordingTypes) end

