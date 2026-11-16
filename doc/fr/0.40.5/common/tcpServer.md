# `tcpServer`

*Fichier : `lua/common/tcpServer.lua` · VM : Commun (GE + véhicule) · 273 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("tcpServer")`

Serveur TCP non bloquant servant aux outils externes (chaîne d'outils d'édition, scripts). Utilise ASIO via createNetworkServer s'il est disponible, sinon LuaSocket. Les messages sont des charges JSON précédées d'un en-tête fixe de 8 octets. Un moddeur l'utilise pour dialoguer avec un programme externe : on crée un serveur puis on appelle receiveData() à chaque frame.

## Exemple

```lua
local TCPServer = require('tcpServer')
local server = TCPServer:new('localhost', 12345)
-- à chaque mise à jour :
local received = server:receiveData()
for _, entry in ipairs(received) do
  local connection, message = unpack(entry)
  if message == 'disconnect' then ... else server:send(connection, {cmd = 'pong'}, message) end
end
server:destroy()
```

## Remarques

- Protocole : 4 octets 'BN01' (identifiant), 4 octets uint32 little-endian = longueur de la charge utile JSON, terminateur nul inclus, puis le JSON suivi de '\0'.
- receiveData() renvoie une liste d'entrées {connection, message} ; message est la table JSON décodée, ou la chaîne 'disconnect' (avec éventuellement un 3e élément = erreur) quand une connexion LuaSocket se ferme.
- send(connection, sendData, recData) copie temporairement recData.context dans sendData.context (corrélation requête/réponse), encode avec jsonEncode puis envoie en-tête et JSON.
- Appeler TCPServer:new(...) avec deux-points. En cas d'échec de bind LuaSocket, new renvoie false (pas un objet).
- BUG : dans _onDataRaw, en cas d'échec de décodage JSON, le code appelle self:sendData(...) qui n'existe pas (la méthode s'appelle send) : une erreur Lua sera levée au lieu d'envoyer la réponse d'erreur.
- BUG/PIÈGE : new() stocke serverLuasocket/serverASIO et headerBuffer sur la CLASSE (self = TCPServer) et non sur newObj ; plusieurs serveurs partagent donc ces champs. Si l'identifiant 'BN01' est invalide, _onDataRaw retourne sans vider le tampon : la connexion reste bloquée sur ces octets.
- La version ASIO ne dispose pas de la détection de déconnexion ('disconnect') : elle relaie seulement les données reçues. Port d'écoute : listenHost n'est utilisé que par LuaSocket ; avec ASIO seul le port est passé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `tcpServer._onDataRaw(self, connection, dataRaw, res)` | Interne : accumule les octets reçus d'une connexion dans un tampon, extrait les messages complets (en-tête valide, longueur, terminateur nul), décode le JSON (jsonDecode) et ajoute {connection, données} à res. *(interne)* | 141 |
| `tcpServer.destroy(self)` | Ferme toutes les connexions et le socket serveur (LuaSocket) ou détruit le serveur ASIO (destroyNetworkServer), et vide les tampons. | 251 |
| `tcpServer.new(self, listenHost, port)` | Crée un serveur TCP écoutant sur le port donné (appel `TCPServer:new(host, port)`). Choisit ASIO si createNetworkServer existe, sinon LuaSocket non bloquant. Renvoie false si LuaSocket ne peut pas se lier. | 88 |
| `tcpServer.receiveData(self)` | À appeler régulièrement. Accepte les nouvelles connexions, lit les données disponibles, extrait les messages complets. Renvoie une liste d'entrées {connection, message}. | 186 |
| `tcpServer.send(self, connection, sendData, recData)` | Envoie un message JSON (en-tête BN01 + taille + JSON + '\0') sur une connexion. Si recData.context existe, il est copié dans sendData.context pour la réponse (puis retiré de sendData). | 123 |

### Détail des paramètres

#### `tcpServer._onDataRaw(self, connection, dataRaw, res)`

Interne : accumule les octets reçus d'une connexion dans un tampon, extrait les messages complets (en-tête valide, longueur, terminateur nul), décode le JSON (jsonDecode) et ajoute {connection, données} à res.

- `self` (*any*) : 
- `connection` (*table*) : connexion
- `dataRaw` (*string*) : octets reçus
- `res` (*table*) : liste de résultats à compléter

#### `tcpServer.new(self, listenHost, port)`

Crée un serveur TCP écoutant sur le port donné (appel `TCPServer:new(host, port)`). Choisit ASIO si createNetworkServer existe, sinon LuaSocket non bloquant. Renvoie false si LuaSocket ne peut pas se lier.

- `self` (*any*) : 
- `listenHost` (*string*) : adresse d'écoute (LuaSocket), par ex. 'localhost'
- `port` (*integer*) : port TCP
- **renvoie** : table|boolean objet serveur, ou false en cas d'échec

#### `tcpServer.receiveData(self)`

À appeler régulièrement. Accepte les nouvelles connexions, lit les données disponibles, extrait les messages complets. Renvoie une liste d'entrées {connection, message}.

- `self` (*any*) : 
- **renvoie** : table[] liste de {connection, message | 'disconnect'[, erreur]}

#### `tcpServer.send(self, connection, sendData, recData)`

Envoie un message JSON (en-tête BN01 + taille + JSON + '\0') sur une connexion. Si recData.context existe, il est copié dans sendData.context pour la réponse (puis retiré de sendData).

- `self` (*any*) : 
- `connection` (*table*) : connexion (premier élément d'une entrée de receiveData)
- `sendData` (*table*) : message à encoder en JSON
- `recData` (*table|nil*) : message reçu auquel on répond (pour recopier context)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/tcpServer.lua`.*
