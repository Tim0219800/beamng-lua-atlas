# `gameplay_rally_loop_stagedCountdownUtils`

*Fichier : `lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua` · VM : Game Engine (GE) · 240 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_loop_stagedCountdownUtils` : `extensions.load("gameplay_rally_loop_stagedCountdownUtils")`, puis la globale `gameplay_rally_loop_stagedCountdownUtils`

Fonctions communes au compte à rebours de départ de spéciale (nœud flowgraph et simulation de test) : lecture de l'horloge murale de l'environnement, réglages du compte à rebours selon les options rallyVisualPacenotes/rallyAudioPacenotes, calcul d'un compte à rebours calé sur la minute suivante, geler/dégeler le véhicule, dessin de debug du plan de départ et affichage ImGui d'état dans le nœud.

## Remarques

- Horloge murale : ((tod.time + 0.5) % 1) * 86400 secondes ; tod.time = 0 correspond à midi.
- getStageCountdownSettings : le paramètre defaultMaxAnnounced est ignoré ; maxAnnounced reçoit defaultDuration.
- Dans le plan de debug, l'axe Y est la normale : +Y est « back » (derrière la ligne) et -Y « front ».

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_loop_stagedCountdownUtils.buildRallyClockData(wallClockSecs)` | Données d'horloge pour l'UI : wallClockSecs, wallClockTime (texte 24 h via rallyUtil.formatTime24Hour) et trois drapeaux de saut à false. | 54 |
| `gameplay_rally_loop_stagedCountdownUtils.calculateImmediateMinuteCountdown(duration)` | Prépare un compte à rebours qui se termine à la prochaine minute pleine de l'horloge murale (fenêtre de lancement = duration + 1 s). | 30 |
| `gameplay_rally_loop_stagedCountdownUtils.drawDebugPlane(pos, rot, normals)` | Dessine un plan violet (deux triangles de 10 m de large) avec une sphère au point d'origine ; avec normals, ajoute les axes « back » (vert) et « front » (rouge). | 64 |
| `gameplay_rally_loop_stagedCountdownUtils.drawDebugVehiclePoint(vehPos, inside)` | Dessine une petite sphère au véhicule : verte si inside, rouge sinon. | 145 |
| `gameplay_rally_loop_stagedCountdownUtils.drawMiddleInfo(im, nodeData, formatTimeFromSeconds)` | Affiche dans le nœud (drawMiddle, ImGui) : indicateur TEST MODE, horloge, époque, heure de l'évènement, temps restant, contrôle de mise en place, état, replanifications, et zone/staged. Ne fait rien si nodeData.useImgui est faux. | 174 |
| `gameplay_rally_loop_stagedCountdownUtils.drawMiddleProgress(im, state, duration, timer, STATE_COUNTDOWN_RUNNING, STATE_FINISHED)` | Barre de progression du nœud : « Running » avec (duration - timer)/duration, « Done » (pleine) si terminé, « Waiting » (vide) sinon. | 227 |
| `gameplay_rally_loop_stagedCountdownUtils.drawVehicleToPlaneDebug(vehPos, planePos, rot, tmpPlaneNormal, tmpToVehicle, tmpClosestPoint, tmpMidPoint)` | Dessine la projection du véhicule sur le plan, une ligne et la distance signée (« past » orange si le véhicule a dépassé la ligne, « before » vert sinon). Les vec3 passés en paramètres servent de tampons pour éviter les allocations. | 95 |
| `gameplay_rally_loop_stagedCountdownUtils.freezeVehicle(vehId, logTag)` | Gèle le véhicule (action 'setFreeze' true via core_vehicleBridge) pendant la phase de mise en place. | 150 |
| `gameplay_rally_loop_stagedCountdownUtils.getEnvironmentWallClockSecs()` | Heure murale actuelle de l'environnement, en secondes depuis minuit. | 9 |
| `gameplay_rally_loop_stagedCountdownUtils.getStageCountdownSettings(defaultDuration, defaultMaxAnnounced)` | Construit la table de réglages du compte à rebours : duration, maxAnnounced, showVisualCountdown (réglage rallyVisualPacenotes ou nil), playSoundEffects (vrai si rallyAudioPacenotes est désactivé), playVoiceCountdown (réglage rallyAudioPacenotes). | 17 |
| `gameplay_rally_loop_stagedCountdownUtils.getWallClockTime(environmentStartTimeSecs, epochTime)` | Heure murale = (environmentStartTimeSecs + epochTime) modulo 86400. | 50 |
| `gameplay_rally_loop_stagedCountdownUtils.unfreezeVehicle(vehId, logTag)` | Dégèle le véhicule (action 'setFreeze' false). | 162 |

### Détail des paramètres

#### `gameplay_rally_loop_stagedCountdownUtils.buildRallyClockData(wallClockSecs)`

Données d'horloge pour l'UI : wallClockSecs, wallClockTime (texte 24 h via rallyUtil.formatTime24Hour) et trois drapeaux de saut à false.

- `wallClockSecs` (*number*) : Heure murale en secondes.
- **renvoie** : table {wallClockSecs, wallClockTime, canSkipTimeControls, isTimeControlSkipAvailable, canSkipCountdown}.

#### `gameplay_rally_loop_stagedCountdownUtils.calculateImmediateMinuteCountdown(duration)`

Prépare un compte à rebours qui se termine à la prochaine minute pleine de l'horloge murale (fenêtre de lancement = duration + 1 s).

- `duration` (*number*) : Durée du compte à rebours en secondes.
- **renvoie** : table {environmentStartTimeSecs, epochTime = 0, scheduledEventTime, targetStartTime = 1, timer}.

#### `gameplay_rally_loop_stagedCountdownUtils.drawDebugPlane(pos, rot, normals)`

Dessine un plan violet (deux triangles de 10 m de large) avec une sphère au point d'origine ; avec normals, ajoute les axes « back » (vert) et « front » (rouge).

- `pos` (*vec3*) : Position du plan.
- `rot` (*quat*) : Orientation du plan.
- `normals` (*boolean|nil*) : true pour dessiner les normales.

#### `gameplay_rally_loop_stagedCountdownUtils.drawDebugVehiclePoint(vehPos, inside)`

Dessine une petite sphère au véhicule : verte si inside, rouge sinon.

- `vehPos` (*vec3*) : Position.
- `inside` (*boolean*) : Véhicule dans la zone.

#### `gameplay_rally_loop_stagedCountdownUtils.drawMiddleInfo(im, nodeData, formatTimeFromSeconds)`

Affiche dans le nœud (drawMiddle, ImGui) : indicateur TEST MODE, horloge, époque, heure de l'évènement, temps restant, contrôle de mise en place, état, replanifications, et zone/staged. Ne fait rien si nodeData.useImgui est faux.

- `im` (*table*) : ui_imgui.
- `nodeData` (*table*) : Données du nœud (useImgui, test, wallClockSecs, currentEpochTime, scheduledEventTime, stagingCheckTime, state, rescheduleCount, maxReschedules, inZone, staged…).
- `formatTimeFromSeconds` (*function*) : Fonction secondes -> texte.

#### `gameplay_rally_loop_stagedCountdownUtils.drawMiddleProgress(im, state, duration, timer, STATE_COUNTDOWN_RUNNING, STATE_FINISHED)`

Barre de progression du nœud : « Running » avec (duration - timer)/duration, « Done » (pleine) si terminé, « Waiting » (vide) sinon.

- `im` (*table*) : ui_imgui.
- `state` (*any*) : État courant du nœud.
- `duration` (*number*) : Durée totale en secondes.
- `timer` (*number*) : Temps restant en secondes.
- `STATE_COUNTDOWN_RUNNING` (*any*) : Valeur d'état « en cours ».
- `STATE_FINISHED` (*any*) : Valeur d'état « terminé ».

#### `gameplay_rally_loop_stagedCountdownUtils.drawVehicleToPlaneDebug(vehPos, planePos, rot, tmpPlaneNormal, tmpToVehicle, tmpClosestPoint, tmpMidPoint)`

Dessine la projection du véhicule sur le plan, une ligne et la distance signée (« past » orange si le véhicule a dépassé la ligne, « before » vert sinon). Les vec3 passés en paramètres servent de tampons pour éviter les allocations.

- `vehPos` (*vec3*) : Position du véhicule.
- `planePos` (*vec3*) : Position du plan.
- `rot` (*quat*) : Orientation du plan.
- `tmpPlaneNormal` (*vec3*) : Tampon réutilisable.
- `tmpToVehicle` (*vec3*) : Tampon réutilisable.
- `tmpClosestPoint` (*vec3*) : Tampon réutilisable.
- `tmpMidPoint` (*vec3*) : Tampon réutilisable.

#### `gameplay_rally_loop_stagedCountdownUtils.freezeVehicle(vehId, logTag)`

Gèle le véhicule (action 'setFreeze' true via core_vehicleBridge) pendant la phase de mise en place.

- `vehId` (*integer|nil*) : Id du véhicule.
- `logTag` (*string*) : Étiquette de log.
- **renvoie** : boolean true si le véhicule a été trouvé.

#### `gameplay_rally_loop_stagedCountdownUtils.getEnvironmentWallClockSecs()`

Heure murale actuelle de l'environnement, en secondes depuis minuit.

- **renvoie** : number Secondes (0 si core_environment ou l'heure est indisponible).

#### `gameplay_rally_loop_stagedCountdownUtils.getStageCountdownSettings(defaultDuration, defaultMaxAnnounced)`

Construit la table de réglages du compte à rebours : duration, maxAnnounced, showVisualCountdown (réglage rallyVisualPacenotes ou nil), playSoundEffects (vrai si rallyAudioPacenotes est désactivé), playVoiceCountdown (réglage rallyAudioPacenotes).

- `defaultDuration` (*number*) : Durée du compte à rebours en secondes.
- `defaultMaxAnnounced` (*number*) : Non utilisé (déduit du code).
- **renvoie** : table {duration, maxAnnounced, showVisualCountdown, playSoundEffects, playVoiceCountdown}.

#### `gameplay_rally_loop_stagedCountdownUtils.getWallClockTime(environmentStartTimeSecs, epochTime)`

Heure murale = (environmentStartTimeSecs + epochTime) modulo 86400.

- `environmentStartTimeSecs` (*number|nil*) : Heure de départ, 0 si nil.
- `epochTime` (*number|nil*) : Secondes écoulées, 0 si nil.
- **renvoie** : number Secondes depuis minuit.

#### `gameplay_rally_loop_stagedCountdownUtils.unfreezeVehicle(vehId, logTag)`

Dégèle le véhicule (action 'setFreeze' false).

- `vehId` (*integer|nil*) : Id du véhicule.
- `logTag` (*string*) : Étiquette de log.
- **renvoie** : boolean true si le véhicule a été trouvé.

## Appels vers le moteur (C++)

- `core_environment.` `getTimeOfDay`
- `debugDrawer:` `drawLineInstance`, `drawSphere`, `drawTextAdvanced`, `drawTriSolid`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua`.*
