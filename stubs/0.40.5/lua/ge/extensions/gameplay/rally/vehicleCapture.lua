---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/vehicleCapture.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Enregistreur lié à un véhicule. Champs : vehicle, interval_m (2), last_dist_pos, capturesBuffer, fname.
---@class gameplay_rally_vehicleCapture
local gameplay_rally_vehicleCapture = {}

--- À appeler à chaque image : lit position et orientation (quatf depuis direction et vecteur haut) du véhicule et, si celui-ci s'est éloigné de plus de interval_m de la dernière capture, met en tampon {ts, pos, quat, steering}. Tente ensuite d'écrire le tampon.
---Source : lua/ge/extensions/gameplay/rally/vehicleCapture.lua:52
function gameplay_rally_vehicleCapture:capture() end

--- Dessine une sphère bleue semi-transparente de rayon 2 à la dernière position capturée (debugDrawer:drawSphere).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/vehicleCapture.lua:83
function gameplay_rally_vehicleCapture:drawDebug() end

--- Constructeur. Enregistre la notification de changement de 'steering' auprès de core_vehicleBridge et calcule le chemin du fichier driveline.json via rallyUtil.missionReccePath.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/vehicleCapture.lua:12
---@param vehicle table Objet véhicule (getId, getPosition, getDirectionVector…).
---@param missionDir string Dossier de la mission.
function gameplay_rally_vehicleCapture:init(vehicle, missionDir) end

--- Vide le fichier de captures (ouverture en mode "w"). Journalise une erreur si l'ouverture échoue.
---Source : lua/ge/extensions/gameplay/rally/vehicleCapture.lua:23
function gameplay_rally_vehicleCapture:truncateCapturesFile() end

--- Ajoute les captures du tampon au fichier (une ligne JSON chacune) puis vide le tampon. Sans force, ne fait rien tant que le tampon contient moins de 10 éléments.
---Source : lua/ge/extensions/gameplay/rally/vehicleCapture.lua:32
---@param force boolean|nil true pour écrire même avec moins de 10 captures.
function gameplay_rally_vehicleCapture:writeCaptures(force) end

