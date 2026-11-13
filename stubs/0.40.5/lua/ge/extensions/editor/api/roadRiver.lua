---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/roadRiver.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- API de l'éditeur pour créer, modifier et supprimer des routes (DecalRoad) et des maillages à nœuds comme les rivières (River, via createMesh). Elle tient aussi une liste locale des routes du niveau (allRoads) et, si la préférence roadTemplates.general.loadTemplates est active, leurs points médians (roadSplines). initialize(editor) ajoute toutes ces fonctions à l'objet editor. Chaque modification appelle editor.setDirty().
--- Accès : extension `editor_api_roadRiver` : `extensions.load("editor_api_roadRiver")`, puis la globale `editor_api_roadRiver`
---@class editor_api_roadRiver
editor_api_roadRiver = {}

--- Enregistre toutes les fonctions du module sur l'objet editor. Appelé au chargement de l'API de l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/roadRiver.lua:238
---@param editorInstance table Objet editor global.
function editor_api_roadRiver.initialize(editorInstance) end

--- Fonctions ajoutées à l'objet editor par initialize.
---@class editor_api_roadRiver_editor
local editor_api_roadRiver_editor = {}

--- Insère un nœud dans un maillage (rivière, etc.).
---Source : lua/ge/extensions/editor/api/roadRiver.lua:142
---@param meshObjectId integer Id du maillage.
---@param nodeInfo table {pos, width, depth, normal, index}.
---@return integer  Résultat de insertNode (id du nœud).
function editor_api_roadRiver_editor.addMeshNode(meshObjectId, nodeInfo) end

--- Insère un nœud dans une route et met à jour ses sommets.
---Source : lua/ge/extensions/editor/api/roadRiver.lua:38
---@param roadObjectId integer Id de la route.
---@param nodeInfo table {pos = vec3, width = number, index = integer} ; index U32_MAX pour insérer à la fin.
---@return integer  Id du nouveau nœud (valeur renvoyée par insertNode).
function editor_api_roadRiver_editor.addRoadNode(roadObjectId, nodeInfo) end

--- Crée un maillage à nœuds du type donné. Pour 'River', pose des valeurs par défaut (ondulations, vitesses, couleur de base 45 108 171 255, textures d'eau). Applique fields via editor.pasteFields, l'enregistre sous un nom unique « New<type> », l'ajoute à MissionGroup, positionne l'objet sur le premier nœud et ajoute les nœuds.
---Source : lua/ge/extensions/editor/api/roadRiver.lua:154
---@param type string Classe de l'objet, ex. 'River'.
---@param nodes table Liste de {pos, width, depth, normal}.
---@param fields table Champs à appliquer.
---@return integer  Id du maillage.
function editor_api_roadRiver_editor.createMesh(type, nodes, fields) end

--- Crée un DecalRoad (improvedSpline, matériau BlankWhite), l'enregistre, applique roadInfo via editor.pasteFields, l'ajoute à MissionGroup puis ajoute les nœuds. Sans terrain dans le niveau, overObjects est forcé à true.
---Source : lua/ge/extensions/editor/api/roadRiver.lua:67
---@param nodes table Liste de {pos = vec3, width = number}.
---@param roadInfo table Champs à appliquer à la route (ex. overObjects).
---@return integer  Id de la route créée.
function editor_api_roadRiver_editor.createRoad(nodes, roadInfo) end

--- Supprime un maillage via editor.deleteObject.
---Source : lua/ge/extensions/editor/api/roadRiver.lua:202
---@param meshObjectId integer Id du maillage.
function editor_api_roadRiver_editor.deleteMesh(meshObjectId) end

--- Supprime un nœud d'un maillage.
---Source : lua/ge/extensions/editor/api/roadRiver.lua:149
---@param mesh table Objet maillage.
---@param nodeID integer Index du nœud.
function editor_api_roadRiver_editor.deleteMeshNode(mesh, nodeID) end

--- Supprime une route, récursivement ses routes enfants (champ childRoads) et ses décorations (decorationIDs), la retire des listes et marque l'éditeur modifié.
---Source : lua/ge/extensions/editor/api/roadRiver.lua:91
---@param roadObjectId integer Id de la route.
function editor_api_roadRiver_editor.deleteRoad(roadObjectId) end

--- Supprime un nœud de route et met à jour ses sommets.
---Source : lua/ge/extensions/editor/api/roadRiver.lua:120
---@param roadObjectId integer Id de la route.
---@param nodeID integer Index du nœud.
function editor_api_roadRiver_editor.deleteRoadNode(roadObjectId, nodeID) end

--- Renvoie la table des routes connues (clé = id, valeur true).
---Source : lua/ge/extensions/editor/api/roadRiver.lua:207
---@return table<integer, boolean>  allRoads.
function editor_api_roadRiver_editor.getAllRoads() end

--- Renvoie les points médians mémorisés par route (rempli seulement si roadTemplates.general.loadTemplates est actif).
---Source : lua/ge/extensions/editor/api/roadRiver.lua:211
---@return table<integer, table>  roadSplines.
function editor_api_roadRiver_editor.getAllSplines() end

--- Lit tous les nœuds d'un objet : pos, width, et depth/normal si l'objet fournit getNodeDepth/getNodeNormal.
---Source : lua/ge/extensions/editor/api/roadRiver.lua:127
---@param object table Objet route/maillage.
---@return table  Liste de {pos, width, depth?, normal?}.
function editor_api_roadRiver_editor.getNodes(object) end

--- Réinitialise les listes puis parcourt tous les DecalRoad du niveau pour les enregistrer. Journalise une erreur pour un nom invalide (commençant par des chiffres).
---Source : lua/ge/extensions/editor/api/roadRiver.lua:215
function editor_api_roadRiver_editor.initializeLevelRoadsVertices() end

--- Appelle regenerate() sur toutes les routes connues.
---Source : lua/ge/extensions/editor/api/roadRiver.lua:229
function editor_api_roadRiver_editor.regenerateAllDecalRoads() end

--- Vide les listes locales allRoads et roadSplines.
---Source : lua/ge/extensions/editor/api/roadRiver.lua:21
function editor_api_roadRiver_editor.resetRoadList() end

--- Change la profondeur d'un nœud (maillages type rivière).
---Source : lua/ge/extensions/editor/api/roadRiver.lua:51
---@param object table Objet maillage.
---@param nodeID integer Index du nœud.
---@param depth number Profondeur.
function editor_api_roadRiver_editor.setNodeDepth(object, nodeID, depth) end

--- Déplace un nœud.
---Source : lua/ge/extensions/editor/api/roadRiver.lua:56
---@param object table Objet route/maillage.
---@param nodeID integer Index du nœud.
---@param position vec3 Nouvelle position.
function editor_api_roadRiver_editor.setNodePosition(object, nodeID, position) end

--- Change la largeur d'un nœud de route ou de maillage.
---Source : lua/ge/extensions/editor/api/roadRiver.lua:46
---@param object table Objet route/maillage.
---@param nodeID integer Index du nœud.
---@param width number Largeur.
function editor_api_roadRiver_editor.setNodeWidth(object, nodeID, width) end

--- Enregistre la route dans allRoads et, si les templates de route sont activés, mémorise les positions médianes de ses arêtes (roadSplines). Journalise une erreur si road est nil.
---Source : lua/ge/extensions/editor/api/roadRiver.lua:9
---@param road table Objet DecalRoad.
function editor_api_roadRiver_editor.updateRoadVertices(road) end

