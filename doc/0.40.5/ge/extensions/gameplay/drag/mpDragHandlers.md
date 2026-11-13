# `gameplay_drag_mpDragHandlers`

*Fichier : `lua/ge/extensions/gameplay/drag/mpDragHandlers.lua` · VM : Game Engine (GE) · 416 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drag_mpDragHandlers` : `extensions.load("gameplay_drag_mpDragHandlers")`, puis la globale `gameplay_drag_mpDragHandlers`

Table de dispatch des messages réseau du mode drag multijoueur. Le gamemode MP (multiplayer/gamemodes/drag) appelle handle(msgName, ...) à chaque message de session reçu ; selon le nom, le module met à jour l'état de course dans gameplay_drag_core (setRaceState, clearRaceState, setDragRaceData) et émet des hooks extensions.hook (onDragRaceStarted, onDragRaceTimerUpdated, onDragRaceTreeLights...). Certains messages ne sont traités que par l'hôte de session (finishTime, timerUpdateRequest, treeLightUpdate, stateRequest), les autres par tous les clients.

## Remarques

- Messages gérés : dragSessionStarted, dragRaceStarted, dragRaceCountdownStart, dragRaceStart, dragRacePlayerJoined, dragRaceTreeLights, dragRaceWinningLights, dragRaceTreeLightUpdate (hôte), dragRaceFinishTime (hôte), dragRaceTimerUpdate, dragRaceTimerUpdateRequest (hôte), dragRaceFinishTimeBroadcast, dragRaceReset, dragRaceCancelled, dragRaceRulesUpdate, dragRaceStateRequest (hôte).
- Le temps de fin d'un client est converti sur l'horloge de l'hôte via multiplayer_synclib.mapOtherClock ; si la synchro n'est pas calibrée ou l'extension absente, le temps brut est utilisé (warning dans le log). Temps écoulé = fin (horloge hôte) - syncRaceStart.
- Le paramètre bridge est l'interface du gamemode (isSessionHost, getRaceState, getTimerRecipientMPClientIds, sendToMPClientIds, getLocalMPPlayerId...) ; state contient dragRaces et localClientActiveRace.
- dragRaceRulesUpdate sauvegarde localement les règles via multiplayer.gamemodes.drag.util.presetManager (pcall) et met à jour dragType, treeType et importantTimerId de dragData.
- Les paramètres senderId, recpIds, packetClock, recvClock, msgNumber de handle ne sont pas utilisés.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drag_mpDragHandlers.handle(msgName, state, bridge, client, senderId, recpIds, data, packetClock, recvClock, msgNumber)` | Point d'entrée : cherche le handler du message msgName et l'appelle avec (state, bridge, client, senderId, recpIds, data). Les messages inconnus sont ignorés sans erreur. | 408 |

### Détail des paramètres

#### `gameplay_drag_mpDragHandlers.handle(msgName, state, bridge, client, senderId, recpIds, data, packetClock, recvClock, msgNumber)`

Point d'entrée : cherche le handler du message msgName et l'appelle avec (state, bridge, client, senderId, recpIds, data). Les messages inconnus sont ignorés sans erreur.

- `msgName` (*string*) : Nom du message (par ex. 'dragRaceStarted', 'dragRaceTimerUpdate').
- `state` (*table*) : État du gamemode MP (dragRaces, localClientActiveRace).
- `bridge` (*table*) : Interface du gamemode MP (session, réseau, état de course).
- `client` (*table|nil*) : Client émetteur (champ id).
- `senderId` (*any*) : Non utilisé.
- `recpIds` (*any*) : Non utilisé.
- `data` (*table*) : Charge utile du message (type, raceId, lane, lightState, timerName, timerValue...).
- `packetClock` (*number|nil*) : Non utilisé.
- `recvClock` (*number|nil*) : Non utilisé.
- `msgNumber` (*integer|nil*) : Non utilisé.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onDragRaceCancelled` — écouté par 1 module(s)
- `onDragRaceCountdownStart` — écouté par 1 module(s)
- `onDragRaceFinishTimesUpdated`
- `onDragRaceListChanged` — écouté par 2 module(s)
- `onDragRacePlayersUpdated` — écouté par 1 module(s)
- `onDragRaceReset` — écouté par 1 module(s)
- `onDragRaceStart` — écouté par 1 module(s)
- `onDragRaceStarted` — écouté par 2 module(s)
- `onDragRaceStateChanged` — écouté par 1 module(s)
- `onDragRaceTimerUpdated` — écouté par 2 module(s)
- `onDragRaceTimerValuesUpdated`
- `onDragRaceTreeLights` — écouté par 1 module(s)
- `onDragRaceWinningLights` — écouté par 1 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drag/mpDragHandlers.lua`.*
