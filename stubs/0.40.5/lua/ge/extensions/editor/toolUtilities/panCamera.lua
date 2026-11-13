---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/panCamera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Caméra « pan » partagée par les outils de splines de l'éditeur. Elle prend la main sur la caméra libre de l'éditeur (via toolCamera), passe en vue de dessus et permet de se déplacer au clic droit et de zoomer à la molette. Un outil hôte l'enregistre avec configure, l'appelle chaque frame avec drive, et peut lui faire cadrer la sélection courante.
--- Accès : extension `editor_toolUtilities_panCamera` : `extensions.load("editor_toolUtilities_panCamera")`, puis la globale `editor_toolUtilities_panCamera`
---@class editor_toolUtilities_panCamera
editor_toolUtilities_panCamera = {}

--- Désactive la caméra pan et rend la caméra libre à l'éditeur (toolCamera.handBack).
---Source : lua/ge/extensions/editor/toolUtilities/panCamera.lua:52
function editor_toolUtilities_panCamera.close() end

--- Enregistre un callback fournissant les points de la sélection courante, utilisé pour cadrer à l'ouverture de la caméra.
---Source : lua/ge/extensions/editor/toolUtilities/panCamera.lua:29
---@param opts table|nil Table avec le champ focusProvider : fonction sans argument renvoyant une liste de points {x,y,z} ou nil.
function editor_toolUtilities_panCamera.configure(opts) end

--- À appeler à chaque frame : applique le déplacement (glisser clic droit) et le zoom (molette) via toolCamera.drive.
---Source : lua/ge/extensions/editor/toolUtilities/panCamera.lua:71
---@param blocked boolean|nil true pour suspendre le mouvement pendant les interactions modales de l'outil (dessin de polygone, glissement de nœud, placement…).
function editor_toolUtilities_panCamera.drive(blocked) end

--- Routage du « aller à » : si la caméra pan (ou toolCamera) est active, la fait voler vers les points donnés et renvoie true ; sinon renvoie false et l'appelant fait son saut normal.
---Source : lua/ge/extensions/editor/toolUtilities/panCamera.lua:63
---@param points table Liste de points {x,y,z} à cadrer.
---@return boolean  true si la demande a été traitée par la caméra pan.
function editor_toolUtilities_panCamera.gotoPoints(points) end

--- Indique si la caméra pan est active.
---Source : lua/ge/extensions/editor/toolUtilities/panCamera.lua:33
---@return boolean  true si la caméra pan pilote la vue.
function editor_toolUtilities_panCamera.isOn() end

--- Active la caméra pan (toolCamera.takeOver) et passe en vue de dessus : cadre la sélection fournie par focusProvider s'il y en a une, sinon bascule en vue de dessus à la position et à la hauteur actuelles de la caméra.
---Source : lua/ge/extensions/editor/toolUtilities/panCamera.lua:39
function editor_toolUtilities_panCamera.open() end

--- Bascule : ferme la caméra pan si elle est active, sinon l'ouvre.
---Source : lua/ge/extensions/editor/toolUtilities/panCamera.lua:57
function editor_toolUtilities_panCamera.toggle() end

