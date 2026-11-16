# `controlSystems`

*Fichier : `lua/common/controlSystems.lua` · VM : Commun (GE + véhicule) · 191 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("controlSystems")`

Fournit deux régulateurs PID : forme parallèle (newPIDParallel, gains kP/kI/kD) et forme standard (newPIDStandard, kP avec temps intégral tI et dérivé tD). Les deux dérivent sur la variable de process (et non sur l'erreur) pour éviter les pics quand la consigne change, et gèrent saturation de sortie, anti-windup de l'intégrale et zone morte d'erreur. Un moddeur s'en sert pour réguler un couple, un régime, une vitesse, etc.

## Exemple

```lua
local pid = newPIDParallel(1, 0.5, 0.1, 0, 1)
-- à chaque pas de temps :
local output, err = pid:get(currentValue, targetValue, dt)
```

## Remarques

- Les constructeurs sont des fonctions globales ; les objets renvoyés ont une méthode get (affectée dans la table de données) qui pointe vers getMethod, ou getWithDebugMethod si setDebug(true).
- get renvoie deux valeurs : la sortie du PID et l'erreur courante (utile pour détecter un état quasi stable).
- dt doit être > 0 (division par dt dans le terme dérivé).
- Si |erreur| < errorDeadzone, l'erreur est mise à 0 ET l'intégrale remise à 0.
- integralInCoef s'applique quand l'intégrale et l'erreur sont de signes opposés ou nuls (l'intégrale diminue), integralOutCoef quand elles ont le même signe (l'intégrale grandit).
- Bug probable : PIDParallel:setConfig calcule maxIntegral avec le paramètre kI (et non self.kI) : appeler setConfig sans kI ni maxIntegral provoque une erreur arithmétique sur nil.
- Incohérence : PIDStandard:reset ne remet à zéro ni error ni output (contrairement à PIDParallel:reset).
- Les méthodes debug utilisent guihooks.graph pour tracer error, integral et output.

## Classe `PIDParallel`

Objet renvoyé par newPIDParallel. Champs publics : kP, kI, kD, error, integral, output, minOutput, maxOutput, minIntegral, maxIntegral, errorDeadzone, integralInCoef, integralOutCoef, lastProcessVariable, debugEnabled, get.

| Méthode | Description | Ligne |
|---|---|---|
| `PIDParallel:drawDebug()` | Envoie error, integral et output au graphe debug via guihooks.graph. | 89 |
| `PIDParallel:dump()` | Affiche la configuration du PID avec print. | 98 |
| `PIDParallel:get(processVariable, setPoint, dt)` | Alias de champ vers getMethod (ou getWithDebugMethod en mode debug). Utilisation : pid:get(processVariable, setPoint, dt). | dyn |
| `PIDParallel:getMethod(processVariable, setPoint, dt)` | Calcule la sortie du PID pour ce pas de temps et met à jour error, integral, output, lastProcessVariable. | 58 |
| `PIDParallel:getWithDebugMethod(processVariable, setPoint, dt)` | Comme getMethod mais appelle aussi drawDebug. Ne renvoie que la sortie (pas l'erreur). | 76 |
| `PIDParallel:reset()` | Remet error, output, integral et lastProcessVariable à 0. | 82 |
| `PIDParallel:setConfig(kP, kI, kD, minOutput, maxOutput, integralInCoef, integralOutCoef, minIntegral, maxIntegral, errorDeadzone)` | Modifie les paramètres ; chaque argument nil conserve la valeur actuelle. | 41 |
| `PIDParallel:setDebug(debugEnabled)` | Active/désactive le tracé debug en changeant la méthode get. | 93 |

## Classe `PIDStandard`

Objet renvoyé par newPIDStandard. Champs publics : kP, tICoef (1/tI), tD, error, integral, output, minOutput, maxOutput, minIntegral, maxIntegral, errorDeadzone, integralInCoef, integralOutCoef, lastProcessVariable, debugEnabled, get.

| Méthode | Description | Ligne |
|---|---|---|
| `PIDStandard:drawDebug()` | Envoie error, integral et output au graphe debug via guihooks.graph. | 179 |
| `PIDStandard:dump()` | Affiche la configuration du PID avec print. | 188 |
| `PIDStandard:get(processVariable, setPoint, dt)` | Alias de champ vers getMethod (ou getWithDebugMethod en mode debug). Utilisation : pid:get(processVariable, setPoint, dt). | dyn |
| `PIDStandard:getMethod(processVariable, setPoint, dt)` | Calcule la sortie du PID standard pour ce pas de temps. | 151 |
| `PIDStandard:getWithDebugMethod(processVariable, setPoint, dt)` | Comme getMethod mais appelle drawDebug ; ne renvoie que la sortie. | 168 |
| `PIDStandard:reset()` | Remet integral et lastProcessVariable à 0 (error et output non touchés). | 174 |
| `PIDStandard:setConfig(kP, tI, tD, minOutput, maxOutput, integralInCoef, integralOutCoef, minIntegral, maxIntegral, errorDeadzone)` | Modifie les paramètres ; nil conserve la valeur. tI n'est pris en compte que s'il est > 0. | 134 |
| `PIDStandard:setDebug(debugEnabled)` | Active/désactive le tracé debug en changeant la méthode get. | 183 |

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `newPIDParallel(kP, kI, kD, minOutput, maxOutput, integralInCoef, integralOutCoef, minIntegral, maxIntegral, errorDeadzone)` | Crée un PID en forme parallèle : sortie = kP*erreur + kI*intégrale + kD*(−dPV/dt). | 18 |
| `newPIDStandard(kP, tI, tD, minOutput, maxOutput, integralInCoef, integralOutCoef, minIntegral, maxIntegral, errorDeadzone)` | Crée un PID en forme standard : sortie = kP*(erreur + intégrale/tI + tD*(−dPV/dt)). | 111 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/controlSystems.lua`.*
