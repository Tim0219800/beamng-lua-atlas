# `career_modules_playerAbstract`

*Fichier : `lua/ge/extensions/career/modules/playerAbstract.lua` · VM : Game Engine (GE) · 68 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_playerAbstract` : `extensions.load("career_modules_playerAbstract")`, puis la globale `career_modules_playerAbstract`

Écran « résumé du conducteur » (driver abstract) accessible depuis l'ordinateur du garage en carrière. Il ajoute une entrée au menu de l'ordinateur et fournit à l'UI les données calculées par le module d'assurance (career_modules_insurance_insurance.getPlayerAbstractData).

## Remarques

- La fonction de l'ordinateur est désactivée tant que le véhicule de départ n'est pas acheté (reasons.hasBoughtStarterVehicle).
- Le menu ne s'ouvre via navigate que si un id d'ordinateur d'origine est fourni.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_playerAbstract.closePlayerAbstractMenu()` | Revient au menu de l'ordinateur d'origine, ou ferme tous les menus carrière s'il n'y en a pas. | 31 |
| `career_modules_playerAbstract.getPlayerAbstractData()` | Renvoie les données du résumé du conducteur fournies par le module d'assurance. | 40 |
| `career_modules_playerAbstract.onComputerAddFunctions(menuData, computerFunctions)` | Hook de l'ordinateur : ajoute la fonction playerAbstract (ordre 15, catégorie general) si l'installation l'autorise. *(interne)* *(hook)* | 14 |
| `career_modules_playerAbstract.onRouteLeave(context, toRoute, fromRoute, data)` | Cycle de vie du routeur UI : oublie l'ordinateur d'origine en quittant l'écran. *(interne)* *(hook)* | 51 |
| `career_modules_playerAbstract.onRouteMount(context, toRoute, fromRoute, data)` | Cycle de vie du routeur UI : place les données du résumé dans data.playerAbstract. *(interne)* *(hook)* | 46 |
| `career_modules_playerAbstract.openPlayerAbstractMenu(_originComputerId)` | Mémorise l'ordinateur d'origine et, s'il existe, navigue vers career.computer.playerAbstract puis déclenche le hook onComputerPlayerAbstract. | 6 |
| `career_modules_playerAbstract.sendPlayerAbstractDataToUI()` | Pousse des données fraîches vers un écran déjà ouvert (guihooks playerAbstractData), par ex. après une remise à zéro du score. | 56 |

### Détail des paramètres

#### `career_modules_playerAbstract.getPlayerAbstractData()`

Renvoie les données du résumé du conducteur fournies par le module d'assurance.

- **renvoie** : table Données du résumé.

#### `career_modules_playerAbstract.onComputerAddFunctions(menuData, computerFunctions)`

Hook de l'ordinateur : ajoute la fonction playerAbstract (ordre 15, catégorie general) si l'installation l'autorise.

- `menuData` (*table*) : Données du menu (computerFacility, hasBoughtStarterVehicle).
- `computerFunctions` (*table*) : Tables de fonctions à compléter.

#### `career_modules_playerAbstract.onRouteLeave(context, toRoute, fromRoute, data)`

Cycle de vie du routeur UI : oublie l'ordinateur d'origine en quittant l'écran.

- `context` (*any*) : Contexte du routeur.
- `toRoute` (*any*) : Route cible.
- `fromRoute` (*any*) : Route quittée.
- `data` (*table*) : routeData.

#### `career_modules_playerAbstract.onRouteMount(context, toRoute, fromRoute, data)`

Cycle de vie du routeur UI : place les données du résumé dans data.playerAbstract.

- `context` (*any*) : Contexte du routeur.
- `toRoute` (*any*) : Route cible.
- `fromRoute` (*any*) : Route précédente.
- `data` (*table*) : routeData à remplir.

#### `career_modules_playerAbstract.openPlayerAbstractMenu(_originComputerId)`

Mémorise l'ordinateur d'origine et, s'il existe, navigue vers career.computer.playerAbstract puis déclenche le hook onComputerPlayerAbstract.

- `_originComputerId` (*string|nil*) : Id de l'ordinateur du garage.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onComputerPlayerAbstract`

**Évènements UI (guihooks.trigger) :** `playerAbstractData`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/playerAbstract.lua`.*
