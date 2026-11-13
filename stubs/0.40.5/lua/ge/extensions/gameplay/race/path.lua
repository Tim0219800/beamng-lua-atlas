---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/race/path.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Chemin de course. Champs principaux : id, name, description, authors, date, difficulty (24 par défaut), defaultLaps (1), config (résultat d'autoConfig), simplifyAiPath, hideMission, isReversed, aiPath, aiDetailedPath, aiPathDistance.
---@class gameplay_race_path
local gameplay_race_path = {}

--- Construit la configuration automatique dans self.config : à partir du startNode, graphe des segments (successeurs, prédécesseurs, lastInLap, targetNode, segments visibles suivants), indicateurs branching et closed, liste linearPathnodes pour un parcours non branché, et pacenotes associés à chaque segment (segmentToPacenotes).
---Source : lua/ge/extensions/gameplay/race/path.lua:57
function gameplay_race_path:autoConfig() end

--- Appelle autoConfig et renvoie la classification du chemin : départ lancé autorisé, inversible, fermé, branché.
---Source : lua/ge/extensions/gameplay/race/path.lua:606
---@return table  {allowRollingStart, reversible, closed, branching}
function gameplay_race_path:classify() end

--- Prévu pour dupliquer le chemin ; cassé dans cette version (voir notes).
---Source : lua/ge/extensions/gameplay/race/path.lua:382
---@return table  Nouveau chemin (en théorie).
function gameplay_race_path:copy() end

--- Dessine le chemin détaillé de l'IA (sphères de 1 m et prismes colorés) s'il existe.
---Source : lua/ge/extensions/gameplay/race/path.lua:222
function gameplay_race_path:drawAiRouteDebug() end

--- Dessine pathnodes, segments, positions de départ et pacenotes.
---Source : lua/ge/extensions/gameplay/race/path.lua:215
---@param drawMode string|nil Mode de dessin des pathnodes ('none', 'faded', 'normal', 'highlight').
function gameplay_race_path:drawDebug(drawMode) end

--- Ids des segments valides dont le départ vaut from et/ou l'arrivée vaut to (nil = pas de filtre).
---Source : lua/ge/extensions/gameplay/race/path.lua:194
---@param from integer|nil Id du pathnode de départ.
---@param to integer|nil Id du pathnode d'arrivée.
---@return integer[]  Ids de segments.
function gameplay_race_path:findSegments(from, to) end

--- Cherche une position de départ par son nom.
---Source : lua/ge/extensions/gameplay/race/path.lua:311
---@param name string Nom.
---@return table|nil  startPosition trouvée.
function gameplay_race_path:findStartPositionByName(name) end

--- Réinitialise le chemin à partir d'objets de scène (CameraBookmark/waypoints) : un pathnode par objet (rayon = plus grande échelle, normale si directionalWaypoint), segments dans l'ordre.
---Source : lua/ge/extensions/gameplay/race/path.lua:427
---@param list userdata[] Objets de scène (checkpoints).
---@param closed boolean|nil true pour un circuit fermé.
function gameplay_race_path:fromCheckpointList(list, closed) end

--- Réinitialise le chemin et le construit à partir d'une liste de checkpoints d'un ancien scénario (positions lues dans le scénario actif extensions.scenario_scenarios), reliés dans l'ordre par des segments ; le dernier rejoint le premier si closed.
---Source : lua/ge/extensions/gameplay/race/path.lua:399
---@param lapConfig string[] Noms de checkpoints.
---@param closed boolean|nil true pour un circuit fermé.
function gameplay_race_path:fromLapConfig(lapConfig, closed) end

--- Réinitialise le chemin à partir d'une description de track (ancien format) : ligne de départ/arrivée, lapConfig, préfabs optionnels (auto-détectés _forward et _reverse), segments, métadonnées et positions de départ des sphères d'apparition.
---Source : lua/ge/extensions/gameplay/race/path.lua:469
---@param trackInfo table Données du track (originalInfo.lapConfig, startLineCheckpoint, finishLineCheckpoint, closed, spawnSpheres, prefabs, lapCount…).
---@param usePrefabs boolean|nil true pour faire apparaître temporairement les préfabs pendant la conversion.
---@return boolean|nil  true si réussi, nil si un checkpoint est introuvable.
function gameplay_race_path:fromTrack(trackInfo, usePrefabs) end

--- Calcule le chemin IA à partir de la configuration : liste des nœuds de route (noms) proches de chaque pathnode, puis chemin détaillé via le module route. Renvoie deux tables vides si la configuration n'est pas prête. S'arrête aux branchements.
---Source : lua/ge/extensions/gameplay/race/path.lua:245
---@return string[]  Noms de nœuds de route (chemin de base).
---@return table[]  Chemin détaillé (points avec pos et wp).
function gameplay_race_path:getAiPath() end

--- Dernier pathnode de la liste triée.
---Source : lua/ge/extensions/gameplay/race/path.lua:638
---@return table|nil  Pathnode.
function gameplay_race_path:getLastPathnode() end

--- Renvoie un identifiant unique croissant pour les objets du chemin.
---Source : lua/ge/extensions/gameplay/race/path.lua:7
---@return integer  Nouvel id.
function gameplay_race_path:getNextUniqueIdentifier() end

--- Constructeur / réinitialisation : valeurs par défaut, collections vides. L'argument name est ignoré.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/race/path.lua:14
---@param name string|nil Ignoré.
function gameplay_race_path:init(name) end

--- Restaure le chemin à partir de données sérialisées (vide puis recrée collections, convertit les ids avec une table oldIdMap).
---Source : lua/ge/extensions/gameplay/race/path.lua:352
---@param data table|nil Données de onSerialize.
function gameplay_race_path:onDeserialized(data) end

--- Sérialise le chemin en table JSON (métadonnées, collections, ids de départ/arrivée, préfabs, classification, options).
---Source : lua/ge/extensions/gameplay/race/path.lua:320
---@return table  Données JSON.
function gameplay_race_path:onSerialize() end

--- Recrée les segments en reliant les pathnodes dans l'ordre trié.
---Source : lua/ge/extensions/gameplay/race/path.lua:629
function gameplay_race_path:recalculateSegments() end

--- Inverse le sens du chemin : permute startNode et endNode, inverse from/to des segments, bascule isReversed.
---Source : lua/ge/extensions/gameplay/race/path.lua:389
function gameplay_race_path:reverse() end

