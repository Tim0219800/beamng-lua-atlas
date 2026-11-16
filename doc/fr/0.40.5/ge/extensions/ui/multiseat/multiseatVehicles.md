# `ui_multiseat_multiseatVehicles`

*Fichier : `lua/ge/extensions/ui/multiseat/multiseatVehicles.lua` · VM : Game Engine (GE) · 2166 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_multiseat_multiseatVehicles` : `extensions.load("ui_multiseat_multiseatVehicles")`, puis la globale `ui_multiseat_multiseatVehicles`

Gère les véhicules et les profils (personas) des joueurs en multi-sièges : choix des véhicules suggérés, couleurs automatiques proches de la couleur du joueur, état « préparé » (staged) des réglages (véhicule, icône, préférences de conduite), apparition, remplacement, rassemblement et suppression des véhicules, sélecteurs de véhicule et données du récapitulatif (digest). C'est le moteur derrière ui_multiseat_multiseatSettings et ui_multiseat_freeroam. Il suit les véhicules possédés par persona (ownedByPersona) et survit à un rechargement Lua via onSerialize/onDeserialized.

## Remarques

- Véhicules de repli (fallbackVehicles) : covet, pessima, pickup, roamer, vivace. Une suggestion n'est valide que si {model, config} sont des chaînes et que le fichier /<config> existe.
- Ordre de priorité de getSuggestedVehicles : mainLevel.getMultiseatSuggestedVehicles(playerCount) (il faut au moins un véhicule valide par joueur), puis le pool du gamemode (gameplay_multiseat_gamemodeManager.getVehiclePool), puis level.multiseat.suggestedVehicles de info.json, puis les véhicules de repli.
- Couleur automatique : parmi les peintures du modèle, celles dont la couleur principale est proche de la couleur du joueur (distance RGB au carré <= 0,04) ; le choix parmi les 3 plus proches est stable (hash de persona|modèle|config). Sans couleur automatique : peinture choisie dans le sélecteur, sinon peinture d'usine de teinte la plus proche, sinon peinture par défaut.
- Préférences de conduite d'un joueur : gearbox (« arcade » ou « realistic »), clutchAssist, throttleAssist, ignitionLevel (entier 0 à 3), characterFace.
- Codes de raison renvoyés : player_unavailable, invalid_vehicle_selection, persona_update_failed, vehicle_replace_failed, vehicle_spawn_failed, no_players, player_limit_exceeded, vehicles_not_prepared, prepared_vehicle_missing.
- Application des réglages en trois temps : prepareStagedChanges (fait apparaître les nouveaux véhicules), configuration commitCore, puis finalizeStagedChanges (supprime les véhicules en trop, assigne les joueurs, applique les préférences).
- Bug probable : getAutomaticColorEnabled utilise l'idiome « a == nil and b or c » ; quand rien n'est préparé et que le réglage multiseatAutomaticColor vaut false, l'expression renvoie nil au lieu de false (effet sans gravité car nil est traité comme faux).
- Événement UI émis : app:waiting (true/false) pendant le remplacement d'un véhicule depuis le sélecteur rapide ; le remplacement lui-même est exécuté au hook onUiWaitingState.
- Routes utilisées : pause.multiseatSettings, pause.multiseatSettings.vehicleSelector, pause.multiseatVehicleSelector.

**Dépendances (chargées avant) :** `core_locales`, `core_playerPersonas`, `core_vehicle_configTarget`, `ui_gridSelectorRouteLifecycleCallbacks`, `ui_vehicleSelector_general`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_multiseat_multiseatVehicles.abandonPlayerVehicle(player)` | Cesse de suivre le véhicule d'un joueur sans le supprimer, pour qu'il survive à removeAll lors de la sortie du multiseat. | 1943 |
| `ui_multiseat_multiseatVehicles.adoptFreeroamVehicle(player, veh)` | Fait adopter à un joueur un véhicule existant : enregistre {model, config} dans sa persona et suit le véhicule comme possédé. | 1596 |
| `ui_multiseat_multiseatVehicles.applyStagedChanges()` | Enchaîne prepareStagedChanges, multiseatConfiguration.commitCore, finalizeStagedChanges et completeCommit, avec retour arrière en cas d'échec. | 1834 |
| `ui_multiseat_multiseatVehicles.areVehiclesReady(spawned)` | Indique si tous les véhicules indiqués (ou possédés) existent et sont prêts (veh:isReady). | 1986 |
| `ui_multiseat_multiseatVehicles.cancelPreparedChanges()` | Supprime les véhicules créés par prepareStagedChanges et oublie le plan. | 1853 |
| `ui_multiseat_multiseatVehicles.clearCustomSplitPlayers()` | Efface la liste personnalisée et reprend les joueurs inscrits (render_splitScreen.clearCustomPlayers si disponible). | 683 |
| `ui_multiseat_multiseatVehicles.clearSession()` | Efface toutes les données de session (sélections, états actifs et préparés, préférences de rechargement). | 1928 |
| `ui_multiseat_multiseatVehicles.configurePlayerVehicle(vehicle, playerId)` | Ouvre l'écran de configuration des pièces du véhicule d'un joueur : démarre core_vehicle_configTarget, passe en vue solo (render_splitScreen.beginSoloView) puis navigue vers « pause.vehicle.configurationcombined ». Annule tout si une étape échoue. | 1062 |
| `ui_multiseat_multiseatVehicles.cycleDevicePlayer(deviceId)` | Délègue à multiseatConfiguration.cycleDevicePlayer puis resynchronise l'état préparé. | 1108 |
| `ui_multiseat_multiseatVehicles.discardStagedChanges()` | Abandonne l'état préparé et force sa reconstruction au prochain accès. | 1857 |
| `ui_multiseat_multiseatVehicles.executeDigestAction(buttonId, payload)` | Exécute le bouton du récapitulatif identifié par buttonId. | 1057 |
| `ui_multiseat_multiseatVehicles.finalizeStagedChanges(changes, committedConfig)` | Dernière étape : supprime les véhicules devenus inutiles, enregistre les sélections de session, assigne chaque joueur à son véhicule, applique les préférences et supprime les véhicules préexistants non possédés (si le multiseat démarre). Remet à zéro l'état préparé. | 1793 |
| `ui_multiseat_multiseatVehicles.gatherVehicles(target)` | Rassemble les véhicules possédés : à côté du véhicule d'un joueur (indice) ou à un point d'apparition (« spawnPoint:nomObjet »), en les alignant l'un après l'autre sur le côté droit. | 1370 |
| `ui_multiseat_multiseatVehicles.getAutomaticColorEnabled()` | Indique si la couleur automatique est activée (valeur préparée si elle existe, sinon réglage multiseatAutomaticColor). Voir la note sur le cas nil. | 128 |
| `ui_multiseat_multiseatVehicles.getDigestData()` | Données du récapitulatif de véhicules pour chaque joueur inscrit (libellé, périphérique, véhicule, actions « changeVehicle » et « configureVehicle » avec leur buttonId). Attribue d'abord des véhicules par défaut aux personas qui n'en ont pas. | 983 |
| `ui_multiseat_multiseatVehicles.getGatherVehicleOptions()` | Options du champ « rassembler les véhicules » : un joueur comme point de rassemblement, puis les points d'apparition du niveau (valeur « spawnPoint:nomObjet »). Renvoie nil s'il y a moins de 2 véhicules possédés. | 1308 |
| `ui_multiseat_multiseatVehicles.getOwnedVehicles()` | Liste, triée par joueur, des entrées de véhicules possédés encore présents dans la scène. | 1951 |
| `ui_multiseat_multiseatVehicles.getPersonaSelectorData()` | Données du composant « personas » de l'écran de réglages : l'aperçu de multiseatConfiguration avec playerLimit recalculé pour le niveau (playerLimits.getCurrentLevelState). | 905 |
| `ui_multiseat_multiseatVehicles.getSettingsData()` | Données du composant « vehicles » : pour chaque joueur préparé, personaId, label, icône et icônes choisissables, couleur, état de connexion, libellé du périphérique, véhicule {model, config, label, paints} et préférences ; plus characterFaceOptions. | 924 |
| `ui_multiseat_multiseatVehicles.getSharedVehicleOptions()` | Options du champ « même véhicule pour tous » : véhicules distincts déjà préparés (valeur = indice de joueur), puis jusqu'à 8 véhicules récents (valeur « recent:modèle/config ») après un séparateur. Renvoie nil s'il y a moins de 2 joueurs préparés. | 1222 |
| `ui_multiseat_multiseatVehicles.getStagedChanges()` | Compare l'état actif à l'état préparé et renvoie {dirty, requiresRestart, rosterChanged, vehicleChanged, colorChanged, iconChanged, preferencesChanged}. Un changement de joueurs ou de modèle/config exige un redémarrage ; une simple couleur est repeinte sur le véhicule en place. | 833 |
| `ui_multiseat_multiseatVehicles.getStagedPlayers()` | Liste triée des indices de joueurs inscrits dans l'état préparé. | 896 |
| `ui_multiseat_multiseatVehicles.getSuggestedVehicles(levelName, playerCount)` | Renvoie un véhicule suggéré par joueur en essayant, dans l'ordre : la fonction du niveau mainLevel.getMultiseatSuggestedVehicles, le pool du gamemode, puis getSuggestedVehiclesForLevel. | 70 |
| `ui_multiseat_multiseatVehicles.getSuggestedVehiclesForLevel(levelName, playerCount)` | Choisit un véhicule par joueur dans le pool multiseat.suggestedVehicles du niveau (info.json), sinon dans les véhicules de repli ; le pool est mélangé puis parcouru en boucle. | 61 |
| `ui_multiseat_multiseatVehicles.getVehicleForPlayer(player)` | Renvoie une copie du véhicule {model, config, ...} de la persona d'un joueur. | 1874 |
| `ui_multiseat_multiseatVehicles.hasUserChanges()` | Indique si l'état préparé diffère de l'état initial pris à l'ouverture de l'écran. | 891 |
| `ui_multiseat_multiseatVehicles.isSynchronizing()` | Indique si un instantané est en construction, si des changements sont en cours d'application ou si une préparation est en attente. | 1996 |
| `ui_multiseat_multiseatVehicles.joinDeviceGroup(groupId)` | Délègue à multiseatConfiguration.joinDeviceGroup puis resynchronise. | 1138 |
| `ui_multiseat_multiseatVehicles.leaveDeviceGroup(player)` | Retire un joueur via multiseatConfiguration.leavePlayer puis resynchronise. | 1144 |
| `ui_multiseat_multiseatVehicles.moveDevicePlayer(deviceId, direction)` | Délègue à multiseatConfiguration.moveDevicePlayer puis resynchronise l'état préparé. | 1120 |
| `ui_multiseat_multiseatVehicles.onClientEndMission()` | Hook appelé à la fin du niveau ; vide tout l'état (les véhicules partent avec le niveau). *(interne)* *(hook)* | 2107 |
| `ui_multiseat_multiseatVehicles.onDeserialized(data)` | Hook appelé après un rechargement Lua ; relie les véhicules sérialisés aux joueurs et programme une réconciliation. *(interne)* *(hook)* | 2038 |
| `ui_multiseat_multiseatVehicles.onExtensionUnloaded()` | Hook appelé au déchargement de l'extension ; supprime les véhicules possédés sauf si un rechargement Lua est en cours (preserveVehiclesOnUnload), puis vide l'état. *(interne)* *(hook)* | 2131 |
| `ui_multiseat_multiseatVehicles.onQuickVehicleSelectorEnter(context, toRoute, fromRoute, data)` | Callback d'entrée de la route du sélecteur rapide ; délègue à ui_gridSelectorRouteLifecycleCallbacks.onRouteEnter. *(interne)* *(hook)* | 1581 |
| `ui_multiseat_multiseatVehicles.onQuickVehicleSelectorLeave(context, toRoute, fromRoute, data)` | Callback de sortie de la route du sélecteur rapide ; délègue à gridSelector puis oublie le joueur en attente si on quitte la route. *(interne)* *(hook)* | 1589 |
| `ui_multiseat_multiseatVehicles.onQuickVehicleSelectorMount(context, toRoute, fromRoute, data)` | Callback de montage de la route du sélecteur rapide ; délègue à ui_gridSelectorRouteLifecycleCallbacks.onRouteMount. *(interne)* *(hook)* | 1585 |
| `ui_multiseat_multiseatVehicles.onSerialize(reason)` | Hook appelé avant un rechargement Lua ; si le multiseat est actif, renvoie les véhicules possédés, les sélections de session et les préférences, et empêche la suppression des véhicules au déchargement. *(interne)* *(hook)* | 2000 |
| `ui_multiseat_multiseatVehicles.onUiWaitingState()` | Hook appelé quand l'interface affiche l'état d'attente ; exécute le remplacement de véhicule différé par le sélecteur rapide. *(interne)* *(hook)* | 2098 |
| `ui_multiseat_multiseatVehicles.onUpdate()` | Hook appelé à chaque image ; après un rechargement, réconcilie les véhicules (preserveOwned), restaure les préférences et dégèle les véhicules dès que des participants sont présents. *(interne)* *(hook)* | 2068 |
| `ui_multiseat_multiseatVehicles.onVehicleSelectorLeave(toRoute)` | Appelé par multiseatSettings à la sortie de la route du sélecteur ; annule la sélection en attente si on quitte vraiment cette route. *(interne)* *(hook)* | 1466 |
| `ui_multiseat_multiseatVehicles.openQuickVehicleSelectorForPlayer(player)` | Ouvre le sélecteur rapide (route pause.multiseatVehicleSelector) depuis le menu pause ; au choix, revient à « pause » puis remplace le véhicule après l'événement onUiWaitingState. | 1557 |
| `ui_multiseat_multiseatVehicles.openVehicleSelectorForAllPlayers()` | Ouvre le sélecteur de véhicule et applique le choix à tous les joueurs préparés (au moins 2 requis). | 1440 |
| `ui_multiseat_multiseatVehicles.openVehicleSelectorForPlayer(player)` | Ouvre le sélecteur de véhicule pour un joueur préparé (route pause.multiseatSettings.vehicleSelector). Au choix, le véhicule est préparé et on revient à l'écran de réglages. | 1415 |
| `ui_multiseat_multiseatVehicles.prepareStagedChanges()` | Première étape d'application : vérifie joueurs et limite, écrit les données préparées dans les personas et fait apparaître les véhicules nouveaux ou différents (les autres sont repeints). Les véhicules créés sont gardés dans un plan jusqu'à finalizeStagedChanges ou cancelPreparedChanges. | 1711 |
| `ui_multiseat_multiseatVehicles.reconcileFreeroamVehicles(options)` | Met les véhicules possédés en accord avec les joueurs inscrits : supprime ceux des joueurs partis, remplace les véhicules différents de la sélection (sauf options.preserveOwned) et fait apparaître les manquants derrière un véhicule existant sur la route (core_multiSpawn « roadBehind »), sinon à côté. Assigne ensuite chaque joueur et resynchronise l'écran partagé. | 1635 |
| `ui_multiseat_multiseatVehicles.reconcileSpawnPlan(spawnPlan, options)` | Fait correspondre les véhicules à un plan d'apparition en les réutilisant ou les remplaçant si besoin, et supprime les autres sauf si options.removeMissing == false. options.customPlayers fixe la liste de joueurs en écran partagé. | 1893 |
| `ui_multiseat_multiseatVehicles.removeAll()` | Supprime tous les véhicules possédés (les joueurs en sortent d'abord). | 1922 |
| `ui_multiseat_multiseatVehicles.removeDevice(deviceId)` | Délègue à multiseatConfiguration.removeDevice (périphérique déconnecté) puis resynchronise. | 1132 |
| `ui_multiseat_multiseatVehicles.repaintOwnedVehicles()` | Repeint les véhicules possédés avec les peintures de leur persona (mise à jour en direct des couleurs). | 1973 |
| `ui_multiseat_multiseatVehicles.replacePlayerVehicle(player, model, config, additionalData)` | Remplace en direct le véhicule d'un joueur multiseat actif (met à jour la persona, remplace ou fait apparaître le véhicule, assigne le joueur et réinitialise la caméra). Restaure l'ancienne persona en cas d'échec. | 1509 |
| `ui_multiseat_multiseatVehicles.reseatAllPlayers()` | Remet chaque joueur dans son véhicule possédé s'il n'y est plus. | 1403 |
| `ui_multiseat_multiseatVehicles.resetSettingsSnapshots()` | Réinitialise les instantanés de l'écran de réglages (appelé à sa fermeture). | 1866 |
| `ui_multiseat_multiseatVehicles.setCustomSplitPlayers(players)` | Définit la liste de joueurs affichés en écran partagé (copie) et la transmet à render_splitScreen.setCustomPlayers. | 678 |
| `ui_multiseat_multiseatVehicles.setDevicePlayer(deviceId, personaNumber)` | Délègue à multiseatConfiguration.setDevicePlayer puis resynchronise l'état préparé. | 1126 |
| `ui_multiseat_multiseatVehicles.setFrozen(spawned, frozen)` | Gèle ou dégèle des véhicules via core_vehicleBridge (action setFreeze). | 1962 |
| `ui_multiseat_multiseatVehicles.setPlayerVehicleSelection(player, vehicle)` | Enregistre {model, config} comme véhicule de la persona d'un joueur (sans faire apparaître de véhicule). | 1614 |
| `ui_multiseat_multiseatVehicles.spawnAll(spawnPlan)` | Supprime tous les véhicules possédés puis fait apparaître le véhicule de chaque joueur du plan à sa position (place de parking ou pos/rot), assigne le joueur et suit le véhicule. | 1880 |
| `ui_multiseat_multiseatVehicles.stageAutomaticColorForAllPlayers(automaticColor)` | Prépare le mode couleur automatique pour tous les joueurs et recalcule la peinture de leur véhicule préparé. | 1204 |
| `ui_multiseat_multiseatVehicles.stagePlayerIcon(player, icon)` | Prépare l'icône d'un joueur ; refusée si ce n'est pas une icône de persona, si elle est inchangée ou déjà prise par un autre joueur. | 1189 |
| `ui_multiseat_multiseatVehicles.stagePlayerOptIn(player, optedIn)` | Prépare la sortie d'un joueur (seul optedIn = false est accepté ; true renvoie false). | 1101 |
| `ui_multiseat_multiseatVehicles.stagePlayerVehiclePreferences(player, preferences)` | Prépare les préférences de conduite d'un joueur après validation (gearbox arcade/realistic, ignitionLevel entier 0 à 3, characterFace valide). | 1167 |
| `ui_multiseat_multiseatVehicles.stageSameVehicleForAllPlayers(source)` | Prépare le même véhicule pour tous les joueurs, à partir de « recent:modèle/config » ou de l'indice d'un joueur dont on copie le véhicule. | 1296 |
| `ui_multiseat_multiseatVehicles.toggleDevicePlayer(deviceId)` | Délègue à multiseatConfiguration.toggleDevicePlayer puis resynchronise l'état préparé. | 1114 |

### Détail des paramètres

#### `ui_multiseat_multiseatVehicles.abandonPlayerVehicle(player)`

Cesse de suivre le véhicule d'un joueur sans le supprimer, pour qu'il survive à removeAll lors de la sortie du multiseat.

- `player` (*integer*) : Indice de joueur.
- **renvoie** : userdata|nil Objet véhicule, nil si aucun.

#### `ui_multiseat_multiseatVehicles.adoptFreeroamVehicle(player, veh)`

Fait adopter à un joueur un véhicule existant : enregistre {model, config} dans sa persona et suit le véhicule comme possédé.

- `player` (*integer*) : Indice de joueur.
- `veh` (*userdata*) : Objet véhicule.
- **renvoie** : boolean false si le joueur ou le véhicule est invalide.

#### `ui_multiseat_multiseatVehicles.applyStagedChanges()`

Enchaîne prepareStagedChanges, multiseatConfiguration.commitCore, finalizeStagedChanges et completeCommit, avec retour arrière en cas d'échec.

- **renvoie** : table {success, reason?, changes?}.

#### `ui_multiseat_multiseatVehicles.areVehiclesReady(spawned)`

Indique si tous les véhicules indiqués (ou possédés) existent et sont prêts (veh:isReady).

- `spawned` (*table[]|nil*) : Entrées de véhicules.
- **renvoie** : boolean true si tous sont prêts.

#### `ui_multiseat_multiseatVehicles.configurePlayerVehicle(vehicle, playerId)`

Ouvre l'écran de configuration des pièces du véhicule d'un joueur : démarre core_vehicle_configTarget, passe en vue solo (render_splitScreen.beginSoloView) puis navigue vers « pause.vehicle.configurationcombined ». Annule tout si une étape échoue.

- `vehicle` (*userdata*) : Objet véhicule ; doit être celui possédé par le joueur.
- `playerId` (*integer*) : Indice de joueur.
- **renvoie** : boolean true si l'écran est ouvert.

#### `ui_multiseat_multiseatVehicles.cycleDevicePlayer(deviceId)`

Délègue à multiseatConfiguration.cycleDevicePlayer puis resynchronise l'état préparé.

- `deviceId` (*string*) : Identifiant du périphérique.
- **renvoie** : boolean true si modifié.

#### `ui_multiseat_multiseatVehicles.discardStagedChanges()`

Abandonne l'état préparé et force sa reconstruction au prochain accès.

- **renvoie** : boolean Toujours true.

#### `ui_multiseat_multiseatVehicles.executeDigestAction(buttonId, payload)`

Exécute le bouton du récapitulatif identifié par buttonId.

- `buttonId` (*any*) : Identifiant donné par getDigestData.
- `payload` (*any*) : Données transmises au bouton.
- **renvoie** : boolean false si buttonId est nil, sinon résultat du bouton.

#### `ui_multiseat_multiseatVehicles.finalizeStagedChanges(changes, committedConfig)`

Dernière étape : supprime les véhicules devenus inutiles, enregistre les sélections de session, assigne chaque joueur à son véhicule, applique les préférences et supprime les véhicules préexistants non possédés (si le multiseat démarre). Remet à zéro l'état préparé.

- `changes` (*table|nil*) : Résultat de getStagedChanges, renvoyé tel quel.
- `committedConfig` (*table*) : Configuration appliquée (non utilisée directement).
- **renvoie** : table {success = true, changes} ou {success = false, reason}.

#### `ui_multiseat_multiseatVehicles.gatherVehicles(target)`

Rassemble les véhicules possédés : à côté du véhicule d'un joueur (indice) ou à un point d'apparition (« spawnPoint:nomObjet »), en les alignant l'un après l'autre sur le côté droit.

- `target` (*integer|string*) : Indice de joueur ou « spawnPoint:nomObjet ».
- **renvoie** : boolean true si au moins un véhicule a été déplacé.

#### `ui_multiseat_multiseatVehicles.getAutomaticColorEnabled()`

Indique si la couleur automatique est activée (valeur préparée si elle existe, sinon réglage multiseatAutomaticColor). Voir la note sur le cas nil.

- **renvoie** : boolean|nil true si activée.

#### `ui_multiseat_multiseatVehicles.getDigestData()`

Données du récapitulatif de véhicules pour chaque joueur inscrit (libellé, périphérique, véhicule, actions « changeVehicle » et « configureVehicle » avec leur buttonId). Attribue d'abord des véhicules par défaut aux personas qui n'en ont pas.

- **renvoie** : table {players = {...}}.

#### `ui_multiseat_multiseatVehicles.getGatherVehicleOptions()`

Options du champ « rassembler les véhicules » : un joueur comme point de rassemblement, puis les points d'apparition du niveau (valeur « spawnPoint:nomObjet »). Renvoie nil s'il y a moins de 2 véhicules possédés.

- **renvoie** : table[]|nil Options {value, label, disabled?}.

#### `ui_multiseat_multiseatVehicles.getOwnedVehicles()`

Liste, triée par joueur, des entrées de véhicules possédés encore présents dans la scène.

- **renvoie** : table[] Entrées {veh, vehId, player, personaId}.

#### `ui_multiseat_multiseatVehicles.getPersonaSelectorData()`

Données du composant « personas » de l'écran de réglages : l'aperçu de multiseatConfiguration avec playerLimit recalculé pour le niveau (playerLimits.getCurrentLevelState).

- **renvoie** : table Aperçu enrichi.

#### `ui_multiseat_multiseatVehicles.getSettingsData()`

Données du composant « vehicles » : pour chaque joueur préparé, personaId, label, icône et icônes choisissables, couleur, état de connexion, libellé du périphérique, véhicule {model, config, label, paints} et préférences ; plus characterFaceOptions.

- **renvoie** : table {players, characterFaceOptions}.

#### `ui_multiseat_multiseatVehicles.getSharedVehicleOptions()`

Options du champ « même véhicule pour tous » : véhicules distincts déjà préparés (valeur = indice de joueur), puis jusqu'à 8 véhicules récents (valeur « recent:modèle/config ») après un séparateur. Renvoie nil s'il y a moins de 2 joueurs préparés.

- **renvoie** : table[]|nil Options {value, label, disabled?}.
- **renvoie** : integer|nil Valeur actuellement partagée, nil si les véhicules diffèrent.

#### `ui_multiseat_multiseatVehicles.getStagedChanges()`

Compare l'état actif à l'état préparé et renvoie {dirty, requiresRestart, rosterChanged, vehicleChanged, colorChanged, iconChanged, preferencesChanged}. Un changement de joueurs ou de modèle/config exige un redémarrage ; une simple couleur est repeinte sur le véhicule en place.

- **renvoie** : table Table d'indicateurs.

#### `ui_multiseat_multiseatVehicles.getStagedPlayers()`

Liste triée des indices de joueurs inscrits dans l'état préparé.

- **renvoie** : integer[] Indices de joueurs.

#### `ui_multiseat_multiseatVehicles.getSuggestedVehicles(levelName, playerCount)`

Renvoie un véhicule suggéré par joueur en essayant, dans l'ordre : la fonction du niveau mainLevel.getMultiseatSuggestedVehicles, le pool du gamemode, puis getSuggestedVehiclesForLevel.

- `levelName` (*string|nil*) : Nom du niveau.
- `playerCount` (*integer*) : Nombre de joueurs ; < 1 renvoie {}.
- **renvoie** : table[] Liste de {model, config}.

#### `ui_multiseat_multiseatVehicles.getSuggestedVehiclesForLevel(levelName, playerCount)`

Choisit un véhicule par joueur dans le pool multiseat.suggestedVehicles du niveau (info.json), sinon dans les véhicules de repli ; le pool est mélangé puis parcouru en boucle.

- `levelName` (*string|nil*) : Nom du niveau.
- `playerCount` (*integer*) : Nombre de joueurs ; < 1 renvoie {}.
- **renvoie** : table[] Liste de {model, config}, une entrée par joueur.

#### `ui_multiseat_multiseatVehicles.getVehicleForPlayer(player)`

Renvoie une copie du véhicule {model, config, ...} de la persona d'un joueur.

- `player` (*integer*) : Indice de joueur.
- **renvoie** : table|nil Véhicule, nil si le joueur est absent.

#### `ui_multiseat_multiseatVehicles.hasUserChanges()`

Indique si l'état préparé diffère de l'état initial pris à l'ouverture de l'écran.

- **renvoie** : boolean true si l'utilisateur a modifié quelque chose.

#### `ui_multiseat_multiseatVehicles.isSynchronizing()`

Indique si un instantané est en construction, si des changements sont en cours d'application ou si une préparation est en attente.

- **renvoie** : boolean true si en cours.

#### `ui_multiseat_multiseatVehicles.joinDeviceGroup(groupId)`

Délègue à multiseatConfiguration.joinDeviceGroup puis resynchronise.

- `groupId` (*integer*) : Identifiant de groupe.
- **renvoie** : boolean true si modifié.

#### `ui_multiseat_multiseatVehicles.leaveDeviceGroup(player)`

Retire un joueur via multiseatConfiguration.leavePlayer puis resynchronise.

- `player` (*integer*) : Indice de joueur.
- **renvoie** : boolean true si modifié.

#### `ui_multiseat_multiseatVehicles.moveDevicePlayer(deviceId, direction)`

Délègue à multiseatConfiguration.moveDevicePlayer puis resynchronise l'état préparé.

- `deviceId` (*string*) : Identifiant du périphérique.
- `direction` (*integer*) : -1 ou 1.
- **renvoie** : boolean true si modifié.

#### `ui_multiseat_multiseatVehicles.onDeserialized(data)`

Hook appelé après un rechargement Lua ; relie les véhicules sérialisés aux joueurs et programme une réconciliation.

- `data` (*table*) : Données renvoyées par onSerialize.

#### `ui_multiseat_multiseatVehicles.onQuickVehicleSelectorEnter(context, toRoute, fromRoute, data)`

Callback d'entrée de la route du sélecteur rapide ; délègue à ui_gridSelectorRouteLifecycleCallbacks.onRouteEnter.

- `context` (*table*) : Contexte de route.
- `toRoute` (*table*) : Route d'arrivée.
- `fromRoute` (*table*) : Route de départ.
- `data` (*any*) : Données de navigation.

#### `ui_multiseat_multiseatVehicles.onQuickVehicleSelectorLeave(context, toRoute, fromRoute, data)`

Callback de sortie de la route du sélecteur rapide ; délègue à gridSelector puis oublie le joueur en attente si on quitte la route.

- `context` (*table*) : Contexte de route.
- `toRoute` (*table*) : Route d'arrivée.
- `fromRoute` (*table*) : Route de départ.
- `data` (*any*) : Données de navigation.

#### `ui_multiseat_multiseatVehicles.onQuickVehicleSelectorMount(context, toRoute, fromRoute, data)`

Callback de montage de la route du sélecteur rapide ; délègue à ui_gridSelectorRouteLifecycleCallbacks.onRouteMount.

- `context` (*table*) : Contexte de route.
- `toRoute` (*table*) : Route d'arrivée.
- `fromRoute` (*table*) : Route de départ.
- `data` (*any*) : Données de navigation.

#### `ui_multiseat_multiseatVehicles.onSerialize(reason)`

Hook appelé avant un rechargement Lua ; si le multiseat est actif, renvoie les véhicules possédés, les sélections de session et les préférences, et empêche la suppression des véhicules au déchargement.

- `reason` (*string*) : Raison (log).
- **renvoie** : table|nil {ownedVehicles, sessionByPersona, preferencesByPersona}.

#### `ui_multiseat_multiseatVehicles.onVehicleSelectorLeave(toRoute)`

Appelé par multiseatSettings à la sortie de la route du sélecteur ; annule la sélection en attente si on quitte vraiment cette route.

- `toRoute` (*table|nil*) : Route d'arrivée.

#### `ui_multiseat_multiseatVehicles.openQuickVehicleSelectorForPlayer(player)`

Ouvre le sélecteur rapide (route pause.multiseatVehicleSelector) depuis le menu pause ; au choix, revient à « pause » puis remplace le véhicule après l'événement onUiWaitingState.

- `player` (*integer*) : Indice de joueur.
- **renvoie** : boolean false si le multiseat est inactif ou le joueur absent.

#### `ui_multiseat_multiseatVehicles.openVehicleSelectorForAllPlayers()`

Ouvre le sélecteur de véhicule et applique le choix à tous les joueurs préparés (au moins 2 requis).

- **renvoie** : boolean false s'il y a moins de 2 joueurs.

#### `ui_multiseat_multiseatVehicles.openVehicleSelectorForPlayer(player)`

Ouvre le sélecteur de véhicule pour un joueur préparé (route pause.multiseatSettings.vehicleSelector). Au choix, le véhicule est préparé et on revient à l'écran de réglages.

- `player` (*integer*) : Indice de joueur.
- **renvoie** : boolean false si le joueur n'est pas inscrit.

#### `ui_multiseat_multiseatVehicles.prepareStagedChanges()`

Première étape d'application : vérifie joueurs et limite, écrit les données préparées dans les personas et fait apparaître les véhicules nouveaux ou différents (les autres sont repeints). Les véhicules créés sont gardés dans un plan jusqu'à finalizeStagedChanges ou cancelPreparedChanges.

- **renvoie** : table {success = true, changes} ou {success = false, reason}.

#### `ui_multiseat_multiseatVehicles.reconcileFreeroamVehicles(options)`

Met les véhicules possédés en accord avec les joueurs inscrits : supprime ceux des joueurs partis, remplace les véhicules différents de la sélection (sauf options.preserveOwned) et fait apparaître les manquants derrière un véhicule existant sur la route (core_multiSpawn « roadBehind »), sinon à côté. Assigne ensuite chaque joueur et resynchronise l'écran partagé.

- `options` (*table|nil*) : preserveOwned = true conserve les véhicules existants tels quels.
- **renvoie** : boolean Succès.
- **renvoie** : string|nil vehicle_replace_failed ou vehicle_spawn_failed.

#### `ui_multiseat_multiseatVehicles.reconcileSpawnPlan(spawnPlan, options)`

Fait correspondre les véhicules à un plan d'apparition en les réutilisant ou les remplaçant si besoin, et supprime les autres sauf si options.removeMissing == false. options.customPlayers fixe la liste de joueurs en écran partagé.

- `spawnPlan` (*table[]*) : Liste de {player, parkingSpot|pos+rot}.
- `options` (*table|nil*) : removeMissing, customPlayers.
- **renvoie** : table[] Entrées réconciliées.
- **renvoie** : string|nil Raison de l'arrêt (player_unavailable, vehicle_replace_failed, vehicle_spawn_failed).

#### `ui_multiseat_multiseatVehicles.removeDevice(deviceId)`

Délègue à multiseatConfiguration.removeDevice (périphérique déconnecté) puis resynchronise.

- `deviceId` (*string*) : Identifiant du périphérique.
- **renvoie** : boolean true si modifié.

#### `ui_multiseat_multiseatVehicles.replacePlayerVehicle(player, model, config, additionalData)`

Remplace en direct le véhicule d'un joueur multiseat actif (met à jour la persona, remplace ou fait apparaître le véhicule, assigne le joueur et réinitialise la caméra). Restaure l'ancienne persona en cas d'échec.

- `player` (*integer*) : Indice de joueur.
- `model` (*string*) : Modèle.
- `config` (*string*) : Configuration.
- `additionalData` (*table|nil*) : Données du sélecteur ; paint, paint2, paint3 donnent les peintures choisies.
- **renvoie** : table {success = true} ou {success = false, reason}.

#### `ui_multiseat_multiseatVehicles.reseatAllPlayers()`

Remet chaque joueur dans son véhicule possédé s'il n'y est plus.

- **renvoie** : boolean true si au moins un joueur a été replacé.

#### `ui_multiseat_multiseatVehicles.setCustomSplitPlayers(players)`

Définit la liste de joueurs affichés en écran partagé (copie) et la transmet à render_splitScreen.setCustomPlayers.

- `players` (*integer[]*) : Indices de joueurs.

#### `ui_multiseat_multiseatVehicles.setDevicePlayer(deviceId, personaNumber)`

Délègue à multiseatConfiguration.setDevicePlayer puis resynchronise l'état préparé.

- `deviceId` (*string*) : Identifiant du périphérique.
- `personaNumber` (*integer|nil*) : Numéro de persona, nil ou 0 pour désassigner.
- **renvoie** : boolean true si modifié.

#### `ui_multiseat_multiseatVehicles.setFrozen(spawned, frozen)`

Gèle ou dégèle des véhicules via core_vehicleBridge (action setFreeze).

- `spawned` (*table[]|nil*) : Entrées de véhicules ; tous les véhicules possédés si nil.
- `frozen` (*boolean*) : true pour geler.

#### `ui_multiseat_multiseatVehicles.setPlayerVehicleSelection(player, vehicle)`

Enregistre {model, config} comme véhicule de la persona d'un joueur (sans faire apparaître de véhicule).

- `player` (*integer*) : Indice de joueur.
- `vehicle` (*table*) : {model, config}.
- **renvoie** : boolean true si la persona a été mise à jour.

#### `ui_multiseat_multiseatVehicles.spawnAll(spawnPlan)`

Supprime tous les véhicules possédés puis fait apparaître le véhicule de chaque joueur du plan à sa position (place de parking ou pos/rot), assigne le joueur et suit le véhicule.

- `spawnPlan` (*table[]*) : Liste de {player, parkingSpot} ou {player, pos, rot}.
- **renvoie** : table[] Entrées de véhicules créées.

#### `ui_multiseat_multiseatVehicles.stageAutomaticColorForAllPlayers(automaticColor)`

Prépare le mode couleur automatique pour tous les joueurs et recalcule la peinture de leur véhicule préparé.

- `automaticColor` (*boolean*) : true pour la couleur automatique.
- **renvoie** : boolean true si au moins un véhicule a changé.

#### `ui_multiseat_multiseatVehicles.stagePlayerIcon(player, icon)`

Prépare l'icône d'un joueur ; refusée si ce n'est pas une icône de persona, si elle est inchangée ou déjà prise par un autre joueur.

- `player` (*integer*) : Indice de joueur.
- `icon` (*string*) : Identifiant d'icône.
- **renvoie** : boolean true si modifiée.

#### `ui_multiseat_multiseatVehicles.stagePlayerOptIn(player, optedIn)`

Prépare la sortie d'un joueur (seul optedIn = false est accepté ; true renvoie false).

- `player` (*integer*) : Indice de joueur.
- `optedIn` (*boolean*) : Doit être false.
- **renvoie** : boolean true si le joueur a été retiré.

#### `ui_multiseat_multiseatVehicles.stagePlayerVehiclePreferences(player, preferences)`

Prépare les préférences de conduite d'un joueur après validation (gearbox arcade/realistic, ignitionLevel entier 0 à 3, characterFace valide).

- `player` (*integer*) : Indice de joueur.
- `preferences` (*table*) : {gearbox, clutchAssist, throttleAssist, ignitionLevel, characterFace}.
- **renvoie** : boolean false si le joueur est absent ou si une valeur est invalide.

#### `ui_multiseat_multiseatVehicles.stageSameVehicleForAllPlayers(source)`

Prépare le même véhicule pour tous les joueurs, à partir de « recent:modèle/config » ou de l'indice d'un joueur dont on copie le véhicule.

- `source` (*string|integer*) : Source du véhicule.
- **renvoie** : boolean true si au moins un véhicule a changé.

#### `ui_multiseat_multiseatVehicles.toggleDevicePlayer(deviceId)`

Délègue à multiseatConfiguration.toggleDevicePlayer puis resynchronise l'état préparé.

- `deviceId` (*string*) : Identifiant du périphérique.
- **renvoie** : boolean true si modifié.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : core_locales, core_playerPersonas, core_vehicle_configTarget, ui_gridSelectorRouteLifecycleCallbacks, ui_vehicleSelector_general. |

**Évènements UI (guihooks.trigger) :** `app:waiting`

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `be:` `enterVehicle`, `exitVehicle`, `getPlayerVehicleID`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/multiseat/multiseatVehicles.lua`.*
