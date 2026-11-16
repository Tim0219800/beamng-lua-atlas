# `controller_steering_rearWheelSteering`

*Fichier : `lua/vehicle/controller/steering/rearWheelSteering.lua` · VM : Véhicule · 64 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `steering/rearWheelSteering` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire de direction des roues arrière. En mode feedForward, il calcule une sortie de braquage arrière à partir d'une carte (vitesse des roues, braquage avant) et la publie dans electrics.values.rws (nom configurable) pour qu'un contrôle de direction jbeam l'utilise. Le mode closedLoop n'est pas implémenté.

## Remarques

- Clés jbeam lues : mode ("feedForward" ou "closedLoop", défaut feedForward), rearSteeringOutputElectricsName ("rws"), feedForwardMapData (données d'interpolatedMap : x = vitesse en m/s, y = braquage avant electrics steering_input -> sortie), obligatoire en feedForward.
- Lit electrics.values.steering_input et wheelspeed.
- closedLoop : log W « not implemented » et updateGFX ne fait rien.
- Mode invalide : log E mais M.updateGFX reçoit nil.
- Sans feedForwardMapData : log E, init retourne, la carte reste nil et updateGFX (déjà affecté) échouera à l'appel de feedForwardMap:get.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_steering_rearWheelSteering.init(jbeamData)` | Choisit la fonction de mise à jour selon le mode et charge la carte feedForward. *(interne)* | 35 |
| `controller_steering_rearWheelSteering.reset(jbeamData)` | Remet l'electric de sortie à 0. *(interne)* | 31 |

### Détail des paramètres

#### `controller_steering_rearWheelSteering.init(jbeamData)`

Choisit la fonction de mise à jour selon le mode et charge la carte feedForward.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_steering_rearWheelSteering.reset(jbeamData)`

Remet l'electric de sortie à 0.

- `jbeamData` (*table*) : Données jbeam.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |
| `updateGFX` | function|nil | Affecté dans init selon le mode. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/steering/rearWheelSteering.lua`.*
