---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/multiTrackMerger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Construit le mesh de raccord (intersection) entre plusieurs segments de piste du Track Builder qui se rejoignent à un même point. Il prend l'extrémité de chaque segment, relie les extrémités consécutives par des courbes de Bézier (bords), génère pour chacune une pseudo-segment (centre 'halfRegular' + bordure) à l'aide de basicCenters et basicBorders, ajoute un remplissage central s'il y a plus de deux segments, puis crée un objet ProceduralMesh dans MissionGroup.
--- Accès : extension `util_trackBuilder_multiTrackMerger` : `extensions.load("util_trackBuilder_multiTrackMerger")`, puis la globale `util_trackBuilder_multiTrackMerger`
---@class util_trackBuilder_multiTrackMerger
util_trackBuilder_multiTrackMerger = {}

--- Crée l'objet ProceduralMesh qui raccorde les segments donnés. Matériaux par défaut : 'track_editor_A_center', 'track_editor_A_border', bordure 'regular'.
---Source : lua/ge/extensions/util/trackBuilder/multiTrackMerger.lua:352
---@param segments table[] Liste d'entrées {segment, reverse, index, sub} décrivant les extrémités à raccorder.
---@param centerMat string|nil Matériau du centre.
---@param borderMat string|nil Matériau de la bordure.
---@param borderMesh string|nil Nom du profil de bordure (voir basicBorders).
---@return userdata  L'objet ProceduralMesh créé.
function util_trackBuilder_multiTrackMerger.mergeMultiTrack(segments, centerMat, borderMat, borderMesh) end

--- Change les matériaux d'un raccord déjà créé : un matériau de centre par segment, un de bordure par segment, et le matériau de remplissage s'il y a plus de deux segments.
---Source : lua/ge/extensions/util/trackBuilder/multiTrackMerger.lua:338
---@param intersection table Table contenant .segments (liste) et .obj (le ProceduralMesh renvoyé par mergeMultiTrack).
---@param centerMat string|nil Matériau du centre ; ignoré si nil.
---@param borderMat string|nil Matériau de la bordure ; ignoré si nil.
function util_trackBuilder_multiTrackMerger.setMaterials(intersection, centerMat, borderMat) end

--- Enregistre les modules dont ce fichier dépend.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/trackBuilder/multiTrackMerger.lua:360
---@param list table Table {basicCenters = module, basicBorders = module}.
function util_trackBuilder_multiTrackMerger.setReferences(list) end

