---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/previewChecker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance du panneau. Champs : missionEditor, mission, previewFile, previewFound, previewImage, thumbFile, thumbFound, thumbImage (objets texObj de ui/imguiUtils).
---@class editor_missionEditor_previewChecker
local editor_missionEditor_previewChecker = {}

--- Détermine les fichiers d'aperçu et de vignette (mission.previewFile / thumbnailFile ou gameplay_missions_missions.getMissionPreviewFilepath / getThumbnailFilepath), indique s'ils sont trouvés et charge leurs textures.
---Source : lua/ge/extensions/editor/missionEditor/previewChecker.lua:19
function editor_missionEditor_previewChecker:checkPreview() end

--- Dessine les icônes d'état, les aperçus au survol, le bouton d'ouverture du dossier de la mission et la case « Always show Preview ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/previewChecker.lua:64
function editor_missionEditor_previewChecker:draw() end

--- Appelle setMission(m) puis renvoie les problèmes : fichier manquant (error), dimensions ou poids hors limites (warning).
---Source : lua/ge/extensions/editor/missionEditor/previewChecker.lua:31
---@param m table Mission à vérifier.
---@return table[]  Liste d'éléments {label, severity}.
function editor_missionEditor_previewChecker:getMissionIssues(m) end

--- Constructeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/previewChecker.lua:8
---@param missionEditor table Module principal editor_missionEditor.
function editor_missionEditor_previewChecker:init(missionEditor) end

--- Définit la mission courante et relance checkPreview.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/previewChecker.lua:12
---@param mission table Mission courante.
function editor_missionEditor_previewChecker:setMission(mission) end

