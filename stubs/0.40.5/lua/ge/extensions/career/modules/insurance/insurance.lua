---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/insurance/insurance.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Système d'assurance et de réparation de véhicules du mode carrière. Il charge les définitions de gameplay/insurance (fournisseurs, classes, options de couverture, perks, paliers de score de conducteur), enregistre pour chaque véhicule d'inventaire (invVehs) son assurance et ses options, suit la distance parcourue pour renouveler la police tous les 100 km, accorder des gestes commerciaux (réparation gratuite) et faire monter le score de conducteur, calcule les primes (valeur du véhicule x taux de classe x options x remise de groupe x multiplicateur du palier de score), traite les réclamations et les réparations (instantanées ou différées, franchise, assistance routière) et alimente l'UI (guihooks insurancesData, chooseInsuranceData).
--- Accès : extension `career_modules_insurance_insurance` : `extensions.load("career_modules_insurance_insurance")`, puis la globale `career_modules_insurance_insurance`
---@class career_modules_insurance_insurance
---@field dependencies table<integer, string> Extensions chargées avant : career_career, payment, playerAttributes, insurance_history, tether, etc.
career_modules_insurance_insurance = {}

--- Raccourci vers career_modules_insurance_history.addToPlHistory.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:2035
---@param data table Entrée d'historique.
function career_modules_insurance_insurance.addToPlHistory(data) end

--- Prix à payer pour ajouter un véhicule à un assureur : prime totale si c'est le premier, sinon prime du véhicule au prorata de la distance restante avant renouvellement.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1143
---@param insuranceId integer Assureur.
---@param vehValue number Valeur du véhicule.
---@return number  Montant.
function career_modules_insurance_insurance.calculateAddVehiclePrice(insuranceId, vehValue) end

--- Prime totale d'un assureur : somme des primes de ses véhicules plus options à portée de l'assureur, puis totalPriceWithDriverScore (x multiplicateur du palier de score).
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1064
---@param insuranceId integer Assureur.
---@param potentialCoverageOptions table|nil Options hypothétiques (une table vide est ignorée).
---@param potentialVehiclesCoverageOptions table|nil Options hypothétiques par véhicule, indexées par id en chaîne.
---@param potentialNewVehValue number|nil Valeur d'un véhicule supplémentaire à inclure.
---@return table  {items, totalPrice, totalPriceWithDriverScore, groupDiscountSavings}.
function career_modules_insurance_insurance.calculateInsurancePremium(insuranceId, potentialCoverageOptions, potentialVehiclesCoverageOptions, potentialNewVehValue) end

--- Prime d'un véhicule : valeur x coverageRate de la classe x produit des influences des options x (1 - remise de groupe). Fournir invVehId (véhicule possédé) ou nonInvVehInfo ({vehValue, insuranceId}).
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1013
---@param invVehId integer|nil Véhicule d'inventaire.
---@param nonInvVehInfo table|nil Véhicule hypothétique {vehValue, insuranceId}.
---@param potentialCoverageOptions table|nil Options hypothétiques à la place des options actuelles.
---@return table  {cost, costWithoutGroupDiscount}.
function career_modules_insurance_insurance.calculateVehiclePremium(invVehId, nonInvVehInfo, potentialCoverageOptions) end

--- Changement d'assurance déclenché par le joueur : refusé si le véhicule a besoin de réparation ; calcule le coût net (remboursement moins pénalité moins prix d'ajout), applique le nouvel assureur, paie ou reçoit la différence, journalise et débloque le succès POLICY_REVIEW.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1551
---@param invVehId integer Identifiant d'inventaire.
---@param newInsuranceId integer Nouvel assureur ; -1 ou moins pour aucune assurance.
function career_modules_insurance_insurance.changeInvVehInsurance(invVehId, newInsuranceId) end

--- Ancienne voie de modification des options de couverture d'un véhicule : enregistre l'historique et fait payer les frais de dossier (voir bug dans notes).
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1642
---@param invVehId integer Identifiant d'inventaire.
---@param changedCoverageOptions table Options modifiées (nom -> valeur).
function career_modules_insurance_insurance.changeInvVehInsuranceCoverageOptions(invVehId, changedCoverageOptions) end

--- Ferme le menu des assurances (retour à l'ordinateur ou fermeture de tous les menus). Avec sauvegarde auto, peut attendre la fin de la sauvegarde.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1670
---@param _closeMenuAfterSaving boolean|nil Attendre onVehicleSaveFinished avant de fermer.
function career_modules_insurance_insurance.closeMenu(_closeMenuAfterSaving) end

--- Indique si l'identifiant correspond à un assureur défini.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1953
---@param insuranceId integer Identifiant.
---@return boolean  true si défini.
function career_modules_insurance_insurance.doesInsuranceExist(insuranceId) end

--- Paie pour accéder immédiatement à un véhicule en réparation différée (supprime timeToAccess et delayReason).
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1803
---@param inventoryId integer Identifiant d'inventaire.
---@param price number Prix à payer.
function career_modules_insurance_insurance.expediteRepair(inventoryId, price) end

--- Construit la table d'icône de perk pour l'UI.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:958
---@param smallText string Texte court.
---@param tooltipText string Info-bulle.
---@param discount number|nil Remise liée.
---@param isSignaturePerk boolean Perk phare de l'assureur.
---@return table  {smallText, tooltipText, discount, isSignaturePerk}.
function career_modules_insurance_insurance.formatPerkIconData(smallText, tooltipText, discount, isSignaturePerk) end

--- Demande au véhicule (objet) ses conditions de pièces et appelle callback(needsRepair) à la réponse ; sert aux véhicules hors inventaire (par exemple d'essai).
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:655
---@param vehId integer Identifiant d'objet véhicule.
---@param callback function fonction(needsRepair: boolean).
function career_modules_insurance_insurance.genericVehNeedsRepair(vehId, callback) end

--- Nombre d'indulgences d'accident restantes chez un assureur.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1961
---@param insuranceId integer Assureur.
---@return integer  Nombre (0 si inconnu).
function career_modules_insurance_insurance.getAccidentForgivenessCount(insuranceId) end

--- Usage interne : franchise de réparation du véhicule (valeur de l'option deductible).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:805
---@param invVehId integer Identifiant d'inventaire.
---@return number|nil  Franchise.
function career_modules_insurance_insurance.getActualRepairPrice(invVehId) end

--- Assureur par défaut d'une classe : celui de plus petit id.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1889
---@param insuranceClassId string Identifiant de classe.
---@return table|nil  Données d'assureur.
function career_modules_insurance_insurance.getDefaultInsuranceForClassId(insuranceClassId) end

--- Score de conducteur actuel (0 à 100).
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:562
---@return number  Score.
function career_modules_insurance_insurance.getDriverScore() end

--- Coût pour remettre le score à la valeur par défaut (64) : 0 si le score est déjà au moins égal, sinon 500 + proportion x 19500, arrondi.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1738
---@return integer  Montant.
function career_modules_insurance_insurance.getDriverScoreResetCost() end

--- Palier de score (min, max, multiplicateur de prime…) pour un score ; le dernier palier si aucun ne correspond.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:552
---@param score number|nil Score ; défaut : le score actuel.
---@return table  Données de palier.
function career_modules_insurance_insurance.getDriverScoreTierData(score) end

--- Détermine la classe d'assurance requise pour une annonce selon la classe JSON, la valeur, la population, la carrosserie et la classe commerciale (la priorité la plus haute l'emporte).
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:923
---@param data table Annonce de boutique (Value, Population, BodyStyle, aggregates, 'Commercial Class').
---@return table|nil  Données de classe.
function career_modules_insurance_insurance.getInsuranceClassFromVehicleShoppingData(data) end

--- Définition d'un assureur chargée depuis les fichiers du jeu.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1930
---@param insuranceId integer Assureur.
---@return table|nil  Définition.
function career_modules_insurance_insurance.getInsuranceDataById(insuranceId) end

--- Nom de l'assureur, ou le libellé « pas d'assurance » si inconnu.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1957
---@param insuranceId integer Identifiant.
---@return string  Nom.
function career_modules_insurance_insurance.getInsuranceName(insuranceId) end

--- Données de remise carburant d'un véhicule (hasFuelDiscount, fuelDiscount fraction, nom de l'assureur, icône de perk) ; utilisé par le module fuel.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1907
---@param invVehId integer Identifiant d'inventaire.
---@return table  {hasFuelDiscount, fuelDiscount, perkData, insuranceName?}.
function career_modules_insurance_insurance.getInvVehFuelDiscountData(invVehId) end

--- Délai de réparation inclus dans la police du véhicule (secondes ; 0 = instantané).
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1782
---@param vehInvId integer Identifiant d'inventaire.
---@return number|nil  Secondes.
function career_modules_insurance_insurance.getInvVehRepairTime(vehInvId) end

--- Table des entrées d'assurance des véhicules d'inventaire (insuranceId, name, id, initialValue, requiredInsuranceClass, insuranceData).
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1965
---@return table<integer, table>  invVehs (référence).
function career_modules_insurance_insurance.getInvVehs() end

--- Valeur d'un perk d'un assureur.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1876
---@param insuranceId integer Assureur.
---@param perkId string Perk (reduceDeductible, fuelDiscount, instantRepair…).
---@return number|boolean|nil  Valeur ou nil.
function career_modules_insurance_insurance.getPerkValueByInsuranceId(insuranceId, perkId) end

--- Valeur d'un perk de l'assureur d'un véhicule.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1883
---@param invVehId integer Identifiant d'inventaire.
---@param perkId string Perk.
---@return number|boolean|nil  Valeur ou nil.
function career_modules_insurance_insurance.getPerkValueByInvVehId(invVehId, perkId) end

--- Valeur de l'option de couverture actuellement choisie pour un véhicule (ex. deductible, repairTime, paintRepair, roadsideAssistance). Ne renvoie rien si le véhicule n'est pas assuré.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:116
---@param invVehId integer Identifiant d'inventaire.
---@param coverageOptionName string Nom de l'option.
---@return number|boolean|nil  Valeur du choix.
function career_modules_insurance_insurance.getPlCoverageOptionValue(invVehId, coverageOptionName) end

--- Raccourci vers career_modules_insurance_history.getPlHistory.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1996
---@return table  Historique.
function career_modules_insurance_insurance.getPlHistory() end

--- Résumé du joueur pour l'UI : score et palier, distances (totale, assurée, non assurée), nombre de réparations, coût de remise à zéro du score, bilan financier (primes, franchises, réparations privées, dégâts couverts).
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1333
---@return table  Données de synthèse.
function career_modules_insurance_insurance.getPlayerAbstractData() end

--- Données sauvegardées par assureur (metersDriven, accidentForgiveness, roadsideAssistance, loyalty, coverageOptionsData…).
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1786
---@return table  plInsurancesData (référence).
function career_modules_insurance_insurance.getPlayerInsurancesData() end

--- Supplément pour une réparation rapide (1000).
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1790
---@return number  Montant.
function career_modules_insurance_insurance.getQuickRepairExtraPrice() end

--- Kilomètres restants avant le renouvellement de l'assureur (0 pour -1 ou assureur inconnu).
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1127
---@param insuranceId integer Assureur.
---@return integer  Kilomètres (arrondi supérieur).
function career_modules_insurance_insurance.getRenewsIn(insuranceId) end

--- Montant facturé en cas de dégâts pendant un essai de véhicule (500).
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1872
---@return number  Montant.
function career_modules_insurance_insurance.getTestDriveClaimPrice() end

--- Infos d'assurance d'un véhicule : assuré ou non, définition de l'assureur et classe requise.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1794
---@param vehInvId integer Identifiant d'inventaire.
---@return table|nil  {isInsured, insuranceInfo, insuranceClass}.
function career_modules_insurance_insurance.getVehInsuranceInfo(vehInvId) end

--- Indique si un véhicule d'inventaire a des pièces à réparer (partConditions).
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:374
---@param vehInvId integer Identifiant d'inventaire.
---@return boolean|nil  nil si le véhicule n'existe pas.
function career_modules_insurance_insurance.inventoryVehNeedsRepair(vehInvId) end

--- Indique s'il reste des remorquages gratuits d'assistance routière pour l'assureur du véhicule.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1853
---@param invVehId integer Identifiant d'inventaire.
---@return boolean  true s'il en reste.
function career_modules_insurance_insurance.isRoadSideAssistanceFree(invVehId) end

--- Enregistre une réclamation de réparation : consomme une indulgence d'accident ou baisse le score de 1, ajoute l'historique (argent, bons, score, franchise, valeur des dégâts), émet onInsuranceRepairClaim et débloque le succès CLAIM_FILED. Sans effet si le véhicule n'est pas assuré.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:462
---@param invVehId integer Identifiant d'inventaire.
---@param costs table Coûts (nombres ou {money, vouchers}) et éventuellement deductible.
---@param vehInfo table|nil Véhicule, pour estimer le prix des dégâts.
function career_modules_insurance_insurance.makeRepairClaim(invVehId, costs, vehInfo) end

--- Facture les dégâts d'un essai (500), affiche un message et ajoute une entrée 'testDriveClaim' à l'historique (voir notes : nom de véhicule codé en dur).
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:441
---@param vehId integer|nil Ignoré.
function career_modules_insurance_insurance.makeTestDriveDamageClaim(vehId) end

--- Callback de réparation avant mission : rouvre le menu de missions carrière et envoie l'état de dégâts du véhicule à l'UI.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:566
---@param vehInfo table Véhicule d'inventaire.
function career_modules_insurance_insurance.missionStartRepairCallback(vehInfo) end

--- Hook appelé quand la carrière devient active : charge les données d'assurance (fichiers du jeu et sauvegarde insurance.json).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:949
---@param active boolean true à l'activation.
function career_modules_insurance_insurance.onCareerActive(active) end

--- Hook de l'ordinateur du garage : ajoute la fonction « Assurances » (désactivée avant l'achat du véhicule de départ).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1721
---@param menuData table Données du menu (computerFacility, hasBoughtStarterVehicle).
---@param computerFunctions table Fonctions à compléter.
function career_modules_insurance_insurance.onComputerAddFunctions(menuData, computerFunctions) end

--- Hook après entrée dans un véhicule : reprend une réparation différée mise en attente (voir bug dans notes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:936
---@param invVehId integer Identifiant d'inventaire (non utilisé).
function career_modules_insurance_insurance.onEnterVehicleFinished(invVehId) end

--- Hook : l'écran des assurances est quitté ; cesse l'envoi de mises à jour à l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1717
function career_modules_insurance_insurance.onExitInsurancesComputerScreen() end

--- Hook de fermeture de menu : retire la laisse (tether).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1713
function career_modules_insurance_insurance.onMenuClosed() end

--- Hook de sauvegarde : écrit career/insurance.json (score, distances, plInsurancesData, invVehs, historique).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:954
---@param currentSavePath string Dossier du profil de sauvegarde.
function career_modules_insurance_insurance.onSaveCurrentProfile(currentSavePath) end

--- Hook par image : hors mission au premier plan et hors marche à pied, cumule la distance, vérifie renouvellement, gestes et hausse du score de conducteur du véhicule assuré actif ; décompte aussi les minuteries d'édition de couverture.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:864
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulation (s).
---@param dtRaw number Delta temps brut (s).
function career_modules_insurance_insurance.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook : un véhicule entre dans l'inventaire. Crée son entrée invVehs (valeur initiale, classe d'assurance requise selon valeur, population, carrosserie, classe commerciale) et applique l'assurance choisie à l'achat (ou -1).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1590
---@param data table {inventoryId, vehicleInfo, purchaseData = {insuranceId}}.
function career_modules_insurance_insurance.onVehicleAddedToInventory(data) end

--- Hook : un véhicule est retiré de l'inventaire ; supprime son entrée d'assurance.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1508
---@param invVehId integer Identifiant d'inventaire.
function career_modules_insurance_insurance.onVehicleRemoved(invVehId) end

--- Hook de fin de sauvegarde de véhicule : referme le menu si sa fermeture attendait la sauvegarde.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1683
function career_modules_insurance_insurance.onVehicleSaveFinished() end

--- Hook de changement de véhicule contrôlé : met à jour l'assurance active.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:945
function career_modules_insurance_insurance.onVehicleSwitched() end

--- Navigue vers l'écran de choix d'assurance : 'purchase' (achat en boutique) ou 'change' (changement depuis l'ordinateur).
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1940
---@param mode string 'purchase' ou 'change'.
---@param params table Paramètres de route (achat : purchaseType, shopId, insuranceId? ; changement : vehicleId).
---@return table  Résultat de navigation, ou {result=false, success=false, reason='unknown_mode'}.
function career_modules_insurance_insurance.openChooseInsuranceScreen(mode, params) end

--- Ouvre le menu des assurances depuis un ordinateur (laisse de 7 m) et émet onComputerInsurance. Ne fait rien sans identifiant d'ordinateur.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1691
---@param _originComputerId string Identifiant de l'ordinateur du garage.
function career_modules_insurance_insurance.openMenu(_originComputerId) end

--- Remet les pièces cassées à neuf dans data.partConditions (intégrité 1, repeinture ou apprêt selon paintRepair, compteur de réparations des pièces d'inventaire, réservoirs d'énergie conservés).
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:380
---@param data table {partConditions, paintRepair?, inventoryId?}.
function career_modules_insurance_insurance.repairPartConditions(data) end

--- Paie le coût de remise à zéro et rétablit le score par défaut, avec entrée d'historique et mise à jour de l'UI.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1754
---@return boolean  true si réussi ; false si coût nul ou fonds insuffisants.
function career_modules_insurance_insurance.resetDriverScore() end

--- Fonction de debug de carrière : recharge les données d'assurance en réinitialisant certaines données (loadInsurancesData(true)).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:2051
function career_modules_insurance_insurance.resetPlPolicyData() end

--- Prépare une option de couverture pour l'UI : clé, nom, choix, type de choix, texte de perk, ordre d'affichage et identifiant de la valeur actuelle.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:716
---@param insuranceId integer Assureur.
---@param coverageOptionId string Nom de l'option.
---@param invVehId integer|nil Véhicule (requis pour les options par véhicule).
---@return table|nil  Données d'option.
function career_modules_insurance_insurance.sanitizeCoverageOption(insuranceId, coverageOptionId, invVehId) end

--- Enregistre les options de couverture propres à l'assureur (franchise, assistance routière…) contre les frais de dossier (paperworkFees) ; recharge l'assistance routière si elle change.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1813
---@param insuranceId integer Assureur.
---@param newCoverageOptions table<string, integer> Nom de l'option -> identifiant du choix.
function career_modules_insurance_insurance.saveNewInsuranceCoverageOptions(insuranceId, newCoverageOptions) end

--- Enregistre les options de couverture propres à un véhicule contre les frais de dossier de son assureur.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1835
---@param vehicleId integer Identifiant d'inventaire.
---@param newCoverageOptions table<string, integer> Nom de l'option -> identifiant du choix.
function career_modules_insurance_insurance.saveNewVehicleCoverageOptions(vehicleId, newCoverageOptions) end

--- Envoie 'chooseInsuranceData' pour le changement d'assurance d'un véhicule déjà possédé (coût net de changement, remboursement).
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1425
---@param invVehId integer Identifiant d'inventaire.
function career_modules_insurance_insurance.sendChangeInsuranceDataToTheUI(invVehId) end

--- Envoie 'chooseInsuranceData' pour l'achat d'un véhicule en boutique : cartes des assureurs de la bonne classe (prime d'ajout, remise de groupe) plus la carte « sans assurance ».
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1441
---@param purchaseType string Type d'achat transmis à l'UI.
---@param vehShopId string|integer Identifiant de l'annonce.
---@param defaultInsuranceId integer|nil Assureur présélectionné.
function career_modules_insurance_insurance.sendChooseInsuranceDataToTheUI(purchaseType, vehShopId, defaultInsuranceId) end

--- Envoie à l'UI (guihook 'insurancesData') l'historique, le score, les véhicules non assurés, les tuiles de véhicules et toutes les classes avec leurs assureurs.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1454
function career_modules_insurance_insurance.sendUIData() end

--- Fixe le score de conducteur sans aucune vérification (outils/debug).
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1949
---@param score number Nouveau score.
function career_modules_insurance_insurance.setDriverScore(score) end

--- Répare un véhicule d'inventaire : paie le coût, enregistre une réclamation (isInsuranceRepair) ou une réparation privée, répare les pièces, puis lance une réparation différée (repairTime > 0) ou instantanée.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:587
---@param vehInvId integer|nil Véhicule ; défaut : véhicule actuel.
---@param repairOptionData table|nil {cost, isInsuranceRepair, repairTime}.
---@param callback function|nil Appelé après une réparation instantanée avec vehInfo.
function career_modules_insurance_insurance.startRepair(vehInvId, repairOptionData, callback) end

--- Réparation depuis le garage : émet onRepairInGarage puis startRepair ; pour une réparation instantanée, téléporte le véhicule au garage le plus proche.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:644
---@param invVehId integer Identifiant d'inventaire.
---@param repairOptionData table {cost, isInsuranceRepair, repairTime}.
---@return any  Valeur de startRepair (nil).
function career_modules_insurance_insurance.startRepairInGarage(invVehId, repairOptionData) end

--- Réparation instantanée : joue un son, respawn le véhicule s'il est présent, puis marque le véhicule modifié, recharge le carburant minimum et sauvegarde.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:571
---@param vehInfo table Véhicule d'inventaire.
---@param callback function|nil Appelé après le respawn.
---@param skipSound boolean|nil Ne pas jouer le son.
function career_modules_insurance_insurance.startRepairInstant(vehInfo, callback, skipSound) end

--- Recharge le nombre de remorquages gratuits selon l'option roadsideAssistance choisie (au renouvellement ou à la modification).
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1847
---@param insuranceId integer Assureur.
function career_modules_insurance_insurance.topUpRoadsideAssistance(insuranceId) end

--- Consomme un remorquage gratuit de l'assureur du véhicule.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1861
---@param invVehId integer Identifiant d'inventaire.
function career_modules_insurance_insurance.useRoadsideAssistance(invVehId) end

