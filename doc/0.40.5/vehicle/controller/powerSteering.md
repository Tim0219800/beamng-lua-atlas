# `controller_powerSteering`

*Fichier : `lua/vehicle/controller/powerSteering.lua` · VM : Véhicule · 56 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `powerSteering` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire d'assistance de direction. Règle hydros.wheelPowerSteeringCoef (coefficient d'assistance appliqué par le moteur de direction) : valeur fixe 1 + constantOffset, ou, si les paramètres le permettent, une valeur qui varie linéairement avec la vitesse des roues entre speedSlow et speedFast.

## Remarques

- Clés jbeam lues dans init : strengthFast (1), strengthSlow (1), speedSlow (0 m/s), speedFast (0 m/s), constantOffset (-0.2).
- La variation avec la vitesse n'est activée que si speedFast > speedSlow ET strengthFast > strengthSlow ; sinon M.updateGFX reste nil et seul le coefficient fixe 1 + constantOffset est appliqué (une assistance qui diminuerait avec la vitesse n'est donc pas gérée).
- Formule : coef = max(max((strengthFast-strengthSlow) * (min(vitesse, speedFast) - speedSlow) / (speedFast-speedSlow) + strengthSlow, 0) + constantOffset, 0), vitesse = electrics.values.wheelspeed (m/s).
- M.updateGFX est nil à la déclaration et réaffecté dans init.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_powerSteering.init(jbeamData)` | Lit les clés jbeam, fixe hydros.wheelPowerSteeringCoef = 1 + constantOffset et active updateGFX si l'assistance varie avec la vitesse. *(interne)* | 34 |
| `controller_powerSteering.reset()` | Remet hydros.wheelPowerSteeringCoef à 1 + constantOffset. *(interne)* | 30 |

### Détail des paramètres

#### `controller_powerSteering.init(jbeamData)`

Lit les clés jbeam, fixe hydros.wheelPowerSteeringCoef = 1 + constantOffset et active updateGFX si l'assistance varie avec la vitesse.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |
| `updateGFX` | function|nil | Fonction de mise à jour de l'assistance selon la vitesse ; nil si le contrôleur ne varie pas. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/powerSteering.lua`.*
