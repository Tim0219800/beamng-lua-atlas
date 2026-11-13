# `career_modules_testDrive`

*Fichier : `lua/ge/extensions/career/modules/testDrive.lua` · VM : Game Engine (GE) · 364 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_testDrive` : `extensions.load("career_modules_testDrive")`, puis la globale `career_modules_testDrive`

Essai routier d'un véhicule chez un concessionnaire en carrière. start() fait monter le joueur dans le véhicule, crée un instantané des conditions de pièces (clé "beforeTestDrive"), désactive l'autosauvegarde et active l'essai. À chaque frame, onUpdate décompte le temps limite (timeLimit), vérifie que le joueur reste à moins de 10 m du véhicule (sinon abandon avec frais) et détecte les dégâts toutes les 2 s. stop() ramène le véhicule au point de départ avec un fondu et remet le joueur à pied.

## Exemple

```lua
career_modules_testDrive.start(vehId, {timeLimit = 120, abandonFees = 50, dealershipName = "x", route = "y"})
if career_modules_testDrive.isActive() then print(career_modules_testDrive.getTimeLeft()) end
```

## Remarques

- Champs de testDriveInfo utilisés dans le code : timeLimit (s), abandonFees, endParkingSpot, endParkingSpotCreated, dealershipName, route, dealershipPreview.
- Le temps limite est décompté en temps de simulation (dtSim). Quand il est écoulé, stop(false) est appelé (sans le hook onGameplayActivityAborted).
- abandonTestDrive : si abandonFees > 0, paie les frais (canBeNegative = true) ; les ventes privées n'ont pas de frais. Appelle ensuite career_modules_inspectVehicle.onTestDriveAbandoned().
- stop(userAborted) émet onGameplayActivityAborted sauf si userAborted == false ; il relance l'autosauvegarde et lance le job de fin (téléportation au point de départ, vitesse du temps 0.5 puis 1, navigation vers l'écran play, hook onTestDriveEndedAfterFade).
- Hooks émis : onTestDriveStarted (au démarrage), onTestDriveEndedAfterFade (fin).
- Le POI de fin d'essai (type testDriveEnd) est ajouté à la liste des POI bruts et une action « stopTestDrive » est ajoutée au menu radial (niveau /root/sandbox/career/) à la première ouverture.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_testDrive.abandonTestDrive()` | Abandonne l'essai (sans effet si inactif) : désactive l'essai, réactive l'autosauvegarde, puis après 0,2 s affiche et paie les frais d'abandon éventuels, réinitialise les données et prévient inspectVehicle. | 217 |
| `career_modules_testDrive.formatTestDriveToRawPoi(elements)` | Ajoute à elements le POI de fin d'essai (id testDrive-<concession>-<route>-parkingEnd, marqueur de parking et marqueur de grande carte) si un emplacement de fin existe et a été créé. | 279 |
| `career_modules_testDrive.getTimeLeft()` | Temps restant de l'essai en secondes (nil s'il n'y a pas d'essai ou pas de limite). | 266 |
| `career_modules_testDrive.isActive()` | Indique si un essai est en cours. | 270 |
| `career_modules_testDrive.isDamageDetected()` | Indique si des dégâts ont été détectés sur le véhicule pendant l'essai (détection par career_modules_insurance_insurance.genericVehNeedsRepair). | 274 |
| `career_modules_testDrive.onBeforeRadialOpened()` | Hook avant l'ouverture du menu radial : une seule fois, ajoute une entrée « arrêter l'essai » (visible seulement pendant un essai) au menu rapide. *(interne)* *(hook)* | 322 |
| `career_modules_testDrive.onCareerActive(active)` | Hook : réinitialise les données de l'essai à l'activation de la carrière. *(interne)* *(hook)* | 316 |
| `career_modules_testDrive.onGetRawPoiListForLevel(levelIdentifier, elements)` | Hook de la liste de POI : ajoute le POI de fin d'essai via formatTestDriveToRawPoi. *(interne)* *(hook)* | 294 |
| `career_modules_testDrive.onPoiDetailPromptOpening(elemData, promptData)` | Hook d'ouverture du détail d'un POI : si c'est le POI testDriveEnd, ajoute un bouton « arrêter l'essai » appelant stop(false). *(interne)* *(hook)* | 298 |
| `career_modules_testDrive.onUpdate(dtReal, dtSim, dtRaw)` | Hook de frame : si un essai est actif, gère le temps limite, l'éloignement du joueur et la détection de dégâts. *(interne)* *(hook)* | 252 |
| `career_modules_testDrive.onVehicleRepairedByInsurance(amount)` | Hook appelé après une réparation par l'assurance : affiche après 1,8 s le coût de la réparation (message temps réel et son d'achat). *(interne)* *(hook)* | 203 |
| `career_modules_testDrive.resetData()` | Désactive l'essai et vide les POI bruts. | 55 |
| `career_modules_testDrive.start(_vehicleId, testDriveInfo)` | Démarre l'essai : copie testDriveInfo, fait monter le joueur dans le véhicule, mémorise sa position/rotation de départ, crée et sélectionne l'instantané de pièces beforeTestDrive, dégèle le véhicule, émet onTestDriveStarted, vide les POI bruts et désactive l'autosauvegarde. | 111 |
| `career_modules_testDrive.stop(userAborted)` | Termine l'essai normalement (sans effet si inactif) : réactive l'autosauvegarde et lance le job de fin qui téléporte le véhicule au départ avec fondu. | 207 |

### Détail des paramètres

#### `career_modules_testDrive.formatTestDriveToRawPoi(elements)`

Ajoute à elements le POI de fin d'essai (id testDrive-<concession>-<route>-parkingEnd, marqueur de parking et marqueur de grande carte) si un emplacement de fin existe et a été créé.

- `elements` (*table[]*) : Liste de POI bruts à compléter.

#### `career_modules_testDrive.getTimeLeft()`

Temps restant de l'essai en secondes (nil s'il n'y a pas d'essai ou pas de limite).

- **renvoie** : number|nil Secondes restantes.

#### `career_modules_testDrive.isActive()`

Indique si un essai est en cours.

- **renvoie** : boolean|nil true si actif.

#### `career_modules_testDrive.isDamageDetected()`

Indique si des dégâts ont été détectés sur le véhicule pendant l'essai (détection par career_modules_insurance_insurance.genericVehNeedsRepair).

- **renvoie** : boolean true si dégâts détectés.

#### `career_modules_testDrive.onCareerActive(active)`

Hook : réinitialise les données de l'essai à l'activation de la carrière.

- `active` (*boolean*) : Rien si false.

#### `career_modules_testDrive.onGetRawPoiListForLevel(levelIdentifier, elements)`

Hook de la liste de POI : ajoute le POI de fin d'essai via formatTestDriveToRawPoi.

- `levelIdentifier` (*string*) : Niveau (non utilisé).
- `elements` (*table[]*) : Liste de POI à compléter.

#### `career_modules_testDrive.onPoiDetailPromptOpening(elemData, promptData)`

Hook d'ouverture du détail d'un POI : si c'est le POI testDriveEnd, ajoute un bouton « arrêter l'essai » appelant stop(false).

- `elemData` (*table[]*) : Éléments du POI.
- `promptData` (*table[]*) : Boutons à compléter.

#### `career_modules_testDrive.onUpdate(dtReal, dtSim, dtRaw)`

Hook de frame : si un essai est actif, gère le temps limite, l'éloignement du joueur et la détection de dégâts.

- `dtReal` (*number*) : Temps réel (s).
- `dtSim` (*number*) : Temps de simulation (s).
- `dtRaw` (*number*) : Temps brut (s).

#### `career_modules_testDrive.onVehicleRepairedByInsurance(amount)`

Hook appelé après une réparation par l'assurance : affiche après 1,8 s le coût de la réparation (message temps réel et son d'achat).

- `amount` (*number*) : Montant de la réparation.

#### `career_modules_testDrive.start(_vehicleId, testDriveInfo)`

Démarre l'essai : copie testDriveInfo, fait monter le joueur dans le véhicule, mémorise sa position/rotation de départ, crée et sélectionne l'instantané de pièces beforeTestDrive, dégèle le véhicule, émet onTestDriveStarted, vide les POI bruts et désactive l'autosauvegarde.

- `_vehicleId` (*integer*) : Id d'objet du véhicule d'essai.
- `testDriveInfo` (*table*) : Paramètres de l'essai (timeLimit, abandonFees, endParkingSpot, dealershipName, route...).

#### `career_modules_testDrive.stop(userAborted)`

Termine l'essai normalement (sans effet si inactif) : réactive l'autosauvegarde et lance le job de fin qui téléporte le véhicule au départ avec fondu.

- `userAborted` (*boolean|nil*) : Émet onGameplayActivityAborted sauf si false.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table | Table vide : aucune dépendance. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onGameplayActivityAborted`
- `onTestDriveEndedAfterFade` — écouté par 1 module(s)
- `onTestDriveStarted` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `Message`, `ScenarioRealtimeDisplay`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/testDrive.lua`.*
