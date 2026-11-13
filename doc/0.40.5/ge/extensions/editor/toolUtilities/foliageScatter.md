# `editor_toolUtilities_foliageScatter`

*Fichier : `lua/ge/extensions/editor/toolUtilities/foliageScatter.lua` · VM : Game Engine (GE) · 659 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_foliageScatter` : `extensions.load("editor_toolUtilities_foliageScatter")`, puis la globale `editor_toolUtilities_foliageScatter`

Moteur de plantation de végétation (objets Forest, ForestItemData) pour les outils de l'éditeur. Il disperse des instances dans un polygone (scatterArea, avec espacement type Poisson), le long d'une ligne (scatterLine) ou sur des points précis (scatterPoints), pose chaque plante sur le terrain (core_terrain.getTerrainHeight) en retirant le plancher du mesh, et gère le retrait, la mise en attente pendant une sauvegarde de niveau (lift/relay) et le re-calage sur le terrain (redrape).

## Exemple

```lua
local fs = require('editor/toolUtilities/foliageScatter')
local items, n = fs.scatterArea({ring = ring, species = fs.defaultSpeciesSelection(), spacingM = 6, seed = 1337})
-- plus tard :
fs.removeItems(select(2, fs.ensureForest()), items)
```

## Remarques

- Les espèces sont des noms d'objets ForestItemData de la scène ; 'species' est un ensemble { nom = true } (ou un tableau de noms) et 'speciesWeights' des poids par nom (défaut 1.0 ; poids tous nuls = poids égaux).
- Les fonctions scatter* renvoient (items, nombrePlacé) ; la liste items contient des poignées d'items Forest, qu'il faut retirer avec removeItems avant de re-disperser la même zone.
- Plafond de sécurité : 60000 instances par zone (params.maxInstances pour le changer).
- Presets de classe : forest (6 m, variance 0.20), dense (4 m, 0.18), sparse (12 m, 0.22), shrub (2.5 m, 0.20), orchard (7 m, 0.08). Distribution par défaut : spacingM 6, densityScale 1, scaleVariance 0.20, slopeMaxDeg 35, seed 1337.
- Le résultat dépend de params.seed (hash déterministe) : même graine et mêmes paramètres donnent la même plantation.
- Si le niveau n'a pas d'objet Forest, ensureForest en crée un ('theForest') dans MissionGroup et marque l'éditeur modifié.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_foliageScatter.addDraped(fn)` | Enregistre un fournisseur de listes d'items pour le re-calage au terrain : fn(out) doit ajouter à out chaque liste d'items (un slot peut être false). Sert aux outils dont les plantes doivent rester posées sur le sol quand il bouge. | 602 |
| `editor_toolUtilities_foliageScatter.defaultShrubSelection()` | Comme defaultSpeciesSelection mais orientée arbuste : première espèce dont le nom contient bush, shrub, fern, hedge, flower, plant, grass ou reed, sinon la première de la liste. | 124 |
| `editor_toolUtilities_foliageScatter.defaultSpeciesSelection()` | Choisit une sélection d'espèces par défaut parmi celles du niveau : la première trouvée parmi tree_oak_forest_a, tree_beech_forest_a, tree_aspen_forest_a, sinon la première espèce de la liste. | 111 |
| `editor_toolUtilities_foliageScatter.ensureForest()` | Renvoie l'objet Forest du niveau et ses données, en créant un Forest vide si le niveau n'en a pas. En cas d'échec, journalise une erreur et renvoie nil, nil. | 81 |
| `editor_toolUtilities_foliageScatter.getClassOrder()` | Renvoie l'ordre stable des classes pour l'interface : forest, dense, sparse, shrub, orchard. | 545 |
| `editor_toolUtilities_foliageScatter.getClassPresets()` | Renvoie la table des presets par classe (forest, dense, sparse, shrub, orchard) avec spacingM et scaleVariance. C'est la table interne, non copiée. | 542 |
| `editor_toolUtilities_foliageScatter.getDefaultDistribution()` | Renvoie une copie fraîche des paramètres de distribution par défaut, pour initialiser une nouvelle zone. | 539 |
| `editor_toolUtilities_foliageScatter.itemCrownR(fd, obj)` | Rayon de couronne d'un ForestItemData à l'échelle 1 : plus grand côté horizontal de sa boîte englobante autour de l'origine, valable quelle que soit l'orientation. Plante un item temporaire pour obtenir sa boîte, puis le retire. | 70 |
| `editor_toolUtilities_foliageScatter.lift(lists)` | Sort du forest la plantation vivante d'un outil avant une sauvegarde de niveau (qui écrit le forest tel quel). Mémorise donnée, transform et échelle de chaque item et conserve les emplacements. Renvoie nil s'il n'y a pas de forest. | 169 |
| `editor_toolUtilities_foliageScatter.listForestItemData()` | Liste triée des noms de ForestItemData du niveau, c'est-à-dire les espèces plantables par les outils. | 96 |
| `editor_toolUtilities_foliageScatter.plantOne(it, fd, byName)` | Plante un item déjà décidé (espèce, échelle, rotation, position) en le posant sur le terrain, plancher du mesh retiré. Renvoie nil si l'espèce n'existe pas dans le niveau. | 551 |
| `editor_toolUtilities_foliageScatter.redrape(x0, y0, x1, y1)` | Remet sur le terrain toutes les plantes enregistrées via addDraped situées dans la boîte monde donnée, si leur hauteur diffère de plus de 0.005 m. L'item déplacé est réécrit dans sa liste (updateItem). | 606 |
| `editor_toolUtilities_foliageScatter.relay(held)` | Remet en place les items retirés par lift, dans les mêmes slots des mêmes listes (nouvelles poignées créées avec createNewItem), une fois la sauvegarde faite. Sans effet si held est nil. | 188 |
| `editor_toolUtilities_foliageScatter.removeItems(fd, items)` | Retire du forest les items listés (issus d'une dispersion précédente) et vide la table items. | 159 |
| `editor_toolUtilities_foliageScatter.scatterArea(params)` | Disperse des instances dans un polygone (avec trous éventuels) par candidats à faible discrépance (suite R2) filtrés par espacement minimal, pente maximale et occupation. L'espèce est tirée au hasard pondéré pour chaque instance. Renvoie ({}, 0) si l'anneau a moins de 3 points ou si aucune espèce n'est résolue. | 243 |
| `editor_toolUtilities_foliageScatter.scatterLine(params)` | Dispose une rangée de plantes régulièrement espacées le long d'une ligne centrale ré-échantillonnée, avec dispersion latérale optionnelle. | 372 |
| `editor_toolUtilities_foliageScatter.scatterPoints(params)` | Plante exactement une instance à chaque point monde fourni. Par défaut la plante se pose sur le terrain ; avec onPointZ elle se pose sur le z du point (+ zLift), par exemple des buissons dans un bac. | 489 |
| `editor_toolUtilities_foliageScatter.sowGroups(groups, fd)` | Sème un plan complet : liste de groupes d'ancrage. Un groupe avec items est planté tel quel (plantOne) ; un groupe avec points et species passe par scatterPoints (size -> scaleBase, vary -> scaleVariance, seed défaut 1, drape faux = z du point). | 581 |

### Détail des paramètres

#### `editor_toolUtilities_foliageScatter.addDraped(fn)`

Enregistre un fournisseur de listes d'items pour le re-calage au terrain : fn(out) doit ajouter à out chaque liste d'items (un slot peut être false). Sert aux outils dont les plantes doivent rester posées sur le sol quand il bouge.

- `fn` (*function*) : Fonction fn(out) qui ajoute ses listes à out.

#### `editor_toolUtilities_foliageScatter.defaultShrubSelection()`

Comme defaultSpeciesSelection mais orientée arbuste : première espèce dont le nom contient bush, shrub, fern, hedge, flower, plant, grass ou reed, sinon la première de la liste.

- **renvoie** : table<string, boolean> Ensemble { nom = true }.

#### `editor_toolUtilities_foliageScatter.defaultSpeciesSelection()`

Choisit une sélection d'espèces par défaut parmi celles du niveau : la première trouvée parmi tree_oak_forest_a, tree_beech_forest_a, tree_aspen_forest_a, sinon la première espèce de la liste.

- **renvoie** : table<string, boolean> Ensemble { nom = true } (vide si le niveau n'a aucune espèce).

#### `editor_toolUtilities_foliageScatter.ensureForest()`

Renvoie l'objet Forest du niveau et ses données, en créant un Forest vide si le niveau n'en a pas. En cas d'échec, journalise une erreur et renvoie nil, nil.

- **renvoie** : userdata|nil Objet Forest.
- **renvoie** : userdata|nil ForestData (forest:getData()).

#### `editor_toolUtilities_foliageScatter.getClassOrder()`

Renvoie l'ordre stable des classes pour l'interface : forest, dense, sparse, shrub, orchard.

- **renvoie** : string[] Noms de classes.

#### `editor_toolUtilities_foliageScatter.getClassPresets()`

Renvoie la table des presets par classe (forest, dense, sparse, shrub, orchard) avec spacingM et scaleVariance. C'est la table interne, non copiée.

- **renvoie** : table<string, table> Presets.

#### `editor_toolUtilities_foliageScatter.getDefaultDistribution()`

Renvoie une copie fraîche des paramètres de distribution par défaut, pour initialiser une nouvelle zone.

- **renvoie** : table { class, spacingM, densityScale, scaleVariance, alignToNormal, slopeMaxDeg, seed }.

#### `editor_toolUtilities_foliageScatter.itemCrownR(fd, obj)`

Rayon de couronne d'un ForestItemData à l'échelle 1 : plus grand côté horizontal de sa boîte englobante autour de l'origine, valable quelle que soit l'orientation. Plante un item temporaire pour obtenir sa boîte, puis le retire.

- `fd` (*userdata*) : ForestData du niveau (celui de forest:getData()).
- `obj` (*userdata*) : Objet ForestItemData de l'espèce.
- **renvoie** : number Rayon en mètres, 0 si indisponible.

#### `editor_toolUtilities_foliageScatter.lift(lists)`

Sort du forest la plantation vivante d'un outil avant une sauvegarde de niveau (qui écrit le forest tel quel). Mémorise donnée, transform et échelle de chaque item et conserve les emplacements. Renvoie nil s'il n'y a pas de forest.

- `lists` (*table[]*) : Liste de listes d'items ; un slot peut être false.
- **renvoie** : table|nil Jeton 'held' à repasser à relay.

#### `editor_toolUtilities_foliageScatter.listForestItemData()`

Liste triée des noms de ForestItemData du niveau, c'est-à-dire les espèces plantables par les outils.

- **renvoie** : string[] Noms triés.

#### `editor_toolUtilities_foliageScatter.plantOne(it, fd, byName)`

Plante un item déjà décidé (espèce, échelle, rotation, position) en le posant sur le terrain, plancher du mesh retiré. Renvoie nil si l'espèce n'existe pas dans le niveau.

- `it` (*table*) : { x, y, sp (nom d'espèce), s (échelle, défaut 1), rx, ry, a (angles Euler en rad, défaut 0) }.
- `fd` (*userdata*) : ForestData.
- `byName` (*table*) : Cache des espèces entre appels (à fournir, par exemple {}).
- **renvoie** : userdata|nil Poignée de l'item créé.

#### `editor_toolUtilities_foliageScatter.redrape(x0, y0, x1, y1)`

Remet sur le terrain toutes les plantes enregistrées via addDraped situées dans la boîte monde donnée, si leur hauteur diffère de plus de 0.005 m. L'item déplacé est réécrit dans sa liste (updateItem).

- `x0` (*number*) : X minimal de la boîte.
- `y0` (*number*) : Y minimal.
- `x1` (*number*) : X maximal.
- `y1` (*number*) : Y maximal.
- **renvoie** : integer Nombre de plantes déplacées (0 s'il n'y a pas de forest).

#### `editor_toolUtilities_foliageScatter.relay(held)`

Remet en place les items retirés par lift, dans les mêmes slots des mêmes listes (nouvelles poignées créées avec createNewItem), une fois la sauvegarde faite. Sans effet si held est nil.

- `held` (*table|nil*) : Résultat de lift.

#### `editor_toolUtilities_foliageScatter.removeItems(fd, items)`

Retire du forest les items listés (issus d'une dispersion précédente) et vide la table items.

- `fd` (*userdata|nil*) : ForestData ; sans effet si nil.
- `items` (*table|nil*) : Liste de poignées d'items ; les slots false sont ignorés.

#### `editor_toolUtilities_foliageScatter.scatterArea(params)`

Disperse des instances dans un polygone (avec trous éventuels) par candidats à faible discrépance (suite R2) filtrés par espacement minimal, pente maximale et occupation. L'espèce est tirée au hasard pondéré pour chaque instance. Renvoie ({}, 0) si l'anneau a moins de 3 points ou si aucune espèce n'est résolue.

- `params` (*table*) : ring (points du contour, z ignoré), holes (anneaux de trous), forestData (sinon ensureForest), species, speciesWeights, spacingM (min 0.5, défaut 6), densityScale (min 0.01), scaleVariance, scaleBase (min 0.05), alignToNormal (booléen), slopeMaxDeg (défaut 35), seed, occupiedFn, holdFn (true = l'emplacement reste dans le plan mais rien n'est planté, slot false), maxInstances, record (table remplie avec { x, y, sp, s, a, ... } de ce qui est planté).
- **renvoie** : table Liste des items placés (slots possibles à false avec holdFn).
- **renvoie** : integer Nombre d'instances placées.

#### `editor_toolUtilities_foliageScatter.scatterLine(params)`

Dispose une rangée de plantes régulièrement espacées le long d'une ligne centrale ré-échantillonnée, avec dispersion latérale optionnelle.

- `params` (*table*) : divPoints (ligne), binormals, forestData, species, speciesWeights, spacingM (min 0.5), posVariance (m, dispersion de position), scaleVariance, scaleBase, alignToNormal, slopeMaxDeg (défaut 89), seed, occupiedFn, maxInstances.
- **renvoie** : table Items placés.
- **renvoie** : integer Nombre d'instances placées.

#### `editor_toolUtilities_foliageScatter.scatterPoints(params)`

Plante exactement une instance à chaque point monde fourni. Par défaut la plante se pose sur le terrain ; avec onPointZ elle se pose sur le z du point (+ zLift), par exemple des buissons dans un bac.

- `params` (*table*) : points, forestData, species, speciesWeights, scaleVariance, scaleBase, seed, occupiedFn, onPointZ, zLift, record (voir scatterArea).
- **renvoie** : table Items placés.
- **renvoie** : integer Nombre d'instances placées.

#### `editor_toolUtilities_foliageScatter.sowGroups(groups, fd)`

Sème un plan complet : liste de groupes d'ancrage. Un groupe avec items est planté tel quel (plantOne) ; un groupe avec points et species passe par scatterPoints (size -> scaleBase, vary -> scaleVariance, seed défaut 1, drape faux = z du point).

- `groups` (*table[]|nil*) : Groupes { items } ou { points, species, speciesWeights, size, vary, seed, drape }.
- `fd` (*userdata|nil*) : ForestData (sinon ensureForest).
- **renvoie** : table Tous les items plantés.

## Appels vers le moteur (C++)

- `obj:` `getObjBox`
- `scenetree.` `findClassObjects`, `findObject`
- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/foliageScatter.lua`.*
