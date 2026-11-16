# `core_vehicleBridge`

*Fichier : `lua/ge/extensions/core/vehicleBridge.lua` · VM : Game Engine (GE) · 156 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_vehicleBridge` : `extensions.load("core_vehicleBridge")`, puis la globale `core_vehicleBridge`

Extension GE `core_vehicleBridge` : pont de communication entre le Lua GE et le Lua du véhicule (vlua). Envoie des commandes à `extensions.gameplayInterface` côté véhicule pour lire une valeur (requestValue), exécuter une action (executeAction) ou s'abonner aux changements d'une clé électrique (registerValueChangeNotification), et reçoit les réponses via callbackFromVlua. Les valeurs reçues par abonnement sont mises en cache dans `vehicleData[vehId].data`.

## Exemple

```lua
local veh = getPlayerVehicle(0)
core_vehicleBridge.requestValue(veh, function(data) dump(data) end, 'electrics')  -- arguments passés à gameplayInterface.getSystemData
core_vehicleBridge.registerValueChangeNotification(veh, 'ignitionLevel')
-- plus tard :
local v = core_vehicleBridge.getCachedVehicleData(veh:getId(), 'ignitionLevel')
```

## Remarques

- Les arguments supplémentaires (`...`) de requestValue et executeAction sont sérialisés avec serialize() dans la chaîne de commande envoyée au véhicule ; leur signification dépend de gameplayInterface.lua côté véhicule.
- L'identifiant de callback -2 est réservé aux notifications de changement de valeur ; les autres identifiants sont uniques et à usage unique (la fonction de rappel est supprimée après appel).
- callbackFromVlua décode data avec lpack.decode ; si data.failReason est présent, une erreur est logguée mais le callback est tout de même appelé.
- Le champ logCommand vaut `nop` (fonction vide globale du jeu) ou logCommandFunction selon setLogCommands ; l'analyse automatique le signale comme référence non définie, c'est une fausse alerte.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_vehicleBridge.callbackFromVlua(vehId, callbackId, data)` | Appelée depuis le Lua du véhicule avec la réponse à une requête ou une notification. Décode les données, met à jour le cache (id -2) ou appelle la fonction de rappel enregistrée puis l'oublie. *(interne)* | 37 |
| `core_vehicleBridge.executeAction(veh, ...)` | Exécute une action côté véhicule (extensions.gameplayInterface.executeAction). Vérifie que veh existe et possède queueLuaCommand. | 119 |
| `core_vehicleBridge.getCachedVehicleData(vehId, key)` | Lit une valeur mise en cache par une notification de changement. | 143 |
| `core_vehicleBridge.logCommandFunction(veh, id, command)` | Logue (niveau D) la commande envoyée à un véhicule. | 14 |
| `core_vehicleBridge.onVehicleDestroyed(id)` | Hook : un véhicule est détruit ; efface son cache et ses abonnements. *(interne)* *(hook)* | 154 |
| `core_vehicleBridge.onVehicleReplaced(id)` | Hook (émis par core_vehicles.replaceVehicle) : le véhicule a été remplacé ; efface son cache et ses abonnements (le nouveau Lua véhicule doit se réabonner). *(interne)* *(hook)* | 155 |
| `core_vehicleBridge.registerValueChangeNotification(veh, electricsKey)` | Abonne GE aux changements d'une clé électrique du véhicule : à chaque changement, la valeur est mise à jour dans vehicleData[vehId].data[clé]. Sans effet si déjà abonné à cette clé. | 73 |
| `core_vehicleBridge.requestValue(veh, callback, ...)` | Demande une valeur au véhicule (extensions.gameplayInterface.getSystemData côté véhicule). La fonction de rappel reçoit les données décodées de manière asynchrone (au plus tôt à la frame suivante). | 53 |
| `core_vehicleBridge.setLogCommands(enabled)` | Active ou désactive le log de toutes les commandes envoyées aux véhicules. | 18 |
| `core_vehicleBridge.unregisterValueChangeNotification(veh, electricsKey)` | Annule l'abonnement créé par registerValueChangeNotification (sans effet s'il n'existe pas). | 98 |

### Détail des paramètres

#### `core_vehicleBridge.callbackFromVlua(vehId, callbackId, data)`

Appelée depuis le Lua du véhicule avec la réponse à une requête ou une notification. Décode les données, met à jour le cache (id -2) ou appelle la fonction de rappel enregistrée puis l'oublie.

- `vehId` (*integer*) : véhicule émetteur
- `callbackId` (*integer*) : identifiant du callback, ou -2 pour une notification de changement de valeur
- `data` (*string*) : données encodées par lpack

#### `core_vehicleBridge.executeAction(veh, ...)`

Exécute une action côté véhicule (extensions.gameplayInterface.executeAction). Vérifie que veh existe et possède queueLuaCommand.

- `veh` (*userdata*) : véhicule cible
- `...` (*any*) : arguments (nom de l'action et paramètres), sérialisés

#### `core_vehicleBridge.getCachedVehicleData(vehId, key)`

Lit une valeur mise en cache par une notification de changement.

- `vehId` (*integer*) : identifiant du véhicule
- `key` (*string*) : clé
- **renvoie** : any dernière valeur reçue, nil si inconnue

#### `core_vehicleBridge.logCommandFunction(veh, id, command)`

Logue (niveau D) la commande envoyée à un véhicule.

- `veh` (*userdata*) : véhicule destinataire
- `id` (*integer*) : identifiant de callback
- `command` (*any*) : commande (chaîne ou buffer)

#### `core_vehicleBridge.onVehicleDestroyed(id)`

Hook : un véhicule est détruit ; efface son cache et ses abonnements.

- `id` (*integer*) : identifiant du véhicule

#### `core_vehicleBridge.onVehicleReplaced(id)`

Hook (émis par core_vehicles.replaceVehicle) : le véhicule a été remplacé ; efface son cache et ses abonnements (le nouveau Lua véhicule doit se réabonner).

- `id` (*integer*) : identifiant du véhicule

#### `core_vehicleBridge.registerValueChangeNotification(veh, electricsKey)`

Abonne GE aux changements d'une clé électrique du véhicule : à chaque changement, la valeur est mise à jour dans vehicleData[vehId].data[clé]. Sans effet si déjà abonné à cette clé.

- `veh` (*userdata*) : véhicule
- `electricsKey` (*string*) : clé de la table electrics

#### `core_vehicleBridge.requestValue(veh, callback, ...)`

Demande une valeur au véhicule (extensions.gameplayInterface.getSystemData côté véhicule). La fonction de rappel reçoit les données décodées de manière asynchrone (au plus tôt à la frame suivante).

- `veh` (*userdata*) : véhicule interrogé (log d'erreur si nil)
- `callback` (*function*) : fonction(data) appelée avec la réponse
- `...` (*any*) : arguments supplémentaires, sérialisés et transmis à getSystemData

#### `core_vehicleBridge.setLogCommands(enabled)`

Active ou désactive le log de toutes les commandes envoyées aux véhicules.

- `enabled` (*boolean*) : true pour activer

#### `core_vehicleBridge.unregisterValueChangeNotification(veh, electricsKey)`

Annule l'abonnement créé par registerValueChangeNotification (sans effet s'il n'existe pas).

- `veh` (*userdata*) : véhicule
- `electricsKey` (*string*) : clé de la table electrics

## Champs

| Champ | Type | Description |
|---|---|---|
| `logCommand` | function | Fonction appelée avant chaque envoi (log détaillé) ; `nop` par défaut, logCommandFunction si setLogCommands(true). |
| `vehicleData` | table<integer, {data: table, registeredCallbacks: table<string, integer>}> | [vehId] = {data = dernières valeurs reçues par clé, registeredCallbacks = [clé] = idCallback}. Vidé pour un véhicule détruit ou remplacé. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/vehicleBridge.lua`.*
