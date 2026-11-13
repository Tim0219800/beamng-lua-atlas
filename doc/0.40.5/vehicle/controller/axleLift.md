# `controller_axleLift`

*Fichier : `lua/vehicle/controller/axleLift.lua` · VM : Véhicule · 176 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `axleLift` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire qui lève ou abaisse des essieux (typiquement les essieux relevables d'un camion) pour gagner de la garde au sol. Il écrit une position cible dans deux valeurs `electrics.values` (avant et arrière) que lit le jbeam. Trois modes : auto (lève sauf si vitesse trop haute, vitesse trop basse, frein à main serré ou accélération latérale trop forte), manual (toujours levé) et off (toujours abaissé).

## Exemple

```lua
controller.getControllerSafe("axleLift").setMode("manual", true)
controller.getControllerSafe("axleLift").setParameters({velocityThresholdDisable = 10})
```

## Remarques

- Clés jbeam lues par init : `velocityThresholdDisable` (14 m/s, au-dessus l'essieu redescend), `velocityThresholdEnable` (0.1 m/s, en dessous il redescend), `accelerationThreshold` (3 m/s², sur |sensors.gy2|), `frontLoweredPosition`/`rearLoweredPosition` (0), `frontRaisedPosition`/`rearRaisedPosition` (1), `frontAxleLiftElectricsName` ("strut_F_axleLift"), `rearAxleLiftElectricsName` ("strut_R_axleLift").
- Le mode d'état est sauvegardé sous la clé `<nom du contrôleur>Mode` dans getState/setState.
- Après `reset`, les electrics sont remis à 0 mais le mode n'est pas réinitialisé (init n'est pas rappelé car `reset` existe).
- Le menu radial n'est ajouté qu'une fois (hasBuiltPie).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_axleLift.getState()` | Renvoie le mode courant sous la clé `<nom>Mode`. | 148 |
| `controller_axleLift.init(jbeamData)` | Lit les paramètres jbeam, met les electrics à 0, passe en mode auto et ajoute l'entrée du menu radial. *(interne)* | 90 |
| `controller_axleLift.reset()` | Remet les deux valeurs electrics d'essieu à 0. *(interne)* | 85 |
| `controller_axleLift.setMode(mode, silent)` | Change le mode ("auto", "manual" ou "off"). Un mode inconnu est ignoré. Affiche un message UI sauf si silent. | 60 |
| `controller_axleLift.setParameters(parameters)` | Modifie à chaud les seuils et le mode ; seuls les champs présents sont appliqués. | 133 |
| `controller_axleLift.setState(data)` | Restaure le mode depuis une table d'état (silencieusement) si la valeur est valide. | 153 |
| `controller_axleLift.toggleMode()` | Passe au mode suivant dans l'ordre auto, manual, off, auto. | 81 |
| `controller_axleLift.updateGFX(dt)` | Chaque frame : choisit la position levée ou abaissée selon le mode (en auto : vitesse lissée, vitesse de roue, frein à main, accélération latérale) et l'écrit dans les deux electrics d'essieu. *(interne)* | 34 |

### Détail des paramètres

#### `controller_axleLift.getState()`

Renvoie le mode courant sous la clé `<nom>Mode`.

- **renvoie** : table<string, string> Table d'état.

#### `controller_axleLift.init(jbeamData)`

Lit les paramètres jbeam, met les electrics à 0, passe en mode auto et ajoute l'entrée du menu radial.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_axleLift.setMode(mode, silent)`

Change le mode ("auto", "manual" ou "off"). Un mode inconnu est ignoré. Affiche un message UI sauf si silent.

- `mode` (*string*) : "auto", "manual" ou "off".
- `silent` (*boolean|nil*) : true pour ne pas afficher de message.

#### `controller_axleLift.setParameters(parameters)`

Modifie à chaud les seuils et le mode ; seuls les champs présents sont appliqués.

- `parameters` (*table*) : Champs facultatifs : mode, accelerationThreshold, velocityThresholdDisable, velocityThresholdEnable.

#### `controller_axleLift.setState(data)`

Restaure le mode depuis une table d'état (silencieusement) si la valeur est valide.

- `data` (*table|nil*) : Table contenant la clé `<nom>Mode`.

#### `controller_axleLift.updateGFX(dt)`

Chaque frame : choisit la position levée ou abaissée selon le mode (en auto : vitesse lissée, vitesse de roue, frein à main, accélération latérale) et l'écrit dans les deux electrics d'essieu.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/axleLift.lua`.*
