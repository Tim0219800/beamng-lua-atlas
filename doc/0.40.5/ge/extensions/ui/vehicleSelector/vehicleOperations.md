# `ui_vehicleSelector_vehicleOperations`

*Fichier : `lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua` · VM : Game Engine (GE) · 542 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_vehicleSelector_vehicleOperations` : `extensions.load("ui_vehicleSelector_vehicleOperations")`, puis la globale `ui_vehicleSelector_vehicleOperations`

Actions du sélecteur de véhicules : crée les boutons « Faire apparaître » et « Remplacer le véhicule » d'une config, et les boutons de gestion (sauvegarder la config, cloner, choix aléatoire, tout réinitialiser, tout supprimer, supprimer le véhicule courant ou les autres, véhicule par défaut en mode dev). Il exécute le véhicule choisi après l'écran de fade en passant par core_vehicles (spawnNewVehicle, replaceVehicle, cloneCurrent), respecte les permissions multijoueur et les restrictions des tutoriels, et émet des hooks onVehicleSelector*.

## Remarques

- Les boutons sont gérés par ui/gridSelectorUtils/buttonModule (addButton, getFreeButtonId, clearButtonFunctions) ; chaque bouton a un buttonId, une fonction et des métadonnées (label, icon, primary, disabled, uiEvent, canClearFilters...).
- Spawn et remplacement sont différés : la fonction callbackAfterFade est lancée au passage de onScreenFadeState(1) ou de onUiWaitingState, pendant que l'UI affiche 'app:waiting' (true puis false).
- Hooks émis : onVehicleSelectorSpawnNewRequested, onVehicleSelectorSpawnNew(modelKey, configKey, paint1, paint2, paint3), onVehicleSelectorReplaceCurrentRequested, onVehicleSelectorReplaceCurrent(mêmes arguments), onVehicleSelectorCloneCurrent, onVehicleSelectorSetAsDefault, onVehicleSelectorLoadDefault, onVehicleSelectorSelectRandom, onVehicleSelectorResetAll, onVehicleSelectorRemoveAll, onVehicleSelectorRemoveCurrent, onVehicleSelectorRemoveOthers, trackNewVeh, trackVehReset.
- Les peintures de additionalData (paint, paint2, paint3) sont des noms résolus dans model.model.paints.
- En multijoueur (multiplayer_permissions), chaque action est désactivée selon la permission du joueur (resetVehicle, removeVehicle, spawnVehicle).
- Bug probable : le bouton « Select Random » plante si aucune config ne passe les filtres (validConfigs vide, randomConfig nil). Il lit aussi randomConfig.subModel et randomConfig.brand (minuscules), champs sans doute absents des configs (qui utilisent SubModel et Brand), donc le chemin de navigation reçoit des chaînes vides.
- Détail : setDetailsButtonForFreeroam et setCustomDetailsButtons ne font que stocker une valeur dans M.detailsButtonForFreeroam et M.customDetailsButtons, qui ne sont pas relues dans ce fichier (le tri est fait par detailsInteraction).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_vehicleSelector_vehicleOperations.addButton(...)` | Ajoute un bouton à l'instance (délègue à buttonModule). | 537 |
| `ui_vehicleSelector_vehicleOperations.clearButtonFunctions(...)` | Supprime tous les boutons enregistrés (délègue à buttonModule). | 538 |
| `ui_vehicleSelector_vehicleOperations.executeButton(buttonId, additionalData)` | Exécute le bouton d'identifiant donné ; si ses métadonnées ont canClearFilters, efface les filtres quand l'option filterResetOnSpawn est active. Logue une erreur si l'id est inconnu. | 40 |
| `ui_vehicleSelector_vehicleOperations.executeDoubleClick(itemDetails)` | Pour un double-clic sur un élément : récupère ses détails et exécute le premier bouton marqué isDoubleClickAction (ou l'unique bouton). | 497 |
| `ui_vehicleSelector_vehicleOperations.getCurrentVehicleThumb(veh)` | Renvoie l'aperçu de la config d'un véhicule. | 316 |
| `ui_vehicleSelector_vehicleOperations.getFreeButtonId(...)` | Renvoie un identifiant de bouton libre (délègue à buttonModule). | 539 |
| `ui_vehicleSelector_vehicleOperations.getManagementDetails()` | Crée les boutons de gestion (si activés) et les infos du véhicule joueur 0 (nom et miniature). | 332 |
| `ui_vehicleSelector_vehicleOperations.getVehicleName(veh)` | Construit le nom lisible « Marque Nom Configuration » d'un véhicule à partir de son modèle JBeam et de sa config. | 289 |
| `ui_vehicleSelector_vehicleOperations.makeSpawningButtons(configDetails, spawnOnly)` | Crée les boutons de lancement d'une config : « Spawn new » (action_2) et, sauf spawnOnly, « Replace current » (ok, action principale et double-clic). Ils sont désactivés selon les restrictions de la première conduite, des leçons et des permissions. | 225 |
| `ui_vehicleSelector_vehicleOperations.onScreenFadeState(state)` | Hook appelé quand l'écran de fade change d'état ; à l'état 1, exécute l'action différée (spawn, remplacement, clonage). *(interne)* *(hook)* | 52 |
| `ui_vehicleSelector_vehicleOperations.onUiWaitingState(state)` | Hook appelé quand l'état d'attente de l'UI change ; exécute l'action différée en attente, quel que soit l'état. *(interne)* *(hook)* | 59 |
| `ui_vehicleSelector_vehicleOperations.setCustomDetailsButtons(buttons)` | Mémorise une liste de boutons personnalisés (mode défi). | 520 |
| `ui_vehicleSelector_vehicleOperations.setDetailsButtonForFreeroam(enabled)` | Mémorise un indicateur freeroam pour le bouton de détails. | 515 |
| `ui_vehicleSelector_vehicleOperations.setManagementButtonsEnabled(enabled)` | Active ou désactive la création des boutons de gestion. | 510 |

### Détail des paramètres

#### `ui_vehicleSelector_vehicleOperations.addButton(...)`

Ajoute un bouton à l'instance (délègue à buttonModule).

- `...` (*any*) : (fonction, métadonnées) comme dans buttonModule.addButton.
- **renvoie** : table Informations du bouton (dont buttonId).

#### `ui_vehicleSelector_vehicleOperations.clearButtonFunctions(...)`

Supprime tous les boutons enregistrés (délègue à buttonModule).

- `...` (*any*) : Transmis tels quels.

#### `ui_vehicleSelector_vehicleOperations.executeButton(buttonId, additionalData)`

Exécute le bouton d'identifiant donné ; si ses métadonnées ont canClearFilters, efface les filtres quand l'option filterResetOnSpawn est active. Logue une erreur si l'id est inconnu.

- `buttonId` (*integer*) : Identifiant du bouton.
- `additionalData` (*table|nil*) : Données additionnelles transmises à la fonction du bouton (par exemple paint, paint2, paint3).
- **renvoie** : any Résultat de la fonction du bouton (par exemple {gotoPath = ...} pour le choix aléatoire).

#### `ui_vehicleSelector_vehicleOperations.executeDoubleClick(itemDetails)`

Pour un double-clic sur un élément : récupère ses détails et exécute le premier bouton marqué isDoubleClickAction (ou l'unique bouton).

- `itemDetails` (*table*) : Élément (model, config).

#### `ui_vehicleSelector_vehicleOperations.getCurrentVehicleThumb(veh)`

Renvoie l'aperçu de la config d'un véhicule.

- `veh` (*userdata|nil*) : Objet véhicule.
- **renvoie** : string|nil Chemin de l'image, ou nil.

#### `ui_vehicleSelector_vehicleOperations.getFreeButtonId(...)`

Renvoie un identifiant de bouton libre (délègue à buttonModule).

- `...` (*any*) : Transmis tels quels.
- **renvoie** : integer Identifiant libre (déduit du nom).

#### `ui_vehicleSelector_vehicleOperations.getManagementDetails()`

Crée les boutons de gestion (si activés) et les infos du véhicule joueur 0 (nom et miniature).

- **renvoie** : table {buttonInfo = boutons, details = {currentVehicleName, currentVehicleThumb}}.

#### `ui_vehicleSelector_vehicleOperations.getVehicleName(veh)`

Construit le nom lisible « Marque Nom Configuration » d'un véhicule à partir de son modèle JBeam et de sa config.

- `veh` (*userdata|nil*) : Objet véhicule ; nil donne 'No vehicle'.
- **renvoie** : string Nom du véhicule.

#### `ui_vehicleSelector_vehicleOperations.makeSpawningButtons(configDetails, spawnOnly)`

Crée les boutons de lancement d'une config : « Spawn new » (action_2) et, sauf spawnOnly, « Replace current » (ok, action principale et double-clic). Ils sont désactivés selon les restrictions de la première conduite, des leçons et des permissions.

- `configDetails` (*table|nil*) : Config (model_key, key) ; sans elle, aucun bouton.
- `spawnOnly` (*boolean*) : true pour ne proposer que le bouton d'apparition.
- **renvoie** : table[] Informations de boutons à envoyer à l'UI.

#### `ui_vehicleSelector_vehicleOperations.onScreenFadeState(state)`

Hook appelé quand l'écran de fade change d'état ; à l'état 1, exécute l'action différée (spawn, remplacement, clonage).

- `state` (*integer*) : État du fade (1 déclenche l'action).

#### `ui_vehicleSelector_vehicleOperations.onUiWaitingState(state)`

Hook appelé quand l'état d'attente de l'UI change ; exécute l'action différée en attente, quel que soit l'état.

- `state` (*any*) : État d'attente (non utilisé).

#### `ui_vehicleSelector_vehicleOperations.setCustomDetailsButtons(buttons)`

Mémorise une liste de boutons personnalisés (mode défi).

- `buttons` (*table|nil*) : Boutons personnalisés.

#### `ui_vehicleSelector_vehicleOperations.setDetailsButtonForFreeroam(enabled)`

Mémorise un indicateur freeroam pour le bouton de détails.

- `enabled` (*boolean*) : Valeur mémorisée dans M.detailsButtonForFreeroam.

#### `ui_vehicleSelector_vehicleOperations.setManagementButtonsEnabled(enabled)`

Active ou désactive la création des boutons de gestion.

- `enabled` (*boolean*) : true pour les afficher.

## Champs

| Champ | Type | Description |
|---|---|---|
| `managementButtonsEnabled` | boolean | true par défaut ; si false, getManagementDetails ne crée aucun bouton. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onVehicleSelectorCloneCurrent`
- `onVehicleSelectorLoadDefault`
- `onVehicleSelectorRemoveAll`
- `onVehicleSelectorRemoveCurrent`
- `onVehicleSelectorRemoveOthers`
- `onVehicleSelectorReplaceCurrent` — écouté par 1 module(s)
- `onVehicleSelectorReplaceCurrentRequested`
- `onVehicleSelectorResetAll`
- `onVehicleSelectorSelectRandom`
- `onVehicleSelectorSetAsDefault`
- `onVehicleSelectorSpawnNew` — écouté par 1 module(s)
- `onVehicleSelectorSpawnNewRequested`
- `trackNewVeh`
- `trackVehReset`

**Évènements UI (guihooks.trigger) :** `app:waiting`

## Appels vers le moteur (C++)

- `be:` `getObject`, `getObjectCount`, `getPlayerVehicle`, `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua`.*
