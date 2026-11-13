# `fire`

*Fichier : `lua/vehicle/fire.lua` · VM : Véhicule · 487 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `fire`

Simulation d'incendie du véhicule. Les noeuds jbeam qui ont un `flashPoint` deviennent des noeuds inflammables : chacun a une température, une énergie chimique (chemEnergy), une intensité de flamme, éventuellement un réservoir (containerBeam) dont la rupture libère des vapeurs. Ils chauffent par frottement/collision (nodeCollision), conduction et rayonnement depuis les noeuds en feu (hotNodes), refroidissent à l'air ou dans l'eau, émettent flammes, fumée et sons, et font éclater les pneus. Un moddeur ou un scénario peut allumer, faire exploser ou éteindre le véhicule avec igniteVehicle, explodeVehicle, extinguishVehicle…

## Exemple

```lua
fire.igniteVehicle()          -- met le feu à tous les noeuds inflammables (sauf pneus)
fire.explodeNode(cid)         -- explosion localisée
fire.extinguishVehicle()      -- remet tout à la température ambiante
local temp, dist = fire.getClosestHotNodeTempDistance(cid)
```

## Remarques

- CLÉS JBEAM de noeud lues : flashPoint (active le système, °C), smokePoint (défaut = flashPoint), burnRate, baseTemp (nombre en °C, ou "thermals" pour suivre controller.mainController.fireEngineTemperature), conductionRadius (m, défaut 0), selfIgnitionCoef (défaut 0, échauffement par collision), chemEnergy (énergie combustible), specHeat (défaut 1) combinée au poids du noeud (nodeWeight), vaporPoint (seuil de vaporisation 0..100), containerBeam (nom de la poutre de réservoir), ignoreContainerBeamBreakMessage. Un noeud avec containerBeam ne peut s'enflammer (canIgnite) qu'après la rupture de cette poutre.
- La simulation n'est active que si au moins un noeud a un flashPoint (fireNodeCounter > 0). Sinon `updateGFX` et `nodeCollision` restent des nop. Remarque : init() ne remet pas nodeCollision à nop lors d'un nouvel appel si le compteur tombe à 0, mais cela ne peut arriver que si les données du véhicule changent.
- Chaque frame, updateGFX ne traite qu'UN seul noeud inflammable (parcours circulaire via getCircular) : le temps simulé pour ce noeud est dt x nombre de noeuds inflammables pour compenser. Les températures sont en °C ; maxNodeTemp = 1950, tirePopTemp = 650 (éclatement d'un pneu), tSteam = 100 (vapeur dans l'eau).
- Conséquence : une vapeur de carburant (vaporState) abaisse les points de fumée/flash de 50 % ; une intensité > 10 déclenche boule de feu, fumée massive et gerbe d'étincelles ; l'extinction lente (extinguishVehicleSlowly) met chemEnergy à 0 : le feu s'éteint quand le combustible est épuisé.
- Bug apparent : `local rand = random(1)` appelle math.random(1) qui vaut toujours 1 (le commentaire dit « même valeur aléatoire pour tous les effets »), donc le facteur aléatoire des particules est constant.
- Incohérence mineure : `drivetrain.engineDisabled` est lu dans updateGFX ; si le module drivetrain n'expose plus ce champ il vaut nil (refroidissement alors limité à baseTemp).
- Appelé par main.lua : init() dans initSystems, reset() = init() dans onVehicleReset, updateGFX(dt) en fin de onGraphicsStep, nodeCollision(p) dans onNodeCollision. Particules par numéros d'id du fichier de particules du jeu (25-30 flammes, 31 boule de feu, 32 fumée, 43/51-53 fumées, 48 extincteur).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `fire.explodeNode(cid)` | Fait exploser un seul noeud : température maximale, vapeurs maximales, réservoir considéré rompu, noeud ajouté aux noeuds chauds. | 440 |
| `fire.explodeVehicle()` | Provoque l'explosion : tous les réservoirs sont considérés rompus et pleins de vapeur, tous les noeuds inflammables sont allumés à température maximale. | 427 |
| `fire.extinguishVehicle()` | Éteint immédiatement : température ambiante, intensité 0 et particules d'extincteur sur chaque noeud inflammable. | 453 |
| `fire.extinguishVehicleSlowly()` | Met chemEnergy à 0 sur tous les noeuds : plus de combustible, les flammes disparaissent en refroidissant. | 461 |
| `fire.getClosestHotNodeTempDistance(cid)` | Renvoie la température du noeud en feu le plus proche d'un noeud donné et la distance à lui. | 43 |
| `fire.igniteNode(cid, temp)` | Porte un noeud inflammable à une température donnée (maxNodeTemp par défaut) ; il s'enflammera ensuite si possible. Sans effet si le noeud n'est pas inflammable. | 375 |
| `fire.igniteRandomNode()` | Allume à température maximale un noeud inflammable au hasard (hors roues, pouvant s'enflammer, sans flamme en cours). | 383 |
| `fire.igniteRandomNodeMinimal()` | Allume un noeud au hasard à flashPoint + 10 °C seulement (départ de feu discret). | 398 |
| `fire.igniteVehicle()` | Allume tous les noeuds inflammables sauf les noeuds de roue (pour retarder l'éclatement des pneus). | 419 |
| `fire.init()` | Construit la liste des noeuds inflammables à partir de v.data.nodes, repère le noeud le plus central (référence des particules), les poutres réservoir et les noeuds de roue, et active updateGFX/nodeCollision s'il y a au moins un noeud inflammable. Appelée par main.lua à l'init. *(interne)* | 289 |
| `fire.nodeCollision(p)` | Appelée par main.lua:onNodeCollision : échauffe un noeud inflammable avec l'énergie de frottement (slipForce x slipVel x lastDt x selfIgnitionCoef / capacité thermique) et l'enflamme s'il atteint son point de fumée. Ignore les collisions avec profondeur > 0. (assignée dynamiquement) *(interne)* | dyn |
| `fire.reset()` | Identique à init (M.reset = init) : réinitialise tout l'état d'incendie au reset du véhicule. *(interne)* | 289 |
| `fire.updateGFX(dt)` | Appelée à chaque frame par main.lua (nop si pas de feu simulé). Traite le noeud inflammable suivant : vapeurs de réservoir, vapeur d'eau, transfert de chaleur depuis les noeuds en feu, refroidissement, combustion (intensité, consommation de chemEnergy), émission de flammes/fumée/sons et éclatement des pneus. (assignée dynamiquement) *(interne)* | dyn |

### Détail des paramètres

#### `fire.explodeNode(cid)`

Fait exploser un seul noeud : température maximale, vapeurs maximales, réservoir considéré rompu, noeud ajouté aux noeuds chauds.

- `cid` (*integer*) : Identifiant du noeud.

#### `fire.getClosestHotNodeTempDistance(cid)`

Renvoie la température du noeud en feu le plus proche d'un noeud donné et la distance à lui.

- `cid` (*integer*) : Noeud de référence.
- **renvoie** : number Température du noeud chaud le plus proche (0 s'il n'y en a pas).
- **renvoie** : number Distance en mètres (math.huge s'il n'y a pas de noeud chaud).

#### `fire.igniteNode(cid, temp)`

Porte un noeud inflammable à une température donnée (maxNodeTemp par défaut) ; il s'enflammera ensuite si possible. Sans effet si le noeud n'est pas inflammable.

- `cid` (*integer*) : Identifiant (cid) du noeud.
- `temp` (*number|nil*) : Température en °C (1950 si nil).

#### `fire.nodeCollision(p)`

Appelée par main.lua:onNodeCollision : échauffe un noeud inflammable avec l'énergie de frottement (slipForce x slipVel x lastDt x selfIgnitionCoef / capacité thermique) et l'enflamme s'il atteint son point de fumée. Ignore les collisions avec profondeur > 0. (assignée dynamiquement)

- `p` (*table*) : Données de collision (particlefilter.particleData) : id1, slipForce, slipVel, depth…

#### `fire.updateGFX(dt)`

Appelée à chaque frame par main.lua (nop si pas de feu simulé). Traite le noeud inflammable suivant : vapeurs de réservoir, vapeur d'eau, transfert de chaleur depuis les noeuds en feu, refroidissement, combustion (intensité, consommation de chemEnergy), émission de flammes/fumée/sons et éclatement des pneus. (assignée dynamiquement)

- `dt` (*number*) : Pas de temps de simulation en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugData` | table | Données de debug ; debugData.flammableNodes pointe vers la table des noeuds inflammables. |
| `flammableNodes` | table<integer, table> | Noeuds inflammables par cid, avec temperature, intensity, chemEnergy, flashPoint, smokePoint, burnRate, isVapor, vaporState, canIgnite, etc. |
| `hotNodes` | table<integer, table> | Sous-ensemble de flammableNodes actuellement en train de brûler (température au-dessus du point de fumée). |

## Appels vers le moteur (C++)

- `obj:` `addParticleByNodes`, `addParticleByNodesRelative`, `beamIsBroken`, `createSFXSource`, `getEnvTemperature`, `inWater`, `nodeLength`, `nodeSquaredLength`, `playSFX`, `setNodeVolumePitchCT`, `stopSFX`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/fire.lua`.*
