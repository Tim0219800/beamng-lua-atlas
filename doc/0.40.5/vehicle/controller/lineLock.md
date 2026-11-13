# `controller_lineLock`

*Fichier : `lua/vehicle/controller/lineLock.lua` · VM : Véhicule · 156 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `lineLock` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire « line lock » de dragster (type "auxiliary", defaultOrder 40) : verrouille la pression de frein des roues listées (typiquement l'avant) au niveau actuel pour permettre de chauffer les pneus arrière. À l'activation, il mémorise le couple de frein principal courant de chaque roue verrouillée et le réapplique à chaque pas dans wd.desiredBrakingTorque tant que le line lock est actif. Une entrée « Line Lock » est ajoutée au menu radial.

## Exemple

```lua
local ll = controller.getControllerSafe('lineLock')
ll.toggleLineLock()
```

## Remarques

- Clés jbeam (défaut) : name (nom du contrôleur, utilisé par le menu radial pour le retrouver), lockedLines (liste de noms de roues), electricsName ("linelock").
- electrics.values[electricsName] vaut 1 quand actif, 0 sinon. Un message d'interface indique les roues verrouillées et le pourcentage de frein au moment de l'activation.
- setLineLock(value) : value >= 1 active ; toute valeur < 1 désactive (couples mémorisés remis à 0).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_lineLock.getState()` | Renvoie l'état actif et les couples mémorisés par roue. | 115 |
| `controller_lineLock.init(jbeamData)` | Lit les roues à verrouiller, enregistre l'entrée du menu radial. *(interne)* | 66 |
| `controller_lineLock.setLineLock(value)` | Active ou désactive le line lock et mémorise le couple de frein courant des roues verrouillées. | 43 |
| `controller_lineLock.setState(data)` | Restaure l'état renvoyé par getState. | 123 |
| `controller_lineLock.toggleLineLock()` | Inverse l'état du line lock. | 61 |
| `controller_lineLock.updateGFX(dt)` | Écrit l'état dans electrics.values. *(interne)* | 39 |
| `controller_lineLock.updateWheelsIntermediate(dt)` | Chaque pas : applique les couples de frein mémorisés aux roues verrouillées quand le line lock est actif. *(interne)* | 30 |

### Détail des paramètres

#### `controller_lineLock.getState()`

Renvoie l'état actif et les couples mémorisés par roue.

- **renvoie** : table Table d'état (réutilisée).

#### `controller_lineLock.init(jbeamData)`

Lit les roues à verrouiller, enregistre l'entrée du menu radial.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_lineLock.setLineLock(value)`

Active ou désactive le line lock et mémorise le couple de frein courant des roues verrouillées.

- `value` (*number*) : 1 pour activer, 0 pour désactiver.

#### `controller_lineLock.setState(data)`

Restaure l'état renvoyé par getState.

- `data` (*table|nil*) : Table d'état.

#### `controller_lineLock.updateGFX(dt)`

Écrit l'état dans electrics.values.

- `dt` (*number*) : Pas de temps (s).

#### `controller_lineLock.updateWheelsIntermediate(dt)`

Chaque pas : applique les couples de frein mémorisés aux roues verrouillées quand le line lock est actif.

- `dt` (*number*) : Pas de temps (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultOrder` | number | 40. |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/lineLock.lua`.*
