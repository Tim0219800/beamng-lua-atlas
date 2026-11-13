# `career_modules_playerDriving`

*Fichier : `lua/ge/extensions/career/modules/playerDriving.lua` · VM : Game Engine (GE) · 379 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_playerDriving` : `extensions.load("career_modules_playerDriving")`, puis la globale `career_modules_playerDriving`

Gère la conduite du joueur en carrière : mise en place du trafic et des véhicules garés, suivi de l'état du joueur (stationné, trafic, poursuite de police), amendes d'arrestation, phases du tutoriel (trafic masqué puis restauré), téléportation au garage (avec remorque), récupération du véhicule favori et affichage d'une position par caméra. Utilise gameplay_traffic, gameplay_parking et gameplay_police.

## Exemple

```lua
local d = career_modules_playerDriving.getPlayerData()
if career_modules_playerDriving.playerPursuitActive() then ... end
```

## Remarques

- playerData : {maxTrafficAmount, maxParkingAmount, defaultTrafficAmount = 1, isParked, traffic, parking}.
- debugMode vaut `not shipping_build` (booléen) : en mode debug, les quantités de trafic et de véhicules garés ne sont pas bornées ; sinon elles sont bornées entre 2 et 50. Si le réglage trafficRestrictForCareer est actif (hors build shipping), les deux quantités valent 1.
- Amende d'arrestation de police : data.mode * data.uniqueOffensesCount * 100 (marqué WIP dans le code), payée sans canBeNegative : si le joueur ne peut pas payer, pay échoue sans rien débiter.
- Après le tutoriel ou une fin de mission, la probabilité d'apparition des véhicules de police est fixée à 0.15 ; pendant le tutoriel elle est 0.
- teleportTrailerJob calcule trailerBB avec vehicle:getSpawnWorldOOBB() au lieu de celui de la remorque (probable bug : la remorque est placée selon la taille du véhicule tracteur).
- onUpdate est un squelette (« career police logic ») sans effet.
- Les mises à jour du joueur (setPlayerData) ne sont pas faites pendant le tutoriel ni pendant une mission au premier plan.

**Dépendances (chargées avant) :** `career_career`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_playerDriving.getPlayerData()` | Renvoie la table d'état du joueur (trafic, stationnement, quantités maximales). | 15 |
| `career_modules_playerDriving.onCareerActive(active)` | Hook : lance setupTraffic si la carrière est active et le trafic jamais préparé ; active les déclencheurs spéciaux pendant le chargement pour précalculer l'éclairage des garages. *(interne)* *(hook)* | 315 |
| `career_modules_playerDriving.onPursuitAction(vehId, action, data)` | Hook de poursuite : désactive le suivi de stationnement au début, le réactive à reset/evade, et inflige une amende à l'arrestation (message UI). *(interne)* *(hook)* | 262 |
| `career_modules_playerDriving.onTrafficOrParkingReady()` | Hook : quand le trafic et les voitures garées sont prêts, ferme l'écran de chargement careerVehicles et désactive les déclencheurs spéciaux ; pendant le tutoriel, les masque et mémorise leurs quantités. *(interne)* *(hook)* | 283 |
| `career_modules_playerDriving.onTrafficStarted()` | Hook : à l'activation du trafic, mémorise les quantités maximales et réinitialise l'état du joueur (hors tutoriel et mission). *(interne)* *(hook)* | 245 |
| `career_modules_playerDriving.onTrafficStopped()` | Hook : vide les données de trafic du joueur. *(interne)* *(hook)* | 258 |
| `career_modules_playerDriving.onUpdate(dtReal, dtSim, dtRaw)` | Hook de frame : vide en pratique (« career police logic » non implémentée). *(interne)* *(hook)* | 309 |
| `career_modules_playerDriving.onVehicleParkingStatus(vehId, data)` | Hook de stationnement : met playerData.isParked à true (événement valid) ou false (exit) pour le véhicule joueur, hors mission et tutoriel. *(interne)* *(hook)* | 233 |
| `career_modules_playerDriving.onVehicleSwitched(oldId, newId)` | Hook : met à jour les données du joueur pour le nouveau véhicule (hors tutoriel et mission). *(interne)* *(hook)* | 303 |
| `career_modules_playerDriving.playerPursuitActive()` | Indique si le joueur est poursuivi par la police (pursuit.mode différent de 0). | 107 |
| `career_modules_playerDriving.resetPlayerState()` | Recalcule les données du joueur pour le véhicule actuel, règle les variables du trafic, de la police (rayon d'arrestation 15, temps d'évasion 30) et du stationnement (précision 0.2), et remet à zéro le suivi de trafic du joueur. | 111 |
| `career_modules_playerDriving.restoreTrafficAfterTutorialPhase()` | Réactive le trafic si coupé, restaure les quantités actives mémorisées (ou celles des réglages si nulles) puis appelle setTrafficAfterTutorial. | 141 |
| `career_modules_playerDriving.retrieveFavoriteVehicle()` | Amène le véhicule favori de l'inventaire à la position du joueur : le téléporte s'il existe, sinon le fait apparaître s'il est accessible et n'a pas besoin de réparation. | 157 |
| `career_modules_playerDriving.setTrafficAfterTutorial()` | Fin de phase tutoriel : disperse trafic et voitures garées, réinitialise l'état du joueur et met la probabilité de police à 0.15. | 125 |
| `career_modules_playerDriving.setTrafficForTutorial()` | Phase tutoriel : disperse les voitures garées et le trafic, masque les garées (quantité 0), règle le trafic actif sur maxTrafficAmount et met la police à 0. | 117 |
| `career_modules_playerDriving.showPosition(pos)` | Oriente le joueur (mode marche) vers pos ; si un obstacle statique bloque la vue, joue un court trajet de caméra (5,5 s) qui montre la position puis revient à la caméra véhicule. | 340 |
| `career_modules_playerDriving.teleportToGarage(garageId, veh, resetVeh)` | Téléporte le véhicule au garage, annule la navigation de mission, coupe le contact, gère une éventuelle remorque (téléportation différée, puis suppression après mise à jour des conditions de pièces) et vérifie le carburant minimal. | 205 |

### Détail des paramètres

#### `career_modules_playerDriving.getPlayerData()`

Renvoie la table d'état du joueur (trafic, stationnement, quantités maximales).

- **renvoie** : table playerData (référence directe).

#### `career_modules_playerDriving.onCareerActive(active)`

Hook : lance setupTraffic si la carrière est active et le trafic jamais préparé ; active les déclencheurs spéciaux pendant le chargement pour précalculer l'éclairage des garages.

- `active` (*boolean*) : État d'activation.

#### `career_modules_playerDriving.onPursuitAction(vehId, action, data)`

Hook de poursuite : désactive le suivi de stationnement au début, le réactive à reset/evade, et inflige une amende à l'arrestation (message UI).

- `vehId` (*integer*) : Id du véhicule.
- `action` (*string*) : start, reset, evade ou arrest.
- `data` (*table*) : Données de poursuite (mode, uniqueOffensesCount).

#### `career_modules_playerDriving.onUpdate(dtReal, dtSim, dtRaw)`

Hook de frame : vide en pratique (« career police logic » non implémentée).

- `dtReal` (*number*) : Temps réel (s).
- `dtSim` (*number*) : Temps simulé (s).
- `dtRaw` (*number*) : Temps brut (s).

#### `career_modules_playerDriving.onVehicleParkingStatus(vehId, data)`

Hook de stationnement : met playerData.isParked à true (événement valid) ou false (exit) pour le véhicule joueur, hors mission et tutoriel.

- `vehId` (*integer*) : Id du véhicule.
- `data` (*table*) : Données d'événement (event).

#### `career_modules_playerDriving.onVehicleSwitched(oldId, newId)`

Hook : met à jour les données du joueur pour le nouveau véhicule (hors tutoriel et mission).

- `oldId` (*integer*) : Ancien véhicule.
- `newId` (*integer*) : Nouveau véhicule.

#### `career_modules_playerDriving.playerPursuitActive()`

Indique si le joueur est poursuivi par la police (pursuit.mode différent de 0).

- **renvoie** : boolean|nil true si poursuite en cours, faux ou nil sinon.

#### `career_modules_playerDriving.showPosition(pos)`

Oriente le joueur (mode marche) vers pos ; si un obstacle statique bloque la vue, joue un court trajet de caméra (5,5 s) qui montre la position puis revient à la caméra véhicule.

- `pos` (*vec3*) : Position à montrer.

#### `career_modules_playerDriving.teleportToGarage(garageId, veh, resetVeh)`

Téléporte le véhicule au garage, annule la navigation de mission, coupe le contact, gère une éventuelle remorque (téléportation différée, puis suppression après mise à jour des conditions de pièces) et vérifie le carburant minimal.

- `garageId` (*string*) : Identifiant du garage.
- `veh` (*userdata*) : Objet véhicule.
- `resetVeh` (*boolean|nil*) : Si vrai, réinitialise le véhicule à la téléportation.

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugMode` | boolean | not shipping_build : true hors build de distribution. ⚠ référence `not` non définie dans le fichier (vaut probablement nil) |
| `dependencies` | table<integer, string> | Extensions chargées avant : career_career. |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/playerDriving.lua`.*
