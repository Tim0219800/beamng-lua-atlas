# `gameplay_garageMode`

*Fichier : `lua/ge/extensions/gameplay/garageMode.lua` · VM : Game Engine (GE) · 582 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_garageMode` : `extensions.load("gameplay_garageMode")`, puis la globale `gameplay_garageMode`

Mode garage : charge le niveau garage_v2 (ou utilise l'emplacement actuel en carrière), gèle le véhicule sur son point d'apparition, passe la caméra en orbite, bloque certaines actions d'entrée (map, menus véhicule, IA, marche, reset...), masque automatiquement plafond et piliers selon la position de la caméra, gère l'éclairage par groupes et permet de tester le véhicule dans le niveau gridmap_v2. Un moddeur s'en sert pour entrer/sortir du garage (start/stop) ou ajuster caméra et éclairage.

## Exemple

```lua
extensions.load('gameplay_garageMode')
gameplay_garageMode.start(false)   -- charge garage_v2 avec le véhicule courant
gameplay_garageMode.setCamera('front')
gameplay_garageMode.setLighting({true, false, true}) -- ouest, milieu, est
gameplay_garageMode.stop()
```

## Remarques

- Préréglages de caméra de setCamera : default, front, back, side, left, right, top. Un nom inconnu donne nil à setDefaultRotation.
- Groupes de scène masqués : hide_from_camera (plafond, si la caméra est au-dessus de z = 108.1), hide_from_camera_pillars_west / _east (selon x de la caméra) ; groupes d'éclairage lights_group_west, _middle, _east.
- Le véhicule est gelé (setFreeze) 5 frames après son apparition, car le vlua peut être réinitialisé avant.
- onUpdate n'est enregistré que pendant que le mode est actif (setActive appelle extensions.hookUpdate).
- En carrière, les textes de chargement/sauvegarde passent par career_saveSystem.saveCurrent puis la chaîne d'étapes garageInitModules (gameplay_garageMode, career_modules_inventory) via initStepFinished.
- Incohérence : la variable locale vehicleToLoad n'est jamais assignée ; le code de onClientStartMission (replaceVehicle) est donc inutilisé.
- Émet le hook extensions.hook('onEndGarageMode') à la fin du mode.

**Dépendances (chargées avant) :** `core_jobsystem`, `core_vehicle_manager`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_garageMode.garageModeStartStep()` | Étape d'initialisation en chaîne : lance career_saveSystem.saveCurrent() ; la fin de la sauvegarde appelle initStepFinished. *(interne)* | 372 |
| `gameplay_garageMode.getGarageMenuState()` | Renvoie le menu de garage mémorisé. | 65 |
| `gameplay_garageMode.getLastOwnedVehicleId()` | ID du dernier véhicule possédé entré ou courant en carrière. | 541 |
| `gameplay_garageMode.getLighting()` | Renvoie l'état des trois groupes d'éclairage. | 450 |
| `gameplay_garageMode.initStepFinished()` | Passe à l'étape d'initialisation suivante (extension suivante de garageInitModules) ou termine la chaîne. *(interne)* | 362 |
| `gameplay_garageMode.isActive()` | Indique si le mode garage est actif. | 485 |
| `gameplay_garageMode.isObjectsAutohide()` | Indique si le masquage automatique est actif. | 493 |
| `gameplay_garageMode.onClientPreStartMission(levelPath)` | Hook avant le démarrage d'un niveau : active le mode garage si demandé au chargement (décharge/recharge les extensions), sinon termine le mode garage s'il était actif. *(interne)* *(hook)* | 461 |
| `gameplay_garageMode.onClientStartMission(levelPath)` | Hook au démarrage d'un niveau : remplace le véhicule par vehicleToLoad s'il existe (jamais assigné dans ce fichier). *(interne)* *(hook)* | 454 |
| `gameplay_garageMode.onDeserialized(v)` | Hook de rechargement des extensions : restaure l'état actif. *(interne)* *(hook)* | 481 |
| `gameplay_garageMode.onEnterVehicleFinished(vehicleId)` | Hook : mémorise le véhicule entré comme dernier véhicule possédé. *(interne)* *(hook)* | 69 |
| `gameplay_garageMode.onGarageEnter(context, toRoute, fromRoute, data)` | Hook de navigation UI : remplit data.layoutMenu (barre du haut avec onglets Garage/Tuning, en-tête, rails) et data.garage pour la route garage. *(interne)* *(hook)* | 146 |
| `gameplay_garageMode.onLoadingScreenFadeout()` | Hook à la fin de l'écran de chargement : après testVehicle, navigue vers la route UI "play". *(interne)* *(hook)* | 545 |
| `gameplay_garageMode.onSerialize()` | Hook de rechargement des extensions : sauvegarde {active}. *(interne)* *(hook)* | 475 |
| `gameplay_garageMode.onSpawnCCallback(vehicleId)` | Hook de spawn : demande que le véhicule apparaisse moteur éteint (spawnWithEngineRunning = false). *(interne)* *(hook)* | 121 |
| `gameplay_garageMode.onThumbnailTriggered(active)` | Hook de prise de vignette : dans garage_v2, quitte le mode garage et masque piliers est (affiche ouest/plafond) pendant la capture, puis réactive le mode ; affiche/retire l'écran noir GarageModeBlackscreen. *(interne)* *(hook)* | 497 |
| `gameplay_garageMode.onVehicleSaveFinished()` | Hook : si l'initialisation du garage attend la sauvegarde, passe à l'étape suivante. *(interne)* *(hook)* | 377 |
| `gameplay_garageMode.onVehicleSpawned(vehicleId)` | Hook appelé à l'apparition d'un véhicule ; en mode garage, le téléporte sur le point de spawn du niveau garage et programme le gel. *(interne)* *(hook)* | 114 |
| `gameplay_garageMode.setCamera(preset)` | Lance un job qui passe en caméra orbite et applique une rotation par défaut prédéfinie. | 84 |
| `gameplay_garageMode.setGarageMenuState(state)` | Mémorise le menu de garage ouvert ; l'état "paint" marque le véhicule comme modifié. | 56 |
| `gameplay_garageMode.setLighting(state)` | Allume/éteint les trois groupes d'éclairage du garage (ouest, milieu, est). | 318 |
| `gameplay_garageMode.setObjectsAutohide(v)` | Active ou désactive le masquage automatique du plafond et des piliers. | 489 |
| `gameplay_garageMode.setVehicleDirty(vehicleDirty, switchedToNewVehicle)` | Prévu pour signaler un véhicule modifié en carrière ; le déclenchement du guihook est actuellement commenté, la fonction ne fait donc rien d'observable. | 50 |
| `gameplay_garageMode.start(_useCurrentLocation, skipInventoryStep)` | Entre en mode garage. Avec useCurrentLocation vrai, reste sur la carte actuelle (carrière : vérifie qu'il y a des véhicules en inventaire, appelle career_modules_inventory.onBeforeGarage, passe en caméra orbite, met l'allumage à 0) ; sinon charge le niveau garage_v2 avec le véhicule courant. | 385 |
| `gameplay_garageMode.stop()` | Quitte le mode garage : remet l'allumage au niveau 3, dégèle le véhicule, restaure la caméra et l'état freeroam, puis émet onEndGarageMode. | 445 |
| `gameplay_garageMode.testVehicle()` | Lance un job qui fait sortir le véhicule du garage (ai vers le waypoint garageExit), fond au noir puis charge gridmap_v2 en freeroam avec le véhicule courant. | 537 |
| `gameplay_garageMode.vehicleByIdOrActive(vehicleId)` | Renvoie « Marque Nom » du modèle donné, ou du véhicule actif si aucun n'est fourni. | 191 |
| `gameplay_garageMode.zoom(value)` | Zoome la caméra de façon progressive (accélération limitée) ; sans effet hors mode garage. Le zoom s'arrête de lui-même après un court délai. | 211 |

### Détail des paramètres

#### `gameplay_garageMode.getGarageMenuState()`

Renvoie le menu de garage mémorisé.

- **renvoie** : string|nil Nom du menu.

#### `gameplay_garageMode.getLastOwnedVehicleId()`

ID du dernier véhicule possédé entré ou courant en carrière.

- **renvoie** : integer|nil ID de véhicule.

#### `gameplay_garageMode.getLighting()`

Renvoie l'état des trois groupes d'éclairage.

- **renvoie** : boolean[] {ouest, milieu, est}.

#### `gameplay_garageMode.isActive()`

Indique si le mode garage est actif.

- **renvoie** : boolean true si actif.

#### `gameplay_garageMode.isObjectsAutohide()`

Indique si le masquage automatique est actif.

- **renvoie** : boolean État courant.

#### `gameplay_garageMode.onClientPreStartMission(levelPath)`

Hook avant le démarrage d'un niveau : active le mode garage si demandé au chargement (décharge/recharge les extensions), sinon termine le mode garage s'il était actif.

- `levelPath` (*string*) : Chemin du niveau.

#### `gameplay_garageMode.onClientStartMission(levelPath)`

Hook au démarrage d'un niveau : remplace le véhicule par vehicleToLoad s'il existe (jamais assigné dans ce fichier).

- `levelPath` (*string*) : Chemin du niveau.

#### `gameplay_garageMode.onDeserialized(v)`

Hook de rechargement des extensions : restaure l'état actif.

- `v` (*table*) : Données de onSerialize.

#### `gameplay_garageMode.onEnterVehicleFinished(vehicleId)`

Hook : mémorise le véhicule entré comme dernier véhicule possédé.

- `vehicleId` (*integer|nil*) : ID du véhicule.

#### `gameplay_garageMode.onGarageEnter(context, toRoute, fromRoute, data)`

Hook de navigation UI : remplit data.layoutMenu (barre du haut avec onglets Garage/Tuning, en-tête, rails) et data.garage pour la route garage.

- `context` (*table|nil*) : Contexte de navigation.
- `toRoute` (*table|nil*) : Route de destination (champ name).
- `fromRoute` (*table|nil*) : Route d'origine (non utilisée).
- `data` (*table*) : Table de données de route, modifiée en place.

#### `gameplay_garageMode.onSerialize()`

Hook de rechargement des extensions : sauvegarde {active}.

- **renvoie** : table {active = boolean}.

#### `gameplay_garageMode.onSpawnCCallback(vehicleId)`

Hook de spawn : demande que le véhicule apparaisse moteur éteint (spawnWithEngineRunning = false).

- `vehicleId` (*integer*) : ID du véhicule.

#### `gameplay_garageMode.onThumbnailTriggered(active)`

Hook de prise de vignette : dans garage_v2, quitte le mode garage et masque piliers est (affiche ouest/plafond) pendant la capture, puis réactive le mode ; affiche/retire l'écran noir GarageModeBlackscreen.

- `active` (*boolean*) : true au début de la capture, false à la fin.

#### `gameplay_garageMode.onVehicleSpawned(vehicleId)`

Hook appelé à l'apparition d'un véhicule ; en mode garage, le téléporte sur le point de spawn du niveau garage et programme le gel.

- `vehicleId` (*integer*) : ID du véhicule.

#### `gameplay_garageMode.setCamera(preset)`

Lance un job qui passe en caméra orbite et applique une rotation par défaut prédéfinie.

- `preset` (*string|nil*) : default, front, back, side, left, right ou top (default si nil).

#### `gameplay_garageMode.setGarageMenuState(state)`

Mémorise le menu de garage ouvert ; l'état "paint" marque le véhicule comme modifié.

- `state` (*string|nil*) : Nom du menu.

#### `gameplay_garageMode.setLighting(state)`

Allume/éteint les trois groupes d'éclairage du garage (ouest, milieu, est).

- `state` (*boolean[]|nil*) : Tableau de 3 booléens ; nil rallume tout.

#### `gameplay_garageMode.setObjectsAutohide(v)`

Active ou désactive le masquage automatique du plafond et des piliers.

- `v` (*boolean*) : true pour masquer automatiquement.

#### `gameplay_garageMode.setVehicleDirty(vehicleDirty, switchedToNewVehicle)`

Prévu pour signaler un véhicule modifié en carrière ; le déclenchement du guihook est actuellement commenté, la fonction ne fait donc rien d'observable.

- `vehicleDirty` (*boolean*) : État modifié.
- `switchedToNewVehicle` (*boolean|nil*) : Changement de véhicule.

#### `gameplay_garageMode.start(_useCurrentLocation, skipInventoryStep)`

Entre en mode garage. Avec useCurrentLocation vrai, reste sur la carte actuelle (carrière : vérifie qu'il y a des véhicules en inventaire, appelle career_modules_inventory.onBeforeGarage, passe en caméra orbite, met l'allumage à 0) ; sinon charge le niveau garage_v2 avec le véhicule courant.

- `_useCurrentLocation` (*boolean|nil*) : true pour utiliser l'emplacement actuel au lieu de charger garage_v2.
- `skipInventoryStep` (*boolean|nil*) : En carrière, saute l'appel à career_modules_inventory.onBeforeGarage.

#### `gameplay_garageMode.vehicleByIdOrActive(vehicleId)`

Renvoie « Marque Nom » du modèle donné, ou du véhicule actif si aucun n'est fourni.

- `vehicleId` (*string|nil*) : Clé de modèle (nom du dossier jbeam), malgré son nom.
- **renvoie** : string|nil Texte « Brand Name » ou nil.

#### `gameplay_garageMode.zoom(value)`

Zoome la caméra de façon progressive (accélération limitée) ; sans effet hors mode garage. Le zoom s'arrête de lui-même après un court délai.

- `value` (*number*) : Sens et intensité (positif ou négatif) ; 0 ne fait rien.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | core_jobsystem et core_vehicle_manager. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEndGarageMode`
- `onUpdate` — écouté par 186 module(s)

**Évènements UI (guihooks.trigger) :** `FadeScreen`, `GarageModeBlackscreen`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/garageMode.lua`.*
