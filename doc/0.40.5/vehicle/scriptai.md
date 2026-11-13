# `scriptai`

*Fichier : `lua/vehicle/scriptai.lua` · VM : Véhicule · 866 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `scriptai`

IA « script » : enregistre la trajectoire du véhicule (position du pare-chocs avant + temps, éventuellement vitesse) puis la rejoue en pilotant le véhicule avec des entrées simulées (direction, accélérateur, frein, frein à main) pour suivre le tracé à l'heure prévue. Utilisé pour les scénarios, les rediffusions de trajectoire (replays de crash) et les cascades scriptées. Peut aussi aider le suivi avec une « force externe » (thrusters.applyAccel) et boucler le parcours.

## Exemple

```lua
-- enregistrer
scriptai.startRecording(true)
-- ... conduire ...
local rec = scriptai.stopRecording() -- {path = {{x,y,z,t,v?}, ...}}
-- rejouer 2 boucles
rec.loopCount = 2
scriptai.startFollowing(rec)
print(scriptai.scriptState().status)
```

## Remarques

- Format d'un script : liste de points {x, y, z, t [, v] [, forceSpeed] [, dir, up sur le premier]} où (x,y,z) est la position du point avant du véhicule (obj:getFrontPosition), t le temps en secondes, v la vitesse en m/s (si recordSpeed). Un script peut être soit la liste directe, soit {path = liste, timeOffset, startDelay, loopCount, loopTimeOffset, externalForce}.
- L'enregistrement supprime les points redondants (mouvement quasi rectiligne à accélération constante, tolérance 0.1 m) et mémorise la direction et le haut initiaux dans le premier point (dir, up).
- Au démarrage du suivi, startFollowing : copie le script, applique timeOffset (décalage temporel) et startDelay (délai avant départ), calcule la position/orientation de départ (avec wheelToGroundDist pour poser les roues au sol), remet le véhicule à cet endroit selon loopType ('alwaysReset' par défaut, 'startReset' = seulement au premier tour, autre = pas de reset), passe la boîte en mode 'arcade' (ai.saveGearboxMode) et l'ABS en 'arcade' (wheels.setABSBehavior).
- Limitation : wheels.setABSBehavior('arcade') n'est pas rétabli à l'arrêt (seule la boîte l'est via ai.restoreSavedGearboxMode).
- Le suivi utilise un régulateur sur l'écart de temps (timeDiff) et la vitesse requise estimée par ajustement de s(t) = v0*t + a0*t²/2 sur trois points, avec garde sous-virage/survirage, ABS/TCS simples basés sur wheels.wheels[i].lastSlip et downForceRaw, et marche arrière automatique si la cible est derrière.
- Les entrées envoyées passent par input.event : steering (inversée), throttle, brake, parkingbrake avec le canal 2 pour pédales et 1 pour direction. Le suivi n'est actif que si M.updateGFX == updateGFXfollow ; isDriving() le teste.
- debugMode vaut 'all' par défaut ; autres valeurs utilisées : 'target', 'path', 'externalForce' (ce qui est dessiné par debugDraw).
- Bug/incohérence : en fin de script, updateGFXfollow appelle ai.stopFollowing() (module ai) et non scriptai.stopFollowing ; l'ancien suivi script n'est donc pas arrêté proprement depuis scriptai (la fin n'est pas détectée de la même façon).
- Bug/incohérence : getInitialSpawnPositionOrientation ignore startDelay (contrairement à startFollowing) et, si aucun point suffisamment éloigné n'est trouvé (k nil), dir reste nil et l'appel dir:cross(up) lève une erreur.
- Bug/incohérence : scriptState() lit script[#script].t et inScript.startDelay : erreur si le script est vide ou inScript nil pendant le suivi ; dans la dernière phase du suivi le script peut être vidé (scriptLen == 0) avant l'arrêt.
- Détail : scriptStop écrit un CSV de debug si setLogDataToCSV a été activé (fichier 'scriptaiFollowTrajectory' ou nom donné, plus 'settings_<fichier>').

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `scriptai.debugDraw()` | Dessine la cible, le tracé et la force externe selon debugMode (appelée par la boucle de debug du véhicule). *(interne)* | 814 |
| `scriptai.getInitialSpawnPositionOrientation(inScript, vehPosType, _timeOffset)` | Calcule la position et l'orientation de réapparition du véhicule pour démarrer un script (décalage temporel pris en compte) sans lancer le suivi. | 126 |
| `scriptai.isDriving()` | Indique si l'IA script est en train de suivre un script. | 846 |
| `scriptai.scriptState()` | Renvoie l'état courant de l'IA script (enregistrement ou suivi). | 837 |
| `scriptai.scriptStop(centerWheel, engageParkingbrake)` | Même fonction que stopFollowing (M.stopFollowing = M.scriptStop). | 328 |
| `scriptai.setLogDataToCSV(val)` | Active ou coupe l'écriture d'un CSV de debug du suivi (temps, position, écart de temps, taux du lisseur). Le fichier est écrit à l'arrêt. | 38 |
| `scriptai.setSpeedDiffSmootherOutRate(outRate)` | Règle le taux de décroissance du lisseur d'écart de vitesse (réglage fin de la réactivité du suivi), borné à 1e30. | 51 |
| `scriptai.startFollowing(_inScript, _timeOffset, _loopCounter, _loopType, _externalForce)` | Démarre le suivi d'un script : prépare le script (décalage temporel, délai de départ), replace le véhicule au début du tracé selon le type de boucle, passe la boîte et l'ABS en mode arcade et active la boucle de suivi. Ne fait rien si le script a moins de 2 points. | 660 |
| `scriptai.startRecording(recordSpeed)` | Démarre l'enregistrement de la trajectoire (position avant du véhicule à chaque frame) et mémorise l'orientation initiale. Remet le chronomètre à 0. | 636 |
| `scriptai.stopFollowing(centerWheel, engageParkingbrake)` | Arrête le suivi (alias de scriptStop). Remet les entrées à 0, restaure le mode de boîte sauvegardé et vide le script. Écrit le CSV de debug s'il était activé. | 328 |
| `scriptai.stopRecording()` | Arrête l'enregistrement et renvoie le script obtenu ; le premier point reçoit dir et up (orientation initiale). | 648 |
| `scriptai.wheelToGroundDist(pos, dir, up)` | Calcule de combien les roues seront au-dessus (positif : trop bas, il faut relever) ou sous le sol pour une position et une orientation de réapparition données (lancer de rayon statique depuis la position moyenne des noeuds de roues). | 64 |

### Détail des paramètres

#### `scriptai.getInitialSpawnPositionOrientation(inScript, vehPosType, _timeOffset)`

Calcule la position et l'orientation de réapparition du véhicule pour démarrer un script (décalage temporel pris en compte) sans lancer le suivi.

- `inScript` (*table*) : Script (liste ou {path, timeOffset, ...}).
- `vehPosType` (*any*) : Non utilisé dans le code.
- `_timeOffset` (*number|nil*) : Décalage de départ en secondes (inScript.timeOffset par défaut).
- **renvoie** : vec3|nil Position du noeud ref au départ (nil si le script est invalide).
- **renvoie** : quat|nil Rotation initiale.

#### `scriptai.isDriving()`

Indique si l'IA script est en train de suivre un script.

- **renvoie** : boolean true pendant le suivi.

#### `scriptai.scriptState()`

Renvoie l'état courant de l'IA script (enregistrement ou suivi).

- **renvoie** : table|nil {status='recording', time} ou {status='following', scriptTime, time, endScriptTime, posError, targetPos, startDelay} ; nil au repos.

#### `scriptai.scriptStop(centerWheel, engageParkingbrake)`

Même fonction que stopFollowing (M.stopFollowing = M.scriptStop).

- `centerWheel` (*boolean|nil*) : Remettre les entrées à 0.
- `engageParkingbrake` (*boolean|nil*) : Serrer le frein à main.

#### `scriptai.setLogDataToCSV(val)`

Active ou coupe l'écriture d'un CSV de debug du suivi (temps, position, écart de temps, taux du lisseur). Le fichier est écrit à l'arrêt.

- `val` (*boolean|string*) : true ou 'on' : nom par défaut ; autre chaîne (≠ 'off') : nom du fichier ; sinon désactive.

#### `scriptai.setSpeedDiffSmootherOutRate(outRate)`

Règle le taux de décroissance du lisseur d'écart de vitesse (réglage fin de la réactivité du suivi), borné à 1e30.

- `outRate` (*number|nil*) : Nouveau taux (conserve l'ancien si nil).

#### `scriptai.startFollowing(_inScript, _timeOffset, _loopCounter, _loopType, _externalForce)`

Démarre le suivi d'un script : prépare le script (décalage temporel, délai de départ), replace le véhicule au début du tracé selon le type de boucle, passe la boîte et l'ABS en mode arcade et active la boucle de suivi. Ne fait rien si le script a moins de 2 points.

- `_inScript` (*table*) : Script : liste de points, ou table {path, timeOffset, startDelay, loopCount, loopTimeOffset, externalForce}.
- `_timeOffset` (*number|nil*) : Décalage de départ dans le script en secondes (remplace inScript.timeOffset).
- `_loopCounter` (*integer|nil*) : Nombre de tours restant (inScript.loopCount par défaut, 1 sinon). Utilisé aussi par l'auto-rappel en fin de tour.
- `_loopType` (*string|nil*) : 'alwaysReset' (défaut), 'startReset' ou autre : quand replacer le véhicule au point de départ.
- `_externalForce` (*boolean|number|nil*) : Aide au suivi par accélération externe (true = 1, nombre borné à 1 ; remplace inScript.externalForce).

#### `scriptai.startRecording(recordSpeed)`

Démarre l'enregistrement de la trajectoire (position avant du véhicule à chaque frame) et mémorise l'orientation initiale. Remet le chronomètre à 0.

- `recordSpeed` (*boolean|string|nil*) : true/'on'/'yes' pour enregistrer aussi la vitesse (v, m/s) à chaque point.

#### `scriptai.stopFollowing(centerWheel, engageParkingbrake)`

Arrête le suivi (alias de scriptStop). Remet les entrées à 0, restaure le mode de boîte sauvegardé et vide le script. Écrit le CSV de debug s'il était activé.

- `centerWheel` (*boolean|nil*) : Remettre direction, gaz et frein à 0 (true par défaut si l'argument est nil).
- `engageParkingbrake` (*boolean|nil*) : Serrer le frein à main (true par défaut si centerWheel est nil).

#### `scriptai.stopRecording()`

Arrête l'enregistrement et renvoie le script obtenu ; le premier point reçoit dir et up (orientation initiale).

- **renvoie** : table {path = liste de points {x, y, z, t [, v]}}.

#### `scriptai.wheelToGroundDist(pos, dir, up)`

Calcule de combien les roues seront au-dessus (positif : trop bas, il faut relever) ou sous le sol pour une position et une orientation de réapparition données (lancer de rayon statique depuis la position moyenne des noeuds de roues).

- `pos` (*vec3*) : Position du noeud ref du véhicule.
- `dir` (*vec3*) : Direction avant (normalisée).
- `up` (*vec3*) : Vecteur haut (normalisé).
- **renvoie** : number Hauteur (m) à ajouter le long de up pour que les roues touchent le sol : rayon max de roue moins la distance mesurée au sol.

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugMode` | string | Ce que debugDraw dessine : 'all' (défaut), 'target', 'path' ou 'externalForce'. |
| `updateGFX` | function | nop au repos ; devient updateGFXrecord pendant l'enregistrement et updateGFXfollow pendant le suivi. ⚠ nop est un global du jeu. |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawCylinder`, `drawSphere`
- `obj:` `castRayStatic`, `getCenterPosition`, `getClusterVelocityWithoutWheels`, `getDirectionVector`, `getDirectionVectorUp`, `getFrontPosition`, `getGravityVector`, `getId`, `getInitialHeight`, `getOriginalFrontPositionRelative`, `getOriginalNodePositionRelative`, `getPosition`, `getSmoothRefVelocityXYZ`, `getVelocity`, `isCollidingWithObject`, `queueGameEngineLua`, `requestReset`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/scriptai.lua`.*
