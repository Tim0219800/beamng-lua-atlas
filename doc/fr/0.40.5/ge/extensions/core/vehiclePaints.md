# `core_vehiclePaints`

*Fichier : `lua/ge/extensions/core/vehiclePaints.lua` · VM : Game Engine (GE) · 1292 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_vehiclePaints` : `extensions.load("core_vehiclePaints")`, puis la globale `core_vehiclePaints`

Extension GE `core_vehiclePaints` : gestion des peintures de véhicules. Lit les fichiers de bibliothèque de peintures (paints, multiPaintSetups, paintCollections) via core_vehicles, résout les peintures déclarées par chaque modèle et chaque config (`setupPaints`, appelé par core_vehicles.getModel), compare les peintures d'un .pc avec celles du modèle/de la bibliothèque, et tire des peintures aléatoires selon les distributions randomPaintDistribution / randomMultiPaintDistribution. Une peinture est une table {baseColor = {r,g,b,a}, metallic, roughness, clearcoat, clearcoatRoughness, name, class…}.

## Exemple

```lua
-- Peintures aléatoires pour une config
local r = core_vehiclePaints.getRandomPaints('etk800', '854_190d_A')
print(r.type, r.paintName1, r.paintName2, r.paintName3)
-- Trois noms de peinture pour un véhicule existant
local names = core_vehiclePaints.getRandomPaintsByVehicle(be:getPlayerVehicleID(0))
core_vehicle_manager.setVehicleColorsNames(be:getPlayerVehicleID(0), names)
```

## Remarques

- Les peintures de la bibliothèque sont indexées par id ; la peinture spéciale '_missing_paint_' (gris 0.5) sert de valeur de secours. Les entrées marquées `_official` viennent de fichiers du contenu officiel (Author = 'BeamNG' ou chemin officiel).
- getRandomPaintsByVehicle lit `obj.jbeam` (minuscules) alors que le reste du code utilise `veh.JBeam` ; selon la casse acceptée par le moteur pour ce champ, le modèle peut valoir nil, auquel cas la fonction renvoie {'White','White','White'} avec un avertissement.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_vehiclePaints.convertPcPaintsToInfoPaints(pcData, infoData, configName, modelName)` | Comme writePcPaintsAsInfoPaints, mais réutilise une référence existante (peinture du modèle, de la bibliothèque, ou multiPaintSetup équivalent trouvé par signature) quand elle existe, au lieu de dupliquer la peinture. | 1069 |
| `core_vehiclePaints.createRandomMultiPaintSetup(model_key, config_key, avoidDuplicates)` | Génère un multiPaintSetup aléatoire en tirant trois peintures simples (les multiPaintSetups de la distribution sont ignorés). | 1215 |
| `core_vehiclePaints.getRandomPaints(model_key, config_key)` | Tire au hasard une entrée de peinture selon les probabilités de la config (ou à défaut du modèle). Le helper est construit à la première demande. | 1169 |
| `core_vehiclePaints.getRandomPaintsByVehicle(vehId)` | Tire des peintures pour un véhicule existant, d'après son modèle et sa config (extraits de partConfig). | 1195 |
| `core_vehiclePaints.multiPaintSetupSignature(multiPaintSetup)` | Signature d'un ensemble de 3 peintures : {"paint1":..,"paint2":..,"paint3":..} où chaque élément est une paintSignature. | 19 |
| `core_vehiclePaints.paintSignature(paint)` | Chaîne JSON canonique d'une peinture ({baseColor, clearcoat, clearcoatRoughness, metallic, roughness}, 5 décimales) servant à comparer deux peintures. | 17 |
| `core_vehiclePaints.setupPaints(model, configs)` | Prépare les peintures d'un modèle et de ses configs : collecte les peintures directes, les libraryPaints, les paintCollections, résout les multiPaintSetups et les peintures par défaut (modèle d'abord, puis configs) et finalise les classes. Modifie `model` et `configs` en place. Appelée par core_vehicles.getModel. *(interne)* | 351 |
| `core_vehiclePaints.testRandomPaint(model_key, config_key, amount)` | Outil de test : tire `amount` peintures et logue (niveau I) la répartition obtenue. *(interne)* | 1266 |
| `core_vehiclePaints.validatePcPaints(pcData, modelName)` | Analyse les peintures d'un .pc : pour chacune des 3, indique si elle correspond à une peinture du modèle, de la bibliothèque ou est personnalisée, et si l'ensemble correspond à un multiPaintSetup connu. | 1143 |
| `core_vehiclePaints.writePcPaintsAsInfoPaints(pcData, infoData, configName)` | Écrit les peintures d'un .pc comme `defaultMultiPaintSetup` d'un fichier info, avec des peintures explicites (class 'hidden', nommées '<config> Paint N'). Modifie infoData. | 1055 |

### Détail des paramètres

#### `core_vehiclePaints.convertPcPaintsToInfoPaints(pcData, infoData, configName, modelName)`

Comme writePcPaintsAsInfoPaints, mais réutilise une référence existante (peinture du modèle, de la bibliothèque, ou multiPaintSetup équivalent trouvé par signature) quand elle existe, au lieu de dupliquer la peinture.

- `pcData` (*table*) : contenu du .pc
- `infoData` (*table*) : contenu info à compléter (defaultMultiPaintSetup)
- `configName` (*string*) : nom de la config
- `modelName` (*string*) : modèle, pour chercher ses peintures

#### `core_vehiclePaints.createRandomMultiPaintSetup(model_key, config_key, avoidDuplicates)`

Génère un multiPaintSetup aléatoire en tirant trois peintures simples (les multiPaintSetups de la distribution sont ignorés).

- `model_key` (*string*) : modèle
- `config_key` (*string*) : config
- `avoidDuplicates` (*boolean|nil*) : si true, une peinture déjà tirée ne peut pas être retirée
- **renvoie** : table {paintName1, paintName2, paintName3} ('White' en secours)

#### `core_vehiclePaints.getRandomPaints(model_key, config_key)`

Tire au hasard une entrée de peinture selon les probabilités de la config (ou à défaut du modèle). Le helper est construit à la première demande.

- `model_key` (*string*) : nom du modèle
- `config_key` (*string*) : clé de la config (peut être sans config propre : alors le modèle est utilisé)
- **renvoie** : table|nil {type ('paint' ou multiPaintSetup), paintName1, paintName2, paintName3, probability}

#### `core_vehiclePaints.getRandomPaintsByVehicle(vehId)`

Tire des peintures pour un véhicule existant, d'après son modèle et sa config (extraits de partConfig).

- `vehId` (*integer|nil*) : identifiant du véhicule
- **renvoie** : string[] {nom1, nom2, nom3} utilisable par core_vehicle_manager.setVehicleColorsNames ; {'White','White','White'} si le véhicule ou la config est introuvable

#### `core_vehiclePaints.multiPaintSetupSignature(multiPaintSetup)`

Signature d'un ensemble de 3 peintures : {"paint1":..,"paint2":..,"paint3":..} où chaque élément est une paintSignature.

- `multiPaintSetup` (*table*) : table avec paint1, paint2, paint3 (peintures complètes)
- **renvoie** : string signature

#### `core_vehiclePaints.paintSignature(paint)`

Chaîne JSON canonique d'une peinture ({baseColor, clearcoat, clearcoatRoughness, metallic, roughness}, 5 décimales) servant à comparer deux peintures.

- `paint` (*table*) : peinture complète
- **renvoie** : string signature

#### `core_vehiclePaints.setupPaints(model, configs)`

Prépare les peintures d'un modèle et de ses configs : collecte les peintures directes, les libraryPaints, les paintCollections, résout les multiPaintSetups et les peintures par défaut (modèle d'abord, puis configs) et finalise les classes. Modifie `model` et `configs` en place. Appelée par core_vehicles.getModel.

- `model` (*table*) : table du modèle (model.key, model.paints…)
- `configs` (*table<string, table>*) : configs du modèle

#### `core_vehiclePaints.testRandomPaint(model_key, config_key, amount)`

Outil de test : tire `amount` peintures et logue (niveau I) la répartition obtenue.

- `model_key` (*string*) : modèle
- `config_key` (*string*) : config
- `amount` (*integer*) : nombre de tirages

#### `core_vehiclePaints.validatePcPaints(pcData, modelName)`

Analyse les peintures d'un .pc : pour chacune des 3, indique si elle correspond à une peinture du modèle, de la bibliothèque ou est personnalisée, et si l'ensemble correspond à un multiPaintSetup connu.

- `pcData` (*table*) : contenu du .pc
- `modelName` (*string*) : nom du modèle
- **renvoie** : table {paints = {{index, source ('model'|'library'|'custom'), modelPaintName, libraryPaintId, libraryPaintName, resolvedReference}}, multiPaintSetup = {found, source, name, id}, defaultStorageMode ('individualPaints'|'multiPaintSetup'), canOverridePaints, modelDefaultColors, modelDefaultMultiPaintSetup}

#### `core_vehiclePaints.writePcPaintsAsInfoPaints(pcData, infoData, configName)`

Écrit les peintures d'un .pc comme `defaultMultiPaintSetup` d'un fichier info, avec des peintures explicites (class 'hidden', nommées '<config> Paint N'). Modifie infoData.

- `pcData` (*table*) : contenu du .pc (champ paints)
- `infoData` (*table*) : contenu info à compléter
- `configName` (*string*) : nom de la config

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/vehiclePaints.lua`.*
