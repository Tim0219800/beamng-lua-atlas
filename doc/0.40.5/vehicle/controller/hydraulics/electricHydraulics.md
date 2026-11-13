# `controller_hydraulics_electricHydraulics`

*Fichier : `lua/vehicle/controller/hydraulics/electricHydraulics.lua` · VM : Véhicule · 36 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `hydraulics/electricHydraulics` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Petit contrôleur auxiliaire pour un groupe hydraulique électrique : met la valeur electrics motorThrottleElectricsName à 1 dès qu'une des valeurs de commande listées est non nulle, sinon à 0 (pour alimenter le moteur de la pompe seulement quand une fonction hydraulique est demandée).

## Remarques

- Clés jbeam : controlElectricsName (nom ou liste de noms de valeurs electrics à surveiller), motorThrottleElectricsName (nom de la valeur electrics de sortie ; aucune valeur par défaut : nil provoquerait une erreur).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_hydraulics_electricHydraulics.init(jbeamData)` | Lit les noms electrics. *(interne)* | 26 |
| `controller_hydraulics_electricHydraulics.reset(jbeamData)` | Ne fait rien. *(interne)* | 23 |
| `controller_hydraulics_electricHydraulics.updateGFX(dt)` | Met à jour la valeur de sortie 0/1. *(interne)* | 13 |

### Détail des paramètres

#### `controller_hydraulics_electricHydraulics.init(jbeamData)`

Lit les noms electrics.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_hydraulics_electricHydraulics.reset(jbeamData)`

Ne fait rien.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_hydraulics_electricHydraulics.updateGFX(dt)`

Met à jour la valeur de sortie 0/1.

- `dt` (*number*) : Pas de temps (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/hydraulics/electricHydraulics.lua`.*
