# `career_modules_quickTravel`

*Fichier : `lua/ge/extensions/career/modules/quickTravel.lua` · VM : Game Engine (GE) · 64 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_quickTravel` : `extensions.load("career_modules_quickTravel")`, puis la globale `career_modules_quickTravel`

Voyage rapide payant en carrière : calcule un prix selon la distance de route entre le joueur et une destination, puis téléporte le joueur (en mode marche) et le débite. Sert à rejoindre un garage.

## Remarques

- Tarif : gratuit sous 300 m ; sinon 5 + distance(m) * 0.004 (arrondi au centime).
- La distance vient d'un planificateur de route (gameplay/route/route) depuis la position du véhicule joueur.
- Le voyage avec le véhicule n'est pas implémenté (TODO dans le code) : sans useWalkingMode, seul le paiement est effectué, sans téléportation.
- getPriceForQuickTravel renvoie deux valeurs : prix et distance.

**Dépendances (chargées avant) :** `career_career`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_quickTravel.getPriceForQuickTravel(pos)` | Calcule le prix et la distance de route jusqu'à pos. | 19 |
| `career_modules_quickTravel.getPriceForQuickTravelToGarage(garage)` | Prix du voyage jusqu'à la position du garage donnée par freeroam_facilities.getGaragePosRot. | 54 |
| `career_modules_quickTravel.quickTravelToGarage(garagePoi)` | Voyage rapide vers le premier emplacement de stationnement du garage (en mode marche, libellé quickTravelGarageTaxi). | 45 |
| `career_modules_quickTravel.quickTravelToPos(pos, useWalkingMode, reasonString)` | Si le joueur peut payer, active le mode marche, téléporte le véhicule en sécurité vers pos et oriente le joueur vers pos, puis débite le prix (tags quickTravel, buying). | 33 |

### Détail des paramètres

#### `career_modules_quickTravel.getPriceForQuickTravel(pos)`

Calcule le prix et la distance de route jusqu'à pos.

- `pos` (*vec3*) : Destination.
- **renvoie** : number Prix en argent.
- **renvoie** : number Distance de route en mètres.

#### `career_modules_quickTravel.getPriceForQuickTravelToGarage(garage)`

Prix du voyage jusqu'à la position du garage donnée par freeroam_facilities.getGaragePosRot.

- `garage` (*table*) : Garage.
- **renvoie** : number Prix.
- **renvoie** : number Distance en mètres.

#### `career_modules_quickTravel.quickTravelToGarage(garagePoi)`

Voyage rapide vers le premier emplacement de stationnement du garage (en mode marche, libellé quickTravelGarageTaxi).

- `garagePoi` (*table*) : POI du garage (champ id).

#### `career_modules_quickTravel.quickTravelToPos(pos, useWalkingMode, reasonString)`

Si le joueur peut payer, active le mode marche, téléporte le véhicule en sécurité vers pos et oriente le joueur vers pos, puis débite le prix (tags quickTravel, buying).

- `pos` (*vec3*) : Destination.
- `useWalkingMode` (*boolean|nil*) : Si vrai, effectue la téléportation en mode marche.
- `reasonString` (*string|nil*) : Clé de traduction du libellé, ui.career.attributeLog.quickTravelPaid par défaut.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : career_career. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/quickTravel.lua`.*
