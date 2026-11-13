---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadDecorations.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Place automatiquement des objets décoratifs (TSStatic, par exemple des réflecteurs ou des poteaux) de chaque côté d'un DecalRoad, à intervalle régulier. Les objets sont posés sur la hauteur du terrain, enregistrés sous « decoration.<route>.<fichier>.<n> » et regroupés dans un SimGroup ajouté à MissionGroup. Un moddeur l'appelle depuis un script d'éditeur.
--- Accès : extension `editor_roadDecorations` : `extensions.load("editor_roadDecorations")`, puis la globale `editor_roadDecorations`
---@class editor_roadDecorations
editor_roadDecorations = {}

--- Crée un SimGroup et y place, tous les `period` mètres, un TSStatic de chaque côté de la route (collisionType 'Collision Mesh', échelle 1). Les positions sont recalées sur le terrain (core_terrain.getTerrainHeight) puis décalées de zOff.
---Source : lua/ge/extensions/editor/roadDecorations.lua:112
---@param roadName string|integer Nom unique du DecalRoad (voir bug : doit être numérique).
---@param shapeName string Chemin du fichier .dae à placer.
---@param distance number Décalage latéral par rapport au bord de la route, en mètres.
---@param period number Intervalle entre deux paires d'objets, en mètres.
---@param rotation quat|nil Rotation supplémentaire appliquée aux objets (nil = aucune).
---@param zOff number Décalage vertical ajouté à la hauteur du terrain.
---@param align boolean true : le côté gauche est placé à l'opposé exact du côté droit (même longueur de route).
---@return integer|nil  Identifiant du SimGroup créé, ou nil si la route n'existe pas.
function editor_roadDecorations.decorateProps(roadName, shapeName, distance, period, rotation, zOff, align) end

--- Cherche sur une polyligne (bord de route) le point situé à la longueur donnée depuis le début, puis le décale latéralement. Renvoie nil si la longueur dépasse la polyligne.
---Source : lua/ge/extensions/editor/roadDecorations.lua:7
---@param spline table<integer, vec3> Points du bord de la route (au moins 2).
---@param length number Distance depuis le début, en mètres.
---@param distance number Décalage latéral vers l'extérieur de la route, en mètres.
---@param left boolean true pour le bord gauche (direction inversée), false pour le bord droit.
---@return table|nil  {point = vec3 décalé, rotation = quat, edgePos = vec3 sur le bord, edgeIdx = integer (indice C++, base 0)} ou nil.
function editor_roadDecorations.findOffsetPoint(spline, length, distance, left) end

