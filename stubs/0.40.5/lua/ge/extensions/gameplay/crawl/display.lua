---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crawl/display.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Affichage des messages à l'écran du mode crawl. Chaque fonction showXxxMessage envoie une notification traduite (clés ui.crawl.*) via ui_message, ou via guihooks.trigger('Message') ciblé sur le panneau d'un joueur en écran partagé (multiseat). Il gère les messages de pénalité, de point de passage, de fin, de disqualification et de DNF. Les catégories de pénalité ne sont affichées que si le crawler a des pénalités (gameplay_crawl_utils.hasPenalties).
--- Accès : extension `gameplay_crawl_display` : `extensions.load("gameplay_crawl_display")`, puis la globale `gameplay_crawl_display`
---@class gameplay_crawl_display
gameplay_crawl_display = {}

--- Efface le message d'attente de disqualification.
---Source : lua/ge/extensions/gameplay/crawl/display.lua:188
---@param crawlerId integer|nil Id du véhicule.
function gameplay_crawl_display.clearDisqualifiedWaitingMessage(crawlerId) end

--- Efface le message de points.
---Source : lua/ge/extensions/gameplay/crawl/display.lua:156
---@param crawlerId integer|nil Id du véhicule.
function gameplay_crawl_display.clearPointsMessage(crawlerId) end

--- Hook appelé à la fin d'un crawl : appelle setCrawlUILayout(false) (sans effet).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/display.lua:133
function gameplay_crawl_display.onCrawlComplete() end

--- Hook appelé à l'affichage des résultats : corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/display.lua:137
function gameplay_crawl_display.onCrawlResultsShown() end

--- Hook appelé au démarrage d'un crawl : journalise et appelle setCrawlUILayout (sans effet).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/display.lua:128
function gameplay_crawl_display.onCrawlStarted() end

--- Hook appelé au chargement : corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/display.lua:141
function gameplay_crawl_display.onExtensionLoaded() end

--- Hook appelé au déchargement : oublie les joueurs mémorisés pour les messages.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/display.lua:145
function gameplay_crawl_display.onExtensionUnloaded() end

--- Affiche le message de point de passage bonus.
---Source : lua/ge/extensions/gameplay/crawl/display.lua:212
---@param penaltyPoints number Points (bonus) à afficher.
---@param crawlerId integer|nil Id du véhicule.
function gameplay_crawl_display.showBonusCheckpointMessage(penaltyPoints, crawlerId) end

--- Affiche le message de sortie de zone avec la pénalité boundaryViolation.
---Source : lua/ge/extensions/gameplay/crawl/display.lua:208
---@param crawlerId integer|nil Id du véhicule.
function gameplay_crawl_display.showBoundaryViolationMessage(crawlerId) end

--- Affiche « crawl terminé », puis (10 s) le temps et les points si le crawler a des pénalités.
---Source : lua/ge/extensions/gameplay/crawl/display.lua:160
---@param time number Temps en secondes (affiché avec 3 décimales).
---@param points number Points de pénalité.
---@param crawlerId integer|nil Id du véhicule.
function gameplay_crawl_display.showCrawlCompletedMessage(time, points, crawlerId) end

--- Affiche le message d'abandon (DNF).
---Source : lua/ge/extensions/gameplay/crawl/display.lua:220
---@param crawlerId integer|nil Id du véhicule.
function gameplay_crawl_display.showDNFMessage(crawlerId) end

--- Affiche le message de disqualification.
---Source : lua/ge/extensions/gameplay/crawl/display.lua:179
---@param eventData table|integer Soit une table avec crawlerId, soit directement l'id du véhicule.
function gameplay_crawl_display.showDisqualifiedMessage(eventData) end

--- Affiche le message d'attente après disqualification (600 s).
---Source : lua/ge/extensions/gameplay/crawl/display.lua:184
---@param crawlerId integer|nil Id du véhicule.
function gameplay_crawl_display.showDisqualifiedWaitingMessage(crawlerId) end

--- Affiche l'avertissement de conduite en marche arrière avec la pénalité drivingBackwards.
---Source : lua/ge/extensions/gameplay/crawl/display.lua:192
---@param crawlerId integer|nil Id du véhicule.
function gameplay_crawl_display.showDrivingBackwardsMessage(crawlerId) end

--- Affiche le message de porte franchie proprement.
---Source : lua/ge/extensions/gameplay/crawl/display.lua:216
---@param penaltyPoints number Points à afficher.
---@param crawlerId integer|nil Id du véhicule.
function gameplay_crawl_display.showGateClearedMessage(penaltyPoints, crawlerId) end

--- Affiche « porte atteinte » (ui.crawl.gateReached).
---Source : lua/ge/extensions/gameplay/crawl/display.lua:171
---@param crawlerId integer|nil Id du véhicule.
function gameplay_crawl_display.showGateReachedMessage(crawlerId) end

--- Affiche le total de points de pénalité (durée 600 s, catégorie 'points'), sauf si l'on est hôte d'une session multijoueur.
---Source : lua/ge/extensions/gameplay/crawl/display.lua:150
---@param points number Points de pénalité.
---@param crawlerId integer|nil Id du véhicule concerné.
function gameplay_crawl_display.showPointsMessage(points, crawlerId) end

--- Affiche le nombre de points de passage sautés et la pénalité (skippedCount × infractionPoints.skippedCheckpoint).
---Source : lua/ge/extensions/gameplay/crawl/display.lua:167
---@param skippedCount integer Nombre de points de passage sautés.
---@param crawlerId integer|nil Id du véhicule.
function gameplay_crawl_display.showSkippedCheckpointsMessage(skippedCount, crawlerId) end

--- Affiche le message de démarrage du crawl.
---Source : lua/ge/extensions/gameplay/crawl/display.lua:175
---@param crawlerId integer|nil Id du véhicule.
function gameplay_crawl_display.showStartedCrawlMessage(crawlerId) end

--- Affiche le message de véhicule remis sur les roues avec la pénalité vehicleFlippedUpright.
---Source : lua/ge/extensions/gameplay/crawl/display.lua:196
---@param crawlerId integer|nil Id du véhicule.
function gameplay_crawl_display.showVehicleFlippedUprightMessage(crawlerId) end

--- Affiche le message de récupération du véhicule ; la pénalité affichée est infractionPoints.vehicleReset (pas de clé vehicleRecovered).
---Source : lua/ge/extensions/gameplay/crawl/display.lua:204
---@param crawlerId integer|nil Id du véhicule.
function gameplay_crawl_display.showVehicleRecoveredMessage(crawlerId) end

--- Affiche le message de réinitialisation du véhicule avec la pénalité vehicleReset.
---Source : lua/ge/extensions/gameplay/crawl/display.lua:200
---@param crawlerId integer|nil Id du véhicule.
function gameplay_crawl_display.showVehicleResetMessage(crawlerId) end

