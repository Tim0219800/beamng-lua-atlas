# `util_screenshotCreator_thumbnailTargets`

*Fichier : `lua/ge/extensions/util/screenshotCreator/thumbnailTargets.lua` · VM : Game Engine (GE) · 135 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_thumbnailTargets` : `extensions.load("util_screenshotCreator_thumbnailTargets")`, puis la globale `util_screenshotCreator_thumbnailTargets`

Aide à la construction de la liste des cibles de vignettes (couples modèle/config) pour le compositeur de vignettes. Il valide les cibles reçues de l'interface (au plus 2000, noms de 128 caractères maximum, doublons supprimés), les transforme en éléments de travail à partir des données de core_vehicles, produit le catalogue des modèles et configs pour l'interface (avec l'indicateur « livré » de shippedConfigs) et gère le cas par défaut où seule la config du véhicule du joueur est photographiée.

## Remarques

- Un élément de travail est {modelName, modelKey, configName, isDefaultConfig} ; modelKey vaut configData.model_key s'il existe, sinon le nom du modèle.
- resolveStartMessage sans targets exige un véhicule joueur dont partConfig est un fichier .pc nommé ; sinon elle renvoie nil et un message d'erreur.
- Les cibles sont des tables {model = string, config = string}.

**Dépendances (chargées avant) :** `core_vehicles`, `util_screenshotCreator_shippedConfigs`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_thumbnailTargets.buildExplicitWorkItems(targets)` | Transforme des cibles assainies en éléments de travail. Échoue si une config est inconnue. | 54 |
| `util_screenshotCreator_thumbnailTargets.buildModelCatalog()` | Construit le catalogue trié des modèles pour l'interface : {key, label « Marque Nom », category = Type, configs = [{key, label, isDefault, shipped}]}. Les modèles sans config sont omis. | 71 |
| `util_screenshotCreator_thumbnailTargets.buildShippedTargets(modelKeys)` | Liste toutes les cibles {model, config} livrées (selon shippedConfigs) pour les modèles donnés. | 100 |
| `util_screenshotCreator_thumbnailTargets.getConfigData(modelKey, configName)` | Cherche dans core_vehicles.getModel(modelKey).configs la configuration dont key vaut configName. | 16 |
| `util_screenshotCreator_thumbnailTargets.isDefaultConfig(modelKey, configName, configData)` | Indique si la config est celle par défaut du modèle (is_default_config ou default_pc du modèle). | 24 |
| `util_screenshotCreator_thumbnailTargets.normalizeConfigName(partConfig)` | Extrait le nom de config d'un chemin .pc (dernier segment, sans extension). Renvoie nil si ce n'est pas une chaîne finissant par .pc. | 9 |
| `util_screenshotCreator_thumbnailTargets.resolveStartMessage(message)` | Convertit un message de démarrage de l'interface en éléments de travail : message.targets si présent, sinon la config actuelle du véhicule du joueur. | 113 |
| `util_screenshotCreator_thumbnailTargets.sanitizeTargets(targets)` | Valide et dédoublonne une liste de cibles. | 30 |

### Détail des paramètres

#### `util_screenshotCreator_thumbnailTargets.buildExplicitWorkItems(targets)`

Transforme des cibles assainies en éléments de travail. Échoue si une config est inconnue.

- `targets` (*table[]*) : Liste de {model, config}.
- **renvoie** : table[]|nil Éléments de travail.
- **renvoie** : string|nil « Unknown vehicle config: modèle/config ».

#### `util_screenshotCreator_thumbnailTargets.buildModelCatalog()`

Construit le catalogue trié des modèles pour l'interface : {key, label « Marque Nom », category = Type, configs = [{key, label, isDefault, shipped}]}. Les modèles sans config sont omis.

- **renvoie** : table[] Catalogue des modèles.

#### `util_screenshotCreator_thumbnailTargets.buildShippedTargets(modelKeys)`

Liste toutes les cibles {model, config} livrées (selon shippedConfigs) pour les modèles donnés.

- `modelKeys` (*string[]*) : Clés de modèles.
- **renvoie** : table[] Cibles {model, config}.

#### `util_screenshotCreator_thumbnailTargets.getConfigData(modelKey, configName)`

Cherche dans core_vehicles.getModel(modelKey).configs la configuration dont key vaut configName.

- `modelKey` (*string*) : Clé du modèle.
- `configName` (*string*) : Clé de la configuration.
- **renvoie** : table|nil Données de la config, ou nil.

#### `util_screenshotCreator_thumbnailTargets.isDefaultConfig(modelKey, configName, configData)`

Indique si la config est celle par défaut du modèle (is_default_config ou default_pc du modèle).

- `modelKey` (*string*) : Clé du modèle.
- `configName` (*string*) : Clé de la configuration.
- `configData` (*table|nil*) : Données de la config, si déjà connues.
- **renvoie** : boolean true si config par défaut.

#### `util_screenshotCreator_thumbnailTargets.normalizeConfigName(partConfig)`

Extrait le nom de config d'un chemin .pc (dernier segment, sans extension). Renvoie nil si ce n'est pas une chaîne finissant par .pc.

- `partConfig` (*string|nil*) : Valeur de vehicle.partConfig, ex. vehicles/pickup/d15_4wd.pc.
- **renvoie** : string|nil Nom de la configuration, ex. d15_4wd.

#### `util_screenshotCreator_thumbnailTargets.resolveStartMessage(message)`

Convertit un message de démarrage de l'interface en éléments de travail : message.targets si présent, sinon la config actuelle du véhicule du joueur.

- `message` (*table|nil*) : Message de l'interface ({targets = ...}).
- **renvoie** : table[]|nil Éléments de travail.
- **renvoie** : string|nil Message d'erreur.

#### `util_screenshotCreator_thumbnailTargets.sanitizeTargets(targets)`

Valide et dédoublonne une liste de cibles.

- `targets` (*table|nil*) : Liste de {model, config}.
- **renvoie** : table|nil Liste assainie ; nil si targets est nil.
- **renvoie** : string|nil Message d'erreur (liste invalide, cible invalide à l'indice N).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant : core_vehicles et util_screenshotCreator_shippedConfigs. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/thumbnailTargets.lua`.*
