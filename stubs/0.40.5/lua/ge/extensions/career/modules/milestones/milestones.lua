---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/milestones/milestones.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module central des jalons (milestones) de la carrière : sauvegarde (milestones.json), liste agrégée pour l'UI via le hook onGetMilestones, réclamation de récompenses (une par une ou toutes), compteur de jalons non réclamés et notifications. Fournit aussi des fonctions de récompense et des couleurs communes aux sous-systèmes (generalMilestones/*).
--- Accès : extension `career_modules_milestones_milestones` : `extensions.load("career_modules_milestones_milestones")`, puis la globale `career_modules_milestones_milestones`
---@class career_modules_milestones_milestones
---@field colorGeneralGray string Couleur CSS var(--bng-cool-gray-700-rgb).
---@field colorMissionBlue string Couleur CSS var(--bng-add-blue-500-rgb).
---@field colorOrange string Couleur CSS var(--bng-orange-500-rgb).
---@field saveData table Données sauvegardées : general (par id : claimedStep, notificationStep) et unclaimedMilestonesCount.
career_modules_milestones_milestones = {}

--- Réclame le jalon repéré par son claimId (index dans la dernière liste). Exécute sa claimFunction, met à jour les fonctions de refresh et notifie l'UI (milestoneClaimed avec replacementEntry).
---Source : lua/ge/extensions/career/modules/milestones/milestones.lua:47
---@param id integer claimId de la liste courante.
---@param noGuiEvent boolean|nil Si vrai, n'envoie pas l'événement UI.
---@return table|nil  Nouvelle fiche du jalon (palier suivant) ou nil.
function career_modules_milestones_milestones.claim(id, noGuiEvent) end

--- Réclame tous les jalons claimable de la liste complète, relance getMilestones et envoie guihooks allMilestonesClaimed.
---Source : lua/ge/extensions/career/modules/milestones/milestones.lua:67
---@return {claimed: integer, unclaimedMilestonesCount: integer}  Nombre réclamé et compteur restant.
function career_modules_milestones_milestones.claimAllUnclaimed() end

--- Collecte les jalons via le hook onGetMilestones(list, filter), attribue les claimId, compte les jalons réclamables et renvoie la liste avec les filtres disponibles.
---Source : lua/ge/extensions/career/modules/milestones/milestones.lua:89
---@param filter string[]|nil Filtres (general, mission, branch, delivery, money, speedTrap, insurance, all…).
---@return {list: table[], filters: string[]}  Fiches et clés de filtres triées.
function career_modules_milestones_milestones.getMilestones(filter) end

--- Charge saveData depuis career/milestones.json du profil courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/milestones/milestones.lua:136
function career_modules_milestones_milestones.loadSaveData() end

--- Fonction de récompense : 250 * (step + 1) en argent.
---Source : lua/ge/extensions/career/modules/milestones/milestones.lua:186
---@param step integer Indice de palier (à partir de 0).
---@return {attributeKey: string, rewardAmount: number}[]  Une récompense money.
function career_modules_milestones_milestones.majorLinear(step) end

--- Affiche un toast « jalon atteint » (label chaîne ou {txt, context}) et incrémente unclaimedMilestonesCount. Prévu pour être éventuellement différé pendant une mission.
---Source : lua/ge/extensions/career/modules/milestones/milestones.lua:122
---@param label string|table Texte ou table de traduction {txt, context}.
function career_modules_milestones_milestones.milestoneReached(label) end

--- Fonction de récompense : 100 * (step + 1) en argent.
---Source : lua/ge/extensions/career/modules/milestones/milestones.lua:185
---@param step integer Indice de palier (à partir de 0).
---@return {attributeKey: string, rewardAmount: number}[]  Une récompense money.
function career_modules_milestones_milestones.minorLinear(step) end

--- Hook : affiche un toast si des jalons sont non réclamés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/milestones/milestones.lua:169
---@param active boolean Rien si false.
function career_modules_milestones_milestones.onCareerActive(active) end

--- Hook : charge saveData si la carrière est déjà active (renvoie false sinon).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/milestones/milestones.lua:145
function career_modules_milestones_milestones.onExtensionLoaded() end

--- Hook vide (stub) ; l'ajout des fiches est fait par milestones/general.lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/milestones/milestones.lua:112
---@param list table[] Liste à compléter.
function career_modules_milestones_milestones.onGetMilestones(list) end

--- Cycle de vie du routeur UI : appelle onPauseEnter de ui_pause_routeLifecycleCallbacks s'il existe et ajoute data.milestones.filterOptions.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/milestones/milestones.lua:218
---@param context any Contexte du routeur.
---@param toRoute any Route cible.
---@param fromRoute any Route précédente.
---@param data table routeData.
function career_modules_milestones_milestones.onMilestonesRouteEnter(context, toRoute, fromRoute, data) end

--- Cycle de vie du routeur UI : appelle onPauseMount puis ajoute data.milestones.filterOptions (options de filtre traduites).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/milestones/milestones.lua:223
---@param context any Contexte du routeur.
---@param toRoute any Route cible.
---@param fromRoute any Route précédente.
---@param data table routeData.
function career_modules_milestones_milestones.onMilestonesRouteMount(context, toRoute, fromRoute, data) end

--- Hook de sauvegarde : écrit saveData dans <save>/career/milestones.json.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/milestones/milestones.lua:150
---@param currentSavePath string Dossier de sauvegarde.
function career_modules_milestones_milestones.onSaveCurrentProfile(currentSavePath) end

--- Envoie getMilestones(filter) à l'UI via guihooks milestonesData.
---Source : lua/ge/extensions/career/modules/milestones/milestones.lua:116
---@param filter string[]|nil Filtres.
function career_modules_milestones_milestones.requestMilestones(filter) end

--- Nombre de jalons atteints et non réclamés.
---Source : lua/ge/extensions/career/modules/milestones/milestones.lua:155
---@return integer  Compteur sauvegardé.
function career_modules_milestones_milestones.unclaimedMilestonesCount() end

