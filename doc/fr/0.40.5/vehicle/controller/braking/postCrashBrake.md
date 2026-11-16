# `controller_braking_postCrashBrake`

*Fichier : `lua/vehicle/controller/braking/postCrashBrake.lua` · VM : Véhicule · 132 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `braking/postCrashBrake` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire de freinage automatique après un choc. Une machine à états (idle, braking, holding, disabled) détecte une forte accélération (accéléromètres `sensors.gx2`, `gy2`, `gz2`) : il passe en freinage total, coupe l'accélérateur, allume les feux de détresse, puis serre le frein de stationnement à l'arrêt (ou en marche arrière) et relâche quand le conducteur ré-accélère ou que le véhicule roule à plus de 5 m/s. Ordre d'appel : `defaultOrder = 700`.

## Remarques

- Clés jbeam lues par init : `brakeThreshold` (50 m/s²) et `crashCountThreshold` (3). Au-delà de `crashCountThreshold` déclenchements, l'état devient "disabled" et le système ne se redéclenche plus (jusqu'au reset).
- Écrit `electrics.values.postCrashBrakeTriggered` (1 pendant l'action, nil sinon), `electrics.values.brake` et `throttle` ; envoie `input.event("throttle"|"parkingbrake", ...)` et `electrics.set_warn_signal`.
- Il n'y a pas de fonction `reset` : controller.reset rappelle init, ce qui remet tout à idle.
- État sauvegardé sous `<nom>_state` et `<nom>_crashCounter`. setState sur un autre état (par exemple venant d'un autre pair multijoueur) appelle une application « distante » de l'état (feux, frein de stationnement).
- Ce contrôleur est déplacé : l'ancien nom `postCrashBrake` est redirigé vers `braking/postCrashBrake`.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_braking_postCrashBrake.getState()` | Renvoie l'état courant et le compteur de chocs pour la synchronisation d'état. | 103 |
| `controller_braking_postCrashBrake.init(jbeamData)` | Remet la machine à l'état idle (éteint les feux de détresse s'ils étaient commandés par ce contrôleur) et lit les seuils jbeam. *(interne)* | 84 |
| `controller_braking_postCrashBrake.setState(data)` | Restaure le compteur de chocs et applique un état valide (idle, braking, holding, disabled) s'il diffère. | 109 |
| `controller_braking_postCrashBrake.updateGFX(dt)` | Chaque frame : détecte le choc en idle, impose le freinage en braking, maintient le frein en holding et gère la sortie. *(interne)* | 30 |

### Détail des paramètres

#### `controller_braking_postCrashBrake.getState()`

Renvoie l'état courant et le compteur de chocs pour la synchronisation d'état.

- **renvoie** : table Clés `<nom>_state` et `<nom>_crashCounter`.

#### `controller_braking_postCrashBrake.init(jbeamData)`

Remet la machine à l'état idle (éteint les feux de détresse s'ils étaient commandés par ce contrôleur) et lit les seuils jbeam.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_braking_postCrashBrake.setState(data)`

Restaure le compteur de chocs et applique un état valide (idle, braking, holding, disabled) s'il diffère.

- `data` (*table|nil*) : Table d'état.

#### `controller_braking_postCrashBrake.updateGFX(dt)`

Chaque frame : détecte le choc en idle, impose le freinage en braking, maintient le frein en holding et gère la sortie.

- `dt` (*number*) : Pas de temps en secondes (non utilisé).

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultOrder` | number | 700 : rang d'appel par défaut. |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/braking/postCrashBrake.lua`.*
