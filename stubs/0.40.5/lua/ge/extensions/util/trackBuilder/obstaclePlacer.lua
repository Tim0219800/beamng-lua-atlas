---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/obstaclePlacer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Place les obstacles d'une piste du Track Builder. Les obstacles à forme prédéfinie (sharp1, sharp2, obstacle1, obstacle2 : fichiers .dae du niveau GridMap) sont des objets TSStatic réutilisés et redimensionnés dynamiquement. Les obstacles procéduraux (ring, cube, cylinder, cone, bump, ramp) sont des ProceduralMesh créés par proceduralPrimitives, un ou plusieurs par segment.
--- Accès : extension `util_trackBuilder_obstaclePlacer` : `extensions.load("util_trackBuilder_obstaclePlacer")`, puis la globale `util_trackBuilder_obstaclePlacer`
---@class util_trackBuilder_obstaclePlacer
util_trackBuilder_obstaclePlacer = {}

--- Oublie les TSStatic d'obstacles mémorisés (vide les listes sans supprimer les objets de la scène). À appeler quand la scène est vidée.
---Source : lua/ge/extensions/util/trackBuilder/obstaclePlacer.lua:172
function util_trackBuilder_obstaclePlacer.clearReferences() end

--- Place tous les obstacles prédéfinis de la piste (en créant ou supprimant des TSStatic selon le besoin), puis appelle placeProceduralObstacles pour chaque segment.
---Source : lua/ge/extensions/util/trackBuilder/obstaclePlacer.lua:135
---@param track table[] Liste ordonnée de segments/pièces avec leurs champs obstacles, points, markerInfo, startLength, endLength.
function util_trackBuilder_obstaclePlacer.placeObstacles(track) end

--- Crée, ajuste ou supprime les ProceduralMesh d'obstacles d'un segment, génère leur mesh selon le type (ring, cube, cylinder, cone, bump, ramp), les positionne et les oriente. Ne fait rien si segment.obstaclesChanged est faux.
---Source : lua/ge/extensions/util/trackBuilder/obstaclePlacer.lua:72
---@param segment table Segment avec obstacles, obstaclesChanged, index, procObstacles, procObstacleIndexes.
function util_trackBuilder_obstaclePlacer.placeProceduralObstacles(segment) end

