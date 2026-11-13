---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/crawlEditor/boundaries.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance de l'outil frontières, créée par le constructeur renvoyé par le module. Champs principaux : crawlEditor, boundary (zone en cours d'édition), currentVertices (sommets sélectionnés), currentPlane (plan de hauteur sélectionné), snapToTerrain, fields (tampons imgui des champs personnalisés).
---@class editor_crawlEditor_boundaries
local editor_crawlEditor_boundaries = {}

--- Début de manipulation du gizmo : mémorise la position du gizmo, celles des sommets sélectionnés et la rotation du plan.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:506
function editor_crawlEditor_boundaries:beginDrag() end

--- Vide la sélection de sommets et de plan.
---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:113
function editor_crawlEditor_boundaries:clearSelection() end

--- Pendant la manipulation : translate (avec snap terrain) ou fait tourner autour du centroïde les sommets sélectionnés, ou déplace/oriente le plan sélectionné, puis recalcule la zone (processVertices).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:519
function editor_crawlEditor_boundaries:dragging() end

--- Appelée à chaque frame : met à jour le gizmo d'axes (begin/end/dragging), le dessine, traite l'entrée souris et met à jour sa transformation.
---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:625
---@param mouseInfo table Table de souris
function editor_crawlEditor_boundaries:draw(mouseInfo) end

--- Dessine la liste des frontières avec le bouton « Add Boundary » et un menu contextuel (clic droit) « Delete ». Remplit selection.index et selection.clicked.
---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:118
---@param allBoundaries table Liste des frontières, modifiée en place
---@param selection table Table avec index (1 = première) et clicked
function editor_crawlEditor_boundaries:drawBoundariesList(allBoundaries, selection) end

--- Dessine le panneau de détail d'une frontière : Goto, statistiques, nom, nom de fichier, sommets, Auto Planes, High Res Fence, Create Decal Road, limites haute/basse, position de souris, champs personnalisés.
---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:158
---@param boundary table Frontière à afficher
function editor_crawlEditor_boundaries:drawBoundaryDetail(boundary) end

--- Dessine le détail de la frontière courante, ou « No boundary selected ».
---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:640
function editor_crawlEditor_boundaries:drawBoundaryEditor() end

--- Dessine l'éditeur de champs personnalisés (string, number, vec3 avec repère 3D) avec boutons X, New String, New Number, Copy Fields et Paste Fields.
---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:649
---@param fields table Objet customFields de la frontière (names, types, values, add, remove, onSerialize…)
function editor_crawlEditor_boundaries:drawCustomFields(fields) end

--- Pose un point sur la hauteur du terrain.
---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:586
---@param pos vec3 Position
---@return vec3  Copie de la position avec z du terrain
---@return boolean  true si core_terrain est disponible
function editor_crawlEditor_boundaries:dropToTerrain(pos) end

--- Fin de manipulation : re-snap au terrain, enregistre l'action « Manipulate Boundary Vertices » dans l'historique, marque la frontière modifiée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:595
function editor_crawlEditor_boundaries:endDragging() end

--- Dessine des sphères sur les points donnés (orange si sélectionnés) et renvoie le plus proche de la caméra dont le rayon de souris passe dans la sphère.
---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:378
---@param mouseInfo table Table de crawlEditor/input (camPos, rayDir…)
---@param objects table Liste d'éléments {pos, index|orig, radius}
---@return table|nil  Élément touché, ou nil
function editor_crawlEditor_boundaries:findVert(mouseInfo, objects) end

--- Crée une nouvelle zone vide nommée « New Boundary » via gameplay/sites/zone.
---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:374
---@return table  Nouvelle zone
function editor_crawlEditor_boundaries:getNewBoundary() end

--- Initialise l'instance (appelé par le constructeur).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:88
---@param crawlEditorParam table Instance/module crawlEditor parent
function editor_crawlEditor_boundaries:init(crawlEditorParam) end

--- Traite l'entrée souris : Shift = ajout de sommet, Alt = insertion, sinon sélection (Ctrl = multiple) des sommets.
---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:436
---@param mouseInfo table Table de souris
function editor_crawlEditor_boundaries:input(mouseInfo) end

--- Définit la frontière éditée.
---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:109
---@param boundaryParam table|nil Zone à éditer
function editor_crawlEditor_boundaries:setBoundary(boundaryParam) end

--- Recopie le nom et le nom de fichier de la frontière dans les tampons de saisie imgui.
---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:102
---@param boundary table Frontière (zone)
function editor_crawlEditor_boundaries:setFields(boundary) end

--- Cherche un clic sur le milieu d'une arête (Alt maintenu) et, si trouvé, insère un sommet via l'historique (« Insert Boundary Vertex »).
---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:413
---@param mouseInfo table Table de souris
function editor_crawlEditor_boundaries:tryInsert(mouseInfo) end

--- Place le gizmo d'axes au centroïde des sommets sélectionnés, ou sur le plan de hauteur sélectionné (orienté selon l'alignement local/global).
---Source : lua/ge/extensions/editor/crawlEditor/boundaries.lua:478
function editor_crawlEditor_boundaries:updateTransform() end

