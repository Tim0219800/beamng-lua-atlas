---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/milestones/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire des « jalons généraux » (milestones) de la carrière. À l'activation de la carrière, il collecte via le hook onGeneralMilestonesCollect les configurations fournies par les sous-systèmes (generalMilestones/*), initialise leur sauvegarde ({claimedStep, notificationStep}) dans career_modules_milestones_milestones.saveData.general, puis appelle onGeneralMilestonesSetupCallbacks. Il construit l'entrée d'UI de chaque jalon (getMilestone) et gère la réclamation des récompenses (claim).
--- Accès : extension `career_modules_milestones_general` : `extensions.load("career_modules_milestones_general")`, puis la globale `career_modules_milestones_general`
---@class career_modules_milestones_general
---@field dependencies table<integer, string> Extensions chargées avant : career_modules_milestones_milestones.
career_modules_milestones_general = {}

--- Réclame le palier courant du jalon : somme les récompenses de getRewards(claimedStep), les crédite, incrémente claimedStep, appelle le hook onGeneralMilestoneClaimed(config) et affiche un toast de succès.
---Source : lua/ge/extensions/career/modules/milestones/general.lua:47
---@param id string Identifiant du jalon.
function career_modules_milestones_general.claim(id) end

--- Construit la fiche UI du jalon pour le palier suivant : label, description, barre de progression, récompenses, claimable (valeur >= cible), claimFunction et claimRefreshFunction. Si tous les paliers sont faits (maxStep dépassé), renvoie une fiche completed = true.
---Source : lua/ge/extensions/career/modules/milestones/general.lua:69
---@param id string Identifiant du jalon.
---@return table  Fiche de jalon pour l'interface.
function career_modules_milestones_general.getMilestone(id) end

--- Hook : réinitialise et recollecte les configurations de jalons (hook onGeneralMilestonesCollect), crée les données de sauvegarde manquantes (avertit si claimedStep absent) et appelle le hook onGeneralMilestonesSetupCallbacks.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/milestones/general.lua:16
---@param active boolean Rien si false.
function career_modules_milestones_general.onCareerActive(active) end

--- Hook de la liste de jalons : ajoute à list la fiche de chaque jalon dont le filter contient l'un des filtres demandés (tous si filtre vide).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/milestones/general.lua:131
---@param list table[] Liste à compléter.
---@param filter string[]|nil Identifiants de filtres demandés.
function career_modules_milestones_general.onGetMilestones(list, filter) end

--- Outil de debug : exporte tous les paliers (id, step, nom, description, cible, deux premières récompenses) dans milestones.csv.
---Source : lua/ge/extensions/career/modules/milestones/general.lua:151
function career_modules_milestones_general.printDebug() end

