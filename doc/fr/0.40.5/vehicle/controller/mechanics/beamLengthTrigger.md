# `controller_mechanics_beamLengthTrigger`

*Fichier : `lua/vehicle/controller/mechanics/beamLengthTrigger.lua` · VM : Véhicule · 127 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `mechanics/beamLengthTrigger` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur de mécanique (type "auxiliary") qui met une valeur electrics à une valeur de déclenchement quand la longueur d'une ou plusieurs poutres (par tag) devient plus courte ou plus longue qu'un seuil, sinon à 0.

## Remarques

- Clés jbeam (défaut) : triggerBeamTag (obligatoire), triggerLengthThreshold (nombre en m, obligatoire), comparison ("shorter" ou "longer", obligatoire), aggregation (si plusieurs poutres : "average" par défaut, "minimum" ou "maximum"), electricsName ("<nomContrôleur>_trigger"), electricsTriggerValue (1).
- En cas de configuration invalide, une erreur est journalisée et updateGFX reste nil (contrôleur inactif).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_mechanics_beamLengthTrigger.init(jbeamData)` | Lit la configuration, retrouve les poutres et choisit les fonctions de comparaison et d'agrégation. *(interne)* | 71 |
| `controller_mechanics_beamLengthTrigger.reset(jbeamData)` | Remet la valeur electrics à 0. *(interne)* | 65 |
| `controller_mechanics_beamLengthTrigger.updateGFX(dt)` | Écrit la valeur electrics selon la longueur mesurée. (assignée dynamiquement) *(interne)* | dyn |

### Détail des paramètres

#### `controller_mechanics_beamLengthTrigger.init(jbeamData)`

Lit la configuration, retrouve les poutres et choisit les fonctions de comparaison et d'agrégation.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_mechanics_beamLengthTrigger.reset(jbeamData)`

Remet la valeur electrics à 0.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_mechanics_beamLengthTrigger.updateGFX(dt)`

Écrit la valeur electrics selon la longueur mesurée. (assignée dynamiquement)

- `dt` (*number*) : Pas de temps (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `getBeamLength`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/mechanics/beamLengthTrigger.lua`.*
