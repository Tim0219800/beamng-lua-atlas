# `escCalibration`

*Fichier : `lua/vehicle/extensions/escCalibration.lua` · VM : Véhicule · 229 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `escCalibration` : `extensions.load (VM véhicule)("escCalibration")`, puis la globale `escCalibration`

Outil interne de calibration de l'ESC : automatise un test de 'rigidité de dérive' (skew stiffness) en balayant 13 vitesses (40 à 100 km/h) et 14 angles de braquage (0,5° à 7°), avec le régulateur de vitesse et le contrôleur 'esc'. Le résultat est écrit dans skewStiffnessPivot.csv et la progression est envoyée à l'UI via le hook 'ESCSkewStiffnessChange'.

## Exemple

```lua
extensions.load('escCalibration')
extensions.escCalibration.startSkewStiffnessTest()  -- nécessite un contrôleur 'esc'
```

## Remarques

- États : Idling, Initialization (mesure l'angle de roue maximal en braquant à fond 2 x 2 s), Starting, Settling (attend la vitesse cible via cruiseControl.hasReachedTargetSpeed puis esc.calibrationSettled), Measuring (attend esc.calibrationMeasurementReady), Increasing Angle / Increasing Speed, Finished (écrit le CSV, coupe le cruise control, remet la vitesse physique normale).
- Dépend du contrôleur 'esc' (champs wheelAngleFront, pauseESCAction, doSettle, calibrationSettled, doMeasure, calibrationMeasurementReady, stiffnessFront, stiffnessRear, fonctions startESCCalibration/stopESCCalibration) et charge l'extension cruiseControl.
- Pendant le test, be:setPhysicsSpeedFactor(1) est demandé au GE (vitesse maximale de la physique) ; il est remis à 0 à la fin ou à l'arrêt.
- Colonnes du CSV : Speed,Angle,Front,Rear,Ratio,gForce, Float Angle, Test. Les deux dernières colonnes (floatAngle, test) ne sont jamais renseignées dans testResults et valent donc nil. Le fichier est écrit dans le répertoire de travail du jeu (chemin relatif).
- gForce = sensors.gx2 / |gravité| (gravité bornée à 0,1 minimum). La progression en % = étapes terminées / (13 x 14).
- La direction est commandée par input.event('steering', -angleCible/angleMax, 1).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `escCalibration.onInit()` | Hook d'initialisation : remet tous les compteurs et résultats à zéro, la vitesse physique à normale et l'état à Idling. *(interne)* *(hook)* | 165 |
| `escCalibration.onReset()` | Même fonction que onInit. *(interne)* *(hook)* | 165 |
| `escCalibration.startSkewStiffnessTest()` | Démarre le test : récupère le contrôleur 'esc' (abandonne avec une erreur de log s'il n'existe pas), charge cruiseControl, lance la calibration ESC et passe en état Initialization. | 191 |
| `escCalibration.stopSkewStiffnessTest()` | Arrête le test : coupe le régulateur, arrête la calibration ESC, remet la vitesse physique normale et passe en état Finished (le CSV sera alors écrit à la prochaine frame). | 209 |
| `escCalibration.updateGFX(dt)` | Appelé chaque frame : fait avancer la machine à états du test et pilote la direction. *(interne)* | 57 |

### Détail des paramètres

#### `escCalibration.updateGFX(dt)`

Appelé chaque frame : fait avancer la machine à états du test et pilote la direction.

- `dt` (*number*) : Pas de temps en secondes.

**Évènements UI (guihooks.trigger) :** `ESCSkewStiffnessChange`

## Appels vers le moteur (C++)

- `obj:` `getGravity`, `queueGameEngineLua`

**Charge les extensions :** `cruiseControl`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/escCalibration.lua`.*
