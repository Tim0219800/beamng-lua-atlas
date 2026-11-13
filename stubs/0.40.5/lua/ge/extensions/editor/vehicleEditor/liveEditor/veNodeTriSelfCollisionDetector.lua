---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/liveEditor/veNodeTriSelfCollisionDetector.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre 'Node Triangle Self Collision Detector' du Vehicle Editor live. Le bouton 'Start Analysis' teste, pour chaque triangle collidable, quels nœuds du véhicule passent à moins d'un rayon donné (0.025 à 0.1 m, 0.025 m étant le vrai rayon de collision) du triangle. Sont ignorés : triangles NONCOLLIDABLE, nœuds du triangle, nœuds sans collision ou sans selfCollision, nœuds de coupleurs ou avec couplerTag/tag, et nœuds de même premier groupe qu'un sommet du triangle. Les paires trouvées sont imprimées dans la console et dessinées (sphère orange, triangle vert, textes).
--- Accès : extension `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector` : `extensions.load("editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector")`, puis la globale `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector`
---@class editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector
---@field menuEntry string 'Node Triangle Self Collision Detector'.
editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector = {}

--- Restaure l'état d'ouverture et le rayon (data.nodeCollisionRadius).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veNodeTriSelfCollisionDetector.lua:213
---@param data table Table de onSerialize.
function editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.onDeserialized(data) end

--- Renvoie {windowOpen, nodeCollisionRadius, vehsResultData}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veNodeTriSelfCollisionDetector.lua:205
---@return table  État à restaurer.
function editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.onSerialize() end

--- Appelé chaque frame : dessine la fenêtre (curseur de rayon, boutons Start Analysis / Clear Results).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veNodeTriSelfCollisionDetector.lua:177
function editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.onUpdate() end

--- Hook de rendu émis par editor_veMain : dessine les résultats de l'analyse du véhicule courant (sphère du nœud, triangle, étiquettes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veNodeTriSelfCollisionDetector.lua:40
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulation (s).
---@param dtRaw number Delta temps brut (s).
function editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw) end

--- Ouvre la fenêtre.
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veNodeTriSelfCollisionDetector.lua:201
function editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.open() end

