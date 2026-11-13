---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/transcripts/path.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Chemin de transcriptions. Champs : fname, selection_sphere_r (4), _draw_debug_hover_tsc_id, transcripts (sortedList d'entrées).
---@class gameplay_rally_transcripts_path
local gameplay_rally_transcripts_path = {}

--- Point d'entrée du dessin de debug ; appelle drawDebugTranscripts.
---Source : lua/ge/extensions/gameplay/rally/transcripts/path.lua:75
---@param selected_id integer|nil Id de l'entrée sélectionnée.
function gameplay_rally_transcripts_path:drawDebug(selected_id) end

--- Appelle drawDebug(is_hovered, is_selected) sur chaque entrée de la liste triée.
---Source : lua/ge/extensions/gameplay/rally/transcripts/path.lua:119
---@param selected_id integer|nil Id de l'entrée sélectionnée.
function gameplay_rally_transcripts_path:drawDebugTranscripts(selected_id) end

--- Renvoie un entier croissant (1, 2, 3…) servant d'id aux entrées.
---Source : lua/ge/extensions/gameplay/rally/transcripts/path.lua:11
---@return integer  Nouvel identifiant.
function gameplay_rally_transcripts_path:getNextUniqueIdentifier() end

--- Constructeur : mémorise le nom du fichier et crée la sortedList `transcripts`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/transcripts/path.lua:19
---@param fname string|nil Fichier JSON des transcriptions.
function gameplay_rally_transcripts_path:init(fname) end

--- Charge le fichier JSON (jsonReadFile) et désérialise. Journalise un avertissement et renvoie false si fname est nil ou le fichier absent, une erreur si la lecture échoue.
---Source : lua/ge/extensions/gameplay/rally/transcripts/path.lua:32
---@return boolean  true si le chargement a réussi.
function gameplay_rally_transcripts_path:load() end

--- Vide la liste et la recharge depuis data.transcripts. Ne fait rien si data est nil.
---Source : lua/ge/extensions/gameplay/rally/transcripts/path.lua:67
---@param data table|nil Données lues du fichier.
function gameplay_rally_transcripts_path:onDeserialized(data) end

--- Renvoie {transcripts = <liste sérialisée>}.
---Source : lua/ge/extensions/gameplay/rally/transcripts/path.lua:59
---@return table  Données sérialisables.
function gameplay_rally_transcripts_path:onSerialize() end

--- Sérialise et écrit le fichier JSON (jsonWriteFile avec le paramètre compact à false).
---Source : lua/ge/extensions/gameplay/rally/transcripts/path.lua:53
function gameplay_rally_transcripts_path:save() end

