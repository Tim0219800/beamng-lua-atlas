# `controller_braking_transbrake`

*Fichier : `lua/vehicle/controller/braking/transbrake.lua` · VM : Véhicule · 116 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `braking/transbrake` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire de transbrake (frein de boîte de drag racing) : il bloque la boîte via `gearbox:setLock(value)`. Le blocage est actif quand `gearbox.lockCoef == 0`. Publie cet état dans `electrics.values[electricsName]` et ajoute une entrée au menu radial. Peut aussi être commandé par l'évènement de gameplay `controller:<nom>`.

## Exemple

```lua
controller.getControllerSafe("transbrake").setTransbrake(true)
-- ou, côté jeu :
-- onGameplayEvent("controller:transbrake", {"setTransbrake", true})
```

## Remarques

- Clés jbeam lues par init : `gearboxName` ("gearbox"), `electricsName` ("transbrake").
- `M.updateGFX` est déclaré à `nop` en bas du fichier mais init le remplace par la vraie fonction si la boîte existe (sinon il reste `nop`).
- Hook onGameplayEvent : l'évènement doit être "controller:<typeName ou name>" et `eventData` une table {"setTransbrake", boolean} ; un type incorrect est loggué en erreur.
- Ce contrôleur est déplacé : l'ancien nom `transbrake` est redirigé vers `braking/transbrake`.
- État sauvegardé sous la clé `<nom>Active` (boolean).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_braking_transbrake.getState()` | Renvoie si le transbrake est actif. | 74 |
| `controller_braking_transbrake.init(jbeamData)` | Retrouve la boîte, choisit la fonction updateGFX et ajoute l'entrée du menu radial (une seule fois). *(interne)* | 37 |
| `controller_braking_transbrake.onGameplayEvent(event, eventData)` | Hook de controller.lua. Si le nom d'évènement est "controller:<typeName>" ou "controller:<name>", exécute la commande contenue dans eventData : {"setTransbrake", boolean}. Exemple : onGameplayEvent("controller:transbrake", {"setTransbrake", true}). *(interne)* *(hook)* | 92 |
| `controller_braking_transbrake.setState(data)` | Active ou désactive le transbrake pour correspondre à l'état sauvegardé (silencieusement). | 79 |
| `controller_braking_transbrake.setTransbrake(value, silent)` | Active ou relâche le blocage de la boîte (`gearbox:setLock`) et affiche un message sauf si silent. | 21 |
| `controller_braking_transbrake.toggleTransbrake()` | Inverse l'état du transbrake. | 30 |

### Détail des paramètres

#### `controller_braking_transbrake.getState()`

Renvoie si le transbrake est actif.

- **renvoie** : table Clé `<nom>Active` (boolean).

#### `controller_braking_transbrake.init(jbeamData)`

Retrouve la boîte, choisit la fonction updateGFX et ajoute l'entrée du menu radial (une seule fois).

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_braking_transbrake.onGameplayEvent(event, eventData)`

Hook de controller.lua. Si le nom d'évènement est "controller:<typeName>" ou "controller:<name>", exécute la commande contenue dans eventData : {"setTransbrake", boolean}. Exemple : onGameplayEvent("controller:transbrake", {"setTransbrake", true}).

- `event` (*string*) : Nom de l'évènement.
- `eventData` (*table*) : {nomDeCommande, valeur}.

#### `controller_braking_transbrake.setState(data)`

Active ou désactive le transbrake pour correspondre à l'état sauvegardé (silencieusement).

- `data` (*table|nil*) : Table d'état.

#### `controller_braking_transbrake.setTransbrake(value, silent)`

Active ou relâche le blocage de la boîte (`gearbox:setLock`) et affiche un message sauf si silent.

- `value` (*boolean*) : true pour bloquer.
- `silent` (*boolean|nil*) : true pour ne pas afficher de message.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |
| `updateGFX` | function | nop par défaut, remplacé dans init par la fonction qui publie l'electrics quand la boîte existe. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/braking/transbrake.lua`.*
