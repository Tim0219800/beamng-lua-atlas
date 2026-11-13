# `perfectLaunch`

*Fichier : `lua/vehicle/extensions/perfectLaunch.lua` · VM : Véhicule · 128 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `perfectLaunch` : `extensions.load (VM véhicule)("perfectLaunch")`, puis la globale `perfectLaunch`

Aide au départ arrêté 'parfait' (launch control) pour dragsters : gaz à fond, puis contrôle PI de la patinage des roues motrices et du lacet en modulant les gaz, avec maintien de la trajectoire via l'extension straightLine. Séquence : prepare(cible) (véhicule gelé, gaz à fond), go() (dégel, départ), stop() (remise à zéro).

## Exemple

```lua
extensions.perfectLaunch.prepare(vec3(0, 400, 0))
extensions.perfectLaunch.go()
-- M.launchFailed passe à true si le véhicule part en tête-à-queue
```

## Remarques

- États : idle, prepareThrottle, prepareBrake (attend), go. prepare gèle le véhicule (controller.mainController.setFreeze(1)), met la boîte en mode 'arcade', pause l'action ESC et appelle straightLine.setTargetDirection(cible, 'road').
- En 'go', les gaz sont calculés ainsi : slipError = (patinage max des roues avec différentiel - 0,2) + lacet parasite * 80 (doublé si négatif) ; throttle = clamp(1 - (0,5 * slipError + 3,5 * intégrale), 0,05, 1), à 1 au-delà de 0,95. Les gaz sont envoyés par input.event('throttle', throttle, 2).
- launchFailed devient true si le taux de lacet lissé dépasse 0,5.
- onInit recharge l'extension straightLine (extensions.reload) et la ré-initialise ; il est aussi utilisé comme onReset.
- Dépend de drivetrain.esc.isExisting (champ absent du faux objet esc de drivetrain.lua : toujours nil, donc l'ESC n'est jamais mis en pause) et de la globale straightLine.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `perfectLaunch.go()` | Lance le départ : dégèle le véhicule et passe en état 'go'. | 35 |
| `perfectLaunch.onInit()` | Hook d'initialisation : état 'idle', remise à zéro des régulations, mode de boîte 'arcade' et rechargement de straightLine. *(interne)* *(hook)* | 18 |
| `perfectLaunch.onReset()` | Même fonction que onInit. *(interne)* *(hook)* | 18 |
| `perfectLaunch.prepare(target)` | Prépare le départ : gèle le véhicule, gaz à fond, donne la direction cible à straightLine. | 40 |
| `perfectLaunch.stop()` | Arrête tout : relâche frein à main, frein et gaz, dégèle, arrête straightLine et réinitialise. | 50 |
| `perfectLaunch.updateGFX(dt)` | Appelé chaque frame : exécute la machine à états et le contrôle des gaz, puis straightLine.updateGFX. *(interne)* | 59 |

### Détail des paramètres

#### `perfectLaunch.prepare(target)`

Prépare le départ : gèle le véhicule, gaz à fond, donne la direction cible à straightLine.

- `target` (*vec3|table*) : Cible ou direction passée à straightLine.setTargetDirection (déduit du code).

#### `perfectLaunch.updateGFX(dt)`

Appelé chaque frame : exécute la machine à états et le contrôle des gaz, puis straightLine.updateGFX.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `launchFailed` | boolean | true si un tête-à-queue (lacet lissé > 0,5) a été détecté pendant le départ. |

## Appels vers le moteur (C++)

- `obj:` `getDirectionVector`, `getVelocity`, `getYawAngularVelocity`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/perfectLaunch.lua`.*
