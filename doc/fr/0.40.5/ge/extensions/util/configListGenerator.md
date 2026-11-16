# `util_configListGenerator`

*Fichier : `lua/ge/extensions/util/configListGenerator.lua` · VM : Game Engine (GE) · 232 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_configListGenerator` : `extensions.load("util_configListGenerator")`, puis la globale `util_configListGenerator`

Génère des listes aléatoires de véhicules (configs) à partir de filtres, utilisées par les systèmes de gameplay qui ont besoin de véhicules vendus ou de trafic (vendeurs de la carrière, par exemple). Il part de la liste des configs de core_vehicles, exclut props, utilitaires et configs sans valeur, puis tire des configs au hasard en pondérant par un attribut de popularité.

## Exemple

```lua
local eligible = util_configListGenerator.getEligibleVehicles()
local infos = util_configListGenerator.getRandomVehicleInfos({filter = {whiteList = {Type = {'Car'}}}}, 5, eligible)
```

## Remarques

- Un filtre est une table {whiteList = {...}, blackList = {...}} : un véhicule doit passer la liste blanche et ne pas passer la liste noire. Les entrées sont des attributs : listes de valeurs (ex. Type = {'Car'}), ou {min=, max=} pour les nombres ; 'Years' compare des plages ; 'Mileage' est ignoré ; les attributs de type dictionnaire (core_vehicles.getAttributesConvertToDict) lisent vehicleInfo.aggregates.
- Le filtre d'un vendeur peut avoir des subFilters : chacun est fusionné récursivement dans une copie de seller.filter, et un filtre est choisi au hasard selon sa clé probability (1 par défaut).
- Le poids d'une config est son attribut de popularité (popAttribute, 'Population' par défaut ; 1 si absent).
- Bug probable : dans chooseRandomModel, les deux branches fixent la popularité du modèle à 1 (pas d'incrément), donc tous les modèles ont le même poids quelle que soit le nombre de configs.
- Les valeurs de retour sont des copies profondes : les modifier n'affecte pas les données du jeu.
- Si aucun véhicule ne passe un filtre, celui-ci est retiré ; quand il ne reste plus de filtre, la génération s'arrête avec moins de véhicules que demandé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_configListGenerator.doesVehiclePassFilter(vehicleInfo, filter)` | Indique si un véhicule (config) satisfait un filtre {whiteList, blackList}. | 70 |
| `util_configListGenerator.getEligibleVehicles(allowAuxiliaryVehicles, allowLoadedTrailers)` | Renvoie la liste triée (modèle puis config) des configs éligibles : ayant un Type et une Value, hors Prop, Utility, PropParked et PropTraffic ; la marque traduite est écrite dans Brand. | 175 |
| `util_configListGenerator.getRandomVehicleInfos(filterSet, numberOfVehicles, eligibleVehicles, popAttribute)` | Tire jusqu'à numberOfVehicles configs différentes selon les filtres d'un vendeur (filterSet.filter, avec subFilters éventuels) : choix d'un filtre, d'un modèle puis d'une config pondérée. Chaque résultat reçoit un champ filter (le filtre utilisé). | 195 |

### Détail des paramètres

#### `util_configListGenerator.doesVehiclePassFilter(vehicleInfo, filter)`

Indique si un véhicule (config) satisfait un filtre {whiteList, blackList}.

- `vehicleInfo` (*table*) : Config de véhicule (avec aggregates).
- `filter` (*table*) : Filtre {whiteList = table|nil, blackList = table|nil}.
- **renvoie** : boolean true si le véhicule passe.

#### `util_configListGenerator.getEligibleVehicles(allowAuxiliaryVehicles, allowLoadedTrailers)`

Renvoie la liste triée (modèle puis config) des configs éligibles : ayant un Type et une Value, hors Prop, Utility, PropParked et PropTraffic ; la marque traduite est écrite dans Brand.

- `allowAuxiliaryVehicles` (*boolean|nil*) : true pour inclure les configs auxiliaires.
- `allowLoadedTrailers` (*boolean|nil*) : true pour inclure les remorques chargées (hasLoad).
- **renvoie** : table[] Copies des infos de configs.

#### `util_configListGenerator.getRandomVehicleInfos(filterSet, numberOfVehicles, eligibleVehicles, popAttribute)`

Tire jusqu'à numberOfVehicles configs différentes selon les filtres d'un vendeur (filterSet.filter, avec subFilters éventuels) : choix d'un filtre, d'un modèle puis d'une config pondérée. Chaque résultat reçoit un champ filter (le filtre utilisé).

- `filterSet` (*table*) : Vendeur {filter = {...}, subFilters = {...}|nil}.
- `numberOfVehicles` (*integer|nil*) : Nombre de véhicules voulus, 10 par défaut.
- `eligibleVehicles` (*table[]|nil*) : Liste issue de getEligibleVehicles ; calculée si nil.
- `popAttribute` (*string|nil*) : Attribut de popularité, 'Population' par défaut.
- **renvoie** : table[] Infos des véhicules tirés (peut être plus court que demandé).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/configListGenerator.lua`.*
