# `core_funstuff`

*Fichier : `lua/ge/extensions/core/funstuff.lua` · VM : Game Engine (GE) · 514 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_funstuff` : `extensions.load("core_funstuff")`, puis la globale `core_funstuff`

Extension GE `core_funstuff` : actions « fun » du menu radial du mode bac à sable (sandbox) : champ de force, propulsions et lancers du véhicule, destruction (casser, dégonfler, incendier, exploser), ouverture des capots/portes, niveau de carburant, couleurs et véhicule aléatoires, itinéraire aléatoire. Les fonctions exportées agissent sur le véhicule joueur 0 et renvoient une instruction pour le menu radial ({'hide'} ou {'reload'}). registerFunstuffActions enregistre les entrées dans core_quickAccess.

## Exemple

```lua
extensions.load('core_funstuff')
core_funstuff.boost()            -- +25 m/s dans la direction du véhicule
core_funstuff.flingUpward()      -- +15 m/s vers le haut
core_funstuff.igniteVehicle()
```

## Remarques

- Valeurs de lancer (applyFling, vitesses ajoutées au cluster du véhicule via applyClusterVelocityScaleAdd) : flingUpward +15 m/s en z, flingDownward -15 m/s, boost +25 m/s selon la direction du véhicule, boostBackwards -25 m/s. L'effet est réduit linéairement quand la vitesse du véhicule dans la direction du lancer dépasse 200 km/h (55,6 m/s) et annulé à 450 km/h (125 m/s).
- Retour : chaque action renvoie {'hide'} (fermer le menu radial) ou {'reload'} (recharger les entrées du menu) : valeur attendue par core_quickAccess ; sans effet quand elles sont appelées par script.
- Plusieurs fonctions n'ont pas de test : breakAllBreakgroups, breakHinges, deflateTires, deflateRandomTire, igniteVehicle, extinguishVehicle font getPlayerVehicle(0):queueLuaCommand(...) directement et provoquent une erreur Lua s'il n'y a pas de véhicule joueur. Les fonctions de boost/fling testent, elles, l'existence du véhicule.
- explodeVehicle : crée une 'planète' répulsive (obj:setPlanets({x,y,z,rayon 5,masse})) sous le véhicule avec une masse de -3e13 * taille/3 (taille = plus grande demi-dimension de la boîte englobante), déclenche fire.explodeVehicle et beamstate.breakAllBreakgroups, puis supprime la planète après 0,2 s de temps de simulation (le commentaire dit « 1 second »). La commande est envoyée à tous les objets (be:queueAllObjectLua), donc tous les véhicules subissent la force.
- Non exportées (internes aux entrées du menu) : randomizeColors, randomVehicle, randomRoute (3000 à 8000 m, checkpoints tous les 300 m, ratio 50 % terre / 50 % bitume), setFuelLevel(level 0..1).
- Les entrées du menu sont masquées si l'action correspondante est bloquée par core_input_actionFilter (funBreak, funHinges, funTires, funFire, funExtinguish, funBoom, forceField, funFling, funFlingDownward, funBoost, funBoostBackwards, latchesOpen, latchesClose, parts_selector, vehicle_selector, toggleBigMap).
- Incohérences : le paramètre `entries` de registerFunstuffActions n'est pas utilisé ; la fonction enregistre trois niveaux de menu (/root/sandbox/funStuff/, .../destruction/, .../forces/, .../other/) et peut créer des doublons si elle est appelée plusieurs fois.

**Dépendances (chargées avant) :** `core_jobsystem`, `gameplay_forceField`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_funstuff.boost()` | Ajoute 25 m/s au véhicule joueur dans sa direction avant. | 61 |
| `core_funstuff.boostBackwards()` | Ajoute 25 m/s au véhicule joueur vers l'arrière. | 72 |
| `core_funstuff.breakAllBreakgroups()` | Casse tous les groupes de rupture (breakgroups) du véhicule joueur (beamstate.breakAllBreakgroups). Erreur s'il n'y a pas de véhicule. | 85 |
| `core_funstuff.breakHinges()` | Casse les charnières du véhicule joueur (beamstate.breakHinges). | 90 |
| `core_funstuff.closeLatches()` | Ferme tous les verrous du véhicule joueur via l'action 'latchesClose'. | 253 |
| `core_funstuff.deflateRandomTire()` | Dégonfle un pneu au hasard (beamstate.deflateRandomTire). | 100 |
| `core_funstuff.deflateTires()` | Dégonfle tous les pneus du véhicule joueur (beamstate.deflateTires). | 95 |
| `core_funstuff.explodeVehicle()` | Fait exploser le véhicule joueur (voir notes : planète répulsive temporaire + fire.explodeVehicle + rupture de tous les breakgroups). S'exécute dans un job de core_jobsystem. | 133 |
| `core_funstuff.extinguishVehicle()` | Éteint le feu du véhicule joueur (fire.extinguishVehicle). | 110 |
| `core_funstuff.flingDownward()` | Projette le véhicule joueur vers le bas de 15 m/s. | 53 |
| `core_funstuff.flingUpward()` | Projette le véhicule joueur vers le haut de 15 m/s (réduit s'il monte déjà vite). | 45 |
| `core_funstuff.igniteVehicle()` | Met le feu au véhicule joueur (fire.igniteVehicle). | 105 |
| `core_funstuff.openLatches()` | Ouvre tous les verrous (portes, capot, coffre) du véhicule joueur via core_vehicleBridge.executeAction(…, 'latchesOpen'). | 248 |
| `core_funstuff.registerFunstuffActions(entries)` | Enregistre dans core_quickAccess les niveaux de menu radial '/root/sandbox/funStuff/' (accueil + sous-menus Destruction, Forces, Other) et leurs entrées, en respectant les actions bloquées par core_input_actionFilter. | 271 |
| `core_funstuff.toggleForceField()` | Fait tourner le champ de force sur trois états : inactif -> répulsion (multiplicateur 1) -> attraction (multiplicateur -0.5) -> inactif. | 9 |

### Détail des paramètres

#### `core_funstuff.boost()`

Ajoute 25 m/s au véhicule joueur dans sa direction avant.

- **renvoie** : string[] {'hide'}.

#### `core_funstuff.boostBackwards()`

Ajoute 25 m/s au véhicule joueur vers l'arrière.

- **renvoie** : string[] {'hide'}.

#### `core_funstuff.breakAllBreakgroups()`

Casse tous les groupes de rupture (breakgroups) du véhicule joueur (beamstate.breakAllBreakgroups). Erreur s'il n'y a pas de véhicule.

- **renvoie** : string[] {'hide'}.

#### `core_funstuff.breakHinges()`

Casse les charnières du véhicule joueur (beamstate.breakHinges).

- **renvoie** : string[] {'hide'}.

#### `core_funstuff.closeLatches()`

Ferme tous les verrous du véhicule joueur via l'action 'latchesClose'.

- **renvoie** : string[] {'hide'}.

#### `core_funstuff.deflateRandomTire()`

Dégonfle un pneu au hasard (beamstate.deflateRandomTire).

- **renvoie** : string[] {'hide'}.

#### `core_funstuff.deflateTires()`

Dégonfle tous les pneus du véhicule joueur (beamstate.deflateTires).

- **renvoie** : string[] {'hide'}.

#### `core_funstuff.explodeVehicle()`

Fait exploser le véhicule joueur (voir notes : planète répulsive temporaire + fire.explodeVehicle + rupture de tous les breakgroups). S'exécute dans un job de core_jobsystem.

- **renvoie** : string[]|nil {'hide'} ; nil s'il n'y a pas de véhicule joueur.

#### `core_funstuff.extinguishVehicle()`

Éteint le feu du véhicule joueur (fire.extinguishVehicle).

- **renvoie** : string[] {'hide'}.

#### `core_funstuff.flingDownward()`

Projette le véhicule joueur vers le bas de 15 m/s.

- **renvoie** : string[] {'hide'}.

#### `core_funstuff.flingUpward()`

Projette le véhicule joueur vers le haut de 15 m/s (réduit s'il monte déjà vite).

- **renvoie** : string[] {'hide'}.

#### `core_funstuff.igniteVehicle()`

Met le feu au véhicule joueur (fire.igniteVehicle).

- **renvoie** : string[] {'hide'}.

#### `core_funstuff.openLatches()`

Ouvre tous les verrous (portes, capot, coffre) du véhicule joueur via core_vehicleBridge.executeAction(…, 'latchesOpen').

- **renvoie** : string[] {'hide'}.

#### `core_funstuff.registerFunstuffActions(entries)`

Enregistre dans core_quickAccess les niveaux de menu radial '/root/sandbox/funStuff/' (accueil + sous-menus Destruction, Forces, Other) et leurs entrées, en respectant les actions bloquées par core_input_actionFilter.

- `entries` (*any*) : Non utilisé.

#### `core_funstuff.toggleForceField()`

Fait tourner le champ de force sur trois états : inactif -> répulsion (multiplicateur 1) -> attraction (multiplicateur -0.5) -> inactif.

- **renvoie** : string[] {'reload'} : recharge le menu radial.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'core_jobsystem', 'gameplay_forceField'}. |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicle`, `queueAllObjectLua`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/funstuff.lua`.*
