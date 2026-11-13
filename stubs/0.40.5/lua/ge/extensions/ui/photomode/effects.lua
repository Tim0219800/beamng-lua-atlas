---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/effects.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Effets de post-traitement du mode photo : profondeur de champ (DOF, avec mise au point automatique), SSAO, occlusion spéculaire, ombres en espace écran, réflexions SSR, flou de mouvement, qualité des réflexions dynamiques et des rétroviseurs, visibilité des occupants, plus l'état du flash (délégué à ui_photomode_flash). Le module lit et écrit ces valeurs via les objets postFX de scenetree, les variables $DOFPostFx::* et les réglages graphiques, sauvegarde l'état de départ de la session (y compris sur disque avec ui_photomode_postFxPersistence) et le restaure à la fin.
--- Accès : extension `ui_photomode_effects` : `extensions.load("ui_photomode_effects")`, puis la globale `ui_photomode_effects`
---@class ui_photomode_effects
---@field dependencies string[] ui_photomode_shared, ui_photomode_postFxPersistence, ui_photomode_flash, core_settings_graphic
ui_photomode_effects = {}

--- Applique un preset d'effets, en totalité ou pour une partie (options.part), puis délègue la sous-table flash à ui_photomode_flash.applyPresetState.
---Source : lua/ge/extensions/ui/photomode/effects.lua:854
---@param state table État de preset
---@param options table|nil {part = nom de partie} (facultatif)
---@return table  {state} en cas de succès, sinon {ok = false, reason}
function ui_photomode_effects.applyPresetState(state, options) end

--- Sous-ensemble de l'état à écrire dans les métadonnées d'une photo : les 16 réglages d'effets plus flash.
---Source : lua/ge/extensions/ui/photomode/effects.lua:882
---@return table  Réglages
function ui_photomode_effects.buildMetadataState() end

--- Construit l'état d'affichage des effets (même fonction que le local buildEffectsState).
---Source : lua/ge/extensions/ui/photomode/effects.lua:406
---@return table  État avec valeurs, availability, defaults, sessionActive, flash
function ui_photomode_effects.buildState() end

--- État par défaut pour un preset (état de départ de la session, avec le flash par défaut), ou nil si l'état de départ n'a pas été capturé.
---Source : lua/ge/extensions/ui/photomode/effects.lua:798
---@return table|nil  Réglages initiaux
function ui_photomode_effects.captureDefaultPresetState() end

--- État à enregistrer dans un preset (identique à buildMetadataState).
---Source : lua/ge/extensions/ui/photomode/effects.lua:794
---@return table  Réglages
function ui_photomode_effects.capturePresetState() end

--- Capture l'état de départ de la session et le sauvegarde via ui_photomode_postFxPersistence.saveRestoreState (fusion avec la version persistée), pour restauration à la fin. Appelée au début d'une session du mode photo.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/photomode/effects.lua:420
function ui_photomode_effects.captureRestoreState() end

--- Lit directement les valeurs actuelles dans le moteur (objets postFX, variables $DOFPostFx::*, réglages graphiques) et les renvoie sous forme brute ; les valeurs illisibles valent nil.
---Source : lua/ge/extensions/ui/photomode/effects.lua:355
---@return table  État brut
function ui_photomode_effects.captureSerializableState() end

--- Renvoie l'état courant des effets (valeurs, availability, defaults, defaultsAvailable, sessionActive, flash) avec ok = session active, et reason = session_inactive sinon.
---Source : lua/ge/extensions/ui/photomode/effects.lua:785
---@return table  État d'affichage
function ui_photomode_effects.getEffectsState() end

--- Réapplique l'état capturé au début de la session, y compris le flash.
---Source : lua/ge/extensions/ui/photomode/effects.lua:755
---@return table  {ok, reason?, state?}
function ui_photomode_effects.resetEffectsToDefaults() end

--- Restaure l'état de départ (relu depuis la persistance si elle a réussi, sinon depuis la mémoire) : d'abord les effets hors DOF, puis le DOF. Appelée à la fin d'une session.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/photomode/effects.lua:707
function ui_photomode_effects.restoreState() end

--- Applique un patch partiel d'effets : dofEnabled, dofAutofocus, dofMaxBlurNear, dofMaxBlurFar, dofFocusRange, dofAperture, dofFalloffSharpness, ssaoQualityMode (alias ssaoQuality, ssaoSamples, ssaoEnabled), screenSpaceShadowsEnabled, specularOcclusionEnabled, ssrQualityMode, motionBlurEnabled, motionBlurStrength, reflectionQualityMode, mirrorsQualityMode, occupantsVisible. Valeurs numériques bornées, modes validés. S'arrête à la première erreur (les champs déjà appliqués restent appliqués).
---Source : lua/ge/extensions/ui/photomode/effects.lua:726
---@param partialState table Champs à modifier
---@return table  {ok, reason?, state}
function ui_photomode_effects.setEffectsState(partialState) end

