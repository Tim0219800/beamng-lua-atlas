---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/progress.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Suivi de progression et écran de dépôt (drop-off) de la livraison en carrière. Compte les livraisons par type (parcel, vehicle, trailer, fluid, dryBulk) globalement et par installation (deliveredFromHere / deliveredToHere), prépare les données de l'écran de dépôt (cargaisons des véhicules proches, tâches de véhicules), applique la confirmation (déplacement des cargaisons, récompenses, mise à jour des poids, sauvegarde auto) et envoie le résultat à l'UI. Gère aussi la visibilité et le déblocage des installations et des sons de progression.
--- Accès : extension `career_modules_delivery_progress` : `extensions.load("career_modules_delivery_progress")`, puis la globale `career_modules_delivery_progress`
---@class career_modules_delivery_progress
career_modules_delivery_progress = {}

--- Joue en boucle le son de progression 'money' ou 'progressBar' (sources audio créées à la demande) ; avec active=false, arrête tous ces sons.
---Source : lua/ge/extensions/career/modules/delivery/progress.lua:629
---@param soundLabel string 'money' ou 'progressBar'.
---@param active boolean true pour jouer, false pour tout arrêter.
function career_modules_delivery_progress.activateSound(soundLabel, active) end

--- Devait renvoyer les déblocages obtenus depuis aggregateBefore ; actuellement renvoie une table vide et oublie l'état mémorisé.
---Source : lua/ge/extensions/career/modules/delivery/progress.lua:107
---@return table  Table vide.
function career_modules_delivery_progress.aggregateAfter() end

--- Mémorise le niveau de chaque branche de carrière avant une livraison.
---Source : lua/ge/extensions/career/modules/delivery/progress.lua:98
function career_modules_delivery_progress.aggregateBefore() end

--- Termine le dépôt quand toutes les tâches de véhicules sont finies et la mise à jour des poids faite : somme les récompenses, les ajoute au joueur via career_modules_playerAttributes.addAttributes (tags gameplay, reward, delivery), prépare les infos de branches/réputation pour l'animation, envoie 'SetDeliveryDropOffRewardResult', joue un son, met à jour les statistiques, quitte le mode livraison si nécessaire et lance une sauvegarde auto si activée.
---Source : lua/ge/extensions/career/modules/delivery/progress.lua:366
function career_modules_delivery_progress.confirmDropOffCheckComplete() end

--- Applique le dépôt confirmé : scinde les cargaisons de matériaux si une quantité partielle est choisie, déplace les cargaisons vers la place, finalise les distances/récompenses de matériaux, calcule les récompenses, termine les tâches de véhicules, met à jour les poids des conteneurs (véhicules gelés le temps de la mise à jour) puis passe à confirmDropOffCheckComplete.
---Source : lua/ge/extensions/career/modules/delivery/progress.lua:300
---@param confirmedDropOffs table Table {confirmedCargoIds = {{id=, amount=?}}, confirmedOfferIds = {...}}.
---@param facId string Installation.
---@param psPath string Chemin de la place de parking.
function career_modules_delivery_progress.confirmDropOffData(confirmedDropOffs, facId, psPath) end

--- Compte les installations ayant au moins une livraison dans la direction donnée.
---Source : lua/ge/extensions/career/modules/delivery/progress.lua:599
---@param direction string 'deliveredFromHere' ou 'deliveredToHere' (clé de facility.progress).
---@return integer  Nombre d'installations.
function career_modules_delivery_progress.getFacilityCountForCargoCount(direction) end

--- Renvoie le multiplicateur de récompense de la branche 'logistics' (paramètres ignorés).
---Source : lua/ge/extensions/career/modules/delivery/progress.lua:612
---@param skill string Ignoré.
---@param tier integer Ignoré.
---@return number  Multiplicateur.
function career_modules_delivery_progress.getMoneyMultiplerForSkill(skill, tier) end

--- Renvoie la table de progression globale (cargoDeliveredByType).
---Source : lua/ge/extensions/career/modules/delivery/progress.lua:37
---@return table  Progression.
function career_modules_delivery_progress.getProgress() end

--- Indique si l'installation est débloquée (condition 'minItemCount' sur le nombre d'objets livrés ici).
---Source : lua/ge/extensions/career/modules/delivery/progress.lua:550
---@param facId string Identifiant de l'installation.
---@return boolean  true si débloquée.
---@return table|nil  Si verrouillée : disabledReasonHeader, disabledReasonContent et une barre de progression.
function career_modules_delivery_progress.isFacilityUnlocked(facId) end

--- Indique si l'installation est visible : pendant le tutoriel de livraison seules les installations isTutorialForCargoDelivery le sont, puis la condition visibleCondition 'minItemCount' est testée.
---Source : lua/ge/extensions/career/modules/delivery/progress.lua:574
---@param facId string Identifiant de l'installation.
---@param isCargoDeliveryTutorialActive boolean Tutoriel de livraison en cours.
---@return boolean  true si visible.
function career_modules_delivery_progress.isFacilityVisible(facId, isCargoDeliveryTutorialActive) end

--- Hook de niveau de branche atteint : pour la compétence delivery au-delà du palier 1, débloque la branche vehicleDelivery.
---Source : lua/ge/extensions/career/modules/delivery/progress.lua:617
---@param skill string Identifiant de la compétence.
---@param tier integer Palier atteint.
function career_modules_delivery_progress.onBranchTierReached(skill, tier) end

--- Hook appelé à l'activation de la carrière : mémorise les extensions de livraison utilisées et util_stepHandler.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/progress.lua:7
function career_modules_delivery_progress.onCareerActivated() end

--- Hook interne appelé après la livraison confirmée de cargaisons : met à jour les compteurs globaux, les statistiques des installations d'origine et de destination (compte par type et somme d'argent), les statistiques des modificateurs, puis émet onDeliveryFacilityProgressStatsChanged(affectedFacilities). Pour un matériau, la quantité comptée est cargo.slots, sinon 1.
---Source : lua/ge/extensions/career/modules/delivery/progress.lua:41
---@param cargoItems table|nil Liste des cargaisons livrées.
function career_modules_delivery_progress.onCargoDelivered(cargoItems) end

--- Même chose pour les livraisons de véhicules/remorques terminées (offres) ; émet onDeliveryFacilityProgressStatsChanged.
---Source : lua/ge/extensions/career/modules/delivery/progress.lua:77
---@param offers table|nil Liste d'éléments {offer=...}.
function career_modules_delivery_progress.onVehicleTasksFinished(offers) end

--- Appelée quand les données sont réunies (et que toutes les tâches de véhicules sont finies) : sépare dépôts automatiques et manuels (matériaux à quantité personnalisée). S'il y a des matériaux à choisir, ouvre l'écran via guihooks 'SetDeliveryDropOffCargoSelection' ; sinon confirme directement tout.
---Source : lua/ge/extensions/career/modules/delivery/progress.lua:199
function career_modules_delivery_progress.openDropOffScreenGatheringComplete() end

--- Démarre la préparation de l'écran de dépôt à une place d'installation : demande les conteneurs des véhicules proches, retient les cargaisons dont la destination (ou l'une des destinations possibles) est cette place, calcule leurs récompenses, ajoute les tâches de véhicules à terminer, puis appelle openDropOffScreenGatheringComplete.
---Source : lua/ge/extensions/career/modules/delivery/progress.lua:124
---@param facId string Identifiant de l'installation.
---@param psPath string Chemin de la place de parking de dépôt.
function career_modules_delivery_progress.requestDropOffData(facId, psPath) end

--- Remplace la table de progression (chargement de sauvegarde), ou la réinitialise (cargoDeliveredByType à zéro pour parcel, vehicle, trailer, fluid, dryBulk) si data est nil.
---Source : lua/ge/extensions/career/modules/delivery/progress.lua:33
---@param data table|nil Progression sauvegardée.
function career_modules_delivery_progress.setProgress(data) end

--- Appelée par l'UI à la fermeture du popup de déchargement : joue un son, affiche les popups d'introduction (cargoDelivered et « <clé>Unlocked » éventuels) et force la réévaluation du prompt de marqueur.
---Source : lua/ge/extensions/career/modules/delivery/progress.lua:537
function career_modules_delivery_progress.unloadCargoPopupClosed() end

--- Obsolète : affiche « No longer used! ».
---Source : lua/ge/extensions/career/modules/delivery/progress.lua:193
---@param cargoId integer Inutilisé.
---@param destination table Inutilisé.
function career_modules_delivery_progress.unloadMaterialsManualStart(cargoId, destination) end

