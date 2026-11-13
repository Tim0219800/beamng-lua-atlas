---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Marqueur crawl avec flèche, drapeaux et colonne.
---@class scenario_raceMarkers_crawlMarker
local scenario_raceMarkers_crawlMarker = {}

--- Cache les objets du marqueur dans les vues d'écran partagé des autres joueurs que renderViewPlayer.
---Source : lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua:454
function scenario_raceMarkers_crawlMarker:applyRenderViewMask() end

--- Supprime les objets créés (en effaçant leur masque de vue).
---Source : lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua:518
function scenario_raceMarkers_crawlMarker:clearMarkers() end

--- Supprime les anciens objets puis crée flèche, deux drapeaux et colonne.
---Source : lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua:488
function scenario_raceMarkers_crawlMarker:createMarkers() end

--- Crée un TSStatic caché enregistré sous objectName.
---Source : lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua:466
---@param shapeName string Chemin du modèle.
---@param objectName string Nom d'enregistrement.
---@return table  L'objet créé.
function scenario_raceMarkers_crawlMarker:createObject(shapeName, objectName) end

--- Dessine un cercle sur la minicarte à la position du marqueur, avec la couleur du mode.
---Source : lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua:394
---@param td any Contexte de dessin (non utilisé).
function scenario_raceMarkers_crawlMarker:drawOnMinimap(td) end

--- Appelle setVisibility(false).
---Source : lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua:436
function scenario_raceMarkers_crawlMarker:hide() end

--- Constructeur : initialise l'état, les lisseurs et les couleurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua:91
---@param id integer Identifiant unique.
function scenario_raceMarkers_crawlMarker:init(id) end

--- Place les deux drapeaux de part et d'autre de la position selon pathDirection, au sol.
---Source : lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua:163
function scenario_raceMarkers_crawlMarker:placeFlags() end

--- Change de mode : affiche (sauf 'hidden'), mémorise l'ancien mode et relance le fondu ; ne fait rien de plus si le mode est inchangé.
---Source : lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua:401
---@param mode string default, inactive, current, recovery, bonus, skipped, final, finished ou hidden.
function scenario_raceMarkers_crawlMarker:setMode(mode) end

--- Réserve ce marqueur à la vue d'un joueur (nil pour tous) et applique le masque.
---Source : lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua:461
---@param player integer|nil Indice du joueur.
function scenario_raceMarkers_crawlMarker:setRenderViewPlayer(player) end

--- Place le marqueur sur un checkpoint et réinitialise les caches de hauteur.
---Source : lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua:346
---@param wp table {pos, radius?, fadeNear?, fadeFar?, delay?, dir?, nextPos?}.
function scenario_raceMarkers_crawlMarker:setToCheckpoint(wp) end

--- Affiche ou cache flèche, drapeaux et colonne.
---Source : lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua:419
---@param v boolean Visibilité.
function scenario_raceMarkers_crawlMarker:setVisibility(v) end

--- Appelle setVisibility(true).
---Source : lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua:437
function scenario_raceMarkers_crawlMarker:show() end

--- Appel par image : couleur, alpha selon la distance, orientation et hauteur de la flèche, échelle, colonne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua:185
---@param dt number Durée réelle (s).
---@param dtSim number Durée simulée (s).
function scenario_raceMarkers_crawlMarker:update(dt, dtSim) end

