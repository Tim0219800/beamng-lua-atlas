# `career_startingModes_apmOnboarding`

*Fichier : `lua/ge/extensions/career/startingModes/apmOnboarding.lua` · VM : Game Engine (GE) · 13 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_startingModes_apmOnboarding` : `extensions.load("career_startingModes_apmOnboarding")`, puis la globale `career_startingModes_apmOnboarding`

Mode de départ de carrière « apmOnboarding » (tier major, ordre 100, image start_apm.jpg) : c'est le départ avec tutoriel. Ce fichier ne retourne pas un module d'extension mais une simple table de description, chargée par career/career.lua depuis le dossier startingModes. Il démarre l'argent à 0 et prépare les véhicules du tutoriel avec gameplay_tutorial_setup.setupVehicles().

## Remarques

- Les champs id, order, tier et image décrivent le mode ; initPlayerAttributes et setupInventory sont appelées par le code de démarrage de la carrière.
- Les titre et description ne sont pas définis dans ce fichier (présents dans sandbox et selfMade).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_startingModes_apmOnboarding.initPlayerAttributes(playerAttributes)` | Initialise les attributs du joueur : argent = 0 (libellé « Starting Capital »). *(interne)* | 6 |
| `career_startingModes_apmOnboarding.setupInventory()` | Prépare les véhicules du tutoriel (gameplay_tutorial_setup.setupVehicles). *(interne)* | 9 |

### Détail des paramètres

#### `career_startingModes_apmOnboarding.initPlayerAttributes(playerAttributes)`

Initialise les attributs du joueur : argent = 0 (libellé « Starting Capital »).

- `playerAttributes` (*table*) : Module career_modules_playerAttributes (utilise setAttributes).

## Champs

| Champ | Type | Description |
|---|---|---|
| `id` | string | "apmOnboarding". |
| `image` | string | images/career/start_apm.jpg. |
| `order` | number | 100 (ordre d'affichage). |
| `tier` | string | "major". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/startingModes/apmOnboarding.lua`.*
