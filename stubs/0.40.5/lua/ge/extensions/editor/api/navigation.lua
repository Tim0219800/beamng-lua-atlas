---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/navigation.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module d'API de l'éditeur prévu pour gérer les maillages de navigation (NavMesh), les liens hors-maillage et les couvertures (cover) pour l'IA. Dans 0.40.5 c'est une coquille vide : toutes les fonctions sont des `--TODO` sans corps. `initialize` les attache à l'objet `editor` (editor.createNavMesh, etc.).
--- Accès : extension `editor_api_navigation` : `extensions.load("editor_api_navigation")`, puis la globale `editor_api_navigation`
---@class editor_api_navigation
editor_api_navigation = {}

--- Mémorise l'instance de l'éditeur et y installe les neuf fonctions navmesh/cover/offmeshlink (non implémentées).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/navigation.lua:43
---@param editorInstance table objet `editor` sur lequel poser les fonctions
function editor_api_navigation.initialize(editorInstance) end

--- Fonctions ajoutées à l'objet `editor` par `initialize`. Toutes sont des stubs vides (TODO).
---@class editor_api_navigation_editor
local editor_api_navigation_editor = {}

--- Stub : devrait créer une couverture.
---Source : lua/ge/extensions/editor/api/navigation.lua:23
---@param coverInfo any description de la couverture
function editor_api_navigation_editor.createCover(coverInfo) end

--- Stub : devrait créer un navmesh.
---Source : lua/ge/extensions/editor/api/navigation.lua:7
---@param navMeshInfo any description du navmesh (déduit du nom)
function editor_api_navigation_editor.createNavMesh(navMeshInfo) end

--- Stub : devrait créer un lien hors-maillage.
---Source : lua/ge/extensions/editor/api/navigation.lua:15
---@param navMeshObjectId integer id du navmesh (déduit du nom)
---@param linkInfo any description du lien
function editor_api_navigation_editor.createOffMeshLink(navMeshObjectId, linkInfo) end

--- Stub : devrait supprimer une couverture.
---Source : lua/ge/extensions/editor/api/navigation.lua:27
---@param coverObjectId integer id de l'objet cover (déduit du nom)
function editor_api_navigation_editor.deleteCover(coverObjectId) end

--- Stub : devrait supprimer un navmesh.
---Source : lua/ge/extensions/editor/api/navigation.lua:11
---@param navMeshObjectId integer id de l'objet navmesh (déduit du nom)
function editor_api_navigation_editor.deleteNavMesh(navMeshObjectId) end

--- Stub : devrait supprimer un lien hors-maillage.
---Source : lua/ge/extensions/editor/api/navigation.lua:19
---@param linkId any identifiant du lien
function editor_api_navigation_editor.deleteOffMeshLink(linkId) end

--- Stub : devrait lister les couvertures d'un navmesh.
---Source : lua/ge/extensions/editor/api/navigation.lua:35
---@param navMeshObjectId integer id du navmesh
function editor_api_navigation_editor.getCovers(navMeshObjectId) end

--- Stub : devrait lister les navmeshes.
---Source : lua/ge/extensions/editor/api/navigation.lua:31
function editor_api_navigation_editor.getNavMeshes() end

--- Stub : devrait lister les liens hors-maillage.
---Source : lua/ge/extensions/editor/api/navigation.lua:39
function editor_api_navigation_editor.getOffMeshLinks() end

