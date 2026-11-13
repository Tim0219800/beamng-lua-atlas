# `controller_vivaceGauges`

*Fichier : `lua/vehicle/controller/vivaceGauges.lua` · VM : Véhicule · 112 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `vivaceGauges` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire OBSOLÈTE (remplacé par le contrôleur 'genericGauges') qui alimente l'écran numérique du tableau de bord de la Vivace : il crée une texture HTML (1024x256) et lui envoie périodiquement des valeurs d'electrics (clignotants, voyants, régime, vitesse, ESC/TCS, puissance moyenne des moteurs électriques). Chargé via le jbeam ; ne pas utiliser pour de nouveaux véhicules.

## Exemple

```lua
-- jbeam : controller "vivaceGauges" avec materialName et htmlPath ; setParameters({modeName="ECO", modeColor="#00ff00"}) change le mode affiché
```

## Remarques

- Champs jbeam lus : materialName (nom du matériau de l'écran, obligatoire), htmlPath (page HTML, obligatoire) ; tout le jbeamData est fusionné avec {unit = réglage uiUnitLength ou 'metric'} puis envoyé à la page par l'appel JS 'setup'.
- init écrit toujours une erreur de log disant que le contrôleur est obsolète. Sans materialName ou htmlPath, M.updateGFX est remplacé par nop.
- Données envoyées (appel JS 'updateData') : temp (température ambiante en °C), electrics.{signal_L, signal_R, lights, highbeam, fog (toujours 0), lowpressure, lowfuel, parkingbrake, checkengine, hazard, oil, cruiseControlActive, gear, rpmTacho, fuel, watertemp, engineRunning, wheelspeed, esc, escActive, tcs, tcsActive, pwr}. pwr = moyenne des (throttle - regenThrottle) des périphériques electricMotor, forcée à 0 si wheelspeed <= 0,5 m/s.
- Mise à jour seulement si un joueur est assis et si obj:getUpdateUIflag() est vrai ; la fréquence de rafraîchissement de la texture est de 15 FPS.
- Anomalie : updateTimer est incrémenté et remis à 0 mais n'est jamais testé pour limiter la fréquence.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_vivaceGauges.init(jbeamData)` | Appelé à l'initialisation du contrôleur : crée la texture HTML, récupère les moteurs électriques du powertrain et envoie la configuration à la page ('setup'). *(interne)* | 63 |
| `controller_vivaceGauges.reset()` | Appelé au reset du véhicule ; ne fait rien. *(interne)* | 91 |
| `controller_vivaceGauges.setParameters(parameters)` | Change le mode affiché (appel JS 'updateMode' avec {txt, col}) si modeName et modeColor sont présents. | 98 |
| `controller_vivaceGauges.updateGFX(dt)` | Appelé chaque frame : envoie les valeurs du tableau de bord à la texture HTML quand l'UI doit être mise à jour. Vaut nop si la configuration est invalide. *(interne)* | 20 |

### Détail des paramètres

#### `controller_vivaceGauges.init(jbeamData)`

Appelé à l'initialisation du contrôleur : crée la texture HTML, récupère les moteurs électriques du powertrain et envoie la configuration à la page ('setup').

- `jbeamData` (*table*) : Données jbeam du contrôleur (materialName, htmlPath, ...).

#### `controller_vivaceGauges.setParameters(parameters)`

Change le mode affiché (appel JS 'updateMode' avec {txt, col}) si modeName et modeColor sont présents.

- `parameters` (*table*) : Table avec modeName (texte) et modeColor (couleur, format utilisé par la page HTML).

#### `controller_vivaceGauges.updateGFX(dt)`

Appelé chaque frame : envoie les valeurs du tableau de bord à la texture HTML quand l'UI doit être mise à jour. Vaut nop si la configuration est invalide.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | 'auxiliary' : type de contrôleur dans le système de contrôleurs. |

## Appels vers le moteur (C++)

- `obj:` `getEnvTemperature`, `getUpdateUIflag`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/vivaceGauges.lua`.*
