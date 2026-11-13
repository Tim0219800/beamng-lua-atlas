---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/staticMesh.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Place des objets TSStatic (fichiers .dae) le long des routes du Road Architect, à partir des couches (layers) du profil latéral. Deux types de couches sont gérés : le type 4 (même maillage répété sur toute la longueur de la route) et le type 5 (une seule unité de maillage). Appelé par roads.finalise ; les objets sont retirés par tryRemove lors du unfinalise ou de la suppression de la route.
--- Accès : extension `editor_roadArchitect_staticMesh` : `extensions.load("editor_roadArchitect_staticMesh")`, puis la globale `editor_roadArchitect_staticMesh`
---@class editor_roadArchitect_staticMesh
editor_roadArchitect_staticMesh = {}

--- Parcourt les couches du profil de la route et crée les objets statiques correspondants (type 4 : répétition le long de la route ; type 5 : unité unique).
---Source : lua/ge/extensions/editor/roadArchitect/staticMesh.lua:228
---@param r table Route avec profile.layers.
---@param roadIdx integer Indice de la route (sert au nommage).
---@param folder userdata SimGroup de scène.
function editor_roadArchitect_staticMesh.createStaticMeshes(r, roadIdx, folder) end

--- Supprime de la scène tous les maillages statiques (répétés et uniques) créés pour la route, et oublie leurs entrées.
---Source : lua/ge/extensions/editor/roadArchitect/staticMesh.lua:246
---@param roadName string Nom de la route (le commentaire du code parle d'indice, mais la clé est le nom).
function editor_roadArchitect_staticMesh.tryRemove(roadName) end

