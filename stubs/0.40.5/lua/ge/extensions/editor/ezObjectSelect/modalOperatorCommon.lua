---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fonctions communes aux opérateurs modaux (rotate, scale, translate) de l'outil Easy Select : démarrage d'une session de transformation sur la sélection, gestion des contraintes d'axe X/Y/Z (monde/local, exclusion avec Shift), saisie numérique, validation/annulation (Entrée ou clic gauche dans le viewport = confirm ; Échap ou clic droit = cancel), projection monde vers écran, et dessin du HUD et des indicateurs près de la souris.
--- Accès : extension `editor_ezObjectSelect_modalOperatorCommon` : `extensions.load("editor_ezObjectSelect_modalOperatorCommon")`, puis la globale `editor_ezObjectSelect_modalOperatorCommon`
---@class editor_ezObjectSelect_modalOperatorCommon
editor_ezObjectSelect_modalOperatorCommon = {}

--- Vecteur de l'axe contraint, ou nil sans contrainte.
---Source : lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua:117
---@param state table État
---@return vec3|nil
function editor_ezObjectSelect_modalOperatorCommon.activeAxis(state) end

--- Jeu d'axes courant (localAxes si la contrainte est en espace local, sinon worldAxes).
---Source : lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua:112
---@param state table État
---@return table  {x, y, z} de vec3
function editor_ezObjectSelect_modalOperatorCommon.axes(state) end

--- Ouvre la session de transformation sur la sélection et crée l'état de l'opérateur. Renvoie nil si pas d'ancre, pas de caméra/rayon, ou si transformSession.begin échoue.
---Source : lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua:45
---@param options table|nil {historyName = nom de la transaction d'historique, defaultLocal = boolean}
---@return table|nil  état de l'opérateur
function editor_ezObjectSelect_modalOperatorCommon.begin(options) end

--- Rayon caméra-souris courant (getCameraMouseRay).
---Source : lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua:28
---@return table|nil  {origin = vec3, direction = vec3 normalisé} ou nil
function editor_ezObjectSelect_modalOperatorCommon.currentRay() end

--- Dessine un panneau à deux lignes près de la souris (ligne 1 : préfixe + détails ; ligne 2 : aide), gardé dans le viewport.
---Source : lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua:269
---@param prefix string Lettre/titre (ex. "R", "S")
---@param details string Contrainte, espace et valeur
---@param help string Texte d'aide des touches
---@param border integer Couleur U32 imgui de la bordure
function editor_ezObjectSelect_modalOperatorCommon.drawHud(prefix, details, help, border) end

--- Cache le curseur système et dessine au curseur un point avec des chevrons (rotate : tangents ; scale : radiaux ; translate : 4 directions) et, hors translate, une ligne pointillée du pivot à la souris.
---Source : lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua:206
---@param kind string "rotate", "scale" ou "translate"
---@param pivotScreen ImVec2|nil Pivot en coordonnées écran (rien n'est dessiné si nil)
function editor_ezObjectSelect_modalOperatorCommon.drawInteractionHint(kind, pivotScreen) end

--- Termine la session : confirm appelle transformSession.finish (si rien n'est validé, renvoie "cancel"), sinon transformSession.cancel ; rétablit le curseur.
---Source : lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua:137
---@param result string "confirm" ou "cancel"
---@return string  résultat effectif
---@return any  informations de complétion renvoyées par transformSession.finish
function editor_ezObjectSelect_modalOperatorCommon.finish(result) end

--- Teste les touches de fin.
---Source : lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua:128
---@return string|nil  "cancel" (Échap/clic droit), "confirm" (Entrée, Entrée pavé, clic gauche dans le viewport) ou nil
function editor_ezObjectSelect_modalOperatorCommon.finishRequested() end

--- Normalise un vecteur ; renvoie fallback si sa longueur est <= 0.0001.
---Source : lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua:22
---@param vector vec3 Vecteur à normaliser
---@param fallback vec3 Valeur de repli
---@return vec3
function editor_ezObjectSelect_modalOperatorCommon.normalized(vector, fallback) end

--- Projette un point monde en coordonnées écran. nil si le point est derrière la caméra ou quasi dans son plan (profondeur <= 0.0001).
---Source : lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua:153
---@param camera table Contexte caméra (pos, forward, right, up, halfTan, aspect, viewportX/Y, width, height)
---@param point vec3 Point monde
---@return ImVec2|nil
function editor_ezObjectSelect_modalOperatorCommon.projectToScreen(camera, point) end

--- Intersection d'un rayon avec un plan.
---Source : lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua:37
---@param ray table|nil {origin, direction}
---@param planePoint vec3 Point du plan
---@param planeNormal vec3 Normale du plan
---@return vec3|nil  Point d'intersection, nil si rayon parallèle (|denominateur| <= 0.0001) ou sans rayon
function editor_ezObjectSelect_modalOperatorCommon.rayPlanePoint(ray, planePoint, planeNormal) end

--- Masque ou ré-affiche le curseur via l'objet Canvas (setCursorVisible).
---Source : lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua:261
---@param hidden boolean true pour masquer
function editor_ezObjectSelect_modalOperatorCommon.setInteractionCursorHidden(hidden) end

--- Définit l'espace local/monde par défaut et l'applique à la contrainte active ; ignore ensuite la touche 4 de la rangée du haut pour la saisie numérique à la prochaine mise à jour.
---Source : lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua:104
---@param state table|nil État
---@param localSpace boolean true = local
---@return boolean  false si state est nil
function editor_ezObjectSelect_modalOperatorCommon.setLocalSpace(state, localSpace) end

--- Lit les touches X/Y/Z et met à jour state.constraint = {axis, exclude, localSpace}.
---Source : lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua:83
---@param state table État de l'opérateur
---@param allowExclude boolean Si true, Shift maintenu signifie « exclure cet axe »
---@return boolean  true si la contrainte a changé cette frame
function editor_ezObjectSelect_modalOperatorCommon.updateConstraint(state, allowExclude) end

--- Met à jour la saisie numérique (transformNumericInput) et renvoie la valeur saisie.
---Source : lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua:122
---@param state table État
---@return number|nil  valeur saisie ou nil
function editor_ezObjectSelect_modalOperatorCommon.updateNumeric(state) end

