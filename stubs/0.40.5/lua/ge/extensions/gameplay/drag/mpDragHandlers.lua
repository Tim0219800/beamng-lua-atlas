---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/mpDragHandlers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Table de dispatch des messages réseau du mode drag multijoueur. Le gamemode MP (multiplayer/gamemodes/drag) appelle handle(msgName, ...) à chaque message de session reçu ; selon le nom, le module met à jour l'état de course dans gameplay_drag_core (setRaceState, clearRaceState, setDragRaceData) et émet des hooks extensions.hook (onDragRaceStarted, onDragRaceTimerUpdated, onDragRaceTreeLights...). Certains messages ne sont traités que par l'hôte de session (finishTime, timerUpdateRequest, treeLightUpdate, stateRequest), les autres par tous les clients.
--- Accès : extension `gameplay_drag_mpDragHandlers` : `extensions.load("gameplay_drag_mpDragHandlers")`, puis la globale `gameplay_drag_mpDragHandlers`
---@class gameplay_drag_mpDragHandlers
gameplay_drag_mpDragHandlers = {}

--- Point d'entrée : cherche le handler du message msgName et l'appelle avec (state, bridge, client, senderId, recpIds, data). Les messages inconnus sont ignorés sans erreur.
---Source : lua/ge/extensions/gameplay/drag/mpDragHandlers.lua:408
---@param msgName string Nom du message (par ex. 'dragRaceStarted', 'dragRaceTimerUpdate').
---@param state table État du gamemode MP (dragRaces, localClientActiveRace).
---@param bridge table Interface du gamemode MP (session, réseau, état de course).
---@param client table|nil Client émetteur (champ id).
---@param senderId any Non utilisé.
---@param recpIds any Non utilisé.
---@param data table Charge utile du message (type, raceId, lane, lightState, timerName, timerValue...).
---@param packetClock number|nil Non utilisé.
---@param recvClock number|nil Non utilisé.
---@param msgNumber integer|nil Non utilisé.
function gameplay_drag_mpDragHandlers.handle(msgName, state, bridge, client, senderId, recpIds, data, packetClock, recvClock, msgNumber) end

