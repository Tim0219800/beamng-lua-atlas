---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/camera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outils MCP pour la caméra du joueur : changer de mode, orbiter autour d'un véhicule (avec rotation continue), lire l'état de la caméra et placer la caméra libre. S'appuie sur core_camera. Module chargé par mcp_tools ; chaque M.xxx est un outil qui renvoie (texte, estErreur).
--- Accès : extension `mcp_tools_camera` : `extensions.load("mcp_tools_camera")`, puis la globale `mcp_tools_camera`
---@class mcp_tools_camera
---@field schemas table<string, table> Schémas des outils set_camera, orbit_camera, get_camera_state, set_free_camera.
mcp_tools_camera = {}

--- État de la caméra en JSON : mode, pos, rot (quaternion), fov (degrés).
---Source : lua/ge/extensions/mcp/tools/camera.lua:46
---@return string  JSON.
---@return boolean  true si core_camera indisponible.
function mcp_tools_camera.get_camera_state() end

--- Appelé chaque frame (via le fan-out de mcp_tools) : si une orbite continue est active, incrémente le yaw de speed*dtReal (modulo 360) et applique core_camera.setRotation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/mcp/tools/camera.lua:12
---@param dtReal number Durée réelle de la frame (s).
function mcp_tools_camera.onUpdate(dtReal) end

--- Passe en caméra orbit et règle distance, rotation ou rotation continue autour d'un véhicule.
---Source : lua/ge/extensions/mcp/tools/camera.lua:29
---@param args table|nil {yaw?: number°, pitch?: number° (défaut 20), distance?: number m, spin?: number °/s (0 stoppe), id?: integer}
---@return string  Résumé.
---@return boolean  true en cas d'erreur.
function mcp_tools_camera.orbit_camera(args) end

--- Change le mode caméra du joueur 0 par son nom (core_camera.setByName).
---Source : lua/ge/extensions/mcp/tools/camera.lua:19
---@param args table {name: string} orbit, driver, chase, external, hood, top, dash… (obligatoire).
---@return string  Confirmation ou erreur.
---@return boolean  true en cas d'erreur.
function mcp_tools_camera.set_camera(args) end

--- Passe en caméra libre et la place (position, rotation quaternion, fov) via core_camera.globalCameraFunction. La pose persiste ensuite, la caméra libre se déplace avec les entrées.
---Source : lua/ge/extensions/mcp/tools/camera.lua:59
---@param args table|nil {pos?: {x,y,z}, rot?: {x,y,z,w}, fov?: number°}
---@return string  « free camera set ».
---@return boolean  true en cas d'erreur.
function mcp_tools_camera.set_free_camera(args) end

