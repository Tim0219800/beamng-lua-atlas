# `career_modules_computer`

*Fichier : `lua/ge/extensions/career/modules/computer.lua` · VM : Game Engine (GE) · 143 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_computer` : `extensions.load("career_modules_computer")`, puis la globale `career_modules_computer`

Menu « ordinateur » du garage en mode carrière. openMenu construit la liste des véhicules du garage le plus proche, laisse les autres modules ajouter leurs boutons via le hook onComputerAddFunctions, démarre un tether (le menu se ferme si le joueur s'éloigne) puis navigue vers l'écran UI 'career.computer'. Un moddeur ajoute un bouton en implémentant onComputerAddFunctions(menuData, computerFunctions) dans son extension.

## Exemple

```lua
-- ajouter un bouton général dans le menu de l'ordinateur
M.onComputerAddFunctions = function(menuData, computerFunctions)
  computerFunctions.general.monBouton = {
    id = 'monBouton', label = 'Mon bouton', callback = function(computerId) print(computerId) end,
    disabled = false
  }
end
```

## Remarques

- Dépend de career_career (M.dependencies).
- computerFunctions a deux sous-tables : general[buttonId] et vehicleSpecific[inventoryId][buttonId] ; chaque entrée a un callback(computerId).
- M.reasons contient des raisons prêtes à l'emploi (tutorialActive, hasBoughtStarterVehicle, needsRepair) ; getComputerUIData traduit leur label via core_locales.
- Bug probable : dans openMenu, le repli startSphereTether(computerPos, ...) utilise la variable computerPos qui n'est pas définie (la ligne qui la calcule est commentée) ; elle vaut nil si la facilité n'a aucune porte.
- Distances de tether : 1 m (boîte, porte) et 4 m (sphère).

**Dépendances (chargées avant) :** `career_career`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_computer.closeMenu()` | Ferme tous les menus carrière (career_career.closeAllMenus). Sert aussi de callback de tether quand le joueur s'éloigne. | 111 |
| `career_modules_computer.computerButtonCallback(buttonId, inventoryId)` | Appelée par l'UI lors d'un clic : retrouve le bouton (vehicleSpecific[inventoryId] si inventoryId est donné, sinon general) et exécute son callback(computerId). | 57 |
| `career_modules_computer.getComputerUIData()` | Renvoie à l'UI une copie des données du menu : computerFunctions (labels de raisons traduits, clés inventoryId converties en chaînes), vehicles (avec thumbnail et inventoryId en chaîne), facilityName, resetActiveVehicleIndex, computerId. Table vide si le menu n'a pas été ouvert. | 68 |
| `career_modules_computer.onMenuClosed()` | Hook appelé à la fermeture du menu ; supprime le tether (tether.remove = true). *(interne)* *(hook)* | 107 |
| `career_modules_computer.openComputerMenuById(computerId)` | Récupère la facilité 'computer' par son id via freeroam_facilities.getFacility puis appelle openMenu. | 115 |
| `career_modules_computer.openMenu(computerFacility, resetActiveVehicleIndex, activityElement)` | Ouvre le menu ordinateur pour une facilité : liste les véhicules du garage le plus proche (nom, besoin de réparation, date de saleté), déclenche onComputerAddFunctions, démarre le tether, navigue vers 'career.computer' puis déclenche onComputerMenuOpened. | 18 |

### Détail des paramètres

#### `career_modules_computer.computerButtonCallback(buttonId, inventoryId)`

Appelée par l'UI lors d'un clic : retrouve le bouton (vehicleSpecific[inventoryId] si inventoryId est donné, sinon general) et exécute son callback(computerId).

- `buttonId` (*string*) : Clé du bouton dans computerFunctions.
- `inventoryId` (*integer|nil*) : Id d'inventaire du véhicule pour un bouton spécifique à un véhicule.

#### `career_modules_computer.getComputerUIData()`

Renvoie à l'UI une copie des données du menu : computerFunctions (labels de raisons traduits, clés inventoryId converties en chaînes), vehicles (avec thumbnail et inventoryId en chaîne), facilityName, resetActiveVehicleIndex, computerId. Table vide si le menu n'a pas été ouvert.

- **renvoie** : table Données pour l'écran career.computer.

#### `career_modules_computer.openComputerMenuById(computerId)`

Récupère la facilité 'computer' par son id via freeroam_facilities.getFacility puis appelle openMenu.

- `computerId` (*string*) : Identifiant de la facilité ordinateur.

#### `career_modules_computer.openMenu(computerFacility, resetActiveVehicleIndex, activityElement)`

Ouvre le menu ordinateur pour une facilité : liste les véhicules du garage le plus proche (nom, besoin de réparation, date de saleté), déclenche onComputerAddFunctions, démarre le tether, navigue vers 'career.computer' puis déclenche onComputerMenuOpened.

- `computerFacility` (*table*) : Facilité 'computer' (champs id, name, doors).
- `resetActiveVehicleIndex` (*boolean|nil*) : Transmis à l'UI dans menuData.resetActiveVehicleIndex.
- `activityElement` (*any*) : Non utilisé dans la fonction.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"career_career"} : extensions chargées avant ce module. |
| `reasons` | table<string, table> | Raisons standard de désactivation d'un bouton : tutorialActive, hasBoughtStarterVehicle (type 'text') et needsRepair (type 'needsRepair'), chacune avec un label de traduction. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onComputerAddFunctions` — écouté par 11 module(s)
- `onComputerMenuOpened` — écouté par 1 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/computer.lua`.*
