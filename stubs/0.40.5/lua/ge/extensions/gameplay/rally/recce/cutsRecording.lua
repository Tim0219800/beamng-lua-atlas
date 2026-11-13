---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/recce/cutsRecording.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Chargeur des « cuts » de reconnaissance (recce) d'un rallye. Un cut est un marqueur de position où le copilote a fait un enregistrement vocal pendant la reconnaissance. Le module lit le fichier des cuts de la mission et y rattache, si elles existent, les transcriptions du fichier de transcripts. C'est une extension (gameplay_rally_recce_cutsRecording), utilisée par la classe recce.
--- Accès : extension `gameplay_rally_recce_cutsRecording` : `extensions.load("gameplay_rally_recce_cutsRecording")`, puis la globale `gameplay_rally_recce_cutsRecording`
---@class gameplay_rally_recce_cutsRecording
gameplay_rally_recce_cutsRecording = {}

--- Charge les cuts de la mission avec leurs transcriptions. Chaque ligne du fichier de cuts devient un objet dont pos est converti en vec3 et quat en quat, avec un champ transcript ajouté ({error, text} si une transcription existe, sinon table vide).
---Source : lua/ge/extensions/gameplay/rally/recce/cutsRecording.lua:36
---@param missionDir string Dossier de la mission contenant les fichiers de recce
---@return table[]  Tableau d'objets cut ; tableau vide (et non nil) si le fichier de cuts n'existe pas
function gameplay_rally_recce_cutsRecording.load(missionDir) end

