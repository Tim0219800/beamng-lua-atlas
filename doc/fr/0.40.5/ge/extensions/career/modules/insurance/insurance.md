# `career_modules_insurance_insurance`

*Fichier : `lua/ge/extensions/career/modules/insurance/insurance.lua` · VM : Game Engine (GE) · 2056 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_insurance_insurance` : `extensions.load("career_modules_insurance_insurance")`, puis la globale `career_modules_insurance_insurance`

Système d'assurance et de réparation de véhicules du mode carrière. Il charge les définitions de gameplay/insurance (fournisseurs, classes, options de couverture, perks, paliers de score de conducteur), enregistre pour chaque véhicule d'inventaire (invVehs) son assurance et ses options, suit la distance parcourue pour renouveler la police tous les 100 km, accorder des gestes commerciaux (réparation gratuite) et faire monter le score de conducteur, calcule les primes (valeur du véhicule x taux de classe x options x remise de groupe x multiplicateur du palier de score), traite les réclamations et les réparations (instantanées ou différées, franchise, assistance routière) et alimente l'UI (guihooks insurancesData, chooseInsuranceData).

## Exemple

```lua
local ins = career_modules_insurance_insurance
local premium = ins.calculateInsurancePremium(insuranceId).totalPriceWithDriverScore
local needs = ins.inventoryVehNeedsRepair(inventoryId)
ins.startRepair(inventoryId, {isInsuranceRepair = true, cost = {money = 300}, repairTime = 0})
```

## Remarques

- Constantes : renouvellement tous les 100 000 m de conduite assurée ; score de conducteur de 0 à 100 (64 par défaut dans defaultDriverScore, 65 à la toute première initialisation) ; -1 par réclamation (sauf indulgence d'accident) ; +2 tous les 50 000 m sans réclamation ; au plus 5 indulgences d'accident ; délai de 600 s entre modifications de couverture ; pénalité de résiliation anticipée 25 % ; supplément de réparation rapide 1000 ; réclamation d'essai de véhicule 500.
- Remise de groupe selon la valeur totale des véhicules assurés chez le même assureur (plus d'un véhicule) : 10 % (< 50 000), 15 %, 20 %, 25 %, 30 % (>= 500 000).
- Les options de couverture sont soit à portée de l'assureur (isInsuranceWide, stockées dans plInsurancesData), soit par véhicule (stockées dans invVehs[id].insuranceData). Un insuranceId de -1 signifie non assuré.
- Les perks de fournisseur modifient les options au chargement : reduceDeductible (franchise réduite), freeRepaintDuringRepair, freeTowing, repairTimeDiscount, instantRepair, accidentForgivenessAtRenewal, fuelDiscount (utilisé par le module fuel).
- Bug : onEnterVehicleFinished lit startRepairVehInfo.vehId alors que startRepairDelayed stocke inventoryId : l'indice est nil et la réparation différée après avoir quitté le véhicule n'aboutit pas comme prévu.
- Bug : changeInvVehInsuranceCoverageOptions lit plInsurancesData[...].coverageOptions[...] (champ inexistant, la structure réelle est coverageOptionsData.currentCoverageOptions) : la fonction ne semble pas utilisable telle quelle ; l'UI passe par saveNewInsuranceCoverageOptions et saveNewVehicleCoverageOptions.
- makeTestDriveDamageClaim met toujours vehName = 'ibishu n' (valeur codée en dur) dans l'historique, et ignore son paramètre vehId.
- renewActiveInsurance journalise concernedInsuranceName avec activeInsuranceId et non avec insuranceId passé en paramètre (identiques en pratique : appelée avec activeInsuranceId).
- getTotalInsuranceVehsValue est défini deux fois dans le fichier (même code) ; sans conséquence.
- onVehicleRemoved est exporté sous ce nom mais la fonction locale s'appelle onVehicleRemovedFromInventory.
- loadInsurancesData lit saveInfo.version même si savePath est nil : prudence si la sauvegarde n'existe pas.

**Dépendances (chargées avant) :** `career_career`, `career_modules_payment`, `career_modules_playerAttributes`, `career_modules_insurance_history`, `career_modules_tether`, `career_modules_log`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_insurance_insurance.addToPlHistory(data)` | Raccourci vers career_modules_insurance_history.addToPlHistory. | 2035 |
| `career_modules_insurance_insurance.calculateAddVehiclePrice(insuranceId, vehValue)` | Prix à payer pour ajouter un véhicule à un assureur : prime totale si c'est le premier, sinon prime du véhicule au prorata de la distance restante avant renouvellement. | 1143 |
| `career_modules_insurance_insurance.calculateInsurancePremium(insuranceId, potentialCoverageOptions, potentialVehiclesCoverageOptions, potentialNewVehValue)` | Prime totale d'un assureur : somme des primes de ses véhicules plus options à portée de l'assureur, puis totalPriceWithDriverScore (x multiplicateur du palier de score). | 1064 |
| `career_modules_insurance_insurance.calculateVehiclePremium(invVehId, nonInvVehInfo, potentialCoverageOptions)` | Prime d'un véhicule : valeur x coverageRate de la classe x produit des influences des options x (1 - remise de groupe). Fournir invVehId (véhicule possédé) ou nonInvVehInfo ({vehValue, insuranceId}). | 1013 |
| `career_modules_insurance_insurance.changeInvVehInsurance(invVehId, newInsuranceId)` | Changement d'assurance déclenché par le joueur : refusé si le véhicule a besoin de réparation ; calcule le coût net (remboursement moins pénalité moins prix d'ajout), applique le nouvel assureur, paie ou reçoit la différence, journalise et débloque le succès POLICY_REVIEW. | 1551 |
| `career_modules_insurance_insurance.changeInvVehInsuranceCoverageOptions(invVehId, changedCoverageOptions)` | Ancienne voie de modification des options de couverture d'un véhicule : enregistre l'historique et fait payer les frais de dossier (voir bug dans notes). | 1642 |
| `career_modules_insurance_insurance.closeMenu(_closeMenuAfterSaving)` | Ferme le menu des assurances (retour à l'ordinateur ou fermeture de tous les menus). Avec sauvegarde auto, peut attendre la fin de la sauvegarde. | 1670 |
| `career_modules_insurance_insurance.doesInsuranceExist(insuranceId)` | Indique si l'identifiant correspond à un assureur défini. | 1953 |
| `career_modules_insurance_insurance.expediteRepair(inventoryId, price)` | Paie pour accéder immédiatement à un véhicule en réparation différée (supprime timeToAccess et delayReason). | 1803 |
| `career_modules_insurance_insurance.formatPerkIconData(smallText, tooltipText, discount, isSignaturePerk)` | Construit la table d'icône de perk pour l'UI. | 958 |
| `career_modules_insurance_insurance.genericVehNeedsRepair(vehId, callback)` | Demande au véhicule (objet) ses conditions de pièces et appelle callback(needsRepair) à la réponse ; sert aux véhicules hors inventaire (par exemple d'essai). | 655 |
| `career_modules_insurance_insurance.getAccidentForgivenessCount(insuranceId)` | Nombre d'indulgences d'accident restantes chez un assureur. | 1961 |
| `career_modules_insurance_insurance.getActualRepairPrice(invVehId)` | Usage interne : franchise de réparation du véhicule (valeur de l'option deductible). *(interne)* | 805 |
| `career_modules_insurance_insurance.getDefaultInsuranceForClassId(insuranceClassId)` | Assureur par défaut d'une classe : celui de plus petit id. | 1889 |
| `career_modules_insurance_insurance.getDriverScore()` | Score de conducteur actuel (0 à 100). | 562 |
| `career_modules_insurance_insurance.getDriverScoreResetCost()` | Coût pour remettre le score à la valeur par défaut (64) : 0 si le score est déjà au moins égal, sinon 500 + proportion x 19500, arrondi. | 1738 |
| `career_modules_insurance_insurance.getDriverScoreTierData(score)` | Palier de score (min, max, multiplicateur de prime…) pour un score ; le dernier palier si aucun ne correspond. | 552 |
| `career_modules_insurance_insurance.getInsuranceClassFromVehicleShoppingData(data)` | Détermine la classe d'assurance requise pour une annonce selon la classe JSON, la valeur, la population, la carrosserie et la classe commerciale (la priorité la plus haute l'emporte). | 923 |
| `career_modules_insurance_insurance.getInsuranceDataById(insuranceId)` | Définition d'un assureur chargée depuis les fichiers du jeu. | 1930 |
| `career_modules_insurance_insurance.getInsuranceName(insuranceId)` | Nom de l'assureur, ou le libellé « pas d'assurance » si inconnu. | 1957 |
| `career_modules_insurance_insurance.getInvVehFuelDiscountData(invVehId)` | Données de remise carburant d'un véhicule (hasFuelDiscount, fuelDiscount fraction, nom de l'assureur, icône de perk) ; utilisé par le module fuel. | 1907 |
| `career_modules_insurance_insurance.getInvVehRepairTime(vehInvId)` | Délai de réparation inclus dans la police du véhicule (secondes ; 0 = instantané). | 1782 |
| `career_modules_insurance_insurance.getInvVehs()` | Table des entrées d'assurance des véhicules d'inventaire (insuranceId, name, id, initialValue, requiredInsuranceClass, insuranceData). | 1965 |
| `career_modules_insurance_insurance.getPerkValueByInsuranceId(insuranceId, perkId)` | Valeur d'un perk d'un assureur. | 1876 |
| `career_modules_insurance_insurance.getPerkValueByInvVehId(invVehId, perkId)` | Valeur d'un perk de l'assureur d'un véhicule. | 1883 |
| `career_modules_insurance_insurance.getPlCoverageOptionValue(invVehId, coverageOptionName)` | Valeur de l'option de couverture actuellement choisie pour un véhicule (ex. deductible, repairTime, paintRepair, roadsideAssistance). Ne renvoie rien si le véhicule n'est pas assuré. | 116 |
| `career_modules_insurance_insurance.getPlHistory()` | Raccourci vers career_modules_insurance_history.getPlHistory. | 1996 |
| `career_modules_insurance_insurance.getPlayerAbstractData()` | Résumé du joueur pour l'UI : score et palier, distances (totale, assurée, non assurée), nombre de réparations, coût de remise à zéro du score, bilan financier (primes, franchises, réparations privées, dégâts couverts). | 1333 |
| `career_modules_insurance_insurance.getPlayerInsurancesData()` | Données sauvegardées par assureur (metersDriven, accidentForgiveness, roadsideAssistance, loyalty, coverageOptionsData…). | 1786 |
| `career_modules_insurance_insurance.getQuickRepairExtraPrice()` | Supplément pour une réparation rapide (1000). | 1790 |
| `career_modules_insurance_insurance.getRenewsIn(insuranceId)` | Kilomètres restants avant le renouvellement de l'assureur (0 pour -1 ou assureur inconnu). | 1127 |
| `career_modules_insurance_insurance.getTestDriveClaimPrice()` | Montant facturé en cas de dégâts pendant un essai de véhicule (500). | 1872 |
| `career_modules_insurance_insurance.getVehInsuranceInfo(vehInvId)` | Infos d'assurance d'un véhicule : assuré ou non, définition de l'assureur et classe requise. | 1794 |
| `career_modules_insurance_insurance.inventoryVehNeedsRepair(vehInvId)` | Indique si un véhicule d'inventaire a des pièces à réparer (partConditions). | 374 |
| `career_modules_insurance_insurance.isRoadSideAssistanceFree(invVehId)` | Indique s'il reste des remorquages gratuits d'assistance routière pour l'assureur du véhicule. | 1853 |
| `career_modules_insurance_insurance.makeRepairClaim(invVehId, costs, vehInfo)` | Enregistre une réclamation de réparation : consomme une indulgence d'accident ou baisse le score de 1, ajoute l'historique (argent, bons, score, franchise, valeur des dégâts), émet onInsuranceRepairClaim et débloque le succès CLAIM_FILED. Sans effet si le véhicule n'est pas assuré. | 462 |
| `career_modules_insurance_insurance.makeTestDriveDamageClaim(vehId)` | Facture les dégâts d'un essai (500), affiche un message et ajoute une entrée 'testDriveClaim' à l'historique (voir notes : nom de véhicule codé en dur). | 441 |
| `career_modules_insurance_insurance.missionStartRepairCallback(vehInfo)` | Callback de réparation avant mission : rouvre le menu de missions carrière et envoie l'état de dégâts du véhicule à l'UI. | 566 |
| `career_modules_insurance_insurance.onCareerActive(active)` | Hook appelé quand la carrière devient active : charge les données d'assurance (fichiers du jeu et sauvegarde insurance.json). *(interne)* *(hook)* | 949 |
| `career_modules_insurance_insurance.onComputerAddFunctions(menuData, computerFunctions)` | Hook de l'ordinateur du garage : ajoute la fonction « Assurances » (désactivée avant l'achat du véhicule de départ). *(interne)* *(hook)* | 1721 |
| `career_modules_insurance_insurance.onEnterVehicleFinished(invVehId)` | Hook après entrée dans un véhicule : reprend une réparation différée mise en attente (voir bug dans notes). *(interne)* *(hook)* | 936 |
| `career_modules_insurance_insurance.onExitInsurancesComputerScreen()` | Hook : l'écran des assurances est quitté ; cesse l'envoi de mises à jour à l'UI. *(interne)* *(hook)* | 1717 |
| `career_modules_insurance_insurance.onMenuClosed()` | Hook de fermeture de menu : retire la laisse (tether). *(interne)* *(hook)* | 1713 |
| `career_modules_insurance_insurance.onSaveCurrentProfile(currentSavePath)` | Hook de sauvegarde : écrit career/insurance.json (score, distances, plInsurancesData, invVehs, historique). *(interne)* *(hook)* | 954 |
| `career_modules_insurance_insurance.onUpdate(dtReal, dtSim, dtRaw)` | Hook par image : hors mission au premier plan et hors marche à pied, cumule la distance, vérifie renouvellement, gestes et hausse du score de conducteur du véhicule assuré actif ; décompte aussi les minuteries d'édition de couverture. *(interne)* *(hook)* | 864 |
| `career_modules_insurance_insurance.onVehicleAddedToInventory(data)` | Hook : un véhicule entre dans l'inventaire. Crée son entrée invVehs (valeur initiale, classe d'assurance requise selon valeur, population, carrosserie, classe commerciale) et applique l'assurance choisie à l'achat (ou -1). *(interne)* *(hook)* | 1590 |
| `career_modules_insurance_insurance.onVehicleRemoved(invVehId)` | Hook : un véhicule est retiré de l'inventaire ; supprime son entrée d'assurance. *(interne)* *(hook)* | 1508 |
| `career_modules_insurance_insurance.onVehicleSaveFinished()` | Hook de fin de sauvegarde de véhicule : referme le menu si sa fermeture attendait la sauvegarde. *(interne)* *(hook)* | 1683 |
| `career_modules_insurance_insurance.onVehicleSwitched()` | Hook de changement de véhicule contrôlé : met à jour l'assurance active. *(interne)* *(hook)* | 945 |
| `career_modules_insurance_insurance.openChooseInsuranceScreen(mode, params)` | Navigue vers l'écran de choix d'assurance : 'purchase' (achat en boutique) ou 'change' (changement depuis l'ordinateur). | 1940 |
| `career_modules_insurance_insurance.openMenu(_originComputerId)` | Ouvre le menu des assurances depuis un ordinateur (laisse de 7 m) et émet onComputerInsurance. Ne fait rien sans identifiant d'ordinateur. | 1691 |
| `career_modules_insurance_insurance.repairPartConditions(data)` | Remet les pièces cassées à neuf dans data.partConditions (intégrité 1, repeinture ou apprêt selon paintRepair, compteur de réparations des pièces d'inventaire, réservoirs d'énergie conservés). | 380 |
| `career_modules_insurance_insurance.resetDriverScore()` | Paie le coût de remise à zéro et rétablit le score par défaut, avec entrée d'historique et mise à jour de l'UI. | 1754 |
| `career_modules_insurance_insurance.resetPlPolicyData()` | Fonction de debug de carrière : recharge les données d'assurance en réinitialisant certaines données (loadInsurancesData(true)). *(interne)* | 2051 |
| `career_modules_insurance_insurance.sanitizeCoverageOption(insuranceId, coverageOptionId, invVehId)` | Prépare une option de couverture pour l'UI : clé, nom, choix, type de choix, texte de perk, ordre d'affichage et identifiant de la valeur actuelle. | 716 |
| `career_modules_insurance_insurance.saveNewInsuranceCoverageOptions(insuranceId, newCoverageOptions)` | Enregistre les options de couverture propres à l'assureur (franchise, assistance routière…) contre les frais de dossier (paperworkFees) ; recharge l'assistance routière si elle change. | 1813 |
| `career_modules_insurance_insurance.saveNewVehicleCoverageOptions(vehicleId, newCoverageOptions)` | Enregistre les options de couverture propres à un véhicule contre les frais de dossier de son assureur. | 1835 |
| `career_modules_insurance_insurance.sendChangeInsuranceDataToTheUI(invVehId)` | Envoie 'chooseInsuranceData' pour le changement d'assurance d'un véhicule déjà possédé (coût net de changement, remboursement). | 1425 |
| `career_modules_insurance_insurance.sendChooseInsuranceDataToTheUI(purchaseType, vehShopId, defaultInsuranceId)` | Envoie 'chooseInsuranceData' pour l'achat d'un véhicule en boutique : cartes des assureurs de la bonne classe (prime d'ajout, remise de groupe) plus la carte « sans assurance ». | 1441 |
| `career_modules_insurance_insurance.sendUIData()` | Envoie à l'UI (guihook 'insurancesData') l'historique, le score, les véhicules non assurés, les tuiles de véhicules et toutes les classes avec leurs assureurs. | 1454 |
| `career_modules_insurance_insurance.setDriverScore(score)` | Fixe le score de conducteur sans aucune vérification (outils/debug). | 1949 |
| `career_modules_insurance_insurance.startRepair(vehInvId, repairOptionData, callback)` | Répare un véhicule d'inventaire : paie le coût, enregistre une réclamation (isInsuranceRepair) ou une réparation privée, répare les pièces, puis lance une réparation différée (repairTime > 0) ou instantanée. | 587 |
| `career_modules_insurance_insurance.startRepairInGarage(invVehId, repairOptionData)` | Réparation depuis le garage : émet onRepairInGarage puis startRepair ; pour une réparation instantanée, téléporte le véhicule au garage le plus proche. | 644 |
| `career_modules_insurance_insurance.startRepairInstant(vehInfo, callback, skipSound)` | Réparation instantanée : joue un son, respawn le véhicule s'il est présent, puis marque le véhicule modifié, recharge le carburant minimum et sauvegarde. | 571 |
| `career_modules_insurance_insurance.topUpRoadsideAssistance(insuranceId)` | Recharge le nombre de remorquages gratuits selon l'option roadsideAssistance choisie (au renouvellement ou à la modification). | 1847 |
| `career_modules_insurance_insurance.useRoadsideAssistance(invVehId)` | Consomme un remorquage gratuit de l'assureur du véhicule. | 1861 |

### Détail des paramètres

#### `career_modules_insurance_insurance.addToPlHistory(data)`

Raccourci vers career_modules_insurance_history.addToPlHistory.

- `data` (*table*) : Entrée d'historique.

#### `career_modules_insurance_insurance.calculateAddVehiclePrice(insuranceId, vehValue)`

Prix à payer pour ajouter un véhicule à un assureur : prime totale si c'est le premier, sinon prime du véhicule au prorata de la distance restante avant renouvellement.

- `insuranceId` (*integer*) : Assureur.
- `vehValue` (*number*) : Valeur du véhicule.
- **renvoie** : number Montant.

#### `career_modules_insurance_insurance.calculateInsurancePremium(insuranceId, potentialCoverageOptions, potentialVehiclesCoverageOptions, potentialNewVehValue)`

Prime totale d'un assureur : somme des primes de ses véhicules plus options à portée de l'assureur, puis totalPriceWithDriverScore (x multiplicateur du palier de score).

- `insuranceId` (*integer*) : Assureur.
- `potentialCoverageOptions` (*table|nil*) : Options hypothétiques (une table vide est ignorée).
- `potentialVehiclesCoverageOptions` (*table|nil*) : Options hypothétiques par véhicule, indexées par id en chaîne.
- `potentialNewVehValue` (*number|nil*) : Valeur d'un véhicule supplémentaire à inclure.
- **renvoie** : table {items, totalPrice, totalPriceWithDriverScore, groupDiscountSavings}.

#### `career_modules_insurance_insurance.calculateVehiclePremium(invVehId, nonInvVehInfo, potentialCoverageOptions)`

Prime d'un véhicule : valeur x coverageRate de la classe x produit des influences des options x (1 - remise de groupe). Fournir invVehId (véhicule possédé) ou nonInvVehInfo ({vehValue, insuranceId}).

- `invVehId` (*integer|nil*) : Véhicule d'inventaire.
- `nonInvVehInfo` (*table|nil*) : Véhicule hypothétique {vehValue, insuranceId}.
- `potentialCoverageOptions` (*table|nil*) : Options hypothétiques à la place des options actuelles.
- **renvoie** : table {cost, costWithoutGroupDiscount}.

#### `career_modules_insurance_insurance.changeInvVehInsurance(invVehId, newInsuranceId)`

Changement d'assurance déclenché par le joueur : refusé si le véhicule a besoin de réparation ; calcule le coût net (remboursement moins pénalité moins prix d'ajout), applique le nouvel assureur, paie ou reçoit la différence, journalise et débloque le succès POLICY_REVIEW.

- `invVehId` (*integer*) : Identifiant d'inventaire.
- `newInsuranceId` (*integer*) : Nouvel assureur ; -1 ou moins pour aucune assurance.

#### `career_modules_insurance_insurance.changeInvVehInsuranceCoverageOptions(invVehId, changedCoverageOptions)`

Ancienne voie de modification des options de couverture d'un véhicule : enregistre l'historique et fait payer les frais de dossier (voir bug dans notes).

- `invVehId` (*integer*) : Identifiant d'inventaire.
- `changedCoverageOptions` (*table*) : Options modifiées (nom -> valeur).

#### `career_modules_insurance_insurance.closeMenu(_closeMenuAfterSaving)`

Ferme le menu des assurances (retour à l'ordinateur ou fermeture de tous les menus). Avec sauvegarde auto, peut attendre la fin de la sauvegarde.

- `_closeMenuAfterSaving` (*boolean|nil*) : Attendre onVehicleSaveFinished avant de fermer.

#### `career_modules_insurance_insurance.doesInsuranceExist(insuranceId)`

Indique si l'identifiant correspond à un assureur défini.

- `insuranceId` (*integer*) : Identifiant.
- **renvoie** : boolean true si défini.

#### `career_modules_insurance_insurance.expediteRepair(inventoryId, price)`

Paie pour accéder immédiatement à un véhicule en réparation différée (supprime timeToAccess et delayReason).

- `inventoryId` (*integer*) : Identifiant d'inventaire.
- `price` (*number*) : Prix à payer.

#### `career_modules_insurance_insurance.formatPerkIconData(smallText, tooltipText, discount, isSignaturePerk)`

Construit la table d'icône de perk pour l'UI.

- `smallText` (*string*) : Texte court.
- `tooltipText` (*string*) : Info-bulle.
- `discount` (*number|nil*) : Remise liée.
- `isSignaturePerk` (*boolean*) : Perk phare de l'assureur.
- **renvoie** : table {smallText, tooltipText, discount, isSignaturePerk}.

#### `career_modules_insurance_insurance.genericVehNeedsRepair(vehId, callback)`

Demande au véhicule (objet) ses conditions de pièces et appelle callback(needsRepair) à la réponse ; sert aux véhicules hors inventaire (par exemple d'essai).

- `vehId` (*integer*) : Identifiant d'objet véhicule.
- `callback` (*function*) : fonction(needsRepair: boolean).

#### `career_modules_insurance_insurance.getAccidentForgivenessCount(insuranceId)`

Nombre d'indulgences d'accident restantes chez un assureur.

- `insuranceId` (*integer*) : Assureur.
- **renvoie** : integer Nombre (0 si inconnu).

#### `career_modules_insurance_insurance.getActualRepairPrice(invVehId)`

Usage interne : franchise de réparation du véhicule (valeur de l'option deductible).

- `invVehId` (*integer*) : Identifiant d'inventaire.
- **renvoie** : number|nil Franchise.

#### `career_modules_insurance_insurance.getDefaultInsuranceForClassId(insuranceClassId)`

Assureur par défaut d'une classe : celui de plus petit id.

- `insuranceClassId` (*string*) : Identifiant de classe.
- **renvoie** : table|nil Données d'assureur.

#### `career_modules_insurance_insurance.getDriverScore()`

Score de conducteur actuel (0 à 100).

- **renvoie** : number Score.

#### `career_modules_insurance_insurance.getDriverScoreResetCost()`

Coût pour remettre le score à la valeur par défaut (64) : 0 si le score est déjà au moins égal, sinon 500 + proportion x 19500, arrondi.

- **renvoie** : integer Montant.

#### `career_modules_insurance_insurance.getDriverScoreTierData(score)`

Palier de score (min, max, multiplicateur de prime…) pour un score ; le dernier palier si aucun ne correspond.

- `score` (*number|nil*) : Score ; défaut : le score actuel.
- **renvoie** : table Données de palier.

#### `career_modules_insurance_insurance.getInsuranceClassFromVehicleShoppingData(data)`

Détermine la classe d'assurance requise pour une annonce selon la classe JSON, la valeur, la population, la carrosserie et la classe commerciale (la priorité la plus haute l'emporte).

- `data` (*table*) : Annonce de boutique (Value, Population, BodyStyle, aggregates, 'Commercial Class').
- **renvoie** : table|nil Données de classe.

#### `career_modules_insurance_insurance.getInsuranceDataById(insuranceId)`

Définition d'un assureur chargée depuis les fichiers du jeu.

- `insuranceId` (*integer*) : Assureur.
- **renvoie** : table|nil Définition.

#### `career_modules_insurance_insurance.getInsuranceName(insuranceId)`

Nom de l'assureur, ou le libellé « pas d'assurance » si inconnu.

- `insuranceId` (*integer*) : Identifiant.
- **renvoie** : string Nom.

#### `career_modules_insurance_insurance.getInvVehFuelDiscountData(invVehId)`

Données de remise carburant d'un véhicule (hasFuelDiscount, fuelDiscount fraction, nom de l'assureur, icône de perk) ; utilisé par le module fuel.

- `invVehId` (*integer*) : Identifiant d'inventaire.
- **renvoie** : table {hasFuelDiscount, fuelDiscount, perkData, insuranceName?}.

#### `career_modules_insurance_insurance.getInvVehRepairTime(vehInvId)`

Délai de réparation inclus dans la police du véhicule (secondes ; 0 = instantané).

- `vehInvId` (*integer*) : Identifiant d'inventaire.
- **renvoie** : number|nil Secondes.

#### `career_modules_insurance_insurance.getInvVehs()`

Table des entrées d'assurance des véhicules d'inventaire (insuranceId, name, id, initialValue, requiredInsuranceClass, insuranceData).

- **renvoie** : table<integer, table> invVehs (référence).

#### `career_modules_insurance_insurance.getPerkValueByInsuranceId(insuranceId, perkId)`

Valeur d'un perk d'un assureur.

- `insuranceId` (*integer*) : Assureur.
- `perkId` (*string*) : Perk (reduceDeductible, fuelDiscount, instantRepair…).
- **renvoie** : number|boolean|nil Valeur ou nil.

#### `career_modules_insurance_insurance.getPerkValueByInvVehId(invVehId, perkId)`

Valeur d'un perk de l'assureur d'un véhicule.

- `invVehId` (*integer*) : Identifiant d'inventaire.
- `perkId` (*string*) : Perk.
- **renvoie** : number|boolean|nil Valeur ou nil.

#### `career_modules_insurance_insurance.getPlCoverageOptionValue(invVehId, coverageOptionName)`

Valeur de l'option de couverture actuellement choisie pour un véhicule (ex. deductible, repairTime, paintRepair, roadsideAssistance). Ne renvoie rien si le véhicule n'est pas assuré.

- `invVehId` (*integer*) : Identifiant d'inventaire.
- `coverageOptionName` (*string*) : Nom de l'option.
- **renvoie** : number|boolean|nil Valeur du choix.

#### `career_modules_insurance_insurance.getPlHistory()`

Raccourci vers career_modules_insurance_history.getPlHistory.

- **renvoie** : table Historique.

#### `career_modules_insurance_insurance.getPlayerAbstractData()`

Résumé du joueur pour l'UI : score et palier, distances (totale, assurée, non assurée), nombre de réparations, coût de remise à zéro du score, bilan financier (primes, franchises, réparations privées, dégâts couverts).

- **renvoie** : table Données de synthèse.

#### `career_modules_insurance_insurance.getPlayerInsurancesData()`

Données sauvegardées par assureur (metersDriven, accidentForgiveness, roadsideAssistance, loyalty, coverageOptionsData…).

- **renvoie** : table plInsurancesData (référence).

#### `career_modules_insurance_insurance.getQuickRepairExtraPrice()`

Supplément pour une réparation rapide (1000).

- **renvoie** : number Montant.

#### `career_modules_insurance_insurance.getRenewsIn(insuranceId)`

Kilomètres restants avant le renouvellement de l'assureur (0 pour -1 ou assureur inconnu).

- `insuranceId` (*integer*) : Assureur.
- **renvoie** : integer Kilomètres (arrondi supérieur).

#### `career_modules_insurance_insurance.getTestDriveClaimPrice()`

Montant facturé en cas de dégâts pendant un essai de véhicule (500).

- **renvoie** : number Montant.

#### `career_modules_insurance_insurance.getVehInsuranceInfo(vehInvId)`

Infos d'assurance d'un véhicule : assuré ou non, définition de l'assureur et classe requise.

- `vehInvId` (*integer*) : Identifiant d'inventaire.
- **renvoie** : table|nil {isInsured, insuranceInfo, insuranceClass}.

#### `career_modules_insurance_insurance.inventoryVehNeedsRepair(vehInvId)`

Indique si un véhicule d'inventaire a des pièces à réparer (partConditions).

- `vehInvId` (*integer*) : Identifiant d'inventaire.
- **renvoie** : boolean|nil nil si le véhicule n'existe pas.

#### `career_modules_insurance_insurance.isRoadSideAssistanceFree(invVehId)`

Indique s'il reste des remorquages gratuits d'assistance routière pour l'assureur du véhicule.

- `invVehId` (*integer*) : Identifiant d'inventaire.
- **renvoie** : boolean true s'il en reste.

#### `career_modules_insurance_insurance.makeRepairClaim(invVehId, costs, vehInfo)`

Enregistre une réclamation de réparation : consomme une indulgence d'accident ou baisse le score de 1, ajoute l'historique (argent, bons, score, franchise, valeur des dégâts), émet onInsuranceRepairClaim et débloque le succès CLAIM_FILED. Sans effet si le véhicule n'est pas assuré.

- `invVehId` (*integer*) : Identifiant d'inventaire.
- `costs` (*table*) : Coûts (nombres ou {money, vouchers}) et éventuellement deductible.
- `vehInfo` (*table|nil*) : Véhicule, pour estimer le prix des dégâts.

#### `career_modules_insurance_insurance.makeTestDriveDamageClaim(vehId)`

Facture les dégâts d'un essai (500), affiche un message et ajoute une entrée 'testDriveClaim' à l'historique (voir notes : nom de véhicule codé en dur).

- `vehId` (*integer|nil*) : Ignoré.

#### `career_modules_insurance_insurance.missionStartRepairCallback(vehInfo)`

Callback de réparation avant mission : rouvre le menu de missions carrière et envoie l'état de dégâts du véhicule à l'UI.

- `vehInfo` (*table*) : Véhicule d'inventaire.

#### `career_modules_insurance_insurance.onCareerActive(active)`

Hook appelé quand la carrière devient active : charge les données d'assurance (fichiers du jeu et sauvegarde insurance.json).

- `active` (*boolean*) : true à l'activation.

#### `career_modules_insurance_insurance.onComputerAddFunctions(menuData, computerFunctions)`

Hook de l'ordinateur du garage : ajoute la fonction « Assurances » (désactivée avant l'achat du véhicule de départ).

- `menuData` (*table*) : Données du menu (computerFacility, hasBoughtStarterVehicle).
- `computerFunctions` (*table*) : Fonctions à compléter.

#### `career_modules_insurance_insurance.onEnterVehicleFinished(invVehId)`

Hook après entrée dans un véhicule : reprend une réparation différée mise en attente (voir bug dans notes).

- `invVehId` (*integer*) : Identifiant d'inventaire (non utilisé).

#### `career_modules_insurance_insurance.onSaveCurrentProfile(currentSavePath)`

Hook de sauvegarde : écrit career/insurance.json (score, distances, plInsurancesData, invVehs, historique).

- `currentSavePath` (*string*) : Dossier du profil de sauvegarde.

#### `career_modules_insurance_insurance.onUpdate(dtReal, dtSim, dtRaw)`

Hook par image : hors mission au premier plan et hors marche à pied, cumule la distance, vérifie renouvellement, gestes et hausse du score de conducteur du véhicule assuré actif ; décompte aussi les minuteries d'édition de couverture.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulation (s).
- `dtRaw` (*number*) : Delta temps brut (s).

#### `career_modules_insurance_insurance.onVehicleAddedToInventory(data)`

Hook : un véhicule entre dans l'inventaire. Crée son entrée invVehs (valeur initiale, classe d'assurance requise selon valeur, population, carrosserie, classe commerciale) et applique l'assurance choisie à l'achat (ou -1).

- `data` (*table*) : {inventoryId, vehicleInfo, purchaseData = {insuranceId}}.

#### `career_modules_insurance_insurance.onVehicleRemoved(invVehId)`

Hook : un véhicule est retiré de l'inventaire ; supprime son entrée d'assurance.

- `invVehId` (*integer*) : Identifiant d'inventaire.

#### `career_modules_insurance_insurance.openChooseInsuranceScreen(mode, params)`

Navigue vers l'écran de choix d'assurance : 'purchase' (achat en boutique) ou 'change' (changement depuis l'ordinateur).

- `mode` (*string*) : 'purchase' ou 'change'.
- `params` (*table*) : Paramètres de route (achat : purchaseType, shopId, insuranceId? ; changement : vehicleId).
- **renvoie** : table Résultat de navigation, ou {result=false, success=false, reason='unknown_mode'}.

#### `career_modules_insurance_insurance.openMenu(_originComputerId)`

Ouvre le menu des assurances depuis un ordinateur (laisse de 7 m) et émet onComputerInsurance. Ne fait rien sans identifiant d'ordinateur.

- `_originComputerId` (*string*) : Identifiant de l'ordinateur du garage.

#### `career_modules_insurance_insurance.repairPartConditions(data)`

Remet les pièces cassées à neuf dans data.partConditions (intégrité 1, repeinture ou apprêt selon paintRepair, compteur de réparations des pièces d'inventaire, réservoirs d'énergie conservés).

- `data` (*table*) : {partConditions, paintRepair?, inventoryId?}.

#### `career_modules_insurance_insurance.resetDriverScore()`

Paie le coût de remise à zéro et rétablit le score par défaut, avec entrée d'historique et mise à jour de l'UI.

- **renvoie** : boolean true si réussi ; false si coût nul ou fonds insuffisants.

#### `career_modules_insurance_insurance.sanitizeCoverageOption(insuranceId, coverageOptionId, invVehId)`

Prépare une option de couverture pour l'UI : clé, nom, choix, type de choix, texte de perk, ordre d'affichage et identifiant de la valeur actuelle.

- `insuranceId` (*integer*) : Assureur.
- `coverageOptionId` (*string*) : Nom de l'option.
- `invVehId` (*integer|nil*) : Véhicule (requis pour les options par véhicule).
- **renvoie** : table|nil Données d'option.

#### `career_modules_insurance_insurance.saveNewInsuranceCoverageOptions(insuranceId, newCoverageOptions)`

Enregistre les options de couverture propres à l'assureur (franchise, assistance routière…) contre les frais de dossier (paperworkFees) ; recharge l'assistance routière si elle change.

- `insuranceId` (*integer*) : Assureur.
- `newCoverageOptions` (*table<string, integer>*) : Nom de l'option -> identifiant du choix.

#### `career_modules_insurance_insurance.saveNewVehicleCoverageOptions(vehicleId, newCoverageOptions)`

Enregistre les options de couverture propres à un véhicule contre les frais de dossier de son assureur.

- `vehicleId` (*integer*) : Identifiant d'inventaire.
- `newCoverageOptions` (*table<string, integer>*) : Nom de l'option -> identifiant du choix.

#### `career_modules_insurance_insurance.sendChangeInsuranceDataToTheUI(invVehId)`

Envoie 'chooseInsuranceData' pour le changement d'assurance d'un véhicule déjà possédé (coût net de changement, remboursement).

- `invVehId` (*integer*) : Identifiant d'inventaire.

#### `career_modules_insurance_insurance.sendChooseInsuranceDataToTheUI(purchaseType, vehShopId, defaultInsuranceId)`

Envoie 'chooseInsuranceData' pour l'achat d'un véhicule en boutique : cartes des assureurs de la bonne classe (prime d'ajout, remise de groupe) plus la carte « sans assurance ».

- `purchaseType` (*string*) : Type d'achat transmis à l'UI.
- `vehShopId` (*string|integer*) : Identifiant de l'annonce.
- `defaultInsuranceId` (*integer|nil*) : Assureur présélectionné.

#### `career_modules_insurance_insurance.setDriverScore(score)`

Fixe le score de conducteur sans aucune vérification (outils/debug).

- `score` (*number*) : Nouveau score.

#### `career_modules_insurance_insurance.startRepair(vehInvId, repairOptionData, callback)`

Répare un véhicule d'inventaire : paie le coût, enregistre une réclamation (isInsuranceRepair) ou une réparation privée, répare les pièces, puis lance une réparation différée (repairTime > 0) ou instantanée.

- `vehInvId` (*integer|nil*) : Véhicule ; défaut : véhicule actuel.
- `repairOptionData` (*table|nil*) : {cost, isInsuranceRepair, repairTime}.
- `callback` (*function|nil*) : Appelé après une réparation instantanée avec vehInfo.

#### `career_modules_insurance_insurance.startRepairInGarage(invVehId, repairOptionData)`

Réparation depuis le garage : émet onRepairInGarage puis startRepair ; pour une réparation instantanée, téléporte le véhicule au garage le plus proche.

- `invVehId` (*integer*) : Identifiant d'inventaire.
- `repairOptionData` (*table*) : {cost, isInsuranceRepair, repairTime}.
- **renvoie** : any Valeur de startRepair (nil).

#### `career_modules_insurance_insurance.startRepairInstant(vehInfo, callback, skipSound)`

Réparation instantanée : joue un son, respawn le véhicule s'il est présent, puis marque le véhicule modifié, recharge le carburant minimum et sauvegarde.

- `vehInfo` (*table*) : Véhicule d'inventaire.
- `callback` (*function|nil*) : Appelé après le respawn.
- `skipSound` (*boolean|nil*) : Ne pas jouer le son.

#### `career_modules_insurance_insurance.topUpRoadsideAssistance(insuranceId)`

Recharge le nombre de remorquages gratuits selon l'option roadsideAssistance choisie (au renouvellement ou à la modification).

- `insuranceId` (*integer*) : Assureur.

#### `career_modules_insurance_insurance.useRoadsideAssistance(invVehId)`

Consomme un remorquage gratuit de l'assureur du véhicule.

- `invVehId` (*integer*) : Identifiant d'inventaire.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : career_career, payment, playerAttributes, insurance_history, tether, etc. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onComputerInsurance`
- `onInsuranceRepairClaim` — écouté par 1 module(s)
- `onRepairInGarage` — écouté par 1 module(s)
- `onVehicleRepaired` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `MenuOpenModule`, `chooseInsuranceData`, `gameContextPlayerVehicleDamageInfo`, `insurancesData`

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/insurance/insurance.lua`.*
