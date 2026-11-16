# `luamqtt_VERSION`

*Fichier : `lua/common/libs/luamqtt/mqtt/init.lua` · VM : Commun (GE + véhicule) · 88 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `luamqtt_VERSION`

Point d'entrée de la bibliothèque tierce luamqtt (xHasKx, version 3.4.3 d'après le champ _VERSION), client MQTT 3.1.1 et 5.0 en Lua pur. Le module renvoie la table 'mqtt' avec les constantes de version, la création de client, et des boucles d'exécution (ioloop partagé ou synchrone). Utile à un moddeur qui veut échanger avec un broker MQTT depuis le jeu.

## Exemple

```lua
local mqtt = require('libs/luamqtt/mqtt/init')
local cl = mqtt.client({uri = '127.0.0.1:1883', clean = true})
cl:on({connect = function(pkt) cl:subscribe({topic = 'beamng/#', qos = 0}) end,
       message = function(msg) log('I','mqtt',msg.topic..' '..tostring(msg.payload)) end})
mqtt.run_ioloop(cl)
```

## Remarques

- Le module pose aussi une globale luamqtt_VERSION, lue par client_mt:__init (la page auto la liste comme nom du module).
- Convention de la bibliothèque : un argument de mauvais type lève une exception ; les autres erreurs sont renvoyées sous la forme false, 'texte'.
- run_ioloop et run_sync sont bloquants : dans le jeu, préférer piloter le client depuis une boucle propre (voir ioloop_mt:iteration / client_mt:_sync_iteration) pour ne pas figer le thread.
- Le connecteur luasocket exige le module 'socket' (nom nu) ; le dossier libs/luasocket du jeu expose ce module.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `luamqtt_VERSION.client(...)` | Crée un client MQTT (équivalent de mqtt.client.create). | 43 |
| `luamqtt_VERSION.run_ioloop(...)` | Ajoute les clients (ou fonctions de boucle) à l'ioloop par défaut, lance start_connecting() sur chaque client, puis exécute l'ioloop tant qu'il reste au moins un client. | 55 |
| `luamqtt_VERSION.run_sync(cl)` | Boucle synchrone pour un seul client : ouvre la connexion puis itère tant que cl.connection existe. Pas de reconnexion ni de keep_alive. | 71 |

### Détail des paramètres

#### `luamqtt_VERSION.client(...)`

Crée un client MQTT (équivalent de mqtt.client.create).

- `...` (*table*) : Table d'arguments de client_mt:__init (uri, clean, version, id, username, password, secure, will, keep_alive, reconnect, connector, ssl_module).
- **renvoie** : table Instance de client MQTT.

#### `luamqtt_VERSION.run_ioloop(...)`

Ajoute les clients (ou fonctions de boucle) à l'ioloop par défaut, lance start_connecting() sur chaque client, puis exécute l'ioloop tant qu'il reste au moins un client.

- `...` (*table|function*) : Clients MQTT ou fonctions appelées à chaque itération.

#### `luamqtt_VERSION.run_sync(cl)`

Boucle synchrone pour un seul client : ouvre la connexion puis itère tant que cl.connection existe. Pas de reconnexion ni de keep_alive.

- `cl` (*table*) : Client MQTT.
- **renvoie** : boolean|nil false et le message d'erreur en cas d'échec.

## Champs

| Champ | Type | Description |
|---|---|---|
| `get_ioloop` | function | Alias de ioloop.get : renvoie l'instance d'ioloop par défaut (créée si besoin). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luamqtt/mqtt/init.lua`.*
