---@meta
-- tim19Atlas stub generated from lua/common/graphpath.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Graphe de routes pondéré et algorithmes de recherche de chemin utilisés par l'IA et le navigateur. newGraphpath() crée un graphe (nœuds nommés, arêtes bidirectionnelles avec longueur, drivabilité, voies, sens unique, positions et rayons) ; les méthodes calculent plus court chemin (Dijkstra avec tas minimal), chemins par arêtes avec pénalité de virage, chemin point-à-point, chemins aléatoires/fuite/poursuite, composantes fortement connexes et graphe minorant. Un moddeur l'utilise pour requêter le réseau routier (map.getGraphpath()) ou construire son propre graphe.
--- Accès : `require("graphpath")`
---@class graphpath
local graphpath = {}

--- Crée un graphe vide. Les paramètres ne servent qu'à pré-allouer les tables.
---Source : lua/common/graphpath.lua:123
---@param nodeCount integer|nil Nombre de nœuds prévu (pré-allocation).
---@param edgeCount integer|nil Ignoré par le code.
---@return table  Objet Graphpath (champs graph, positions, radius, edgeListCount).
function graphpath.newGraphpath(nodeCount, edgeCount) end

--- Crée un tas minimal (file de priorité) avec les clés dans la table elle-même et les valeurs dans vals.
---Source : lua/common/graphpath.lua:47
---@return table  Objet minheap.
function graphpath.newMinheap() end

--- Graphe non orienté de nœuds identifiés par des clés (chaînes), avec tables graph[n1][n2] = données d'arête, positions[n] (vec3), radius[n] (largeur/demi-largeur de route).
---@class graphpath_Graphpath
local graphpath_Graphpath = {}

--- Implémentation de la recherche point à point : plusieurs nœuds/arêtes d'accès possibles à la source (fournis par l'itérateur iter) et sortie vers targetPos par projection sur les arêtes ; yieldFn optionnel appelé à chaque itération.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/graphpath.lua:704
---@param sourcePos vec3 Position source.
---@param iter function Itérateur renvoyant (nœud ou {n1,n2}, coût, xnorm) du plus proche au plus éloigné.
---@param targetPos vec3 Position cible.
---@param cutOffDrivability number|nil Seuil de drivabilité (défaut 0).
---@param dirMult number|nil Pénalité de contresens.
---@param penaltyAboveCutoff number|nil Défaut 1.
---@param penaltyBelowCutoff number|nil Défaut 10000.
---@param wZ number|nil Poids vertical (défaut 1).
---@param yieldFn function|nil Appelée à chaque itération.
---@return table  Chemin (nœuds) ; {} si impossible ou si le chemin direct est meilleur.
function graphpath_Graphpath:_getPointToPointPathImpl(sourcePos, iter, targetPos, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wZ, yieldFn) end

--- Comme uniEdge mais attribue aussi un identifiant d'arête eId (deux identifiants consécutifs par arête, un par sens) ; nécessaire pour getEdgePath et l'index d'arêtes.
---Source : lua/common/graphpath.lua:218
---@param inNode any Nœud d'entrée.
---@param outNode any Nœud de sortie.
---@param dist number|nil Longueur (défaut 1).
---@param drivability number|nil Drivabilité.
---@param speedLimit number|nil Vitesse limite.
---@param lanes string|nil Chaîne des voies.
---@param oneWay boolean|nil Sens unique.
---@param gated number|boolean|nil Barrière.
---@param inPos vec3|nil Position à inNode.
---@param inRad number|nil Rayon à inNode.
---@param outPos vec3|nil Position à outNode.
---@param outRad number|nil Rayon à outNode.
function graphpath_Graphpath:bidiEdge(inNode, outNode, dist, drivability, speedLimit, lanes, oneWay, gated, inPos, inRad, outPos, outRad) end

--- Remplace la table graph par une table vide (positions et rayons conservés).
---Source : lua/common/graphpath.lua:173
function graphpath_Graphpath:clear() end

--- Ajoute une arête simple de sp vers ep (len = dist) et crée ep si absent. Une seule direction est stockée (graph[sp][ep]).
---Source : lua/common/graphpath.lua:177
---@param sp any Nœud de départ.
---@param ep any Nœud d'arrivée.
---@param dist number|nil Longueur/coût (défaut 1).
function graphpath_Graphpath:edge(sp, ep, dist) end

--- Nombre de voies de l'arête allant de fromNode vers toNode (compte les '+' ou '-' de la chaîne lanes selon le sens).
---Source : lua/common/graphpath.lua:515
---@param fromNode any Nœud de départ.
---@param toNode any Nœud d'arrivée.
---@return integer  Nombre de voies dans ce sens.
function graphpath_Graphpath:edgeLanesInDirection(fromNode, toNode) end

--- Exporte le graphe sous forme compacte (une entrée par arête, sans doublon) pour sauvegarde ou envoi à une autre VM.
---Source : lua/common/graphpath.lua:133
---@param edgeCount integer|nil Nombre d'arêtes attendu (pré-allocation).
---@return table  {edgeData, positions, radius, edgeDataCount, nodeCount}.
function graphpath_Graphpath:export(edgeCount) end

--- Construit la table edgeList (eId vers nœud) à partir des arêtes créées par bidiEdge.
---Source : lua/common/graphpath.lua:250
function graphpath_Graphpath:generateEdgeIndex() end

--- Parcours en profondeur dans un rayon autour de start ; renvoie les carrefours (nœuds avec au moins 2 nouveaux voisins) et leurs liens.
---Source : lua/common/graphpath.lua:1416
---@param start any Nœud de départ.
---@param maxRadius number|nil Rayon max en m (défaut 1000).
---@return table[]|nil  Liste de {node, links, sqDist} ; nil si start inconnu.
function graphpath_Graphpath:getBranchNodesAround(start, maxRadius) end

--- Chemin pour poursuivre une cible : choisit le nœud devant selon la position/vitesse de la cible et calcule un chemin vers le nœud de la cible.
---Source : lua/common/graphpath.lua:1456
---@param nodeBehind any Nœud derrière le poursuivant.
---@param nodeAhead any Nœud devant le poursuivant.
---@param targetNodeBehind any Nœud derrière la cible.
---@param targetNodeAhead any Nœud devant la cible.
---@param mePos vec3 Position du poursuivant.
---@param meVel vec3 Vitesse du poursuivant.
---@param targetPos vec3 Position de la cible.
---@param targetVel vec3 Vitesse de la cible.
---@param dirMult number|nil Pénalité de contresens.
---@return table  Chemin de nœuds.
function graphpath_Graphpath:getChasePath(nodeBehind, nodeAhead, targetNodeBehind, targetNodeAhead, mePos, meVel, targetPos, targetVel, dirMult) end

--- Identifiant d'arête orientée de fromNode vers toNode (eId pour le sens inNode->outNode, eId+1 pour l'inverse).
---Source : lua/common/graphpath.lua:263
---@param fromNode any Nœud de départ.
---@param toNode any Nœud d'arrivée.
---@return integer  Identifiant d'arête.
function graphpath_Graphpath:getEdgeIdFromNodes(fromNode, toNode) end

--- Plus court chemin sur des arêtes (états = arêtes orientées) avec pénalités de virage (gauche/droite plus forte aux carrefours, demi-tour très pénalisé selon la largeur de route). Part de l'arête bNode vers fNode ; le résultat est une liste de nœuds.
---Source : lua/common/graphpath.lua:523
---@param bNode any Nœud derrière.
---@param fNode any Nœud devant (direction de départ).
---@param goal any Nœud but.
---@param dirMult number|nil Pénalité de contresens (au moins 1).
---@return table|nil  Liste de nœuds ; nil si les nœuds ne forment pas une arête valide ou si le but est inconnu.
function graphpath_Graphpath:getEdgePath(bNode, fNode, goal, dirMult) end

--- Positions des extrémités d'une arête : position spécifique à l'arête (inPos/outPos) si elle existe, sinon position du nœud.
---Source : lua/common/graphpath.lua:271
---@param n1id any Premier nœud.
---@param n2id any Second nœud.
---@return vec3  Position côté n1id.
---@return vec3  Position côté n2id.
function graphpath_Graphpath:getEdgePositions(n1id, n2id) end

--- Rayons aux extrémités d'une arête (rayon propre à l'arête sinon celui du nœud).
---Source : lua/common/graphpath.lua:277
---@param n1id any Premier nœud.
---@param n2id any Second nœud.
---@return number  Rayon côté n1id.
---@return number  Rayon côté n2id.
function graphpath_Graphpath:getEdgeRadii(n1id, n2id) end

--- Plus court chemin entre deux nœuds avec pénalités de drivabilité (seuil) et de contresens.
---Source : lua/common/graphpath.lua:1266
---@param start any Nœud de départ.
---@param goal any Nœud d'arrivée.
---@param cutOffDrivability number|nil Seuil (défaut 0).
---@param dirMult number|nil Pénalité de contresens.
---@param penaltyAboveCutoff number|nil Défaut 1.
---@param penaltyBelowCutoff number|nil Défaut 10000.
---@return table  Chemin de nœuds.
function graphpath_Graphpath:getFilteredPath(start, goal, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff) end

--- Construit gloutonnement un chemin de fuite loin de chasePos, avec une randomisation de direction, jusqu'à dépasser pathLenLimit.
---Source : lua/common/graphpath.lua:1480
---@param startNode any Nœud de départ.
---@param initialDir vec3 Direction initiale.
---@param chasePos vec3 Position du poursuivant.
---@param pathLenLimit number|nil Longueur à atteindre en m (défaut 100).
---@param rndDirCoef number|nil Amplitude de la randomisation de direction (défaut 0).
---@param rndDistCoef number|nil Croissance de la randomisation avec la distance (défaut 0.05, max 1).
---@return table|nil  Chemin de nœuds ; nil si startNode inconnu.
function graphpath_Graphpath:getFleePath(startNode, initialDir, chasePos, pathLenLimit, rndDirCoef, rndDistCoef) end

--- Flux (capacité) avant et arrière d'une arête orientée, déduits du rayon du nœud de sortie réparti sur les voies.
---Source : lua/common/graphpath.lua:1035
---@param inNode any Nœud d'entrée.
---@param outNode any Nœud de sortie.
---@return number  Flux dans le sens inNode->outNode.
---@return number  Flux dans le sens inverse.
function graphpath_Graphpath:getFlows(inNode, outNode) end

--- Parcourt le graphe dans un rayon radius autour de start et renvoie le nœud le plus éloigné, ou le plus avancé selon la direction dir.
---Source : lua/common/graphpath.lua:1375
---@param start any Nœud de départ.
---@param radius number Rayon de recherche (m).
---@param dir vec3|nil Si fourni, score = projection sur dir au lieu de la distance carrée.
---@return any|nil  Nœud trouvé, nil si start inconnu.
function graphpath_Graphpath:getMaxNodeAround(start, radius, dir) end

--- Inverse de getEdgeIdFromNodes : renvoie les deux nœuds de l'arête orientée (départ, arrivée).
---Source : lua/common/graphpath.lua:267
---@param eId integer Identifiant d'arête.
---@return any  Nœud de départ.
---@return any  Nœud d'arrivée.
function graphpath_Graphpath:getNodesFromEdgeId(eId) end

--- Plus court chemin (Dijkstra) entre deux nœuds en minimisant la somme des len ; les arêtes sens unique parcourues à contresens sont multipliées par dirMult.
---Source : lua/common/graphpath.lua:468
---@param start any Nœud de départ.
---@param goal any Nœud d'arrivée.
---@param dirMult number|nil Pénalité de contresens (défaut 1).
---@return table  Liste de nœuds ; {} si départ ou but inconnu.
function graphpath_Graphpath:getPath(start, goal, dirMult) end

--- Chemin vers goal qui évite stayAwayPos : le coût des arêtes est pondéré par (distance à mePos / distance à stayAwayPos).
---Source : lua/common/graphpath.lua:1339
---@param start any Nœud de départ.
---@param goal any Nœud but.
---@param mePos vec3 Position de l'agent.
---@param stayAwayPos vec3 Position à éviter.
---@param dirMult number|nil Pénalité de contresens.
---@return table  Chemin de nœuds.
function graphpath_Graphpath:getPathAwayFrom(start, goal, mePos, stayAwayPos, dirMult) end

--- Choisit un chemin aléatoire pondéré pour un trafic IA à partir de start, en privilégiant routes drivables, continuité de direction et capacité (flux de voies) ; s'arrête à pathLenLim mètres de mePos, jusqu'à 10 candidats tirés au hasard.
---Source : lua/common/graphpath.lua:927
---@param start any Nœud de départ.
---@param mePos vec3 Position de référence pour la distance.
---@param pathLenLim number Distance minimale du chemin (m).
---@param illegalDirPenalty number|nil Non utilisé dans le code.
---@param initDir vec3 Direction initiale (x, y utilisés).
---@return table  Chemin de nœuds ({} si start inconnu).
function graphpath_Graphpath:getPathT(start, mePos, pathLenLim, illegalDirPenalty, initDir) end

--- Variante de getPathT qui réutilise le chemin précédent comme état pour continuer de façon cohérente (le dernier nœud du chemin précédent doit être start).
---Source : lua/common/graphpath.lua:1045
---@param start any Nœud de départ.
---@param mePos vec3|nil Position de référence (défaut position de start).
---@param pathLenLim number|nil Longueur minimale du chemin (défaut 150).
---@param state vec3|table|nil Direction initiale (vec3) ou chemin précédent (liste de nœuds).
---@return table  Chemin de nœuds ({} si impossible).
function graphpath_Graphpath:getPathTWithState(start, mePos, pathLenLim, state) end

--- Plus court chemin entre un point (vec3) et un nœud, dans un sens ou l'autre (si start est un cdata/vec3, le chemin est calculé depuis le nœud target et inversé). Pénalise la distance entre le point et la route et peut finir sur le milieu d'une arête (premier élément du tableau = nœud de l'arête qui contient la projection du point).
---Source : lua/common/graphpath.lua:603
---@param start any Nœud ou vec3.
---@param target any Vec3 ou nœud (l'autre côté).
---@param cutOffDrivability number|nil Seuil de drivabilité (défaut 0).
---@param dirMult number|nil Pénalité de contresens.
---@param penaltyAboveCutoff number|nil Multiplicateur au-dessus du seuil (défaut 1).
---@param penaltyBelowCutoff number|nil Multiplicateur sous le seuil (défaut 10000).
---@param wZ number|nil Poids de l'écart vertical dans la distance (défaut 4).
---@return table  Chemin de nœuds ({} si départ inconnu).
function graphpath_Graphpath:getPointNodePath(start, target, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wZ) end

--- Chemin entre deux positions via le réseau routier (version synchrone de _getPointToPointPathImpl).
---Source : lua/common/graphpath.lua:882
---@param sourcePos vec3 Position source.
---@param iter function Itérateur de nœuds/arêtes proches de la source.
---@param targetPos vec3 Position cible.
---@param cutOffDrivability number|nil Seuil de drivabilité.
---@param dirMult number|nil Pénalité de contresens.
---@param penaltyAboveCutoff number|nil Multiplicateur au-dessus du seuil.
---@param penaltyBelowCutoff number|nil Multiplicateur sous le seuil.
---@param wZ number|nil Poids vertical.
---@return table  Chemin de nœuds.
function graphpath_Graphpath:getPointToPointPath(sourcePos, iter, targetPos, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wZ) end

--- Comme getPointToPointPath mais cède la main (job.yield) toutes les 350 itérations (ou global_yieldInterval) pour ne pas bloquer le jeu ; à appeler depuis un job du jobsystem.
---Source : lua/common/graphpath.lua:888
---@param job table|nil Job de core_jobsystem (avec .yield).
---@param sourcePos vec3 Position source.
---@param iter function Itérateur de nœuds/arêtes proches de la source.
---@param targetPos vec3 Position cible.
---@param cutOffDrivability number|nil Seuil de drivabilité.
---@param dirMult number|nil Pénalité de contresens.
---@param penaltyAboveCutoff number|nil Multiplicateur au-dessus du seuil.
---@param penaltyBelowCutoff number|nil Multiplicateur sous le seuil.
---@param wZ number|nil Poids vertical.
---@return table  Chemin de nœuds.
function graphpath_Graphpath:getPointToPointPathJob(job, sourcePos, iter, targetPos, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wZ) end

--- Chemin aléatoire (jusqu'à 5 candidats à plus de 300 m, tirage pondéré) avec un biais vers la colinéarité des arêtes ; empêche de faire demi-tour vers nodeBehind.
---Source : lua/common/graphpath.lua:1616
---@param nodeAhead any Nœud devant.
---@param nodeBehind any Nœud derrière.
---@param dirMult number|nil Pénalité de contresens.
---@return table  Chemin de nœuds ({} si un nœud est inconnu).
function graphpath_Graphpath:getRandomPath(nodeAhead, nodeBehind, dirMult) end

--- Construit gloutonnement un chemin aléatoire qui privilégie la continuité de direction, jusqu'à dépasser pathLenLimit.
---Source : lua/common/graphpath.lua:1545
---@param startNode any Nœud de départ.
---@param initialDir vec3 Direction initiale.
---@param pathLenLimit number|nil Longueur à atteindre en m (défaut 100).
---@param rndDirCoef number|nil Randomisation de direction (défaut 0).
---@param rndDistCoef number|nil Croissance de la randomisation (défaut 0.05).
---@param oneway boolean|nil Si false, ne pénalise pas les sens uniques pris à contresens (défaut true : pénalisés).
---@return table|nil  Chemin de nœuds ; nil si startNode inconnu.
function graphpath_Graphpath:getRandomPathG(startNode, initialDir, pathLenLimit, rndDirCoef, rndDistCoef, oneway) end

--- Contracte les nœuds de degré 2 : le résultat ne contient que les impasses et carrefours. minor[a][b] est le tableau ordonné des nœuds d'origine reliant a et b (extrémités incluses), symétrique en minor[b][a].
---Source : lua/common/graphpath.lua:373
---@return table  Graphe minorant.
function graphpath_Graphpath:graphMinor() end

--- Reconstruit le graphe depuis le format produit par export (utilise inNode/outNode/eId des arêtes) et l'index des arêtes.
---Source : lua/common/graphpath.lua:147
---@param graphData table Données d'export.
function graphpath_Graphpath:import(graphData) end

--- Nombre total de voies d'une arête et nombre de voies dans le sens inNode->outNode donné ; si lanes est absent, les déduit des rayons (3,45 m par voie).
---Source : lua/common/graphpath.lua:904
---@param inNode any Nœud de départ.
---@param outNode any Nœud d'arrivée.
---@return integer  Voies au total.
---@return integer  Voies dans le sens inNode->outNode.
function graphpath_Graphpath:numOfEdgeLanes(inNode, outNode) end

--- Composantes fortement connexes (Tarjan) en ne suivant que les arêtes de drivabilité exactement 1. Si v est donné, ne calcule que depuis v.
---Source : lua/common/graphpath.lua:dyn
---@param v any|nil Nœud de départ facultatif.
---@return table[]  Liste de composantes ; chaque composante est un dictionnaire nœud=true avec le nombre de nœuds dans la clé [0].
function graphpath_Graphpath:scc(v) end

--- Définit le rayon d'un nœud.
---Source : lua/common/graphpath.lua:292
---@param node any Nœud.
---@param radius number Rayon.
function graphpath_Graphpath:setNodeRadius(node, radius) end

--- Définit la position d'un nœud.
---Source : lua/common/graphpath.lua:283
---@param p any Nœud.
---@param pos vec3 Position.
function graphpath_Graphpath:setPointPosition(p, pos) end

--- Définit position et rayon d'un nœud.
---Source : lua/common/graphpath.lua:287
---@param p any Nœud.
---@param pos vec3 Position.
---@param radius number Rayon.
function graphpath_Graphpath:setPointPositionRadius(p, pos, radius) end

--- Plus court chemin où le coût de chaque arête est multiplié par edgeDict['a\0b'] (défaut 1e20 si absente), avec forte pénalité (x300) pour repartir vers nodeBehind depuis la source ; sert à couvrir un ensemble d'arêtes.
---Source : lua/common/graphpath.lua:1305
---@param source any Nœud de départ.
---@param nodeBehind any Nœud derrière la source.
---@param target any Nœud but.
---@param edgeDict table<string, number> Coefficient par arête, clé node..'\0'..child.
---@param dirMult number|nil Pénalité de contresens.
---@return table  Chemin de nœuds.
function graphpath_Graphpath:spanMap(source, nodeBehind, target, edgeDict, dirMult) end

--- Ajoute une arête riche partagée par les deux sens, sans identifiant d'arête (pas de eId).
---Source : lua/common/graphpath.lua:189
---@param inNode any Nœud d'entrée de l'arête.
---@param outNode any Nœud de sortie.
---@param dist number|nil Longueur (défaut 1).
---@param drivability number|nil Drivabilité de la route (1 = idéale).
---@param speedLimit number|nil Vitesse limite.
---@param lanes string|nil Chaîne des voies ('+' sens inNode->outNode, '-' inverse).
---@param oneWay boolean|nil Sens unique (inNode vers outNode).
---@param gated number|boolean|nil Indicateur de barrière (valeur utilisée comme nombre dans les calculs de getPathT).
---@param inPos vec3|nil Position spécifique de l'extrémité inNode.
---@param inRad number|nil Rayon à inNode.
---@param outPos vec3|nil Position spécifique à outNode.
---@param outRad number|nil Rayon à outNode.
function graphpath_Graphpath:uniEdge(inNode, outNode, dist, drivability, speedLimit, lanes, oneWay, gated, inPos, inRad, outPos, outRad) end

--- File de priorité à clé numérique minimale en tête. Champs : length, vals ; les clés sont stockées aux indices 1..length de la table.
---@class graphpath_minheap
local graphpath_minheap = {}

--- Vide le tas (conserve la table).
---Source : lua/common/graphpath.lua:63
function graphpath_minheap:clear() end

--- Indique si le tas est vide.
---Source : lua/common/graphpath.lua:59
---@return boolean  true si vide.
function graphpath_minheap:empty() end

--- Insère la valeur v avec la clé k.
---Source : lua/common/graphpath.lua:68
---@param k number Clé (priorité, plus petit = sort en premier).
---@param v any Valeur associée.
function graphpath_minheap:insert(k, v) end

--- Clé minimale sans retirer (nil si vide).
---Source : lua/common/graphpath.lua:51
---@return number|nil  Clé minimale.
function graphpath_minheap:peekKey() end

--- Valeur de clé minimale sans retirer.
---Source : lua/common/graphpath.lua:55
---@return any  Valeur.
function graphpath_minheap:peekVal() end

--- Retire et renvoie l'élément de clé minimale.
---Source : lua/common/graphpath.lua:88
---@return number|nil  Clé (nil si vide).
---@return any  Valeur associée.
function graphpath_minheap:pop() end

return graphpath
