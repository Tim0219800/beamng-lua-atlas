---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crawl/boundary.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestion de la limite de zone du mode « crawl » (franchissement lent). Il fait apparaître des drapeaux (TSStatic flagMarker.dae) le long du contour d'une zone, les anime (apparition avec mise à l'échelle et fondu, disparition en fondu) quand un crawler actif ou la caméra est à moins de visibilityRadius mètres, via un quadtree 2D, et vérifie si un crawler est sorti de la zone. Une sortie est enregistrée ; si le crawler s'éloigne d'au moins 10 m du point de sortie (tous les coins dehors), la pénalité 'dnf' est appliquée une seule fois via gameplay_crawl_utils.applyPenalty ; sinon onBoundaryViolation est appelé.
--- Accès : extension `gameplay_crawl_boundary` : `extensions.load("gameplay_crawl_boundary")`, puis la globale `gameplay_crawl_boundary`
---@class gameplay_crawl_boundary
gameplay_crawl_boundary = {}

--- Teste si un crawler est dans la zone (coins du véhicule ou centre de sa boîte). Enregistre le point de sortie, applique la pénalité 'dnf' (une fois) si tous les coins sont dehors à 10 m ou plus du point de sortie, ou signale une violation de limite.
---Source : lua/ge/extensions/gameplay/crawl/boundary.lua:318
---@param site table Zone avec la méthode containsPoint2D(pos).
---@param crawler table Crawler : id, dynamicData (currentCorners, bbCenter).
---@param crawlStates table<any, table> États des crawlers indexés par id (champ active).
---@return boolean  false si le crawler est inactif, disqualifié (DNF) ou si aucun site n'est donné ; true sinon.
function gameplay_crawl_boundary.checkBoundary(site, crawler, crawlStates) end

--- Supprime le groupe de marqueurs et vide le suivi.
---Source : lua/ge/extensions/gameplay/crawl/boundary.lua:306
function gameplay_crawl_boundary.cleanupBoundaryMarkers() end

--- Efface tous les points de sortie et drapeaux DNF.
---Source : lua/ge/extensions/gameplay/crawl/boundary.lua:431
function gameplay_crawl_boundary.clearAllExitPoints() end

--- Efface le point de sortie et le drapeau DNF d'un crawler.
---Source : lua/ge/extensions/gameplay/crawl/boundary.lua:422
---@param crawlerId any Id du crawler.
function gameplay_crawl_boundary.clearCrawlerExitPoint(crawlerId) end

--- Retourne le point où le crawler est sorti de la zone.
---Source : lua/ge/extensions/gameplay/crawl/boundary.lua:417
---@param crawlerId any Id du crawler.
---@return vec3|nil  Point de sortie, ou nil si le crawler est dans la zone.
function gameplay_crawl_boundary.getCrawlerExitPoint(crawlerId) end

--- Retourne l'état du quadtree pour le debug.
---Source : lua/ge/extensions/gameplay/crawl/boundary.lua:460
---@return table  {built, objectCount, bounds?} (voir notes sur objectCount).
function gameplay_crawl_boundary.getQuadtreeStats() end

--- Reconstruit le quadtree à partir des drapeaux suivis (utile si ces objets changent).
---Source : lua/ge/extensions/gameplay/crawl/boundary.lua:455
function gameplay_crawl_boundary.rebuildQuadtree() end

--- Cache tous les drapeaux suivis (hidden, échelle minimale, couleur transparente) puis vide la table de suivi.
---Source : lua/ge/extensions/gameplay/crawl/boundary.lua:189
function gameplay_crawl_boundary.resetBoundaryObjects() end

--- Règle les durées d'animation des drapeaux (valeurs par défaut si nil).
---Source : lua/ge/extensions/gameplay/crawl/boundary.lua:444
---@param duration number|nil Durée totale d'apparition (s), 0.5 par défaut.
---@param fadeIn number|nil Durée du fondu d'entrée (s), 0.3 par défaut.
---@param fadeOut number|nil Durée du fondu de sortie (s), 0.2 par défaut.
---@param scaleUp number|nil Durée de la montée en échelle (s), 0.4 par défaut.
function gameplay_crawl_boundary.setAnimationTiming(duration, fadeIn, fadeOut, scaleUp) end

--- Définit le rayon (m) dans lequel les drapeaux sont visibles.
---Source : lua/ge/extensions/gameplay/crawl/boundary.lua:438
---@param radius number|nil Rayon en mètres ; 200 si nil.
function gameplay_crawl_boundary.setVisibilityRadius(radius) end

--- Supprime les marqueurs précédents, puis crée des drapeaux le long du contour (un tous les spacing mètres, posés sur le terrain et orientés selon le segment) et construit le quadtree de visibilité. Les drapeaux démarrent cachés.
---Source : lua/ge/extensions/gameplay/crawl/boundary.lua:204
---@param boundary table Contour avec vertices (au moins 3), chacun avec pos (vec3) et éventuellement next.
---@param spacing number|nil Distance entre drapeaux en mètres (2.0 par défaut).
---@return integer|nil  Id du SimGroup de marqueurs ; nil si le contour est invalide.
function gameplay_crawl_boundary.spawnBoundaryMarkers(boundary, spacing) end

--- Relance l'animation d'apparition pour les drapeaux actuellement non cachés.
---Source : lua/ge/extensions/gameplay/crawl/boundary.lua:473
function gameplay_crawl_boundary.triggerAppearingAnimation() end

--- Met à jour la visibilité et l'animation des drapeaux de limite : ceux proches d'un crawler actif (ou de la caméra si aucun n'est actif) apparaissent, les autres disparaissent. À appeler à chaque image.
---Source : lua/ge/extensions/gameplay/crawl/boundary.lua:63
---@param dtSim number Delta temps simulation (s).
---@param crawlStates table<any, table>|nil États des crawlers (active, crawlerData.dynamicData.vehPos).
function gameplay_crawl_boundary.updateBoundaryAnimations(dtSim, crawlStates) end

