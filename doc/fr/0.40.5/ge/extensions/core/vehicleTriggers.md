# `core_vehicleTriggers`

*Fichier : `lua/ge/extensions/core/vehicleTriggers.lua` · VM : Game Engine (GE) · 1625 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_vehicleTriggers` : `extensions.load("core_vehicleTriggers")`, puis la globale `core_vehicleTriggers`

Gère l'interaction du joueur avec les triggers de véhicule (poignées de porte, capot, etc. définis dans le JBeam) : lancer de rayon depuis le curseur ou le réticule, survol, affichage du réticule et des libellés d'action dans l'interface, puis exécution des liens d'action (inputActions du véhicule ou actions communes) quand le joueur appuie sur triggerAction0/1/2. Gère aussi le mode écran partagé (un rayon par joueur) et active ou désactive le système de rendu des triggers côté C++ (VehicleTrigger). Un moddeur s'en sert surtout pour déclencher un trigger par script (triggerEvent), tester si l'interaction est possible (isEnabled) ou écouter les hooks onVehicleTriggerActionLabel et onVehicleTriggersExecuteLink.

## Exemple

```lua
-- simuler l'appui sur le trigger 'door_FL' du véhicule vehId
local vd = core_vehicle_manager.getVehicleData(vehId)
core_vehicleTriggers.triggerEvent('action0', 1, 'door_FL', vehId, vd.vdata, 0) -- appui
core_vehicleTriggers.triggerEvent('action0', 0, 'door_FL', vehId, vd.vdata, 0) -- relâchement
```

## Remarques

- Flux de l'interaction : le mode de visée est « cursor » (rayon depuis la position du curseur) ou « crosshair » (rayon depuis le centre de l'écran) ; le mode réticule n'est permis que si la caméra active et les réglages le permettent, sinon retour au mode curseur.
- isEnabled() recalcule M.state.allowInteraction : faux si une popup modale est ouverte, si une capture photomode est en cours, si l'interface CEF est masquée, si le jeu est en pause hors route /play (ou dans la config véhicule), si la souris est verrouillée, ou si le curseur est invisible en mode curseur. En écran partagé, ces conditions de curseur sont ignorées.
- Le champ M.state (table) est exporté et lisible par d'autres extensions (utilisé par core_vehicleTriggersDebug) : currentlyUsedTriggers (trigger tenu, par index de joueur), aimMode, allowInteraction, debugEnabled, hoveredHitPosWorld, etc.
- Distance du rayon : 3 m pour un unicycle (marcheur) ou une caméra d'occupant/conducteur, 50 m sinon.
- onUpdate fixe renderFilterObjectId à 0 (le code précédent est écrasé volontairement : « temporary change ») : les triggers de tous les véhicules, remorques attachées incluses, sont interactifs.
- Un lien de trigger peut inverser la valeur via isInverted (valeur multipliée par -1) ; versions : lien v2 (namespace 'vehicle' ou 'common') ou ancien format targetEvent.
- Pour un lien v2 'common' sans commonLua, l'action passe par ActionMap.triggerBindingByNameDigital (valeur > 0.9 = appui), côté C++.
- Le calcul des libellés (placement) est limité à 20 Hz (newFPSLimiter(20)) mais le lancer de rayon se fait à chaque image.
- getTriggerRaycastDistance : les branches « caméra libre » et « normale » renvoient la même valeur (50) ; la branche libre est redondante.
- onActionEvent renvoie false si l'interaction est désactivée, true s'il n'y a pas de trigger touché, et nil dans les autres cas (valeur de retour peu fiable).
- triggerEventWithoutVdata ne vérifie pas que getVehicleData renvoie une valeur non nulle : erreur Lua possible si le véhicule n'existe pas.

**Dépendances (chargées avant) :** `core_vehicle_triggerLabelPlacement`, `core_input_actionFilter`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_vehicleTriggers.disableDebugUI()` | Désactive le mode debug des triggers : décharge l'extension core_vehicleTriggersDebug (sans effet si déjà désactivé). | 1557 |
| `core_vehicleTriggers.enableDebugUI()` | Active le mode debug : met state.debugEnabled à true et charge l'extension core_vehicleTriggersDebug (fenêtre « Vehicle event debug »). Active aussi des logs supplémentaires lors de l'exécution des liens. | 1553 |
| `core_vehicleTriggers.getCursorPercent01()` | Position du curseur dans la zone cliente de la fenêtre, en fraction de 0 à 1. | 357 |
| `core_vehicleTriggers.getTriggerRaycastDistance(player)` | Distance maximale du lancer de rayon pour un joueur : 3 m pour un marcheur (unicycle) ou une caméra d'occupant, 50 m sinon. | 420 |
| `core_vehicleTriggers.isEnabled()` | Indique si l'interaction avec les triggers est autorisée à cet instant (voir notes) et met à jour state.allowInteraction. | 788 |
| `core_vehicleTriggers.onActionEvent(actionNumber, inputValue, player)` | Appelé par les actions d'entrée triggerAction0, 1 et 2. Au relâchement (valeur 0) relâche le trigger tenu ; sinon fait un lancer de rayon pour le joueur, et exécute les liens du trigger touché via triggerEvent. Mémorise le trigger tenu tant que la touche reste appuyée. *(interne)* *(hook)* | 1517 |
| `core_vehicleTriggers.onCefVisibilityChanged(cefVisible)` | Hook appelé quand l'interface CEF est affichée ou masquée. Mémorise l'état ; si elle est masquée, retire les action maps VehicleInteraction et cache le réticule. *(interne)* *(hook)* | 1544 |
| `core_vehicleTriggers.onCursorVisibilityChanged(visible)` | Hook appelé quand la visibilité du curseur change ; le curseur est considéré visible en permanence si VehicleTrigger.debug est actif. *(interne)* *(hook)* | 720 |
| `core_vehicleTriggers.onDeserialized(data)` | Hook appelé après un rechargement des extensions : efface les masques de joueur de l'action map et restaure l'état debug. *(interne)* *(hook)* | 1570 |
| `core_vehicleTriggers.onExtensionUnloaded()` | Hook appelé au déchargement : retire les action maps d'interaction, efface les masques et coupe VehicleTrigger.renderingEnabled et VehicleTrigger.enabled. *(interne)* *(hook)* | 1577 |
| `core_vehicleTriggers.onInputBindingsChanged()` | Hook appelé quand les assignations d'entrées changent : force le recalcul du joueur qui contrôle la souris. *(interne)* *(hook)* | 1584 |
| `core_vehicleTriggers.onMouseLocked(locked)` | Hook appelé quand la souris est verrouillée ou libérée (ex. caméra libre) ; une souris verrouillée désactive l'interaction. *(interne)* *(hook)* | 725 |
| `core_vehicleTriggers.onRecentDevicesChanged(recentDevices)` | Hook appelé avec les périphériques classés par activité récente ; le dernier périphérique non clavier du joueur de la souris (souris ou manette) décide s'il vise au curseur ou au réticule. *(interne)* *(hook)* | 1590 |
| `core_vehicleTriggers.onSerialize()` | Hook appelé avant un rechargement des extensions : retire les action maps et le réticule, renvoie {debugEnabled}. *(interne)* *(hook)* | 1561 |
| `core_vehicleTriggers.onSplitScreenLayoutChanged()` | Hook appelé quand la disposition de l'écran partagé change : vide les caches de centres et de rectangles de vue. *(interne)* *(hook)* | 1261 |
| `core_vehicleTriggers.onUpdate(dtReal, dtSim, dtRaw)` | Hook appelé à chaque image. Rafraîchit le contexte, calcule si l'interaction est permise, active ou coupe VehicleTrigger (enabled, renderingEnabled, proximityRenderingEnabled), cherche le trigger survolé, met à jour libellés, légende des touches, délai du réticule et flux UI. En écran partagé, délègue à une version par joueur. *(interne)* *(hook)* | 1382 |
| `core_vehicleTriggers.triggerEvent(actionStr, actionValue, triggerId, vehicleId, vdata, player)` | Exécute tous les liens associés à l'action d'un trigger dans vdata.triggerEventLinksDict[triggerId][actionStr]. Chaque lien déclenche le hook onVehicleTriggersExecuteLink puis une commande d'entrée véhicule ou une action commune. Ne fait rien si le trigger ou l'action n'a pas de lien. | 1488 |
| `core_vehicleTriggers.triggerEventWithoutVdata(actionNum, actionValue, triggerId, vehicleId, player)` | Variante de triggerEvent qui retrouve elle-même vdata à partir de vehicleId. Appelée par le C++ (typiquement manettes de réalité virtuelle). *(interne)* | 1509 |
| `core_vehicleTriggers.worldPosToScreenPercent01(worldPos, out)` | Projette une position monde sur l'écran avec la caméra active, en fraction 0 à 1 (origine en haut à gauche). | 396 |

### Détail des paramètres

#### `core_vehicleTriggers.getCursorPercent01()`

Position du curseur dans la zone cliente de la fenêtre, en fraction de 0 à 1.

- **renvoie** : table|nil {x, y} entre 0 et 1, ou nil si la position n'est pas disponible.

#### `core_vehicleTriggers.getTriggerRaycastDistance(player)`

Distance maximale du lancer de rayon pour un joueur : 3 m pour un marcheur (unicycle) ou une caméra d'occupant, 50 m sinon.

- `player` (*integer|nil*) : Index du joueur (0 par défaut).
- **renvoie** : number Distance en mètres.

#### `core_vehicleTriggers.isEnabled()`

Indique si l'interaction avec les triggers est autorisée à cet instant (voir notes) et met à jour state.allowInteraction.

- **renvoie** : boolean true si l'interaction est autorisée.

#### `core_vehicleTriggers.onActionEvent(actionNumber, inputValue, player)`

Appelé par les actions d'entrée triggerAction0, 1 et 2. Au relâchement (valeur 0) relâche le trigger tenu ; sinon fait un lancer de rayon pour le joueur, et exécute les liens du trigger touché via triggerEvent. Mémorise le trigger tenu tant que la touche reste appuyée.

- `actionNumber` (*integer*) : Numéro d'action (0, 1 ou 2) ; devient la chaîne 'action0', etc.
- `inputValue` (*number*) : Valeur de l'entrée (0 = relâché, non nul = appuyé).
- `player` (*integer|nil*) : Index du joueur (0 par défaut).
- **renvoie** : boolean|nil false si l'interaction est désactivée, true si aucun trigger n'est touché, sinon nil.

#### `core_vehicleTriggers.onCefVisibilityChanged(cefVisible)`

Hook appelé quand l'interface CEF est affichée ou masquée. Mémorise l'état ; si elle est masquée, retire les action maps VehicleInteraction et cache le réticule.

- `cefVisible` (*boolean*) : true si l'interface est visible.

#### `core_vehicleTriggers.onCursorVisibilityChanged(visible)`

Hook appelé quand la visibilité du curseur change ; le curseur est considéré visible en permanence si VehicleTrigger.debug est actif.

- `visible` (*boolean*) : true si le curseur est visible.

#### `core_vehicleTriggers.onDeserialized(data)`

Hook appelé après un rechargement des extensions : efface les masques de joueur de l'action map et restaure l'état debug.

- `data` (*table|nil*) : Données renvoyées par onSerialize ({debugEnabled}).

#### `core_vehicleTriggers.onMouseLocked(locked)`

Hook appelé quand la souris est verrouillée ou libérée (ex. caméra libre) ; une souris verrouillée désactive l'interaction.

- `locked` (*boolean*) : true si la souris est verrouillée.

#### `core_vehicleTriggers.onRecentDevicesChanged(recentDevices)`

Hook appelé avec les périphériques classés par activité récente ; le dernier périphérique non clavier du joueur de la souris (souris ou manette) décide s'il vise au curseur ou au réticule.

- `recentDevices` (*string[]*) : Noms de périphériques, le plus récent en premier.

#### `core_vehicleTriggers.onSerialize()`

Hook appelé avant un rechargement des extensions : retire les action maps et le réticule, renvoie {debugEnabled}.

- **renvoie** : table {debugEnabled = boolean}

#### `core_vehicleTriggers.onUpdate(dtReal, dtSim, dtRaw)`

Hook appelé à chaque image. Rafraîchit le contexte, calcule si l'interaction est permise, active ou coupe VehicleTrigger (enabled, renderingEnabled, proximityRenderingEnabled), cherche le trigger survolé, met à jour libellés, légende des touches, délai du réticule et flux UI. En écran partagé, délègue à une version par joueur.

- `dtReal` (*number*) : Temps réel écoulé (s).
- `dtSim` (*number*) : Temps de simulation écoulé (s).
- `dtRaw` (*number*) : Temps brut écoulé (s).

#### `core_vehicleTriggers.triggerEvent(actionStr, actionValue, triggerId, vehicleId, vdata, player)`

Exécute tous les liens associés à l'action d'un trigger dans vdata.triggerEventLinksDict[triggerId][actionStr]. Chaque lien déclenche le hook onVehicleTriggersExecuteLink puis une commande d'entrée véhicule ou une action commune. Ne fait rien si le trigger ou l'action n'a pas de lien.

- `actionStr` (*string*) : Nom de l'action : 'action0', 'action1' ou 'action2'.
- `actionValue` (*number*) : Valeur envoyée (1 = appui, 0 = relâchement).
- `triggerId` (*string|integer*) : Identifiant du trigger dans le JBeam (déduit du code : clé de triggerEventLinksDict).
- `vehicleId` (*integer*) : Identifiant de l'objet véhicule.
- `vdata` (*table*) : Données du véhicule (core_vehicle_manager.getVehicleData(id).vdata) contenant triggerEventLinksDict et inputActions.
- `player` (*integer|nil*) : Index du joueur à l'origine de l'action.

#### `core_vehicleTriggers.triggerEventWithoutVdata(actionNum, actionValue, triggerId, vehicleId, player)`

Variante de triggerEvent qui retrouve elle-même vdata à partir de vehicleId. Appelée par le C++ (typiquement manettes de réalité virtuelle).

- `actionNum` (*integer*) : Numéro d'action (0, 1 ou 2).
- `actionValue` (*number*) : Valeur envoyée.
- `triggerId` (*string|integer*) : Identifiant du trigger.
- `vehicleId` (*integer*) : Identifiant du véhicule.
- `player` (*integer|nil*) : Index du joueur.

#### `core_vehicleTriggers.worldPosToScreenPercent01(worldPos, out)`

Projette une position monde sur l'écran avec la caméra active, en fraction 0 à 1 (origine en haut à gauche).

- `worldPos` (*vec3*) : Position monde.
- `out` (*table|nil*) : Table réutilisée pour le résultat (créée si absente).
- **renvoie** : table|nil {x, y} ; nil si le point est derrière la caméra ou si le contexte caméra est indisponible.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant celle-ci : core_vehicle_triggerLabelPlacement et core_input_actionFilter. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onVehicleTriggerActionLabel` — écouté par 1 module(s)
- `onVehicleTriggersExecuteLink` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`, `triggerRaycastClosest`, `triggerRaycastClosestRay`
- `debugDrawer:` `drawLine`
- `scenetree.` `findObject`

**Charge les extensions :** `core_vehicleTriggersDebug`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/vehicleTriggers.lua`.*
