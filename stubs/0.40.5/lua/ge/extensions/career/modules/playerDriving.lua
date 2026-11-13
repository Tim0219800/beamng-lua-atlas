---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/playerDriving.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère la conduite du joueur en carrière : mise en place du trafic et des véhicules garés, suivi de l'état du joueur (stationné, trafic, poursuite de police), amendes d'arrestation, phases du tutoriel (trafic masqué puis restauré), téléportation au garage (avec remorque), récupération du véhicule favori et affichage d'une position par caméra. Utilise gameplay_traffic, gameplay_parking et gameplay_police.
--- Accès : extension `career_modules_playerDriving` : `extensions.load("career_modules_playerDriving")`, puis la globale `career_modules_playerDriving`
---@class career_modules_playerDriving
---@field debugMode boolean not shipping_build : true hors build de distribution.
---@field dependencies table<integer, string> Extensions chargées avant : career_career.
career_modules_playerDriving = {}

--- Renvoie la table d'état du joueur (trafic, stationnement, quantités maximales).
---Source : lua/ge/extensions/career/modules/playerDriving.lua:15
---@return table  playerData (référence directe).
function career_modules_playerDriving.getPlayerData() end

--- Hook : lance setupTraffic si la carrière est active et le trafic jamais préparé ; active les déclencheurs spéciaux pendant le chargement pour précalculer l'éclairage des garages.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/playerDriving.lua:315
---@param active boolean État d'activation.
function career_modules_playerDriving.onCareerActive(active) end

--- Hook de poursuite : désactive le suivi de stationnement au début, le réactive à reset/evade, et inflige une amende à l'arrestation (message UI).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/playerDriving.lua:262
---@param vehId integer Id du véhicule.
---@param action string start, reset, evade ou arrest.
---@param data table Données de poursuite (mode, uniqueOffensesCount).
function career_modules_playerDriving.onPursuitAction(vehId, action, data) end

--- Hook : quand le trafic et les voitures garées sont prêts, ferme l'écran de chargement careerVehicles et désactive les déclencheurs spéciaux ; pendant le tutoriel, les masque et mémorise leurs quantités.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/playerDriving.lua:283
function career_modules_playerDriving.onTrafficOrParkingReady() end

--- Hook : à l'activation du trafic, mémorise les quantités maximales et réinitialise l'état du joueur (hors tutoriel et mission).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/playerDriving.lua:245
function career_modules_playerDriving.onTrafficStarted() end

--- Hook : vide les données de trafic du joueur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/playerDriving.lua:258
function career_modules_playerDriving.onTrafficStopped() end

--- Hook de frame : vide en pratique (« career police logic » non implémentée).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/playerDriving.lua:309
---@param dtReal number Temps réel (s).
---@param dtSim number Temps simulé (s).
---@param dtRaw number Temps brut (s).
function career_modules_playerDriving.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook de stationnement : met playerData.isParked à true (événement valid) ou false (exit) pour le véhicule joueur, hors mission et tutoriel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/playerDriving.lua:233
---@param vehId integer Id du véhicule.
---@param data table Données d'événement (event).
function career_modules_playerDriving.onVehicleParkingStatus(vehId, data) end

--- Hook : met à jour les données du joueur pour le nouveau véhicule (hors tutoriel et mission).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/playerDriving.lua:303
---@param oldId integer Ancien véhicule.
---@param newId integer Nouveau véhicule.
function career_modules_playerDriving.onVehicleSwitched(oldId, newId) end

--- Indique si le joueur est poursuivi par la police (pursuit.mode différent de 0).
---Source : lua/ge/extensions/career/modules/playerDriving.lua:107
---@return boolean|nil  true si poursuite en cours, faux ou nil sinon.
function career_modules_playerDriving.playerPursuitActive() end

--- Recalcule les données du joueur pour le véhicule actuel, règle les variables du trafic, de la police (rayon d'arrestation 15, temps d'évasion 30) et du stationnement (précision 0.2), et remet à zéro le suivi de trafic du joueur.
---Source : lua/ge/extensions/career/modules/playerDriving.lua:111
function career_modules_playerDriving.resetPlayerState() end

--- Réactive le trafic si coupé, restaure les quantités actives mémorisées (ou celles des réglages si nulles) puis appelle setTrafficAfterTutorial.
---Source : lua/ge/extensions/career/modules/playerDriving.lua:141
function career_modules_playerDriving.restoreTrafficAfterTutorialPhase() end

--- Amène le véhicule favori de l'inventaire à la position du joueur : le téléporte s'il existe, sinon le fait apparaître s'il est accessible et n'a pas besoin de réparation.
---Source : lua/ge/extensions/career/modules/playerDriving.lua:157
function career_modules_playerDriving.retrieveFavoriteVehicle() end

--- Fin de phase tutoriel : disperse trafic et voitures garées, réinitialise l'état du joueur et met la probabilité de police à 0.15.
---Source : lua/ge/extensions/career/modules/playerDriving.lua:125
function career_modules_playerDriving.setTrafficAfterTutorial() end

--- Phase tutoriel : disperse les voitures garées et le trafic, masque les garées (quantité 0), règle le trafic actif sur maxTrafficAmount et met la police à 0.
---Source : lua/ge/extensions/career/modules/playerDriving.lua:117
function career_modules_playerDriving.setTrafficForTutorial() end

--- Oriente le joueur (mode marche) vers pos ; si un obstacle statique bloque la vue, joue un court trajet de caméra (5,5 s) qui montre la position puis revient à la caméra véhicule.
---Source : lua/ge/extensions/career/modules/playerDriving.lua:340
---@param pos vec3 Position à montrer.
function career_modules_playerDriving.showPosition(pos) end

--- Téléporte le véhicule au garage, annule la navigation de mission, coupe le contact, gère une éventuelle remorque (téléportation différée, puis suppression après mise à jour des conditions de pièces) et vérifie le carburant minimal.
---Source : lua/ge/extensions/career/modules/playerDriving.lua:205
---@param garageId string Identifiant du garage.
---@param veh userdata Objet véhicule.
---@param resetVeh boolean|nil Si vrai, réinitialise le véhicule à la téléportation.
function career_modules_playerDriving.teleportToGarage(garageId, veh, resetVeh) end

