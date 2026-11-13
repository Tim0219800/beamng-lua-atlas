---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/staticMeshMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère l'« audition » des maillages statiques dans le Road Architect : il liste les fichiers .dae disponibles (dossiers art/shapes/objects et art/shapes/garage_and_dealership/Clutter), affiche un maillage choisi dans la scène à 1000 m d'altitude et déplace/fait tourner la caméra libre autour pour le prévisualiser. Il renseigne aussi, dans la couche de profil concernée, les dimensions du maillage (boîte). Utilisé par l'interface d'édition de profils.
--- Accès : extension `editor_roadArchitect_staticMeshMgr` : `extensions.load("editor_roadArchitect_staticMeshMgr")`, puis la globale `editor_roadArchitect_staticMeshMgr`
---@class editor_roadArchitect_staticMeshMgr
---@field availStaticMeshes table<integer, {path: string, filename: string}> Maillages .dae trouvés, triés par nom de fichier. Rempli par fetchAvailableStaticMeshes.
editor_roadArchitect_staticMeshMgr = {}

--- Remplace le maillage en audition par celui d'indice donné, ajuste la distance de la caméra à sa taille, puis écrit dans la couche du profil les distances de la boîte autour du centre (boxXLeft/Right, boxYLeft/Right, boxZLeft/Right) et ses extensions (extentsL, extentsW, extentsH).
---Source : lua/ge/extensions/editor/roadArchitect/staticMeshMgr.lua:72
---@param selectedMeshIdx integer Indice dans availStaticMeshes.
---@param road table Route dont le profil contient la couche.
---@param customIdx integer Indice de la couche dans road.profile.layers.
function editor_roadArchitect_staticMeshMgr.addMeshToAudition(selectedMeshIdx, road, customIdx) end

--- Cherche récursivement les *.dae dans les dossiers prédéfinis et remplit availStaticMeshes (triée par filename).
---Source : lua/ge/extensions/editor/roadArchitect/staticMeshMgr.lua:41
function editor_roadArchitect_staticMeshMgr.fetchAvailableStaticMeshes() end

--- Si la caméra n'est pas déjà en vue d'audition : mémorise sa pose, arrête et remet à zéro le chronomètre, et applique la pose d'audition.
---Source : lua/ge/extensions/editor/roadArchitect/staticMeshMgr.lua:118
---@param timer table Chronomètre avec stopAndReset().
---@param time number Temps courant.
---@return number  0.0 à l'entrée dans la vue ; sinon la valeur time reçue.
function editor_roadArchitect_staticMeshMgr.goToMeshView(timer, time) end

--- Restaure la pose de caméra mémorisée avant l'audition et sort de la vue d'audition.
---Source : lua/ge/extensions/editor/roadArchitect/staticMeshMgr.lua:138
function editor_roadArchitect_staticMeshMgr.goToOldView() end

--- Fait avancer d'un pas l'angle de rotation de la caméra autour du maillage et applique la pose (à appeler à chaque frame).
---Source : lua/ge/extensions/editor/roadArchitect/staticMeshMgr.lua:129
function editor_roadArchitect_staticMeshMgr.manageRotateCam() end

--- Supprime l'objet de scène du maillage en audition s'il existe.
---Source : lua/ge/extensions/editor/roadArchitect/staticMeshMgr.lua:55
function editor_roadArchitect_staticMeshMgr.removeAuditionMesh() end

--- Passe en caméra libre et place la caméra sur la pose d'audition (derrière et au-dessus du maillage, regardant vers lui).
---Source : lua/ge/extensions/editor/roadArchitect/staticMeshMgr.lua:64
function editor_roadArchitect_staticMeshMgr.updateCameraPose() end

