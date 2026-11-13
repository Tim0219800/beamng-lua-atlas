# `cruiseControl`

*Fichier : `lua/vehicle/extensions/cruiseControl.lua` · VM : Véhicule · 139 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `cruiseControl` : `extensions.load (VM véhicule)("cruiseControl")`, puis la globale `cruiseControl`

Régulateur de vitesse (cruise control) : un PID pilote electrics.values.throttleOverride pour maintenir la vitesse de roue (electrics.values.wheelspeed, m/s) à une consigne. Il s'arrête au freinage, après un freinage post-crash et ne pilote pas la pédale si le conducteur appuie sur l'embrayage ou l'accélérateur. Un moddeur peut le piloter via setSpeed, changeSpeed, holdCurrentSpeed et setEnabled.

## Exemple

```lua
extensions.cruiseControl.setSpeed(100 / 3.6)  -- 100 km/h en m/s, active le régulateur
extensions.cruiseControl.setEnabled(false)
```

## Remarques

- Unités : vitesses en m/s. M.minimumSpeed = 30 / 3.6 (30 km/h) : la consigne est toujours bornée à ce minimum ; holdCurrentSpeed ne fait rien si la vitesse actuelle est inférieure.
- Écrit electrics.values.throttleOverride (nil quand désactivé), cruiseControlTarget (consigne) et cruiseControlActive (booléen). Lit electrics.values.wheelspeed et postCrashBrakeTriggered. Envoie l'état à l'UI avec le hook 'CruiseControlState' ({targetSpeed, isEnabled}) si le premier joueur est assis.
- La consigne est rampée (accélération cible 3 m/s², modifiable par setTargetAcceleration) pour éviter l'emballement de l'intégrateur ; le PID est newPIDStandard(0.3, 2, 0, ...) et la sortie est lissée par un lisseur temporel.
- Si input.throttle > 0 ou input.clutch > 0, le régulateur reste actif mais n'écrase pas la pédale : throttleOverride prend la valeur de input.throttle.
- hasReachedTargetSpeed devient vrai quand l'erreur relative à la consigne est <= 3 %.
- disableOnReset (local, toujours false) : le régulateur reste donc armé au reset du véhicule ; seul hasReachedTargetSpeed et l'état interne sont remis à zéro.
- Anomalie : le log de onReset dit 'Cruise Control online' à chaque reset.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `cruiseControl.changeSpeed(offset)` | Active le régulateur et ajoute un décalage à la consigne actuelle. | 81 |
| `cruiseControl.getConfiguration()` | Renvoie la configuration courante. | 123 |
| `cruiseControl.holdCurrentSpeed()` | Fixe la consigne sur la vitesse actuelle si elle dépasse la vitesse minimale. | 89 |
| `cruiseControl.onReset()` | Hook de reset du véhicule : remet hasReachedTargetSpeed, l'état et le lisseur à zéro. *(interne)* *(hook)* | 23 |
| `cruiseControl.requestState()` | Publie l'état (electrics.cruiseControlTarget/Active) et envoie 'CruiseControlState' à l'UI. | 110 |
| `cruiseControl.setEnabled(enabled)` | Active ou désactive le régulateur ; remet throttleOverride à nil et le lisseur à zéro. | 97 |
| `cruiseControl.setSpeed(speed)` | Active le régulateur avec la consigne donnée (bornée au minimum). | 73 |
| `cruiseControl.setTargetAcceleration(target)` | Fixe l'accélération (en m/s²) de la rampe de consigne. | 106 |
| `cruiseControl.updateGFX(dt)` | Appelé chaque frame : si actif, applique la régulation PID et gère les conditions d'arrêt. *(interne)* | 34 |

### Détail des paramètres

#### `cruiseControl.changeSpeed(offset)`

Active le régulateur et ajoute un décalage à la consigne actuelle.

- `offset` (*number*) : Variation en m/s (positive ou négative).

#### `cruiseControl.getConfiguration()`

Renvoie la configuration courante.

- **renvoie** : table {isEnabled, targetSpeed, minimumSpeed, hasReachedTargetSpeed}.

#### `cruiseControl.setEnabled(enabled)`

Active ou désactive le régulateur ; remet throttleOverride à nil et le lisseur à zéro.

- `enabled` (*boolean*) : true pour activer.

#### `cruiseControl.setSpeed(speed)`

Active le régulateur avec la consigne donnée (bornée au minimum).

- `speed` (*number*) : Consigne en m/s.

#### `cruiseControl.setTargetAcceleration(target)`

Fixe l'accélération (en m/s²) de la rampe de consigne.

- `target` (*number*) : Accélération cible, défaut 3.

#### `cruiseControl.updateGFX(dt)`

Appelé chaque frame : si actif, applique la régulation PID et gère les conditions d'arrêt.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `hasReachedTargetSpeed` | boolean | true quand la vitesse est à moins de 3 % de la consigne. |
| `minimumSpeed` | number | Consigne minimale en m/s (30 km/h). |

**Évènements UI (guihooks.trigger) :** `CruiseControlState`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/cruiseControl.lua`.*
