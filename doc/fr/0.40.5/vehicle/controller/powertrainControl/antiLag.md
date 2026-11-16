# `controller_powertrainControl_antiLag`

*Fichier : `lua/vehicle/controller/powertrainControl/antiLag.lua` · VM : Véhicule · 231 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `powertrainControl/antiLag` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire d'anti-lag (ALS) pour moteur turbocompressé. Machine à états off / idle / armed / manualOverride / timeout : en idle il s'arme après quelques secondes de plein gaz à haut régime ; armé, quand le véhicule roule, que les gaz sont levés (ou le frein appuyé) et que le moteur tourne assez, il pilote par PID le coefficient d'anti-lag du moteur (engine:setAntilagCoef) pour maintenir le turbo à turboTargetRPM. Un temps maximal continu évite la surchauffe. Publie electrics.values.alsActive (booléen) et alsState (chaîne).

## Exemple

```lua
local als = controller.getController("antiLag")
als.setAntilagState("manualOverride") -- anti-lag forcé (coef = 1)
als.setAntilagState("off")
```

## Remarques

- Clés jbeam lues : controlledEngine ("mainEngine"), turboTargetRPM (90000), minActiveEngineRPM (2000), minActiveWheelSpeed (1 m/s), maxActiveThrottleInput (0.2), minActiveBrakeInput (0.2), timeoutTime (30 s), timeoutResetTime (2 s), autoArmMinRPM (5000), autoArmMinThrottle (0.5), autoArmTime (1 s), autoDisarmMaxRPM (3000), autoDisarmMaxThrottle (0.3), autoDisarmTime (3 s).
- États valides pour setAntilagState : "off", "idle", "armed", "manualOverride", "timeout" (aucune validation : toute valeur est acceptée telle quelle).
- Sans moteur ou si le moteur n'a pas de turbocompresseur (engine.turbocharger), log E et updateGFX devient nop.
- Le timeout s'accumule quand l'anti-lag est actif et décroît 3 fois plus vite sinon.
- reset remet toujours l'état à idle même si le mode précédent était off, et ne réinitialise pas les timers d'armement/désarmement.
- getState/setState exposent un mode distant : "off", "automatic" (idle/armed/timeout) ou "manualOverride" (clé <nom du contrôleur>_mode).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_powertrainControl_antiLag.getState()` | État sauvegardable : mode distant (off / automatic / manualOverride). | 204 |
| `controller_powertrainControl_antiLag.init(jbeamData)` | Récupère le moteur et son turbocompresseur, lit les seuils jbeam et crée le PID de régime turbo. *(interne)* | 134 |
| `controller_powertrainControl_antiLag.reset(jbeamData)` | Remet timeout, PID et état (idle) à zéro et les electrics alsActive/alsState. *(interne)* | 126 |
| `controller_powertrainControl_antiLag.setAntilagState(newState)` | Force l'état interne de la machine à états (off, idle, armed, manualOverride, timeout). | 47 |
| `controller_powertrainControl_antiLag.setState(data)` | Restaure le mode depuis la table (modes inconnus ignorés). | 209 |
| `controller_powertrainControl_antiLag.updateGFX(dt)` | Chaque frame : fait avancer la machine à états et applique le coefficient d'anti-lag au moteur. *(interne)* | 51 |

### Détail des paramètres

#### `controller_powertrainControl_antiLag.getState()`

État sauvegardable : mode distant (off / automatic / manualOverride).

- **renvoie** : table Table d'état.

#### `controller_powertrainControl_antiLag.init(jbeamData)`

Récupère le moteur et son turbocompresseur, lit les seuils jbeam et crée le PID de régime turbo.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_powertrainControl_antiLag.reset(jbeamData)`

Remet timeout, PID et état (idle) à zéro et les electrics alsActive/alsState.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_powertrainControl_antiLag.setAntilagState(newState)`

Force l'état interne de la machine à états (off, idle, armed, manualOverride, timeout).

- `newState` (*string*) : Nom de l'état.

#### `controller_powertrainControl_antiLag.setState(data)`

Restaure le mode depuis la table (modes inconnus ignorés).

- `data` (*table|nil*) : Table produite par getState.

#### `controller_powertrainControl_antiLag.updateGFX(dt)`

Chaque frame : fait avancer la machine à états et applique le coefficient d'anti-lag au moteur.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/powertrainControl/antiLag.lua`.*
