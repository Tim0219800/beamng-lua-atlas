---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dragRaceEditor/lanes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère la liste des voies (lanes) du drag race dans l'éditeur : chargement depuis gameplay_drag_saveSystem, sélection, ajout, suppression, sauvegarde en fichier <id>.lane.json dans le dossier drag du niveau, et dessin de l'interface ImGui (liste et détails : ID, noms, couleur, ordre, boundaryId).
--- Accès : extension `editor_dragRaceEditor_lanes` : `extensions.load("editor_dragRaceEditor_lanes")`, puis la globale `editor_dragRaceEditor_lanes`
---@class editor_dragRaceEditor_lanes
editor_dragRaceEditor_lanes = {}

--- Ajoute une voie « New Lane » (couleur blue, laneOrder suivant, waypointIds vide, metadata created/modified), la sélectionne et marque des modifications non sauvées.
---Source : lua/ge/extensions/editor/dragRaceEditor/lanes.lua:49
function editor_dragRaceEditor_lanes.addLane() end

--- Dessine en debug une boîte pleine (triangles colorés et arêtes noires) à partir d'un coin et de trois vecteurs d'axes.
---Source : lua/ge/extensions/editor/dragRaceEditor/lanes.lua:245
---@param corner vec3 coin de la boîte
---@param x vec3 premier vecteur d'arête
---@param y vec3 deuxième vecteur d'arête
---@param z vec3 troisième vecteur d'arête
---@param clr ColorF couleur de remplissage
function editor_dragRaceEditor_lanes.drawAxisBox(corner, x, y, z, clr) end

--- Dessine le panneau ImGui des détails de la voie sélectionnée (Basics, Waypoints, Boundary) ; les champs modifient la voie et marquent des changements non sauvés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dragRaceEditor/lanes.lua:146
function editor_dragRaceEditor_lanes.drawLaneDetails() end

--- Dessine le panneau ImGui de la liste des voies (boutons Add Lane, Remove, Save, liste sélectionnable avec infobulle).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dragRaceEditor/lanes.lua:97
function editor_dragRaceEditor_lanes.drawLanesSection() end

--- Affiche en debug 3D le texte « Lane: <nom> » à l'origine pour la voie sélectionnée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dragRaceEditor/lanes.lua:238
function editor_dragRaceEditor_lanes.drawTransformsPreview() end

--- Renvoie la liste des voies chargées.
---Source : lua/ge/extensions/editor/dragRaceEditor/lanes.lua:22
---@return table  tableau de voies
function editor_dragRaceEditor_lanes.getAllLanes() end

--- Renvoie la voie sélectionnée.
---Source : lua/ge/extensions/editor/dragRaceEditor/lanes.lua:34
---@return table|nil  voie ou nil si l'index est hors bornes
function editor_dragRaceEditor_lanes.getSelectedLane() end

--- Index (base 1) de la voie sélectionnée, -1 si aucune.
---Source : lua/ge/extensions/editor/dragRaceEditor/lanes.lua:26
---@return integer  index
function editor_dragRaceEditor_lanes.getSelectedLaneIndex() end

--- Charge toutes les voies via dragSaveSystem.getAllLanes().
---Source : lua/ge/extensions/editor/dragRaceEditor/lanes.lua:17
function editor_dragRaceEditor_lanes.loadAllLanes() end

--- Supprime la voie sélectionnée et déplace la sélection sur la précédente ; -1 si la liste devient vide.
---Source : lua/ge/extensions/editor/dragRaceEditor/lanes.lua:70
function editor_dragRaceEditor_lanes.removeSelectedLane() end

--- Sauvegarde la voie dans <dossier drag du niveau>/<lane.id>.lane.json via dragSaveSystem.saveLane.
---Source : lua/ge/extensions/editor/dragRaceEditor/lanes.lua:84
---@param lane table voie à sauver
---@return boolean  false si pas de voie ou aucun niveau chargé, sinon le résultat de dragSaveSystem.saveLane
function editor_dragRaceEditor_lanes.saveLane(lane) end

--- Sélectionne la voie d'index donné et journalise son nom.
---Source : lua/ge/extensions/editor/dragRaceEditor/lanes.lua:41
---@param index integer index base 1
function editor_dragRaceEditor_lanes.selectLane(index) end

--- Fixe l'index sélectionné sans journaliser.
---Source : lua/ge/extensions/editor/dragRaceEditor/lanes.lua:30
---@param index integer index base 1, -1 pour aucune
function editor_dragRaceEditor_lanes.setSelectedLaneIndex(index) end

