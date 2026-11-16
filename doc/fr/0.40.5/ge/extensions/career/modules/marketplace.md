# `career_modules_marketplace`

*Fichier : `lua/ge/extensions/career/modules/marketplace.lua` · VM : Game Engine (GE) · 1183 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_marketplace` : `extensions.load("career_modules_marketplace")`, puis la globale `career_modules_marketplace`

Place de marché de véhicules de la carrière, dans deux sens. (1) Le joueur met en vente des véhicules de son inventaire (listVehicles) ; des acheteurs virtuels génèrent des offres au fil du temps (offre de base = valeur de marché, avec bruit et plafonds selon le rapport prix demandé / valeur de marché), qui expirent après environ 500 s. Le joueur accepte, refuse ou négocie. (2) Le joueur négocie le prix d'un véhicule en vente chez un vendeur (concession ou particulier). Le moteur de négociation simule la patience, les contre-offres et les insultes d'une personnalité (fichier levels/west_coast_usa/facilities/negotiationPersonalities.json) et informe l'UI via guihooks negotiationData. Sauvegarde dans career/marketplace.json.

## Exemple

```lua
career_modules_marketplace.listVehicles({{inventoryId = 3}})
local listings = career_modules_marketplace.getListings()
```

## Remarques

- Nommage trompeur : startNegotiateBuyingOffer = le joueur VEND (offre d'un acheteur, amISelling = true) ; startNegotiateSellingOffer = le joueur ACHÈTE chez un vendeur (amISelling = false).
- Constantes : intervalle moyen entre offres 95 s (multiplié par offerTimeMultiplier selon le prix demandé : 1 entre 0,98 et 1,1 de la valeur de marché, jusqu'à 0,4 si moins cher, jusqu'à 4 si plus cher), durée de vie d'une offre 500 s ± 50 %, maximum de 10 offres expirées conservées par annonce.
- Une annonce est désactivée dans getListings si la valeur actuelle du véhicule tombe sous 95 % de sa valeur de marché à la mise en vente (valueLossLimit).
- Les offres sont arrondies au multiple de 50 le plus proche, minimum 50.
- Générer des offres s'exécute toutes les 10 s de temps de simulation dans onUpdate, sauf si la liste est vide ou si le menu d'offres est ouvert (les offres expirées sont alors purgées à l'ouverture/fermeture, via menuOpened).
- Dans la négociation, le statut passe par initial, thinking, typing puis accepted, refused, counterOffer, counterOfferLastChance ou failed. Un prix proposé n'est valide que s'il améliore la position de l'adversaire sans dépasser l'offre précédente du joueur (isOfferAllowed).
- Le champ negotiationState.opponentName appelle _tr(opponentPersonality.name) : plante si getNegotiationState est appelé sans négociation préalable (opponentPersonality nil).
- generatePersonality lit un fichier propre au niveau west_coast_usa ; renvoie nil si le fichier est absent. generateOffer(inventoryId) sans id choisit une annonce au hasard.
- Une fenêtre de debug ImGui (Negotiation Buying) est affichée hors build shipping pendant une négociation ; ses boutons ne font que couper negotiationActive.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_marketplace.acceptOffer(inventoryId, offerId)` | Accepte une offre : la retire de l'annonce et vend le véhicule à la valeur de l'offre (career_modules_inventory.sellVehicle). | 214 |
| `career_modules_marketplace.cancelNegotiation()` | Annule la négociation (statut failed) ; si le joueur avait déjà fait une offre, empêche de renégocier cette offre ou ce véhicule. | 506 |
| `career_modules_marketplace.declineOffer(inventoryId, offerId)` | Refuse (supprime) une offre de l'annonce. | 225 |
| `career_modules_marketplace.finalizeNegotiationExit()` | À la sortie de l'écran : prend l'offre si le statut est accepted et non prise, sinon annule la négociation. | 871 |
| `career_modules_marketplace.findVehicleListing(inventoryId)` | Cherche l'annonce d'un véhicule de l'inventaire. | 20 |
| `career_modules_marketplace.generateOffer(inventoryId)` | Crée une offre d'un acheteur aléatoire pour une annonce (celle donnée ou une annonce au hasard) : valeur = valeur de marché * multiplicateur * bruit, plafonnée selon le rapport de prix, arrondie à 50. | 171 |
| `career_modules_marketplace.generatePersonality(buyer, _archetypes)` | Tire au hasard un archétype de négociation (acheteur ou vendeur) dans negotiationPersonalities.json et construit la personnalité : nom, patience, seuils d'acceptation/insulte, multiplicateur de prix (1 - m pour un acheteur, 1 + m pour un vendeur), délais, citations. | 77 |
| `career_modules_marketplace.getListings()` | Renvoie une copie des annonces pour l'UI : nom traduit, annonce désactivée si la valeur a trop baissé, offres expirées marquées disabled, offres triées (actives d'abord, les plus récentes en premier). | 935 |
| `career_modules_marketplace.getNegotiationState()` | Renvoie l'état de la négociation pour l'UI : active, sens (amISelling), prix de départ, patience, offres (myOffer/theirOffer), statut, nom et citation de l'adversaire, véhicule (nom, miniature, kilométrage, valeur réelle) et historique d'offres. | 320 |
| `career_modules_marketplace.listVehicles(vehicles)` | Met en vente des véhicules (ignore les véhicules inconnus ou déjà en vente). Prix = entry.value ou valeur calculée ; fixe marketRatio et offerTimeMultiplier. | 28 |
| `career_modules_marketplace.makeNegotiationOffer(price)` | Propose un prix (converti avec tonumber) : s'il est valide, lance en tâche de fond la réponse de l'adversaire (réflexion puis saisie simulées, baisse de patience, acceptation, contre-offre, refus ou échec) et envoie les états à l'UI. | 849 |
| `career_modules_marketplace.menuOpened(open)` | Signale l'ouverture/fermeture du menu d'offres (la négociation compte comme menu ouvert) et met à jour les annonces : purge des offres expirées si ouvert, génération de nouvelles offres sinon. | 1007 |
| `career_modules_marketplace.onExtensionLoaded()` | Hook : charge marketplace.json si la carrière est active (renvoie false sinon). *(interne)* *(hook)* | 1024 |
| `career_modules_marketplace.onSaveCurrentProfile(currentSavePath, vehiclesThumbnailUpdate)` | Hook de sauvegarde : écrit listedVehicles dans <save>/career/marketplace.json. *(interne)* *(hook)* | 1018 |
| `career_modules_marketplace.onUpdate(dtReal, dtSim, dtRaw)` | Hook de frame : affiche la fenêtre de debug en négociation (hors shipping) et, toutes les 10 s de simulation, génère de nouvelles offres et fait expirer les anciennes. *(interne)* *(hook)* | 881 |
| `career_modules_marketplace.onVehicleRemoved(inventoryId)` | Hook : retire l'annonce d'un véhicule supprimé de l'inventaire. *(interne)* *(hook)* | 931 |
| `career_modules_marketplace.openMenu(computerId)` | Ouvre la boutique de véhicules en mode « marketplace » depuis l'ordinateur donné. | 1014 |
| `career_modules_marketplace.removeVehicleListing(inventoryId)` | Retire l'annonce du véhicule. | 69 |
| `career_modules_marketplace.startNegotiateBuyingOffer(inventoryId, offerId)` | Démarre une négociation où le joueur vend : initialise la personnalité de l'acheteur, la citation, les prix (le joueur demande listing.value, l'acheteur offre offer.value), l'historique, et navigue vers career.computer.vehicleShopping.negotiation. | 387 |
| `career_modules_marketplace.startNegotiateSellingOffer(_shopId)` | Démarre une négociation où le joueur achète un véhicule de la boutique. Refusée (toast d'avertissement) si le véhicule est en promotion ou non négociable. Initialise patience, prix de départ (remisé si discountPercentage) et navigue vers l'écran d'achat. | 439 |
| `career_modules_marketplace.takeTheirOffer()` | Accepte l'offre de l'adversaire. En vente : fixe la valeur de l'offre et vend le véhicule. En achat : fixe le prix du véhicule de la boutique (originalSellValue si baisse) et bloque d'autres négociations. | 853 |

### Détail des paramètres

#### `career_modules_marketplace.acceptOffer(inventoryId, offerId)`

Accepte une offre : la retire de l'annonce et vend le véhicule à la valeur de l'offre (career_modules_inventory.sellVehicle).

- `inventoryId` (*integer*) : Id d'inventaire.
- `offerId` (*integer*) : Id de l'offre.

#### `career_modules_marketplace.declineOffer(inventoryId, offerId)`

Refuse (supprime) une offre de l'annonce.

- `inventoryId` (*integer*) : Id d'inventaire.
- `offerId` (*integer*) : Id de l'offre.

#### `career_modules_marketplace.findVehicleListing(inventoryId)`

Cherche l'annonce d'un véhicule de l'inventaire.

- `inventoryId` (*integer*) : Id d'inventaire.
- **renvoie** : table|nil Annonce (id, value, marketValue, offers...).

#### `career_modules_marketplace.generateOffer(inventoryId)`

Crée une offre d'un acheteur aléatoire pour une annonce (celle donnée ou une annonce au hasard) : valeur = valeur de marché * multiplicateur * bruit, plafonnée selon le rapport de prix, arrondie à 50.

- `inventoryId` (*integer|nil*) : Id d'inventaire de l'annonce.
- **renvoie** : table Offre {id, timestamp, value, ttl, negotiationPossible, buyerPersonality}.

#### `career_modules_marketplace.generatePersonality(buyer, _archetypes)`

Tire au hasard un archétype de négociation (acheteur ou vendeur) dans negotiationPersonalities.json et construit la personnalité : nom, patience, seuils d'acceptation/insulte, multiplicateur de prix (1 - m pour un acheteur, 1 + m pour un vendeur), délais, citations.

- `buyer` (*boolean|nil*) : true pour un acheteur.
- `_archetypes` (*string[]|nil*) : Liste d'archétypes imposée (sinon randomBuyerArchetypes / randomSellerArchetypes).
- **renvoie** : table|nil Personnalité, nil si fichier absent ou liste vide.

#### `career_modules_marketplace.getListings()`

Renvoie une copie des annonces pour l'UI : nom traduit, annonce désactivée si la valeur a trop baissé, offres expirées marquées disabled, offres triées (actives d'abord, les plus récentes en premier).

- **renvoie** : table[] Annonces.

#### `career_modules_marketplace.getNegotiationState()`

Renvoie l'état de la négociation pour l'UI : active, sens (amISelling), prix de départ, patience, offres (myOffer/theirOffer), statut, nom et citation de l'adversaire, véhicule (nom, miniature, kilométrage, valeur réelle) et historique d'offres.

- **renvoie** : table État de négociation.

#### `career_modules_marketplace.listVehicles(vehicles)`

Met en vente des véhicules (ignore les véhicules inconnus ou déjà en vente). Prix = entry.value ou valeur calculée ; fixe marketRatio et offerTimeMultiplier.

- `vehicles` (*{inventoryId: integer, value: number|nil}[]*) : Véhicules à lister, avec prix demandé facultatif.

#### `career_modules_marketplace.makeNegotiationOffer(price)`

Propose un prix (converti avec tonumber) : s'il est valide, lance en tâche de fond la réponse de l'adversaire (réflexion puis saisie simulées, baisse de patience, acceptation, contre-offre, refus ou échec) et envoie les états à l'UI.

- `price` (*number|string*) : Prix proposé.
- **renvoie** : boolean false si le prix n'est pas autorisé.

#### `career_modules_marketplace.menuOpened(open)`

Signale l'ouverture/fermeture du menu d'offres (la négociation compte comme menu ouvert) et met à jour les annonces : purge des offres expirées si ouvert, génération de nouvelles offres sinon.

- `open` (*boolean*) : Menu ouvert ou non.

#### `career_modules_marketplace.onSaveCurrentProfile(currentSavePath, vehiclesThumbnailUpdate)`

Hook de sauvegarde : écrit listedVehicles dans <save>/career/marketplace.json.

- `currentSavePath` (*string*) : Dossier de sauvegarde.
- `vehiclesThumbnailUpdate` (*integer[]|nil*) : Non utilisé.

#### `career_modules_marketplace.onUpdate(dtReal, dtSim, dtRaw)`

Hook de frame : affiche la fenêtre de debug en négociation (hors shipping) et, toutes les 10 s de simulation, génère de nouvelles offres et fait expirer les anciennes.

- `dtReal` (*number*) : Temps réel (s).
- `dtSim` (*number*) : Temps simulé (s).
- `dtRaw` (*number*) : Temps brut (s).

#### `career_modules_marketplace.onVehicleRemoved(inventoryId)`

Hook : retire l'annonce d'un véhicule supprimé de l'inventaire.

- `inventoryId` (*integer*) : Id d'inventaire.

#### `career_modules_marketplace.openMenu(computerId)`

Ouvre la boutique de véhicules en mode « marketplace » depuis l'ordinateur donné.

- `computerId` (*string*) : Id de l'ordinateur.

#### `career_modules_marketplace.removeVehicleListing(inventoryId)`

Retire l'annonce du véhicule.

- `inventoryId` (*integer*) : Id d'inventaire.

#### `career_modules_marketplace.startNegotiateBuyingOffer(inventoryId, offerId)`

Démarre une négociation où le joueur vend : initialise la personnalité de l'acheteur, la citation, les prix (le joueur demande listing.value, l'acheteur offre offer.value), l'historique, et navigue vers career.computer.vehicleShopping.negotiation.

- `inventoryId` (*integer*) : Id d'inventaire du véhicule en vente.
- `offerId` (*integer*) : Id de l'offre de départ.
- **renvoie** : any Résultat de ui_router.navigate.

#### `career_modules_marketplace.startNegotiateSellingOffer(_shopId)`

Démarre une négociation où le joueur achète un véhicule de la boutique. Refusée (toast d'avertissement) si le véhicule est en promotion ou non négociable. Initialise patience, prix de départ (remisé si discountPercentage) et navigue vers l'écran d'achat.

- `_shopId` (*string|integer*) : Id du véhicule dans la boutique (career_modules_vehicleShopping).
- **renvoie** : any Résultat de ui_router.navigate, ou nil si refusée.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dealershipBuyerQuotes` | string[] | 25 clés de traduction de phrases d'acheteurs de concession (ui.career.negotiation.dealershipBuyerQuotes.01..25). |
| `firstNameCount` | integer | Nombre de prénoms (#firstNames). |
| `firstNames` | string[] | Liste de prénoms pour générer les noms d'acheteurs/vendeurs particuliers. |
| `initialCount` | integer | Nombre d'entrées de initials. |
| `initialProbabilities` | table<string, number> | Fréquence relative de chaque initiale (A-Z) pour les noms de famille. |
| `initials` | string[] | Liste d'initiales pondérée par initialProbabilities (math.ceil(p*100) copies chacune). |
| `privateSellerQuotes` | string[] | 50 clés de traduction de phrases de vendeurs particuliers (ui.career.negotiation.privateSellerQuotes.01..50). |

**Évènements UI (guihooks.trigger) :** `negotiationData`, `toastrMsg`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/marketplace.lua`.*
