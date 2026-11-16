# `utils_wsUtils`

*Fichier : `lua/common/utils/wsUtils.lua` · VM : Commun (GE + véhicule) · 108 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("utils/wsUtils")`

Outils pour les WebSockets du moteur (BNGWebWSServer / BNGWSClient). Fournit createOrGetWS qui crée (ou récupère) un serveur WebSocket et choisit l'adresse IP à donner aux clients, en testant par un aller-retour réel quelles cartes réseau sont joignables. Se charge avec require('utils/wsUtils'). Utilisé par les extensions qui exposent des données à des outils externes.

## Exemple

```lua
local ws = require('utils/wsUtils')
local server, address = ws.createOrGetWS('0.0.0.0', 8081, '/', 'monProtocole', nil, true)
```

## Remarques

- Si listenAddr n'est ni '0.0.0.0' ni 'any', l'adresse renvoyée est toujours 'localhost'.
- Si le bac à sable réseau (Engine.Sandbox.Network) est actif, l'adresse renvoyée est 'localhost' sans test.
- Sinon, chaque carte réseau IPv4 (hors descriptions contenant virtualbox/vmware) est testée par testWSConnection (envoi d'une chaîne aléatoire, écho, 20 tentatives dans chaque sens) ; la première qui répond est retenue, sinon la première IPv4 réelle, sinon 'localhost'.
- Le serveur est géré par son propre thread côté moteur : le test ne pompe que le client et lit la file d'évènements du serveur, jamais server:update().

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `utils_wsUtils.createOrGetWS(listenAddr, port, path, protocolName, redirPage, enableDataStreams, useTLS)` | Crée ou récupère un serveur WebSocket (BNGWebWSServer.getOrCreate), détermine l'adresse que les clients doivent utiliser, et active éventuellement les flux de données (server:enableDataStreams). | 92 |

### Détail des paramètres

#### `utils_wsUtils.createOrGetWS(listenAddr, port, path, protocolName, redirPage, enableDataStreams, useTLS)`

Crée ou récupère un serveur WebSocket (BNGWebWSServer.getOrCreate), détermine l'adresse que les clients doivent utiliser, et active éventuellement les flux de données (server:enableDataStreams).

- `listenAddr` (*string*) : Adresse d'écoute : '0.0.0.0'/'any' (réseau local) ou 'localhost'/127.0.0.1
- `port` (*integer*) : Port du serveur
- `path` (*string*) : Chemin WebSocket
- `protocolName` (*string*) : Nom du protocole WebSocket
- `redirPage` (*string|nil*) : Page vers laquelle rediriger les requêtes HTTP simples (transmis au moteur)
- `enableDataStreams` (*boolean|nil*) : true par défaut (nil) : active enableDataStreams sur le serveur
- `useTLS` (*boolean|nil*) : Seul true active TLS
- **renvoie** : userdata Serveur BNGWebWSServer
- **renvoie** : string Adresse recommandée pour les clients

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/utils/wsUtils.lua`.*
