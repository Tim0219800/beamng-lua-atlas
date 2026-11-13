---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/snapshot.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sauvegarde et chargement de « snapshots » (position et rotation de caméra) via le service en ligne BeamNG (s2/v4/saveSnapshot et getSnapshot). Un snapshot peut être chargé depuis une commande de schéma d'URL (loadSnapshot). Émet les hooks onSnapshotCreate et onSnapshotLoad.
--- Accès : extension `core_snapshot` : `extensions.load("core_snapshot")`, puis la globale `core_snapshot`
---@class core_snapshot
core_snapshot = {}

--- Prévu pour construire les données de snapshot, émettre onSnapshotCreate(data) puis les envoyer au serveur avec core_online.apiCall('s2/v4/saveSnapshot'). Journalise l'id reçu ou une erreur.
---Source : lua/ge/extensions/core/snapshot.lua:27
---@param scheme any Non utilisé.
---@param saveToServer any Non utilisé.
function core_snapshot.createSnapshot(scheme, saveToServer) end

--- Télécharge le snapshot (s2/v4/getSnapshot) puis passe en caméra libre, place la caméra à data.camPos/camRot, émet onSnapshotLoad(data) et appelle changeMap() si core_modmanager.isReady().
---Source : lua/ge/extensions/core/snapshot.lua:43
---@param snapshotId string|number Identifiant du snapshot sur le serveur.
function core_snapshot.loadSnapshot(snapshotId) end

--- Hook appelé après rechargement. Restaure ignoreStartupCmd.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/snapshot.lua:68
---@param d table Table renvoyée par onSerialize.
function core_snapshot.onDeserialized(d) end

--- Hook appelé avant un rechargement des extensions Lua. Renvoie {ignoreStartupCmd = true}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/snapshot.lua:62
---@return table  État à conserver.
function core_snapshot.onSerialize() end

--- Hook appelé quand une commande de schéma d'URL arrive. Pour la commande "loadSnapshot", appelle loadSnapshot(data). Ignoré si isStartingArg et ignoreStartupCmd.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/snapshot.lua:54
---@param command string Nom de la commande.
---@param data any Argument de la commande (id du snapshot).
---@param isStartingArg boolean Vrai si la commande vient des arguments de lancement.
function core_snapshot.onSnapshotSchemeCommand(command, data, isStartingArg) end

