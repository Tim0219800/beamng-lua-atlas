# `util_nodeStream`

*Fichier : `lua/ge/extensions/util/nodeStream.lua` · VM : Game Engine (GE) · 281 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_nodeStream` : `extensions.load("util_nodeStream")`, puis la globale `util_nodeStream`

Serveur WebSocket local (127.0.0.1:8088, nom « nodestream ») qui diffuse en direct la structure du véhicule joueur à un client externe (visualiseur 3D, outil de débogage). Le client peut demander : les positions initiales des nœuds, les données de mappage des flexbodies, le démarrage/arrêt du flux des positions courantes (toutes les 0,1 s), ou le chargement d'une extension. Les autres messages JSON sont relayés aux extensions via le hook onWebSocketHandlerMessage.

## Exemple

```lua
extensions.load('util_nodeStream')
-- client WebSocket : {"type":"startNodeStream"}
```

## Remarques

- Protocole : messages texte ; « ping » reçoit « pong » ; sinon JSON avec un champ type : loadExtension (extensionName), startNodeStream, stopNodeStream, getInitialNodePositions, getFlexbodyMappingData. Les réponses ont type info, error, vehicleNodes, initialNodePositions ou flexbodyMappingData.
- Les coordonnées envoyées sont converties en {x, z, -y} (axe vertical Y côté client). Les positions courantes (vehicleNodes) sont celles de getNodePosition, relatives au nœud de référence ; les positions initiales sont décalées par celles du nœud de référence.
- Sécurité : n'importe quel client connecté en local peut faire charger une extension arbitraire (loadExtension).
- Dans getInitialNodePositions, si getRefNodeId() renvoie nil, refNodePos reste nil et l'indexation de refNodePos.x provoquerait une erreur.
- Dans broadcastVehicleNodes, refNodePos est calculé mais jamais utilisé ; le champ initialNodes du message reste une table vide.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_nodeStream.onExtensionLoaded()` | Appelé au chargement : crée (ou récupère) le serveur WebSocket via wsUtils.createOrGetWS sur 127.0.0.1:8088. *(interne)* *(hook)* | 214 |
| `util_nodeStream.onExtensionUnloaded()` | Appelé au déchargement : détruit le serveur WebSocket (BNGWebWSServer.destroy). *(interne)* *(hook)* | 225 |
| `util_nodeStream.onUpdate(dt)` | Hook appelé chaque frame : diffuse les positions de nœuds si le flux est actif (intervalle 0,1 s), traite les évènements des clients (connexion C, déconnexion DC, données D), puis met à jour le serveur. *(interne)* *(hook)* | 234 |

### Détail des paramètres

#### `util_nodeStream.onUpdate(dt)`

Hook appelé chaque frame : diffuse les positions de nœuds si le flux est actif (intervalle 0,1 s), traite les évènements des clients (connexion C, déconnexion DC, données D), puis met à jour le serveur.

- `dt` (*number*) : Delta de temps en secondes

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onWebSocketHandlerMessage`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/nodeStream.lua`.*
