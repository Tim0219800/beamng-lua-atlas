---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorial/step09spmSignup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Étape 9 et dernière du tutoriel de carrière (« spmSignup ») : le joueur accède à l'ordinateur du garage, signe le contrat d'embauche (popup de contrat, prime de départ de 10 000), ouvre la boutique de véhicules, choisit un vendeur, ouvre l'écran d'achat et achète son premier véhicule. À l'ajout au inventaire, la popup v2/careerUnlocked s'affiche, puis career_modules_tutorial.endTutorial() est appelé. Le véhicule du tutoriel est supprimé à l'ouverture de l'écran d'achat.
--- Accès : extension `career_modules_tutorial_step09spmSignup` : `extensions.load("career_modules_tutorial_step09spmSignup")`, puis la globale `career_modules_tutorial_step09spmSignup`
---@class career_modules_tutorial_step09spmSignup
career_modules_tutorial_step09spmSignup = {}

--- Supprime marqueur et son d'argent, vide zones, reset et liste de tâches.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step09spmSignup.lua:291
function career_modules_tutorial_step09spmSignup.cleanup() end

--- Hook émis quand le bon de contrat est utilisé : crédite la prime de départ.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step09spmSignup.lua:202
function career_modules_tutorial_step09spmSignup.onCareerTutorialRedeemedContractVoucher() end

--- Hook émis à l'ouverture du menu de l'ordinateur : valide l'objectif et ouvre la popup de signature du contrat (utilisateur = profil courant).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step09spmSignup.lua:171
function career_modules_tutorial_step09spmSignup.onComputerMenuOpened() end

--- Affiche la phase et un bouton « Skip Step 9 » (valide tous les objectifs et ouvre la popup careerUnlocked).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step09spmSignup.lua:305
---@param im table Table ui_imgui.
function career_modules_tutorial_step09spmSignup.onDebugMenu(im) end

--- Ajoute à la liste de POI l'ordinateur du garage (facilité servicestationGarageComputer) pendant l'étape 09spmSignup.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step09spmSignup.lua:283
---@param elements table Liste de POI à compléter.
function career_modules_tutorial_step09spmSignup.onGetRawPoiListForTutorial(elements) end

--- Hook de fermeture de popup : contractSign (prime + succès), v2/apmOnboarding (objectif d'ouverture du marché) et v2/careerUnlocked (succès puis fin du tutoriel).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step09spmSignup.lua:207
---@param id string Id de la popup.
function career_modules_tutorial_step09spmSignup.onIntroPopupCareerClosed(id) end

--- Appelé chaque frame (phase waitComputer) : masque le marqueur d'entrée à moins de 3 m et efface le tracé de guidage à moins de 1 m du point de départ de marche.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step09spmSignup.lua:186
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta simulation (s).
---@param dtRaw number Delta brut (s).
function career_modules_tutorial_step09spmSignup.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook émis quand un véhicule est ajouté à l'inventaire : désactive zones et reset, valide l'objectif final et affiche la popup v2/careerUnlocked.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step09spmSignup.lua:266
---@param data any Données du véhicule ajouté (non utilisées).
function career_modules_tutorial_step09spmSignup.onVehicleAddedToInventory(data) end

--- Hook émis à l'ouverture de la boutique de véhicules : valide l'objectif et demande de choisir un vendeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step09spmSignup.lua:235
---@param data any Données du menu (non utilisées).
function career_modules_tutorial_step09spmSignup.onVehicleShoppingMenuOpened(data) end

--- Hook émis à l'ouverture de l'écran d'achat : supprime le véhicule du tutoriel et affiche la popup v2/vehiclePurchaseAndInsurance.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step09spmSignup.lua:253
---@param data any Données du menu (non utilisées).
function career_modules_tutorial_step09spmSignup.onVehicleShoppingPurchaseMenuOpened(data) end

--- Hook émis quand le vendeur sélectionné change : valide l'objectif et demande d'ouvrir l'achat.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step09spmSignup.lua:244
---@param payload any Données du changement (non utilisées).
function career_modules_tutorial_step09spmSignup.onVehicleShoppingSelectedSellerIdChanged(payload) end

--- Appelé à l'activation : remet les objectifs à zéro, active la zone garageBounds, récupère les places garageInteriorWalkStart et garageEntranceMarker, affiche l'objectif « accéder à l'ordinateur » et le marqueur d'entrée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step09spmSignup.lua:146
---@param stepData any Données de l'étape (non utilisées).
function career_modules_tutorial_step09spmSignup.setup(stepData) end

