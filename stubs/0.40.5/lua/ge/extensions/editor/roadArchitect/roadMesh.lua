---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/roadMesh.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Crée les maillages procéduraux (objets de scène ProceduralMesh) du Road Architect : trottoirs avec bordures (kerbs) à gauche ou à droite de la route, et ponts. Il garde en interne les tables des maillages par nom de route et par nom de pont, pour pouvoir les supprimer plus tard. Il est appelé par le module roads lors de finalise/unfinalise et de updateRoads.
--- Accès : extension `editor_roadArchitect_roadMesh` : `extensions.load("editor_roadArchitect_roadMesh")`, puis la globale `editor_roadArchitect_roadMesh`
---@class editor_roadArchitect_roadMesh
editor_roadArchitect_roadMesh = {}

--- Remplace la table des ponts par une table vide sans supprimer les objets de scène.
---Source : lua/ge/extensions/editor/roadArchitect/roadMesh.lua:888
function editor_roadArchitect_roadMesh.clearBridges() end

--- Découpe la route en sections latérales et crée un maillage de trottoir + bordure pour chaque voie 'sidewalk' (côté gauche ou droit selon isLeftSide). Mémorise les maillages sous le nom de la route.
---Source : lua/ge/extensions/editor/roadArchitect/roadMesh.lua:669
---@param r table Route avec renderData.
---@param roadMeshIdx integer Indice de la route, utilisé pour nommer les objets créés.
---@param folder userdata SimGroup de scène qui reçoit les maillages.
function editor_roadArchitect_roadMesh.createRoad(r, roadMeshIdx, folder) end

--- Supprime de la scène les maillages créés pour la route (s'il y en a) et oublie l'entrée.
---Source : lua/ge/extensions/editor/roadArchitect/roadMesh.lua:686
---@param roadName string Nom de la route.
function editor_roadArchitect_roadMesh.tryRemove(roadName) end

--- Supprime l'objet maillage du pont et l'oublie.
---Source : lua/ge/extensions/editor/roadArchitect/roadMesh.lua:879
---@param name string Nom (identifiant) de la route de type pont.
function editor_roadArchitect_roadMesh.tryRemoveBridge(name) end

--- (Re)crée le maillage procédural d'un pont : supprime l'ancien, calcule les anneaux de sommets à partir du renderData (voies -1 à 1), génère surface et capuchons, et l'ajoute au dossier.
---Source : lua/ge/extensions/editor/roadArchitect/roadMesh.lua:697
---@param r table Route de type pont, avec renderData.
---@param folder userdata SimGroup « Road Architect - Bridge <nom> ».
function editor_roadArchitect_roadMesh.updateBridge(r, folder) end

