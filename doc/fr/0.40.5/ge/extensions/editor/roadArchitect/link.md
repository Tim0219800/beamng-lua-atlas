# `editor_roadArchitect_link`

*Fichier : `lua/ge/extensions/editor/roadArchitect/link.lua` · VM : Game Engine (GE) · 1478 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_link` : `extensions.load("editor_roadArchitect_link")`, puis la globale `editor_roadArchitect_link`

Module de l'éditeur Road Architect qui relie des routes entre elles. Il détecte si l'extrémité d'une route peut être raccordée à celle d'une autre (profil identique, passage trottoir/sans trottoir, autoroute/urbain, route à sens unique/double, évasement de voies, superposition) et crée la route de jonction correspondante. Il calcule aussi les candidats de jonction en T/Y (une route se terminant au milieu d'une autre) et construit la jonction qui coupe la route tronc. Il s'appuie sur les modules roads, profiles, junctions et utilities de Road Architect.

## Remarques

- Les liaisons sont décrites par une table { r1Name, r1Lie, r2Name, r2Lie, class } où r1Lie/r2Lie valent 'start' ou 'end' (extrémité de la route concernée) et class est l'un de : 'Perfect', 'Overlay -> Overlay', '1Way Hwy -> Rural', '1Way Rural -> Hwy', 'Sidewalk -> No Sidewalk', 'No Sidewalk -> Sidewalk', 'Urban Taper Up', 'Urban Taper Down', 'Urban 1Way -> 2Way', 'Urban 2Way -> 1Way', 'Urban -> Highway', 'Highway -> Urban', 'Highway Taper Up', 'Highway Taper Down', 'Highway 1Way -> 2Way', 'Highway 2Way -> 1Way'.
- Bug probable dans computePossibleLinks : la boucle de choix du candidat le plus proche commence à i = 2 avec bestIdx = 1 par défaut. Le premier lien trouvé (links[1]) n'est donc jamais comparé en distance ; dès qu'il y a au moins deux liens, l'un des suivants est toujours retenu. S'il n'y a aucun lien, la fonction renvoie nil.
- Les routes de jonction (isJctRoad) sont ignorées comme cibles de liaison. Les ponts (isBridge) ne sont pas liés ; les superpositions (isOverlay) ne se lient qu'entre elles.
- Les ponts et superpositions sont exclus du calcul de jonction (computePossibleJct renvoie nil).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_link.computePossibleJct(rIdx, nIdx, rIdxs, nIdxs)` | Cherche, parmi les routes candidates, la route sur laquelle l'extrémité nIdx de la route rIdx peut s'accrocher en jonction (type 'T' ou 'Y'). Exige que les deux routes aient ou n'aient pas de trottoirs, ignore ponts et superpositions, et retient la candidate la plus proche. Le type vaut 'T' si la route est à peu près perpendiculaire à la route tronc (produit scalaire < 0.4), 'Y' sinon (cas profil identique seulement). | 1071 |
| `editor_roadArchitect_link.computePossibleLinks(rIdx1, nIdx1, rIdxs, nIdxs)` | Parcourt les routes candidates rIdxs et teste chaque cas de raccord possible avec la route rIdx1 (identité des profils, trottoirs, autoroute/rural, sens unique/double, évasement). Renvoie le lien le plus proche sous forme de table { r1Name, r1Lie, r2Name, r2Lie, class }, ou nil si aucun raccord n'est possible. nIdx1 == 1 signifie que l'on regarde le début de la route 1, sinon sa fin. | 371 |
| `editor_roadArchitect_link.createSplitJunction(candJct)` | Construit la jonction proposée : sauvegarde l'état des routes, coupe la route tronc au nœud tNode en deux routes, supprime les nœuds proches, repousse les extrémités au bord de la sphère de jonction, crée la jonction (T) avec la route de jonction puis raccorde les trois branches par des liaisons 'Perfect'. Si une des routes tronc résultantes a moins de 2 nœuds, restaure l'état d'origine et sort. | 1180 |
| `editor_roadArchitect_link.joinRoads(link)` | Crée la route de raccord décrite par le lien (fusion en une seule route pour 'Perfect', route de transition ou de taper pour les autres classes). Le choix de la fonction interne dépend de link.class. Ne fait rien si la classe est inconnue. | 1020 |

### Détail des paramètres

#### `editor_roadArchitect_link.computePossibleJct(rIdx, nIdx, rIdxs, nIdxs)`

Cherche, parmi les routes candidates, la route sur laquelle l'extrémité nIdx de la route rIdx peut s'accrocher en jonction (type 'T' ou 'Y'). Exige que les deux routes aient ou n'aient pas de trottoirs, ignore ponts et superpositions, et retient la candidate la plus proche. Le type vaut 'T' si la route est à peu près perpendiculaire à la route tronc (produit scalaire < 0.4), 'Y' sinon (cas profil identique seulement).

- `rIdx` (*integer*) : Indice de la route qui doit se connecter.
- `nIdx` (*integer*) : Indice du nœud d'extrémité de cette route (1 = début, sinon fin).
- `rIdxs` (*integer[]*) : Indices des routes tronc candidates.
- `nIdxs` (*integer[]*) : Indice du nœud de la route tronc le plus proche, pour chaque candidate.
- **renvoie** : table|nil Table { jName, jNode, tName, tNode, type, class } (route de jonction, son nœud, route tronc, son nœud, 'T' ou 'Y', description de la classe) ou nil si aucun candidat.

#### `editor_roadArchitect_link.computePossibleLinks(rIdx1, nIdx1, rIdxs, nIdxs)`

Parcourt les routes candidates rIdxs et teste chaque cas de raccord possible avec la route rIdx1 (identité des profils, trottoirs, autoroute/rural, sens unique/double, évasement). Renvoie le lien le plus proche sous forme de table { r1Name, r1Lie, r2Name, r2Lie, class }, ou nil si aucun raccord n'est possible. nIdx1 == 1 signifie que l'on regarde le début de la route 1, sinon sa fin.

- `rIdx1` (*integer*) : Indice (dans roadMgr.roads) de la route de départ.
- `nIdx1` (*integer*) : Indice du nœud d'extrémité de la route de départ (1 = début, sinon fin).
- `rIdxs` (*integer[]*) : Indices des routes candidates à tester.
- `nIdxs` (*integer[]*) : Indice du nœud d'extrémité pour chaque route candidate (1 = début, sinon fin), aligné sur rIdxs.
- **renvoie** : table|nil Table { r1Name, r1Lie, r2Name, r2Lie, class } décrivant le raccord retenu, ou nil.

#### `editor_roadArchitect_link.createSplitJunction(candJct)`

Construit la jonction proposée : sauvegarde l'état des routes, coupe la route tronc au nœud tNode en deux routes, supprime les nœuds proches, repousse les extrémités au bord de la sphère de jonction, crée la jonction (T) avec la route de jonction puis raccorde les trois branches par des liaisons 'Perfect'. Si une des routes tronc résultantes a moins de 2 nœuds, restaure l'état d'origine et sort.

- `candJct` (*table*) : Candidat renvoyé par computePossibleJct ({ jName, jNode, tName, tNode, type, class }).

#### `editor_roadArchitect_link.joinRoads(link)`

Crée la route de raccord décrite par le lien (fusion en une seule route pour 'Perfect', route de transition ou de taper pour les autres classes). Le choix de la fonction interne dépend de link.class. Ne fait rien si la classe est inconnue.

- `link` (*table*) : Table { r1Name, r1Lie, r2Name, r2Lie, class } telle que renvoyée par computePossibleLinks.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/link.lua`.*
