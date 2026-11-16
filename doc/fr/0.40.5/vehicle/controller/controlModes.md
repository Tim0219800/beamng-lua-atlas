# `controller_controlModes`

*Fichier : `lua/vehicle/controller/controlModes.lua` · VM : Véhicule · 149 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `controlModes` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire qui remappe les entrées du conducteur (direction, accélérateur, frein, ou accélérateur-frein combiné) vers des valeurs `electrics.values` personnalisées, selon un « mode de contrôle » choisi (par exemple pour piloter une grue ou des vérins). Chaque mode liste les electrics actifs ; chaque electric est configuré avec une entrée source, des lissages, une vitesse et des bornes. Ajoute un menu radial pour choisir le mode.

## Remarques

- Clés jbeam lues par init : `modes` (table d'en-tête avec `name`, `electrics` : liste de noms d'electrics actifs dans le mode), `config` (table d'en-tête avec `electric`, `input`, `smoothIn`, `smoothOut`, `speed`, `min`, `max`), `defaultControlModeIndex` (1).
- Entrées possibles dans `config.input` : steering, throttle, brake, throttlebrake (= throttle - brake), ou un nom défini via setInputValue.
- Calcul à chaque frame : valeur = clamp(valeur + lissage(entrée) × speed × dt, min, max) : l'entrée pilote donc une vitesse de variation, pas la position (effet intégrateur).
- controlModeName et controlModeIndex valent nil tant qu'init n'a pas tourné ; ils sont remplis par init.
- Il n'y a pas de fonction `reset` : controller.reset rappelle init.
- État sauvegardé sous la clé `<nom>_modeIndex`.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_controlModes.getState()` | Renvoie l'index de mode actif sous la clé `<nom>_modeIndex`. | 123 |
| `controller_controlModes.init(jbeamData)` | Lit les modes et la configuration depuis le jbeam, crée les lisseurs, met les electrics à 0 et enregistre le menu radial (une seule fois). *(interne)* | 65 |
| `controller_controlModes.setControlModeIndex(index, silent)` | Choisit le mode par son index (ignoré si inexistant) et affiche son nom sauf si silent. | 38 |
| `controller_controlModes.setInputValue(name, value)` | Définit une entrée personnalisée utilisable dans `config.input`. | 61 |
| `controller_controlModes.setState(data)` | Restaure l'index de mode s'il est valide (silencieusement). | 128 |
| `controller_controlModes.toggleControlMode(value)` | Décale l'index de mode de `value` avec retour circulaire (au-delà du dernier : premier ; en dessous du premier : dernier). | 50 |
| `controller_controlModes.updateGFX(dt)` | Chaque frame : lit les entrées et fait évoluer les electrics du mode actif (intégration lissée bornée). *(interne)* | 25 |

### Détail des paramètres

#### `controller_controlModes.getState()`

Renvoie l'index de mode actif sous la clé `<nom>_modeIndex`.

- **renvoie** : table Table d'état.

#### `controller_controlModes.init(jbeamData)`

Lit les modes et la configuration depuis le jbeam, crée les lisseurs, met les electrics à 0 et enregistre le menu radial (une seule fois).

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_controlModes.setControlModeIndex(index, silent)`

Choisit le mode par son index (ignoré si inexistant) et affiche son nom sauf si silent.

- `index` (*integer*) : Index du mode (1 = premier).
- `silent` (*boolean|nil*) : true pour ne pas afficher de message.

#### `controller_controlModes.setInputValue(name, value)`

Définit une entrée personnalisée utilisable dans `config.input`.

- `name` (*string*) : Nom d'entrée.
- `value` (*number*) : Valeur de l'entrée.

#### `controller_controlModes.setState(data)`

Restaure l'index de mode s'il est valide (silencieusement).

- `data` (*table|nil*) : Table d'état.

#### `controller_controlModes.toggleControlMode(value)`

Décale l'index de mode de `value` avec retour circulaire (au-delà du dernier : premier ; en dessous du premier : dernier).

- `value` (*integer*) : +1 ou -1 en pratique.

#### `controller_controlModes.updateGFX(dt)`

Chaque frame : lit les entrées et fait évoluer les electrics du mode actif (intégration lissée bornée).

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `controlModeIndex` | integer|nil | Index du mode actif (1 = premier) ; nil avant init. |
| `controlModeName` | string|nil | Nom du mode actif ; nil avant init. |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/controlModes.lua`.*
