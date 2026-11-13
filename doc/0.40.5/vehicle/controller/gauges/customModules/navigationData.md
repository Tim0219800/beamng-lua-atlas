# `controller_gauges_customModules_navigationData`

*Fichier : `lua/vehicle/controller/gauges/customModules/navigationData.lua` · VM : Véhicule · 48 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `gauges/customModules/navigationData` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Module de données pour genericGauges : alimente une carte de navigation dans la page HTML. À la configuration il demande à ui_uiNavi (moteur de jeu) d'initialiser la carte du tableau de bord ; à chaque mise à jour il envoie la position (x, y) et l'orientation du véhicule (degrés) par streamJS("updateMap").

## Remarques

- setupGaugeData reçoit en second argument la texture HTML fournie par genericGauges ; elle est indispensable.
- moduleData n'est pas rempli : les données partent directement dans le flux updateMap {x, y, rotation}.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_gauges_customModules_navigationData.init(jbeamData)` | Ne fait rien. *(interne)* | 37 |
| `controller_gauges_customModules_navigationData.reset()` | Réinitialise l'état interne du module. *(interne)* | 34 |
| `controller_gauges_customModules_navigationData.setupGaugeData(properties, htmlTexture)` | Appelé par genericGauges avec les propriétés demandées dans displayData.customModules : aucune propriété n'est lue. *(interne)* | 29 |
| `controller_gauges_customModules_navigationData.updateGFX(dt)` | Ne fait rien (la mise à jour se fait par updateGaugeData). *(interne)* | 19 |
| `controller_gauges_customModules_navigationData.updateGaugeData(moduleData, dt)` | Appelé par genericGauges avant chaque envoi : remplit moduleData avec les valeurs demandées. *(interne)* | 22 |

### Détail des paramètres

#### `controller_gauges_customModules_navigationData.init(jbeamData)`

Ne fait rien.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_gauges_customModules_navigationData.setupGaugeData(properties, htmlTexture)`

Appelé par genericGauges avec les propriétés demandées dans displayData.customModules : aucune propriété n'est lue.

- `properties` (*table*) : Propriétés demandées (non utilisées).
- `htmlTexture` (*table*) : Texture HTML du tableau de bord (htmlTexture.new).

#### `controller_gauges_customModules_navigationData.updateGFX(dt)`

Ne fait rien (la mise à jour se fait par updateGaugeData).

- `dt` (*number*) : Pas de temps (s).

#### `controller_gauges_customModules_navigationData.updateGaugeData(moduleData, dt)`

Appelé par genericGauges avant chaque envoi : remplit moduleData avec les valeurs demandées.

- `moduleData` (*table*) : Table de données du module, envoyée ensuite à la page HTML.
- `dt` (*number*) : Temps écoulé depuis le dernier envoi (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `getDirectionVector`, `getID`, `getPositionXYZ`, `queueGameEngineLua`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/gauges/customModules/navigationData.lua`.*
