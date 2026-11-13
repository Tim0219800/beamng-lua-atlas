---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/crashCamModeLoader.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit chargeur qui charge ou décharge l'extension freeroam_crashCamMode (caméra de ralenti après un crash) selon le réglage enableCrashCam. Il évite de laisser la caméra de crash active quand le joueur la désactive dans les options.
--- Accès : extension `freeroam_crashCamModeLoader` : `extensions.load("freeroam_crashCamModeLoader")`, puis la globale `freeroam_crashCamModeLoader`
---@class freeroam_crashCamModeLoader
freeroam_crashCamModeLoader = {}

--- Hook appelé au chargement de l'extension : charge freeroam_crashCamMode si le réglage enableCrashCam est vrai.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/crashCamModeLoader.lua:15
function freeroam_crashCamModeLoader.onExtensionLoaded() end

--- Hook appelé quand les réglages changent : charge freeroam_crashCamMode si enableCrashCam est vrai, sinon la décharge si elle est chargée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/crashCamModeLoader.lua:7
function freeroam_crashCamModeLoader.onSettingsChanged() end

