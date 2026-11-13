# `mcp_tools_ai`

*Fichier : `lua/ge/extensions/mcp/tools/ai.lua` · VM : Game Engine (GE) · 170 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `mcp_tools_ai` : `extensions.load("mcp_tools_ai")`, puis la globale `mcp_tools_ai`

Outils MCP pour l'IA des véhicules : lire/modifier ses réglages (mode, vitesse, agressivité, cible), l'envoyer vers un point, et inspecter le navgraph (réseau routier de l'IA et du trafic). Module chargé par mcp_tools (require), pas une extension autonome ; chaque fonction M.xxx est un outil MCP dont les arguments arrivent dans la table `args`. Retour des outils : (texte, estErreur).

## Remarques

- get_ai est asynchrone (GE -> VM véhicule -> callback `_cb.ai`) : le premier appel déclenche la lecture et renvoie un message ; l'appel suivant renvoie le JSON de l'appel précédent.
- Les valeurs de mode acceptées par set_ai d'après le schéma : disabled, random, span, manual, chase, flee, stop, follow, traffic, script ; speedMode : set, limit, legal, off ; routeSpeed en m/s ; aggression ~0.3 (calme) à 1.
- get_ai ne renvoie que : mode, speedMode, routeSpeed, aggression (clé lue sur ai.extAggression), targetObjectID, avoidCars (ai.extAvoidCars).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `mcp_tools_ai.drive_to(args)` | Envoie l'IA vers une destination avec ai.driveUsingPath : 'waypoint' (nom de nœud navgraph), ou 'pos' {x,y,z}, ou 'targetId' (position actuelle d'un autre objet), accrochés au nœud routier le plus proche (map.findClosestRoad). avoidCars vaut 'on' par défaut. | 48 |
| `mcp_tools_ai.get_ai(args)` | Demande l'état de l'IA d'un véhicule (asynchrone). Envoie un snippet à la VM véhicule qui renvoie un JSON {mode, speedMode, routeSpeed, aggression, targetObjectID, avoidCars} (ou {error='ai not loaded'}). | 18 |
| `mcp_tools_ai.get_navgraph(args)` | Statistiques du navgraph (nodeCount, linkCount, bbox) ; avec 'near'/'radius' ou all=true, ajoute les nœuds proches (nom, pos, radius, liens avec to/drivability/oneWay/speedLimit/len) et la route la plus proche (closestRoad). | 76 |
| `mcp_tools_ai.set_ai(args)` | Modifie les réglages de l'IA via ai.setState dans la VM véhicule. Ne transmet que les clés fournies : mode, speedMode, routeSpeed, aggression (-> extAggression), targetObjectID, avoidCars (-> extAvoidCars). | 29 |

### Détail des paramètres

#### `mcp_tools_ai.drive_to(args)`

Envoie l'IA vers une destination avec ai.driveUsingPath : 'waypoint' (nom de nœud navgraph), ou 'pos' {x,y,z}, ou 'targetId' (position actuelle d'un autre objet), accrochés au nœud routier le plus proche (map.findClosestRoad). avoidCars vaut 'on' par défaut.

- `args` (*table*) : {waypoint?: string, pos?: {x,y,z}, targetId?: integer, routeSpeed?: number (m/s), routeSpeedMode?: 'limit'|'set' (défaut 'limit'), aggression?: number, avoidCars?: 'on'|'off', driveInLane?: 'on'|'off', id?: integer}
- **renvoie** : string Message de confirmation ou d'erreur (aucune route proche, cible manquante).
- **renvoie** : boolean true en cas d'erreur.

#### `mcp_tools_ai.get_ai(args)`

Demande l'état de l'IA d'un véhicule (asynchrone). Envoie un snippet à la VM véhicule qui renvoie un JSON {mode, speedMode, routeSpeed, aggression, targetObjectID, avoidCars} (ou {error='ai not loaded'}).

- `args` (*table|nil*) : {id?: integer} véhicule (défaut : joueur).
- **renvoie** : string JSON de l'appel précédent, ou message « requested (async) ».
- **renvoie** : boolean true si le véhicule n'existe pas.

#### `mcp_tools_ai.get_navgraph(args)`

Statistiques du navgraph (nodeCount, linkCount, bbox) ; avec 'near'/'radius' ou all=true, ajoute les nœuds proches (nom, pos, radius, liens avec to/drivability/oneWay/speedLimit/len) et la route la plus proche (closestRoad).

- `args` (*table|nil*) : {near?: {x,y,z} (défaut véhicule joueur ou caméra), radius?: number en m (défaut 100), all?: boolean, maxNodes?: integer (défaut 300)}
- **renvoie** : string JSON ou message d'erreur (« navgraph not loaded »).
- **renvoie** : boolean true en cas d'erreur.

#### `mcp_tools_ai.set_ai(args)`

Modifie les réglages de l'IA via ai.setState dans la VM véhicule. Ne transmet que les clés fournies : mode, speedMode, routeSpeed, aggression (-> extAggression), targetObjectID, avoidCars (-> extAvoidCars).

- `args` (*table*) : {mode?, speedMode?, routeSpeed?, aggression?, targetObjectID?, avoidCars?, id?}. Erreur si aucune clé de réglage.
- **renvoie** : string Confirmation avec le JSON appliqué.
- **renvoie** : boolean true en cas d'erreur.

## Champs

| Champ | Type | Description |
|---|---|---|
| `cb` | table<string, function> | Callbacks : `ai(vid, json)` stocke le JSON dans shared.asyncResults.ai. |
| `schemas` | table<string, table> | Descriptions et inputSchema des outils get_ai, set_ai, drive_to, get_navgraph. |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicle`, `queueObjectLua`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/mcp/tools/ai.lua`.*
