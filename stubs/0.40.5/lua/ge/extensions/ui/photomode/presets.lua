---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/presets.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestion des presets du mode photo, de trois types : camera, scene et effects. Chaque type est stocké dans un fichier JSON sous settings/photomode/presets/ (camera.json, scene.json, effects.json) ; l'état est capturé ou appliqué par les modules ui_photomode_camera, _scene et _effects. Le module gère aussi un preset temporaire « Defaults » (état capturé au début de la session) et les presets temporaires fournis par ces modules.
--- Accès : extension `ui_photomode_presets` : `extensions.load("ui_photomode_presets")`, puis la globale `ui_photomode_presets`
---@class ui_photomode_presets
---@field dependencies table<integer, string> Extensions chargées avant : ui_photomode_camera, ui_photomode_scene, ui_photomode_effects.
ui_photomode_presets = {}

--- Applique un preset par identifiant (défaut, temporaire ou du fichier) via applyPresetState du module concerné.
---Source : lua/ge/extensions/ui/photomode/presets.lua:275
---@param presetType string "camera", "scene" ou "effects".
---@param presetId string Identifiant du preset, ou "__defaults".
---@param options table|nil Options transmises à applyPresetState ({} par défaut).
---@return table  {preset, state} ou {ok=false, reason}.
function ui_photomode_presets.applyPreset(presetType, presetId, options) end

--- Applique directement une charge utile de preset (par exemple importée depuis les métadonnées d'une capture), sans passer par le stockage.
---Source : lua/ge/extensions/ui/photomode/presets.lua:398
---@param presetType string "camera", "scene" ou "effects".
---@param payload table Table de preset ; si elle contient un champ data, c'est lui qui est appliqué, sinon la table entière.
---@return table  {state} ou {ok=false, reason}.
function ui_photomode_presets.applyPresetPayload(presetType, payload) end

--- Capture, pour chaque type de preset, l'état par défaut courant (captureDefaultPresetState du module concerné). Sert de contenu au preset « Defaults ». À appeler au début d'une session photo.
---Source : lua/ge/extensions/ui/photomode/presets.lua:129
function ui_photomode_presets.captureSessionDefaultPresets() end

--- Supprime un preset du fichier ; pour le preset par défaut ou un preset temporaire, le masque seulement.
---Source : lua/ge/extensions/ui/photomode/presets.lua:320
---@param presetType string "camera", "scene" ou "effects".
---@param presetId string Identifiant du preset.
---@return table  {presets} (liste à jour) ou {ok=false, reason}.
function ui_photomode_presets.deletePreset(presetType, presetId) end

--- Active l'inclusion des presets temporaires du module (getTemporaryPresetList) pour ce type, puis renvoie la liste complète.
---Source : lua/ge/extensions/ui/photomode/presets.lua:228
---@param presetType string "camera", "scene" ou "effects".
---@return table  {presets=table[]} ou {ok=false, reason, presets={}}.
function ui_photomode_presets.discoverTemporaryPresets(presetType) end

--- Capture l'état courant des trois modules sous forme de bundle destiné aux métadonnées d'une capture d'écran.
---Source : lua/ge/extensions/ui/photomode/presets.lua:462
---@return table  {schemaVersion=1, camera={version,type,data}, scene={...}, effects={...}}.
function ui_photomode_presets.getScreenshotPresetBundle() end

--- Liste les presets d'un type : le preset par défaut (s'il n'est pas masqué), les presets temporaires déjà découverts, puis ceux du fichier disponibles dans le niveau courant.
---Source : lua/ge/extensions/ui/photomode/presets.lua:213
---@param presetType string "camera", "scene" ou "effects".
---@return table  {presets=table[]} ou {ok=false, reason, presets={}}.
function ui_photomode_presets.listPresets(presetType) end

--- Renomme un preset enregistré dans le fichier et met à jour updatedAt.
---Source : lua/ge/extensions/ui/photomode/presets.lua:373
---@param presetType string "camera", "scene" ou "effects".
---@param presetId string Identifiant du preset.
---@param name string Nouveau nom.
---@return table  {preset, presets} ou {ok=false, reason}.
function ui_photomode_presets.renamePreset(presetType, presetId, name) end

--- Réinitialise l'état temporaire : presets découverts, presets masqués et états par défaut capturés de la session.
---Source : lua/ge/extensions/ui/photomode/presets.lua:58
function ui_photomode_presets.resetTemporaryPresets() end

--- Capture l'état courant du module du type donné (capturePresetState) et l'enregistre comme nouveau preset en tête du fichier.
---Source : lua/ge/extensions/ui/photomode/presets.lua:245
---@param presetType string "camera", "scene" ou "effects".
---@param name string Nom du preset.
---@param options table|nil Options passées à capturePresetState ({} par défaut).
---@return table  {preset, presets} ou {ok=false, reason}.
function ui_photomode_presets.saveCurrentPreset(presetType, name, options) end

--- Enregistre un bundle de presets : pour chacun de camera, scene, effects présent dans le bundle, appelle savePresetPayload avec le nom « <préfixe> <type> ». S'arrête au premier échec.
---Source : lua/ge/extensions/ui/photomode/presets.lua:436
---@param bundle table Table {camera=..., scene=..., effects=...}.
---@param namePrefix string Préfixe des noms.
---@param origin any Provenance transmise à chaque preset.
---@return table  {imported={camera=preset, scene=preset, effects=preset}} ou {ok=false, reason}.
function ui_photomode_presets.savePresetBundle(bundle, namePrefix, origin) end

--- Enregistre une charge utile fournie (sans capture de l'état courant) comme nouveau preset en tête du fichier.
---Source : lua/ge/extensions/ui/photomode/presets.lua:415
---@param presetType string "camera", "scene" ou "effects".
---@param name string Nom du preset.
---@param payload table Données du preset (champ data ou table entière).
---@param origin any Provenance stockée dans le champ origin du preset (déduit du code).
---@return table  {preset, presets} ou {ok=false, reason}.
function ui_photomode_presets.savePresetPayload(presetType, name, payload, origin) end

