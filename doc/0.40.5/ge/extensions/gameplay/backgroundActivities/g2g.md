# `gameplay_backgroundActivities_g2g`

*Fichier : `lua/ge/extensions/gameplay/backgroundActivities/g2g.lua` · VM : Game Engine (GE) · 146 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_backgroundActivities_g2g` : `extensions.load("gameplay_backgroundActivities_g2g")`, puis la globale `gameplay_backgroundActivities_g2g`

Activité de fond « g2g » : à l'activation, fondu au noir, apparition d'un véhicule aléatoire (voiture ou camion avec Top Speed > 10), puis fondu depuis le noir, le tout via util_stepHandler. À la désactivation, les véhicules créés sont supprimés. getVehicleOptions construit (et met en cache) la liste des modèles et configs candidats à partir de core_vehicles.getVehicleList().

## Exemple

```lua
gameplay_backgroundActivities_g2g.toggleActive()
```

## Remarques

- vehicleCount vaut 1 : un seul véhicule est créé.
- Le mode de filtrage est figé à 'Default' dans getVehicleOptions ; les autres modes (Old Cars, Race and Rally, Off-road…) ne sont jamais actifs.
- activate() met active = true dès le début, activateFinished le remet à true à la fin de la séquence.
- deactivate() ne remet pas active à false : après une désactivation, isActive() reste true et toggleActive()/activate() ne recréent rien (activate retourne si active est vrai). Bug probable du jeu.
- onUpdate et onDeserialized sont des fonctions vides ; onVehicleSwitched ne fait rien (appel commenté).
- Typo « backrgound » dans les logs.

**Dépendances (chargées avant) :** `util_stepHandler`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_backgroundActivities_g2g.activate()` | Active l'activité : sans effet si déjà active. Lance une séquence de pas (fondu au noir, spawn d'un véhicule aléatoire parmi getVehicleOptions, fondu depuis le noir) qui appelle activateFinished à la fin. Les ids des véhicules créés sont mémorisés. | 13 |
| `gameplay_backgroundActivities_g2g.activateFinished()` | Callback de fin de la séquence d'activation : journalise et force active = true. *(interne)* | 30 |
| `gameplay_backgroundActivities_g2g.deactivate()` | Supprime les véhicules créés (notifie l'éditeur si présent, puis obj:delete()) et vide la liste d'ids. Sans effet si l'activité n'est pas active. | 35 |
| `gameplay_backgroundActivities_g2g.getVehicleOptions()` | Retourne (et met en cache) la liste des véhicules candidats : modèles de type Car ou Truck, hors bus et auxiliaires, avec au moins une config dont Top Speed > 10 et non auxiliaire. | 89 |
| `gameplay_backgroundActivities_g2g.isActive()` | Indique si l'activité est active. | 70 |
| `gameplay_backgroundActivities_g2g.onCareerActive(enabled)` | Hook appelé quand le mode carrière change d'état ; désactive l'activité si la carrière devient active. *(interne)* *(hook)* | 81 |
| `gameplay_backgroundActivities_g2g.onClientEndMission()` | Hook appelé à la fin d'un niveau : désactive l'activité. *(interne)* *(hook)* | 62 |
| `gameplay_backgroundActivities_g2g.onDeserialized()` | Hook appelé après le rechargement des extensions : corps vide. *(interne)* *(hook)* | 78 |
| `gameplay_backgroundActivities_g2g.onSerialize()` | Hook appelé avant le rechargement des extensions : désactive l'activité. *(interne)* *(hook)* | 74 |
| `gameplay_backgroundActivities_g2g.onUpdate(dtReal, dtSim, dtRaw)` | Hook de mise à jour : corps vide. *(interne)* *(hook)* | 59 |
| `gameplay_backgroundActivities_g2g.onVehicleSwitched()` | Hook appelé au changement de véhicule contrôlé : ne fait rien. *(interne)* *(hook)* | 66 |
| `gameplay_backgroundActivities_g2g.toggleActive()` | Désactive l'activité si elle est active, sinon l'active. | 50 |

### Détail des paramètres

#### `gameplay_backgroundActivities_g2g.getVehicleOptions()`

Retourne (et met en cache) la liste des véhicules candidats : modèles de type Car ou Truck, hors bus et auxiliaires, avec au moins une config dont Top Speed > 10 et non auxiliaire.

- **renvoie** : table<integer, {model: string, configs: table[], paints: string[]}> Chaque entrée : clé du modèle, configs {config, name} et noms de peintures.

#### `gameplay_backgroundActivities_g2g.isActive()`

Indique si l'activité est active.

- **renvoie** : boolean|nil true si active ; nil tant qu'elle n'a jamais été activée.

#### `gameplay_backgroundActivities_g2g.onCareerActive(enabled)`

Hook appelé quand le mode carrière change d'état ; désactive l'activité si la carrière devient active.

- `enabled` (*boolean*) : true si la carrière est activée.

#### `gameplay_backgroundActivities_g2g.onUpdate(dtReal, dtSim, dtRaw)`

Hook de mise à jour : corps vide.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulation (s).
- `dtRaw` (*number*) : Delta temps brut (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : {"util_stepHandler"}. |

## Appels vers le moteur (C++)

- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/backgroundActivities/g2g.lua`.*
