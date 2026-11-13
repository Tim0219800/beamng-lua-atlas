---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Point d'entrée de l'outil interne de génération de vignettes (thumbnails) de véhicules. Ce fichier est une façade : il déclare comme dépendances tous les sous-modules util_screenshotCreator_* (interface ImGui, réglages, cadrage, capture, job de traitement par lots, etc.) et délègue vers eux. Il sert à ouvrir la fenêtre de l'outil, lancer la génération par lots, cadrer un véhicule, prendre une capture hors écran et choisir le mode de cadrage.
--- Accès : extension `util_screenshotCreator` : `extensions.load("util_screenshotCreator")`, puis la globale `util_screenshotCreator`
---@class util_screenshotCreator
---@field dependencies string[] Liste des extensions util_screenshotCreator_* chargées avec celle-ci
---@field state table État du module, initialement {show = false}
util_screenshotCreator = {}

--- Calcule la position et l'orientation de caméra qui cadrent un véhicule avec le cadrage procédural, d'après le contexte de cadrage des réglages.
---Source : lua/ge/extensions/util/screenshotCreator.lua:43
---@param vehicle userdata Objet véhicule à cadrer
---@param fov number|nil Champ de vision en degrés (défaut : valeur des réglages)
---@param nearPlane number|nil Plan proche de la caméra (défaut : réglages)
---@param aspectRatio number|nil Rapport largeur/hauteur (défaut : réglages)
---@param resolution table|nil Résolution {largeur, hauteur} utilisée pour le contexte de cadrage
---@param configName string|nil Nom de la configuration du véhicule
---@return vec3|nil  Position de la caméra
---@return quat|nil  Rotation de la caméra
---@return table|nil  Données de cadrage (framingData)
function util_screenshotCreator.frameVehicle(vehicle, fov, nearPlane, aspectRatio, resolution, configName) end

--- Renvoie l'identifiant du mode de cadrage sélectionné.
---Source : lua/ge/extensions/util/screenshotCreator.lua:101
---@return string  Identifiant du mode
function util_screenshotCreator.getFramingMode() end

--- Liste les modes de cadrage disponibles (délègue à util_screenshotCreator_framingManager.listModes).
---Source : lua/ge/extensions/util/screenshotCreator.lua:98
---@return table  Modes de cadrage enregistrés
function util_screenshotCreator.listFramingModes() end

--- Hook appelé après un rechargement d'extensions : si les données contiennent un état d'interface (windowOpen, resolutionPtr, reviewData ou skipCustomCameras), les transmet à util_screenshotCreator_ui.onDeserialized.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator.lua:76
---@param data table|nil Données sauvegardées par la sérialisation
function util_screenshotCreator.onDeserialized(data) end

--- Hook appelé au déchargement : restaure l'environnement modifié par les réglages (restoreEnvironment) et logue le déchargement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator.lua:87
function util_screenshotCreator.onExtensionUnloaded() end

--- Ouvre la fenêtre ImGui de l'outil (délègue à util_screenshotCreator_ui.openWindow).
---Source : lua/ge/extensions/util/screenshotCreator.lua:35
---@return any  Valeur renvoyée par util_screenshotCreator_ui.openWindow
function util_screenshotCreator.openWindow() end

--- Sélectionne le mode de cadrage.
---Source : lua/ge/extensions/util/screenshotCreator.lua:104
---@param modeId string Identifiant du mode (par exemple « fixedIsometric » ou « configured »)
---@return any  Valeur renvoyée par framingManager.setSelectedModeId
function util_screenshotCreator.setFramingMode(modeId) end

--- Démarre la génération de vignettes par lots (délègue à util_screenshotCreator_job.startWork).
---Source : lua/ge/extensions/util/screenshotCreator.lua:39
---@param workOptions table Options du traitement (déduit du code : transmises telles quelles au module job)
---@return any  Valeur renvoyée par util_screenshotCreator_job.startWork
function util_screenshotCreator.startWork(workOptions) end

--- Prend une capture hors écran depuis la caméra donnée et l'enregistre dans filepath (délègue à util_screenshotCreator_capture), avec les paramètres de capture des réglages.
---Source : lua/ge/extensions/util/screenshotCreator.lua:60
---@param filepath string Chemin du fichier image à écrire
---@param camera table Caméra {pos, rot, fov?, nearPlane?, screenshotDelay?}
---@param callback function|nil Appelé à la fin de la capture
---@param uniqueId any Identifiant transmis au module de capture
function util_screenshotCreator.takeThumbnailScreenshot(filepath, camera, callback, uniqueId) end

