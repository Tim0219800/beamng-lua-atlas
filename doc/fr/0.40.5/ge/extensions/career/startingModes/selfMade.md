# `career_startingModes_selfMade`

*Fichier : `lua/ge/extensions/career/startingModes/selfMade.lua` · VM : Game Engine (GE) · 198 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_startingModes_selfMade` : `extensions.load("career_startingModes_selfMade")`, puis la globale `career_startingModes_selfMade`

Mode de départ de carrière « selfMade » (tier minor, ordre 300, ignore = true) : 1 000 d'argent et une vieille voiture générée aléatoirement. setupInventory choisit parmi les véhicules éligibles (util_configListGenerator) ceux passant un filtre (années 1990-2005, valeur 1000-50000, types de config Factory ou Service), tire une année, estime par dichotomie (28 itérations) le kilométrage qui amène la valeur ajustée au plus près d'une cible de 4000 à 5000, garde le meilleur candidat, le fait apparaître à (838.51, -522.42, 165.75) avec une peinture aléatoire, l'ajoute à l'inventaire et remplit les réservoirs à 15 %. Table de description chargée par career/career.lua, pas une extension.

## Remarques

- ignore = true : le mode n'est pas proposé dans cette version (déduit du nom du champ).
- Repli si aucun véhicule ne passe le filtre : la Sunburst du tutoriel (sunburst2, apmTutorial_sunburst.pc, année 2005, 250 000 000 de kilométrage).
- L'année de référence 2023 est codée en dur dans les calculs d'âge.
- Les entrées maxYear, high et rot affichées dans la page auto sont des variables locales, pas des champs du module.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_startingModes_selfMade.initPlayerAttributes(playerAttributes)` | Initialise l'argent à 1 000. *(interne)* | 9 |
| `career_startingModes_selfMade.setupInventory(inventoryModule)` | Génère et fait apparaître la voiture de départ (voir description du module) et l'ajoute à l'inventaire avec initPartConditions pour le kilométrage estimé. *(interne)* | 12 |

### Détail des paramètres

#### `career_startingModes_selfMade.initPlayerAttributes(playerAttributes)`

Initialise l'argent à 1 000.

- `playerAttributes` (*table*) : Module career_modules_playerAttributes.

#### `career_startingModes_selfMade.setupInventory(inventoryModule)`

Génère et fait apparaître la voiture de départ (voir description du module) et l'ajoute à l'inventaire avec initPartConditions pour le kilométrage estimé.

- `inventoryModule` (*table*) : Module career_modules_inventory (utilise addVehicle).

## Champs

| Champ | Type | Description |
|---|---|---|
| `description` | string | « Start with nothing but a beaten down car, a handful of dollars and a dream. » |
| `high` | number |  |
| `id` | string | "selfMade". |
| `ignore` | boolean | true. |
| `image` | string | images/career/start_beater.jpg. |
| `maxYear` | any |  ⚠ référence `maxYear` non définie dans le fichier (vaut probablement nil) |
| `order` | number | 300. |
| `rot` | vec3 |  |
| `tier` | string | "minor". |
| `title` | string | "Self-Made". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/startingModes/selfMade.lua`.*
