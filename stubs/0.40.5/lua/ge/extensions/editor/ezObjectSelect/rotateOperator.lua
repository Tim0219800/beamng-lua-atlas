---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/rotateOperator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Opérateur modal « Rotate » (touche R) de l'outil Easy Select. Ouvre une session de transformation (historique « EasySelectRotate ») et fait tourner la sélection autour du pivot : sans contrainte l'axe est la direction de vue de la caméra, avec contrainte X/Y/Z c'est l'axe choisi (monde ou local). L'angle vient de l'angle écran souris-pivot ou d'une saisie numérique en degrés, avec magnétisme optionnel. Clic gauche/Entrée valide, clic droit/Échap annule.
--- Accès : extension `editor_ezObjectSelect_rotateOperator` : `extensions.load("editor_ezObjectSelect_rotateOperator")`, puis la globale `editor_ezObjectSelect_rotateOperator`
---@class editor_ezObjectSelect_rotateOperator
editor_ezObjectSelect_rotateOperator = {}

--- Démarre la rotation. Renvoie false si déjà actif, session impossible ou pivot non projetable.
---Source : lua/ge/extensions/editor/ezObjectSelect/rotateOperator.lua:66
---@param options table|nil {defaultLocal = boolean}
---@return boolean  true si démarré
function editor_ezObjectSelect_rotateOperator.begin(options) end

--- Annule la rotation en cours.
---Source : lua/ge/extensions/editor/ezObjectSelect/rotateOperator.lua:105
---@return boolean  true si un opérateur était actif
function editor_ezObjectSelect_rotateOperator.cancel() end

--- Dessine l'indicateur et le HUD (contrainte VIEW/axe, espace, angle en degrés ou texte saisi).
---Source : lua/ge/extensions/editor/ezObjectSelect/rotateOperator.lua:125
function editor_ezObjectSelect_rotateOperator.drawScreen() end

--- Ids des objets de la session ({} si inactif).
---Source : lua/ge/extensions/editor/ezObjectSelect/rotateOperator.lua:121
---@return table
function editor_ezObjectSelect_rotateOperator.getObjectIds() end

--- Indique si l'opérateur est en cours.
---Source : lua/ge/extensions/editor/ezObjectSelect/rotateOperator.lua:117
---@return boolean
function editor_ezObjectSelect_rotateOperator.isActive() end

--- Bascule espace local/monde et réinitialise la référence souris.
---Source : lua/ge/extensions/editor/ezObjectSelect/rotateOperator.lua:111
---@param localSpace boolean true pour local
---@return boolean  false si le changement n'a pas eu lieu
function editor_ezObjectSelect_rotateOperator.setLocalSpace(localSpace) end

--- Chaque frame : gère fin, contrainte, saisie, calcule l'angle (rad), applique transformSession.updateRotation et dessine le gizmo.
---Source : lua/ge/extensions/editor/ezObjectSelect/rotateOperator.lua:86
---@param options table|nil {rotateSnapEnabled = boolean, rotateSnapSize = degrés}
---@return string|nil  "active" pendant l'opération, résultat de finish à la fin, nil si inactif
function editor_ezObjectSelect_rotateOperator.update(options) end

--- True si la touche R vient d'être pressée.
---Source : lua/ge/extensions/editor/ezObjectSelect/rotateOperator.lua:62
---@return boolean
function editor_ezObjectSelect_rotateOperator.wantsBegin() end

