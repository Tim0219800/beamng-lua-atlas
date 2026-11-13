---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/link.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module de l'éditeur Road Architect qui relie des routes entre elles. Il détecte si l'extrémité d'une route peut être raccordée à celle d'une autre (profil identique, passage trottoir/sans trottoir, autoroute/urbain, route à sens unique/double, évasement de voies, superposition) et crée la route de jonction correspondante. Il calcule aussi les candidats de jonction en T/Y (une route se terminant au milieu d'une autre) et construit la jonction qui coupe la route tronc. Il s'appuie sur les modules roads, profiles, junctions et utilities de Road Architect.
--- Accès : extension `editor_roadArchitect_link` : `extensions.load("editor_roadArchitect_link")`, puis la globale `editor_roadArchitect_link`
---@class editor_roadArchitect_link
editor_roadArchitect_link = {}

--- Cherche, parmi les routes candidates, la route sur laquelle l'extrémité nIdx de la route rIdx peut s'accrocher en jonction (type 'T' ou 'Y'). Exige que les deux routes aient ou n'aient pas de trottoirs, ignore ponts et superpositions, et retient la candidate la plus proche. Le type vaut 'T' si la route est à peu près perpendiculaire à la route tronc (produit scalaire < 0.4), 'Y' sinon (cas profil identique seulement).
---Source : lua/ge/extensions/editor/roadArchitect/link.lua:1071
---@param rIdx integer Indice de la route qui doit se connecter.
---@param nIdx integer Indice du nœud d'extrémité de cette route (1 = début, sinon fin).
---@param rIdxs integer[] Indices des routes tronc candidates.
---@param nIdxs integer[] Indice du nœud de la route tronc le plus proche, pour chaque candidate.
---@return table|nil  Table { jName, jNode, tName, tNode, type, class } (route de jonction, son nœud, route tronc, son nœud, 'T' ou 'Y', description de la classe) ou nil si aucun candidat.
function editor_roadArchitect_link.computePossibleJct(rIdx, nIdx, rIdxs, nIdxs) end

--- Parcourt les routes candidates rIdxs et teste chaque cas de raccord possible avec la route rIdx1 (identité des profils, trottoirs, autoroute/rural, sens unique/double, évasement). Renvoie le lien le plus proche sous forme de table { r1Name, r1Lie, r2Name, r2Lie, class }, ou nil si aucun raccord n'est possible. nIdx1 == 1 signifie que l'on regarde le début de la route 1, sinon sa fin.
---Source : lua/ge/extensions/editor/roadArchitect/link.lua:371
---@param rIdx1 integer Indice (dans roadMgr.roads) de la route de départ.
---@param nIdx1 integer Indice du nœud d'extrémité de la route de départ (1 = début, sinon fin).
---@param rIdxs integer[] Indices des routes candidates à tester.
---@param nIdxs integer[] Indice du nœud d'extrémité pour chaque route candidate (1 = début, sinon fin), aligné sur rIdxs.
---@return table|nil  Table { r1Name, r1Lie, r2Name, r2Lie, class } décrivant le raccord retenu, ou nil.
function editor_roadArchitect_link.computePossibleLinks(rIdx1, nIdx1, rIdxs, nIdxs) end

--- Construit la jonction proposée : sauvegarde l'état des routes, coupe la route tronc au nœud tNode en deux routes, supprime les nœuds proches, repousse les extrémités au bord de la sphère de jonction, crée la jonction (T) avec la route de jonction puis raccorde les trois branches par des liaisons 'Perfect'. Si une des routes tronc résultantes a moins de 2 nœuds, restaure l'état d'origine et sort.
---Source : lua/ge/extensions/editor/roadArchitect/link.lua:1180
---@param candJct table Candidat renvoyé par computePossibleJct ({ jName, jNode, tName, tNode, type, class }).
function editor_roadArchitect_link.createSplitJunction(candJct) end

--- Crée la route de raccord décrite par le lien (fusion en une seule route pour 'Perfect', route de transition ou de taper pour les autres classes). Le choix de la fonction interne dépend de link.class. Ne fait rien si la classe est inconnue.
---Source : lua/ge/extensions/editor/roadArchitect/link.lua:1020
---@param link table Table { r1Name, r1Lie, r2Name, r2Lie, class } telle que renvoyée par computePossibleLinks.
function editor_roadArchitect_link.joinRoads(link) end

