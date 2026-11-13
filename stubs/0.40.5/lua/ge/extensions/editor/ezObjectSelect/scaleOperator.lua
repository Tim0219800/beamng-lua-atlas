---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/scaleOperator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Opérateur modal « Scale » (touche S) de l'outil Easy Select. Au démarrage il ouvre une session de transformation (modalOperatorCommon.begin, historique « EasySelectScale ») ; le facteur d'échelle est la distance souris-pivot à l'écran divisée par la distance initiale (ou une valeur saisie au clavier), bornée à [0.0001, 100000]. Contraintes d'axe X/Y/Z, Shift+axe pour exclure un axe, double appui pour l'espace local. Clic gauche/Entrée valide, clic droit/Échap annule.
--- Accès : extension `editor_ezObjectSelect_scaleOperator` : `extensions.load("editor_ezObjectSelect_scaleOperator")`, puis la globale `editor_ezObjectSelect_scaleOperator`
---@class editor_ezObjectSelect_scaleOperator
editor_ezObjectSelect_scaleOperator = {}

--- Démarre l'opérateur sur la sélection. Renvoie false si déjà actif, si la session n'a pas pu démarrer ou si le pivot n'est pas projetable à l'écran (la session est alors annulée).
---Source : lua/ge/extensions/editor/ezObjectSelect/scaleOperator.lua:46
---@param options table|nil {defaultLocal = boolean} : espace local par défaut
---@return boolean  true si démarré
function editor_ezObjectSelect_scaleOperator.begin(options) end

--- Annule l'opérateur en cours (restaure les objets).
---Source : lua/ge/extensions/editor/ezObjectSelect/scaleOperator.lua:97
---@return boolean  true si un opérateur était actif
function editor_ezObjectSelect_scaleOperator.cancel() end

--- Dessine l'indicateur près du pivot et le HUD (contrainte UNIFORM/axe, WORLD/LOCAL, facteur « 1.000x », aide des touches).
---Source : lua/ge/extensions/editor/ezObjectSelect/scaleOperator.lua:115
function editor_ezObjectSelect_scaleOperator.drawScreen() end

--- Ids des objets manipulés par la session ({} si inactif).
---Source : lua/ge/extensions/editor/ezObjectSelect/scaleOperator.lua:111
---@return table  liste d'ids
function editor_ezObjectSelect_scaleOperator.getObjectIds() end

--- Indique si l'opérateur est en cours.
---Source : lua/ge/extensions/editor/ezObjectSelect/scaleOperator.lua:107
---@return boolean
function editor_ezObjectSelect_scaleOperator.isActive() end

--- Bascule espace local/monde pour la contrainte courante.
---Source : lua/ge/extensions/editor/ezObjectSelect/scaleOperator.lua:103
---@param localSpace boolean true pour l'espace local
---@return boolean  résultat de modalOperatorCommon.setLocalSpace
function editor_ezObjectSelect_scaleOperator.setLocalSpace(localSpace) end

--- À appeler chaque frame : gère fin demandée, contraintes, saisie numérique, calcule le facteur, l'applique via transformSession.updateScale et dessine le gizmo.
---Source : lua/ge/extensions/editor/ezObjectSelect/scaleOperator.lua:67
---@return string|nil  "active" tant que l'opérateur tourne ; sinon résultat de finish (valeur résolue et complétion) ; nil si inactif
function editor_ezObjectSelect_scaleOperator.update() end

--- Renvoie true si la touche S vient d'être pressée.
---Source : lua/ge/extensions/editor/ezObjectSelect/scaleOperator.lua:42
---@return boolean  touche S pressée cette frame
function editor_ezObjectSelect_scaleOperator.wantsBegin() end

