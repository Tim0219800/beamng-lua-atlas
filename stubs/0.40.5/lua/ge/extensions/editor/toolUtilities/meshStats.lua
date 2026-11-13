---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/meshStats.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Diagnostic du poids de maillage lors d'un import (importeur de ville/réseau de l'éditeur). Distingue la géométrie UNIQUE (ProceduralMesh : bâtiments, tabliers de pont ou de tunnel, portiques, chacun avec son propre tampon et sa propre construction de collision) de la géométrie INSTANCIÉE (TSStatic regroupés par forme, items Forest). Les générateurs appellent recordMesh pendant la construction ; l'importeur appelle begin() au début et report() à la fin, ce qui journalise un récapitulatif par famille.
--- Accès : extension `editor_toolUtilities_meshStats` : `extensions.load("editor_toolUtilities_meshStats")`, puis la globale `editor_toolUtilities_meshStats`
---@class editor_toolUtilities_meshStats
editor_toolUtilities_meshStats = {}

--- Démarre une fenêtre de collecte : active la collecte et efface les enregistrements précédents.
---Source : lua/ge/extensions/editor/toolUtilities/meshStats.lua:27
function editor_toolUtilities_meshStats.begin() end

--- Enregistre un ProceduralMesh par son NOM dans l'arbre de scène (une reconstruction sous le même nom écrase l'entrée). Sans effet hors collecte ou si name est nil.
---Source : lua/ge/extensions/editor/toolUtilities/meshStats.lua:35
---@param name string Nom de l'objet dans la scène.
---@param family string|nil Famille pour le récapitulatif (défaut 'other').
---@param nVerts integer|nil Nombre de sommets (défaut 0).
---@param nTris integer|nil Nombre de triangles (défaut 0).
function editor_toolUtilities_meshStats.recordMesh(name, family, nVerts, nTris) end

--- Enregistre la géométrie d'UNE partie d'un maillage fusionné par catégorie structurelle (bridge.deck, tunnel.floor, tunnel.shell). Additif : les valeurs s'ajoutent. C'est une ventilation des totaux de maillage, pas un doublon.
---Source : lua/ge/extensions/editor/toolUtilities/meshStats.lua:43
---@param category string Catégorie de la partie.
---@param nVerts integer|nil Sommets à ajouter.
---@param nTris integer|nil Triangles à ajouter.
function editor_toolUtilities_meshStats.recordParts(category, nVerts, nTris) end

--- Agrège tout et journalise le récapitulatif, puis termine la fenêtre de collecte. Sans collecte active, journalise '[mesh] no active mesh-stats session' et revient.
---Source : lua/ge/extensions/editor/toolUtilities/meshStats.lua:72
---@param tag string|nil Tag de log ; défaut 'meshStats'.
function editor_toolUtilities_meshStats.report(tag) end

