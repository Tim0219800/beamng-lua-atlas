# `gameplayInterface`

*Fichier : `lua/vehicle/extensions/gameplayInterface.lua` · VM : Véhicule · 241 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplayInterface` : `extensions.load (VM véhicule)("gameplayInterface")`, puis la globale `gameplayInterface`

Passerelle générique entre le code gameplay (VM GE Lua, via core_vehicleBridge) ou d'autres extensions véhicule et le VM véhicule. Elle charge à l'init tous les modules du dossier gameplayInterfaceModules, leur fait déclarer leurs 'actions' (commandes sans retour direct) et leurs 'lookups' (lectures de données), puis exécute les requêtes numérotées et renvoie le résultat par un callback enregistré. Gère aussi les notifications de changement de valeur d'une clé d'electrics. Un moddeur l'utilise pour piloter un véhicule à distance ou pour ajouter son propre module (fichier gameplayInterfaceModules/<nom>.lua).

## Exemple

```lua
-- Dans un module gameplayInterfaceModules/monModule.lua
M.moduleActions.monAction = function(params) ... end
M.moduleLookups.maLecture = function(params) return {result = 42} end
function M.requestRegistration(gi) gi.registerModule('monModule', M.moduleActions, M.moduleLookups) end
-- Appel côté véhicule
gameplayInterface.getSystemData(0, 1, 'electricsValue', 'rpm')
```

## Remarques

- Protocole : chaque requête a un identifiant de callback (callbackId), un id de requête (id) et le nom du système (lookup) ou de l'action. Le résultat est envoyé via triggerCallback(callbackId, id, result). Si une action ne renvoie rien (nil), aucun callback n'est émis.
- Les paramètres sont passés au module sous forme d'une table `params` (arguments variadiques). Les modules vérifient les types avec checkTableDataTypes et renvoient {failReason = ...} en cas d'erreur.
- Callbacks : l'id 0 est réservé à GE Lua (extensions.core_vehicleBridge.callbackFromVlua), l'id 1 à debugCallback (print + dump). registerCallback ajoute un callback ({vm = 'gelua'|'vlua', callback = nom ou fonction}) et renvoie son id au demandeur par la requête -1 ({callbackId = ...}). Les notifications de changement de valeur utilisent l'id de requête -2. Pour vm = 'gelua', callback est le nom d'une fonction GE Lua appelée avec (objectId, requestId, données encodées lpack).
- Les modules sont chargés (si besoin) à la volée à la première requête les concernant (ensureExtensionModuleLoaded) ; au démarrage, ils sont chargés puis déchargés juste après requestRegistration pour enregistrer leurs noms d'actions/lookups.
- Les noms d'actions et de lookups doivent être uniques entre modules ; un doublon écrit un message 'duplicate action/lookup' et le dernier module enregistré gagne.
- Notifications de changement de valeur : registerValueChangeNotification surveille electrics.values[cléElectrics] et déclenche le callback dès que la valeur change (valeur nil ignorée). Remise à zéro de la dernière valeur à onReset.
- Anomalie : getSystemData/executeAction construisent leurs messages d'erreur avec string.format('%d', id) ; si id est nil l'appel lève une erreur Lua au lieu de renvoyer failReason.
- Anomalie : onExtensionLoaded réinitialise la table callbacks avec les index 0 et 1 ; les callbacks enregistrés avant ce moment seraient perdus.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplayInterface.debugCallback(requestId, data)` | Callback de débogage (id 1) : affiche les données reçues via print/dump. | 18 |
| `gameplayInterface.executeAction(callbackId, id, action, ...)` | Exécute une action enregistrée par un module ; renvoie un résultat au callback seulement si l'action retourne une valeur (ex. {failReason}). | 102 |
| `gameplayInterface.getSystemData(callbackId, id, system, ...)` | Exécute un lookup (lecture) enregistré par un module et envoie le résultat au callback. Si le système est inconnu ou les paramètres invalides, envoie {failReason}. | 70 |
| `gameplayInterface.onExtensionLoaded()` | Appelé au chargement de l'extension : parcourt lua/vehicle/extensions/gameplayInterfaceModules, charge chaque module, appelle requestRegistration(M) puis le décharge s'il n'était pas déjà chargé ; réinitialise la table des callbacks (id 0 = GE Lua, id 1 = debug). *(interne)* *(hook)* | 195 |
| `gameplayInterface.onInit()` | Hook d'initialisation du véhicule ; vide. *(interne)* *(hook)* | 192 |
| `gameplayInterface.onReset()` | Appelé au reset du véhicule : oublie la dernière valeur connue des notifications de changement. *(interne)* *(hook)* | 186 |
| `gameplayInterface.registerCallback(vm, callback)` | Enregistre un callback de réponse et renvoie immédiatement son identifiant au demandeur (requête -1 avec {callbackId}). | 165 |
| `gameplayInterface.registerModule(name, actions, lookups)` | Enregistre un module : associe chaque nom d'action et de lookup au nom du module, avec détection des doublons. Appelé par module.requestRegistration(gi). | 171 |
| `gameplayInterface.registerValueChangeNotification(callbackId, id, electricsKey)` | Demande d'être notifié (via callbackId, id de requête -2, données {[clé] = valeur}) à chaque changement de electrics.values[electricsKey]. Confirme par {registerResult = true}. | 133 |
| `gameplayInterface.triggerValueChangeNotification(valueChangeNotificationId, data)` | Déclenche manuellement une notification de changement enregistrée (par son index) avec des données quelconques : le callback reçoit {data, valueChangeNotificationId}. | 159 |
| `gameplayInterface.unregisterValueChangeNotification(callbackId, electricsKey)` | Retire la première notification correspondant à (callbackId, electricsKey) ; arrête la surveillance quand il n'en reste plus. | 141 |
| `gameplayInterface.updateGFX(dt)` | Appelé chaque frame : exécute la vérification des notifications de changement de valeur si au moins une est enregistrée. *(interne)* | 60 |

### Détail des paramètres

#### `gameplayInterface.debugCallback(requestId, data)`

Callback de débogage (id 1) : affiche les données reçues via print/dump.

- `requestId` (*integer*) : Identifiant de requête.
- `data` (*any*) : Données reçues.

#### `gameplayInterface.executeAction(callbackId, id, action, ...)`

Exécute une action enregistrée par un module ; renvoie un résultat au callback seulement si l'action retourne une valeur (ex. {failReason}).

- `callbackId` (*integer*) : Callback qui recevra le résultat.
- `id` (*integer*) : Identifiant de requête.
- `action` (*string*) : Nom de l'action (ex. 'setIgnitionLevel').
- `...` (*any*) : Paramètres passés à l'action sous forme de table.

#### `gameplayInterface.getSystemData(callbackId, id, system, ...)`

Exécute un lookup (lecture) enregistré par un module et envoie le résultat au callback. Si le système est inconnu ou les paramètres invalides, envoie {failReason}.

- `callbackId` (*integer*) : Callback qui recevra le résultat.
- `id` (*integer*) : Identifiant de requête (renvoyé tel quel).
- `system` (*string*) : Nom du lookup (ex. 'electricsValue').
- `...` (*any*) : Paramètres passés au lookup sous forme de table.

#### `gameplayInterface.registerCallback(vm, callback)`

Enregistre un callback de réponse et renvoie immédiatement son identifiant au demandeur (requête -1 avec {callbackId}).

- `vm` (*string*) : 'gelua' (callback = nom de fonction GE Lua sous forme de texte) ou 'vlua' (callback = fonction locale).
- `callback` (*string|function*) : Nom de fonction GE ou fonction(requestId, data) selon vm.

#### `gameplayInterface.registerModule(name, actions, lookups)`

Enregistre un module : associe chaque nom d'action et de lookup au nom du module, avec détection des doublons. Appelé par module.requestRegistration(gi).

- `name` (*string*) : Nom du module (nom du fichier sans extension).
- `actions` (*table<string, function>*) : Table moduleActions du module.
- `lookups` (*table<string, function>*) : Table moduleLookups du module.

#### `gameplayInterface.registerValueChangeNotification(callbackId, id, electricsKey)`

Demande d'être notifié (via callbackId, id de requête -2, données {[clé] = valeur}) à chaque changement de electrics.values[electricsKey]. Confirme par {registerResult = true}.

- `callbackId` (*integer*) : Callback à appeler.
- `id` (*integer*) : Identifiant de la requête d'inscription.
- `electricsKey` (*string*) : Clé de electrics.values à surveiller.

#### `gameplayInterface.triggerValueChangeNotification(valueChangeNotificationId, data)`

Déclenche manuellement une notification de changement enregistrée (par son index) avec des données quelconques : le callback reçoit {data, valueChangeNotificationId}.

- `valueChangeNotificationId` (*integer*) : Index dans la liste des notifications enregistrées.
- `data` (*any*) : Données à transmettre.

#### `gameplayInterface.unregisterValueChangeNotification(callbackId, electricsKey)`

Retire la première notification correspondant à (callbackId, electricsKey) ; arrête la surveillance quand il n'en reste plus.

- `callbackId` (*integer*) : Callback inscrit.
- `electricsKey` (*string*) : Clé surveillée.

#### `gameplayInterface.updateGFX(dt)`

Appelé chaque frame : exécute la vérification des notifications de changement de valeur si au moins une est enregistrée.

- `dt` (*number*) : Pas de temps en secondes.

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `obj:` `queueGameEngineLua`

**Charge les extensions :** `gameplayInterfaceModules/`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/gameplayInterface.lua`.*
