# `ui_multiseat_multiseatSettings`

*Fichier : `lua/ge/extensions/ui/multiseat/multiseatSettings.lua` · VM : Game Engine (GE) · 676 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_multiseat_multiseatSettings` : `extensions.load("ui_multiseat_multiseatSettings")`, puis la globale `ui_multiseat_multiseatSettings`

Logique de l'écran de réglages multi-sièges (routes « pause.multiseatSettings » et « pause.multiseatSettings.vehicleSelector »). Il collecte les fournisseurs de réglages des autres extensions (hook onGetMultiseatGameSettings), garde des valeurs actives et des valeurs préparées (staged), construit les données de l'écran pour l'interface Vue, applique ou abandonne les changements et gère la confirmation de sortie. Les actions sur les joueurs/périphériques sont déléguées à ui_multiseat_multiseatVehicles. Un moddeur ajoute des réglages en répondant au hook onGetMultiseatGameSettings.

## Exemple

```lua
-- fournisseur de réglages dans une extension
function M.onGetMultiseatGameSettings(providers)
  providers[#providers + 1] = {id = 'monMod', title = 'Mon mod', applyMode = 'apply', fields = {
    {id = 'actif', type = 'switch', label = 'Actif', value = true}
  }}
end
```

## Remarques

- Un fournisseur valide est une table {id = string, fields = table, title, placement, applyMode}. placement = "afterVehicles" place la section après la liste des véhicules.
- Types de champ : « action » et « actionSelect » ne stockent pas de valeur (exécutés tout de suite par onMultiseatGameSettingAction) ; les autres (switch, select, layout…) sont stockés et préparés.
- applyMode (par champ ou par fournisseur) vaut « restart » par défaut ; « apply » ou « immediate » sinon. « immediate » met aussi à jour la valeur active dès le changement.
- Si un champ a une liste options, la valeur doit y figurer (comparaison numérique tolérante) ; sinon refus (raison « invalid_setting »), sauf valeur « » avec allowEmpty = true.
- Hooks émis : onGetMultiseatGameSettings(providers), onGetMultiseatSettingsScreenData(screen), onMultiseatGameSettingChanged(providerId, fieldId, value), onMultiseatGameSettingAction(providerId, fieldId, result[, value]), onValidateMultiseatGameSettings(staged, active, result, context), onApplyMultiseatGameSettings(staged, active, result, context), onMultiseatSettingsApplied(changeSet, result), onMultiseatSettingsClosed(toRoute), onPlayMultiseatGameSettings(result).
- Un hook peut mettre result.success = false (et result.reason) pour refuser ; result.valueOverrides[providerId][fieldId] remplace des valeurs préparées après application ; result.deferred = true évite la notification d'écran.
- Pendant que l'écran est ouvert, le jeu est mis en pause via simTimeAuthority.pushPauseRequest("multiseat_settings") ; la pause est relâchée à la fermeture.
- Événements UI émis : MultiseatSettingsChanged (l'écran doit se recharger) et showConfirmationDialog (boutons avec luaCallback).

**Dépendances (chargées avant) :** `ui_multiseat_generalSettings`, `ui_multiseat_multiseatConfiguration`, `ui_multiseat_multiseatVehicles`, `ui_gridSelectorRouteLifecycleCallbacks`, `ui_pause_routeLifecycleCallbacks`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_multiseat_multiseatSettings.applyStagedSettings(options)` | Applique les changements préparés : valide (hook onValidateMultiseatGameSettings), prépare les véhicules, applique la configuration des joueurs (commitCore), finalise les véhicules, appelle onApplyMultiseatGameSettings puis onMultiseatSettingsApplied. En cas d'échec la configuration est restaurée (rollbackCommit). | 319 |
| `ui_multiseat_multiseatSettings.cancelExit()` | Annule la navigation de sortie en attente. | 516 |
| `ui_multiseat_multiseatSettings.confirmExit(route, params, context)` | Garde de sortie de route : s'il y a des changements non appliqués, mémorise la navigation visée et affiche une boîte (annuler, abandonner, appliquer) puis renvoie false pour bloquer la sortie. Renvoie true si la sortie est autorisée. | 470 |
| `ui_multiseat_multiseatSettings.confirmExitApplying()` | Applique les réglages préparés puis reprend la navigation en attente ; en cas d'échec, annule la navigation et renvoie le résultat. | 525 |
| `ui_multiseat_multiseatSettings.confirmExitDiscarding()` | Reprend la navigation en attente sans appliquer ; les valeurs préparées sont perdues à la fermeture (closeSettings). | 521 |
| `ui_multiseat_multiseatSettings.confirmMultiseatExit()` | Quitte le multiseat : met en cache les affectations s'il n'y a plus de joueurs préparés, applique les changements en attente s'il ne reste qu'un joueur, appelle ui_multiseat_freeroam.exitMultiseat puis ferme le menu. | 432 |
| `ui_multiseat_multiseatSettings.cycleDevicePlayer(deviceId)` | Fait passer un périphérique au joueur suivant (délégué à multiseatVehicles). | 543 |
| `ui_multiseat_multiseatSettings.discardStagedSettings()` | Abandonne les valeurs préparées (retour aux valeurs actives), vide le cache d'affectations si le multiseat n'est pas actif, abandonne la configuration et les changements de véhicules. | 399 |
| `ui_multiseat_multiseatSettings.getScreenData()` | Construit les données de l'écran : composants « personas », « settings » (un par fournisseur), « vehicles », titre, indicateurs active, dirty, discardDirty, applyMode (« none », « apply » ou « restart »), readyToPlay et busy. Ouvre la transaction multiseatConfiguration si besoin. Renvoie nil si l'écran n'est pas ouvert. | 213 |
| `ui_multiseat_multiseatSettings.joinDeviceGroup(groupId)` | Fait rejoindre un groupe de périphériques géré par la plateforme. | 583 |
| `ui_multiseat_multiseatSettings.leaveDeviceGroup(player)` | Retire un joueur (et son groupe). | 591 |
| `ui_multiseat_multiseatSettings.moveDevicePlayer(deviceId, direction)` | Déplace un périphérique vers le joueur précédent ou suivant. | 559 |
| `ui_multiseat_multiseatSettings.notifyScreenChanged()` | Envoie l'événement UI MultiseatSettingsChanged pour que l'écran se recharge. | 625 |
| `ui_multiseat_multiseatSettings.onClientEndMission()` | Hook appelé à la fin du niveau ; réinitialise tout l'état (valeurs, pause, sorties en attente). *(interne)* *(hook)* | 661 |
| `ui_multiseat_multiseatSettings.onExtensionUnloaded()` | Hook appelé au déchargement de l'extension ; relâche la demande de pause. *(interne)* *(hook)* | 671 |
| `ui_multiseat_multiseatSettings.onLocalParticipantsChanged()` | Hook appelé quand les participants locaux changent ; notifie l'écran sauf pendant une synchronisation des véhicules. *(interne)* *(hook)* | 629 |
| `ui_multiseat_multiseatSettings.onSettingsEnter()` | Callback d'entrée de la route de réglages : marque l'écran ouvert et met le jeu en pause. *(interne)* *(hook)* | 634 |
| `ui_multiseat_multiseatSettings.onSettingsLeave(context, toRoute, fromRoute, data)` | Callback de sortie de la route de réglages : appelle ui_pause_routeLifecycleCallbacks.onPauseLeave puis ferme les réglages si la route visée n'en fait plus partie. *(interne)* *(hook)* | 639 |
| `ui_multiseat_multiseatSettings.onVehicleSelectorEnter(context, toRoute, fromRoute, data)` | Callback d'entrée de la route du sélecteur de véhicule : marque l'écran ouvert, pause le jeu et délègue à ui_gridSelectorRouteLifecycleCallbacks.onRouteEnter. *(interne)* *(hook)* | 644 |
| `ui_multiseat_multiseatSettings.onVehicleSelectorLeave(context, toRoute, fromRoute, data)` | Callback de sortie de la route du sélecteur : délègue à gridSelector et pause, prévient multiseatVehicles puis ferme les réglages si la route visée n'en fait plus partie. *(interne)* *(hook)* | 654 |
| `ui_multiseat_multiseatSettings.onVehicleSelectorMount(context, toRoute, fromRoute, data)` | Callback de montage de la route du sélecteur ; délègue à ui_gridSelectorRouteLifecycleCallbacks.onRouteMount. *(interne)* *(hook)* | 650 |
| `ui_multiseat_multiseatSettings.openVehicleSelectorForPlayer(player)` | Ouvre le sélecteur de véhicule pour un joueur (délégué à multiseatVehicles). | 599 |
| `ui_multiseat_multiseatSettings.play()` | Émet le hook onPlayMultiseatGameSettings ; un mode de jeu peut y démarrer la partie en mettant result.success = true. | 619 |
| `ui_multiseat_multiseatSettings.removeDevice(deviceId)` | Oublie un périphérique déconnecté. | 575 |
| `ui_multiseat_multiseatSettings.requestMultiseatExit()` | Affiche une boîte de confirmation pour quitter le multiseat (bouton de confirmation : confirmMultiseatExit). Ne fait rien si le multiseat n'est pas actif. | 410 |
| `ui_multiseat_multiseatSettings.runSettingAction(providerId, fieldId, value)` | Exécute un champ de type « action » ou « actionSelect » via le hook onMultiseatGameSettingAction. Recharge l'écran si l'action a réussi. | 298 |
| `ui_multiseat_multiseatSettings.setDevicePlayer(deviceId, personaNumber)` | Assigne un périphérique à une persona donnée. | 567 |
| `ui_multiseat_multiseatSettings.stagePlayerIcon(player, icon)` | Prépare l'icône d'un joueur. | 611 |
| `ui_multiseat_multiseatSettings.stagePlayerOptIn(player, optedIn)` | Prépare l'inscription ou la sortie d'un joueur (via ui_multiseat_multiseatVehicles.stagePlayerOptIn). | 535 |
| `ui_multiseat_multiseatSettings.stagePlayerVehiclePreferences(player, preferences)` | Prépare les préférences de véhicule d'un joueur. | 603 |
| `ui_multiseat_multiseatSettings.stageSetting(providerId, fieldId, value)` | Prépare la valeur d'un champ (normalisée selon ses options) et émet onMultiseatGameSettingChanged. Valeur ou champ invalide : l'écran est simplement renvoyé inchangé. | 275 |
| `ui_multiseat_multiseatSettings.toggleDevicePlayer(deviceId)` | Assigne/désassigne un périphérique (délégué à multiseatVehicles). | 551 |

### Détail des paramètres

#### `ui_multiseat_multiseatSettings.applyStagedSettings(options)`

Applique les changements préparés : valide (hook onValidateMultiseatGameSettings), prépare les véhicules, applique la configuration des joueurs (commitCore), finalise les véhicules, appelle onApplyMultiseatGameSettings puis onMultiseatSettingsApplied. En cas d'échec la configuration est restaurée (rollbackCommit).

- `options` (*table|nil*) : exitAfterApply = true transmet l'indicateur aux hooks (result.exitAfterApply).
- **renvoie** : table {success, reason?, requiresRestart?, exitAfterApply?, ...} ; {success = true} s'il n'y a aucun changement.

#### `ui_multiseat_multiseatSettings.confirmExit(route, params, context)`

Garde de sortie de route : s'il y a des changements non appliqués, mémorise la navigation visée et affiche une boîte (annuler, abandonner, appliquer) puis renvoie false pour bloquer la sortie. Renvoie true si la sortie est autorisée.

- `route` (*table*) : Route visée (champ name).
- `params` (*table|nil*) : Paramètres de navigation.
- `context` (*table|nil*) : Contexte (routeName, options).
- **renvoie** : boolean true pour autoriser la sortie.

#### `ui_multiseat_multiseatSettings.confirmExitApplying()`

Applique les réglages préparés puis reprend la navigation en attente ; en cas d'échec, annule la navigation et renvoie le résultat.

- **renvoie** : table|any Résultat d'échec, sinon résultat de la navigation.

#### `ui_multiseat_multiseatSettings.confirmExitDiscarding()`

Reprend la navigation en attente sans appliquer ; les valeurs préparées sont perdues à la fermeture (closeSettings).

- **renvoie** : any Résultat de ui_router.navigate, ou false.

#### `ui_multiseat_multiseatSettings.confirmMultiseatExit()`

Quitte le multiseat : met en cache les affectations s'il n'y a plus de joueurs préparés, applique les changements en attente s'il ne reste qu'un joueur, appelle ui_multiseat_freeroam.exitMultiseat puis ferme le menu.

- **renvoie** : boolean true si la sortie et la fermeture du menu ont réussi.

#### `ui_multiseat_multiseatSettings.cycleDevicePlayer(deviceId)`

Fait passer un périphérique au joueur suivant (délégué à multiseatVehicles).

- `deviceId` (*string*) : Identifiant du périphérique.
- **renvoie** : table {success, data}.

#### `ui_multiseat_multiseatSettings.discardStagedSettings()`

Abandonne les valeurs préparées (retour aux valeurs actives), vide le cache d'affectations si le multiseat n'est pas actif, abandonne la configuration et les changements de véhicules.

- **renvoie** : table|nil Données d'écran à jour.

#### `ui_multiseat_multiseatSettings.getScreenData()`

Construit les données de l'écran : composants « personas », « settings » (un par fournisseur), « vehicles », titre, indicateurs active, dirty, discardDirty, applyMode (« none », « apply » ou « restart »), readyToPlay et busy. Ouvre la transaction multiseatConfiguration si besoin. Renvoie nil si l'écran n'est pas ouvert.

- **renvoie** : table|nil Données d'écran.

#### `ui_multiseat_multiseatSettings.joinDeviceGroup(groupId)`

Fait rejoindre un groupe de périphériques géré par la plateforme.

- `groupId` (*integer*) : Identifiant de groupe.
- **renvoie** : table {success, data}.

#### `ui_multiseat_multiseatSettings.leaveDeviceGroup(player)`

Retire un joueur (et son groupe).

- `player` (*integer*) : Indice de joueur.
- **renvoie** : table {success, data}.

#### `ui_multiseat_multiseatSettings.moveDevicePlayer(deviceId, direction)`

Déplace un périphérique vers le joueur précédent ou suivant.

- `deviceId` (*string*) : Identifiant du périphérique.
- `direction` (*integer*) : -1 ou 1.
- **renvoie** : table {success, data}.

#### `ui_multiseat_multiseatSettings.onSettingsLeave(context, toRoute, fromRoute, data)`

Callback de sortie de la route de réglages : appelle ui_pause_routeLifecycleCallbacks.onPauseLeave puis ferme les réglages si la route visée n'en fait plus partie.

- `context` (*table*) : Contexte de route.
- `toRoute` (*table*) : Route d'arrivée.
- `fromRoute` (*table*) : Route de départ.
- `data` (*any*) : Données de navigation.

#### `ui_multiseat_multiseatSettings.onVehicleSelectorEnter(context, toRoute, fromRoute, data)`

Callback d'entrée de la route du sélecteur de véhicule : marque l'écran ouvert, pause le jeu et délègue à ui_gridSelectorRouteLifecycleCallbacks.onRouteEnter.

- `context` (*table*) : Contexte de route.
- `toRoute` (*table*) : Route d'arrivée.
- `fromRoute` (*table*) : Route de départ.
- `data` (*any*) : Données de navigation.

#### `ui_multiseat_multiseatSettings.onVehicleSelectorLeave(context, toRoute, fromRoute, data)`

Callback de sortie de la route du sélecteur : délègue à gridSelector et pause, prévient multiseatVehicles puis ferme les réglages si la route visée n'en fait plus partie.

- `context` (*table*) : Contexte de route.
- `toRoute` (*table*) : Route d'arrivée.
- `fromRoute` (*table*) : Route de départ.
- `data` (*any*) : Données de navigation.

#### `ui_multiseat_multiseatSettings.onVehicleSelectorMount(context, toRoute, fromRoute, data)`

Callback de montage de la route du sélecteur ; délègue à ui_gridSelectorRouteLifecycleCallbacks.onRouteMount.

- `context` (*table*) : Contexte de route.
- `toRoute` (*table*) : Route d'arrivée.
- `fromRoute` (*table*) : Route de départ.
- `data` (*any*) : Données de navigation.

#### `ui_multiseat_multiseatSettings.openVehicleSelectorForPlayer(player)`

Ouvre le sélecteur de véhicule pour un joueur (délégué à multiseatVehicles).

- `player` (*integer*) : Indice de joueur.
- **renvoie** : any Résultat de multiseatVehicles.openVehicleSelectorForPlayer.

#### `ui_multiseat_multiseatSettings.play()`

Émet le hook onPlayMultiseatGameSettings ; un mode de jeu peut y démarrer la partie en mettant result.success = true.

- **renvoie** : table {success = boolean}.

#### `ui_multiseat_multiseatSettings.removeDevice(deviceId)`

Oublie un périphérique déconnecté.

- `deviceId` (*string*) : Identifiant du périphérique.
- **renvoie** : table {success, data}.

#### `ui_multiseat_multiseatSettings.requestMultiseatExit()`

Affiche une boîte de confirmation pour quitter le multiseat (bouton de confirmation : confirmMultiseatExit). Ne fait rien si le multiseat n'est pas actif.

- **renvoie** : boolean false si le multiseat n'est pas actif.

#### `ui_multiseat_multiseatSettings.runSettingAction(providerId, fieldId, value)`

Exécute un champ de type « action » ou « actionSelect » via le hook onMultiseatGameSettingAction. Recharge l'écran si l'action a réussi.

- `providerId` (*string*) : Identifiant du fournisseur.
- `fieldId` (*string*) : Identifiant du champ.
- `value` (*any*) : Option choisie (actionSelect uniquement).
- **renvoie** : table {success = boolean, data = données d'écran}.

#### `ui_multiseat_multiseatSettings.setDevicePlayer(deviceId, personaNumber)`

Assigne un périphérique à une persona donnée.

- `deviceId` (*string*) : Identifiant du périphérique.
- `personaNumber` (*integer|nil*) : Numéro de persona, nil ou 0 pour désassigner.
- **renvoie** : table {success, data}.

#### `ui_multiseat_multiseatSettings.stagePlayerIcon(player, icon)`

Prépare l'icône d'un joueur.

- `player` (*integer*) : Indice de joueur.
- `icon` (*string*) : Identifiant d'icône (déduit du code).
- **renvoie** : table {success, data}.

#### `ui_multiseat_multiseatSettings.stagePlayerOptIn(player, optedIn)`

Prépare l'inscription ou la sortie d'un joueur (via ui_multiseat_multiseatVehicles.stagePlayerOptIn).

- `player` (*integer*) : Indice de joueur.
- `optedIn` (*boolean*) : true pour inscrire.
- **renvoie** : table {success, data}.

#### `ui_multiseat_multiseatSettings.stagePlayerVehiclePreferences(player, preferences)`

Prépare les préférences de véhicule d'un joueur.

- `player` (*integer*) : Indice de joueur.
- `preferences` (*table*) : Préférences (déduit du code).
- **renvoie** : table {success, data}.

#### `ui_multiseat_multiseatSettings.stageSetting(providerId, fieldId, value)`

Prépare la valeur d'un champ (normalisée selon ses options) et émet onMultiseatGameSettingChanged. Valeur ou champ invalide : l'écran est simplement renvoyé inchangé.

- `providerId` (*string*) : Identifiant du fournisseur.
- `fieldId` (*string*) : Identifiant du champ.
- `value` (*any*) : Nouvelle valeur.
- **renvoie** : table|nil Données d'écran à jour.

#### `ui_multiseat_multiseatSettings.toggleDevicePlayer(deviceId)`

Assigne/désassigne un périphérique (délégué à multiseatVehicles).

- `deviceId` (*string*) : Identifiant du périphérique.
- **renvoie** : table {success, data}.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : ui_multiseat_generalSettings, ui_multiseat_multiseatConfiguration, ui_multiseat_multiseatVehicles, ui_gridSelectorRouteLifecycleCallbacks, ui_pause_routeLifecycleCallbacks. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onApplyMultiseatGameSettings` — écouté par 1 module(s)
- `onGetMultiseatGameSettings` — écouté par 1 module(s)
- `onGetMultiseatSettingsScreenData`
- `onMultiseatGameSettingAction` — écouté par 1 module(s)
- `onMultiseatGameSettingChanged` — écouté par 1 module(s)
- `onMultiseatSettingsApplied` — écouté par 2 module(s)
- `onMultiseatSettingsClosed` — écouté par 1 module(s)
- `onPlayMultiseatGameSettings`
- `onValidateMultiseatGameSettings` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `MultiseatSettingsChanged`, `showConfirmationDialog`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/multiseat/multiseatSettings.lua`.*
