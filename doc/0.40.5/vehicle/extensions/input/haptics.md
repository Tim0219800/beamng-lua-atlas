# `input_haptics`

*Fichier : `lua/vehicle/extensions/input/haptics.lua` · VM : Véhicule · 197 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `input_haptics` : `extensions.load (VM véhicule)("input_haptics")`, puis la globale `input_haptics`

Génère les vibrations de manette (retour haptique) à partir de la dynamique du véhicule : secousses (jerk) de l'accélération, énergie de glissement des roues, roues bloquées au freinage (gâchette de frein) et roues motrices qui patinent (gâchette d'accélérateur). Les forces sont envoyées au pilote de périphérique via hydros.getForceFeedbackFunction() sur les identifiants FFB fournis. Appelé par le système d'entrée, pas par un moddeur en général.

## Exemple

```lua
haptics.setFFBIDs(idMoteur, idGachetteAccel, idGachetteFrein)
haptics.setFFBPeriod(1 / 30)
```

## Remarques

- La mise à jour n'a lieu que lorsque l'horloge murale (os.clockhp) dépasse nextDriverUpdate (période FFB, défaut 1/30 s) : les pilotes de manettes ne se soucient pas du temps de simulation.
- Un identifiant FFB à -1 désactive la sortie correspondante. Les gâchettes ne reçoivent de la force que si hydros.enableThrottleForceFeedback / enableBrakeForceFeedback sont vrais ; sinon elles reçoivent 0.
- Les vibrations démarrent à 20 % de hydros.ffbSpeedFast (vitesse normalisée) pour éviter les vibrations à l'arrêt. L'intensité globale est multipliée par hydros.wheelFFBForceCoef / 100.
- Seuils de secousse : latéral 50, longitudinal 20, vertical 15 (unité de jerk = accélération/s). Le glissement minimal pris en compte est wheelSlipMin = 15000 (énergie de glissement).
- Le frein ABS actif désactive le comptage des roues bloquées ; absTrigger est calculé mais n'est pas utilisé ensuite.
- Anomalie : setJerkMin affecte la variable globale `jerkMin` qui n'est lue nulle part (les seuils réels sont jerkMinX/Y/Z) : sans effet.
- Anomalie : setFFBSpeedFast (non exporté) affecte une variable globale ffbSpeedFast jamais utilisée ; le code lit hydros.ffbSpeedFast.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `input_haptics.initHaptics()` | Recense les roues motrices (powertrain.getPoweredWheelNames) et le nombre de roues. À appeler après le chargement du véhicule. *(interne)* | 48 |
| `input_haptics.setFFBIDs(_FFBID, _FFBID_accelerate, _FFBID_brake)` | Définit les identifiants des sorties de retour de force (-1 = désactivée). *(interne)* | 33 |
| `input_haptics.setFFBPeriod(period)` | Définit la période entre deux envois au pilote (secondes) et programme le prochain envoi. *(interne)* | 39 |
| `input_haptics.setJerkForceMultiplier(multiplier)` | Multiplicateur de la composante de vibration due aux secousses (debug). | 182 |
| `input_haptics.setJerkMin(min)` | Prévu pour régler le seuil de secousse ; sans effet réel (voir notes). | 184 |
| `input_haptics.setWheelSlipForceMultiplier(multiplier)` | Multiplicateur de la composante de vibration due au glissement des roues (debug). | 181 |
| `input_haptics.setWheelSlipMin(min)` | Seuil minimal d'énergie de glissement pour déclencher la vibration (debug). | 183 |
| `input_haptics.vibrationUpdate(dt)` | Calcule et envoie les forces de vibration (moteur principal, gâchette d'accélérateur, gâchette de frein) si la période FFB est écoulée. *(interne)* | 60 |

### Détail des paramètres

#### `input_haptics.setFFBIDs(_FFBID, _FFBID_accelerate, _FFBID_brake)`

Définit les identifiants des sorties de retour de force (-1 = désactivée).

- `_FFBID` (*integer*) : Sortie de vibration principale.
- `_FFBID_accelerate` (*integer*) : Sortie de la gâchette d'accélérateur.
- `_FFBID_brake` (*integer*) : Sortie de la gâchette de frein.

#### `input_haptics.setFFBPeriod(period)`

Définit la période entre deux envois au pilote (secondes) et programme le prochain envoi.

- `period` (*number*) : Période en secondes (défaut 1/30).

#### `input_haptics.setJerkForceMultiplier(multiplier)`

Multiplicateur de la composante de vibration due aux secousses (debug).

- `multiplier` (*number*) : Défaut 1.

#### `input_haptics.setJerkMin(min)`

Prévu pour régler le seuil de secousse ; sans effet réel (voir notes).

- `min` (*number*) : Seuil (non utilisé).

#### `input_haptics.setWheelSlipForceMultiplier(multiplier)`

Multiplicateur de la composante de vibration due au glissement des roues (debug).

- `multiplier` (*number*) : Défaut 1.

#### `input_haptics.setWheelSlipMin(min)`

Seuil minimal d'énergie de glissement pour déclencher la vibration (debug).

- `min` (*number*) : Défaut 15000.

#### `input_haptics.vibrationUpdate(dt)`

Calcule et envoie les forces de vibration (moteur principal, gâchette d'accélérateur, gâchette de frein) si la période FFB est écoulée.

- `dt` (*number*) : Pas de temps de simulation en secondes.

## Appels vers le moteur (C++)

- `obj:` `getSmoothRefVelocityXYZ`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/input/haptics.lua`.*
