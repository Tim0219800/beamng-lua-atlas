---@meta
-- tim19Atlas stub generated from lua/vehicle/scriptai.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- IA « script » : enregistre la trajectoire du véhicule (position du pare-chocs avant + temps, éventuellement vitesse) puis la rejoue en pilotant le véhicule avec des entrées simulées (direction, accélérateur, frein, frein à main) pour suivre le tracé à l'heure prévue. Utilisé pour les scénarios, les rediffusions de trajectoire (replays de crash) et les cascades scriptées. Peut aussi aider le suivi avec une « force externe » (thrusters.applyAccel) et boucler le parcours.
--- Accès : globale `scriptai`
---@class scriptai
---@field debugMode string Ce que debugDraw dessine : 'all' (défaut), 'target', 'path' ou 'externalForce'.
---@field updateGFX function nop au repos ; devient updateGFXrecord pendant l'enregistrement et updateGFXfollow pendant le suivi. ⚠ nop est un global du jeu.
scriptai = {}

--- Dessine la cible, le tracé et la force externe selon debugMode (appelée par la boucle de debug du véhicule).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/scriptai.lua:814
function scriptai.debugDraw() end

--- Calcule la position et l'orientation de réapparition du véhicule pour démarrer un script (décalage temporel pris en compte) sans lancer le suivi.
---Source : lua/vehicle/scriptai.lua:126
---@param inScript table Script (liste ou {path, timeOffset, ...}).
---@param vehPosType any Non utilisé dans le code.
---@param _timeOffset number|nil Décalage de départ en secondes (inScript.timeOffset par défaut).
---@return vec3|nil  Position du noeud ref au départ (nil si le script est invalide).
---@return quat|nil  Rotation initiale.
function scriptai.getInitialSpawnPositionOrientation(inScript, vehPosType, _timeOffset) end

--- Indique si l'IA script est en train de suivre un script.
---Source : lua/vehicle/scriptai.lua:846
---@return boolean  true pendant le suivi.
function scriptai.isDriving() end

--- Renvoie l'état courant de l'IA script (enregistrement ou suivi).
---Source : lua/vehicle/scriptai.lua:837
---@return table|nil  {status='recording', time} ou {status='following', scriptTime, time, endScriptTime, posError, targetPos, startDelay} ; nil au repos.
function scriptai.scriptState() end

--- Même fonction que stopFollowing (M.stopFollowing = M.scriptStop).
---Source : lua/vehicle/scriptai.lua:328
---@param centerWheel boolean|nil Remettre les entrées à 0.
---@param engageParkingbrake boolean|nil Serrer le frein à main.
function scriptai.scriptStop(centerWheel, engageParkingbrake) end

--- Active ou coupe l'écriture d'un CSV de debug du suivi (temps, position, écart de temps, taux du lisseur). Le fichier est écrit à l'arrêt.
---Source : lua/vehicle/scriptai.lua:38
---@param val boolean|string true ou 'on' : nom par défaut ; autre chaîne (≠ 'off') : nom du fichier ; sinon désactive.
function scriptai.setLogDataToCSV(val) end

--- Règle le taux de décroissance du lisseur d'écart de vitesse (réglage fin de la réactivité du suivi), borné à 1e30.
---Source : lua/vehicle/scriptai.lua:51
---@param outRate number|nil Nouveau taux (conserve l'ancien si nil).
function scriptai.setSpeedDiffSmootherOutRate(outRate) end

--- Démarre le suivi d'un script : prépare le script (décalage temporel, délai de départ), replace le véhicule au début du tracé selon le type de boucle, passe la boîte et l'ABS en mode arcade et active la boucle de suivi. Ne fait rien si le script a moins de 2 points.
---Source : lua/vehicle/scriptai.lua:660
---@param _inScript table Script : liste de points, ou table {path, timeOffset, startDelay, loopCount, loopTimeOffset, externalForce}.
---@param _timeOffset number|nil Décalage de départ dans le script en secondes (remplace inScript.timeOffset).
---@param _loopCounter integer|nil Nombre de tours restant (inScript.loopCount par défaut, 1 sinon). Utilisé aussi par l'auto-rappel en fin de tour.
---@param _loopType string|nil 'alwaysReset' (défaut), 'startReset' ou autre : quand replacer le véhicule au point de départ.
---@param _externalForce boolean|number|nil Aide au suivi par accélération externe (true = 1, nombre borné à 1 ; remplace inScript.externalForce).
function scriptai.startFollowing(_inScript, _timeOffset, _loopCounter, _loopType, _externalForce) end

--- Démarre l'enregistrement de la trajectoire (position avant du véhicule à chaque frame) et mémorise l'orientation initiale. Remet le chronomètre à 0.
---Source : lua/vehicle/scriptai.lua:636
---@param recordSpeed boolean|string|nil true/'on'/'yes' pour enregistrer aussi la vitesse (v, m/s) à chaque point.
function scriptai.startRecording(recordSpeed) end

--- Arrête le suivi (alias de scriptStop). Remet les entrées à 0, restaure le mode de boîte sauvegardé et vide le script. Écrit le CSV de debug s'il était activé.
---Source : lua/vehicle/scriptai.lua:328
---@param centerWheel boolean|nil Remettre direction, gaz et frein à 0 (true par défaut si l'argument est nil).
---@param engageParkingbrake boolean|nil Serrer le frein à main (true par défaut si centerWheel est nil).
function scriptai.stopFollowing(centerWheel, engageParkingbrake) end

--- Arrête l'enregistrement et renvoie le script obtenu ; le premier point reçoit dir et up (orientation initiale).
---Source : lua/vehicle/scriptai.lua:648
---@return table  {path = liste de points {x, y, z, t [, v]}}.
function scriptai.stopRecording() end

--- Calcule de combien les roues seront au-dessus (positif : trop bas, il faut relever) ou sous le sol pour une position et une orientation de réapparition données (lancer de rayon statique depuis la position moyenne des noeuds de roues).
---Source : lua/vehicle/scriptai.lua:64
---@param pos vec3 Position du noeud ref du véhicule.
---@param dir vec3 Direction avant (normalisée).
---@param up vec3 Vecteur haut (normalisé).
---@return number  Hauteur (m) à ajouter le long de up pour que les roues touchent le sol : rayon max de roue moins la distance mesurée au sol.
function scriptai.wheelToGroundDist(pos, dir, up) end

