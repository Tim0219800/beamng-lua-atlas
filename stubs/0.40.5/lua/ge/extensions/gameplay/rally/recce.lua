---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/recce.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet Recce renvoyé par le constructeur du module.
---@class gameplay_rally_recce
local gameplay_rally_recce = {}

--- Remet self.driveline et self.cuts à nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/recce.lua:50
function gameplay_rally_recce:_resetState() end

--- Convertit les cuts en tables de pacenotes pour un notebook : crée un Snaproad sur la driveline, place pour chaque cut un waypoint « corner end » au plus près du cut et un « corner start » reculé d'environ 2 fois le rayon par défaut, nomme la note (Import_<id> ... ou Pacenote ...) et y met la transcription dans la langue copilote par défaut.
---Source : lua/ge/extensions/gameplay/rally/recce.lua:165
---@param notebook table Notebook cible (nextImportIdent, getNextUniqueIdentifier)
---@return table[]|nil  Liste de tables de pacenotes ; nil si driveline/cuts non chargés
function gameplay_rally_recce:createPacenotesData(notebook) end

--- Dessine chaque cut sous forme de petite voiture, avec le texte de sa transcription.
---Source : lua/ge/extensions/gameplay/rally/recce.lua:95
function gameplay_rally_recce:drawDebugCuts() end

--- Dessine la driveline (via PointList:drawDebug) puis les cuts. Ne fait rien sans driveline.
---Source : lua/ge/extensions/gameplay/rally/recce.lua:89
---@param drawLabels boolean Afficher les étiquettes des points de la driveline
---@param mouseInfo any Non utilisé dans le corps de la fonction
function gameplay_rally_recce:drawDebugRecce(drawLabels, mouseInfo) end

--- Dessine avec debugDrawer une voiture schématique (4,4 x 1,8 x 1,6 m, quatre roues en sphères, caisse en prisme) centrée sur pos et orientée par quat ; affiche txt derrière si fourni.
---Source : lua/ge/extensions/gameplay/rally/recce.lua:106
---@param pos vec3 Centre de la voiture
---@param quat quat Orientation (l'avant est l'axe +Y local)
---@param txt string|nil Texte à afficher (transcription)
function gameplay_rally_recce:drawLittleCar(pos, quat, txt) end

--- Indique si driveline et cuts ont été chargés avec succès par loadDrivelineAndCuts.
---Source : lua/ge/extensions/gameplay/rally/recce.lua:46
---@return boolean  true si les deux sont chargés
function gameplay_rally_recce:drivelineAndCutsLoaded() end

--- Initialise l'objet : mémorise missionDir, marque driveline/cuts comme non chargés et remet l'état à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/recce.lua:36
---@param missionDir string Dossier de la mission
function gameplay_rally_recce:init(missionDir) end

--- Charge les cuts avec leurs transcriptions dans self.cuts.
---Source : lua/ge/extensions/gameplay/rally/recce.lua:75
---@return boolean  true s'il y a au moins un cut
function gameplay_rally_recce:loadCuts() end

--- Charge la driveline (PointList) dans self.driveline.
---Source : lua/ge/extensions/gameplay/rally/recce.lua:80
---@return boolean  false si le fichier est absent ou invalide
function gameplay_rally_recce:loadDriveline() end

--- Charge la driveline puis les cuts, logue un avertissement pour chacun s'il manque (normal pour une nouvelle reconnaissance).
---Source : lua/ge/extensions/gameplay/rally/recce.lua:55
---@return boolean  toujours true
function gameplay_rally_recce:loadDrivelineAndCuts() end

