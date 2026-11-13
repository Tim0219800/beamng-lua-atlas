# `career_startingModes_sandbox`

*Fichier : `lua/ge/extensions/career/startingModes/sandbox.lua` · VM : Game Engine (GE) · 18 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_startingModes_sandbox` : `extensions.load("career_startingModes_sandbox")`, puis la globale `career_startingModes_sandbox`

Mode de départ de carrière « sandbox » (tier minor, ordre 400) : 50 millions d'argent, « tout débloqué » d'après sa description. Table de description chargée par career/career.lua, pas une extension. Le champ ignore = true indique que ce mode est ignoré (non proposé) dans cette version.

## Remarques

- ignore = true : le mode existe dans le code mais est masqué du choix de départ (comportement déduit du nom du champ, à vérifier dans career.lua).
- title et description sont des chaînes en dur (non traduites).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_startingModes_sandbox.initPlayerAttributes(playerAttributes)` | Initialise l'argent à 50 000 000. *(interne)* | 9 |
| `career_startingModes_sandbox.setupInventory()` | Téléporte le joueur en (-808.56, 898.56, 75.51) et règle son orientation. *(interne)* | 12 |

### Détail des paramètres

#### `career_startingModes_sandbox.initPlayerAttributes(playerAttributes)`

Initialise l'argent à 50 000 000.

- `playerAttributes` (*table*) : Module career_modules_playerAttributes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `description` | string | « Start with 50 million bucks and everthing unlocked. » (faute d'orthographe dans le code). |
| `id` | string | "sandbox". |
| `ignore` | boolean | true. |
| `image` | string | images/career/start_sandbox.jpg. |
| `order` | number | 400. |
| `tier` | string | "minor". |
| `title` | string | "Sandbox". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/startingModes/sandbox.lua`.*
