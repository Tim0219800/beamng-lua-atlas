---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/crawlEditor/paths.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance de l'outil chemins. Champs principaux : crawlEditor, path (chemin édité), selectedPathnodeIndex (-1 = aucun), currentPathnode, snapToTerrain (true par défaut), _isDragging.
---@class editor_crawlEditor_paths
local editor_crawlEditor_paths = {}

--- Ajoute un nœud 15 m devant la caméra, posé sur le terrain (si snapToTerrain), et le sélectionne.
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:588
function editor_crawlEditor_paths:addNodeAtCamera() end

--- Oriente chaque nœud (quatFromDir, haut +Z) vers le suivant ; le dernier garde la direction entrante. Ignore les segments de longueur <= 0,001. Sans effet avec moins de 2 nœuds.
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:614
function editor_crawlEditor_paths:autoOrientNodes() end

--- Début de manipulation du gizmo : mémorise position et rotation du nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:545
function editor_crawlEditor_paths:beginDrag() end

--- Pendant la manipulation : translate (avec snap terrain) ou fait tourner le nœud selon le gizmo.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:554
function editor_crawlEditor_paths:dragging() end

--- Appelée à chaque frame : gère le gizmo d'axes si un nœud est sélectionné, traite l'entrée souris et met à jour le gizmo hors manipulation.
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:720
---@param mouseInfo table Table de souris
function editor_crawlEditor_paths:draw(mouseInfo) end

--- Dessine le détail d'un chemin : Goto, nom, nom de fichier (Rename), description, statistiques (nœuds, longueur, dénivelé), boutons d'outils (Add Node, Add Node At Camera, Reverse Order, Auto-Orient Nodes, Renumber, Snap All To Terrain, Set All Radii, Validate Path), liste des nœuds avec Delete et éditeur du nœud sélectionné (nom, position, rotation, rayon, drapeaux de récupération/bonus, flags JSON).
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:140
---@param path table Chemin à afficher
function editor_crawlEditor_paths:drawPathDetail(path) end

--- Dessine dans le monde les nœuds (sphère de leur rayon : orange sélectionné, vert recovery, doré bonus, blanc sinon), flèches de direction, étiquettes « nom (indice) [RECOVERY/BONUS] », prismes entre nœuds et distance cumulée.
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:740
---@param mouseInfo table Table de souris (camPos requis)
function editor_crawlEditor_paths:drawPathnodeSelectionIndicators(mouseInfo) end

--- Dessine la liste des chemins avec « Add Path » et un menu contextuel « Delete ». Remplit selection.index et selection.clicked.
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:101
---@param allPaths table Liste des chemins, modifiée en place
---@param selection table Table avec index et clicked
function editor_crawlEditor_paths:drawPathsList(allPaths, selection) end

--- Pose un point sur la hauteur du terrain.
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:578
---@param pos vec3 Position
---@return vec3  Copie avec z du terrain
---@return boolean  true si core_terrain est disponible
function editor_crawlEditor_paths:dropToTerrain(pos) end

--- Fin de manipulation : re-snap au terrain en translation, enregistre « Manipulate Pathnode » dans l'historique, marque le chemin modifié.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:698
function editor_crawlEditor_paths:endDragging() end

--- Dessine des sphères sur les éléments (orange si sélectionné) et renvoie le plus proche de la caméra dont le rayon de souris traverse la sphère.
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:427
---@param mouseInfo table Table de crawlEditor/input
---@param objects table Liste d'éléments {pos, index|orig, radius}
---@return table|nil  Élément touché ou nil
function editor_crawlEditor_paths:findPathnode(mouseInfo, objects) end

--- Crée une table de chemin vide : name « New Path », description « A new path », nodes vide.
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:401
---@return table  Nouveau chemin
function editor_crawlEditor_paths:getNewPath() end

--- Crée un nœud par défaut et l'ajoute à la fin du chemin courant (crée un chemin si aucun).
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:410
---@return table  Le nouveau nœud
function editor_crawlEditor_paths:getNewPathnode() end

--- Renvoie l'indice du nœud sélectionné.
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:93
---@return integer  Indice, -1 si aucun
function editor_crawlEditor_paths:getSelectedPathnodeIndex() end

--- Initialise l'instance (appelé par le constructeur).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:60
---@param crawlEditorParam table Instance/module crawlEditor parent
function editor_crawlEditor_paths:init(crawlEditorParam) end

--- Traite l'entrée souris : Shift = ajout, Alt = insertion, sinon sélection de nœud.
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:492
---@param mouseInfo table Table de souris
function editor_crawlEditor_paths:input(mouseInfo) end

--- Renomme tous les nœuds « Node N » dans l'ordre.
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:645
function editor_crawlEditor_paths:renumberNodes() end

--- Inverse l'ordre des nœuds et désélectionne.
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:603
function editor_crawlEditor_paths:reversePathOrder() end

--- Sélectionne le nœud d'indice donné (à partir de 1) ; un indice invalide, nil ou <= 0 désélectionne.
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:84
---@param index integer|nil Indice du nœud
function editor_crawlEditor_paths:selectPathnode(index) end

--- Applique le même rayon à tous les nœuds.
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:636
---@param radius number Rayon en mètres ; doit être > 0
function editor_crawlEditor_paths:setAllRadii(radius) end

--- Recopie nom, nom de fichier et description du chemin dans les tampons de saisie imgui.
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:73
---@param path table Chemin
function editor_crawlEditor_paths:setFields(path) end

--- Définit le chemin édité.
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:80
---@param pathParam table|nil Chemin à éditer
function editor_crawlEditor_paths:setPath(pathParam) end

--- Alias de selectPathnode.
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:97
---@param index integer|nil Indice du nœud
function editor_crawlEditor_paths:setSelectedPathnodeIndex(index) end

--- Pose tous les nœuds sur le terrain.
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:654
function editor_crawlEditor_paths:snapAllToTerrain() end

--- Détecte un clic sur le milieu d'un segment et y insère un nouveau nœud, qu'il sélectionne.
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:459
---@param mouseInfo table Table de souris
function editor_crawlEditor_paths:tryInsert(mouseInfo) end

--- Place le gizmo d'axes sur la position et la rotation du nœud sélectionné.
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:535
function editor_crawlEditor_paths:updateTransform() end

--- Analyse le chemin et renvoie la liste des problèmes trouvés (voir notes).
---Source : lua/ge/extensions/editor/crawlEditor/paths.lua:665
---@return table<integer, string>  Messages ; « No problems found. » si tout est correct
function editor_crawlEditor_paths:validatePath() end

