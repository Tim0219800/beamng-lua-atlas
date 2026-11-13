---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/transformOperator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Opérateur de translation « modal » d'Easy Object Select, façon Blender : la touche G démarre le déplacement de la sélection, X/Y/Z contraignent à un axe, Shift+axe à un plan, appuyer deux fois sur le même axe bascule monde/local, des chiffres tapés donnent une distance exacte (transformNumericInput), clic gauche ou Entrée confirment, clic droit ou Échap annulent. S'appuie sur transformSession pour appliquer et valider (historique annulable) et sur transformGizmo/débug pour les guides.
--- Accès : extension `editor_ezObjectSelect_transformOperator` : `extensions.load("editor_ezObjectSelect_transformOperator")`, puis la globale `editor_ezObjectSelect_transformOperator`
---@class editor_ezObjectSelect_transformOperator
editor_ezObjectSelect_transformOperator = {}

--- Démarre l'opération sur la sélection éditeur courante (ancre = dernier objet) : ouvre une transformSession, mémorise pivot, caméra, rayon de départ, axes monde/locaux, et masque le curseur.
---Source : lua/ge/extensions/editor/ezObjectSelect/transformOperator.lua:259
---@param options table|nil defaultLocal (boolean) : démarrer les contraintes en espace local.
---@return boolean  true si l'opération a démarré.
function editor_ezObjectSelect_transformOperator.begin(options) end

--- Annule l'opération en cours et restaure les transformations d'origine.
---Source : lua/ge/extensions/editor/ezObjectSelect/transformOperator.lua:332
---@return boolean  true si une opération était active.
function editor_ezObjectSelect_transformOperator.cancel() end

--- Dessine l'infobulle écran près du curseur : contrainte, espace, valeur (distance ou saisie), grille, rappel des raccourcis.
---Source : lua/ge/extensions/editor/ezObjectSelect/transformOperator.lua:372
---@param options table|nil gridSize (m), gridRelative (boolean) pour l'affichage de la grille.
function editor_ezObjectSelect_transformOperator.drawScreen(options) end

--- IDs des objets manipulés par la session.
---Source : lua/ge/extensions/editor/ezObjectSelect/transformOperator.lua:350
---@return integer[]  Liste d'IDs (vide si inactive).
function editor_ezObjectSelect_transformOperator.getObjectIds() end

--- Indique si une opération est en cours.
---Source : lua/ge/extensions/editor/ezObjectSelect/transformOperator.lua:346
---@return boolean  true si active.
function editor_ezObjectSelect_transformOperator.isActive() end

--- Fixe l'espace local/monde par défaut et l'applique à la contrainte courante.
---Source : lua/ge/extensions/editor/ezObjectSelect/transformOperator.lua:338
---@param localSpace boolean true pour local.
---@return boolean  false si aucune opération active.
function editor_ezObjectSelect_transformOperator.setLocalSpace(localSpace) end

--- Résumé de l'état : contrainte ("VIEW", "X", "SHIFT+X"…), espace ("WORLD"/"LOCAL"), texte numérique saisi et delta courant.
---Source : lua/ge/extensions/editor/ezObjectSelect/transformOperator.lua:354
---@return table|nil  {constraint, space, numeric, delta}, ou nil si inactive.
function editor_ezObjectSelect_transformOperator.status() end

--- À appeler chaque frame tant que l'opération est active : gère annulation/confirmation, contraintes, saisie numérique, calcule le delta et l'applique via transformSession.updateDelta, puis dessine les guides.
---Source : lua/ge/extensions/editor/ezObjectSelect/transformOperator.lua:300
---@param options table|nil gridSize (m), gridRelative (boolean).
---@return string|nil  nil si inactive ; "active" en cours ; "confirm" ou "cancel" à la fin.
---@return table|nil  À la confirmation, infos de fin ({anchorDistance} en m) renvoyées par transformSession.finish.
function editor_ezObjectSelect_transformOperator.update(options) end

--- Indique si la touche G vient d'être pressée.
---Source : lua/ge/extensions/editor/ezObjectSelect/transformOperator.lua:255
---@return boolean  true si G pressée cette frame.
function editor_ezObjectSelect_transformOperator.wantsBegin() end

