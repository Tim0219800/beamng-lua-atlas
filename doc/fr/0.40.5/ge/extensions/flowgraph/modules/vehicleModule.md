# `flowgraph_modules_vehicleModule`

*Fichier : `lua/ge/extensions/flowgraph/modules/vehicleModule.lua` · VM : Game Engine (GE) · 295 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/modules/vehicleModule")` (fichier sous extensions/ mais pas une extension classique)

Module flowgraph (moduleOrder -150) qui suit les véhicules utilisés par un graphe : ceux qu'il fait apparaître ou qu'on lui déclare avec addForeignVehicle. Il attend que chaque véhicule soit prêt, récupère les décalages de ses attelages (tow_hitch, fifthwheel…), suit les attelages entre véhicules, gère les données de bus (agenouillement, portes, arrêts) et supprime les véhicules à l'arrêt du graphe sauf ceux marqués dontDelete. Dépend de gameplay_walk et core_vehicleBridge.

## Exemple

```lua
local vm = mgr.modules.vehicle
local id = vm:getVehicleIdByInternalName('mon_vehicule')
if vm:isBus(id) then vm:registerBusChangeNotification(id) end
```

## Remarques

- Hooks écoutés : onCouplerAttached, onCouplerDetached, onBusUpdate, onVehicleResetted (onBusUpdate n'a pas de méthode dans ce fichier).
- Les véhicules suivis ont veh.canSave = false.
- getVehicle renvoie une table vide (jamais nil) si l'id est inconnu.
- Bug possible : onCouplerAttached/onCouplerDetached plantent si l'un des deux ids n'est pas suivi (self.couplings[id] est nil).
- requestBusData est vide (son contenu est commenté) ; la fonction ne fait rien.
- Ordre de priorité des attelages pour le tri de couplerOffset : tow_hitch, fifthwheel, gooseneck_hitch, fifthwheel_v2, pintle. Plus d'un attelage sur un véhicule génère un log I.
- executionStopped : supprime les véhicules non dontDelete, restaure le carburant stocké des autres, restaure la blacklist de gameplay_walk et l'état de core_trailerRespawn.

**Dépendances (chargées avant) :** `gameplay_walk`, `core_vehicleBridge`

## Classe `C`

Instance du module véhicule (mgr.modules.vehicle). Tables internes : vehicles (id -> données : id, ready, internalName, couplerOffset, couplerTags, dontDelete, storedEnergyStorage…), sortedIds (ids triés), couplings (id -> {autreId = true}).

| Méthode | Description | Ligne |
|---|---|---|
| `C:addCouplerOffset(id, off, tag)` | Enregistre les décalages d'attelage reçus (vec3, nom, tag) pour un véhicule et les trie par priorité de tag puis par nom. | 135 |
| `C:addForeignVehicle(veh, moreData)` | Déclare un véhicule non créé par le flowgraph mais à suivre ; il est marqué dontDelete (non supprimé à l'arrêt). | 27 |
| `C:addVehicle(veh, moreData)` | Commence à suivre un véhicule (ignoré s'il l'est déjà). Si le véhicule est prêt, appelle readyUpVehicle. | 33 |
| `C:clear()` | Vide vehicles, sortedIds et couplings. | 16 |
| `C:executionStarted()` | Mémorise la blacklist de gameplay_walk et l'état de core_trailerRespawn pour les restaurer à l'arrêt. | 150 |
| `C:executionStopped()` | Appelée à l'arrêt du graphe : supprime les véhicules non dontDelete, restaure l'énergie des autres, la blacklist de marche et core_trailerRespawn, puis clear(). | 195 |
| `C:getSpawnedVehicles()` | Copie profonde de la liste triée des ids de véhicules suivis. | 22 |
| `C:getVehicle(id)` | Renvoie les données suivies d'un véhicule, ou une table vide. | 58 |
| `C:getVehicleIdByInternalName(name)` | Cherche l'id d'un véhicule d'après son nom interne exact. | 62 |
| `C:getVehiclesIdByInternalNameMatch(name)` | Renvoie les ids dont le nom interne correspond au motif (string.find, donc motif Lua). | 71 |
| `C:init()` | Crée les tables internes puis appelle clear(). | 8 |
| `C:isBus(id)` | Indique si le modèle du véhicule a le Body Style « Bus ». | 281 |
| `C:isBusDoorOpen(id)` | Indique si la porte du bus est ouverte (valeur en cache 'dooropen' == 1). | 272 |
| `C:isBusKneel(id)` | Indique si le bus est agenouillé (valeur en cache 'kneel' == 1). | 271 |
| `C:isCoupled(id)` | Indique si le véhicule est attelé à au moins un autre. | 243 |
| `C:isCoupledTo(id, other)` | Indique si le véhicule est attelé au véhicule other. | 244 |
| `C:onCouplerAttached(objId1, objId2, nodeId, obj2nodeId)` | Hook : enregistre l'attelage entre deux véhicules (dans les deux sens). | 234 |
| `C:onCouplerDetached(objId1, objId2, nodeId, obj2nodeId)` | Hook : supprime l'attelage entre deux véhicules. | 238 |
| `C:onUpdate()` | Appelée à chaque frame : repère les véhicules devenus prêts et appelle readyUpVehicle. | 81 |
| `C:onVehicleResetted(id)` | Hook appelé quand un véhicule est réinitialisé ; relaie à activity:onVehicleReset(id) si l'activité existe. | 289 |
| `C:readyUpVehicle(id)` | Marque le véhicule prêt ; sauf ignoreReadyUp, active le suivi mapmgr (via le module level, éventuellement différé) et demande les décalages d'attelage pour chaque tag. | 105 |
| `C:registerBusChangeNotification(id)` | Demande à core_vehicleBridge d'être notifié des changements de « kneel » et « dooropen » du véhicule. | 263 |
| `C:requestBusData(id)` | Ne fait rien : le corps (envoi bus_onTriggerTick) est commenté. | 247 |
| `C:requestBusStop(id, data)` | Envoie au bus l'évènement bus_onSetStopRequest (demande d'arrêt). | 274 |
| `C:setKeepVehicle(id, keep)` | Définit dontDelete pour un véhicule suivi ; s'il est dans un prefab, demande au module prefab de le dépaqueter avant suppression. | 170 |
| `C:storeFuelAmount(id)` | Demande et mémorise l'énergie des réservoirs du véhicule, pour la restaurer à l'arrêt (s'il n'est pas supprimé). Log W si le véhicule n'est pas suivi. | 155 |
| `C:updateBusDisplayData(id, data)` | Envoie au véhicule l'évènement bus_onRouteChange avec les données d'affichage de ligne. | 255 |

## Appels vers le moteur (C++)

- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/modules/vehicleModule.lua`.*
