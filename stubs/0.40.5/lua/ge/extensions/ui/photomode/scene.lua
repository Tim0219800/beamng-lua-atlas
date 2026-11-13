---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/scene.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Onglet « scène » du mode photo : lit et modifie l'environnement du niveau (heure du jour, date, nuages, brouillard, vent, décalage du nord, affichages célestes et météores) via core_environment et core_celestial. Il gère aussi la sauvegarde/restauration de l'état d'origine à l'ouverture/fermeture de la session, un bookmark d'environnement, et les presets de type « scene » (qui incluent une partie advancedRender gérée par ui_photomode_advancedRender).
--- Accès : extension `ui_photomode_scene` : `extensions.load("ui_photomode_scene")`, puis la globale `ui_photomode_scene`
---@class ui_photomode_scene
---@field dependencies table<integer, string> Extensions chargées avant : ui_photomode_shared, ui_photomode_advancedRender, core_celestial.
ui_photomode_scene = {}

--- Applique un preset de scène (heure, météo, nord, éléments célestes) puis sa partie advancedRender. S'arrête au premier échec.
---Source : lua/ge/extensions/ui/photomode/scene.lua:822
---@param state table Preset {scene=..., advancedRender=...}.
---@param options table|nil options.part : all, environment, shadows, detailTerrain, weather, celestial.
---@return table  {state=...} ou {ok=false, reason}.
function ui_photomode_scene.applyPresetState(state, options) end

--- Renvoie la partie scène à inclure dans les métadonnées d'une capture : time, play, year, month, day, cloudCover, fogDensity, fogAtmosphereHeight, windSpeed, cloudWindDirection, groundWind, northOverride, celestial.
---Source : lua/ge/extensions/ui/photomode/scene.lua:852
---@return table  État de scène pour métadonnées.
function ui_photomode_scene.buildMetadataState() end

--- Construit l'état de scène courant (valeurs bornées aux limites) à partir de core_environment et core_celestial, avec la table availability indiquant quels éléments sont lisibles.
---Source : lua/ge/extensions/ui/photomode/scene.lua:274
---@return table  État de scène (voir getSceneState).
function ui_photomode_scene.buildState() end

--- Capture l'état par défaut de la session (état de scène restauré ou courant + rendu avancé par défaut). Renvoie nil si aucun des deux n'est disponible.
---Source : lua/ge/extensions/ui/photomode/scene.lua:812
---@return table|nil  Données de preset combinées.
function ui_photomode_scene.captureDefaultPresetState() end

--- Capture l'état courant sous forme de preset : {scene={...}, advancedRender=...} (advancedRender vient de ui_photomode_advancedRender.buildMetadataState).
---Source : lua/ge/extensions/ui/photomode/scene.lua:808
---@return table  Données de preset combinées.
function ui_photomode_scene.capturePresetState() end

--- Mémorise dans S.sessionSceneRestoreState l'état de scène d'origine pour le restaurer à la fin de la session. Appelée au début de la session photo.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/photomode/scene.lua:296
function ui_photomode_scene.captureRestoreState() end

--- Lit l'état brut de scène : time, play, year, month, day, cloudCover, fogDensity, fogAtmosphereHeight, windSpeed, cloudWindDirection, groundWind (vecteurs {x,y,z}), northOverride, celestial ({meteor, display}). Les valeurs indisponibles valent nil.
---Source : lua/ge/extensions/ui/photomode/scene.lua:145
---@return table  État brut sérialisable.
function ui_photomode_scene.captureSerializableState() end

--- Renvoie l'état de scène courant (buildState) avec ok = session active ; reason="session_inactive" sinon.
---Source : lua/ge/extensions/ui/photomode/scene.lua:670
---@return table  État de scène : sessionActive, bookmarkAvailable, availability, time, play, year, month, day, cloudCover, fogDensity, fogAtmosphereHeight, windSpeed, cloudWindDirection, groundWind, northOverride, celestial, plus ok/reason.
function ui_photomode_scene.getSceneState() end

--- Réapplique le bookmark d'environnement mémorisé (heure, météo, nord, éléments célestes). Exige une session active et un bookmark.
---Source : lua/ge/extensions/ui/photomode/scene.lua:609
---@return table  {ok=true, state} ou {ok=false, reason, state?}.
function ui_photomode_scene.loadEnvironmentBookmark() end

--- Journalise (niveau debug) l'heure du jour sous la forme {time, play, dayLength} avec un libellé. Voir la note sur le bug isDebugEnabled.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/photomode/scene.lua:214
---@param label string Préfixe du message.
---@param sceneState table État à afficher.
function ui_photomode_scene.logTimeOfDayDebug(label, sceneState) end

--- Restaure l'état de scène sauvegardé par captureRestoreState (heure, environnement, nord, éléments célestes) puis l'efface. Appelée à la fin de la session photo ; ne fait rien s'il n'y a rien à restaurer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/photomode/scene.lua:478
function ui_photomode_scene.restoreState() end

--- Mémorise l'état d'environnement courant dans S.savedEnvironmentBookmark. Exige une session active.
---Source : lua/ge/extensions/ui/photomode/scene.lua:588
---@return table  {ok=true, state} ou {ok=false, reason}.
function ui_photomode_scene.saveEnvironmentBookmark() end

--- Applique un patch partiel de scène (heure, météo, nord) pendant une session photo et renvoie le nouvel état. Échoue avec scene_patch_empty si rien n'a été appliqué.
---Source : lua/ge/extensions/ui/photomode/scene.lua:523
---@param partialState table Champs possibles : time (0..1), play (booléen, avec time), year, month, day, cloudCover, fogDensity, fogAtmosphereHeight, northOverride (degrés), __lerpSeconds (secondes de transition).
---@return table  {ok=true, state=...} ou {ok=false, reason=..., state?=...}.
function ui_photomode_scene.setSceneState(partialState) end

