# `gameplay_vehiclePerformance`

*Fichier : `lua/ge/extensions/gameplay/vehiclePerformance.lua` · VM : Game Engine (GE) · 189 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_vehiclePerformance` : `extensions.load("gameplay_vehiclePerformance")`, puis la globale `gameplay_vehiclePerformance`

Calcule l'indice de performance (PI) et la classe (X, S, A, B, C, D) d'un véhicule à partir de ses résultats de test automatique (temps 0-60, 1/8 et 1/4 de mile, vitesses de passage, freinage en g, etc.). Fournit aussi les scores agrégés comparés à un véhicule de référence, des utilitaires de classes pour l'interface (exigence de classe minimale) et le choix du véhicule par défaut d'une mission. Les données viennent des configs de véhicule (« Performance Data », « Drag Times », « Power », « Weight »).

## Exemple

```lua
local res = gameplay_vehiclePerformance.getClassFromConfig("sunburst2", "base")
if res then print(res.class.name, res.performanceIndex) end
```

## Remarques

- Classes (PI minimal) : X 101, S 86, A 66, B 41, C 21, D 0.
- Le PI est la somme de neuf termes bias + multiplier * mesure, chacun borné à 0 par le bas ; une mesure absente compte pour 0.
- getClassFromData ne renvoie jamais nil à cause du PI (toujours un nombre) ; il renvoie nil seulement si testData est nil (erreur) ou si le PI est inférieur au plus petit seuil, ce qui ne peut pas arriver avec D à 0.
- getClassFromConfigTable modifie la table 'Drag Times' reçue : elle y ajoute power et weight.
- getAggregateScores divise par testData.time_60, time_1_4, velAt_1_4/velAt_1_8 sans test : des valeurs absentes ou nulles provoquent une erreur ou une division par zéro. Si time_0_60 vaut 0 (60 mph non atteint), il est remis à nil dans testData et le score vaut 0.
- Références du véhicule de certification : puissance 1 395 241 W, poids 1280 kg, 0-60 mph 2,37 s, freinage 1,417 g (valeurs du code).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_vehiclePerformance.buildClassRequirement(name)` | Construit une table au format du badge d'indice de performance pour une exigence de classe seule ; isThreshold = true indique à l'interface d'afficher un seuil minimal (>=). | 150 |
| `gameplay_vehiclePerformance.getAggregateScores(testData)` | Calcule des scores agrégés (puissance, rapport puissance/poids, 0-60 mph, 60 ft, quart de mile, progression de vitesse, freinage) en pourcentage du véhicule de référence. | 48 |
| `gameplay_vehiclePerformance.getClassByName(name)` | Renvoie la ligne de classe correspondant à la lettre donnée. | 131 |
| `gameplay_vehiclePerformance.getClassFromConfig(model, configName)` | Classe d'une config de véhicule identifiée par modèle et nom de config (core_vehicles.getConfig). | 123 |
| `gameplay_vehiclePerformance.getClassFromConfigTable(configTable)` | Lit la classe et le PI déjà enregistrés par le test automatique (config["Performance Data"]) ; à défaut, les recalcule depuis config["Drag Times"], config["Power"] et config["Weight"]. | 99 |
| `gameplay_vehiclePerformance.getClassFromData(testData)` | Calcule le PI à partir des données de test et renvoie la première classe dont le PI minimal est atteint. | 85 |
| `gameplay_vehiclePerformance.getClassFromVehId(vehId)` | Classe d'un véhicule présent dans le jeu, via core_vehicles.getVehicleDetails(vehId).configs. | 116 |
| `gameplay_vehiclePerformance.getClassNames()` | Liste les noms de classes, de la plus haute à la plus basse. | 139 |
| `gameplay_vehiclePerformance.getDefaultMissionVehicleSpec(setupModule)` | Détermine le véhicule par défaut impliqué par le bloc setupModules.vehicles d'une mission (celui que l'interface de réglages présélectionne) : le véhicule du joueur, le premier préréglage, ou rien. | 166 |

### Détail des paramètres

#### `gameplay_vehiclePerformance.buildClassRequirement(name)`

Construit une table au format du badge d'indice de performance pour une exigence de classe seule ; isThreshold = true indique à l'interface d'afficher un seuil minimal (>=).

- `name` (*string*) : Lettre de classe.
- **renvoie** : table|nil {class = {name, description, minPI}, performanceIndex = minPI, isThreshold = true} ou nil si classe inconnue.

#### `gameplay_vehiclePerformance.getAggregateScores(testData)`

Calcule des scores agrégés (puissance, rapport puissance/poids, 0-60 mph, 60 ft, quart de mile, progression de vitesse, freinage) en pourcentage du véhicule de référence.

- `testData` (*table|nil*) : Données de test : time_60, time_1_4, time_0_60, velAt_1_8, velAt_1_4, brakingG, power ({propulsionPowerCombined}), weight.
- **renvoie** : table|nil {powerScore, powerToWeightScore, timeTo60Score, quarterMileScore, speedProgressionScore, brakingGForceScore, time0To60Score}

#### `gameplay_vehiclePerformance.getClassByName(name)`

Renvoie la ligne de classe correspondant à la lettre donnée.

- `name` (*string|nil*) : Lettre de classe (X, S, A, B, C, D).
- **renvoie** : table|nil {name, minPI, description} ou nil.

#### `gameplay_vehiclePerformance.getClassFromConfig(model, configName)`

Classe d'une config de véhicule identifiée par modèle et nom de config (core_vehicles.getConfig).

- `model` (*string*) : Modèle de véhicule.
- `configName` (*string*) : Nom de la config.
- **renvoie** : table|nil {class, performanceIndex} ou nil.

#### `gameplay_vehiclePerformance.getClassFromConfigTable(configTable)`

Lit la classe et le PI déjà enregistrés par le test automatique (config["Performance Data"]) ; à défaut, les recalcule depuis config["Drag Times"], config["Power"] et config["Weight"].

- `configTable` (*table|nil*) : Table de config de véhicule.
- **renvoie** : table|nil {class, performanceIndex} ou nil si aucune donnée.

#### `gameplay_vehiclePerformance.getClassFromData(testData)`

Calcule le PI à partir des données de test et renvoie la première classe dont le PI minimal est atteint.

- `testData` (*table*) : Données de test (time_60, time_330, time_1000, time_1_8, time_1_4, time_0_60, velAt_1_8, velAt_1_4, brakingG).
- **renvoie** : table|nil {class = {name, description, minPI}, performanceIndex}

#### `gameplay_vehiclePerformance.getClassFromVehId(vehId)`

Classe d'un véhicule présent dans le jeu, via core_vehicles.getVehicleDetails(vehId).configs.

- `vehId` (*integer*) : Id du véhicule.
- **renvoie** : table|nil {class, performanceIndex} ou nil.

#### `gameplay_vehiclePerformance.getClassNames()`

Liste les noms de classes, de la plus haute à la plus basse.

- **renvoie** : string[] {"X","S","A","B","C","D"}

#### `gameplay_vehiclePerformance.getDefaultMissionVehicleSpec(setupModule)`

Détermine le véhicule par défaut impliqué par le bloc setupModules.vehicles d'une mission (celui que l'interface de réglages présélectionne) : le véhicule du joueur, le premier préréglage, ou rien.

- `setupModule` (*table|nil*) : Module de setup : enabled, includePlayerVehicle, prioritizePlayerVehicle, vehicles ({model, config}).
- **renvoie** : table|nil {kind = "player"} ou {kind = "preset", model, config} ou nil.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/vehiclePerformance.lua`.*
