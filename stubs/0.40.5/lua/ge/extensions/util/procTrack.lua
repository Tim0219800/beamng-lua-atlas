---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/procTrack.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Générateur procédural de parcours de type gymkhana, utilisé par les scénarios de génération de piste. À partir de rectangles de départ (params.startingRects), il découpe la zone avec util/rectangleGen pour obtenir un graphe de points clés, cherche un chemin aléatoire qui les traverse (parcours en profondeur avec retour arrière), le transforme en tracé sinueux (virages, boucles, lignes droites), puis crée dans le niveau, sous un SimGroup « GymkhanaArena », la route (DecalRoad), des plots, des portes, des anneaux de béton, des barils et des waypoints BeamNGWaypoint pour le scénario courant. Une graine (seed) rend la piste reproductible ; elle peut aussi s'exprimer sous forme de mots (intToWords/wordsToInt). Les objets utilisent des modèles du niveau driver_training.
--- Accès : extension `util_procTrack` : `extensions.load("util_procTrack")`, puis la globale `util_procTrack`
---@class util_procTrack
util_procTrack = {}

--- Vérifie et complète les paramètres : fixe la graine, appelle populateFunction, calcule la densité et le nombre de nœuds cible (borné par minNodes et maxNodes) et charge util/rectangleGen.
---Source : lua/ge/extensions/util/procTrack.lua:244
function util_procTrack.checkParams() end

--- Crée les plots, portes et anneaux de béton aux nœuds (cercle ou plot central selon le rayon, porte pour une ligne droite ou un rayon nul).
---Source : lua/ge/extensions/util/procTrack.lua:975
---@param nodes table Nœuds du tracé
function util_procTrack.createPylons(nodes) end

--- Crée les positions et angles des waypoints (objets BeamNGWaypoint directionnels) et remplit scenario.nodes / scenario.lapConfig du scénario courant.
---Source : lua/ge/extensions/util/procTrack.lua:1118
---@param nodes table Nœuds du tracé
function util_procTrack.createWaypointsForScenario(nodes) end

--- Extrait du chemin les informations de tracé (angles, distances, normales), détermine les rayons et les types de nœuds (droite, courbe, boucle, porte) puis calcule les points de route.
---Source : lua/ge/extensions/util/procTrack.lua:589
---@param path table Chemin de makePath
---@return table  Nœuds avec leurs points de route (points)
function util_procTrack.createWindingPath(path) end

--- Crée les objets DecalRoad de la route (matériaux tread_marks_clean et road_orange_markings) dans le groupe GymkhanaArena.
---Source : lua/ge/extensions/util/procTrack.lua:862
---@param nodes table Nœuds avec points de route
function util_procTrack.createWindingRoad(nodes) end

--- Teste si l'ajout de la prochaine arête depuis le nœud courant est interdit.
---Source : lua/ge/extensions/util/procTrack.lua:498
---@param current table Nœud courant
---@param path table Chemin en cours
---@param nodes table Nœuds du graphe
---@param finishNode table|nil Nœud d'arrivée
---@return boolean  true si l'arête n'est pas autorisée
function util_procTrack.currentEdgeNotOK(current, path, nodes, finishNode) end

--- Décore les nœuds de départ et d'arrivée.
---Source : lua/ge/extensions/util/procTrack.lua:918
---@param nodes table Nœuds du tracé
function util_procTrack.decorateStartAndFinish(nodes) end

--- Détermine les angles d'entrée et de sortie autour des cercles (virages).
---Source : lua/ge/extensions/util/procTrack.lua:756
---@param nodes table Nœuds du tracé
function util_procTrack.determineInOutAngle(nodes) end

--- Distance euclidienne 2D du point (a, b) au point (x, y).
---Source : lua/ge/extensions/util/procTrack.lua:1264
---@param a number X du premier point
---@param b number Y du premier point
---@param x number X du second point
---@param y number Y du second point
---@return number  Distance
function util_procTrack.dist(a, b, x, y) end

--- Teste si l'ajout de nextNode au chemin couperait le graphe restant en parties non reliées.
---Source : lua/ge/extensions/util/procTrack.lua:515
---@param path table Chemin en cours
---@param nextNode table Nœud candidat
---@param nodes table Nœuds du graphe
---@return boolean  true si le graphe serait scindé
function util_procTrack.edgeCreatesSplitGraph(path, nextNode, nodes) end

--- Extrait du chemin les informations de base : angles, distances, normales, etc.
---Source : lua/ge/extensions/util/procTrack.lua:634
---@param path table Chemin de makePath
---@return table  Nœuds enrichis
function util_procTrack.getBaseInformationFromPath(path) end

--- Renvoie une nouvelle table de paramètres par défaut pour un gymkhana (voir notes).
---Source : lua/ge/extensions/util/procTrack.lua:10
---@return table  Paramètres par défaut
function util_procTrack.getDefaultParams() end

--- Calcule tous les points nécessaires pour créer la route autour des nœuds.
---Source : lua/ge/extensions/util/procTrack.lua:788
---@param nodes table Nœuds du tracé
function util_procTrack.getPathRoadNodes(nodes) end

--- Transforme une position locale du parcours en position globale (rotation de rootAngleRad puis décalage de rootX, rootY, rootZ).
---Source : lua/ge/extensions/util/procTrack.lua:1391
---@param xx number X local
---@param yy number Y local
---@param zz number Z local
---@return table  {x, y, z} global
function util_procTrack.getPosition(xx, yy, zz) end

--- Convertit un angle local (degrés) en angle global en retirant la rotation de la racine du parcours.
---Source : lua/ge/extensions/util/procTrack.lua:1387
---@param dd number Angle local en degrés
---@return number  Angle global en degrés
function util_procTrack.getRotationDeg(dd) end

--- Renvoie la graine de la piste courante.
---Source : lua/ge/extensions/util/procTrack.lua:1429
---@return integer|nil  Graine, ou nil si aucune piste générée
function util_procTrack.getSeed() end

--- Convertit une graine entière en suite de mots de 5 lettres concaténés (base de la taille de la liste de mots).
---Source : lua/ge/extensions/util/procTrack.lua:1461
---@param int integer Graine
---@return string  Mots concaténés
function util_procTrack.intToWords(int) end

--- Teste si un élément est présent dans une liste.
---Source : lua/ge/extensions/util/procTrack.lua:571
---@param list table Liste
---@param element any Élément cherché
---@return boolean  true si présent
function util_procTrack.isInList(list, element) end

--- Crée un baril de signalisation (TSStatic barrelmarker_<skin>.dae), tourné de 180 degrés en plus de rot.
---Source : lua/ge/extensions/util/procTrack.lua:1358
---@param pos number[] Position locale {x, y, z}
---@param rot number|nil Rotation locale en degrés (défaut 0)
---@param skin string Suffixe du modèle (obligatoire)
function util_procTrack.makeBarrel(pos, rot, skin) end

--- Génère le graphe de points clés (via rectangleGen.getGraph) et, si debug.neighbours est vrai, dessine des routes de débogage entre voisins.
---Source : lua/ge/extensions/util/procTrack.lua:307
---@return table|nil  Graphe {nodes, start, finish}
function util_procTrack.makeBaseNodePositions() end

--- Crée un anneau de béton (TSStatic ring_2m.dae) de rayon donné (minimum 1).
---Source : lua/ge/extensions/util/procTrack.lua:1329
---@param pos number[] Position locale {x, y, z}
---@param radius number Rayon (échelle X et Y)
function util_procTrack.makeConcreteRing(pos, radius) end

--- Crée une porte (TSStatic gate.dae) à une position locale.
---Source : lua/ge/extensions/util/procTrack.lua:1302
---@param pos number[] Position locale {x, y, z}
---@param rot number|nil Rotation locale en degrés (défaut 0)
function util_procTrack.makeGate(pos, rot) end

--- Fonction principale : valide les paramètres, génère les points, le chemin, la route, les plots/portes, les waypoints du scénario, puis appelle decoration.afterFunction et affiche un message avec la graine.
---Source : lua/ge/extensions/util/procTrack.lua:120
---@param inParams table Paramètres (voir getDefaultParams)
function util_procTrack.makeGymkhana(inParams) end

--- Cherche un chemin aléatoire dans le graphe, par parcours en profondeur avec retour arrière. Utilise les nœuds de départ/arrivée (drapeaux de rectangles, sinon les plus proches de params.start/finish). En mode circuit fermé, choisit un voisin du départ qui ne coupe pas le graphe.
---Source : lua/ge/extensions/util/procTrack.lua:368
---@param graph table Graphe de makeBaseNodePositions
---@return table|nil  Liste de nœuds du chemin, ou nil si aucun chemin trouvé
function util_procTrack.makePath(graph) end

--- Crée un plot (TSStatic barriersegment du niveau driver_training) à une position locale du parcours.
---Source : lua/ge/extensions/util/procTrack.lua:1269
---@param pos number[] Position locale {x, y, z}
---@param size number|number[]|nil Échelle : nombre (hauteur, largeur 0,33) ou {x, y, z} (défaut {0.33, 0.33, 1})
---@param rot number|nil Rotation locale en degrés (défaut 0)
---@param skin string|nil Suffixe du nom de modèle (défaut vide)
function util_procTrack.makePylon(pos, size, rot, skin) end

--- Régénère toute la piste en reprenant populateFunction, scenarionParam et afterFunction des paramètres courants, avec la graine donnée. makeGymkhana doit avoir été appelée avant.
---Source : lua/ge/extensions/util/procTrack.lua:109
---@param seed integer|nil Nouvelle graine (nil : une graine aléatoire est tirée)
function util_procTrack.reGenerate(seed) end

--- Convertit une suite de mots de 5 lettres (graine sous forme de mots) en entier.
---Source : lua/ge/extensions/util/procTrack.lua:1437
---@param word string Mots concaténés (5 lettres chacun)
---@return integer  Graine entière
function util_procTrack.wordsToInt(word) end

