---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/siteView.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère la caméra des outils d'éditeur à contour (open space editor, parking lot editor) : quelle étape d'édition est affichée (Footprint ou Design) et laquelle des trois caméras (pan, rotate, free) cadre la sélection. S'appuie sur editor/toolUtilities/toolCamera pour les déplacements. Un seul outil est actif à la fois, donc l'état (étape, mode, dernière sélection) est unique au niveau du module. Le massing editor garde sa propre version, mais offre les mêmes boutons.
--- Accès : extension `editor_toolUtilities_siteView` : `extensions.load("editor_toolUtilities_siteView")`, puis la globale `editor_toolUtilities_siteView`
---@class editor_toolUtilities_siteView
---@field modes table Liste des boutons de caméra : { mode = 'pan'|'rotate'|'free', icon, tip }.
---@field steps table Liste des étapes d'édition proposées dans l'interface : { key = 'footprint', label, icon } et { key = 'design', label, icon }.
editor_toolUtilities_siteView = {}

--- Prend la main sur la caméra de l'éditeur (toolCam.takeOver) puis cadre la sélection.
---Source : lua/ge/extensions/editor/toolUtilities/siteView.lua:65
---@param m string|nil Mode à activer ; par défaut le mode courant.
function editor_toolUtilities_siteView.activate(m) end

--- Action d'un bouton de caméra : bascule vers ce mode, ou recadre s'il est déjà actif (sauf 'free', où rien ne se passe). C'est ce deuxième appui qui sert de « aller au site ».
---Source : lua/ge/extensions/editor/toolUtilities/siteView.lua:104
---@param m string Mode du bouton cliqué.
function editor_toolUtilities_siteView.clickMode(m) end

--- Pilotage par frame de la caméra (toolCam.drive), sauf en mode free.
---Source : lua/ge/extensions/editor/toolUtilities/siteView.lua:116
---@param blocked boolean Supprime le mouvement pendant les interactions modales de l'outil (tracé, glissement d'une poignée).
function editor_toolUtilities_siteView.drive(blocked) end

--- Envoie la caméra active (pan ou orbite) vers la sélection, d'après le contour fourni par ring(). Mémorise aussi la sélection courante.
---Source : lua/ge/extensions/editor/toolUtilities/siteView.lua:56
---@param m string|nil 'pan' ou autre (orbite) ; par défaut le mode courant.
function editor_toolUtilities_siteView.focus(m) end

--- Recadre si la sélection (ctx.selIndex()) a changé depuis le dernier cadrage. Sans effet en mode free.
---Source : lua/ge/extensions/editor/toolUtilities/siteView.lua:109
function editor_toolUtilities_siteView.followSelection() end

--- Renvoie le mode de caméra courant.
---Source : lua/ge/extensions/editor/toolUtilities/siteView.lua:133
---@return string  'pan', 'rotate' ou 'free'.
function editor_toolUtilities_siteView.getMode() end

--- Renvoie l'étape courante.
---Source : lua/ge/extensions/editor/toolUtilities/siteView.lua:132
---@return string  'footprint' ou 'design'.
function editor_toolUtilities_siteView.getStep() end

--- Rend la caméra de l'éditeur en quittant l'outil (toolCam.handBack(false)).
---Source : lua/ge/extensions/editor/toolUtilities/siteView.lua:121
function editor_toolUtilities_siteView.handBack() end

--- Lie le module à l'outil hôte en stockant le contexte. `ring` renvoie le contour à cadrer, `terrainZ` le sol sous un point, `selIndex` la sélection courante (pour recadrer quand elle change) et `onStep` est appelé quand l'étape change.
---Source : lua/ge/extensions/editor/toolUtilities/siteView.lua:32
---@param c table Contexte { ring, terrainZ, selIndex, onStep }.
function editor_toolUtilities_siteView.init(c) end

--- Vrai quand l'étape courante est 'footprint'.
---Source : lua/ge/extensions/editor/toolUtilities/siteView.lua:131
---@return boolean  step == 'footprint'.
function editor_toolUtilities_siteView.isShaping() end

--- Remet l'état d'ouverture de l'outil : étape design, mode rotate, puis active et cadre la caméra en orbite.
---Source : lua/ge/extensions/editor/toolUtilities/siteView.lua:126
function editor_toolUtilities_siteView.reset() end

--- Change de caméra. Vers 'free' : rend la caméra à l'éditeur. Depuis 'free' vers un autre mode : reprend la main et cadre ; sinon, recadre simplement.
---Source : lua/ge/extensions/editor/toolUtilities/siteView.lua:71
---@param m string 'pan', 'rotate' ou 'free'.
function editor_toolUtilities_siteView.setMode(m) end

--- Change d'étape d'édition et appelle ctx.onStep(key). 'footprint' impose la caméra pan (les nœuds sont dessinés à plat) et retient si l'utilisateur était en free ; en quittant, restaure free si c'était le cas, sinon repasse en rotate.
---Source : lua/ge/extensions/editor/toolUtilities/siteView.lua:86
---@param key string 'footprint' ou 'design'.
function editor_toolUtilities_siteView.setStep(key) end

