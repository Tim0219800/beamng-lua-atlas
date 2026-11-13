---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/transcripts/vehicleSnapshot.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instantané de véhicule. Champs initialisés : path, id, name, sortOrder, pos, quat, steering, timestamp, cornerCall (les cinq derniers à nil).
---@class gameplay_rally_transcripts_vehicleSnapshot
local gameplay_rally_transcripts_vehicleSnapshot = {}

--- Constructeur appelé par la fonction retournée par le module. Mémorise le chemin parent, prend l'id fourni ou un nouvel id via path:getNextUniqueIdentifier(), et nomme l'objet `t_<id>` par défaut.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/transcripts/vehicleSnapshot.lua:7
---@param path table Objet chemin de transcriptions (doit fournir getNextUniqueIdentifier).
---@param name string|nil Nom ; défaut `t_<id>`.
---@param forceId integer|nil Id imposé (par exemple lors d'un chargement).
function gameplay_rally_transcripts_vehicleSnapshot:init(path, name, forceId) end

--- Restauration depuis les données sauvegardées. Ne fait rien dans cette version.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/transcripts/vehicleSnapshot.lua:33
---@param data table Données sauvegardées.
---@param oldIdMap table Table de correspondance des anciens ids.
function gameplay_rally_transcripts_vehicleSnapshot:onDeserialized(data, oldIdMap) end

--- Renvoie une table {oldId, name, text} pour la sauvegarde.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/transcripts/vehicleSnapshot.lua:22
---@return table  Données sérialisables (text vaut nil, voir notes).
function gameplay_rally_transcripts_vehicleSnapshot:onSerialize() end

