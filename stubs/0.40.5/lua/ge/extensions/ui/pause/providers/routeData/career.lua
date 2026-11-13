---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/providers/routeData/career.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fournisseur de données du menu pause pour les écrans de carrière : progression (digest et missions APM suggérées), historique (financier, gameplay, jalons, journal de bord) et détail d'un historique. Les fonctions renvoient des tables décrivant le contenu (panneaux, composants Vue, rail de boutons) que l'UI pause affiche. Les données viennent de career_modules_playerAttributes, career_modules_milestones_milestones et career_career.
--- Accès : extension `ui_pause_providers_routeData_career` : `extensions.load("ui_pause_providers_routeData_career")`, puis la globale `ui_pause_providers_routeData_career`
---@class ui_pause_providers_routeData_career
---@field dependencies string[] {"career_career", "career_saveSystem"}
ui_pause_providers_routeData_career = {}

--- Renvoie les données de la page d'historique : un rail de quatre boutons (financier, gameplay, jalons avec indicateur s'il y en a de non réclamés, journal de bord) et les panneaux latéraux d'aperçu (5 dernières entrées, digest des jalons).
---Source : lua/ge/extensions/ui/pause/providers/routeData/career.lua:150
---@param context table Contexte du menu pause (champ lu : mode).
---@return table  {mode, heading, rail, focusSidePanelContents}
function ui_pause_providers_routeData_career.getCareerHistoryData(context) end

--- Renvoie la vue complète d'un historique (composant CareerHistoryDigest avec full = true), avec le titre fourni par career_modules_playerAttributes.getCareerHistoryInfo ou un titre par défaut.
---Source : lua/ge/extensions/ui/pause/providers/routeData/career.lua:200
---@param context table Contexte du menu pause (champ lu : mode).
---@param historyType string "financial" ou "gameplay".
---@return table  {mode, heading, mainCardClass, mainPanelContent}
function ui_pause_providers_routeData_career.getCareerHistoryDetailData(context, historyType) end

--- Renvoie les données de la page de progression : titre ui.career.landingPage.name, panneau principal (ProgressDigest, ApmSuggestedMissions) et panneaux latéraux ProgressDomainInfo pour les domaines apm, bmra, logistics et freestyle.
---Source : lua/ge/extensions/ui/pause/providers/routeData/career.lua:127
---@param context table Contexte du menu pause (champ lu : mode).
---@return table  {mode, heading, mainPanelContent, focusSidePanelContents}
function ui_pause_providers_routeData_career.getCareerProgressData(context) end

--- Indique si l'écran de progression de carrière est disponible : faux pendant le tutoriel de carrière, sinon vrai seulement si le véhicule de départ a été acheté.
---Source : lua/ge/extensions/ui/pause/providers/routeData/career.lua:26
---@return boolean|nil  Disponibilité (peut valoir nil si career_career est absent).
function ui_pause_providers_routeData_career.isCareerProgressAvailable() end

