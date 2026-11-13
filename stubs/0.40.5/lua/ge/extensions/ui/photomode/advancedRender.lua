---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/advancedRender.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Réglages de rendu avancé du mode photo : finesse des détails (detailAdjust), échelle LOD du terrain, densité d'herbe, qualité des ombres, ombres des véhicules, « last split casters » et qualité des nuages. Le module lit et écrit ces valeurs dans les réglages graphiques et les variables du moteur (via ui_photomode_shared), mémorise l'état initial de la session pour pouvoir le restaurer, et gère un signet (bookmark) de réglages. Il sert de backend au panneau « rendu avancé » du mode photo et aux presets.
--- Accès : extension `ui_photomode_advancedRender` : `extensions.load("ui_photomode_advancedRender")`, puis la globale `ui_photomode_advancedRender`
---@class ui_photomode_advancedRender
---@field dependencies string[] {"ui_photomode_shared", "core_settings_graphic"}
ui_photomode_advancedRender = {}

--- Applique un preset (patch partiel). Un état non table est traité comme un patch vide, ce qui renvoie une erreur advanced_render_patch_empty.
---Source : lua/ge/extensions/ui/photomode/advancedRender.lua:589
---@param state table État de preset
---@return table  {state} en cas de succès, sinon {ok = false, reason}
function ui_photomode_advancedRender.applyPresetState(state) end

--- Sous-ensemble de l'état à écrire dans les métadonnées d'une photo : les sept réglages sans les champs d'interface.
---Source : lua/ge/extensions/ui/photomode/advancedRender.lua:602
---@return table  Réglages seuls
function ui_photomode_advancedRender.buildMetadataState() end

--- Construit l'état d'affichage du rendu avancé (même fonction que le local buildAdvancedRenderState).
---Source : lua/ge/extensions/ui/photomode/advancedRender.lua:254
---@return table  État avec valeurs, availability, defaults, sessionActive, bookmarkAvailable
function ui_photomode_advancedRender.buildState() end

--- État par défaut pour un preset : l'état de départ de la session, ou nil s'il n'a pas été capturé.
---Source : lua/ge/extensions/ui/photomode/advancedRender.lua:581
---@return table|nil  Réglages initiaux
function ui_photomode_advancedRender.captureDefaultPresetState() end

--- État à enregistrer dans un preset (identique à buildMetadataState).
---Source : lua/ge/extensions/ui/photomode/advancedRender.lua:577
---@return table  Réglages
function ui_photomode_advancedRender.capturePresetState() end

--- Capture l'état de départ de la session pour une restauration ultérieure. Appelée au début d'une session du mode photo.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/photomode/advancedRender.lua:267
function ui_photomode_advancedRender.captureRestoreState() end

--- Renvoie l'état courant (valeurs, availability, defaults, sessionActive, bookmarkAvailable) avec ok (session active et réglage activé) et reason (advanced_render_disabled ou session_inactive).
---Source : lua/ge/extensions/ui/photomode/advancedRender.lua:548
---@return table  État d'affichage
function ui_photomode_advancedRender.getAdvancedRenderState() end

--- Indique si le rendu avancé est activé par défaut : true quand le jeu n'est pas un build shipping.
---Source : lua/ge/extensions/ui/photomode/advancedRender.lua:60
---@return boolean  activé par défaut
function ui_photomode_advancedRender.getDefaultEnabled() end

--- Renvoie l'activation effective : la surcharge posée par setAdvancedRenderTuningEnabled si elle existe, sinon getDefaultEnabled().
---Source : lua/ge/extensions/ui/photomode/advancedRender.lua:68
---@return boolean  réglage actif
function ui_photomode_advancedRender.isTuningEnabled() end

--- Indique si l'UI doit proposer le déverrouillage du rendu avancé : true seulement en build shipping.
---Source : lua/ge/extensions/ui/photomode/advancedRender.lua:64
---@return boolean  déverrouillage visible
function ui_photomode_advancedRender.isUnlockVisible() end

--- Réapplique le signet enregistré.
---Source : lua/ge/extensions/ui/photomode/advancedRender.lua:513
---@return table  {ok, reason?, state?}
function ui_photomode_advancedRender.loadAdvancedRenderBookmark() end

--- Remet les réglages à l'état capturé au début de la session.
---Source : lua/ge/extensions/ui/photomode/advancedRender.lua:450
---@return table  {ok, reason?, state?}
function ui_photomode_advancedRender.resetAdvancedRenderToDefaults() end

--- Restaure l'état capturé au début de la session, puis l'oublie. Appelée à la fin de la session.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/photomode/advancedRender.lua:401
function ui_photomode_advancedRender.restoreState() end

--- Mémorise l'état actuel comme signet de session.
---Source : lua/ge/extensions/ui/photomode/advancedRender.lua:486
---@return table  {ok, reason?, state?}
function ui_photomode_advancedRender.saveAdvancedRenderBookmark() end

--- Applique un patch partiel des réglages (detailAdjust, terrainLodScale, grassDensity, shadowsQualityMode, lastSplitCastersEnabled, vehicleShadowEnabled, cloudQualityMode). Les nombres sont bornés, les modes validés.
---Source : lua/ge/extensions/ui/photomode/advancedRender.lua:415
---@param partialState table Champs à modifier
---@return table  {ok, reason?, state?}
function ui_photomode_advancedRender.setAdvancedRenderState(partialState) end

--- Active ou désactive le réglage avancé (surcharge de session). Renvoie aussi les capacités du mode photo et, si activé pendant une session, l'état courant.
---Source : lua/ge/extensions/ui/photomode/advancedRender.lua:559
---@param value boolean true par défaut si la valeur n'est pas un booléen reconnu (déduit du code)
---@return table  {ok = true, enabled, capabilities, state?}
function ui_photomode_advancedRender.setAdvancedRenderTuningEnabled(value) end

