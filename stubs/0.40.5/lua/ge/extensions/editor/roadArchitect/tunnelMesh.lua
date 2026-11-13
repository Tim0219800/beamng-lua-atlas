---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/tunnelMesh.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Génère les tunnels automatiques du Road Architect : un maillage procédural (ProceduralMesh) en forme de tube autour de la route, et il perce la holemap du terrain pour que le tunnel traverse le relief. À la suppression du tunnel, il restaure la holemap d'origine. Appelé par roads.finalise (création) et unfinalise/removeAll (suppression).
--- Accès : extension `editor_roadArchitect_tunnelMesh` : `extensions.load("editor_roadArchitect_tunnelMesh")`, puis la globale `editor_roadArchitect_tunnelMesh`
---@class editor_roadArchitect_tunnelMesh
editor_roadArchitect_tunnelMesh = {}

--- Crée le maillage procédural du tunnel à partir du renderData de la route (centre et bords latéraux, section circulaire) et perce la holemap du terrain le long du tunnel.
---Source : lua/ge/extensions/editor/roadArchitect/tunnelMesh.lua:200
---@param roadIdx integer Indice de la route dans roads.
---@param name string Nom du tunnel (clé dans la table des maillages).
---@param rData table renderData de la route.
---@param tunnel table Description du tunnel (indices de début s et de fin e, etc.).
---@param folder userdata SimGroup de scène qui reçoit le maillage.
function editor_roadArchitect_tunnelMesh.createTunnel(roadIdx, name, rData, tunnel, folder) end

--- Si le tunnel existe : restaure la holemap, supprime l'objet maillage et oublie l'entrée.
---Source : lua/ge/extensions/editor/roadArchitect/tunnelMesh.lua:393
---@param roadIdx integer Indice de la route.
---@param name string|nil Nom du tunnel ; ne fait rien si nil.
function editor_roadArchitect_tunnelMesh.tryRemove(roadIdx, name) end

