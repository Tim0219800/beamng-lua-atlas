---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crawl/debug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre de debug ImGui « Crawl Debug Window » du mode crawl, réservée aux développeurs (désactivée par défaut). Une fois activée, elle affiche pour le premier crawler actif : infos du parcours, position et vitesse du véhicule, statut dans la zone, points de pénalité (seuil DNF à 50), cooldowns d'infractions, point de récupération, point de sortie de zone (DNF à 10 m), liste des noeuds avec temps, journal des 20 derniers évènements et statut du parcours. Les données viennent de gameplay_crawl_utils.getCrawlState.
--- Accès : extension `gameplay_crawl_debug` : `extensions.load("gameplay_crawl_debug")`, puis la globale `gameplay_crawl_debug`
---@class gameplay_crawl_debug
---@field dependencies table<integer, string> Extensions chargées avant : {'ui_imgui'}.
gameplay_crawl_debug = {}

--- Vide les données affichées.
---Source : lua/ge/extensions/gameplay/crawl/debug.lua:351
function gameplay_crawl_debug.clearDebugData() end

--- Indique si la fenêtre de debug est activée.
---Source : lua/ge/extensions/gameplay/crawl/debug.lua:347
---@return boolean  État.
function gameplay_crawl_debug.getEnableDebugWindow() end

--- Hook appelé à la fin d'un crawl : marque les données comme terminées (isFinished).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/debug.lua:292
---@param eventData table Données de l'évènement (non utilisées).
function gameplay_crawl_debug.onCrawlComplete(eventData) end

--- Hook appelé en cas de disqualification : marque les données comme terminées et disqualifiées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/debug.lua:299
---@param eventData table Données de l'évènement (non utilisées).
function gameplay_crawl_debug.onCrawlDisqualified(eventData) end

--- Hook appelé au début d'un crawl : ouvre la fenêtre si le debug est activé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/debug.lua:285
---@param eventData table Données de l'évènement (non utilisées).
function gameplay_crawl_debug.onCrawlStarted(eventData) end

--- Hook appelé au chargement de l'extension : réinitialise l'état de la fenêtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/debug.lua:307
function gameplay_crawl_debug.onExtensionLoaded() end

--- Hook appelé au déchargement de l'extension : réinitialise l'état de la fenêtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/debug.lua:313
function gameplay_crawl_debug.onExtensionUnloaded() end

--- Hook appelé avant le rendu : met à jour les données depuis le premier crawler actif et dessine la fenêtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/debug.lua:319
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulation (s).
---@param dtRaw number Delta temps brut (s).
function gameplay_crawl_debug.onPreRender(dtReal, dtSim, dtRaw) end

--- Active ou désactive la fenêtre de debug ; la désactivation la ferme et vide les données.
---Source : lua/ge/extensions/gameplay/crawl/debug.lua:338
---@param enabled boolean true pour activer.
function gameplay_crawl_debug.setEnableDebugWindow(enabled) end

