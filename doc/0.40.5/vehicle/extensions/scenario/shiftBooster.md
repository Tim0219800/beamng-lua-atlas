# `scenario_shiftBooster`

*Fichier : `lua/vehicle/extensions/scenario/shiftBooster.lua` · VM : Véhicule · 80 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `scenario_shiftBooster` : `extensions.load (VM véhicule)("scenario_shiftBooster")`, puis la globale `scenario_shiftBooster`

Extension de scénario de démonstration : donne un coup de pouce (« boost ») au véhicule en lui appliquant un vent constant dirigé selon son axe avant via obj:setWind. Peut se déclencher à chaque changement de rapport montant (listenToShift) ou manuellement (manualBoost). Le boost dure `boostTime` secondes, décompté dans updateGFX.

## Exemple

```lua
scenario_shiftBooster.manualBoost(1.0, 500) -- boost 1 s, force 500
scenario_shiftBooster.listenToShift()  -- boost 0.4 s à chaque shiftUp
```

## Remarques

- listenToShift remplace drivetrain.shiftUp ; or drivetrain.lua (chargé comme globale `drivetrain` par main.lua) ne contient aucune fonction shiftUp en 0.40.5. up_for_real vaut donc nil et le remplacement plantera au premier appel : code obsolète (incohérence repérée).
- La force par défaut est 300 (unité du vent de obj:setWind, déduite du code) ; le vecteur direction est multiplié par la force.
- Quand boostTime tombe sous 0.01, updateGFX remet le vent à (0,0,0) à chaque frame, ce qui écrase tout autre vent posé par le véhicule.
- applyBoost fait un print à chaque appel (bruyant dans les logs).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `scenario_shiftBooster.listenToShift()` | Enveloppe drivetrain.shiftUp : après le vrai changement de rapport, règle boostTime à 0.4 s, affiche un message UI « Boooooost! » (5 s) et applique un boost de force par défaut. | 27 |
| `scenario_shiftBooster.manualBoost(duration, strength)` | Démarre un boost manuel : fixe boostTime à la durée donnée et applique immédiatement le boost. | 68 |
| `scenario_shiftBooster.onDebugDraw(focusPos)` | Hook de dessin debug : si un boost est actif, dessine une sphère de rayon boostTime 2 m au-dessus du véhicule, de couleur variable. *(interne)* *(hook)* | 58 |
| `scenario_shiftBooster.onVehicleScenarioData(data)` | Hook de configuration scénario ; corps vide, aucune donnée n'est lue. *(interne)* *(hook)* | 65 |
| `scenario_shiftBooster.updateGFX(dt)` | Appelé à chaque frame graphique par la boucle principale (extensions.hook('updateGFX')). Tant que boostTime > 0.01 : le décrémente de dt et réapplique le boost ; sinon remet le vent à zéro. *(interne)* | 46 |

### Détail des paramètres

#### `scenario_shiftBooster.manualBoost(duration, strength)`

Démarre un boost manuel : fixe boostTime à la durée donnée et applique immédiatement le boost.

- `duration` (*number*) : Durée du boost en secondes.
- `strength` (*number|nil*) : Intensité multipliée au vecteur direction ; 300 si nil.

#### `scenario_shiftBooster.onDebugDraw(focusPos)`

Hook de dessin debug : si un boost est actif, dessine une sphère de rayon boostTime 2 m au-dessus du véhicule, de couleur variable.

- `focusPos` (*vec3*) : Position du focus caméra (non utilisée).

#### `scenario_shiftBooster.onVehicleScenarioData(data)`

Hook de configuration scénario ; corps vide, aucune donnée n'est lue.

- `data` (*table*) : Données du scénario (ignorées).

#### `scenario_shiftBooster.updateGFX(dt)`

Appelé à chaque frame graphique par la boucle principale (extensions.hook('updateGFX')). Tant que boostTime > 0.01 : le décrémente de dt et réapplique le boost ; sinon remet le vent à zéro.

- `dt` (*number*) : Pas de temps de simulation en secondes.

## Appels vers le moteur (C++)

- `obj:` `getDirectionVector`, `getPosition`, `setWind`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/scenario/shiftBooster.lua`.*
