# `ui_pause_providers_vehicleTabInteractions`

*Fichier : `lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua` · VM : Game Engine (GE) · 1775 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_pause_providers_vehicleTabInteractions` : `extensions.load("ui_pause_providers_vehicleTabInteractions")`, puis la globale `ui_pause_providers_vehicleTabInteractions`

Fournisseur de données et d'actions pour l'onglet « Véhicule » (et la gestion des véhicules) du menu pause. Il liste les véhicules apparus (hors personnage à pied « unicycle », véhicules inactifs ou non utilisables par le joueur), leur contrôleur (joueur, IA, multijoueur), leur mode IA (interrogé toutes les 8 s via core_vehicleBridge), et construit pour chaque véhicule les boutons d'action (changer de véhicule, quitter, modes IA, réparer, réinitialiser, cloner, supprimer, tout supprimer sauf celui-ci, ouvrir les détails) en tenant compte des permissions multijoueur et de l'état de la première conduite. Il surligne aussi en orange le véhicule survolé ou sélectionné avec le debugDrawer. Les charges utiles sont envoyées à l'UI soit par appel direct, soit par flux (guihooks.triggerStream) pour l'hydratation asynchrone.

## Exemple

```lua
local data = ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesData({mode = "freeroam"})
for _, v in ipairs(data.vehicles) do print(v.vehicleId, v.label, v.aiMode) end
-- exécuter une action à partir de son buttonId
ui_pause_providers_vehicleTabInteractions.executeVehicleTabInteractionAction(data.vehicles[1].cardActions.switchToVehicle.buttonId)
```

## Remarques

- Flux guihooks émis : ui_pause_vehicleTabInteractions_vehicle_state (état des véhicules : controllerType, controllingPlayerNums, multiSeatLocal, onlineControlled, aiMode, aiControlled, controllerUiElements), ui_pause_vehicleTabInteractions_spawned_payload et ui_pause_vehicleTabInteractions_spawned_selected_payload (charges utiles hydratées). Évènement UI : VehicleTabSpawnFinished quand un véhicule est apparu.
- Les actions sont des boutons (gridSelectorUtils/buttonModule) mis en cache par véhicule : switchToVehicle, switchToVehicle_p<N> (multi-sièges), deleteVehicle, repairVehicleHere, resetVehicle, cloneVehicle, aiModeFlee/Chase/Follow/Random/Traffic/Disable, removeAllOtherVehicles, exitVehicle, openVehicleDetails(Home|Manage), setOtherVehiclesAiMode_<mode>. Elles sont exécutées par buttonId via executeVehicleTabInteractionAction.
- Les modes IA flee, chase et follow envoient ai.setMode puis ai.setTargetObjectID avec le véhicule du joueur comme cible ; random envoie ai.setState({mode = "random"}) ; traffic envoie ai.setMode("traffic") ; désactiver envoie ai.setMode("disabled"). Le mode « disabled » est normalisé en « none » côté affichage.
- Réparer, réinitialiser et la réparation en première conduite avec une mission au premier plan sont bloqués ; réparer utilise spawn.safeTeleport sur la position actuelle, réinitialiser utilise requestReset(RESET_PHYSICS) et resetBrokenFlexMesh. Cloner passe temporairement le joueur sur le véhicule source (be:enterVehicle) pour appeler core_vehicles.cloneCurrent puis revient au véhicule d'origine ; le clonage passe par gameplay_lowPerformance.confirmSpawn s'il existe.
- Les permissions multijoueur sont vérifiées par multiplayer_permissions.checkPlayerPermission (removeVehicle, recoverVehicle, resetVehicle, spawnVehicle) ; sans multijoueur tout est permis.
- Les hooks émis par les actions : trackNewVeh, onVehicleSwitchPerformendByUser (la faute « Performend » est dans le nom du hook du jeu), onVehicleTabInteractionRemoveVehicle(vehicleId), onVehicleTabInteractionRemoveAll(selectedId).
- Le module n'agit (mise à jour périodique, surlignage) que quand la route courante du routeur est pause ou pause.vehicle* / pause.manageVehicles* (flag posé par onPauseRouteLifecycle) ; hors de ces routes, onUpdate remet à zéro le survol et les requêtes différées.
- Le délai de débogage d'hydratation asynchrone (setAsyncHydrationDebugDelay) retarde artificiellement les réponses des requêtes ; il est destiné à la revue de l'interface, pas à l'usage normal.
- Dans getSpawnedVehiclesPayload (appelée par getSpawnedVehiclesData, getSpawnedSelectedVehicleData, etc.), chaque appel remet à zéro l'état, émet le flux d'état et relance la requête de mode IA : ces fonctions ont donc des effets de bord, pas seulement de lecture.

**Dépendances (chargées avant) :** `core_vehicleBridge`, `core_locales`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_pause_providers_vehicleTabInteractions.executeVehicleTabInteractionAction(buttonId, payload)` | Exécute le bouton d'action identifié par buttonId (champ buttonId des entrées d'action renvoyées dans les charges utiles), avec une charge utile facultative. | 1607 |
| `ui_pause_providers_vehicleTabInteractions.getAsyncHydrationDebugDelay()` | Renvoie le délai de débogage d'hydratation asynchrone actuel, en secondes. | 1650 |
| `ui_pause_providers_vehicleTabInteractions.getSpawnedSelectedVehicleData(context)` | Détails du véhicule sélectionné : vehicleId, label, rawName, vehicle (entrée de liste) et groups (groupes d'actions). La sélection vient du paramètre vehicleId de la route, sinon du dernier véhicule choisi, sinon du véhicule du joueur, sinon du premier de la liste. | 1662 |
| `ui_pause_providers_vehicleTabInteractions.getSpawnedSelectedVehicleShellData(context)` | Squelette des détails du véhicule sélectionné (étiquette, groupes d'actions désactivés, loading = true), sans calcul complet. | 1629 |
| `ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesData(context)` | Charge utile complète des véhicules apparus : mode, summary {currentVehicleName, totalCount, aiControlledCount}, selectedVehicleId, aiOtherVehiclesMode, aiModeOptions, vehicles (id, vehicleId, index, displayNumber, label, rawName, isCurrent, controllerType, aiMode, aiControlled, cardActions...), actions (actions globales) et lowPerformance. Effets de bord : réinitialise l'état et relance l'interrogation des modes IA. | 1612 |
| `ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesShellData(context)` | Version « squelette » de la charge utile, sans interroger les véhicules : asyncHydration et loading valent true, liste vide, actions désactivées. Sert à afficher l'écran immédiatement avant l'hydratation. | 1616 |
| `ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesSummaryData(context)` | Renvoie seulement summary et vehicles de la charge utile des véhicules apparus. | 1654 |
| `ui_pause_providers_vehicleTabInteractions.onPauseRouteLifecycle(routeName)` | Hook appelé par routeLifecycleCallbacks à l'entrée et à la sortie d'une route de pause, avec le nom de la route cible. Active ou désactive le suivi (survol, interrogation IA) et réinitialise la numérotation des véhicules si on sort de la famille pause. *(interne)* *(hook)* | 1666 |
| `ui_pause_providers_vehicleTabInteractions.onUpdate(dtReal, dtSim, dtRaw)` | Hook appelé à chaque image. Quand le suivi est actif sur une route de véhicule : traite les requêtes différées, relance l'interrogation des modes IA toutes les 8 s de temps de simulation et dessine un cadre pulsant blanc-orange (12 arêtes de la boîte englobante, épaisseur 3) autour du véhicule survolé ou affiché en détails, via debugDrawer.drawLineInstance. À défaut de boîte, trace une ligne verticale de 2 m. *(interne)* *(hook)* | 1697 |
| `ui_pause_providers_vehicleTabInteractions.onVehicleDestroyed()` | Hook appelé quand un véhicule est détruit : recalcule l'état des véhicules pour l'UI si le suivi est actif. *(interne)* *(hook)* | 1685 |
| `ui_pause_providers_vehicleTabInteractions.onVehicleHoverEnd(vehicleId)` | Appelé par l'UI quand le curseur quitte la carte : supprime le surlignage si c'est ce véhicule (ou si vehicleId est nil). *(interne)* *(hook)* | 1693 |
| `ui_pause_providers_vehicleTabInteractions.onVehicleHoverStart(vehicleId)` | Appelé par l'UI quand le curseur survole la carte d'un véhicule : ce véhicule sera surligné dans le monde. *(interne)* *(hook)* | 1689 |
| `ui_pause_providers_vehicleTabInteractions.onVehicleSpawned()` | Hook appelé à l'apparition d'un véhicule : recalcule l'état si la route le demande et déclenche l'évènement UI VehicleTabSpawnFinished. *(interne)* *(hook)* | 1680 |
| `ui_pause_providers_vehicleTabInteractions.onVehicleSwitchPerformendByUser()` | Hook émis après un changement de véhicule demandé par l'utilisateur depuis le menu : même traitement que onVehicleSwitched. *(interne)* *(hook)* | 1675 |
| `ui_pause_providers_vehicleTabInteractions.onVehicleSwitched()` | Hook appelé quand le véhicule du joueur change : réémet l'état des véhicules vers l'UI et remet à zéro le minuteur d'interrogation IA. *(interne)* *(hook)* | 1670 |
| `ui_pause_providers_vehicleTabInteractions.requestSpawnedSelectedVehiclePayload(payload)` | Version asynchrone des détails du véhicule sélectionné : émet le résultat dans le flux ui_pause_vehicleTabInteractions_spawned_selected_payload. | 1633 |
| `ui_pause_providers_vehicleTabInteractions.requestSpawnedVehiclesPayload(payload)` | Demande l'hydratation asynchrone : calcule la charge utile et l'envoie dans le flux ui_pause_vehicleTabInteractions_spawned_payload (avec asyncHydration, loading = false, requestId). Si un délai de débogage est actif, la réponse est mise en file et un accusé de chargement est renvoyé. | 1620 |
| `ui_pause_providers_vehicleTabInteractions.setAsyncHydrationDebugDelay(delaySec)` | Règle un délai artificiel (secondes, minimum 0) avant la réponse aux requêtes asynchrones ; 0 le désactive et vide la file. | 1642 |

### Détail des paramètres

#### `ui_pause_providers_vehicleTabInteractions.executeVehicleTabInteractionAction(buttonId, payload)`

Exécute le bouton d'action identifié par buttonId (champ buttonId des entrées d'action renvoyées dans les charges utiles), avec une charge utile facultative.

- `buttonId` (*any*) : Identifiant de bouton fourni par buttonModule (déduit du code)
- `payload` (*any*) : Données transmises au callback du bouton (déduit du code)
- **renvoie** : boolean false si buttonId est absent, sinon résultat de l'exécution du bouton

#### `ui_pause_providers_vehicleTabInteractions.getAsyncHydrationDebugDelay()`

Renvoie le délai de débogage d'hydratation asynchrone actuel, en secondes.

- **renvoie** : number Délai en secondes (0 = désactivé)

#### `ui_pause_providers_vehicleTabInteractions.getSpawnedSelectedVehicleData(context)`

Détails du véhicule sélectionné : vehicleId, label, rawName, vehicle (entrée de liste) et groups (groupes d'actions). La sélection vient du paramètre vehicleId de la route, sinon du dernier véhicule choisi, sinon du véhicule du joueur, sinon du premier de la liste.

- `context` (*table|nil*) : Contexte de pause
- **renvoie** : table {vehicleId, label, rawName, vehicle, groups}

#### `ui_pause_providers_vehicleTabInteractions.getSpawnedSelectedVehicleShellData(context)`

Squelette des détails du véhicule sélectionné (étiquette, groupes d'actions désactivés, loading = true), sans calcul complet.

- `context` (*table|nil*) : Contexte de pause
- **renvoie** : table Charge utile de chargement

#### `ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesData(context)`

Charge utile complète des véhicules apparus : mode, summary {currentVehicleName, totalCount, aiControlledCount}, selectedVehicleId, aiOtherVehiclesMode, aiModeOptions, vehicles (id, vehicleId, index, displayNumber, label, rawName, isCurrent, controllerType, aiMode, aiControlled, cardActions...), actions (actions globales) et lowPerformance. Effets de bord : réinitialise l'état et relance l'interrogation des modes IA.

- `context` (*table|nil*) : Contexte de pause ; seul context.mode est lu (défaut « freeroam »)
- **renvoie** : table Charge utile des véhicules

#### `ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesShellData(context)`

Version « squelette » de la charge utile, sans interroger les véhicules : asyncHydration et loading valent true, liste vide, actions désactivées. Sert à afficher l'écran immédiatement avant l'hydratation.

- `context` (*table|nil*) : Contexte de pause (mode)
- **renvoie** : table Charge utile de chargement

#### `ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesSummaryData(context)`

Renvoie seulement summary et vehicles de la charge utile des véhicules apparus.

- `context` (*table|nil*) : Contexte de pause
- **renvoie** : table {summary, vehicles}

#### `ui_pause_providers_vehicleTabInteractions.onPauseRouteLifecycle(routeName)`

Hook appelé par routeLifecycleCallbacks à l'entrée et à la sortie d'une route de pause, avec le nom de la route cible. Active ou désactive le suivi (survol, interrogation IA) et réinitialise la numérotation des véhicules si on sort de la famille pause.

- `routeName` (*string|nil*) : Nom de la route cible

#### `ui_pause_providers_vehicleTabInteractions.onUpdate(dtReal, dtSim, dtRaw)`

Hook appelé à chaque image. Quand le suivi est actif sur une route de véhicule : traite les requêtes différées, relance l'interrogation des modes IA toutes les 8 s de temps de simulation et dessine un cadre pulsant blanc-orange (12 arêtes de la boîte englobante, épaisseur 3) autour du véhicule survolé ou affiché en détails, via debugDrawer.drawLineInstance. À défaut de boîte, trace une ligne verticale de 2 m.

- `dtReal` (*number*) : Temps réel (s)
- `dtSim` (*number*) : Temps de simulation (s)
- `dtRaw` (*number*) : Temps brut (s)

#### `ui_pause_providers_vehicleTabInteractions.onVehicleHoverEnd(vehicleId)`

Appelé par l'UI quand le curseur quitte la carte : supprime le surlignage si c'est ce véhicule (ou si vehicleId est nil).

- `vehicleId` (*number|nil*) : Identifiant du véhicule

#### `ui_pause_providers_vehicleTabInteractions.onVehicleHoverStart(vehicleId)`

Appelé par l'UI quand le curseur survole la carte d'un véhicule : ce véhicule sera surligné dans le monde.

- `vehicleId` (*number*) : Identifiant du véhicule survolé

#### `ui_pause_providers_vehicleTabInteractions.requestSpawnedSelectedVehiclePayload(payload)`

Version asynchrone des détails du véhicule sélectionné : émet le résultat dans le flux ui_pause_vehicleTabInteractions_spawned_selected_payload.

- `payload` (*table|nil*) : {requestId, context}
- **renvoie** : table Charge utile émise, ou accusé de chargement en mode délai de débogage

#### `ui_pause_providers_vehicleTabInteractions.requestSpawnedVehiclesPayload(payload)`

Demande l'hydratation asynchrone : calcule la charge utile et l'envoie dans le flux ui_pause_vehicleTabInteractions_spawned_payload (avec asyncHydration, loading = false, requestId). Si un délai de débogage est actif, la réponse est mise en file et un accusé de chargement est renvoyé.

- `payload` (*table|nil*) : {requestId, context}
- **renvoie** : table Charge utile émise, ou accusé de chargement en mode délai de débogage

#### `ui_pause_providers_vehicleTabInteractions.setAsyncHydrationDebugDelay(delaySec)`

Règle un délai artificiel (secondes, minimum 0) avant la réponse aux requêtes asynchrones ; 0 le désactive et vide la file.

- `delaySec` (*number*) : Délai en secondes
- **renvoie** : number Délai effectivement appliqué

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'core_vehicleBridge', 'core_locales'} |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onVehicleSwitchPerformendByUser` — écouté par 1 module(s)
- `onVehicleTabInteractionRemoveAll`
- `onVehicleTabInteractionRemoveVehicle`
- `trackNewVeh`

**Évènements UI (guihooks.trigger) :** `VehicleTabSpawnFinished`

## Appels vers le moteur (C++)

- `be:` `enterVehicle`, `getObject`, `getObjectCount`, `getPlayerVehicleID`
- `debugDrawer:` `drawLineInstance`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua`.*
