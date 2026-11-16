# `career_modules_delivery_generator`

*Fichier : `lua/ge/extensions/career/modules/delivery/generator.lua` · VM : Game Engine (GE) · 1534 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_delivery_generator` : `extensions.load("career_modules_delivery_generator")`, puis la globale `career_modules_delivery_generator`

Générateur de contenu de la livraison en carrière. Au chargement (setup) il lit les gabarits de colis (*.deliveryParcels.json), de véhicules (*.deliveryVehicles.json) et de matériaux (*.deliveryMaterials.json) dans gameplay/delivery/, prépare les installations (freeroam_facilities de type deliveryProvider : places de parking, types logistiques fournis/reçus, stockages de matériaux, générateurs, progression), puis produit des colis, des offres de véhicules/remorques et fait évoluer les stocks de matériaux selon les intervalles des générateurs. Fournit aussi le calcul des distances et des récompenses initiales, et les opérations sur les matériaux (fractionnement, déplacement, stockage).

## Exemple

```lua
local fac = career_modules_delivery_generator.getFacilityById("someFacilityId")
local ps = career_modules_delivery_generator.getParkingSpotByPath(psPath)
local d = career_modules_delivery_generator.getDistanceBetweenFacilities(originLoc, destLoc) -- mètres par la route
```

## Remarques

- Types de générateurs : parcelProvider, parcelReceiver (colis), vehOfferProvider, trailerOfferProvider (offres de véhicules/remorques), materialProvider, materialReceiver (stock de matériaux).
- Un lieu (location) est une table {type='facilityParkingspot', facId, psPath} ; 'multi' contient plusieurs destinations possibles.
- Les générateurs ne tournent que lorsqu'une requête appelle triggerAllGenerators (par exemple les fonctions getAllCargo* du parcelManager) ; un drapeau limite l'appel à une fois par image (remis à faux par onUpdate).
- Distance mini d'une livraison : 150 m (minDeliveryDistance), mesurée par le réseau routier (map.getPath) plus les distances aux routes les plus proches ; 1 si une position n'a pas de route.
- Récompense d'un colis : money = (sqrt(slots)/4 + (km)^(1+sqrt(slots)/100) * (5 + poids^0.9)), multiplié par le bonus de livraison de l'organisation ; XP = base (2, +1 à 16, 32, 64 slots) + km arrondis.
- Bug : dans triggerParcelGenerator, pour les parcelProvider avec multiDestination, psPath est rempli par `s:getPath()` où `s` n'est pas défini : provoquerait une erreur Lua si ce mode est utilisé (il faudrait ap.psPath).
- Bug : setupMaterialStorage corrige un stock négatif par `storage.storedVlume = 0` (faute de frappe) ; la valeur négative n'est donc pas corrigée.
- Dans triggerVehicleOfferGenerator, si aucune installation de destination n'est trouvée, la fonction quitte tout (return) au lieu de passer à l'offre suivante.
- Si un générateur de type vehicleProvider est testé dans createGeneratorTemplateCache, le bloc est vide ; seul le code des colis remplit validTemplates.
- finalizeMaterialDistances ne fait rien dans cette version : tout le calcul est dans un bloc commenté.
- Le champ commenté M.getLogisticTypesLookup n'existe pas ; la ligne qui le référence dans la page automatique vient d'un commentaire de code.

**Dépendances (chargées avant) :** `freeroam_facilities`, `gameplay_sites_sitesManager`, `util_configListGenerator`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_delivery_generator.addMaterialAsParcelToContainer(con, storage, amount, sourceFacId, sourcePsPath)` | Crée une cargaison de matériau (merge=true, offre sans expiration, destinations 'multi' : installations qui reçoivent ce matériau) à partir du stock d'une installation, et planifie son déplacement transitoire vers le conteneur du véhicule. | 816 |
| `career_modules_delivery_generator.changeMaterialAmountInFacility(facId, materialType, change)` | Ajoute ou retire du volume au stock d'un matériau dans une installation, avec bornage à [0, capacité] et avertissement logué en cas de dépassement. | 957 |
| `career_modules_delivery_generator.distanceBetween(posA, posB)` | Distance par la route entre deux positions : somme des segments du chemin de la carte (map.getPath) plus la distance à la route la plus proche de chaque position. | 75 |
| `career_modules_delivery_generator.finalizeMaterialDistanceRewards(item, destination)` | Calcule l'XP d'une livraison de matériau selon la distance et le nombre de slots, l'inscrit dans rewards.logistics et rewards['logistics-materials'], ainsi que la réputation de l'organisation et le bonus d'argent. | 983 |
| `career_modules_delivery_generator.finalizeMaterialDistances(fac)` | Prévu pour calculer les fournisseurs/receveurs les plus proches d'une installation ; le corps est entièrement commenté, donc sans effet. | 713 |
| `career_modules_delivery_generator.finalizeParcelItemDistanceAndRewards(item)` | Calcule (une seule fois) la distance d'origine d'un colis, ses modificateurs (dParcelMods.generateModifiers) et ses récompenses : argent, XP logistique, XP de compétence (logistics-materials ou logistics-delivery, +10 pour les colis tutoriel) et réputation de l'organisation (avec bonus de livraison selon son niveau). | 142 |
| `career_modules_delivery_generator.finalizeVehicleOffer(offer)` | Complète une offre de véhicule : choisit un véhicule au hasard selon son filtre (modèle, config, kilométrage, nom) si absent, puis calcule distance et récompenses (baseReward + rewardPerKm, XP logistique, XP du type vehicle/trailer, réputation). | 470 |
| `career_modules_delivery_generator.getDistanceBetweenFacilities(loc1, loc2)` | Distance par la route (mise en cache par couple origine/destination) entre deux lieux. Si loc2 est 'multi', renvoie la médiane (haute) des distances vers chaque destination. | 105 |
| `career_modules_delivery_generator.getFacilities()` | Liste des installations de livraison, triées par nom traduit. | 1517 |
| `career_modules_delivery_generator.getFacilitiesForOrganizationId(orgId)` | Installations associées à une organisation. | 1520 |
| `career_modules_delivery_generator.getFacilityById(id)` | Cherche une installation par id. | 1518 |
| `career_modules_delivery_generator.getLocationCoordinates(loc)` | Position monde d'un lieu : place de parking pour 'facilityParkingspot', position du véhicule pour 'vehicle'. Autres types : affiche un message et renvoie nil. | 90 |
| `career_modules_delivery_generator.getMaterialsTemplatesById(id)` | Renvoie le gabarit d'un matériau (*.deliveryMaterials.json) : type (fluid/dryBulk), density, money, name… | 687 |
| `career_modules_delivery_generator.getParcelTemplateById(templateId)` | Renvoie le gabarit de colis chargé depuis les fichiers *.deliveryParcels.json. | 224 |
| `career_modules_delivery_generator.getParkingSpotByPath(path)` | Renvoie la place de parking (objet site) correspondant à un chemin d'identification. | 1519 |
| `career_modules_delivery_generator.isMixable(type)` | Indique si un type de cargaison peut être mélangé dans un même conteneur (parcel : oui, fluid et dryBulk : non). | 1084 |
| `career_modules_delivery_generator.moveMaterialToDestination(cargo, destination)` | Déplace une cargaison de matériau vers une installation. Si le stock ne peut pas tout accueillir, scinde : la partie qui rentre est déplacée, le reste reste dans le véhicule. | 920 |
| `career_modules_delivery_generator.onCareerActivated()` | Hook appelé à l'activation de la carrière : mémorise les références vers les autres extensions de livraison et util_stepHandler. *(interne)* *(hook)* | 10 |
| `career_modules_delivery_generator.onUpdate(dtReal, dtSim, dtRaw)` | Hook par image : réarme triggerAllGenerators pour l'image suivante. *(interne)* *(hook)* | 1033 |
| `career_modules_delivery_generator.selectAccessPointByLookupKeyByType(accessPointsByName, logisticType, typeLookupKey)` | Choisit au hasard un point d'accès parmi ceux qui gèrent un type logistique donné ; loggue une erreur et affiche la liste si aucun ne convient. | 56 |
| `career_modules_delivery_generator.setup(loadData)` | Initialise tout le système de livraison : charge les gabarits de matériaux, colis et véhicules, prépare les installations (setupFacilities), puis soit recharge les colis et offres sauvegardés (en jetant les cargaisons de matériaux temporaires 'addMaterialAsParcelToContainer'), soit génère un stock initial en simulant les générations passées (240 s de colis, 1000 s d'offres de véhicules). | 1458 |
| `career_modules_delivery_generator.splitOffPartsFromMaterialCargo(cargo, otherPartSizes)` | Scinde une cargaison de matériau : crée des copies de tailles données et réduit l'original d'autant (poids et argent recalculés). | 894 |
| `career_modules_delivery_generator.triggerAllGenerators()` | Déclenche tous les générateurs dont l'échéance est atteinte (nextGenerationTimestamp), au plus une fois par image. | 1020 |
| `career_modules_delivery_generator.triggerGenerator(fac, generator, timeOffset)` | Exécute une génération pour un générateur : colis (parcelProvider/parcelReceiver), offres de véhicules ou remorques, ou évolution du stock de matériau. | 1004 |

### Détail des paramètres

#### `career_modules_delivery_generator.addMaterialAsParcelToContainer(con, storage, amount, sourceFacId, sourcePsPath)`

Crée une cargaison de matériau (merge=true, offre sans expiration, destinations 'multi' : installations qui reçoivent ce matériau) à partir du stock d'une installation, et planifie son déplacement transitoire vers le conteneur du véhicule.

- `con` (*table*) : Conteneur de cargaison (avec location).
- `storage` (*table*) : Stockage de matériau de l'installation (materialType, id…).
- `amount` (*number*) : Quantité (slots).
- `sourceFacId` (*string*) : Installation d'origine.
- `sourcePsPath` (*string*) : Place de repli si aucun point d'accès fournisseur trouvé.

#### `career_modules_delivery_generator.changeMaterialAmountInFacility(facId, materialType, change)`

Ajoute ou retire du volume au stock d'un matériau dans une installation, avec bornage à [0, capacité] et avertissement logué en cas de dépassement.

- `facId` (*string*) : Identifiant de l'installation.
- `materialType` (*string*) : Identifiant du matériau.
- `change` (*number*) : Variation de volume (négative pour retirer).

#### `career_modules_delivery_generator.distanceBetween(posA, posB)`

Distance par la route entre deux positions : somme des segments du chemin de la carte (map.getPath) plus la distance à la route la plus proche de chaque position.

- `posA` (*vec3*) : Position de départ.
- `posB` (*vec3*) : Position d'arrivée.
- **renvoie** : number Distance en mètres (1 si l'une des positions n'a pas de route).

#### `career_modules_delivery_generator.finalizeMaterialDistanceRewards(item, destination)`

Calcule l'XP d'une livraison de matériau selon la distance et le nombre de slots, l'inscrit dans rewards.logistics et rewards['logistics-materials'], ainsi que la réputation de l'organisation et le bonus d'argent.

- `item` (*table*) : Cargaison de matériau.
- `destination` (*table*) : Lieu de dépôt.

#### `career_modules_delivery_generator.finalizeMaterialDistances(fac)`

Prévu pour calculer les fournisseurs/receveurs les plus proches d'une installation ; le corps est entièrement commenté, donc sans effet.

- `fac` (*table*) : Installation.

#### `career_modules_delivery_generator.finalizeParcelItemDistanceAndRewards(item)`

Calcule (une seule fois) la distance d'origine d'un colis, ses modificateurs (dParcelMods.generateModifiers) et ses récompenses : argent, XP logistique, XP de compétence (logistics-materials ou logistics-delivery, +10 pour les colis tutoriel) et réputation de l'organisation (avec bonus de livraison selon son niveau).

- `item` (*table*) : Cargaison (slots, weight, origin, destination, templateId, organization…).

#### `career_modules_delivery_generator.finalizeVehicleOffer(offer)`

Complète une offre de véhicule : choisit un véhicule au hasard selon son filtre (modèle, config, kilométrage, nom) si absent, puis calcule distance et récompenses (baseReward + rewardPerKm, XP logistique, XP du type vehicle/trailer, réputation).

- `offer` (*table*) : Offre (vehicle.filterId, locations, data.type, organization…).

#### `career_modules_delivery_generator.getDistanceBetweenFacilities(loc1, loc2)`

Distance par la route (mise en cache par couple origine/destination) entre deux lieux. Si loc2 est 'multi', renvoie la médiane (haute) des distances vers chaque destination.

- `loc1` (*table*) : Lieu de départ ('facilityParkingspot').
- `loc2` (*table*) : Lieu d'arrivée ('facilityParkingspot' ou 'multi').
- **renvoie** : number|nil Distance en mètres (nil pour un autre type de lieu).

#### `career_modules_delivery_generator.getFacilities()`

Liste des installations de livraison, triées par nom traduit.

- **renvoie** : table Liste d'installations.

#### `career_modules_delivery_generator.getFacilitiesForOrganizationId(orgId)`

Installations associées à une organisation.

- `orgId` (*string*) : Identifiant de l'organisation.
- **renvoie** : table Liste de {name, id}.

#### `career_modules_delivery_generator.getFacilityById(id)`

Cherche une installation par id.

- `id` (*string*) : Identifiant de l'installation.
- **renvoie** : table|nil Installation.

#### `career_modules_delivery_generator.getLocationCoordinates(loc)`

Position monde d'un lieu : place de parking pour 'facilityParkingspot', position du véhicule pour 'vehicle'. Autres types : affiche un message et renvoie nil.

- `loc` (*table*) : Lieu.
- **renvoie** : vec3|nil Position.

#### `career_modules_delivery_generator.getMaterialsTemplatesById(id)`

Renvoie le gabarit d'un matériau (*.deliveryMaterials.json) : type (fluid/dryBulk), density, money, name…

- `id` (*string*) : Identifiant du matériau.
- **renvoie** : table|nil Gabarit.

#### `career_modules_delivery_generator.getParcelTemplateById(templateId)`

Renvoie le gabarit de colis chargé depuis les fichiers *.deliveryParcels.json.

- `templateId` (*string|integer*) : Identifiant du gabarit.
- **renvoie** : table|nil Gabarit (names, slots, weight, modChance, offerDuration, isTutorialParcel…).

#### `career_modules_delivery_generator.getParkingSpotByPath(path)`

Renvoie la place de parking (objet site) correspondant à un chemin d'identification.

- `path` (*string*) : psPath (ps:getPath()).
- **renvoie** : table|nil Place de parking (pos, rot, name, customFields…).

#### `career_modules_delivery_generator.isMixable(type)`

Indique si un type de cargaison peut être mélangé dans un même conteneur (parcel : oui, fluid et dryBulk : non).

- `type` (*string*) : 'parcel', 'fluid' ou 'dryBulk'.
- **renvoie** : boolean|nil nil pour un type inconnu.

#### `career_modules_delivery_generator.moveMaterialToDestination(cargo, destination)`

Déplace une cargaison de matériau vers une installation. Si le stock ne peut pas tout accueillir, scinde : la partie qui rentre est déplacée, le reste reste dans le véhicule.

- `cargo` (*table*) : Cargaison de matériau.
- `destination` (*table*) : Lieu de destination (facId).
- **renvoie** : table Cargaison traitée (la copie déposée en cas de scission).
- **renvoie** : table|nil Cargaison restante (nil si tout déposé).

#### `career_modules_delivery_generator.onUpdate(dtReal, dtSim, dtRaw)`

Hook par image : réarme triggerAllGenerators pour l'image suivante.

- `dtReal` (*number*) : Delta temps réel (s), inutilisé.
- `dtSim` (*number*) : Delta temps simulation (s), inutilisé.
- `dtRaw` (*number*) : Delta temps brut (s), inutilisé.

#### `career_modules_delivery_generator.selectAccessPointByLookupKeyByType(accessPointsByName, logisticType, typeLookupKey)`

Choisit au hasard un point d'accès parmi ceux qui gèrent un type logistique donné ; loggue une erreur et affiche la liste si aucun ne convient.

- `accessPointsByName` (*table<string, table>*) : Points d'accès d'une installation.
- `logisticType` (*string*) : Type logistique recherché.
- `typeLookupKey` (*string*) : 'logisticTypesProvidedLookup' ou 'logisticTypesReceivedLookup'.
- **renvoie** : table|nil Point d'accès (ps, psPath, facId…).

#### `career_modules_delivery_generator.setup(loadData)`

Initialise tout le système de livraison : charge les gabarits de matériaux, colis et véhicules, prépare les installations (setupFacilities), puis soit recharge les colis et offres sauvegardés (en jetant les cargaisons de matériaux temporaires 'addMaterialAsParcelToContainer'), soit génère un stock initial en simulant les générations passées (240 s de colis, 1000 s d'offres de véhicules).

- `loadData` (*table*) : Données de sauvegarde : facilities (progress, materialStorages, logisticGenerators), parcels, vehicleOffers, general.maxGroupId.

#### `career_modules_delivery_generator.splitOffPartsFromMaterialCargo(cargo, otherPartSizes)`

Scinde une cargaison de matériau : crée des copies de tailles données et réduit l'original d'autant (poids et argent recalculés).

- `cargo` (*table*) : Cargaison de matériau.
- `otherPartSizes` (*table<integer, number>|nil*) : Tailles (slots) des parties à détacher.
- **renvoie** : table Liste : cargaison d'origine puis copies détachées.

#### `career_modules_delivery_generator.triggerGenerator(fac, generator, timeOffset)`

Exécute une génération pour un générateur : colis (parcelProvider/parcelReceiver), offres de véhicules ou remorques, ou évolution du stock de matériau.

- `fac` (*table*) : Installation.
- `generator` (*table*) : Générateur (type, min, max, interval, logisticTypes…).
- `timeOffset` (*number|nil*) : Décalage de temps (négatif pour simuler une génération passée) ; 0 par défaut.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : freeroam_facilities, gameplay_sites_sitesManager, util_configListGenerator. |

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/delivery/generator.lua`.*
