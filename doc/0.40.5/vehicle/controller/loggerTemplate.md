# `controller_loggerTemplate`

*Fichier : `lua/vehicle/controller/loggerTemplate.lua` · VM : Véhicule · 103 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `loggerTemplate` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Modèle de contrôleur d'enregistrement de données (type "auxiliary", defaultOrder 100000) : à chaque image il ajoute à un CSV en mémoire (bibliothèque csvlib) temps, accélérateur, frein, énergie stockée des batteries électriques et puissance des moteurs électriques. saveLogToCSV écrit le fichier « testLog ». À copier comme point de départ pour un enregistreur personnalisé.

## Remarques

- Aucune clé jbeam n'est lue. Le chrono est incrémenté par update(dt) ; csvData:write('testLog') écrit le fichier sans extension explicite (comportement de csvlib).
- La puissance est outputTorque1 * outputAV1 (W) sommée sur les dispositifs de type "electricMotor".

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_loggerTemplate.init()` | Crée le CSV (colonnes time, throttle, brake, batteryCapacity, motorPower) et remet le chrono à 0. *(interne)* | 83 |
| `controller_loggerTemplate.reset()` | Recrée un CSV vide et remet le chrono à 0. *(interne)* | 77 |
| `controller_loggerTemplate.saveLogToCSV()` | Écrit le CSV sur disque sous le nom testLog. | 19 |
| `controller_loggerTemplate.update(dt)` | Incrémente le chrono interne. *(interne)* | 70 |
| `controller_loggerTemplate.updateFixedStep(dt)` | Ne fait rien. *(interne)* | 60 |
| `controller_loggerTemplate.updateGFX(dt)` | Ajoute une ligne de données au CSV. *(interne)* | 55 |

### Détail des paramètres

#### `controller_loggerTemplate.update(dt)`

Incrémente le chrono interne.

- `dt` (*number*) : Pas de temps (s).

#### `controller_loggerTemplate.updateFixedStep(dt)`

Ne fait rien.

- `dt` (*number*) : Pas de temps (s).

#### `controller_loggerTemplate.updateGFX(dt)`

Ajoute une ligne de données au CSV.

- `dt` (*number*) : Pas de temps (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultOrder` | number | 100000. |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/loggerTemplate.lua`.*
