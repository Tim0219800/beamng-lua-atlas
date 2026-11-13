---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/transcripts/entry.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Transcription. Champs : path, id, name, sortOrder (999999), show (true), text, success, src, file, beamng_file, timestamp, vehicle_data, grouped_captures.
---@class gameplay_rally_transcripts_entry
local gameplay_rally_transcripts_entry = {}

--- Données de captures de braquage associées (vehicle_data.capture_data).
---Source : lua/ge/extensions/gameplay/rally/transcripts/entry.lua:61
---@return table|nil  {captures, cornerAnglesStyle} ou nil.
function gameplay_rally_transcripts_entry:capture_data() end

--- Texte affiché au-dessus de la voiture de debug : text, suivi de « (click to copy) » au survol.
---Source : lua/ge/extensions/gameplay/rally/transcripts/entry.lua:43
---@param hovered boolean true si la souris survole l'entrée.
---@return string  Texte à dessiner.
function gameplay_rally_transcripts_entry:debugDrawText(hovered) end

--- Dessine la voiture de debug puis, si survolée ou sélectionnée, les captures de braquage.
---Source : lua/ge/extensions/gameplay/rally/transcripts/entry.lua:249
---@param is_hovered boolean Survolée.
---@param is_selected boolean Sélectionnée.
function gameplay_rally_transcripts_entry:drawDebug(is_hovered, is_selected) end

--- Pour une entrée survolée ou sélectionnée : sphère de rayon 0,5 colorée par angle pour chaque capture et étiquette de l'appel de virage par groupe.
---Source : lua/ge/extensions/gameplay/rally/transcripts/entry.lua:331
---@param is_hovered boolean Survolée.
---@param is_selected boolean Sélectionnée.
function gameplay_rally_transcripts_entry:drawDebugCaptureData(is_hovered, is_selected) end

--- Dessine une voiture stylisée (prisme carré + 4 sphères de roues) à la position/orientation enregistrées, avec le texte de la transcription.
---Source : lua/ge/extensions/gameplay/rally/transcripts/entry.lua:254
---@param is_hovered boolean Survolée.
---@param is_selected boolean Sélectionnée.
function gameplay_rally_transcripts_entry:drawDebugVehicleData(is_hovered, is_selected) end

--- Regroupe les captures consécutives qui ont le même appel de virage (ex. « 3L », « C »). Trie les angles du style choisi, leur attribue un dégradé rouge-jaune-vert (blanc pour le centre), calcule pour chaque capture un champ calc {angle_pct, angle_data, cornerCallStr}, et fixe un point d'étiquette au milieu de chaque groupe. Résultat mis en cache.
---Source : lua/ge/extensions/gameplay/rally/transcripts/entry.lua:95
---@return table[]|nil  Liste de groupes {captures, label_point, calc} ; nil sans capture_data.
function gameplay_rally_transcripts_entry:get_grouped_captures() end

--- Constructeur : id imposé ou fourni par path:getNextUniqueIdentifier(), nom par défaut `t_<id>`, affichage actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/transcripts/entry.lua:11
---@param path table Chemin de transcriptions parent.
---@param name string|nil Nom ; défaut `t_<id>`.
---@param forceId integer|nil Id imposé.
function gameplay_rally_transcripts_entry:init(path, name, forceId) end

--- Vrai si la transcription a des données véhicule et est affichée.
---Source : lua/ge/extensions/gameplay/rally/transcripts/entry.lua:39
---@return boolean|nil  Valeur truthy si utilisable.
function gameplay_rally_transcripts_entry:isUsable() end

--- Centre la caméra de l'éditeur sur la position du véhicule (rallyUtil.setCameraTarget).
---Source : lua/ge/extensions/gameplay/rally/transcripts/entry.lua:523
function gameplay_rally_transcripts_entry:lookAtMe() end

--- Restaure les champs avec des valeurs par défaut (chaînes vides, 0.0, table vide). show est forcé à false si la position du véhicule est absente.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/transcripts/entry.lua:233
---@param data table Données sauvegardées.
---@param oldIdMap table Correspondance des anciens ids (non utilisée).
function gameplay_rally_transcripts_entry:onDeserialized(data, oldIdMap) end

--- Renvoie {oldId, name, show, text, success, src, file, beamng_file, timestamp, vehicle_data}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/transcripts/entry.lua:215
---@return table  Données sérialisables.
function gameplay_rally_transcripts_entry:onSerialize() end

--- Construit un parcours caméra (1 m au-dessus de chaque capture, FOV 60, temps relatif au premier ts, corrige le signe des quaternions) et le joue via core_paths.playPath.
---Source : lua/ge/extensions/gameplay/rally/transcripts/entry.lua:517
function gameplay_rally_transcripts_entry:playCameraPath() end

--- Fixe l'indicateur d'affichage.
---Source : lua/ge/extensions/gameplay/rally/transcripts/entry.lua:35
---@param val boolean true pour afficher.
function gameplay_rally_transcripts_entry:setShow(val) end

--- Inverse l'indicateur d'affichage show.
---Source : lua/ge/extensions/gameplay/rally/transcripts/entry.lua:31
function gameplay_rally_transcripts_entry:toggleShow() end

--- Position du véhicule lors de la transcription.
---Source : lua/ge/extensions/gameplay/rally/transcripts/entry.lua:51
---@return vec3|nil  Position monde, ou nil si absente.
function gameplay_rally_transcripts_entry:vehiclePos() end

--- Orientation du véhicule lors de la transcription.
---Source : lua/ge/extensions/gameplay/rally/transcripts/entry.lua:56
---@return quat|nil  Quaternion, ou nil si absent.
function gameplay_rally_transcripts_entry:vehicleQuat() end

