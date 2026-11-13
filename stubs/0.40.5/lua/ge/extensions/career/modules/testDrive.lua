---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/testDrive.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Essai routier d'un véhicule chez un concessionnaire en carrière. start() fait monter le joueur dans le véhicule, crée un instantané des conditions de pièces (clé "beforeTestDrive"), désactive l'autosauvegarde et active l'essai. À chaque frame, onUpdate décompte le temps limite (timeLimit), vérifie que le joueur reste à moins de 10 m du véhicule (sinon abandon avec frais) et détecte les dégâts toutes les 2 s. stop() ramène le véhicule au point de départ avec un fondu et remet le joueur à pied.
--- Accès : extension `career_modules_testDrive` : `extensions.load("career_modules_testDrive")`, puis la globale `career_modules_testDrive`
---@class career_modules_testDrive
---@field dependencies table Table vide : aucune dépendance.
career_modules_testDrive = {}

--- Abandonne l'essai (sans effet si inactif) : désactive l'essai, réactive l'autosauvegarde, puis après 0,2 s affiche et paie les frais d'abandon éventuels, réinitialise les données et prévient inspectVehicle.
---Source : lua/ge/extensions/career/modules/testDrive.lua:217
function career_modules_testDrive.abandonTestDrive() end

--- Ajoute à elements le POI de fin d'essai (id testDrive-<concession>-<route>-parkingEnd, marqueur de parking et marqueur de grande carte) si un emplacement de fin existe et a été créé.
---Source : lua/ge/extensions/career/modules/testDrive.lua:279
---@param elements table[] Liste de POI bruts à compléter.
function career_modules_testDrive.formatTestDriveToRawPoi(elements) end

--- Temps restant de l'essai en secondes (nil s'il n'y a pas d'essai ou pas de limite).
---Source : lua/ge/extensions/career/modules/testDrive.lua:266
---@return number|nil  Secondes restantes.
function career_modules_testDrive.getTimeLeft() end

--- Indique si un essai est en cours.
---Source : lua/ge/extensions/career/modules/testDrive.lua:270
---@return boolean|nil  true si actif.
function career_modules_testDrive.isActive() end

--- Indique si des dégâts ont été détectés sur le véhicule pendant l'essai (détection par career_modules_insurance_insurance.genericVehNeedsRepair).
---Source : lua/ge/extensions/career/modules/testDrive.lua:274
---@return boolean  true si dégâts détectés.
function career_modules_testDrive.isDamageDetected() end

--- Hook avant l'ouverture du menu radial : une seule fois, ajoute une entrée « arrêter l'essai » (visible seulement pendant un essai) au menu rapide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/testDrive.lua:322
function career_modules_testDrive.onBeforeRadialOpened() end

--- Hook : réinitialise les données de l'essai à l'activation de la carrière.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/testDrive.lua:316
---@param active boolean Rien si false.
function career_modules_testDrive.onCareerActive(active) end

--- Hook de la liste de POI : ajoute le POI de fin d'essai via formatTestDriveToRawPoi.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/testDrive.lua:294
---@param levelIdentifier string Niveau (non utilisé).
---@param elements table[] Liste de POI à compléter.
function career_modules_testDrive.onGetRawPoiListForLevel(levelIdentifier, elements) end

--- Hook d'ouverture du détail d'un POI : si c'est le POI testDriveEnd, ajoute un bouton « arrêter l'essai » appelant stop(false).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/testDrive.lua:298
---@param elemData table[] Éléments du POI.
---@param promptData table[] Boutons à compléter.
function career_modules_testDrive.onPoiDetailPromptOpening(elemData, promptData) end

--- Hook de frame : si un essai est actif, gère le temps limite, l'éloignement du joueur et la détection de dégâts.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/testDrive.lua:252
---@param dtReal number Temps réel (s).
---@param dtSim number Temps de simulation (s).
---@param dtRaw number Temps brut (s).
function career_modules_testDrive.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook appelé après une réparation par l'assurance : affiche après 1,8 s le coût de la réparation (message temps réel et son d'achat).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/testDrive.lua:203
---@param amount number Montant de la réparation.
function career_modules_testDrive.onVehicleRepairedByInsurance(amount) end

--- Désactive l'essai et vide les POI bruts.
---Source : lua/ge/extensions/career/modules/testDrive.lua:55
function career_modules_testDrive.resetData() end

--- Démarre l'essai : copie testDriveInfo, fait monter le joueur dans le véhicule, mémorise sa position/rotation de départ, crée et sélectionne l'instantané de pièces beforeTestDrive, dégèle le véhicule, émet onTestDriveStarted, vide les POI bruts et désactive l'autosauvegarde.
---Source : lua/ge/extensions/career/modules/testDrive.lua:111
---@param _vehicleId integer Id d'objet du véhicule d'essai.
---@param testDriveInfo table Paramètres de l'essai (timeLimit, abandonFees, endParkingSpot, dealershipName, route...).
function career_modules_testDrive.start(_vehicleId, testDriveInfo) end

--- Termine l'essai normalement (sans effet si inactif) : réactive l'autosauvegarde et lance le job de fin qui téléporte le véhicule au départ avec fondu.
---Source : lua/ge/extensions/career/modules/testDrive.lua:207
---@param userAborted boolean|nil Émet onGameplayActivityAborted sauf si false.
function career_modules_testDrive.stop(userAborted) end

