# `career_modules_delivery_progress`

*Fichier : `lua/ge/extensions/career/modules/delivery/progress.lua` · VM : Game Engine (GE) · 651 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_delivery_progress` : `extensions.load("career_modules_delivery_progress")`, puis la globale `career_modules_delivery_progress`

Suivi de progression et écran de dépôt (drop-off) de la livraison en carrière. Compte les livraisons par type (parcel, vehicle, trailer, fluid, dryBulk) globalement et par installation (deliveredFromHere / deliveredToHere), prépare les données de l'écran de dépôt (cargaisons des véhicules proches, tâches de véhicules), applique la confirmation (déplacement des cargaisons, récompenses, mise à jour des poids, sauvegarde auto) et envoie le résultat à l'UI. Gère aussi la visibilité et le déblocage des installations et des sons de progression.

## Remarques

- Flux de dépôt : requestDropOffData -> (asynchrone, getNearbyVehicleCargoContainers) -> openDropOffScreenGatheringComplete -> soit écran de sélection de matériaux (SetDeliveryDropOffCargoSelection), soit confirmDropOffData directement -> confirmDropOffCheckComplete -> SetDeliveryDropOffRewardResult.
- requestDropOffData et confirmDropOffData utilisent des variables d'état locales (dropOffDataStatus, confirmedDropOffData) : un second appel pendant qu'un premier est en cours logue un avertissement ; confirmDropOffData abandonne alors sans rien faire.
- aggregateAfter est un squelette : le calcul des déblocages est commenté (« TODO: reimplement ») ; renvoie toujours une table vide.
- isFacilityVisible lit fac.unlockCondition.target dans la branche visibleCondition 'minItemCount' (et non visibleCondition.target) : plante si unlockCondition est nil.
- isFacilityUnlocked ne gère que unlockCondition.type == 'minItemCount' ; le type 'branchLevel' est vide, donc débloqué par défaut. Les textes de raison sont en anglais, non traduits.
- getMoneyMultiplerForSkill ignore ses paramètres et renvoie le multiplicateur de la branche 'logistics'.
- unloadMaterialsManualStart est obsolète (affiche « No longer used! »).
- Dans confirmDropOffCheckComplete, la boucle `for key, _ in ipairs(branchInfo)` porte sur une table à clés chaînes : elle ne s'exécute jamais (code mort pour aggregateChange).
- onBranchTierReached est défini localement et exporté en fin de fichier : si skill == 'delivery' et tier > 1, débloque la branche vehicleDelivery.
- onVehicleTasksFinished incrémente progress.cargoDeliveredByType[offer.data.type] sans valeur par défaut : plante si le type n'est pas dans la table (types attendus : vehicle, trailer).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_delivery_progress.activateSound(soundLabel, active)` | Joue en boucle le son de progression 'money' ou 'progressBar' (sources audio créées à la demande) ; avec active=false, arrête tous ces sons. | 629 |
| `career_modules_delivery_progress.aggregateAfter()` | Devait renvoyer les déblocages obtenus depuis aggregateBefore ; actuellement renvoie une table vide et oublie l'état mémorisé. | 107 |
| `career_modules_delivery_progress.aggregateBefore()` | Mémorise le niveau de chaque branche de carrière avant une livraison. | 98 |
| `career_modules_delivery_progress.confirmDropOffCheckComplete()` | Termine le dépôt quand toutes les tâches de véhicules sont finies et la mise à jour des poids faite : somme les récompenses, les ajoute au joueur via career_modules_playerAttributes.addAttributes (tags gameplay, reward, delivery), prépare les infos de branches/réputation pour l'animation, envoie 'SetDeliveryDropOffRewardResult', joue un son, met à jour les statistiques, quitte le mode livraison si nécessaire et lance une sauvegarde auto si activée. | 366 |
| `career_modules_delivery_progress.confirmDropOffData(confirmedDropOffs, facId, psPath)` | Applique le dépôt confirmé : scinde les cargaisons de matériaux si une quantité partielle est choisie, déplace les cargaisons vers la place, finalise les distances/récompenses de matériaux, calcule les récompenses, termine les tâches de véhicules, met à jour les poids des conteneurs (véhicules gelés le temps de la mise à jour) puis passe à confirmDropOffCheckComplete. | 300 |
| `career_modules_delivery_progress.getFacilityCountForCargoCount(direction)` | Compte les installations ayant au moins une livraison dans la direction donnée. | 599 |
| `career_modules_delivery_progress.getMoneyMultiplerForSkill(skill, tier)` | Renvoie le multiplicateur de récompense de la branche 'logistics' (paramètres ignorés). | 612 |
| `career_modules_delivery_progress.getProgress()` | Renvoie la table de progression globale (cargoDeliveredByType). | 37 |
| `career_modules_delivery_progress.isFacilityUnlocked(facId)` | Indique si l'installation est débloquée (condition 'minItemCount' sur le nombre d'objets livrés ici). | 550 |
| `career_modules_delivery_progress.isFacilityVisible(facId, isCargoDeliveryTutorialActive)` | Indique si l'installation est visible : pendant le tutoriel de livraison seules les installations isTutorialForCargoDelivery le sont, puis la condition visibleCondition 'minItemCount' est testée. | 574 |
| `career_modules_delivery_progress.onBranchTierReached(skill, tier)` | Hook de niveau de branche atteint : pour la compétence delivery au-delà du palier 1, débloque la branche vehicleDelivery. *(hook)* | 617 |
| `career_modules_delivery_progress.onCareerActivated()` | Hook appelé à l'activation de la carrière : mémorise les extensions de livraison utilisées et util_stepHandler. *(interne)* *(hook)* | 7 |
| `career_modules_delivery_progress.onCargoDelivered(cargoItems)` | Hook interne appelé après la livraison confirmée de cargaisons : met à jour les compteurs globaux, les statistiques des installations d'origine et de destination (compte par type et somme d'argent), les statistiques des modificateurs, puis émet onDeliveryFacilityProgressStatsChanged(affectedFacilities). Pour un matériau, la quantité comptée est cargo.slots, sinon 1. *(hook)* | 41 |
| `career_modules_delivery_progress.onVehicleTasksFinished(offers)` | Même chose pour les livraisons de véhicules/remorques terminées (offres) ; émet onDeliveryFacilityProgressStatsChanged. *(hook)* | 77 |
| `career_modules_delivery_progress.openDropOffScreenGatheringComplete()` | Appelée quand les données sont réunies (et que toutes les tâches de véhicules sont finies) : sépare dépôts automatiques et manuels (matériaux à quantité personnalisée). S'il y a des matériaux à choisir, ouvre l'écran via guihooks 'SetDeliveryDropOffCargoSelection' ; sinon confirme directement tout. | 199 |
| `career_modules_delivery_progress.requestDropOffData(facId, psPath)` | Démarre la préparation de l'écran de dépôt à une place d'installation : demande les conteneurs des véhicules proches, retient les cargaisons dont la destination (ou l'une des destinations possibles) est cette place, calcule leurs récompenses, ajoute les tâches de véhicules à terminer, puis appelle openDropOffScreenGatheringComplete. | 124 |
| `career_modules_delivery_progress.setProgress(data)` | Remplace la table de progression (chargement de sauvegarde), ou la réinitialise (cargoDeliveredByType à zéro pour parcel, vehicle, trailer, fluid, dryBulk) si data est nil. | 33 |
| `career_modules_delivery_progress.unloadCargoPopupClosed()` | Appelée par l'UI à la fermeture du popup de déchargement : joue un son, affiche les popups d'introduction (cargoDelivered et « <clé>Unlocked » éventuels) et force la réévaluation du prompt de marqueur. | 537 |
| `career_modules_delivery_progress.unloadMaterialsManualStart(cargoId, destination)` | Obsolète : affiche « No longer used! ». | 193 |

### Détail des paramètres

#### `career_modules_delivery_progress.activateSound(soundLabel, active)`

Joue en boucle le son de progression 'money' ou 'progressBar' (sources audio créées à la demande) ; avec active=false, arrête tous ces sons.

- `soundLabel` (*string*) : 'money' ou 'progressBar'.
- `active` (*boolean*) : true pour jouer, false pour tout arrêter.

#### `career_modules_delivery_progress.aggregateAfter()`

Devait renvoyer les déblocages obtenus depuis aggregateBefore ; actuellement renvoie une table vide et oublie l'état mémorisé.

- **renvoie** : table Table vide.

#### `career_modules_delivery_progress.confirmDropOffData(confirmedDropOffs, facId, psPath)`

Applique le dépôt confirmé : scinde les cargaisons de matériaux si une quantité partielle est choisie, déplace les cargaisons vers la place, finalise les distances/récompenses de matériaux, calcule les récompenses, termine les tâches de véhicules, met à jour les poids des conteneurs (véhicules gelés le temps de la mise à jour) puis passe à confirmDropOffCheckComplete.

- `confirmedDropOffs` (*table*) : Table {confirmedCargoIds = {{id=, amount=?}}, confirmedOfferIds = {...}}.
- `facId` (*string*) : Installation.
- `psPath` (*string*) : Chemin de la place de parking.

#### `career_modules_delivery_progress.getFacilityCountForCargoCount(direction)`

Compte les installations ayant au moins une livraison dans la direction donnée.

- `direction` (*string*) : 'deliveredFromHere' ou 'deliveredToHere' (clé de facility.progress).
- **renvoie** : integer Nombre d'installations.

#### `career_modules_delivery_progress.getMoneyMultiplerForSkill(skill, tier)`

Renvoie le multiplicateur de récompense de la branche 'logistics' (paramètres ignorés).

- `skill` (*string*) : Ignoré.
- `tier` (*integer*) : Ignoré.
- **renvoie** : number Multiplicateur.

#### `career_modules_delivery_progress.getProgress()`

Renvoie la table de progression globale (cargoDeliveredByType).

- **renvoie** : table Progression.

#### `career_modules_delivery_progress.isFacilityUnlocked(facId)`

Indique si l'installation est débloquée (condition 'minItemCount' sur le nombre d'objets livrés ici).

- `facId` (*string*) : Identifiant de l'installation.
- **renvoie** : boolean true si débloquée.
- **renvoie** : table|nil Si verrouillée : disabledReasonHeader, disabledReasonContent et une barre de progression.

#### `career_modules_delivery_progress.isFacilityVisible(facId, isCargoDeliveryTutorialActive)`

Indique si l'installation est visible : pendant le tutoriel de livraison seules les installations isTutorialForCargoDelivery le sont, puis la condition visibleCondition 'minItemCount' est testée.

- `facId` (*string*) : Identifiant de l'installation.
- `isCargoDeliveryTutorialActive` (*boolean*) : Tutoriel de livraison en cours.
- **renvoie** : boolean true si visible.

#### `career_modules_delivery_progress.onBranchTierReached(skill, tier)`

Hook de niveau de branche atteint : pour la compétence delivery au-delà du palier 1, débloque la branche vehicleDelivery.

- `skill` (*string*) : Identifiant de la compétence.
- `tier` (*integer*) : Palier atteint.

#### `career_modules_delivery_progress.onCargoDelivered(cargoItems)`

Hook interne appelé après la livraison confirmée de cargaisons : met à jour les compteurs globaux, les statistiques des installations d'origine et de destination (compte par type et somme d'argent), les statistiques des modificateurs, puis émet onDeliveryFacilityProgressStatsChanged(affectedFacilities). Pour un matériau, la quantité comptée est cargo.slots, sinon 1.

- `cargoItems` (*table|nil*) : Liste des cargaisons livrées.

#### `career_modules_delivery_progress.onVehicleTasksFinished(offers)`

Même chose pour les livraisons de véhicules/remorques terminées (offres) ; émet onDeliveryFacilityProgressStatsChanged.

- `offers` (*table|nil*) : Liste d'éléments {offer=...}.

#### `career_modules_delivery_progress.requestDropOffData(facId, psPath)`

Démarre la préparation de l'écran de dépôt à une place d'installation : demande les conteneurs des véhicules proches, retient les cargaisons dont la destination (ou l'une des destinations possibles) est cette place, calcule leurs récompenses, ajoute les tâches de véhicules à terminer, puis appelle openDropOffScreenGatheringComplete.

- `facId` (*string*) : Identifiant de l'installation.
- `psPath` (*string*) : Chemin de la place de parking de dépôt.

#### `career_modules_delivery_progress.setProgress(data)`

Remplace la table de progression (chargement de sauvegarde), ou la réinitialise (cargoDeliveredByType à zéro pour parcel, vehicle, trailer, fluid, dryBulk) si data est nil.

- `data` (*table|nil*) : Progression sauvegardée.

#### `career_modules_delivery_progress.unloadMaterialsManualStart(cargoId, destination)`

Obsolète : affiche « No longer used! ».

- `cargoId` (*integer*) : Inutilisé.
- `destination` (*table*) : Inutilisé.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onDeliveryFacilityProgressStatsChanged` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `SetDeliveryDropOffCargoSelection`, `SetDeliveryDropOffRewardResult`

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/delivery/progress.lua`.*
