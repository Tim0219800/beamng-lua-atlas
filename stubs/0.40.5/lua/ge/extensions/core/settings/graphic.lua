---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/settings/graphic.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Réglages graphiques : mode d'affichage (fenêtre, plein écran, sans bordure), résolution, fréquence, pilote d'affichage, HDR, anti-crénelage, upscaling, groupes de qualité (maillages, textures, éclairage, ombres, terrain, nuages, reflets et rétroviseurs dynamiques, éclairage clustered), post-traitement (DOF, flou de mouvement, SSAO, SSR, ombres écran) et préréglages globaux (settingsPresets.json). Il fournit à core_settings_settings les « option helpers » (get/set) de ces réglages et applique l'état vidéo au Canvas. Un moddeur l'utilise surtout via core_settings_settings.setValue ; setPresetOverride permet d'imposer temporairement un préréglage.
--- Accès : extension `core_settings_graphic` : `extensions.load("core_settings_graphic")`, puis la globale `core_settings_graphic`
---@class core_settings_graphic
core_settings_graphic = {}

--- Applique au moteur le mode vidéo choisi : demande la sauvegarde, règle le périphérique d'affichage (GFXDevice.setDisplayDevice) et le mode vidéo (largeur, hauteur, fréquence, mode), applique le HDR, restaure la position de fenêtre, puis règle le mode de rendu (SingleMonitor ou MultiMonitor selon GraphicTripleMonitorEnabled et les FOV triple écran). Ignoré si déjà en cours, ou si le Canvas est absent (après la demande de sauvegarde).
---Source : lua/ge/extensions/core/settings/graphic.lua:263
function core_settings_graphic.applyGraphicsState() end

--- Prévu pour choisir automatiquement une qualité selon la mémoire vidéo ; entièrement commenté dans le code, donc inactif.
---Source : lua/ge/extensions/core/settings/graphic.lua:2032
function core_settings_graphic.autoDetectApplyGraphicsQuality() end

--- Construit et mémorise la table des options graphiques (get/set/getModes et éventuellement sanitize, init, onSettingsChanged par option). Appelée par core_settings_settings.initSettings.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/settings/graphic.lua:494
---@return table<string, table>  Helpers par nom de réglage.
function core_settings_graphic.buildOptionHelpers() end

--- Renvoie les informations d'affichage collectées au démarrage (GPU, écrans…) pour l'UI.
---Source : lua/ge/extensions/core/settings/graphic.lua:2117
---@return table  Informations d'affichage (structure déduite de gatherDisplayInformation).
function core_settings_graphic.getDisplayInformation() end

--- Renvoie un helper d'option précis ou toute la table des options graphiques.
---Source : lua/ge/extensions/core/settings/graphic.lua:2113
---@param optionName string|nil Nom de l'option (ex. 'GraphicDisplayModes'). nil = toute la table.
---@return table|nil  Helper de l'option, ou table complète.
function core_settings_graphic.getOptions(optionName) end

--- Renvoie la table des préréglages globaux lue dans lua/ge/extensions/core/settings/settingsPresets.json.
---Source : lua/ge/extensions/core/settings/graphic.lua:2179
---@return table<string, table>  Préréglages par nom.
function core_settings_graphic.getOverallQualityPresets() end

--- Renvoie l'override de préréglage actif.
---Source : lua/ge/extensions/core/settings/graphic.lua:2178
---@return table|nil  {name, enforce} ou nil.
function core_settings_graphic.getPresetOverride() end

--- Appelé par core_settings_settings.load : refreshGraphicsState(newState) puis applyGraphicsState().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/settings/graphic.lua:2014
---@param newState table<string, any> Réglages complets.
function core_settings_graphic.load(newState) end

--- Hook appelé à la fin de l'initialisation des réglages : si $forceFullscreen est vrai, force les réglages par défaut en plein écran ; affiche la fenêtre (canvas:showWindow), collecte les informations d'affichage et nettoie le type d'anti-crénelage. Sans effet si le Canvas n'existe pas.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/settings/graphic.lua:1880
function core_settings_graphic.onFirstUpdateSettings() end

--- Hook appelé par core_settings_settings.initSettings : appelle init(valeur) sur chaque option graphique qui en possède, avec la valeur lue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/settings/graphic.lua:1867
---@param data table<string, any> Valeurs lues des réglages.
function core_settings_graphic.onInitSettings(data) end

--- Appelé après chaque sauvegarde des réglages. Avec un override actif : ré-impose le préréglage si enforce, sinon ne fait rien. Sans override : relance GraphicPlatformPreset.onSettingsChanged et GraphicOverallQuality.onSettingsChanged.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/settings/graphic.lua:2156
function core_settings_graphic.onSettingsChanged() end

--- Hook de changement d'état de l'UI. À l'entrée dans 'menu.options.graphics', mémorise l'état d'affichage ; à la sortie, si les changements n'ont pas été appliqués, rétablit l'ancien mode, résolution et fréquence.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/settings/graphic.lua:1997
---@param toState string Nouvel état.
---@param fromState string Ancien état.
function core_settings_graphic.onUiChangedState(toState, fromState) end

--- Hook de mise à jour : décompte les minuteurs différés pour l'échelle de rendu (render scale) et le mode de sortie HDR, puis les applique à l'expiration.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/settings/graphic.lua:2083
---@param dtReal number|nil Durée réelle de l'image en secondes.
function core_settings_graphic.onUpdate(dtReal) end

--- Ouvre la fenêtre de debug « Coconut » du rendu (Engine.Render.setCoconutWindowOpen(true)). Sans effet dans un build shipping.
---Source : lua/ge/extensions/core/settings/graphic.lua:2022
function core_settings_graphic.openCoconutWindow() end

--- Corps vide : ne fait rien.
---Source : lua/ge/extensions/core/settings/graphic.lua:2019
function core_settings_graphic.openMonitorConfiguration() end

--- Synchronise l'état interne (mode, pilote, résolution, fréquence, placement de fenêtre) avec un nouvel état de réglages, nettoie les valeurs invalides (sanitize), notifie l'UI et émet le hook onDisplayModeChanged(ancienMode, nouveauMode) si le mode a changé. Un changement de WindowPlacement est sauvegardé tout de suite.
---Source : lua/ge/extensions/core/settings/graphic.lua:1904
---@param newState table<string, any> Réglages contenant GraphicDisplayDriver, GraphicDisplayModes, GraphicDisplayResolutions, GraphicDisplayRefreshRates, WindowPlacement (tous facultatifs).
function core_settings_graphic.refreshGraphicsState(newState) end

--- Impose un préréglage global sans modifier le choix GraphicOverallQuality sauvegardé. Passer nil libère l'override et restaure le préréglage sauvegardé. Avec enforce = true, les valeurs sont ré-imposées à chaque changement de réglages.
---Source : lua/ge/extensions/core/settings/graphic.lua:2148
---@param override {name: string, enforce: boolean}|nil name = nom d'un préréglage de settingsPresets.json.
---@return boolean  false si le préréglage est introuvable, sinon true.
function core_settings_graphic.setPresetOverride(override) end

--- Bascule plein écran/fenêtre sur le Canvas (canvas:toggleFullscreen) s'il existe.
---Source : lua/ge/extensions/core/settings/graphic.lua:2105
function core_settings_graphic.toggleFullscreen() end

