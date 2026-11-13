---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/scene.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outils MCP pour le scenetree : trouver des objets (par classe ou nom), les inspecter comme l'inspecteur de l'éditeur, modifier leurs champs, les supprimer, les sérialiser, lister les objets visibles dans le champ de la caméra et lancer un raycast.
--- Accès : extension `mcp_tools_scene` : `extensions.load("mcp_tools_scene")`, puis la globale `mcp_tools_scene`
---@class mcp_tools_scene
---@field schemas table<string, table> Schémas des outils scène.
mcp_tools_scene = {}

--- Supprime un objet de la scène (obj:deleteObject()).
---Source : lua/ge/extensions/mcp/tools/scene.lua:86
---@param args table {id?: integer, name?: string}
---@return string  Message.
---@return boolean  true si introuvable.
function mcp_tools_scene.delete_object(args) end

--- Trouve des objets par nom exact ou par classe (avec filtre optionnel de sous-chaîne).
---Source : lua/ge/extensions/mcp/tools/scene.lua:20
---@param args table {class?: string, pattern?: string, name?: string}
---@return string  JSON {count, objects:[{id, name, class}]}.
---@return boolean  true si ni class ni name.
function mcp_tools_scene.find_objects(args) end

--- Inspecte un objet : id, name, class, champs statiques non vides, champs dynamiques, position.
---Source : lua/ge/extensions/mcp/tools/scene.lua:43
---@param args table {id?: integer, name?: string}
---@return string  JSON.
---@return boolean  true si introuvable.
function mcp_tools_scene.get_object(args) end

--- Lance un rayon et renvoie le premier impact.
---Source : lua/ge/extensions/mcp/tools/scene.lua:139
---@param args table|nil {from?: {x,y,z}, to?: {x,y,z}, dir?: {x,y,z}, length?: number m, includeTerrain?: boolean, renderGeometry?: boolean}
---@return string  JSON {hit=false, from, to} ou {hit=true, pt, norm, …}.
---@return boolean  true si aucune origine.
function mcp_tools_scene.raycast(args) end

--- Sérialise l'objet en JSON/texte comme dans un fichier de niveau ou de prefab (obj:serialize).
---Source : lua/ge/extensions/mcp/tools/scene.lua:95
---@param args table {id?|name?, pretty?: boolean (défaut true)}
---@return string  Texte sérialisé.
---@return boolean  true si introuvable.
function mcp_tools_scene.serialize_object(args) end

--- Écrit un ou plusieurs champs d'un objet puis appelle postApply.
---Source : lua/ge/extensions/mcp/tools/scene.lua:70
---@param args table {id?|name?, field?: string, value?: any, fields?: table<string, any>, index?: string (défaut '0')}
---@return string  Message récapitulatif.
---@return boolean  true en cas d'erreur.
function mcp_tools_scene.set_object_field(args) end

--- Liste les objets dans le champ de la caméra, triés par distance.
---Source : lua/ge/extensions/mcp/tools/scene.lua:113
---@param args table|nil {class?: string, mask?: integer, maxDist?: number m}
---@return string  JSON {count, objects:[{id, name, class, dist, pos, jbeam?}]}.
---@return boolean  true si sceneGetVisibleObjectIds absent.
function mcp_tools_scene.view_objects(args) end

