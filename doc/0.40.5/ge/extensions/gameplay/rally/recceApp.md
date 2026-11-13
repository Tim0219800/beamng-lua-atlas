# `gameplay_rally_recceApp`

*Fichier : `lua/ge/extensions/gameplay/rally/recceApp.lua` · VM : Game Engine (GE) · 775 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_recceApp` : `extensions.load("gameplay_rally_recceApp")`, puis la globale `gameplay_rally_recceApp`

Application « Recce » du rallye en freeroam : permet de charger une mission de rallye (rallyStage, rallyStageLoop ou rallyRoadSection du niveau courant), d'afficher les pacenotes à venir, de téléporter le véhicule le long des pacenotes, au départ ou au déclencheur de mission, et d'enregistrer une reconnaissance (driveline du véhicule et « cuts » vocaux). Fournit aussi une fenêtre imgui « Recce Toolbox » dessinée dans onUpdate. S'appuie sur gameplay_rally (loadMission, getRallyManager, canManageMission), RecceSettings, VehicleCapture et CutCapture. Ne fait rien dans onUpdate tant que setEnabled(true) n'a pas été appelé.

## Exemple

```lua
extensions.load('gameplay_rally_recceApp')
gameplay_rally_recceApp.openWindow()
-- puis, dans la fenêtre ou en Lua :
gameplay_rally_recceApp.recordDrivelineStart(false)
gameplay_rally_recceApp.recordDrivelineCut()
gameplay_rally_recceApp.recordDrivelineStop()
```

## Remarques

- Les enregistrements (VehicleCapture / CutCapture) ne sont créés que si l'état de jeu est « freeroam » et que le gestionnaire de rallye a un dossier de mission ; sinon vehicleCapture et cutCapture restent nil.
- Bug potentiel : recordDrivelineClearAll appelle vehicleCapture:truncateCapturesFile() sans tester que initCaptures a bien créé les captures ; hors freeroam ou sans mission chargée, cela provoque une erreur sur nil.
- recordDrivelineCut ne transcrit la voix que si recordVoice a été passé à true lors de recordDrivelineStart ; en cas d'échec de extensions.gameplay_rally_client.transcribe_recording_cut, le hook UI rallyInputActionDesktopCallNotOk reçoit le message client.
- moveVehicleToPacenoteV2 (utilisée par moveVehicleForward/Backward) cherche la corner start la plus proche par kd-tree ; si le véhicule est à moins de 12 m (10 + 2) d'une pacenote, il va à la suivante ou la précédente, sinon à la plus proche. Il place le véhicule 10 m avant la pacenote sur la driveline.
- Le code contient un bloc de code commenté (idée d'une application tout-imgui) sans effet.
- Évènements UI émis : rally.recceApp.missionLoaded (succès, message d'erreur), rally.recceApp.refreshed (liste des missions, dernier état), rallyInputActionDesktopCallNotOk.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_recceApp.closeWindow()` | Ferme la fenêtre imgui (sans désactiver l'application). | 522 |
| `gameplay_rally_recceApp.isEnabled()` | Indique si l'application est activée. | 80 |
| `gameplay_rally_recceApp.isRecording()` | Indique si un enregistrement de driveline est en cours. | 764 |
| `gameplay_rally_recceApp.isWindowVisible()` | Indique si la fenêtre imgui est ouverte. | 770 |
| `gameplay_rally_recceApp.loadMission(missionId, missionDir)` | Charge une mission via gameplay_rally.loadMission (propriétaire 'recce'), construit l'index kd-tree des départs de virage du notebook, mémorise la mission et l'état de chargement, puis envoie rally.recceApp.missionLoaded. | 113 |
| `gameplay_rally_recceApp.moveVehicleBackward()` | Téléporte le véhicule joueur vers la pacenote précédente (ou la plus proche si loin de toute pacenote), puis resynchronise le rally manager. | 301 |
| `gameplay_rally_recceApp.moveVehicleForward()` | Téléporte le véhicule joueur vers la pacenote suivante (ou la plus proche si loin de toute pacenote), puis resynchronise le rally manager. | 297 |
| `gameplay_rally_recceApp.moveVehicleToMission()` | Téléporte le véhicule joueur sur le déclencheur de départ de la mission (pos, rot), puis resynchronise le rally manager. | 305 |
| `gameplay_rally_recceApp.moveVehicleToStart()` | Téléporte le véhicule joueur à la position de départ par défaut du chemin de course (orientation retournée de 180°), puis resynchronise le rally manager. | 212 |
| `gameplay_rally_recceApp.onUpdate(dtReal, dtSim, dtRaw)` | Hook d'extension appelé à chaque frame : si l'application est activée, dessine les pacenotes (ou la route courte), la fenêtre imgui si ouverte, et capture la position du véhicule pendant l'enregistrement de driveline. *(interne)* *(hook)* | 329 |
| `gameplay_rally_recceApp.openWindow()` | Active l'application, ouvre la fenêtre imgui « Recce Toolbox » et rafraîchit la liste des missions. | 516 |
| `gameplay_rally_recceApp.recordDrivelineClearAll()` | Efface les fichiers d'enregistrement de la mission : driveline, cuts et transcripts (troncature des fichiers). | 397 |
| `gameplay_rally_recceApp.recordDrivelineCut()` | Enregistre un cut à la position actuelle du véhicule (CutCapture) et, si l'enregistrement vocal est activé, demande la transcription au client rally. | 354 |
| `gameplay_rally_recceApp.recordDrivelineStart(recordVoice)` | Démarre l'enregistrement de la driveline : initialise les captures (dossiers de recce créés si besoin) et active la capture à chaque frame. | 372 |
| `gameplay_rally_recceApp.recordDrivelineStop()` | Arrête l'enregistrement : écrit les captures du véhicule sur disque puis oublie les captures. | 382 |
| `gameplay_rally_recceApp.release()` | Désactive l'application, ferme la fenêtre, oublie les captures et décharge la mission si elle appartient à 'recce'. | 178 |
| `gameplay_rally_recceApp.reload(rallyExt)` | Recharge les réglages RecceSettings, reconstruit la liste des missions de rallye du niveau et envoie le hook UI rally.recceApp.refreshed avec {missions, last_mission_id, last_load_state, can_auto_load, corner_angles_style}. | 492 |
| `gameplay_rally_recceApp.setEnabled(val)` | Active ou désactive l'application ; onUpdate ne fait rien si elle est désactivée. | 76 |
| `gameplay_rally_recceApp.setLastLoadState(state)` | Mémorise dans les réglages le dernier état de chargement (true/false) pour le niveau courant. | 107 |
| `gameplay_rally_recceApp.setLastMissionId(mid)` | Mémorise dans les réglages le dernier id de mission pour le niveau courant. | 101 |
| `gameplay_rally_recceApp.setShowNotes(val)` | Active ou désactive l'affichage des prochaines pacenotes pendant la conduite (hors éditeur actif et hors boîte à outils rally visible). | 342 |
| `gameplay_rally_recceApp.toggleDebug()` | Bascule le mode debug de gameplay_rally (gameplay_rally.toggleDebug). | 416 |
| `gameplay_rally_recceApp.toggleMouseLikeVehicle()` | Bascule la case de déplacement du véhicule à la souris de la boîte à outils rally, si elle existe. | 633 |
| `gameplay_rally_recceApp.toggleWindow()` | Ouvre la fenêtre si elle est fermée, la ferme sinon. | 526 |
| `gameplay_rally_recceApp.unloadMission()` | Décharge la mission du propriétaire 'recce' et mémorise l'état de chargement à false. | 167 |

### Détail des paramètres

#### `gameplay_rally_recceApp.isEnabled()`

Indique si l'application est activée.

- **renvoie** : boolean état activé

#### `gameplay_rally_recceApp.isRecording()`

Indique si un enregistrement de driveline est en cours.

- **renvoie** : boolean true pendant l'enregistrement

#### `gameplay_rally_recceApp.isWindowVisible()`

Indique si la fenêtre imgui est ouverte.

- **renvoie** : boolean true si ouverte

#### `gameplay_rally_recceApp.loadMission(missionId, missionDir)`

Charge une mission via gameplay_rally.loadMission (propriétaire 'recce'), construit l'index kd-tree des départs de virage du notebook, mémorise la mission et l'état de chargement, puis envoie rally.recceApp.missionLoaded.

- `missionId` (*string*) : Identifiant de la mission
- `missionDir` (*string*) : Dossier de la mission
- **renvoie** : boolean true si la mission est chargée
- **renvoie** : string|nil Message d'erreur en cas d'échec

#### `gameplay_rally_recceApp.onUpdate(dtReal, dtSim, dtRaw)`

Hook d'extension appelé à chaque frame : si l'application est activée, dessine les pacenotes (ou la route courte), la fenêtre imgui si ouverte, et capture la position du véhicule pendant l'enregistrement de driveline.

- `dtReal` (*number*) : Temps réel écoulé (s)
- `dtSim` (*number*) : Temps de simulation écoulé (s)
- `dtRaw` (*number*) : Temps brut écoulé (s)

#### `gameplay_rally_recceApp.recordDrivelineStart(recordVoice)`

Démarre l'enregistrement de la driveline : initialise les captures (dossiers de recce créés si besoin) et active la capture à chaque frame.

- `recordVoice` (*boolean*) : true pour aussi transcrire la voix à chaque cut

#### `gameplay_rally_recceApp.reload(rallyExt)`

Recharge les réglages RecceSettings, reconstruit la liste des missions de rallye du niveau et envoie le hook UI rally.recceApp.refreshed avec {missions, last_mission_id, last_load_state, can_auto_load, corner_angles_style}.

- `rallyExt` (*any*) : Non utilisé dans le corps de la fonction

#### `gameplay_rally_recceApp.setEnabled(val)`

Active ou désactive l'application ; onUpdate ne fait rien si elle est désactivée.

- `val` (*boolean*) : true pour activer

#### `gameplay_rally_recceApp.setLastLoadState(state)`

Mémorise dans les réglages le dernier état de chargement (true/false) pour le niveau courant.

- `state` (*boolean*) : true si une mission était chargée

#### `gameplay_rally_recceApp.setLastMissionId(mid)`

Mémorise dans les réglages le dernier id de mission pour le niveau courant.

- `mid` (*string*) : Identifiant de mission

#### `gameplay_rally_recceApp.setShowNotes(val)`

Active ou désactive l'affichage des prochaines pacenotes pendant la conduite (hors éditeur actif et hors boîte à outils rally visible).

- `val` (*boolean*) : true pour afficher

#### `gameplay_rally_recceApp.unloadMission()`

Décharge la mission du propriétaire 'recce' et mémorise l'état de chargement à false.

- **renvoie** : boolean false si le déchargement est refusé
- **renvoie** : string|nil Message d'erreur en cas de refus

**Évènements UI (guihooks.trigger) :** `rally.recceApp.missionLoaded`, `rally.recceApp.refreshed`, `rallyInputActionDesktopCallNotOk`

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/recceApp.lua`.*
