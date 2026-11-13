---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crawl/freeroamMultiplayer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Intégration du crawl en freeroam multijoueur. Chargée par gameplay_crawl_general quand une session multijoueur commence (onMPSessionChanged), déchargée à sa fin. Elle affiche l'app « scoreboard » en haut à gauche et crée un tableau des scores (multiplayer_multiplayerScoreboard) avec une colonne de points de pénalité (tri croissant). Elle met à jour le score du joueur local, fait clignoter sa ligne en rouge (pénalité) ou vert (bonus) et indique la disqualification ou l'arrivée.
--- Accès : extension `gameplay_crawl_freeroamMultiplayer` : `extensions.load("gameplay_crawl_freeroamMultiplayer")`, puis la globale `gameplay_crawl_freeroamMultiplayer`
---@class gameplay_crawl_freeroamMultiplayer
gameplay_crawl_freeroamMultiplayer = {}

--- Hook appelé en cas de disqualification : statut « disqualified » dans le tableau et masquage de l'app scoreboard.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/freeroamMultiplayer.lua:38
function gameplay_crawl_freeroamMultiplayer.onCrawlDisqualified() end

--- Hook appelé quand le score de pénalité change : envoie la nouvelle valeur au tableau et fait clignoter la ligne du joueur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/freeroamMultiplayer.lua:22
---@param eventData table {penaltyScore, oldPenaltyScore}.
function gameplay_crawl_freeroamMultiplayer.onCrawlPenaltyScoreChanged(eventData) end

--- Hook appelé à l'affichage des résultats : pousse les points finaux et le statut « finishLine ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/freeroamMultiplayer.lua:45
---@param eventData table {points, time}.
function gameplay_crawl_freeroamMultiplayer.onCrawlResultsShown(eventData) end

--- Hook appelé au démarrage d'un crawl : affiche l'app scoreboard, crée un tableau des scores et pousse le score initial 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/freeroamMultiplayer.lua:9
---@param trail table Données de l'évènement ; son champ id sert d'identifiant du tableau (voir notes).
function gameplay_crawl_freeroamMultiplayer.onCrawlStarted(trail) end

