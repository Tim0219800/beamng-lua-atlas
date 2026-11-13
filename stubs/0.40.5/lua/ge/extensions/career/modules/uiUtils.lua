---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/uiUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fonctions utilitaires pour l'interface de la carrière : données du bandeau de statut (argent, beamXP, bons, score d'assurance), statistiques simples par branche, boutons contextuels du menu pause de carrière, et niveau (map) courant. Appelé par les composants Vue (CareerStatus, CareerSimpleStats, menu pause).
--- Accès : extension `career_modules_uiUtils` : `extensions.load("career_modules_uiUtils")`, puis la globale `career_modules_uiUtils`
---@class career_modules_uiUtils
---@field dependencies string[] {"career_career"}.
career_modules_uiUtils = {}

--- Exécute la fonction du bouton de pause d'indice functionId, si elle existe.
---Source : lua/ge/extensions/career/modules/uiUtils.lua:58
---@param functionId integer Indice fourni par getCareerPauseContextButtons.
function career_modules_uiUtils.callCareerPauseContextButtons(functionId) end

--- Retourne l'entrée de core_levels.getList() correspondant au niveau chargé (comparaison en minuscules avec getCurrentLevelIdentifier()).
---Source : lua/ge/extensions/career/modules/uiUtils.lua:130
---@return table|nil  Informations du niveau, nil si introuvable.
function career_modules_uiUtils.getCareerCurrentLevelName() end

--- Construit la liste des boutons contextuels du menu pause de carrière (selon livraison, tutoriel, certification, essai routier) et les mémorise.
---Source : lua/ge/extensions/career/modules/uiUtils.lua:62
---@return table  {buttons = {...}}.
function career_modules_uiUtils.getCareerPauseContextButtons() end

--- Données du composant Vue CareerSimpleStats : nom de la sauvegarde et, pour chaque branche non-compétence, nom, libellé de niveau, valeur et bornes min/max du niveau.
---Source : lua/ge/extensions/career/modules/uiUtils.lua:21
---@return table  {saveSlotName, branches = {{name, levelLabel, min, value, max}, ...}}.
function career_modules_uiUtils.getCareerSimpleStats() end

--- Données du composant Vue CareerStatus : argent, beamXP, bons (vouchers) et score de conduite d'assurance.
---Source : lua/ge/extensions/career/modules/uiUtils.lua:10
---@return table  {money, beamXP, vouchers, insuranceScore}.
function career_modules_uiUtils.getCareerStatusData() end

--- Mémorise les fonctions des boutons de pause et leur affecte un functionId (indice) ; vide l'ancienne table.
---Source : lua/ge/extensions/career/modules/uiUtils.lua:51
---@param data table Table avec buttons (liste de {label, icon, fun, showIndicator}) ; chaque bouton reçoit functionId.
function career_modules_uiUtils.storeCareerPauseContextButtons(data) end

