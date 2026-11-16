# `controller_pneumatics_crossFlowValve`

*Fichier : `lua/vehicle/controller/pneumatics/crossFlowValve.lua` · VM : Véhicule · 104 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `pneumatics/crossFlowValve` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire simulant une vanne de transfert d'air entre deux réservoirs (energyStorage) : l'air passe du réservoir source vers le réservoir cible tant que la pression source dépasse un minimum et celle de la cible. Le débit dépend de la section de la vanne et de la différence de pression (équation d'orifice).

## Remarques

- Clés jbeam lues dans init : sourceTankName ("mainAirTank"), targetTankName ("auxAirTank"), flowPipeRadius (0.0075 m), flowValveRadius (0.2 x flowPipeRadius), sourceTankMinPressure (Pa, 0) ou sourceTankMinPressurePSI (converti en Pa absolus : psi x 6894.757 + 101325), pressureDiffForFullFlow (34473.8 Pa = 5 psi) ou pressureDiffForFullFlowPSI (différence, sans pression atmosphérique).
- Si un des deux réservoirs est introuvable, un log D est écrit et updateFixedStep est remplacé par nop (la vanne ne fait rien).
- Le transfert est à sens unique source -> cible.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_pneumatics_crossFlowValve.init(jbeamData)` | Récupère les réservoirs source/cible et calcule les sections et seuils de pression à partir des clés jbeam. *(interne)* | 66 |
| `controller_pneumatics_crossFlowValve.reset()` | Ne fait rien. *(interne)* | 62 |
| `controller_pneumatics_crossFlowValve.updateFixedStep(dt)` | Pas physique : calcule le débit d'air entre les réservoirs et transfère l'énergie stockée de la source vers la cible, en mettant à jour currentPressure des deux. *(interne)* | 34 |

### Détail des paramètres

#### `controller_pneumatics_crossFlowValve.init(jbeamData)`

Récupère les réservoirs source/cible et calcule les sections et seuils de pression à partir des clés jbeam.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_pneumatics_crossFlowValve.updateFixedStep(dt)`

Pas physique : calcule le débit d'air entre les réservoirs et transfère l'énergie stockée de la source vers la cible, en mettant à jour currentPressure des deux.

- `dt` (*number*) : Pas physique en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/pneumatics/crossFlowValve.lua`.*
