---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceMarkers/zoneAttention.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Marqueur de zone dessiné par debug.
---@class scenario_raceMarkers_zoneAttention
local scenario_raceMarkers_zoneAttention = {}

--- Efface la table d'identifiants.
---Source : lua/ge/extensions/scenario/raceMarkers/zoneAttention.lua:153
function scenario_raceMarkers_zoneAttention:clearMarkers() end

--- Conservé pour la compatibilité d'API : ne crée aucun objet.
---Source : lua/ge/extensions/scenario/raceMarkers/zoneAttention.lua:149
function scenario_raceMarkers_zoneAttention:createMarkers() end

--- Appelle setVisibility(false).
---Source : lua/ge/extensions/scenario/raceMarkers/zoneAttention.lua:145
function scenario_raceMarkers_zoneAttention:hide() end

--- Constructeur : initialise l'état (invisible, mode 'hidden', couleur bleue).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceMarkers/zoneAttention.lua:12
---@param id integer Identifiant unique.
function scenario_raceMarkers_zoneAttention:init(id) end

--- Règle l'état du compte à rebours qui pilote la couleur.
---Source : lua/ge/extensions/scenario/raceMarkers/zoneAttention.lua:130
---@param remaining number|nil Temps restant.
---@param total number|nil Durée totale.
---@param done boolean|nil true quand le compte est terminé (couleur orange foncé).
function scenario_raceMarkers_zoneAttention:setCountdown(remaining, total, done) end

--- Règle la hauteur de la clôture dessinée.
---Source : lua/ge/extensions/scenario/raceMarkers/zoneAttention.lua:126
---@param h number|nil Hauteur en mètres ; nil garde la valeur actuelle.
function scenario_raceMarkers_zoneAttention:setFenceHeight(h) end

--- 'hidden' masque, autre mode affiche.
---Source : lua/ge/extensions/scenario/raceMarkers/zoneAttention.lua:113
---@param mode string Nom du mode.
function scenario_raceMarkers_zoneAttention:setMode(mode) end

--- Marque la zone comme « montante » : couleur orange foncé.
---Source : lua/ge/extensions/scenario/raceMarkers/zoneAttention.lua:136
---@param v boolean État.
function scenario_raceMarkers_zoneAttention:setRising(v) end

--- Associe la zone à dessiner, ou une simple position si wp n'est pas une zone.
---Source : lua/ge/extensions/scenario/raceMarkers/zoneAttention.lua:84
---@param wp table Objet zone {drawDebug, vertices, center?}, ou {zone = ...}, ou {pos, radius}.
function scenario_raceMarkers_zoneAttention:setToCheckpoint(wp) end

--- Active ou désactive le dessin.
---Source : lua/ge/extensions/scenario/raceMarkers/zoneAttention.lua:141
---@param v boolean Visibilité.
function scenario_raceMarkers_zoneAttention:setVisibility(v) end

--- Appelle setVisibility(true).
---Source : lua/ge/extensions/scenario/raceMarkers/zoneAttention.lua:146
function scenario_raceMarkers_zoneAttention:show() end

--- Appel par image : calcule la couleur cible (bleue, dégradé jaune vers orange pendant le compte à rebours, orange foncé si rising ou terminé), la lisse puis dessine la zone.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceMarkers/zoneAttention.lua:34
---@param dt number Durée réelle (s).
---@param dtSim number Durée simulée (s).
function scenario_raceMarkers_zoneAttention:update(dt, dtSim) end

