# `core_input_bindings`

*Fichier : `lua/ge/extensions/core/input/bindings.lua` · VM : Game Engine (GE) · 1509 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_input_bindings` : `extensions.load("core_input_bindings")`, puis la globale `core_input_bindings`

Extension GE `core_input_bindings` : charge, fusionne, sauvegarde et envoie au moteur les associations touches/axes -> actions (bindings) de tous les périphériques branchés, pour chaque joueur. Il lit les inputmaps par défaut (JSON du jeu et des véhicules) puis les différences utilisateur (*.diff dans settings/inputmaps), applique les courbes de réponse FFB, notifie l'UI, le moteur, les véhicules (config force feedback) et les autres extensions. Il gère aussi l'activation des ActionMap de menu selon les écrans ouverts. Un moddeur s'en sert surtout pour connaître la touche d'une action, réinitialiser les contrôles ou activer/désactiver des actions de menu.

## Exemple

```lua
local ctrl = core_input_bindings.getControlForAction('accelerate')   -- ex. 'axis1'
local others = core_input_bindings.getActionsSharingControls('toggleMenues')
core_input_bindings.setMenuActionsEnabled({menu_item_up = false, menu_item_down = false})
```

## Remarques

- Structure de M.bindings : liste de {devname, contents = {bindings = {...}, guid, vidpid, name, devicetype, …}} triée par nom de périphérique (wheel0 avant xinput0). Chaque binding : action (nom unique, préfixé par le véhicule si spécifique), control, player, unused (booléen), plus les champs normalisés (deadzoneResting, deadzoneEnd, linearity, angle, lockType, filterType, isInverted, isForceEnabled, ffb{…}).
- Valeurs par défaut des champs de binding (fillNormalizeBindingDefaults) : deadzoneResting 0, deadzoneEnd 0, linearity 1, filterType -1, angle 0, lockType 3, ffb.forceCoef 100, ffb.smoothing 150, ffb.softlockForce 0.5 (borné 0..1), ffb.responseCurve {{0,0},{1,1}}, logitechVibrotactileFreqMax borné 20..150 (défaut 50).
- Fichiers : bindings par défaut = JSON dans settings/inputmaps (jeu), vehicles/<véhicule>/ et vehicles/<véhicule>/inputmaps ; réglages utilisateur = fichiers .diff écrits sous settings/inputmaps[/<véhicule>] (nom '<devicetype>.diff' pour clavier/souris, sinon '<vidpid minuscule>.diff'). Un diff contient 'bindings' (ajoutés/modifiés) et 'removed' ; version 1 autorise les doublons de contrôle.
- Les changements de fichiers (inputmaps, actions) déclenchent un rechargement différé de 0,1 s (forceRefresh) traité dans updateGFX.
- Joueurs : assignedPlayers associe un nom de périphérique à un indice de joueur (-1 = aucun). Avec autoAssignPlayersToDevices (true par défaut) l'association est recalculée par core_multiseat.
- Menus : les ActionMap de menu sont 'MenuActionMap' plus des 'MenuIndependent_<action>ActionMap' ; elles s'activent quand une route UI non gameplay (hors play, multiseat, trackBuilder) ou un popup est ouvert.
- Hooks émis : onInputBindingsChanged(assignedPlayers), onFFBConfigChanged, onMenuActionMapEnabled(enabled). Évènements UI : InputBindingsChanged, AssignedPlayersChanged, MenuActionMapEnabled, MenuActionMapStateChanged(action, enabled), RecentDevicesChanged, ControllersChanged.
- Incohérences : menuActive est déprécié (loggue une erreur avec la pile d'appel puis appelle setMenuActionMapEnabled) ; les messages d'erreur de setMenuActionEnabled formatent un booléen/nil avec %q ce qui peut lever une erreur au lieu de s'afficher ; migrateScePadDiffFiles fait ipairs sur le contenu de settings/scePadGuids.json sans test de nil ; onVehicleSpawned recalcule les bindings mais n'appelle pas notifyAll ; la fenêtre ImGui de debug des ActionMap est entièrement commentée dans le fichier.
- Champ exporté mais non initialisé comme attendu : isMenuActive part à false et n'est modifié que par setMenuActionMapEnabled.

**Dépendances (chargées avant) :** `core_input_actions`, `core_input_categories`, `core_multiseat`, `license`, `core_versionUpdate`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_input_bindings.applyPlayerAssignments(assignments, reason)` | Applique en une fois une table d'assignations (périphérique -> joueur ; absent = -1). | 959 |
| `core_input_bindings.enableCustomModifier(player, enabled, modifier)` | Active ou désactive un modificateur personnalisé de l'ActionMap pour un joueur (ActionMap.enableCustomModifier). | 1368 |
| `core_input_bindings.getActionsSharingControls(actionName)` | Autres actions utilisées (non 'unused') sur les mêmes contrôles que actionName, sur le même périphérique. | 684 |
| `core_input_bindings.getAssignedPlayers()` | Renvoie M.assignedPlayers. | 1293 |
| `core_input_bindings.getControlForAction(actionName)` | Renvoie le premier contrôle (touche/axe) trouvé pour une action, tous périphériques confondus. Le résultat est mis en cache jusqu'au prochain notifyGE. | 669 |
| `core_input_bindings.getFFBConfigForAction(veh, action)` | Lit la configuration force feedback d'une action (steering, accelerate, brake) pour le conducteur d'un véhicule : décode le JSON renvoyé par be:getFFBConfig puis ffbParamsJson dans ffbConfig.ffbParams. | 764 |
| `core_input_bindings.getMenuActionMapEnabled()` | Renvoie isMenuActive. | 1231 |
| `core_input_bindings.getMenuActionMapWatchEnabled()` | Indique si la surveillance est active. | 1125 |
| `core_input_bindings.getMenuActionStates()` | État actuel (activé ou non) de chaque action de menu indépendante. | 1108 |
| `core_input_bindings.getMenuScrollActionMapEnabled()` | État de la MenuScrollActionMap. | 1141 |
| `core_input_bindings.getRecentDevices()` | Liste des périphériques triés par activité récente (mise en cache, getDevicesByRecentActivity). | 1459 |
| `core_input_bindings.getUsedBindingsFiles()` | Recharge les bindings en enregistrant les chemins de fichiers lus (utile pour lister les inputmaps utilisés). | 1362 |
| `core_input_bindings.isModalPopupOpen()` | Indique si un popup modal est ouvert (état d'UI '/popup/...' hors '/popup/activity/'). | 1288 |
| `core_input_bindings.menuActive(enabled)` | Déprécié : loggue une erreur avec la pile d'appel et appelle setMenuActionMapEnabled(enabled). | 1347 |
| `core_input_bindings.notifyUI(reason)` | Envoie à l'UI les contrôleurs, les joueurs assignés et un paquet InputBindingsChanged (catégories, actions du véhicule courant, template de binding, bindings, defaultBindings, reason). | 702 |
| `core_input_bindings.onAfterRouteChange(context)` | Hook de changement de route UI : mémorise le nom de la route et met à jour l'état de l'ActionMap de menu. *(interne)* *(hook)* | 1262 |
| `core_input_bindings.onDeviceChanged()` | Hook quand un périphérique est branché/débranché : met à jour la liste (avec toasts UI), les assignations et notifie tout. *(interne)* *(hook)* | 1325 |
| `core_input_bindings.onExtensionLoaded()` | Hook au chargement : exécute les migrations (popup de disposition v37 ; conversion des diffs manette PlayStation avant 0.38). *(interne)* *(hook)* | 1455 |
| `core_input_bindings.onFileChanged(filename, t)` | Hook de changement de fichier : si un fichier d'actions ou d'inputmap (settings/inputmaps, vehicles/.../inputmaps, *.inputmap.json) change, programme un rechargement dans 0,1 s. *(interne)* *(hook)* | 1316 |
| `core_input_bindings.onFirstUpdate()` | Hook au premier update : liste les périphériques, assigne les joueurs, calcule tous les bindings et notifie. *(interne)* *(hook)* | 1353 |
| `core_input_bindings.onPlayerVehiclePresenceChanged(player)` | Hook quand un joueur entre ou quitte un véhicule : renvoie la config force feedback aux véhicules. *(interne)* *(hook)* | 828 |
| `core_input_bindings.onRecentDevicesChanged(_recentDevices)` | Hook appelé quand l'ordre d'activité des périphériques change : met en cache et envoie RecentDevicesChanged à l'UI. *(interne)* *(hook)* | 1464 |
| `core_input_bindings.onSettingsChanged()` | Hook de changement de réglages : si le réglage 'multiseat' a changé, recalcule assignations et bindings. *(interne)* *(hook)* | 1335 |
| `core_input_bindings.onUIInitialised()` | Hook à l'initialisation de l'UI : remet l'état de popup modal à faux. *(interne)* *(hook)* | 1284 |
| `core_input_bindings.onUIStateTriggered(stateName, opened, stateStack)` | Hook de changement d'état d'UI : détecte les popups ouverts ('/popup/...') et met à jour l'ActionMap de menu. *(interne)* *(hook)* | 1269 |
| `core_input_bindings.onVehicleSpawned(vehId, veh)` | Hook à la création d'un véhicule : recalcule assignations et bindings sans notification. *(interne)* *(hook)* | 1016 |
| `core_input_bindings.onVehicleSwitched(oldId, newId, player)` | Hook au changement de véhicule d'un joueur : recalcule assignations et bindings (les actions spécifiques changent) et notifie tout. *(interne)* *(hook)* | 996 |
| `core_input_bindings.refreshAssignedPlayers(logEnabled, seatPlayers)` | Recalcule l'assignation automatique via core_multiseat (si autoAssign) et notifie seulement si elle a changé. | 973 |
| `core_input_bindings.resetBindings(desiredDevName)` | Supprime les bindings personnalisés (inputmaps/diff utilisateur) d'un périphérique ou de tous, génériques et du véhicule joueur, et recharge. | 926 |
| `core_input_bindings.saveBindingsToDisk(data)` | Sauvegarde les bindings envoyés par l'UI : les sépare par véhicule/génériques, compare à la version par défaut et écrit un fichier .diff par périphérique et véhicule, puis force un rechargement. | 894 |
| `core_input_bindings.setMenuActionEnabled(enabled, actionName, actionMapName)` | Active ou désactive une ActionMap de menu : soit par nom d'action ('menu_item_up' -> MenuIndependent_menu_item_upActionMap), soit directement par nom d'ActionMap. Refuse (log d'erreur) les ActionMap non liées aux menus ou inconnues. | 1147 |
| `core_input_bindings.setMenuActionMapEnabled(enabled)` | Active ou désactive l'ActionMap de menu principale (et, à la désactivation, toutes les ActionMap de menu indépendantes), met à jour isMenuActive et notifie l'UI/extensions. | 1204 |
| `core_input_bindings.setMenuActionMapWatchEnabled(enabled)` | Active/désactive la notification UI MenuActionMapStateChanged à chaque modification d'une ActionMap de menu. | 1120 |
| `core_input_bindings.setMenuActionsEnabled(actionStates)` | Applique en lot un état pour plusieurs actions de menu : {menu_item_up = true, menu_item_down = false}. Ignore les valeurs non booléennes. | 1183 |
| `core_input_bindings.setMenuScrollActionMapEnabled(enabled)` | Pousse (push) ou retire (pop) la 'MenuScrollActionMap' sur la pile des ActionMap. | 1131 |
| `core_input_bindings.setPlayerToDevice(devname, player)` | Assigne un joueur à un périphérique (assignPlayerToDevice), recalcule les bindings et notifie tout le monde. | 952 |
| `core_input_bindings.updateGFX(dtRaw)` | Hook par image : exécute le rechargement différé des bindings ; désactive la 'VehicleSpecificActionMap' quand le joueur marche (unicycle en caméra monde) hors split-screen. *(interne)* | 1298 |

### Détail des paramètres

#### `core_input_bindings.applyPlayerAssignments(assignments, reason)`

Applique en une fois une table d'assignations (périphérique -> joueur ; absent = -1).

- `assignments` (*table<string, integer>*) : Assignations.
- `reason` (*string|nil*) : Texte pour les notifications.
- **renvoie** : boolean false si assignments n'est pas une table.

#### `core_input_bindings.enableCustomModifier(player, enabled, modifier)`

Active ou désactive un modificateur personnalisé de l'ActionMap pour un joueur (ActionMap.enableCustomModifier).

- `player` (*integer*) : Indice du joueur.
- `enabled` (*boolean*) : Activer.
- `modifier` (*any*) : Modificateur (valeur du moteur).

#### `core_input_bindings.getActionsSharingControls(actionName)`

Autres actions utilisées (non 'unused') sur les mêmes contrôles que actionName, sur le même périphérique.

- `actionName` (*string*) : Nom unique de l'action.
- **renvoie** : string[] Noms d'actions triés.

#### `core_input_bindings.getAssignedPlayers()`

Renvoie M.assignedPlayers.

- **renvoie** : table<string, integer> Périphérique -> joueur.

#### `core_input_bindings.getControlForAction(actionName)`

Renvoie le premier contrôle (touche/axe) trouvé pour une action, tous périphériques confondus. Le résultat est mis en cache jusqu'au prochain notifyGE.

- `actionName` (*string*) : Nom unique de l'action.
- **renvoie** : string|nil Nom du contrôle (ex. 'keyboard0' contrôle, 'axis1').

#### `core_input_bindings.getFFBConfigForAction(veh, action)`

Lit la configuration force feedback d'une action (steering, accelerate, brake) pour le conducteur d'un véhicule : décode le JSON renvoyé par be:getFFBConfig puis ffbParamsJson dans ffbConfig.ffbParams.

- `veh` (*userdata*) : Objet véhicule.
- `action` (*string*) : Nom de l'action.
- **renvoie** : table|nil Config FFB, nil s'il n'y a pas de conducteur ni de contrôleur FFB ou en cas d'erreur de décodage.
- **renvoie** : integer FFBID.

#### `core_input_bindings.getMenuActionMapEnabled()`

Renvoie isMenuActive.

- **renvoie** : boolean État.

#### `core_input_bindings.getMenuActionMapWatchEnabled()`

Indique si la surveillance est active.

- **renvoie** : boolean État.

#### `core_input_bindings.getMenuActionStates()`

État actuel (activé ou non) de chaque action de menu indépendante.

- **renvoie** : table<string, boolean> Action -> activée.

#### `core_input_bindings.getMenuScrollActionMapEnabled()`

État de la MenuScrollActionMap.

- **renvoie** : boolean true si poussée.

#### `core_input_bindings.getRecentDevices()`

Liste des périphériques triés par activité récente (mise en cache, getDevicesByRecentActivity).

- **renvoie** : table Périphériques récents.

#### `core_input_bindings.getUsedBindingsFiles()`

Recharge les bindings en enregistrant les chemins de fichiers lus (utile pour lister les inputmaps utilisés).

- **renvoie** : string[] Chemins lus.

#### `core_input_bindings.isModalPopupOpen()`

Indique si un popup modal est ouvert (état d'UI '/popup/...' hors '/popup/activity/').

- **renvoie** : boolean État.

#### `core_input_bindings.menuActive(enabled)`

Déprécié : loggue une erreur avec la pile d'appel et appelle setMenuActionMapEnabled(enabled).

- `enabled` (*boolean*) : État voulu.

#### `core_input_bindings.notifyUI(reason)`

Envoie à l'UI les contrôleurs, les joueurs assignés et un paquet InputBindingsChanged (catégories, actions du véhicule courant, template de binding, bindings, defaultBindings, reason).

- `reason` (*string*) : Texte indiquant la cause.

#### `core_input_bindings.onAfterRouteChange(context)`

Hook de changement de route UI : mémorise le nom de la route et met à jour l'état de l'ActionMap de menu.

- `context` (*table*) : Contexte avec toRoute.name.

#### `core_input_bindings.onFileChanged(filename, t)`

Hook de changement de fichier : si un fichier d'actions ou d'inputmap (settings/inputmaps, vehicles/.../inputmaps, *.inputmap.json) change, programme un rechargement dans 0,1 s.

- `filename` (*string*) : Chemin modifié.
- `t` (*any*) : Non utilisé (déduit du code).

#### `core_input_bindings.onPlayerVehiclePresenceChanged(player)`

Hook quand un joueur entre ou quitte un véhicule : renvoie la config force feedback aux véhicules.

- `player` (*integer*) : Indice du joueur.

#### `core_input_bindings.onRecentDevicesChanged(_recentDevices)`

Hook appelé quand l'ordre d'activité des périphériques change : met en cache et envoie RecentDevicesChanged à l'UI.

- `_recentDevices` (*table*) : Nouvelle liste.

#### `core_input_bindings.onUIStateTriggered(stateName, opened, stateStack)`

Hook de changement d'état d'UI : détecte les popups ouverts ('/popup/...') et met à jour l'ActionMap de menu.

- `stateName` (*string*) : État UI.
- `opened` (*boolean*) : Ouvert ou fermé.
- `stateStack` (*string[]*) : Pile des états ouverts.

#### `core_input_bindings.onVehicleSpawned(vehId, veh)`

Hook à la création d'un véhicule : recalcule assignations et bindings sans notification.

- `vehId` (*integer*) : Id du véhicule.
- `veh` (*userdata*) : Objet véhicule.

#### `core_input_bindings.onVehicleSwitched(oldId, newId, player)`

Hook au changement de véhicule d'un joueur : recalcule assignations et bindings (les actions spécifiques changent) et notifie tout.

- `oldId` (*integer*) : Ancien véhicule.
- `newId` (*integer*) : Nouveau véhicule.
- `player` (*integer*) : Indice du joueur.

#### `core_input_bindings.refreshAssignedPlayers(logEnabled, seatPlayers)`

Recalcule l'assignation automatique via core_multiseat (si autoAssign) et notifie seulement si elle a changé.

- `logEnabled` (*boolean|nil*) : Active les logs de core_multiseat.
- `seatPlayers` (*boolean|nil*) : Transmis à core_multiseat.getAssignedPlayers.
- **renvoie** : table<string, integer> Assignations courantes.

#### `core_input_bindings.resetBindings(desiredDevName)`

Supprime les bindings personnalisés (inputmaps/diff utilisateur) d'un périphérique ou de tous, génériques et du véhicule joueur, et recharge.

- `desiredDevName` (*string|nil*) : Nom de périphérique ; nil = tous les périphériques branchés.

#### `core_input_bindings.saveBindingsToDisk(data)`

Sauvegarde les bindings envoyés par l'UI : les sépare par véhicule/génériques, compare à la version par défaut et écrit un fichier .diff par périphérique et véhicule, puis force un rechargement.

- `data` (*table*) : Inputmap complète d'un périphérique : {bindings, devicetype, guid, name, vidpid, …}.

#### `core_input_bindings.setMenuActionEnabled(enabled, actionName, actionMapName)`

Active ou désactive une ActionMap de menu : soit par nom d'action ('menu_item_up' -> MenuIndependent_menu_item_upActionMap), soit directement par nom d'ActionMap. Refuse (log d'erreur) les ActionMap non liées aux menus ou inconnues.

- `enabled` (*boolean*) : Nouvel état.
- `actionName` (*string|nil*) : Nom d'action ; peut être nil si actionMapName est donné.
- `actionMapName` (*string|nil*) : Nom complet de l'ActionMap.
- **renvoie** : boolean|nil Nouvel état effectif (am.enabled), nil en cas d'échec.

#### `core_input_bindings.setMenuActionMapEnabled(enabled)`

Active ou désactive l'ActionMap de menu principale (et, à la désactivation, toutes les ActionMap de menu indépendantes), met à jour isMenuActive et notifie l'UI/extensions.

- `enabled` (*boolean*) : true = menus actifs.

#### `core_input_bindings.setMenuActionMapWatchEnabled(enabled)`

Active/désactive la notification UI MenuActionMapStateChanged à chaque modification d'une ActionMap de menu.

- `enabled` (*boolean*) : true = surveiller.
- **renvoie** : boolean Nouvel état.

#### `core_input_bindings.setMenuActionsEnabled(actionStates)`

Applique en lot un état pour plusieurs actions de menu : {menu_item_up = true, menu_item_down = false}. Ignore les valeurs non booléennes.

- `actionStates` (*table<string, boolean>*) : Action -> état voulu.
- **renvoie** : table<string, boolean>|boolean Action -> état effectif ; false si l'argument n'est pas une table.

#### `core_input_bindings.setMenuScrollActionMapEnabled(enabled)`

Pousse (push) ou retire (pop) la 'MenuScrollActionMap' sur la pile des ActionMap.

- `enabled` (*boolean*) : true = pousser.
- **renvoie** : boolean État résultant ; false si l'ActionMap n'existe pas.

#### `core_input_bindings.setPlayerToDevice(devname, player)`

Assigne un joueur à un périphérique (assignPlayerToDevice), recalcule les bindings et notifie tout le monde.

- `devname` (*string*) : Nom du périphérique.
- `player` (*integer*) : Indice du joueur.

#### `core_input_bindings.updateGFX(dtRaw)`

Hook par image : exécute le rechargement différé des bindings ; désactive la 'VehicleSpecificActionMap' quand le joueur marche (unicycle en caméra monde) hors split-screen.

- `dtRaw` (*number*) : Delta temps brut en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `assignedPlayers` | table<string, integer> | Nom de périphérique -> indice de joueur. |
| `autoAssignPlayersToDevices` | boolean | true (défaut) : l'assignation joueur<->périphérique est calculée automatiquement par core_multiseat. |
| `bindings` | table[] | Bindings courants par périphérique (voir notes). |
| `defaultBindings` | table[] | Bindings par défaut officiels, même structure que bindings ; sert de référence pour calculer les diffs. |
| `dependencies` | string[] | {'core_input_actions', 'core_input_categories', 'core_multiseat', 'license', 'core_versionUpdate'}. |
| `devices` | table<string, table> | Périphériques branchés : nom (ex. 'xinput0') -> {guid, productName, vidpid, playerNumber, platformUserNumber}. |
| `isMenuActive` | boolean | true quand l'ActionMap de menu est active (écran de menu ou popup ouvert). |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onFFBConfigChanged` — écouté par 1 module(s)
- `onInputBindingsChanged` — écouté par 6 module(s)
- `onMenuActionMapEnabled` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `AssignedPlayersChanged`, `InputBindingsChanged`, `MenuActionMapEnabled`, `MenuActionMapStateChanged`, `RecentDevicesChanged`

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`, `removeFile`, `stat`
- `be:` `getFFBConfig`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/input/bindings.lua`.*
