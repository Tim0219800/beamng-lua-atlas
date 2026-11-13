---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/insurance/history.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Historique des événements d'assurance du joueur en carrière (réclamations, réparations privées, renouvellements, changements de contrat…). Chaque entrée porte un type, un titre, des effets (par exemple {type='money', changedBy=-montant}), le nom de l'assurance concernée, un texte optionnel, des données libres (other) et l'heure os.time(). Le module fournit aussi des totaux utilisés pour les statistiques d'assurance. Les données sont sauvegardées par le module insurance via getPlHistory/setPlHistory.
--- Accès : extension `career_modules_insurance_history` : `extensions.load("career_modules_insurance_history")`, puis la globale `career_modules_insurance_history`
---@class career_modules_insurance_history
career_modules_insurance_history = {}

--- Ajoute une entrée à l'historique avec l'heure courante (os.time()).
---Source : lua/ge/extensions/career/modules/insurance/history.lua:10
---@param data table Table avec type, title, effects, concernedInsuranceName, overrideText, other.
function career_modules_insurance_history.addToPlHistory(data) end

--- Construit la liste d'historique pour l'UI : copie profonde triée du plus récent au plus ancien, avec date lisible.
---Source : lua/ge/extensions/career/modules/insurance/history.lua:23
---@return table  Liste d'entrées avec champ date supplémentaire.
function career_modules_insurance_history.buildPlHistory() end

--- Somme des coûts de dégâts (vehDamagePrice) des réclamations de réparation, c'est-à-dire la valeur des dommages couverts.
---Source : lua/ge/extensions/career/modules/insurance/history.lua:75
---@return number  Montant.
function career_modules_insurance_history.getDamageCostCoveredByInsurance() end

--- Nombre de réparations prises en charge par une assurance (effets d'argent des entrées 'insuranceRepairClaim').
---Source : lua/ge/extensions/career/modules/insurance/history.lua:85
---@return integer  Nombre de réclamations.
function career_modules_insurance_history.getInsuranceClaimsCount() end

--- Nombre de réparations payées sans assurance (entrées 'privateRepair').
---Source : lua/ge/extensions/career/modules/insurance/history.lua:89
---@return integer  Nombre de réparations privées.
function career_modules_insurance_history.getNonInsuranceRepairsCount() end

--- Renvoie la table d'historique brute (pour la sauvegarde).
---Source : lua/ge/extensions/career/modules/insurance/history.lua:53
---@return table  Liste d'entrées.
function career_modules_insurance_history.getPlHistory() end

--- Somme des franchises payées lors des réclamations de réparation.
---Source : lua/ge/extensions/career/modules/insurance/history.lua:65
---@return number  Montant.
function career_modules_insurance_history.getTotalInsuranceRepairDeductiblesPaid() end

--- Total des primes payées : renouvellements ('insuranceRenewed') plus changements de contrat ('insuranceChanged').
---Source : lua/ge/extensions/career/modules/insurance/history.lua:93
---@return number  Montant en argent du jeu.
function career_modules_insurance_history.getTotalPremiumPaid() end

--- Total dépensé en réparations sans assurance.
---Source : lua/ge/extensions/career/modules/insurance/history.lua:99
---@return number  Montant.
function career_modules_insurance_history.getTotalPrivateRepairsPaid() end

--- Vide l'historique (nouvelle partie).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/insurance/history.lua:61
function career_modules_insurance_history.initPlHistory() end

--- Remplace l'historique (chargement de sauvegarde) ; une valeur nil le vide.
---Source : lua/ge/extensions/career/modules/insurance/history.lua:57
---@param history table|nil Historique sauvegardé.
function career_modules_insurance_history.setPlHistory(history) end

