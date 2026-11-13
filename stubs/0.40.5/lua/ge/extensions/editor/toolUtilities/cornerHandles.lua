---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/cornerHandles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Poignées dans le viewport pour les virages de la géométrie « engineered » des outils de route de l'éditeur : un bouton de rayon (à l'extérieur du virage, ancré à l'apex) et une poignée de déplacement sur la courbe quand le nœud PI est très éloigné de son virage. Gère le survol, le clic, le glisser et l'enregistrement d'une action d'historique annulable via le contexte fourni par l'outil.
--- Accès : extension `editor_toolUtilities_cornerHandles` : `extensions.load("editor_toolUtilities_cornerHandles")`, puis la globale `editor_toolUtilities_cornerHandles`
---@class editor_toolUtilities_cornerHandles
editor_toolUtilities_cornerHandles = {}

--- Apex du virage intérieur i sur la route réelle : l'échantillon au milieu de l'arc ancré à discMap[i]. Reste près de la route même si le PI est très loin (épingle ~180°). Retombe sur le nœud avant construction.
---Source : lua/ge/extensions/editor/toolUtilities/cornerHandles.lua:46
---@param g table Groupe (discMap, divPoints, nodes).
---@param i integer Indice du nœud intérieur.
---@return table  Point {x,y,z} de l'apex (ou le nœud i).
function editor_toolUtilities_cornerHandles.apex(g, i) end

--- Indice du groupe qui possède le glissé en cours (pour savoir quelle route masquer), ou nil.
---Source : lua/ge/extensions/editor/toolUtilities/cornerHandles.lua:237
---@return integer|nil
function editor_toolUtilities_cornerHandles.draggingGroupIdx() end

--- true tant qu'un glissé de poignée de virage est en cours (l'outil s'en sert pour masquer la route et différer la reconstruction).
---Source : lua/ge/extensions/editor/toolUtilities/cornerHandles.lua:234
---@return boolean
function editor_toolUtilities_cornerHandles.isDragging() end

--- Poignée de déplacement sur la courbe pour le virage i (comme la poignée de milieu de Civil3D) : n'existe que lorsque le PI est à plus de 25 m de son virage ; sinon le nœud est sur la route et se déplace directement.
---Source : lua/ge/extensions/editor/toolUtilities/cornerHandles.lua:83
---@param g table Groupe.
---@param i integer Indice du nœud intérieur.
---@param ap table|nil Apex déjà calculé (évite une recherche).
---@return vec3|nil  Position de la poignée (apex, z+0.15) ou nil.
function editor_toolUtilities_cornerHandles.moveHandle(g, i, ap) end

--- Dessine les poignées de virage intérieur (bouton de rayon + poignée de déplacement) et gère leur clic/glisser. Renvoie (consumed, hovering) : consumed = elle possède la souris cette frame ; hovering = simple survol (l'appelant doit couper l'ajout de nœud mais continuer sa passe d'événements).
---Source : lua/ge/extensions/editor/toolUtilities/cornerHandles.lua:100
---@param g table Groupe/route (nodes, corners, discMap, divPoints…).
---@param ctx table { selGroupIdx, selNodeIdx, setSelNode(i), minRadius(g)->number, deepCopy(g)->snapshot, undo, redo, ensureOverride(g,i)->ov }
---@return boolean  consumed
---@return boolean|nil  hovering (absent quand rien n'est survolé).
function editor_toolUtilities_cornerHandles.update(g, ctx) end

