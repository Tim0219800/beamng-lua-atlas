---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/ui.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre ImGui « Vehicle Screenshot Creator (WIP) » du créateur de vignettes de véhicules. Elle sert de façade aux autres modules util_screenshotCreator_* : boutons pour lancer un travail (« Run selected models », « Run selected defaults », « Run current config », Stop avec barre de progression), ouverture du niveau showroom_v2_lighting_simple, onglets Output, Lighting, Debug (mode de cadrage et surcouches), Node outpainting, Models selection, Manual controls et Last run review. Elle gère aussi les outils de balisage du marquage de parking (champ thumbnailLayer, nécessite l'éditeur du monde), le masquage des applications d'interface, la coupure de la conduite pendant les réglages et la restauration de l'état de la session à la fermeture de la fenêtre.
--- Accès : extension `util_screenshotCreator_ui` : `extensions.load("util_screenshotCreator_ui")`, puis la globale `util_screenshotCreator_ui`
---@class util_screenshotCreator_ui
---@field dependencies string[] Extensions chargées avant : ui_imgui, editor_main, core_camera, core_vehicles, core_gamestate, freeroam_freeroam et util_screenshotCreator_settings, job, lightingSetup, thumbnailConfig, framingManager, modelSelection, nodeOutpaint, shippedConfigs.
util_screenshotCreator_ui = {}

--- Hook appelé après rechargement avec l'état sérialisé ; restaure l'interface et migre d'anciens formats.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/ui.lua:833
---@param data table|nil État sérialisé.
function util_screenshotCreator_ui.onDeserialized(data) end

--- Hook de déchargement : exécute restoreSessionState (conduite, applications d'interface, résolution, environnement).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/ui.lua:158
function util_screenshotCreator_ui.onExtensionUnloaded() end

--- Hook de sérialisation avant rechargement : renvoie windowOpen, generateMissingThumbnailsOnly, reloadUIOnJobFinished, drivingEnabled, uiAppsVisible, cameraSpeed, runDone, reviewData, framingModeId, previousFov et isCameraSet.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/ui.lua:809
---@return table  État de l'interface.
function util_screenshotCreator_ui.onSerialize() end

--- Hook appelé à chaque frame : consomme l'indicateur de fin de travail, dessine les surcouches 3D et la fenêtre ImGui avec ses onglets, et met à jour le pinceau de nodeOutpaint. Quand la fenêtre est fermée, restaure l'état de la session une seule fois.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/ui.lua:687
function util_screenshotCreator_ui.onUpdate() end

--- Ouvre la fenêtre du créateur de captures (charge les réglages si nécessaire, initialise l'éditeur et applique l'environnement).
---Source : lua/ge/extensions/util/screenshotCreator/ui.lua:785
---@return boolean  false si util_screenshotCreator_settings n'a pas pu être chargé, sinon true.
function util_screenshotCreator_ui.openWindow() end

