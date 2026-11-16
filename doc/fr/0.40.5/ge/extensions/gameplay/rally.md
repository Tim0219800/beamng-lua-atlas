# `gameplay_rally`

*Fichier : `lua/ge/extensions/gameplay/rally.lua` · VM : Game Engine (GE) · 538 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally` : `extensions.load("gameplay_rally")`, puis la globale `gameplay_rally`

Point d'entrée du mode rallye (extension gameplay_rally). Il possède le gestionnaire de rallye (RallyManager) chargé pour une mission, relaye les mises à jour vers l'application de reconnaissance (RecceApp) et vers le gestionnaire, fournit la boîte à outils de debug (ImGui), place un copilote fictif dans le siège miroir du conducteur, transmet les actions d'entrée (reconnaissance, calage du copilote) et gère la couleur de thème des flux d'interface. Un moddeur de rallye l'utilise pour charger/décharger un rallye, lire son état ou régler le calage du copilote.

## Exemple

```lua
local ok, err = gameplay_rally.loadMission(missionId, missionDir, nil, nil, {owner = 'mission'})
if gameplay_rally.isReady() then local rm = gameplay_rally.getRallyManager() end
gameplay_rally.setUiColor('#ff0000')
```

## Remarques

- Propriétaire du gestionnaire (options.owner) : 'mission', 'recce' ou 'external' (défaut). Un propriétaire 'mission' est toujours autorisé ; 'recce' seulement en freeroam ; les autres sont refusés si une mission est au premier plan ou si le gestionnaire appartient à une mission.
- loadMission et unloadMission renvoient false et une raison quand l'opération est refusée ou échoue ; getErrorMsgForUser conserve le message destiné à l'utilisateur.
- Le copilote fictif n'est placé que si le propriétaire est 'mission' : siège miroir du conducteur (L<->R) via gameplay_seatOccupants, replacé aux hooks onSeatOccupantEnter/Exit.
- onUpdate ne met pas à jour le gestionnaire pendant l'enregistrement de la reconnaissance (RecceApp.isRecording).
- Le mode d'autorité du runtime d'étape vaut 'shadow' par défaut quand aucun gestionnaire n'est chargé.
- Les réglages Booléens de mission (rallyRepairVehicleOnRecovery) sont lus dans mission.lastUserSettings, puis dans les réglages du jeu, puis la valeur par défaut true.
- Le fichier contient beaucoup de hooks commentés (onRaceStarted, onRallyStageStart…) : seuls ceux listés ici sont actifs.
- Le calage du copilote se règle par pas de 0,1 s (CodriverTiming.nudge) et affiche un message UI (catégorie 'rally').

**Dépendances (chargées avant) :** `gameplay_seatOccupants`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally.actionCodriverCallsEarlier()` | Action d'entrée : avance les annonces du copilote de 0,1 s (décale la plage de délai) et affiche un message. | 307 |
| `gameplay_rally.actionCodriverCallsLater()` | Action d'entrée : retarde les annonces du copilote de 0,1 s et affiche un message. | 311 |
| `gameplay_rally.actionRecceMoveVehicleBackward()` | Action d'entrée : si la reconnaissance est active, envoie rallyInputActionRecceMoveVehicleBackward à l'UI. | 266 |
| `gameplay_rally.actionRecceMoveVehicleForward()` | Action d'entrée : si la reconnaissance est active, envoie rallyInputActionRecceMoveVehicleForward à l'UI. | 261 |
| `gameplay_rally.actionToggleMouseLikeVehicle()` | Action d'entrée : bascule la souris comme un véhicule dans la reconnaissance (si RecceApp est activée). | 252 |
| `gameplay_rally.actionTranscribeRecordingCut()` | Action d'entrée : envoie à l'UI rallyInputActionCutRecording (coupe l'enregistrement de transcription). | 257 |
| `gameplay_rally.canManageMission(owner)` | Indique si le propriétaire donné a le droit de gérer le gestionnaire de rallye. | 79 |
| `gameplay_rally.enableRecceApp(val)` | Active ou désactive l'application de reconnaissance (RecceApp.setEnabled). | 179 |
| `gameplay_rally.getDebugLogging()` | Indique si les logs de debug du rallye sont actifs. | 457 |
| `gameplay_rally.getErrorMsgForUser()` | Dernier message d'erreur destiné à l'utilisateur (échec de chargement). | 432 |
| `gameplay_rally.getRace()` | Données de course enregistrées par le hook onRallyRegisterRace. | 498 |
| `gameplay_rally.getRallyManager()` | Gestionnaire de rallye courant. | 430 |
| `gameplay_rally.getRallyManagerOwner()` | Propriétaire du gestionnaire courant. | 431 |
| `gameplay_rally.getRallyToolbox()` | Objet de la boîte à outils de debug (nil tant que toggleDebug n'a pas été appelé). | 303 |
| `gameplay_rally.getRecoveryRepairVehicle()` | Indique si le véhicule doit être réparé lors d'une récupération : demande au gestionnaire de boucle (gameplay_rallyLoop) s'il existe, sinon lit rallyRepairVehicleOnRecovery (réglage de mission, puis réglage du jeu, défaut true). | 433 |
| `gameplay_rally.getStageObserverState()` | État de l'observateur d'étape du gestionnaire. | 452 |
| `gameplay_rally.getStageRuntimeAuthorityMode()` | Mode d'autorité du runtime d'étape du gestionnaire, ou 'shadow' sans gestionnaire. | 449 |
| `gameplay_rally.getUiColor()` | Couleur de thème actuelle : surcharge si définie, sinon couleur du gestionnaire de boucle (gameplay_rallyLoop), sinon du flux autonome, sinon '#009a1a'. | 487 |
| `gameplay_rally.getUiColorOverride()` | Surcharge de couleur définie par setUiColor. | 490 |
| `gameplay_rally.isRallyToolboxVisible()` | Indique si la fenêtre Rally Toolbox est ouverte. | 496 |
| `gameplay_rally.isReady()` | Indique si un gestionnaire de rallye est chargé. | 171 |
| `gameplay_rally.loadMission(missionId, missionDir, drivelineMode, voicepackPick, options)` | Crée un RallyManager pour le dossier de mission, règle le voicepack, reconstruit les assets et, en cas de succès, le met en place et place le copilote. Ne remplace pas l'ancien gestionnaire en cas d'échec. | 130 |
| `gameplay_rally.onExtensionLoaded()` | Hook de chargement : charge ExtHelper et envoie rally.onExtensionLoaded à l'UI. *(interne)* *(hook)* | 233 |
| `gameplay_rally.onExtensionUnloaded()` | Hook de déchargement : retire le copilote fictif et décharge ExtHelper. *(interne)* *(hook)* | 240 |
| `gameplay_rally.onRacePathnodeReached(event)` | Hook de course : enregistre un temps intermédiaire (recordSplit) pour le pathnode atteint ; logue un avertissement si event.pathnode manque. *(interne)* *(hook)* | 320 |
| `gameplay_rally.onRallyRegisterRace(raceData)` | Hook : mémorise les données de course et les transmet au gestionnaire (setRaceData). *(interne)* *(hook)* | 380 |
| `gameplay_rally.onRallyVehicleRecovery(recoveryType)` | Hook : ajoute le temps de récupération au gestionnaire (addRecoveryRaceTime). *(interne)* *(hook)* | 388 |
| `gameplay_rally.onSeatOccupantEnter()` | Hook de siège : replace le copilote fictif (alias de la fonction interne seatCodriver). *(interne)* *(hook)* | 111 |
| `gameplay_rally.onSeatOccupantExit()` | Hook de siège : replace le copilote fictif après un départ d'occupant (le système de sièges supprime les occupants fictifs lors des respawns de configuration). *(interne)* *(hook)* | 111 |
| `gameplay_rally.onSettingsChanged()` | Hook de changement de réglages : prévient le gestionnaire de rallye. *(interne)* *(hook)* | 417 |
| `gameplay_rally.onUpdate(dtReal, dtSim, dtRaw)` | Appelé à chaque image : met à jour RecceApp et le gestionnaire de rallye (sauf pendant l'enregistrement de reconnaissance) et dessine la Rally Toolbox si visible. *(interne)* *(hook)* | 183 |
| `gameplay_rally.onVehicleResetted(vehicleID)` | Hook : quand le véhicule du joueur 0 est réinitialisé, prévient le gestionnaire de rallye. *(interne)* *(hook)* | 210 |
| `gameplay_rally.setDebugLogging(val)` | Active ou désactive les logs de debug du rallye. | 458 |
| `gameplay_rally.setStageRuntimeAuthorityMode(mode)` | Transmet au gestionnaire le mode d'autorité du runtime d'étape. | 444 |
| `gameplay_rally.setUiColor(hex)` | Surcharge la couleur du thème des flux Stage Timing / Progress. nil ou chaîne vide efface la surcharge. | 484 |
| `gameplay_rally.toggleDebug()` | Affiche ou masque la fenêtre ImGui « Rally Toolbox » (créée au premier appel). | 291 |
| `gameplay_rally.unloadMission(options)` | Décharge le gestionnaire de rallye si le propriétaire correspond. | 156 |

### Détail des paramètres

#### `gameplay_rally.canManageMission(owner)`

Indique si le propriétaire donné a le droit de gérer le gestionnaire de rallye.

- `owner` (*string|nil*) : 'mission', 'recce' ou 'external' (défaut).
- **renvoie** : boolean true si autorisé.
- **renvoie** : string|nil Raison du refus.

#### `gameplay_rally.enableRecceApp(val)`

Active ou désactive l'application de reconnaissance (RecceApp.setEnabled).

- `val` (*boolean*) : true pour activer.

#### `gameplay_rally.getDebugLogging()`

Indique si les logs de debug du rallye sont actifs.

- **renvoie** : boolean true si actifs.

#### `gameplay_rally.getErrorMsgForUser()`

Dernier message d'erreur destiné à l'utilisateur (échec de chargement).

- **renvoie** : string|nil Message.

#### `gameplay_rally.getRace()`

Données de course enregistrées par le hook onRallyRegisterRace.

- **renvoie** : table|nil raceData.

#### `gameplay_rally.getRallyManager()`

Gestionnaire de rallye courant.

- **renvoie** : table|nil RallyManager ou nil.

#### `gameplay_rally.getRallyManagerOwner()`

Propriétaire du gestionnaire courant.

- **renvoie** : string|nil 'mission', 'recce', 'external' ou nil.

#### `gameplay_rally.getRallyToolbox()`

Objet de la boîte à outils de debug (nil tant que toggleDebug n'a pas été appelé).

- **renvoie** : table|nil RallyToolbox.

#### `gameplay_rally.getRecoveryRepairVehicle()`

Indique si le véhicule doit être réparé lors d'une récupération : demande au gestionnaire de boucle (gameplay_rallyLoop) s'il existe, sinon lit rallyRepairVehicleOnRecovery (réglage de mission, puis réglage du jeu, défaut true).

- **renvoie** : boolean true si réparation.

#### `gameplay_rally.getStageObserverState()`

État de l'observateur d'étape du gestionnaire.

- **renvoie** : table|nil État, nil sans gestionnaire.

#### `gameplay_rally.getStageRuntimeAuthorityMode()`

Mode d'autorité du runtime d'étape du gestionnaire, ou 'shadow' sans gestionnaire.

- **renvoie** : string Mode.

#### `gameplay_rally.getUiColor()`

Couleur de thème actuelle : surcharge si définie, sinon couleur du gestionnaire de boucle (gameplay_rallyLoop), sinon du flux autonome, sinon '#009a1a'.

- **renvoie** : string Couleur hexadécimale.

#### `gameplay_rally.getUiColorOverride()`

Surcharge de couleur définie par setUiColor.

- **renvoie** : string|nil Couleur ou nil.

#### `gameplay_rally.isRallyToolboxVisible()`

Indique si la fenêtre Rally Toolbox est ouverte.

- **renvoie** : boolean true si visible.

#### `gameplay_rally.isReady()`

Indique si un gestionnaire de rallye est chargé.

- **renvoie** : boolean true si chargé.

#### `gameplay_rally.loadMission(missionId, missionDir, drivelineMode, voicepackPick, options)`

Crée un RallyManager pour le dossier de mission, règle le voicepack, reconstruit les assets et, en cas de succès, le met en place et place le copilote. Ne remplace pas l'ancien gestionnaire en cas d'échec.

- `missionId` (*string*) : Id de la mission.
- `missionDir` (*string*) : Dossier de la mission de rallye.
- `drivelineMode` (*any*) : Non utilisé (code commenté).
- `voicepackPick` (*any*) : Voicepack ; nil = choix lu dans les réglages utilisateur de la mission (rallyVoicepackPick).
- `options` (*table|nil*) : owner : 'mission', 'recce' ou 'external'.
- **renvoie** : boolean true si chargé.
- **renvoie** : string|nil Message d'erreur en cas d'échec.

#### `gameplay_rally.onRacePathnodeReached(event)`

Hook de course : enregistre un temps intermédiaire (recordSplit) pour le pathnode atteint ; logue un avertissement si event.pathnode manque.

- `event` (*table*) : {pathnode, time, race}

#### `gameplay_rally.onRallyRegisterRace(raceData)`

Hook : mémorise les données de course et les transmet au gestionnaire (setRaceData).

- `raceData` (*table*) : Données de la course.

#### `gameplay_rally.onRallyVehicleRecovery(recoveryType)`

Hook : ajoute le temps de récupération au gestionnaire (addRecoveryRaceTime).

- `recoveryType` (*string*) : Type de récupération.

#### `gameplay_rally.onUpdate(dtReal, dtSim, dtRaw)`

Appelé à chaque image : met à jour RecceApp et le gestionnaire de rallye (sauf pendant l'enregistrement de reconnaissance) et dessine la Rally Toolbox si visible.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulé (s).
- `dtRaw` (*number*) : Delta temps brut (s).

#### `gameplay_rally.onVehicleResetted(vehicleID)`

Hook : quand le véhicule du joueur 0 est réinitialisé, prévient le gestionnaire de rallye.

- `vehicleID` (*integer*) : Véhicule réinitialisé.

#### `gameplay_rally.setDebugLogging(val)`

Active ou désactive les logs de debug du rallye.

- `val` (*boolean*) : Nouvel état.

#### `gameplay_rally.setStageRuntimeAuthorityMode(mode)`

Transmet au gestionnaire le mode d'autorité du runtime d'étape.

- `mode` (*string*) : Mode (valeur par défaut 'shadow' ; autres valeurs définies par le gestionnaire).

#### `gameplay_rally.setUiColor(hex)`

Surcharge la couleur du thème des flux Stage Timing / Progress. nil ou chaîne vide efface la surcharge.

- `hex` (*string|nil*) : Couleur hexadécimale, ex. '#ff0000'.

#### `gameplay_rally.unloadMission(options)`

Décharge le gestionnaire de rallye si le propriétaire correspond.

- `options` (*table|nil*) : owner (défaut 'external').
- **renvoie** : boolean true si déchargé.
- **renvoie** : string|nil Raison du refus.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'gameplay_seatOccupants'}, extension chargée avant. |
| `recceApp` | table | Module RecceApp (application de reconnaissance de rallye) exposé tel quel. |

**Évènements UI (guihooks.trigger) :** `Message`, `rally.onExtensionLoaded`, `rallyInputActionCutRecording`, `rallyInputActionRecceMoveVehicleBackward`, `rallyInputActionRecceMoveVehicleForward`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally.lua`.*
