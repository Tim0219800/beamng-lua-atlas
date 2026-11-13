---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/preview.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Partie « aperçu / relecture » du mode photo. Elle ajoute aux métadonnées d'une capture l'état complet du mode photo (caméra, scène, effets, rendu avancé, capture) et les presets, puis permet de rejouer une capture à partir de ces métadonnées : chargement du niveau si besoin, placement de la caméra libre, FOV et heure du jour. Elle sait aussi ouvrir l'URL de partage d'un aperçu dans le navigateur.
--- Accès : extension `ui_photomode_preview` : `extensions.load("ui_photomode_preview")`, puis la globale `ui_photomode_preview`
---@class ui_photomode_preview
---@field dependencies table<integer, string> Extensions chargées avant : ui_photomode_shared, _camera, _scene, _effects, _advancedRender, _capture, _presets.
ui_photomode_preview = {}

--- Complète la table de métadonnées d'une capture avec metadata.photomodeState (schemaVersion, camera, scene, effects, advancedRender, capture) et metadata.photomodePresets (bundle de presets). Ne fait rien si la session photo n'est pas active ou si metadata n'est pas une table.
---Source : lua/ge/extensions/ui/photomode/preview.lua:226
---@param metadata table Table modifiée en place.
function ui_photomode_preview.collectScreenshotMetadata(metadata) end

--- Appelée à chaque frame par la boucle du mode photo (hook de mise à jour) ; applique la lecture d'aperçu en attente (passage en caméra libre, setPosRot, setFOV, setTimeOfDay) quand les conditions sont réunies. Les arguments de temps ne sont pas utilisés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/photomode/preview.lua:286
---@param dtReal number Delta de temps réel (inutilisé).
---@param dtSim number Delta de temps simulé (inutilisé).
---@param dtRaw number Delta de temps brut (inutilisé).
function ui_photomode_preview.handleUpdate(dtReal, dtSim, dtRaw) end

--- Ouvre l'URL de partage d'un aperçu dans le navigateur web, si l'action media « preview.openShareUrl » est activée.
---Source : lua/ge/extensions/ui/photomode/preview.lua:195
---@param shareUrl string URL à ouvrir ; vide ou nil donne reason="share_url_missing".
---@return table  {ok=true} ou {ok=false, reason=...}.
function ui_photomode_preview.openPreviewShareUrl(shareUrl) end

--- Prépare la relecture d'une capture à partir de ses métadonnées. Exige une session photo active. Si le niveau est différent, déclenche immédiatement son chargement ; sinon met la charge utile en attente pour handleUpdate.
---Source : lua/ge/extensions/ui/photomode/preview.lua:241
---@param openMap table Métadonnées d'ouverture {level, camPos, camRot, fov, timeOfDay}.
---@return table  {ok=true, level=string, requiresGameStatePlay=true} ou {ok=false, reason=...}.
function ui_photomode_preview.playPreviewFromMetadata(openMap) end

