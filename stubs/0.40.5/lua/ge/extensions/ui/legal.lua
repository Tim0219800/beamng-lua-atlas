---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/legal.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Vérifie si l'utilisateur a répondu à l'assistant de consentement en ligne (réglages `onlineFeatures` et `telemetry`, valeur "ask" = pas encore répondu). Sert au routeur d'UI pour interdire de quitter l'écran de consentement tant qu'il n'est pas validé.
--- Accès : extension `ui_legal` : `extensions.load("ui_legal")`, puis la globale `ui_legal`
---@class ui_legal
ui_legal = {}

--- Indique si la navigation hors de la route courante est permise : toujours true à l'intérieur de l'arbre de routes `legal.*` (pour finir l'assistant), sinon dépend de isOnlineConsentSet().
---Source : lua/ge/extensions/ui/legal.lua:35
---@param route table Route de l'UI (champ name de type « legal.xxx »).
---@return boolean  true si on peut quitter.
function ui_legal.canLeaveOnlineConsent(route) end

--- Renvoie true si telemetry et onlineFeatures sont tous deux différents de "ask". Effet de bord en menu simple : active les deux réglages et sauvegarde.
---Source : lua/ge/extensions/ui/legal.lua:18
---@return boolean  Consentement renseigné.
function ui_legal.isOnlineConsentSet() end

