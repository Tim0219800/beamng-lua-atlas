---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utilitaire d'« audition » de meshes statiques et fenêtre imgui de sélection, partagé entre outils de l'éditeur. Il liste les fichiers .dae (par défaut art/shapes/objects et art/shapes/garage_and_dealership/Clutter, ou un dossier choisi), crée un TSStatic temporaire 'Temp Audition Mesh' à 1000 m d'altitude, fait tourner la caméra autour et appelle un callback avec le mesh choisi. À la fermeture, la caméra revient à son ancienne pose et le mesh temporaire est supprimé.
--- Accès : extension `editor_toolUtilities_meshAuditionMgr` : `extensions.load("editor_toolUtilities_meshAuditionMgr")`, puis la globale `editor_toolUtilities_meshAuditionMgr`
---@class editor_toolUtilities_meshAuditionMgr
editor_toolUtilities_meshAuditionMgr = {}

--- Ajoute ou remplace le mesh en audition par celui d'indice donné : supprime l'ancien, ouvre la fenêtre si besoin, crée le TSStatic temporaire (position 0, 0, 1000), ajuste la caméra si la vue d'audition est active, puis appelle le callback.
---Source : lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:97
---@param selectedMeshIdx integer Indice dans la liste des meshes disponibles (1-based).
---@param callback function|nil callback(auditionMesh, path) appelé après la création.
function editor_toolUtilities_meshAuditionMgr.addMeshToAudition(selectedMeshIdx, callback) end

--- Renvoie la liste (non copiée) des meshes statiques disponibles : { path, filename }.
---Source : lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:53
---@return table[]  Éléments { path = chemin complet, filename = nom du fichier }.
function editor_toolUtilities_meshAuditionMgr.getAvailableStaticMeshes() end

--- Déplace la caméra à la pose d'audition (mémorise l'ancienne pose, remet le chrono à zéro). Sans effet si on y est déjà. Renvoie le temps remis à zéro (0.0) à la première entrée, sinon le temps passé.
---Source : lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:143
---@param timer hptimer Chrono à remettre à zéro.
---@param time number Temps accumulé courant (s).
---@return number  Nouveau temps accumulé.
function editor_toolUtilities_meshAuditionMgr.goToMeshView(timer, time) end

--- Ramène la caméra à la pose mémorisée avant l'audition et sort de la vue d'audition.
---Source : lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:163
function editor_toolUtilities_meshAuditionMgr.goToOldView() end

--- À appeler à chaque frame imgui : fait tourner la caméra et dessine la fenêtre 'Static Mesh Selector' (recherche, choix de dossier, remise aux dossiers par défaut, liste filtrable, bouton Close). Un clic sur un nom met le mesh en audition et appelle le callback.
---Source : lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:184
---@param meshTarget string Nom du composant pour lequel on choisit un mesh (affiché dans l'en-tête).
---@param onMeshSelectedFunct function|nil callback(auditionMesh, path) à chaque sélection.
function editor_toolUtilities_meshAuditionMgr.handleMeshAuditionAndSelection(meshTarget, onMeshSelectedFunct) end

--- Quitte l'audition : supprime le mesh temporaire, restaure la caméra et masque la fenêtre. Sans effet si la fenêtre n'est pas ouverte.
---Source : lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:174
function editor_toolUtilities_meshAuditionMgr.leaveAuditionView() end

--- Fait avancer la caméra d'un pas autour du centre d'audition (angle modulo 2 pi).
---Source : lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:154
function editor_toolUtilities_meshAuditionMgr.manageRotateCam() end

--- Reconstruit la liste des fichiers *.dae (recherche récursive dans les dossiers courants via FS:findFiles) et la trie par nom de fichier.
---Source : lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:56
function editor_toolUtilities_meshAuditionMgr.populateAvailableStaticMeshes() end

--- Enregistre la fenêtre de sélection 'meshSelect' dans l'éditeur.
---Source : lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:171
function editor_toolUtilities_meshAuditionMgr.registerWindow() end

--- Supprime le mesh en audition s'il existe.
---Source : lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:78
function editor_toolUtilities_meshAuditionMgr.removeAuditionMesh() end

--- Place la caméra libre face au centre d'audition selon le rayon du mesh courant (distance 1.6 fois le rayon, élévation 0.8 fois).
---Source : lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:89
function editor_toolUtilities_meshAuditionMgr.updateCameraPose() end

