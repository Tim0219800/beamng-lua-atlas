# `controller_nitrousOxideInjection`

*Fichier : `lua/vehicle/controller/nitrousOxideInjection.lua` · VM : Véhicule · 165 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `nitrousOxideInjection` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire de commande du protoxyde d'azote (N2O, type "auxiliary", relevantDevice "mainEngine"). Il arme/désarme le système via electrics.values (électrique d'armement), purge les conduites à l'armement et ajoute un bouton « N2O » au panneau de contrôle simplifié et une entrée au menu radial. L'injection elle-même est gérée par le moteur (engine.nitrousOxideInjection) ; ce contrôleur ne fait que l'interface et l'armement.

## Exemple

```lua
local n2o = controller.getControllerSafe('nitrousOxideInjection')
n2o.toggleActive()      -- arme/désarme
n2o.setOverride(true)   -- force l'injection (électrique d'override)
```

## Remarques

- Clés jbeam (défaut) : name (nom du contrôleur pour le menu radial), engineName ("mainEngine"), electricsArmName ("nitrousOxideArm"), electricsOverrideName ("nitrousOxideOverride"), purgeTime (1, s).
- Le contrôleur n'est actif (updateGFX) que si le moteur possède un sous-système nitrousOxideInjection existant ; sinon M.updateGFX reste nop.
- toggleActive : quand on arme (valeur electrics 0 -> 1) la purge des conduites est lancée pour purgeTime secondes ; un message d'interface Armed/Disarmed est affiché.
- serialize/deserialize/getState/setState gèrent l'état d'armement (serialize) ou le temps de purge restant (getState).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_nitrousOxideInjection.deserialize(data)` | Restaure l'état d'armement. | 71 |
| `controller_nitrousOxideInjection.getState()` | Renvoie le temps de purge restant. | 77 |
| `controller_nitrousOxideInjection.init(jbeamData)` | Lit la configuration, retrouve le moteur, enregistre le menu radial et affiche l'état. *(interne)* | 104 |
| `controller_nitrousOxideInjection.reset(jbeamData)` | Efface les données d'état de l'interface. *(interne)* | 100 |
| `controller_nitrousOxideInjection.serialize()` | Renvoie l'état d'armement. | 65 |
| `controller_nitrousOxideInjection.setOverride(active)` | Active/désactive l'électrique d'override de l'injection. | 53 |
| `controller_nitrousOxideInjection.setState(data)` | Restaure le temps de purge restant (borné 0..purgeTime). | 84 |
| `controller_nitrousOxideInjection.toggleActive()` | Arme ou désarme le système (purge des conduites à l'armement) et affiche un message. | 57 |
| `controller_nitrousOxideInjection.updateGFX(dt)` | Met à jour le bouton du panneau simplifié quand le réservoir, l'armement ou l'activité changent (nop si pas de N2O) (assignée dynamiquement) *(interne)* | dyn |
| `controller_nitrousOxideInjection.updateSimpleControlButtons()` | (Re)crée le bouton « N2O » du panneau simplifié avec la couleur (inactif, armé, actif) et le niveau du réservoir. | 25 |

### Détail des paramètres

#### `controller_nitrousOxideInjection.deserialize(data)`

Restaure l'état d'armement.

- `data` (*table|nil*) : Table renvoyée par serialize.

#### `controller_nitrousOxideInjection.getState()`

Renvoie le temps de purge restant.

- **renvoie** : table Table d'état (réutilisée).

#### `controller_nitrousOxideInjection.init(jbeamData)`

Lit la configuration, retrouve le moteur, enregistre le menu radial et affiche l'état.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_nitrousOxideInjection.reset(jbeamData)`

Efface les données d'état de l'interface.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_nitrousOxideInjection.serialize()`

Renvoie l'état d'armement.

- **renvoie** : table {isArmed = valeur electrics}

#### `controller_nitrousOxideInjection.setOverride(active)`

Active/désactive l'électrique d'override de l'injection.

- `active` (*boolean*) : Vrai pour forcer l'injection.

#### `controller_nitrousOxideInjection.setState(data)`

Restaure le temps de purge restant (borné 0..purgeTime).

- `data` (*table|nil*) : Table d'état.

#### `controller_nitrousOxideInjection.updateGFX(dt)`

Met à jour le bouton du panneau simplifié quand le réservoir, l'armement ou l'activité changent (nop si pas de N2O) (assignée dynamiquement)

- `dt` (*number*) : Pas de temps (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `relevantDevice` | string | "mainEngine" : dispositif de powertrain concerné (valeur par défaut). |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/nitrousOxideInjection.lua`.*
