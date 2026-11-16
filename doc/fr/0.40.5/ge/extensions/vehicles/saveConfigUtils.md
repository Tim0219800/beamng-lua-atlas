# `vehicles_saveConfigUtils`

*Fichier : `lua/ge/extensions/vehicles/saveConfigUtils.lua` · VM : Game Engine (GE) · 592 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `vehicles_saveConfigUtils` : `extensions.load("vehicles_saveConfigUtils")`, puis la globale `vehicles_saveConfigUtils`

Utilitaires de l'éditeur de métadonnées d'une configuration de véhicule (info_<config>.json) lors de la sauvegarde. Définit la liste des champs éditables (Description, Value, Years, vehicleSelectorSubCluster, vehicleSelectorSubGroup, Country, Region, Type, Body Style, Config Type, Commercial Class, Derby Class, InsuranceClass, Population) avec leur type, limites et libellés. `getFields` prépare ces champs pour l'interface (valeurs, options, valeur de repli) et `validateMetadata` normalise et valide les métadonnées avant écriture.

## Exemple

```lua
local fields = vehicles_saveConfigUtils.getFields('pickup', '/vehicles/pickup/', 'base', 'mon_config')
local meta, err = vehicles_saveConfigUtils.validateMetadata({Description = 'Ma config', Population = 500}, 'pickup')
if not meta then log('E', 'x', dumps(err)) end
```

## Remarques

- Les options des listes viennent du catalogue de véhicules (core_vehicles.getModelList / getModel) ou des configs du modèle ; elles sont mises en cache (clearCache les vide).
- Les valeurs Type exclues des options : Traffic, PropTraffic, PropParked, Utility, Debug, Unknown.
- Limites : Description 120 caractères max ; Population entier de 0 à 50000 ; Value (prix) >= 0 ; Years = {min, max} entiers avec min <= max ; InsuranceClass parmi dailyDriver, commercial, prestige.
- Les erreurs de validateMetadata sont de la forme {field, code} avec code parmi notTable, unknownField, invalidType, empty, tooLong, invalidRange, invalidOption, invalidNumber.
- Si deux valeurs du catalogue ont le même libellé traduit, la plus fréquente est gardée et un avertissement est journalisé une seule fois.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `vehicles_saveConfigUtils.clearCache()` | Vide les caches d'options (pays et catalogue) ; à appeler quand la liste des véhicules a changé. | 581 |
| `vehicles_saveConfigUtils.getFields(modelKey, vehicleDirectory, sourceConfigName, targetConfigName)` | Construit la liste des champs de métadonnées pour l'éditeur. Pour chaque définition, calcule la valeur de la config cible (avec repli sur la config source si useSourceFallback), la valeur de repli du modèle, l'état `included`, et les options (avec une entrée « personnalisée » pour les listes qui autorisent une valeur libre). Retourne des copies des définitions, sans les clés internes. | 452 |
| `vehicles_saveConfigUtils.validateMetadata(metadata, modelKey)` | Valide et normalise une table de métadonnées. L'alias minuscule `description` est accepté pour `Description`. Refuse les clés inconnues et les valeurs invalides ; trim des textes, tri des multi-sélections. | 506 |

### Détail des paramètres

#### `vehicles_saveConfigUtils.getFields(modelKey, vehicleDirectory, sourceConfigName, targetConfigName)`

Construit la liste des champs de métadonnées pour l'éditeur. Pour chaque définition, calcule la valeur de la config cible (avec repli sur la config source si useSourceFallback), la valeur de repli du modèle, l'état `included`, et les options (avec une entrée « personnalisée » pour les listes qui autorisent une valeur libre). Retourne des copies des définitions, sans les clés internes.

- `modelKey` (*string*) : clé du modèle de véhicule
- `vehicleDirectory` (*string|nil*) : dossier du véhicule (terminé par /) où lire info_<config>.json ; sinon core_vehicles.getConfig est utilisé
- `sourceConfigName` (*string|nil*) : nom de la config d'origine (valeurs de repli)
- `targetConfigName` (*string|nil*) : nom de la config cible dont on lit les valeurs actuelles
- **renvoie** : table[] liste ordonnée de champs : key, type, label, value, fallbackValue, included, optional, options, etc.

#### `vehicles_saveConfigUtils.validateMetadata(metadata, modelKey)`

Valide et normalise une table de métadonnées. L'alias minuscule `description` est accepté pour `Description`. Refuse les clés inconnues et les valeurs invalides ; trim des textes, tri des multi-sélections.

- `metadata` (*table|nil*) : métadonnées à valider ; nil donne une table vide
- `modelKey` (*string|nil*) : clé du modèle, utilisée pour résoudre les options des listes dépendantes du modèle
- **renvoie** : table|nil métadonnées normalisées, ou nil en cas d'erreur
- **renvoie** : table|nil en cas d'erreur : {field = clé ou nil, code = chaîne}

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/vehicles/saveConfigUtils.lua`.*
