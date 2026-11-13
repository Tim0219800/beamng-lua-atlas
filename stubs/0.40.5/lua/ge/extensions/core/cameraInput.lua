---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraInput.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaires d'entrées caméra du joueur (regarder, se déplacer, zoomer, axes absolus de souris 3D/SpaceMouse), extraits de core/camera.lua. Ce n'est pas une extension : camera.lua fait require('core/cameraInput'), lui injecte moveFor et getFovDeg via setup(), puis ré-expose ces fonctions sur core_camera (les actions d'entrée appellent core_camera.rotate_yaw, etc.). Elles écrivent dans la structure MoveManager du joueur (champs yawLeft, yawRight, pitchUp, pitchDown, rollLeft, rollRight, forward, backward, left, right, up, down, zoomIn, zoomOut, yawRelative, pitchRelative, rollRelative, absXAxis, absYAxis, absZAxis), lue ensuite par les modes de caméra.
--- Accès : extension `core_cameraInput` : `extensions.load("core_cameraInput")`, puis la globale `core_cameraInput`
---@class core_cameraInput
core_cameraInput = {}

--- Axe signé de zoom : val > 0 règle zoomIn, sinon zoomOut = -val.
---Source : lua/ge/extensions/core/cameraInput.lua:123
---@param val number Valeur signée
---@param player integer|nil Indice du joueur
function core_cameraInput.cameraZoom(val, player) end

--- Type de la dernière rotation caméra : 'absolute' (axes/touches), 'relative' (souris) ou 'none'.
---Source : lua/ge/extensions/core/cameraInput.lua:35
---@return string  'absolute', 'relative' ou 'none'
function core_cameraInput.getLastCameraMovementType() end

--- Dernier type de source d'entrée utilisé pour tourner la caméra (FILTER_KBD clavier, FILTER_PAD manette, FILTER_MOUSE souris). Lu par les modes de caméra et l'UI.
---Source : lua/ge/extensions/core/cameraInput.lua:22
---@return integer  Constante FILTER_*
function core_cameraInput.getLastFilter() end

--- Axe signé avant/arrière : val > 0 règle forward, sinon backward = -val.
---Source : lua/ge/extensions/core/cameraInput.lua:101
---@param val number Valeur signée
---@param player integer|nil Indice du joueur
function core_cameraInput.moveForwardBackward(val, player) end

--- Axe signé gauche/droite : val > 0 règle right, sinon left = -val.
---Source : lua/ge/extensions/core/cameraInput.lua:112
---@param val number Valeur signée
---@param player integer|nil Indice du joueur
function core_cameraInput.moveLeftRight(val, player) end

--- Touche de déplacement vers l'arrière : fixe moveFor(player).backward.
---Source : lua/ge/extensions/core/cameraInput.lua:156
---@param val number Valeur [0..1]
---@param player integer|nil Indice du joueur
function core_cameraInput.movebackward(val, player) end

--- Touche de déplacement vers le bas : fixe moveFor(player).down.
---Source : lua/ge/extensions/core/cameraInput.lua:158
---@param val number Valeur [0..1]
---@param player integer|nil Indice du joueur
function core_cameraInput.movedown(val, player) end

--- Touche de déplacement vers l'avant : fixe moveFor(player).forward.
---Source : lua/ge/extensions/core/cameraInput.lua:155
---@param val number Valeur [0..1]
---@param player integer|nil Indice du joueur
function core_cameraInput.moveforward(val, player) end

--- Touche de déplacement à gauche (caméra libre ou réglage du siège conducteur) : fixe moveFor(player).left.
---Source : lua/ge/extensions/core/cameraInput.lua:153
---@param val number Valeur [0..1]
---@param player integer|nil Indice du joueur
function core_cameraInput.moveleft(val, player) end

--- Touche de déplacement à droite : fixe moveFor(player).right.
---Source : lua/ge/extensions/core/cameraInput.lua:154
---@param val number Valeur [0..1]
---@param player integer|nil Indice du joueur
function core_cameraInput.moveright(val, player) end

--- Touche de déplacement vers le haut : fixe moveFor(player).up.
---Source : lua/ge/extensions/core/cameraInput.lua:157
---@param val number Valeur [0..1]
---@param player integer|nil Indice du joueur
function core_cameraInput.moveup(val, player) end

--- Axe absolu de tangage (souris 3D), même principe sur pitchRelative.
---Source : lua/ge/extensions/core/cameraInput.lua:167
---@param val number Position absolue de l'axe
function core_cameraInput.pitchAbs(val) end

--- Axe absolu de roulis (souris 3D), même principe que yawAbs sur rollRelative.
---Source : lua/ge/extensions/core/cameraInput.lua:166
---@param val number Position absolue de l'axe
function core_cameraInput.rollAbs(val) end

--- Axe signé de tangage : val > 0 règle pitchUp et annule pitchDown, sinon l'inverse.
---Source : lua/ge/extensions/core/cameraInput.lua:76
---@param val number Valeur signée [-1..1]
---@param filter integer Source d'entrée FILTER_*
---@param player integer|nil Indice du joueur
function core_cameraInput.rotate_pitch(val, filter, player) end

--- Fixe l'entrée de tangage vers le bas.
---Source : lua/ge/extensions/core/cameraInput.lua:70
---@param val number Valeur de l'axe [0..1]
---@param filter integer Source d'entrée FILTER_*
---@param player integer|nil Indice du joueur
function core_cameraInput.rotate_pitch_down(val, filter, player) end

--- Rotation relative (souris) en tangage, même principe que rotate_yaw_relative avec 'pitch'.
---Source : lua/ge/extensions/core/cameraInput.lua:143
---@param val number Delta de souris
---@param player integer|nil Indice du joueur
function core_cameraInput.rotate_pitch_relative(val, player) end

--- Fixe l'entrée de tangage vers le haut.
---Source : lua/ge/extensions/core/cameraInput.lua:64
---@param val number Valeur de l'axe [0..1]
---@param filter integer Source d'entrée FILTER_*
---@param player integer|nil Indice du joueur
function core_cameraInput.rotate_pitch_up(val, filter, player) end

--- Fixe l'entrée de roulis vers la gauche.
---Source : lua/ge/extensions/core/cameraInput.lua:95
---@param val number Valeur de l'axe [0..1]
---@param filter integer Source d'entrée FILTER_*
---@param player integer|nil Indice du joueur
function core_cameraInput.rotate_roll_left(val, filter, player) end

--- Fixe l'entrée de roulis vers la droite.
---Source : lua/ge/extensions/core/cameraInput.lua:89
---@param val number Valeur de l'axe [0..1]
---@param filter integer Source d'entrée FILTER_*
---@param player integer|nil Indice du joueur
function core_cameraInput.rotate_roll_right(val, filter, player) end

--- Axe signé de lacet : val > 0 règle yawRight et annule yawLeft, val <= 0 l'inverse.
---Source : lua/ge/extensions/core/cameraInput.lua:51
---@param val number Valeur signée [-1..1]
---@param filter integer Source d'entrée FILTER_*
---@param player integer|nil Indice du joueur
function core_cameraInput.rotate_yaw(val, filter, player) end

--- Fixe l'entrée de lacet gauche et mémorise le filtre et l'instant de rotation.
---Source : lua/ge/extensions/core/cameraInput.lua:39
---@param val number Valeur de l'axe [0..1]
---@param filter integer Source d'entrée FILTER_*
---@param player integer|nil Indice du joueur
function core_cameraInput.rotate_yaw_left(val, filter, player) end

--- Rotation relative (souris) en lacet. Offre d'abord l'évènement au registre de contrôleurs (onRelativeInput 'yaw') ; s'il n'est pas consommé, ajoute fov*val/4500 à yawRelative.
---Source : lua/ge/extensions/core/cameraInput.lua:134
---@param val number Delta de souris
---@param player integer|nil Indice du joueur
function core_cameraInput.rotate_yaw_relative(val, player) end

--- Fixe l'entrée de lacet droite.
---Source : lua/ge/extensions/core/cameraInput.lua:45
---@param val number Valeur de l'axe [0..1]
---@param filter integer Source d'entrée FILTER_*
---@param player integer|nil Indice du joueur
function core_cameraInput.rotate_yaw_right(val, filter, player) end

--- Injection des dépendances par camera.lua : fonctions moveFor(player) et getFovDeg().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraInput.lua:15
---@param deps table {moveFor = function(player), getFovDeg = function()}
function core_cameraInput.setup(deps) end

--- Appelée à chaque frame par la vue principale : remet à zéro les axes de translation absolus une fois la fenêtre de 0.05 s écoulée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraInput.lua:187
---@param dtReal number Pas de temps réel (s)
function core_cameraInput.tickAbsAxes(dtReal) end

--- Temps écoulé depuis la dernière rotation de la caméra par ce joueur.
---Source : lua/ge/extensions/core/cameraInput.lua:31
---@param player integer|nil Indice du joueur, 0 par défaut
---@return number  Durée en millisecondes (horloge système)
function core_cameraInput.timeSinceLastRotation(player) end

--- Axe absolu de translation X (souris 3D) : MoveManager.absXAxis = (précédent - val) * 0.02.
---Source : lua/ge/extensions/core/cameraInput.lua:172
---@param val number Position absolue de l'axe
function core_cameraInput.xAxisAbs(val) end

--- Axe absolu de translation Y (souris 3D) : MoveManager.absYAxis = (précédent - val) * 0.02.
---Source : lua/ge/extensions/core/cameraInput.lua:173
---@param val number Position absolue de l'axe
function core_cameraInput.yAxisAbs(val) end

--- Déplacement par petit pas (zoom molette de souris 3D) : avance à la vitesse val pendant 0.05 s. Ignoré si le zoom caméra est désactivé dans l'éditeur ou consommé par un contrôleur (onEditorMouseWheel, val/20).
---Source : lua/ge/extensions/core/cameraInput.lua:178
---@param val number Vitesse du pas
function core_cameraInput.yAxisMoveStep(val) end

--- Axe absolu de lacet (souris 3D) : MoveManager.yawRelative = (précédent - val) * 0.0005.
---Source : lua/ge/extensions/core/cameraInput.lua:165
---@param val number Position absolue de l'axe
function core_cameraInput.yawAbs(val) end

--- Axe absolu de translation Z (souris 3D) : MoveManager.absZAxis = (précédent - val) * 0.02.
---Source : lua/ge/extensions/core/cameraInput.lua:174
---@param val number Position absolue de l'axe
function core_cameraInput.zAxisAbs(val) end

