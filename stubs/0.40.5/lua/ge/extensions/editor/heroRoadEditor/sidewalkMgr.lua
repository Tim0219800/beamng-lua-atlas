---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/sidewalkMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Trottoirs/bordures procéduraux d'un groupe du Hero Road Editor. Fine couche au-dessus du balayage partagé toolUtilities/walkRibbon : lit les bords réels inclinés du maillage (meshEdgeL/R, meshEdgeDirL/R) et balaie bordure + dallage le long de chaque côté activé (group.sidewalkLeft / sidewalkRight). Pendant l'édition c'est un ProceduralMesh transitoire 'HeroWalk_<id>' ; le bake l'écrit en .dae et pose un TSStatic persistant à sa place.
--- Accès : extension `editor_heroRoadEditor_sidewalkMgr` : `extensions.load("editor_heroRoadEditor_sidewalkMgr")`, puis la globale `editor_heroRoadEditor_sidewalkMgr`
---@class editor_heroRoadEditor_sidewalkMgr
editor_heroRoadEditor_sidewalkMgr = {}

--- Bake : écrit le trottoir en <dir>/HeroWalk_<id>.dae (centré sur son propre centre) et pose un TSStatic persistant (canSave=true) à sa place, après avoir supprimé le maillage procédural qui porte le même nom. En cas d'échec d'écriture, logue une erreur ('heroSidewalk') et le trottoir disparaît de ce bake.
---Source : lua/ge/extensions/editor/heroRoadEditor/sidewalkMgr.lua:95
---@param group table Groupe Hero Road.
---@param dir string Dossier de bake (créé s'il n'existe pas), avec slash final.
---@return string[]  Manifeste des noms d'objets de scène créés (vide si rien à cuire) ; sert à retirer le statique au unbake.
function editor_heroRoadEditor_sidewalkMgr.burnGroup(group, dir) end

--- Supprime le maillage de trottoir du groupe et l'oublie.
---Source : lua/ge/extensions/editor/heroRoadEditor/sidewalkMgr.lua:61
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_sidewalkMgr.removeGroup(group) end

--- Nombre de triangles du trottoir du groupe, pour le décompte de l'outil.
---Source : lua/ge/extensions/editor/heroRoadEditor/sidewalkMgr.lua:87
---@param group table|nil Groupe Hero Road.
---@return integer  Nombre de triangles, 0 si aucun trottoir.
function editor_heroRoadEditor_sidewalkMgr.tris(group) end

--- (Re)construit les trottoirs du groupe d'après le bord de maillage actuel et les bascules sidewalkLeft/sidewalkRight. Appelé juste après la reconstruction du maillage. Ne fait rien sans dossier de scène (sceneTreeFolderId) ; ne crée rien si aucun triangle n'est produit.
---Source : lua/ge/extensions/editor/heroRoadEditor/sidewalkMgr.lua:70
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_sidewalkMgr.updateGroup(group) end

