# `career_startingModes_freshStart`

*Fichier : `lua/ge/extensions/career/startingModes/freshStart.lua` · VM : Game Engine (GE) · 15 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_startingModes_freshStart` : `extensions.load("career_startingModes_freshStart")`, puis la globale `career_startingModes_freshStart`

Mode de départ de carrière « freshStart » (tier minor, ordre 200, image start_fresh.jpg) : départ sans tutoriel avec 10 000 d'argent. Table de description chargée par career/career.lua, pas une extension. Le joueur (à pied) est téléporté devant le concessionnaire, face à lui.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_startingModes_freshStart.initPlayerAttributes(playerAttributes)` | Initialise l'argent à 10 000 (libellé « Starting Capital »). *(interne)* | 6 |
| `career_startingModes_freshStart.setupInventory()` | Téléporte le joueur en (905.54, -542.39, 164.31) et l'oriente vers le concessionnaire (gameplay_walk.setRot). *(interne)* | 9 |

### Détail des paramètres

#### `career_startingModes_freshStart.initPlayerAttributes(playerAttributes)`

Initialise l'argent à 10 000 (libellé « Starting Capital »).

- `playerAttributes` (*table*) : Module career_modules_playerAttributes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `id` | string | "freshStart". |
| `image` | string | images/career/start_fresh.jpg. |
| `order` | number | 200. |
| `tier` | string | "minor". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/startingModes/freshStart.lua`.*
