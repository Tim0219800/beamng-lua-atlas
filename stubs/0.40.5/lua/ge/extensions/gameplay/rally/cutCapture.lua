---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/cutCapture.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet de capture renvoyé par le constructeur du module. Attributs : vehicle, fname, fname_transcripts, cut_id.
---@class gameplay_rally_cutCapture
local gameplay_rally_cutCapture = {}

--- Capture l'état courant du véhicule (id incrémental, horodatage rallyUtil.getTime(), pos {x,y,z}, quat {x,y,z,w} calculé depuis les vecteurs direction/haut, steering) et l'écrit via writeCut.
---Source : lua/ge/extensions/gameplay/rally/cutCapture.lua:40
---@return integer  Identifiant de la coupure créée.
function gameplay_rally_cutCapture:capture() end

--- Initialise : mémorise le véhicule, s'abonne aux changements de la valeur 'steering' (core_vehicleBridge) et calcule les chemins cuts.json et transcripts.json. L'identifiant de coupure repart à 1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/cutCapture.lua:12
---@param vehicle table Objet véhicule (getId, getPosition, getDirectionVector...).
---@param missionDir string Dossier de la mission, passé à rallyUtil.missionReccePath.
function gameplay_rally_cutCapture:init(vehicle, missionDir) end

--- Vide le fichier cuts.json (ouverture en écriture).
---Source : lua/ge/extensions/gameplay/rally/cutCapture.lua:22
function gameplay_rally_cutCapture:truncateCapturesFile() end

--- Vide le fichier transcripts.json.
---Source : lua/ge/extensions/gameplay/rally/cutCapture.lua:27
function gameplay_rally_cutCapture:truncateTranscriptsFile() end

--- Ajoute une capture encodée en JSON, suivie d'un saut de ligne, à cuts.json.
---Source : lua/ge/extensions/gameplay/rally/cutCapture.lua:32
---@param cutCapture table Table sérialisable (id, ts, pos, quat, steering).
function gameplay_rally_cutCapture:writeCut(cutCapture) end

