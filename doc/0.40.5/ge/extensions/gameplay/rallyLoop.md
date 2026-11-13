# `gameplay_rallyLoop`

*Fichier : `lua/ge/extensions/gameplay/rallyLoop.lua` · VM : Game Engine (GE) · 394 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rallyLoop` : `extensions.load("gameplay_rallyLoop")`, puis la globale `gameplay_rallyLoop`

Extension façade du mode « boucle de rallye » (enchaînement service, liaison, spéciales). Elle possède l'instance de RallyLoopManager (loop/rallyLoopManager) créée par setup(missionId, missionDir), lui relaie les mises à jour et les hooks du jeu, et publie chaque image le flux UI « rallyLoop » via guihooks.queueStream. Sans manager, elle publie le flux du StandaloneFallbackStream (mode `standaloneUiBridge`) ; getRuntimeMode renvoie 'rallyLoop', 'standaloneUiBridge' ou 'idle'. Elle héberge aussi la fenêtre imgui « Loop Toolbox » de debug.

## Exemple

```lua
gameplay_rallyLoop.setup(missionId, missionDir)
print(gameplay_rallyLoop.getRuntimeMode()) -- 'rallyLoop'
gameplay_rallyLoop.unload()
```

## Remarques

- Le compte à rebours du flux UI est masqué (activeState remplacé par inactive, countdownData supprimé) si le réglage `rallyStartCountdownDisplay` n'est pas '2d' et que l'horloge 3D est disponible (ou que le réglage vaut autre chose que '3d').
- handleGOTO : la branche par défaut appelle rallyLoopManager:startNextMission() même si rallyLoopManager est nil, ce qui provoque une erreur dans ce cas.
- Pour 'abandon' d'une mission en cours (onAnyMissionWillChange avec state 'stopped' et abandoned), une tentative DNF est enregistrée sauf si la mission courante est 'serviceOut'.
- La plupart des accesseurs renvoient une valeur neutre (false, nil, 0) quand aucun manager n'existe.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rallyLoop.addTestPenalty(amount)` | Enregistre une pénalité de test dans le manager (recordTestPenalty). | 324 |
| `gameplay_rallyLoop.drawDebug(zOnTop, drawRoute, drawLabels)` | Délègue le dessin de debug au manager. | 205 |
| `gameplay_rallyLoop.getDebugLogging()` | État du log de debug. | 278 |
| `gameplay_rallyLoop.getDrawFlag(flagName)` | Lit un indicateur de dessin de debug du manager. | 374 |
| `gameplay_rallyLoop.getLoopToolbox()` | Objet LoopToolbox courant. | 201 |
| `gameplay_rallyLoop.getManager()` | Instance RallyLoopManager courante. | 368 |
| `gameplay_rallyLoop.getMissionExecutionTransferFlag()` | Lit l'indicateur de transfert d'exécution. | 296 |
| `gameplay_rallyLoop.getNextMissionId()` | Id de la prochaine mission de la boucle. | 303 |
| `gameplay_rallyLoop.getRuntimeMode()` | Mode d'exécution courant. | 83 |
| `gameplay_rallyLoop.getSSRescheduleCount()` | Nombre de reprogrammations de spéciale (SS) du manager. | 387 |
| `gameplay_rallyLoop.handleGOTO(gotoRallyLoop)` | Traite une demande de navigation depuis l'UI : 'restart' relance la boucle, 'abandon' retourne instantanément à la boucle, 'postServiceIn' et tout autre valeur démarrent la mission suivante. | 331 |
| `gameplay_rallyLoop.isLoopToolboxVisible()` | Indique si la fenêtre Loop Toolbox est affichée. | 283 |
| `gameplay_rallyLoop.isReady()` | API publique : vrai si un manager existe. | 75 |
| `gameplay_rallyLoop.onAnyMissionWillChange(state, mission, abandoned)` | Hook appelé avant tout changement d'état de mission. Supprime l'exclusion de trafic du manager et enregistre un DNF en cas d'abandon (sauf en serviceOut). *(interne)* *(hook)* | 351 |
| `gameplay_rallyLoop.onCreatedRallyGroundMarkerRoute()` | Hook appelé quand la route des marqueurs au sol est créée ; relayé au manager. *(interne)* *(hook)* | 239 |
| `gameplay_rallyLoop.onExtensionLoaded()` | Hook de chargement ; n'écrit qu'un log si debugLogging est actif. *(interne)* *(hook)* | 161 |
| `gameplay_rallyLoop.onExtensionUnloaded()` | Hook de déchargement : publie un flux {activeState = inactive} et vide le flux de repli. *(interne)* *(hook)* | 169 |
| `gameplay_rallyLoop.onGameplayInteract()` | Hook d'interaction gameplay ; appelle manager:onRallyModeInteract(). *(interne)* *(hook)* | 219 |
| `gameplay_rallyLoop.onGuiUpdate(dtReal, dtSim, dtRaw)` | Hook appelé à chaque mise à jour GUI ; relayé au manager. *(interne)* *(hook)* | 136 |
| `gameplay_rallyLoop.onRallyDataUpdated(data)` | Hook émis quand les données de rallye changent ; relayé au manager, sinon au flux de repli. *(interne)* *(hook)* | 211 |
| `gameplay_rallyLoop.onRallyRouteRecoveryComplete(data)` | Hook appelé quand la récupération de route est terminée ; relayé au manager s'il gère le hook. *(interne)* *(hook)* | 251 |
| `gameplay_rallyLoop.onRallyVehicleRecovery(recoveryType)` | Hook appelé lors d'une récupération du véhicule ; appelle manager:trackRecovery. *(interne)* *(hook)* | 245 |
| `gameplay_rallyLoop.onRecalculatedRoute()` | Hook appelé quand la route a été recalculée ; relayé au manager. *(interne)* *(hook)* | 233 |
| `gameplay_rallyLoop.onSettingsChanged()` | Hook appelé quand les réglages changent ; relayé au manager (s'il gère le hook) et au flux de repli. *(interne)* *(hook)* | 185 |
| `gameplay_rallyLoop.onUIStartButtonClicked()` | Hook appelé quand le bouton de départ de l'UI est cliqué ; relayé au manager. *(interne)* *(hook)* | 227 |
| `gameplay_rallyLoop.onUpdate(dtReal, dtSim, dtRaw)` | Hook d'extension appelé chaque image. Met à jour le manager et publie le flux 'rallyLoop' ; gère aussi la fenêtre Loop Toolbox. *(interne)* *(hook)* | 101 |
| `gameplay_rallyLoop.setDebugLogging(val)` | Active le log de debug. | 279 |
| `gameplay_rallyLoop.setDrawFlag(flagName, value)` | Fixe un indicateur de dessin de debug du manager. | 381 |
| `gameplay_rallyLoop.setMissionExecutionTransferFlag(val)` | Fixe l'indicateur de transfert d'exécution de mission du manager. | 291 |
| `gameplay_rallyLoop.setup(missionId, missionDir)` | Crée le RallyLoopManager pour la mission et vide le flux de repli. | 64 |
| `gameplay_rallyLoop.setupForNewMission()` | Prépare le manager pour la mission suivante (manager:setupForNewMission). | 285 |
| `gameplay_rallyLoop.skipLiaisonForTesting(options)` | Aide de test : saute la liaison. | 317 |
| `gameplay_rallyLoop.startNextMission()` | Démarre la mission suivante de la boucle. | 310 |
| `gameplay_rallyLoop.toggleDebug()` | Affiche ou masque la fenêtre Loop Toolbox. | 193 |
| `gameplay_rallyLoop.unload()` | Détruit le manager et vide le flux de repli. | 69 |

### Détail des paramètres

#### `gameplay_rallyLoop.addTestPenalty(amount)`

Enregistre une pénalité de test dans le manager (recordTestPenalty).

- `amount` (*number*) : Montant de la pénalité (unité déduite du code : temps).
- **renvoie** : boolean|any Résultat du manager, ou false et 'no rally loop manager'.

#### `gameplay_rallyLoop.drawDebug(zOnTop, drawRoute, drawLabels)`

Délègue le dessin de debug au manager.

- `zOnTop` (*boolean*) : Dessiner au premier plan.
- `drawRoute` (*boolean*) : Dessiner la route.
- `drawLabels` (*boolean*) : Dessiner les étiquettes.

#### `gameplay_rallyLoop.getDebugLogging()`

État du log de debug.

- **renvoie** : boolean debugLogging.

#### `gameplay_rallyLoop.getDrawFlag(flagName)`

Lit un indicateur de dessin de debug du manager.

- `flagName` (*string*) : Nom de l'indicateur.
- **renvoie** : boolean false sans manager.

#### `gameplay_rallyLoop.getLoopToolbox()`

Objet LoopToolbox courant.

- **renvoie** : table|nil Toolbox, nil si la fenêtre n'a jamais été ouverte ou est fermée.

#### `gameplay_rallyLoop.getManager()`

Instance RallyLoopManager courante.

- **renvoie** : table|nil Manager.

#### `gameplay_rallyLoop.getMissionExecutionTransferFlag()`

Lit l'indicateur de transfert d'exécution.

- **renvoie** : boolean false sans manager.

#### `gameplay_rallyLoop.getNextMissionId()`

Id de la prochaine mission de la boucle.

- **renvoie** : string|nil Id, nil sans manager.

#### `gameplay_rallyLoop.getRuntimeMode()`

Mode d'exécution courant.

- **renvoie** : string 'rallyLoop', 'standaloneUiBridge' ou 'idle'.

#### `gameplay_rallyLoop.getSSRescheduleCount()`

Nombre de reprogrammations de spéciale (SS) du manager.

- **renvoie** : integer 0 sans manager.

#### `gameplay_rallyLoop.handleGOTO(gotoRallyLoop)`

Traite une demande de navigation depuis l'UI : 'restart' relance la boucle, 'abandon' retourne instantanément à la boucle, 'postServiceIn' et tout autre valeur démarrent la mission suivante.

- `gotoRallyLoop` (*string*) : 'restart', 'abandon', 'postServiceIn' ou autre.

#### `gameplay_rallyLoop.isLoopToolboxVisible()`

Indique si la fenêtre Loop Toolbox est affichée.

- **renvoie** : boolean Visibilité.

#### `gameplay_rallyLoop.isReady()`

API publique : vrai si un manager existe.

- **renvoie** : boolean true après setup.

#### `gameplay_rallyLoop.onAnyMissionWillChange(state, mission, abandoned)`

Hook appelé avant tout changement d'état de mission. Supprime l'exclusion de trafic du manager et enregistre un DNF en cas d'abandon (sauf en serviceOut).

- `state` (*string*) : Nouvel état de la mission (ex. 'stopped').
- `mission` (*table|nil*) : Mission concernée.
- `abandoned` (*boolean*) : true si la mission est abandonnée.

#### `gameplay_rallyLoop.onGuiUpdate(dtReal, dtSim, dtRaw)`

Hook appelé à chaque mise à jour GUI ; relayé au manager.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulé (s).
- `dtRaw` (*number*) : Delta temps brut (s).

#### `gameplay_rallyLoop.onRallyDataUpdated(data)`

Hook émis quand les données de rallye changent ; relayé au manager, sinon au flux de repli.

- `data` (*table*) : Données de rallye.

#### `gameplay_rallyLoop.onRallyRouteRecoveryComplete(data)`

Hook appelé quand la récupération de route est terminée ; relayé au manager s'il gère le hook.

- `data` (*table*) : Données de la récupération.

#### `gameplay_rallyLoop.onRallyVehicleRecovery(recoveryType)`

Hook appelé lors d'une récupération du véhicule ; appelle manager:trackRecovery.

- `recoveryType` (*string*) : Type de récupération.

#### `gameplay_rallyLoop.onUpdate(dtReal, dtSim, dtRaw)`

Hook d'extension appelé chaque image. Met à jour le manager et publie le flux 'rallyLoop' ; gère aussi la fenêtre Loop Toolbox.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulé (s).
- `dtRaw` (*number*) : Delta temps brut (s).

#### `gameplay_rallyLoop.setDebugLogging(val)`

Active le log de debug.

- `val` (*boolean*) : Nouvelle valeur.

#### `gameplay_rallyLoop.setDrawFlag(flagName, value)`

Fixe un indicateur de dessin de debug du manager.

- `flagName` (*string*) : Nom de l'indicateur.
- `value` (*boolean*) : Valeur.

#### `gameplay_rallyLoop.setMissionExecutionTransferFlag(val)`

Fixe l'indicateur de transfert d'exécution de mission du manager.

- `val` (*boolean*) : Valeur.

#### `gameplay_rallyLoop.setup(missionId, missionDir)`

Crée le RallyLoopManager pour la mission et vide le flux de repli.

- `missionId` (*string*) : Id de la mission boucle.
- `missionDir` (*string*) : Dossier de la mission.

#### `gameplay_rallyLoop.skipLiaisonForTesting(options)`

Aide de test : saute la liaison.

- `options` (*table|nil*) : Options transmises au manager (déduit du code).
- **renvoie** : boolean Succès.
- **renvoie** : string|nil 'no rally loop manager' sans manager.

#### `gameplay_rallyLoop.startNextMission()`

Démarre la mission suivante de la boucle.

- **renvoie** : any Résultat du manager (false sans manager).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rallyLoop.lua`.*
