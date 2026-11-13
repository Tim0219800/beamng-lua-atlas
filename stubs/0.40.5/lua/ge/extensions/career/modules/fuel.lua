---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/fuel.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Transaction de ravitaillement du mode carrière à une station-service. startTransaction ouvre l'écran career.refueling, lit les réservoirs du véhicule du joueur (energyStorage), puis onUpdate fait monter l'énergie des réservoirs actifs au débit choisi, calcule le prix (prix de la station par unité, remise d'assurance éventuelle) et envoie les données à l'UI (initialFuelingData, updateFuelData). payPrice débite l'argent (ou rien pour un véhicule de travail, payé par l'entreprise), uiCancelTransaction restaure les niveaux de départ.
--- Accès : extension `career_modules_fuel` : `extensions.load("career_modules_fuel")`, puis la globale `career_modules_fuel`
---@class career_modules_fuel
---@field dependencies table<integer, string> Extensions chargées avant : career_career.
career_modules_fuel = {}

--- Renvoie la liste des réservoirs retenus pour la transaction (energyType, name, currentEnergy, maxEnergy en joules).
---Source : lua/ge/extensions/career/modules/fuel.lua:211
---@return table|nil  Liste de réservoirs, nil hors transaction.
function career_modules_fuel.getFuelData() end

--- Renvoie, par réservoir, l'énergie ajoutée (fueledEnergy, joules) et le prix (price) de la transaction en cours.
---Source : lua/ge/extensions/career/modules/fuel.lua:372
---@return table  Liste de {price, fueledEnergy}.
function career_modules_fuel.getFuelingData() end

--- Indique si au moins un réservoir est en train d'être rempli.
---Source : lua/ge/extensions/career/modules/fuel.lua:473
---@return boolean  true si un remplissage est actif.
function career_modules_fuel.isCurrentlyFueling() end

--- Évite la panne sèche totale : pour chaque réservoir du véhicule, recharge à fond l'électrique, ou remet un réservoir quasi vide (<= 1 %) à 5 %, avec un message d'urgence.
---Source : lua/ge/extensions/career/modules/fuel.lua:617
---@param vehId integer|nil Véhicule ; par défaut le véhicule actuel de l'inventaire.
function career_modules_fuel.minimumRefuelingCheck(vehId) end

--- Hook appelé quand la carrière devient active ou inactive : crée les sources audio (essence et électrique) si actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/fuel.lua:632
---@param active boolean true à l'activation.
function career_modules_fuel.onCareerActive(active) end

--- Hook/action d'entrée (gâchette de la pompe) : règle le débit en fraction 0 à 1 du maximum et démarre le remplissage du réservoir ; un facteur 0 l'arrête et remet le débit au maximum.
---Source : lua/ge/extensions/career/modules/fuel.lua:349
---@param factor number Fraction du débit maximal, bornée à [0, 1].
---@param tankIndex integer|nil Réservoir visé ; par défaut le réservoir sélectionné.
function career_modules_fuel.onChangeFlowRate(factor, tankIndex) end

--- Hook de fin de niveau : oublie les identifiants des sons de ravitaillement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/fuel.lua:637
---@param levelPath string Chemin du niveau.
function career_modules_fuel.onClientEndMission(levelPath) end

--- Hook par image : annule la transaction si le véhicule bouge à plus de 2 m/s, fait avancer les réservoirs actifs (énergie, prix arrondi au centime), arrête un réservoir plein, envoie les données à l'UI toutes les 0,1 s, ajuste le son de pompe, et affiche la fenêtre ImGui de debug hors build shipping.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/fuel.lua:496
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps de simulation (s).
function career_modules_fuel.onUpdate(dtReal, dtSim) end

--- Paye le total (ne fait rien si le prix est nul ou si le joueur n'a pas assez d'argent), arrête le remplissage, enregistre la dépense (career_modules_playerAttributes, statistique career/fuel/paidPrice.money), termine la transaction et émet onPaidRefuelling.
---Source : lua/ge/extensions/career/modules/fuel.lua:402
function career_modules_fuel.payPrice() end

--- Demande au véhicule du joueur ses réservoirs (energyStorage) ; à la réponse, filtre les réservoirs, prépare les données et envoie initialFuelingData à l'UI.
---Source : lua/ge/extensions/career/modules/fuel.lua:198
function career_modules_fuel.requestRefuelingTransactionData() end

--- Envoie à l'UI (guihook 'updateFuelData') énergie actuelle, énergie ajoutée, prix, état actif par réservoir, prix total, possibilité de payer (canPay) et débit relatif.
---Source : lua/ge/extensions/career/modules/fuel.lua:147
function career_modules_fuel.sendUpdateDataToUI() end

--- Démarre une transaction pour le véhicule actuel de l'inventaire à la station donnée : active l'action map 'Refueling', coupe le contact (setIgnitionLevel 0), ouvre l'écran career.refueling et émet onRefuelingStartTransaction. Ne fait rien sans véhicule actuel d'inventaire.
---Source : lua/ge/extensions/career/modules/fuel.lua:202
---@param _gasStation table Station-service ; doit contenir facility (id, name).
function career_modules_fuel.startTransaction(_gasStation) end

--- Appelé par l'UI : commence à remplir tous les réservoirs d'un type d'énergie.
---Source : lua/ge/extensions/career/modules/fuel.lua:437
---@param energyType string gasoline, diesel, kerosine, n2o ou electricEnergy.
function career_modules_fuel.uiButtonStartFueling(energyType) end

--- Appelé par l'UI : sélectionne puis commence à remplir un réservoir précis.
---Source : lua/ge/extensions/career/modules/fuel.lua:445
---@param index integer Indice (à partir de 1) dans la liste des réservoirs.
function career_modules_fuel.uiButtonStartFuelingTank(index) end

--- Appelé par l'UI : arrête le remplissage des réservoirs d'un type (tous si nil) et applique les niveaux au véhicule.
---Source : lua/ge/extensions/career/modules/fuel.lua:441
---@param energyType string|nil Type d'énergie.
function career_modules_fuel.uiButtonStopFueling(energyType) end

--- Appelé par l'UI : arrête le remplissage d'un réservoir précis.
---Source : lua/ge/extensions/career/modules/fuel.lua:455
---@param index integer Indice du réservoir.
function career_modules_fuel.uiButtonStopFuelingTank(index) end

--- Annule la transaction : restaure les niveaux d'énergie de départ sur le véhicule, sans payer, et termine la transaction (retour à l'écran 'play', sauvegarde auto ou mise à jour des conditions de pièces).
---Source : lua/ge/extensions/career/modules/fuel.lua:464
function career_modules_fuel.uiCancelTransaction() end

--- Appelé par l'UI : change le réservoir sélectionné (ignoré pendant un remplissage ou si l'indice est invalide).
---Source : lua/ge/extensions/career/modules/fuel.lua:429
---@param index integer Indice du réservoir.
function career_modules_fuel.uiSetSelectedTankIndex(index) end

