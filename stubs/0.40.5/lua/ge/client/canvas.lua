---@meta
-- tim19Atlas stub generated from lua/ge/client/canvas.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère le GuiCanvas (la fenêtre de rendu) côté client : création unique de l'objet « Canvas » et affichage/masquage du curseur de la souris. Appelé au démarrage du jeu (initializeCanvas) ; un moddeur peut utiliser showCursor/hideCursor pour libérer ou verrouiller la souris.
--- Accès : `require("client/canvas")`
---@class client_canvas
---@field canvasCreated boolean Vrai une fois le canvas créé par initializeCanvas ; empêche une seconde création.
local client_canvas = {}

--- Retourne l'objet GuiCanvas « Canvas », en le créant et l'enregistrant s'il n'existe pas. Applique les préférences de plein écran et d'auto-détection graphique.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/canvas.lua:8
---@param windowPlacement any Placement de fenêtre ; non utilisé dans le corps de la fonction (déduit du code).
---@return userdata  L'objet Canvas.
function client_canvas.createCanvas(windowPlacement) end

--- Verrouille la souris (lockMouse(true)) et cache le curseur du canvas.
---Source : lua/ge/client/canvas.lua:57
function client_canvas.hideCursor() end

--- Crée le canvas une seule fois (journalise une erreur si déjà créé), lit WindowPlacement dans les options graphiques, et appelle quit() si la création échoue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/canvas.lua:28
---@return userdata|nil  Le canvas, ou nil si déjà créé.
function client_canvas.initializeCanvas() end

--- Déverrouille la souris (lockMouse(false)) et rend le curseur du canvas visible.
---Source : lua/ge/client/canvas.lua:48
function client_canvas.showCursor() end

return client_canvas
