---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorialPopups.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère les popups d'introduction (tutoriel et aides contextuelles) de la carrière : mémorise lesquelles ont déjà été vues (drapeaux sauvegardés dans <profil>/career/tutorialData.json), les ouvre via ui_popup depuis /gameplay/tutorials/pages/, et met en file d'attente celles qui arriveraient pendant une popup « véhicule endommagé » du tutoriel. Expose aussi des fonctions nommées (showWelcomeSplashscreen, onCareerTuningStarted, onEnterCargoOverviewScreen…) qui servent de hooks ou d'appels directs pour afficher la popup associée une seule fois.
--- Accès : extension `career_modules_tutorialPopups` : `extensions.load("career_modules_tutorialPopups")`, puis la globale `career_modules_tutorialPopups`
---@class career_modules_tutorialPopups
---@field allTutorialFlags string[] Liste des ids de popups connus (welcome, driving, crashRecover, bigmap, refueling, missions, tuning, insurance, leagues, etc.).
---@field dependencies string[] {'ui_popup', 'gameplay_tutorial_damageTracker'}.
career_modules_tutorialPopups = {}

--- Dessine le menu imgui de debug « Intro Popups » : tout revoir, tout marquer non vu, cases à cocher par popup, bouton d'édition du contenu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorialPopups.lua:236
function career_modules_tutorialPopups.drawDebugFunctions() end

--- Lit le drapeau d'une popup (true si vue).
---Source : lua/ge/extensions/career/modules/tutorialPopups.lua:24
---@param key string Id de la popup.
---@return boolean|nil  Valeur du drapeau.
function career_modules_tutorialPopups.getTutorialFlag(key) end

--- Ouvre une popup d'intro. Sans force, ne fait rien si elle a déjà été vue. Peut être mise en attente après une popup de dégâts du tutoriel.
---Source : lua/ge/extensions/career/modules/tutorialPopups.lua:83
---@param id string Id de la page (ex. "v2/basicControls").
---@param force boolean|nil Si vrai, ignore le drapeau « déjà vue ».
function career_modules_tutorialPopups.introPopup(id, force) end

--- Ouvre plusieurs popups à la suite (ui_popup.openPopupsByIds) et marque tous les ids comme vus.
---Source : lua/ge/extensions/career/modules/tutorialPopups.lua:105
---@param ids string[] Ids de pages.
---@param force boolean|nil Si faux ou nil, ne marque que les pages non encore vues ; la séquence est ouverte dans tous les cas.
function career_modules_tutorialPopups.introPopupSequence(ids, force) end

--- Hook de chargement : lit les drapeaux depuis tutorialData.json du profil courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorialPopups.lua:41
function career_modules_tutorialPopups.onExtensionLoaded() end

--- Hook émis à la fermeture d'une popup : si c'est une popup de dégâts, marque la fermeture, puis rouvre la première popup en attente.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorialPopups.lua:71
---@param id string Id de la popup fermée.
function career_modules_tutorialPopups.onIntroPopupCareerClosed(id) end

--- Hook de sauvegarde du profil : écrit les drapeaux dans tutorialData.json.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorialPopups.lua:47
---@param currentSavePath string Dossier de sauvegarde du profil.
function career_modules_tutorialPopups.onSaveCurrentProfile(currentSavePath) end

--- Remplace la table complète des drapeaux « popup vue ».
---Source : lua/ge/extensions/career/modules/tutorialPopups.lua:20
---@param flagsTable table<string, boolean>|nil Nouvelle table ; nil donne une table vide.
function career_modules_tutorialPopups.setFlagsTable(flagsTable) end

--- Met à jour le drapeau d'une popup.
---Source : lua/ge/extensions/career/modules/tutorialPopups.lua:28
---@param key string Id de la popup.
---@param value boolean Vue ou non.
function career_modules_tutorialPopups.setTutorialFlag(key, value) end

--- Remet tous les drapeaux à false puis ré-affiche toutes les popups d'accueil et toutes les popups de la table interne (utile pour revoir les aides).
---Source : lua/ge/extensions/career/modules/tutorialPopups.lua:186
function career_modules_tutorialPopups.showAllSplashscreensAndLogbookEntries() end

--- Affiche (forcées) les popups d'accueil sans tutoriel : welcomeNoTutorial, leagues, performanceIndex, logbook.
---Source : lua/ge/extensions/career/modules/tutorialPopups.lua:171
function career_modules_tutorialPopups.showNonTutorialWelcomeSplashscreen() end

--- Indique si toutes les popups listées ont déjà été vues.
---Source : lua/ge/extensions/career/modules/tutorialPopups.lua:32
---@param pages string[]|nil Ids de popups.
---@return boolean  true si toutes ont leur drapeau (true aussi pour une liste vide).
function career_modules_tutorialPopups.wasIntroPopupsSeen(pages) end

