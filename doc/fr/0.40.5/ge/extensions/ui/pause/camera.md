# `ui_pause_camera`

*Fichier : `lua/ge/extensions/ui/pause/camera.lua` · VM : Game Engine (GE) · 219 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_pause_camera` : `extensions.load("ui_pause_camera")`, puis la globale `ui_pause_camera`

Caméra orbitale automatique du menu pause : prévue pour passer la caméra du joueur en mode orbit et la faire tourner lentement autour du véhicule pendant la pause, puis restaurer la caméra et l'état d'orbite d'origine. Elle s'arrête si le joueur tourne la caméra à la main. Dans 0.40.5, cette fonctionnalité est désactivée dans le code.

## Remarques

- Désactivée : start, stop, beginPauseSession et endPauseSession commencent par `if true then return end`, donc elles ne font rien et renvoient nil (le code après ce return est mort). La variable locale beginPauseSession n'est jamais exécutée non plus.
- onUpdate ne fait rien tant que state.active est faux, ce qui est toujours le cas ici.
- Si le code était actif : vitesse d'orbite de -5,5 degrés/s sur l'axe x de camRot (lacet, normalisé dans [-180, 180]) ; arrêt si core_camera.timeSinceLastRotation diminue (rotation manuelle) ou si la caméra active n'est plus "orbit".

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_pause_camera.beginPauseSession()` | Prévu pour mémoriser caméra, véhicule et état d'orbite au début de la pause. Sans effet dans 0.40.5 (return immédiat). | 155 |
| `ui_pause_camera.debugState()` | Renvoie une copie profonde de l'état interne (pauseSessionActive, active, orbiting, stoppedByManualInput, previousCameraName, etc.) pour le débogage. | 214 |
| `ui_pause_camera.endPauseSession()` | Prévu pour arrêter l'orbite et restaurer la caméra et l'état d'orbite d'avant la pause. Sans effet dans 0.40.5 (return immédiat). | 160 |
| `ui_pause_camera.onUpdate(dtReal)` | Hook appelé à chaque frame ; fait tourner la caméra orbit autour du véhicule joueur si la session est active. Sans effet tant que start est désactivée. *(interne)* *(hook)* | 181 |
| `ui_pause_camera.start()` | Prévu pour passer la caméra du joueur en orbit et lancer la rotation automatique. Sans effet dans 0.40.5 (return immédiat). | 114 |
| `ui_pause_camera.stop()` | Prévu pour arrêter la rotation automatique et revenir à la caméra précédente. Sans effet dans 0.40.5 (return immédiat). | 136 |

### Détail des paramètres

#### `ui_pause_camera.debugState()`

Renvoie une copie profonde de l'état interne (pauseSessionActive, active, orbiting, stoppedByManualInput, previousCameraName, etc.) pour le débogage.

- **renvoie** : table Copie de l'état.

#### `ui_pause_camera.onUpdate(dtReal)`

Hook appelé à chaque frame ; fait tourner la caméra orbit autour du véhicule joueur si la session est active. Sans effet tant que start est désactivée.

- `dtReal` (*number*) : Temps réel écoulé depuis la frame précédente, en secondes.

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/pause/camera.lua`.*
