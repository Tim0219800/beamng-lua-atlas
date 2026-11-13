---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/branches/landing.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fournit à l'UI carrière les données de la page d'accueil de progression (domaines, branches, compétences) : titres, fils d'Ariane, niveau/XP, déblocages, ligues et missions formatées. Ajoute aussi le bouton 'landing page APM' dans le menu ordinateur. Un moddeur l'utilise surtout pour comprendre le format des tables envoyées à l'écran career.branchPage.
--- Accès : extension `career_modules_branches_landing` : `extensions.load("career_modules_branches_landing")`, puis la globale `career_modules_branches_landing`
---@class career_modules_branches_landing
career_modules_branches_landing = {}

--- Formate un spot de drift comme une mission pour l'UI (skill 'drift', icône 'drift02', objectifs accomplis en étoiles par défaut).
---Source : lua/ge/extensions/career/modules/branches/landing.lua:482
---@param ds table Spot de drift (champs id, info, saveData).
---@return table  Entrée formatée pour l'UI.
function career_modules_branches_landing.formatDriftSpot(ds) end

--- Formate une mission pour l'UI : skill, id, icône, label, description, type, progression formatée, startable, aperçu, vignette, verrouillée (non visible) et canStartFromProgressScreen (déclencheur de type 'league').
---Source : lua/ge/extensions/career/modules/branches/landing.lua:457
---@param m table Mission (gameplay_missions_missions).
---@return table  Mission formatée pour l'UI.
function career_modules_branches_landing.formatMission(m) end

--- Renvoie les infos d'une carte de branche/compétence pour l'UI (nom, descriptions, niveau, libellé de niveau, niveau max atteint, débloquée, icône, couleur…). Appelle career_branches.checkUnlocks() au préalable.
---Source : lua/ge/extensions/career/modules/branches/landing.lua:342
---@param branchId string Id de la branche.
---@return table  branchInfo pour l'UI.
function career_modules_branches_landing.getBranchSkillCardData(branchId) end

--- Construit toute la table de la page de progression : heading, description, branches, breadcrumbs, et pour une branche : skillInfo, skills, leagues (missions formatées), isBranch.
---Source : lua/ge/extensions/career/modules/branches/landing.lua:603
---@param pathId string|nil Id du domaine/branche ; nil, '' ou 'undefined' pour la page racine.
---@return table  Données de la page pour l'UI.
function career_modules_branches_landing.getLandingPageData(pathId) end

--- Parcourt récursivement les branches/compétences du domaine (hors en développement) et renvoie jusqu'à deux missions suggérées : une jamais jouée (0 étoile) et une partiellement terminée (sinon une seconde jamais jouée).
---Source : lua/ge/extensions/career/modules/branches/landing.lua:578
---@param domainId string|nil Id du domaine ; 'apm' par défaut.
---@return table[]  Missions formatées suggérées.
function career_modules_branches_landing.getSuggestedMissionsForDomain(domainId) end

--- Hook de career_modules_computer : si la facilité a la fonction 'apmLandingPage', ajoute un bouton général qui navigue vers 'career.branchPage' (pathId 'apm', retour 'career.computer'), désactivé tant que le véhicule de départ n'est pas acheté.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/branches/landing.lua:739
---@param menuData table Données du menu (computerFacility, hasBoughtStarterVehicle…).
---@param computerFunctions table Table {general, vehicleSpecific} à compléter.
function career_modules_branches_landing.onComputerAddFunctions(menuData, computerFunctions) end

--- Ouvre la grande carte (freeroam_bigMapMode.enterBigMap) instantanément avec la mission sélectionnée, route de retour 'career.branchPage.bigmap'.
---Source : lua/ge/extensions/career/modules/branches/landing.lua:443
---@param missionId string Id de la mission à sélectionner.
function career_modules_branches_landing.openBigMapWithMissionSelected(missionId) end

--- Titre traduit d'une branche (branchHeading ou name) ; si absente ou manquante, renvoie le titre traduit de la page d'accueil (ui.career.landingPage.name).
---Source : lua/ge/extensions/career/modules/branches/landing.lua:594
---@param pathId string|nil Id de la branche.
---@return string  Titre traduit.
function career_modules_branches_landing.resolveBranchTitle(pathId) end

