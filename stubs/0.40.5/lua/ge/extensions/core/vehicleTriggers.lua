---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicleTriggers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère l'interaction du joueur avec les triggers de véhicule (poignées de porte, capot, etc. définis dans le JBeam) : lancer de rayon depuis le curseur ou le réticule, survol, affichage du réticule et des libellés d'action dans l'interface, puis exécution des liens d'action (inputActions du véhicule ou actions communes) quand le joueur appuie sur triggerAction0/1/2. Gère aussi le mode écran partagé (un rayon par joueur) et active ou désactive le système de rendu des triggers côté C++ (VehicleTrigger). Un moddeur s'en sert surtout pour déclencher un trigger par script (triggerEvent), tester si l'interaction est possible (isEnabled) ou écouter les hooks onVehicleTriggerActionLabel et onVehicleTriggersExecuteLink.
--- Accès : extension `core_vehicleTriggers` : `extensions.load("core_vehicleTriggers")`, puis la globale `core_vehicleTriggers`
---@class core_vehicleTriggers
---@field dependencies string[] Extensions chargées avant celle-ci : core_vehicle_triggerLabelPlacement et core_input_actionFilter.
core_vehicleTriggers = {}

--- Désactive le mode debug des triggers : décharge l'extension core_vehicleTriggersDebug (sans effet si déjà désactivé).
---Source : lua/ge/extensions/core/vehicleTriggers.lua:1557
function core_vehicleTriggers.disableDebugUI() end

--- Active le mode debug : met state.debugEnabled à true et charge l'extension core_vehicleTriggersDebug (fenêtre « Vehicle event debug »). Active aussi des logs supplémentaires lors de l'exécution des liens.
---Source : lua/ge/extensions/core/vehicleTriggers.lua:1553
function core_vehicleTriggers.enableDebugUI() end

--- Position du curseur dans la zone cliente de la fenêtre, en fraction de 0 à 1.
---Source : lua/ge/extensions/core/vehicleTriggers.lua:357
---@return table|nil  {x, y} entre 0 et 1, ou nil si la position n'est pas disponible.
function core_vehicleTriggers.getCursorPercent01() end

--- Distance maximale du lancer de rayon pour un joueur : 3 m pour un marcheur (unicycle) ou une caméra d'occupant, 50 m sinon.
---Source : lua/ge/extensions/core/vehicleTriggers.lua:420
---@param player integer|nil Index du joueur (0 par défaut).
---@return number  Distance en mètres.
function core_vehicleTriggers.getTriggerRaycastDistance(player) end

--- Indique si l'interaction avec les triggers est autorisée à cet instant (voir notes) et met à jour state.allowInteraction.
---Source : lua/ge/extensions/core/vehicleTriggers.lua:788
---@return boolean  true si l'interaction est autorisée.
function core_vehicleTriggers.isEnabled() end

--- Appelé par les actions d'entrée triggerAction0, 1 et 2. Au relâchement (valeur 0) relâche le trigger tenu ; sinon fait un lancer de rayon pour le joueur, et exécute les liens du trigger touché via triggerEvent. Mémorise le trigger tenu tant que la touche reste appuyée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleTriggers.lua:1517
---@param actionNumber integer Numéro d'action (0, 1 ou 2) ; devient la chaîne 'action0', etc.
---@param inputValue number Valeur de l'entrée (0 = relâché, non nul = appuyé).
---@param player integer|nil Index du joueur (0 par défaut).
---@return boolean|nil  false si l'interaction est désactivée, true si aucun trigger n'est touché, sinon nil.
function core_vehicleTriggers.onActionEvent(actionNumber, inputValue, player) end

--- Hook appelé quand l'interface CEF est affichée ou masquée. Mémorise l'état ; si elle est masquée, retire les action maps VehicleInteraction et cache le réticule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleTriggers.lua:1544
---@param cefVisible boolean true si l'interface est visible.
function core_vehicleTriggers.onCefVisibilityChanged(cefVisible) end

--- Hook appelé quand la visibilité du curseur change ; le curseur est considéré visible en permanence si VehicleTrigger.debug est actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleTriggers.lua:720
---@param visible boolean true si le curseur est visible.
function core_vehicleTriggers.onCursorVisibilityChanged(visible) end

--- Hook appelé après un rechargement des extensions : efface les masques de joueur de l'action map et restaure l'état debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleTriggers.lua:1570
---@param data table|nil Données renvoyées par onSerialize ({debugEnabled}).
function core_vehicleTriggers.onDeserialized(data) end

--- Hook appelé au déchargement : retire les action maps d'interaction, efface les masques et coupe VehicleTrigger.renderingEnabled et VehicleTrigger.enabled.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleTriggers.lua:1577
function core_vehicleTriggers.onExtensionUnloaded() end

--- Hook appelé quand les assignations d'entrées changent : force le recalcul du joueur qui contrôle la souris.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleTriggers.lua:1584
function core_vehicleTriggers.onInputBindingsChanged() end

--- Hook appelé quand la souris est verrouillée ou libérée (ex. caméra libre) ; une souris verrouillée désactive l'interaction.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleTriggers.lua:725
---@param locked boolean true si la souris est verrouillée.
function core_vehicleTriggers.onMouseLocked(locked) end

--- Hook appelé avec les périphériques classés par activité récente ; le dernier périphérique non clavier du joueur de la souris (souris ou manette) décide s'il vise au curseur ou au réticule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleTriggers.lua:1590
---@param recentDevices string[] Noms de périphériques, le plus récent en premier.
function core_vehicleTriggers.onRecentDevicesChanged(recentDevices) end

--- Hook appelé avant un rechargement des extensions : retire les action maps et le réticule, renvoie {debugEnabled}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleTriggers.lua:1561
---@return table  {debugEnabled = boolean}
function core_vehicleTriggers.onSerialize() end

--- Hook appelé quand la disposition de l'écran partagé change : vide les caches de centres et de rectangles de vue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleTriggers.lua:1261
function core_vehicleTriggers.onSplitScreenLayoutChanged() end

--- Hook appelé à chaque image. Rafraîchit le contexte, calcule si l'interaction est permise, active ou coupe VehicleTrigger (enabled, renderingEnabled, proximityRenderingEnabled), cherche le trigger survolé, met à jour libellés, légende des touches, délai du réticule et flux UI. En écran partagé, délègue à une version par joueur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleTriggers.lua:1382
---@param dtReal number Temps réel écoulé (s).
---@param dtSim number Temps de simulation écoulé (s).
---@param dtRaw number Temps brut écoulé (s).
function core_vehicleTriggers.onUpdate(dtReal, dtSim, dtRaw) end

--- Exécute tous les liens associés à l'action d'un trigger dans vdata.triggerEventLinksDict[triggerId][actionStr]. Chaque lien déclenche le hook onVehicleTriggersExecuteLink puis une commande d'entrée véhicule ou une action commune. Ne fait rien si le trigger ou l'action n'a pas de lien.
---Source : lua/ge/extensions/core/vehicleTriggers.lua:1488
---@param actionStr string Nom de l'action : 'action0', 'action1' ou 'action2'.
---@param actionValue number Valeur envoyée (1 = appui, 0 = relâchement).
---@param triggerId string|integer Identifiant du trigger dans le JBeam (déduit du code : clé de triggerEventLinksDict).
---@param vehicleId integer Identifiant de l'objet véhicule.
---@param vdata table Données du véhicule (core_vehicle_manager.getVehicleData(id).vdata) contenant triggerEventLinksDict et inputActions.
---@param player integer|nil Index du joueur à l'origine de l'action.
function core_vehicleTriggers.triggerEvent(actionStr, actionValue, triggerId, vehicleId, vdata, player) end

--- Variante de triggerEvent qui retrouve elle-même vdata à partir de vehicleId. Appelée par le C++ (typiquement manettes de réalité virtuelle).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleTriggers.lua:1509
---@param actionNum integer Numéro d'action (0, 1 ou 2).
---@param actionValue number Valeur envoyée.
---@param triggerId string|integer Identifiant du trigger.
---@param vehicleId integer Identifiant du véhicule.
---@param player integer|nil Index du joueur.
function core_vehicleTriggers.triggerEventWithoutVdata(actionNum, actionValue, triggerId, vehicleId, player) end

--- Projette une position monde sur l'écran avec la caméra active, en fraction 0 à 1 (origine en haut à gauche).
---Source : lua/ge/extensions/core/vehicleTriggers.lua:396
---@param worldPos vec3 Position monde.
---@param out table|nil Table réutilisée pour le résultat (créée si absente).
---@return table|nil  {x, y} ; nil si le point est derrière la caméra ou si le contexte caméra est indisponible.
function core_vehicleTriggers.worldPosToScreenPercent01(worldPos, out) end

