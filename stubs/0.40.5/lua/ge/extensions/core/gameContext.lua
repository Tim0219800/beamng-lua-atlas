---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/gameContext.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_gameContext` : petit relais vers `gameplay_markerInteraction` (contexte de jeu courant) et vers l'UI (changement de mission en avant-plan). Fournit aussi le libellé d'avertissement « expérimental » affiché pour la carrière et les missions de rallye.
--- Accès : extension `core_gameContext` : `extensions.load("core_gameContext")`, puis la globale `core_gameContext`
---@class core_gameContext
core_gameContext = {}

--- Renvoie le contexte de jeu fourni par gameplay_markerInteraction.getGameContext(...) en chargeant l'extension si besoin.
---Source : lua/ge/extensions/core/gameContext.lua:7
---@param ... any Arguments transmis tels quels à gameplay_markerInteraction.getGameContext.
---@return table  Contexte de jeu, ou {} si l'extension est indisponible.
function core_gameContext.getGameContext(...) end

--- Clé de traduction du bandeau « expérimental » : 'ui.rally.experimentalWarning' si la mission de premier plan est de type rallyStage, rallyLoop ou rallyLoop2 et que le réglage rallyHideExperimentalBanner est faux ; 'ui.career.experimentalWarning' si la carrière est active ; sinon nil.
---Source : lua/ge/extensions/core/gameContext.lua:25
---@return string|nil  Clé de traduction ou nil.
function core_gameContext.getWIPWarningLabel() end

--- Hook appelé quand l'état d'une mission change : transmet à l'UI l'évènement guihooks 'onAnyMissionChanged' (state, id de la mission).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/gameContext.lua:21
---@param state string Nouvel état de la mission (valeur définie par le gestionnaire de missions).
---@param mission table|nil Mission concernée ; seul mission.id est envoyé.
function core_gameContext.onAnyMissionChanged(state, mission) end

--- Ne fait rien (fonction vide).
---Source : lua/ge/extensions/core/gameContext.lua:17
function core_gameContext.toggleMenues() end

