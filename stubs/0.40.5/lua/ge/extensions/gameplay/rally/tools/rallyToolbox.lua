---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outils de debug du rallye. Champs : rallyManager, race, recce, debugLogging, debug (options de dessin), vehiclePlacementActive, vehiclePlacementMessage, selectedPrefabId, _vpCache, ainsi que des IntPtr imgui pour les délais audio (cornerGapMsPtr, phraseGapMsPtr, linkWordGapMsPtr, pacenoteGapMsPtr) et la récupération (rallyRecoveryCorridorWidthPtr = 8, rallyRecoveryBackoffDistancePtr = 3).
---@class gameplay_rally_tools_rallyToolbox
local gameplay_rally_tools_rallyToolbox = {}

--- Annule le placement du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:386
function gameplay_rally_tools_rallyToolbox:_cancelVehiclePlacement() end

--- Vide le cache local des entrées du sélecteur de voicepack.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:117
function gameplay_rally_tools_rallyToolbox:_invalidateVoicepackCache() end

--- Téléporte le véhicule joueur 0 à la position donnée en conservant son orientation (spawn.safeTeleport, protégé par pcall).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:391
---@param pos vec3 Position monde.
---@return boolean  true si réussi.
---@return string|nil  Cause de l'échec.
function gameplay_rally_tools_rallyToolbox:_placeVehicleAt(pos) end

--- Fait apparaître un prefab dans MissionGroup (position 0 0 0) et le sélectionne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:489
---@param filepath string Chemin du fichier .prefab ou .prefab.json.
---@param ownerMissionId string|nil Id de mission pour nommer l'objet ; défaut mission du manager.
function gameplay_rally_tools_rallyToolbox:_spawnPrefab(filepath, ownerMissionId) end

--- Active le mode de placement du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:381
function gameplay_rally_tools_rallyToolbox:_startVehiclePlacement() end

--- Chaque image en mode placement : trace une sphère au point sous la souris (cameraMouseRayCast) et gère clic gauche (placer) et clic droit (annuler).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:414
function gameplay_rally_tools_rallyToolbox:_updateVehiclePlacementMode() end

--- Oublie les points de reconnaissance affichés (self.recce = nil).
---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:1076
function gameplay_rally_tools_rallyToolbox:clearReccePoints() end

--- Dessine toute la fenêtre (à appeler dans un im.Begin/im.End) : en-tête de mission, boutons de rechargement et sections.
---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:644
function gameplay_rally_tools_rallyToolbox:draw() end

--- Dessin 3D de debug selon self.debug : chemin et segments de la course, splits, lignes départ et arrivée, zone d'arrêt, notes d'allure, route de la driveline, suivi du véhicule, etc. Gère aussi le mode de placement du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:1195
function gameplay_rally_tools_rallyToolbox:drawDebug() end

--- Section « Rally Loop » : état de l'extension gameplay_rallyLoop, boutons Load, Unload et Toggle Loop Debug Window.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:255
function gameplay_rally_tools_rallyToolbox:drawLoopTools() end

--- Section « Prefabs » : boutons de spawn des prefabs de la mission et des boucles qui la contiennent, et suppression.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:562
function gameplay_rally_tools_rallyToolbox:drawPrefabTools() end

--- Section « Recovery » : largeur du couloir et distance de recul, cases (réparer le véhicule, marqueurs du suivi) et bouton « Run Recovery ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:287
---@param rm table RallyManager.
function gameplay_rally_tools_rallyToolbox:drawRallyRecoveryTools(rm) end

--- Section « Vehicle » avec bouton Place Vehicle / Cancel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:444
function gameplay_rally_tools_rallyToolbox:drawVehicleTools() end

--- Menu déroulant de voicepack avec cache d'entrées ; changer de voicepack vide les points de reconnaissance et appelle rm:reloadVoicepackAssets(pick, {writeSettings = false}). Bouton Refresh pour invalider les caches.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:150
---@param rm table RallyManager.
function gameplay_rally_tools_rallyToolbox:drawVoicepackPicker(rm) end

--- État du log de debug.
---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:137
---@return boolean  debugLogging.
function gameplay_rally_tools_rallyToolbox:getDebugLogging() end

--- Objet course courant de gameplay_rally (si l'extension est chargée), en colorant les segments du chemin pour le debug.
---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:216
---@return table|nil  Course.
function gameplay_rally_tools_rallyToolbox:getRace() end

--- Manager lié, sinon celui de gameplay_rally.getRallyManager().
---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:129
---@return table|nil  RallyManager.
function gameplay_rally_tools_rallyToolbox:getRallyManager() end

--- Constructeur : initialise tous les champs d'état et les options de dessin par défaut.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:41
function gameplay_rally_tools_rallyToolbox:init() end

--- Active ou coupe le log de debug.
---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:125
---@param debugLogging boolean Nouvelle valeur.
function gameplay_rally_tools_rallyToolbox:setDebugLogging(debugLogging) end

--- Active ou coupe le mode « souris comme véhicule » de la driveline route (la position sous la souris sert de position de véhicule).
---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:240
---@param enabled boolean true pour activer.
function gameplay_rally_tools_rallyToolbox:setMouseAsVehicleEnabled(enabled) end

--- Lie la fenêtre à un RallyManager et invalide le cache du sélecteur de voicepack.
---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:107
---@param rallyManager table|nil RallyManager.
function gameplay_rally_tools_rallyToolbox:setRallyManager(rallyManager) end

--- Inverse le mode « souris comme véhicule ».
---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:251
function gameplay_rally_tools_rallyToolbox:toggleMouseMovementCheckbox() end

