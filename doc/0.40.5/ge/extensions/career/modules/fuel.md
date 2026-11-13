# `career_modules_fuel`

*Fichier : `lua/ge/extensions/career/modules/fuel.lua` · VM : Game Engine (GE) · 665 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_fuel` : `extensions.load("career_modules_fuel")`, puis la globale `career_modules_fuel`

Transaction de ravitaillement du mode carrière à une station-service. startTransaction ouvre l'écran career.refueling, lit les réservoirs du véhicule du joueur (energyStorage), puis onUpdate fait monter l'énergie des réservoirs actifs au débit choisi, calcule le prix (prix de la station par unité, remise d'assurance éventuelle) et envoie les données à l'UI (initialFuelingData, updateFuelData). payPrice débite l'argent (ou rien pour un véhicule de travail, payé par l'entreprise), uiCancelTransaction restaure les niveaux de départ.

## Remarques

- Unités internes en joules ; l'UI reçoit des litres (gasoline, diesel, kerosine), des kg (n2o) ou des kWh (electricEnergy) via les facteurs MJ par unité : gasoline 31.125, diesel 36.112, kerosine 34.4, n2o 8.3, electricEnergy 3.6.
- Débit maximal 50 000 000 J/s (maxFuelFlowRate) multiplié par le facteur de onChangeFlowRate ; l'électrique charge à un tiers de ce débit.
- Seuls les réservoirs dont le type est connu et proposé par la station (freeroam_facilities_fuelPrice.getFuelPrice non nil) sont affichés, sauf si debugIgnoreStationFuelTypeRestriction est vrai.
- Le ravitaillement ne démarre que si le véhicule roule à moins de 1 m/s ; si la vitesse dépasse 2 m/s pendant la transaction, onUpdate annule la transaction.
- Un véhicule d'inventaire avec loanType == 'work' ne paie pas (message « paidByCompany »).
- minimumRefuelingCheck : électrique = recharge complète ; liquide <= 1 % = remis à 5 % ; message d'urgence affiché. Utile après une panne sèche.
- Hooks émis : onRefuelingStartTransaction, onRefuelingStopFueling(tank), onRefuelingEndTransaction, onPaidRefuelling(price).
- payPrice débloque le succès VEHICLE_REFUELLED deux fois (avant et après endTransaction) ; sans conséquence, mais redondant. Dans payPrice, le hook onPaidRefuelling reçoit overallPrice déjà remis à 0 par endTransaction.
- En build non shipping, onUpdate affiche une fenêtre ImGui de debug « Fueling » avec boutons Start/Stop/Pay.

**Dépendances (chargées avant) :** `career_career`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_fuel.getFuelData()` | Renvoie la liste des réservoirs retenus pour la transaction (energyType, name, currentEnergy, maxEnergy en joules). | 211 |
| `career_modules_fuel.getFuelingData()` | Renvoie, par réservoir, l'énergie ajoutée (fueledEnergy, joules) et le prix (price) de la transaction en cours. | 372 |
| `career_modules_fuel.isCurrentlyFueling()` | Indique si au moins un réservoir est en train d'être rempli. | 473 |
| `career_modules_fuel.minimumRefuelingCheck(vehId)` | Évite la panne sèche totale : pour chaque réservoir du véhicule, recharge à fond l'électrique, ou remet un réservoir quasi vide (<= 1 %) à 5 %, avec un message d'urgence. | 617 |
| `career_modules_fuel.onCareerActive(active)` | Hook appelé quand la carrière devient active ou inactive : crée les sources audio (essence et électrique) si actif. *(interne)* *(hook)* | 632 |
| `career_modules_fuel.onChangeFlowRate(factor, tankIndex)` | Hook/action d'entrée (gâchette de la pompe) : règle le débit en fraction 0 à 1 du maximum et démarre le remplissage du réservoir ; un facteur 0 l'arrête et remet le débit au maximum. *(hook)* | 349 |
| `career_modules_fuel.onClientEndMission(levelPath)` | Hook de fin de niveau : oublie les identifiants des sons de ravitaillement. *(interne)* *(hook)* | 637 |
| `career_modules_fuel.onUpdate(dtReal, dtSim)` | Hook par image : annule la transaction si le véhicule bouge à plus de 2 m/s, fait avancer les réservoirs actifs (énergie, prix arrondi au centime), arrête un réservoir plein, envoie les données à l'UI toutes les 0,1 s, ajuste le son de pompe, et affiche la fenêtre ImGui de debug hors build shipping. *(interne)* *(hook)* | 496 |
| `career_modules_fuel.payPrice()` | Paye le total (ne fait rien si le prix est nul ou si le joueur n'a pas assez d'argent), arrête le remplissage, enregistre la dépense (career_modules_playerAttributes, statistique career/fuel/paidPrice.money), termine la transaction et émet onPaidRefuelling. | 402 |
| `career_modules_fuel.requestRefuelingTransactionData()` | Demande au véhicule du joueur ses réservoirs (energyStorage) ; à la réponse, filtre les réservoirs, prépare les données et envoie initialFuelingData à l'UI. | 198 |
| `career_modules_fuel.sendUpdateDataToUI()` | Envoie à l'UI (guihook 'updateFuelData') énergie actuelle, énergie ajoutée, prix, état actif par réservoir, prix total, possibilité de payer (canPay) et débit relatif. | 147 |
| `career_modules_fuel.startTransaction(_gasStation)` | Démarre une transaction pour le véhicule actuel de l'inventaire à la station donnée : active l'action map 'Refueling', coupe le contact (setIgnitionLevel 0), ouvre l'écran career.refueling et émet onRefuelingStartTransaction. Ne fait rien sans véhicule actuel d'inventaire. | 202 |
| `career_modules_fuel.uiButtonStartFueling(energyType)` | Appelé par l'UI : commence à remplir tous les réservoirs d'un type d'énergie. | 437 |
| `career_modules_fuel.uiButtonStartFuelingTank(index)` | Appelé par l'UI : sélectionne puis commence à remplir un réservoir précis. | 445 |
| `career_modules_fuel.uiButtonStopFueling(energyType)` | Appelé par l'UI : arrête le remplissage des réservoirs d'un type (tous si nil) et applique les niveaux au véhicule. | 441 |
| `career_modules_fuel.uiButtonStopFuelingTank(index)` | Appelé par l'UI : arrête le remplissage d'un réservoir précis. | 455 |
| `career_modules_fuel.uiCancelTransaction()` | Annule la transaction : restaure les niveaux d'énergie de départ sur le véhicule, sans payer, et termine la transaction (retour à l'écran 'play', sauvegarde auto ou mise à jour des conditions de pièces). | 464 |
| `career_modules_fuel.uiSetSelectedTankIndex(index)` | Appelé par l'UI : change le réservoir sélectionné (ignoré pendant un remplissage ou si l'indice est invalide). | 429 |

### Détail des paramètres

#### `career_modules_fuel.getFuelData()`

Renvoie la liste des réservoirs retenus pour la transaction (energyType, name, currentEnergy, maxEnergy en joules).

- **renvoie** : table|nil Liste de réservoirs, nil hors transaction.

#### `career_modules_fuel.getFuelingData()`

Renvoie, par réservoir, l'énergie ajoutée (fueledEnergy, joules) et le prix (price) de la transaction en cours.

- **renvoie** : table Liste de {price, fueledEnergy}.

#### `career_modules_fuel.isCurrentlyFueling()`

Indique si au moins un réservoir est en train d'être rempli.

- **renvoie** : boolean true si un remplissage est actif.

#### `career_modules_fuel.minimumRefuelingCheck(vehId)`

Évite la panne sèche totale : pour chaque réservoir du véhicule, recharge à fond l'électrique, ou remet un réservoir quasi vide (<= 1 %) à 5 %, avec un message d'urgence.

- `vehId` (*integer|nil*) : Véhicule ; par défaut le véhicule actuel de l'inventaire.

#### `career_modules_fuel.onCareerActive(active)`

Hook appelé quand la carrière devient active ou inactive : crée les sources audio (essence et électrique) si actif.

- `active` (*boolean*) : true à l'activation.

#### `career_modules_fuel.onChangeFlowRate(factor, tankIndex)`

Hook/action d'entrée (gâchette de la pompe) : règle le débit en fraction 0 à 1 du maximum et démarre le remplissage du réservoir ; un facteur 0 l'arrête et remet le débit au maximum.

- `factor` (*number*) : Fraction du débit maximal, bornée à [0, 1].
- `tankIndex` (*integer|nil*) : Réservoir visé ; par défaut le réservoir sélectionné.

#### `career_modules_fuel.onClientEndMission(levelPath)`

Hook de fin de niveau : oublie les identifiants des sons de ravitaillement.

- `levelPath` (*string*) : Chemin du niveau.

#### `career_modules_fuel.onUpdate(dtReal, dtSim)`

Hook par image : annule la transaction si le véhicule bouge à plus de 2 m/s, fait avancer les réservoirs actifs (énergie, prix arrondi au centime), arrête un réservoir plein, envoie les données à l'UI toutes les 0,1 s, ajuste le son de pompe, et affiche la fenêtre ImGui de debug hors build shipping.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps de simulation (s).

#### `career_modules_fuel.startTransaction(_gasStation)`

Démarre une transaction pour le véhicule actuel de l'inventaire à la station donnée : active l'action map 'Refueling', coupe le contact (setIgnitionLevel 0), ouvre l'écran career.refueling et émet onRefuelingStartTransaction. Ne fait rien sans véhicule actuel d'inventaire.

- `_gasStation` (*table*) : Station-service ; doit contenir facility (id, name).

#### `career_modules_fuel.uiButtonStartFueling(energyType)`

Appelé par l'UI : commence à remplir tous les réservoirs d'un type d'énergie.

- `energyType` (*string*) : gasoline, diesel, kerosine, n2o ou electricEnergy.

#### `career_modules_fuel.uiButtonStartFuelingTank(index)`

Appelé par l'UI : sélectionne puis commence à remplir un réservoir précis.

- `index` (*integer*) : Indice (à partir de 1) dans la liste des réservoirs.

#### `career_modules_fuel.uiButtonStopFueling(energyType)`

Appelé par l'UI : arrête le remplissage des réservoirs d'un type (tous si nil) et applique les niveaux au véhicule.

- `energyType` (*string|nil*) : Type d'énergie.

#### `career_modules_fuel.uiButtonStopFuelingTank(index)`

Appelé par l'UI : arrête le remplissage d'un réservoir précis.

- `index` (*integer*) : Indice du réservoir.

#### `career_modules_fuel.uiSetSelectedTankIndex(index)`

Appelé par l'UI : change le réservoir sélectionné (ignoré pendant un remplissage ou si l'indice est invalide).

- `index` (*integer*) : Indice du réservoir.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : career_career. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onPaidRefuelling`
- `onRefuelingEndTransaction`
- `onRefuelingStartTransaction`
- `onRefuelingStopFueling`

**Évènements UI (guihooks.trigger) :** `initialFuelingData`, `updateFuelData`

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/fuel.lua`.*
