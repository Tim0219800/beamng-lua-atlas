# `libs_luamqtt_mqtt_ioloop`

*Fichier : `lua/common/libs/luamqtt/mqtt/ioloop.lua` · VM : Commun (GE + véhicule) · 181 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luamqtt/mqtt/ioloop")`

Boucle d'entrées/sorties de luamqtt : fait vivre plusieurs clients MQTT (et des fonctions utilisateur) dans un même thread, en mode non bloquant avec un petit délai réseau, ce qui permet les PINGREQ de keep_alive et la reconnexion. Ne fonctionne qu'avec les connecteurs luasocket standard.

## Exemple

```lua
local ioloop = require('libs/luamqtt/mqtt/ioloop')
local loop = ioloop.get()
loop:add(client)
client:start_connecting()
-- dans une boucle propre au jeu :
loop:iteration()
```

## Remarques

- run_until_clients est bloquant ; dans le jeu, appeler plutôt iteration() périodiquement (par ex. depuis onUpdate) pour ne pas figer le thread.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_luamqtt_mqtt_ioloop.create(args)` | Crée une instance d'ioloop. | 149 |
| `libs_luamqtt_mqtt_ioloop.get(autocreate, args)` | Renvoie l'ioloop par défaut (singleton), créé à la demande. | 163 |

### Détail des paramètres

#### `libs_luamqtt_mqtt_ioloop.create(args)`

Crée une instance d'ioloop.

- `args` (*table*) : timeout (défaut 0.005 s), sleep (défaut 0), sleep_function.
- **renvoie** : table Instance ioloop_mt.

#### `libs_luamqtt_mqtt_ioloop.get(autocreate, args)`

Renvoie l'ioloop par défaut (singleton), créé à la demande.

- `autocreate` (*boolean*) : Créer automatiquement (défaut true).
- `args` (*table*) : Arguments de création.
- **renvoie** : table|nil Instance ioloop.

## Classe `ioloop_mt`

Instance d'ioloop renvoyée par create/get.

| Méthode | Description | Ligne |
|---|---|---|
| `ioloop_mt:__init(args)` | Initialise l'instance avec timeout, sleep et sleep_function (défaut socket.sleep). | 53 |
| `ioloop_mt:add(client)` | Ajoute un client MQTT ou une fonction de boucle. Pour un client, appelle client:set_ioloop(self) pour l'associer à la boucle. | 66 |
| `ioloop_mt:can_sleep()` | Si aucun délai réseau (timeout) n'a encore eu lieu pendant l'itération, appelle sleep_function(args.timeout) une seule fois (par défaut socket.sleep) pour ne pas tourner à vide. | 127 |
| `ioloop_mt:iteration()` | Effectue une itération : appelle _ioloop_iteration de chaque client et chaque fonction ajoutée, puis dort args.sleep secondes si sleep > 0. | 109 |
| `ioloop_mt:remove(client)` | Retire un client ou une fonction de l'ioloop. | 85 |
| `ioloop_mt:run_until_clients()` | Boucle bloquante : itère tant qu'il reste au moins un client dans l'ioloop. | 136 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luamqtt/mqtt/ioloop.lua`.*
