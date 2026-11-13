---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/proceduralContentGenerator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Générateur de contenu procédural (PCG) pour l'éditeur : on construit un graphe de nœuds (générateurs de points, transformations, spawners) puis on l'exécute pour créer des objets dans le niveau (TSStatic, prefabs, objets d'une classe quelconque, DecalRoad). Les données circulant entre nœuds sont des « points » (pos, rot, scale, bounds, color, spawnRandomness) ou des « segments » (routes). Les graphes nommés sont mis en cache ; chaque graphe retient les ids des objets qu'il a créés pour les supprimer à la ré-exécution. L'API est exposée en M.* et, après initialize(editor), en editor.pcg et editor.proceduralContentGenerator.
--- Accès : extension `editor_api_proceduralContentGenerator` : `extensions.load("editor_api_proceduralContentGenerator")`, puis la globale `editor_api_proceduralContentGenerator`
---@class editor_api_proceduralContentGenerator
---@field graphs table<string, table> Cache des graphes nommés (nom -> Graph).
---@field nodes table<string, function> Fabriques de nœuds par nom (scatterBox, spawnStatic…) ; chacune prend une table params et renvoie un nœud brut.
editor_api_proceduralContentGenerator = {}

--- Appelle removeGraph sur tous les graphes en cache, avec la même sémantique de deleteOwnedObjects.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:1002
---@param deleteOwnedObjects boolean|nil Défaut true.
function editor_api_proceduralContentGenerator.clearAllGraphs(deleteOwnedObjects) end

--- Renvoie le graphe en cache de ce nom ou nil.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:982
---@param name string Nom du graphe.
---@return table|nil  Graph.
function editor_api_proceduralContentGenerator.getGraph(name) end

--- graph('nom') / graph('nom', opts) renvoie un graphe mis en cache (le crée au besoin ; opts.seed met à jour la graine d'un graphe existant). graph(opts) ou graph() crée un graphe anonyme non mis en cache.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:956
---@param nameOrOpts string|table|nil Nom du graphe, ou table d'options pour un graphe anonyme.
---@param opts table|nil {seed = number} (graine par défaut 1).
---@return table  Graph.
function editor_api_proceduralContentGenerator.graph(nameOrOpts, opts) end

--- Mémorise l'objet editor et expose l'API (graph, graphs, listGraphs, getGraph, removeGraph, clearAllGraphs, newPoint, nodes) sous editor.pcg et editor.proceduralContentGenerator. Appelé au chargement de l'API de l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:1021
---@param editorInstance table Objet editor global.
function editor_api_proceduralContentGenerator.initialize(editorInstance) end

--- Liste triée des noms de graphes en cache.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:973
---@return string[]  Noms.
function editor_api_proceduralContentGenerator.listGraphs() end

--- Crée un point PCG normalisé : pos (vec3, défaut 0), rot (quat, identité), scale (vec3, défaut 1), bounds (vec3, défaut 1), color ({r,g,b,a} défaut blanc), spawnRandomness (0..1, défaut 0). Les vec3/quat peuvent être donnés en tables {x,y,z} ou {1,2,3}; un nombre seul devient un vec3 uniforme.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:51
---@param opts table|nil {pos, rot, scale, bounds, color, spawnRandomness}.
---@return table  Point.
function editor_api_proceduralContentGenerator.newPoint(opts) end

--- Retire un graphe du cache. Par défaut supprime aussi les objets de la scène qu'il a créés ; avec false, les oublie sans les supprimer.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:989
---@param name string Nom du graphe.
---@param deleteOwnedObjects boolean|nil Défaut true ; false pour garder les objets.
---@return boolean  false si le graphe n'existe pas.
function editor_api_proceduralContentGenerator.removeGraph(name, deleteOwnedObjects) end

--- Graphe de nœuds (champs : name, seed, nodes, spawnedIds, spawnGroups). Les méthodes de fabrique renvoient un Pipe pour chaîner.
---@class editor_api_proceduralContentGenerator_Graph
local editor_api_proceduralContentGenerator_Graph = {}

--- Ajoute un nœud brut au graphe, lui donne un id et renvoie le nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:146
---@param node table Nœud.
---@return table  Le nœud.
function editor_api_proceduralContentGenerator_Graph:_addNode(node) end

--- Ajoute un nœud par nom de fabrique (string) ou un nœud personnalisé (table avec execute(node, ctx, get)). Nom inconnu : log E et renvoie nil.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:912
---@param kindOrNode string|table Nom de nœud ou nœud.
---@param params table|nil Paramètres.
---@return table|nil  Pipe.
function editor_api_proceduralContentGenerator_Graph:add(kindOrNode, params) end

--- Alias de clearSpawned.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:203
---@return table  Le graphe.
function editor_api_proceduralContentGenerator_Graph:clear() end

--- Supprime les objets créés par le graphe (via editor.deleteObject) et vide les SimGroup suivis par nom.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:165
---@return table  Le graphe.
function editor_api_proceduralContentGenerator_Graph:clearSpawned() end

--- Relie la sortie fromPin de fromNode à l'entrée toPin de toNode. Accepte aussi la forme connect(pipe, toNode, toPin).
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:153
---@param fromNode table Nœud source (ou Pipe).
---@param fromPin string Pin de sortie ('points', 'segments', 'objectIds').
---@param toNode table Nœud cible.
---@param toPin string Pin d'entrée.
---@return table  Le graphe.
function editor_api_proceduralContentGenerator_Graph:connect(fromNode, fromPin, toNode, toPin) end

--- Détruit le graphe : le retire du cache s'il y est et supprime ses objets (sauf deleteOwnedObjects == false).
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:1009
---@param deleteOwnedObjects boolean|nil Défaut true.
---@return boolean  true (ou résultat de removeGraph).
function editor_api_proceduralContentGenerator_Graph:destroy(deleteOwnedObjects) end

--- Nœud source recopiant une liste de points donnée (params.points).
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:906
---@param params table {points}.
---@return table  Pipe.
function editor_api_proceduralContentGenerator_Graph:fromPoints(params) end

--- Nœud source de segments de route (params.segments).
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:907
---@param params table {segments}.
---@return table  Pipe sur le pin 'segments'.
function editor_api_proceduralContentGenerator_Graph:fromSegments(params) end

--- Vide la liste des nœuds pour reconstruire le graphe (ne supprime pas les objets créés).
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:938
---@return table  Le graphe.
function editor_api_proceduralContentGenerator_Graph:rebuild() end

--- Exécute le graphe en ordre topologique. Par défaut supprime d'abord les objets précédents. Marque l'éditeur modifié.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:270
---@param opts table|nil {seed = number, replace = boolean (défaut true)}.
---@return table  {spawnedIds = integer[], nodes = integer}.
function editor_api_proceduralContentGenerator_Graph:run(opts) end

--- Nœud plaçant des points le long d'un chemin polyligne. Params : path, closed, mode, count, spacing, minSpacing, distances, startOffset, lateralJitter, upJitter, alignToTangent.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:905
---@param params table Voir les notes.
---@return table  Pipe.
function editor_api_proceduralContentGenerator_Graph:scatterAlongSpline(params) end

--- Nœud générant count points aléatoires dans une boîte. Params : center, extent (défaut 10,10,0), count.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:902
---@param params table {center, extent, count}.
---@return table  Pipe.
function editor_api_proceduralContentGenerator_Graph:scatterBox(params) end

--- Nœud générant count points répartis uniformément dans un disque/anneau. Params : center, radius (défaut 10), innerRadius, count.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:904
---@param params table {center, radius, innerRadius, count}.
---@return table  Pipe.
function editor_api_proceduralContentGenerator_Graph:scatterDisk(params) end

--- Nœud générant une grille de points. Params : center, extent, spacing (défaut 2), jitter.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:903
---@param params table {center, extent, spacing, jitter}.
---@return table  Pipe.
function editor_api_proceduralContentGenerator_Graph:scatterGrid(params) end

--- Poignée de chaînage sur un pin de sortie d'un nœud (graph, node, pin). Chaque méthode ajoute un nœud relié à ce pin et renvoie un nouveau Pipe (sauf les spawners).
---@class editor_api_proceduralContentGenerator_Pipe
local editor_api_proceduralContentGenerator_Pipe = {}

--- Raccourci vers Graph:clear.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:933
---@return table  Le Graph.
function editor_api_proceduralContentGenerator_Pipe:clear() end

--- Relie le pin à toNode.toPin (défaut 'points') et renvoie un Pipe sur ce nœud.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:313
---@param toNode table Nœud cible.
---@param toPin string|nil Pin d'entrée.
---@return table  Pipe.
function editor_api_proceduralContentGenerator_Pipe:connectTo(toNode, toPin) end

--- Ne garde que les points dans la boîte min/max ou dans la sphère center/radius.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:927
---@param params table {min, max} ou {center, radius}.
---@return table  Pipe.
function editor_api_proceduralContentGenerator_Pipe:filterBounds(params) end

--- Décale chaque point de delta, plus un décalage aléatoire +-random par axe.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:926
---@param params table {delta, random}.
---@return table  Pipe.
function editor_api_proceduralContentGenerator_Pipe:offset(params) end

--- Ajoute une rotation aléatoire (yaw, pitch, roll en degrés, nombre ou {min,max}) et/ou une échelle (nombre, {min,max} ou {x,y,z} de plages).
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:923
---@param params table {yaw, pitch, roll, scale}.
---@return table  Pipe.
function editor_api_proceduralContentGenerator_Pipe:randomTransform(params) end

--- Raccourci vers Graph:rebuild.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:934
---@return table  Le Graph.
function editor_api_proceduralContentGenerator_Pipe:rebuild() end

--- Raccourci vers Graph:run.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:932
---@param opts table|nil Voir Graph:run.
---@return table  Résultat de run.
function editor_api_proceduralContentGenerator_Pipe:run(opts) end

--- Fixe spawnRandomness (0..1) de chaque point : value fixe, range tirée, sinon aléatoire. Sert à choisir l'élément dans les listes de paths/classes.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:924
---@param params table {value} ou {range}.
---@return table  Pipe.
function editor_api_proceduralContentGenerator_Pipe:setSpawnRandomness(params) end

--- Pose chaque point à la hauteur du terrain (core_terrain.getTerrainHeight) + offset. Sans terrain, ne change rien.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:925
---@param params table {offset}.
---@return table  Pipe.
function editor_api_proceduralContentGenerator_Pipe:snapTerrain(params) end

--- Crée un objet de classe quelconque par point (classe choisie dans classes) et applique les champs fields via setField. Params : classes, fields, group, namePrefix.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:930
---@param params table Voir description.
---@return table  Le Graph.
function editor_api_proceduralContentGenerator_Pipe:spawnClass(params) end

--- Crée un DecalRoad par segment. Params : segments, group, namePrefix, material, width, snapTerrain, overObjects, drivability, textureLength, improvedSpline.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:931
---@param params table Voir description.
---@return table  Le Graph.
function editor_api_proceduralContentGenerator_Pipe:spawnDecalRoads(params) end

--- Instancie un prefab par point via spawnPrefab (chemin choisi dans paths). Params : paths, group, namePrefix.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:929
---@param params table Voir description.
---@return table  Le Graph.
function editor_api_proceduralContentGenerator_Pipe:spawnPrefab(params) end

--- Crée un TSStatic par point (shape choisi dans paths selon spawnRandomness), collision 'Collision Mesh', couleur d'instance du point. Params : paths, group, namePrefix, collisionType, decalType.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:928
---@param params table Voir description.
---@return table  Le Graph.
function editor_api_proceduralContentGenerator_Pipe:spawnStatic(params) end

--- Table exposée comme editor.pcg / editor.proceduralContentGenerator : mêmes fonctions que le module (graph, listGraphs, getGraph, removeGraph, clearAllGraphs, newPoint) et champs graphs, nodes.
---@class editor_api_proceduralContentGenerator_api
local editor_api_proceduralContentGenerator_api = {}

--- Voir clearAllGraphs du module.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:1002
---@param deleteOwnedObjects boolean|nil Défaut true.
function editor_api_proceduralContentGenerator_api.clearAllGraphs(deleteOwnedObjects) end

--- Voir getGraph du module.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:982
---@param name string Nom.
---@return table|nil  Graph.
function editor_api_proceduralContentGenerator_api.getGraph(name) end

--- Voir graph du module.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:956
---@param nameOrOpts string|table|nil Nom ou options.
---@param opts table|nil Options.
---@return table  Graph.
function editor_api_proceduralContentGenerator_api.graph(nameOrOpts, opts) end

--- Voir listGraphs du module.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:973
---@return string[]  Noms.
function editor_api_proceduralContentGenerator_api.listGraphs() end

--- Voir newPoint du module.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:51
---@param opts table|nil Options.
---@return table  Point.
function editor_api_proceduralContentGenerator_api.newPoint(opts) end

--- Voir removeGraph du module.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:989
---@param name string Nom.
---@param deleteOwnedObjects boolean|nil Défaut true.
---@return boolean  Succès.
function editor_api_proceduralContentGenerator_api.removeGraph(name, deleteOwnedObjects) end

