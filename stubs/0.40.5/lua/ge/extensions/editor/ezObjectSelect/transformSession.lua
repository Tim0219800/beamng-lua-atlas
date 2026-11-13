---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/transformSession.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Session de transformation (déplacement, rotation, échelle) des objets sélectionnés pour Easy Object Select. begin() mémorise la transformation et l'échelle initiales de chaque objet sélectionné ; les fonctions update* repositionnent les objets à partir de l'état initial (pas cumulatif) ; finish() enregistre le résultat dans l'historique de l'éditeur (SetObjectTransform / SetObjectScale, annulables, dans une transaction) ; cancel() restaure tout. Gère aussi la mise à jour des offsets de prefab et la remise à la verticale.
--- Accès : extension `editor_ezObjectSelect_transformSession` : `extensions.load("editor_ezObjectSelect_transformSession")`, puis la globale `editor_ezObjectSelect_transformSession`
---@class editor_ezObjectSelect_transformSession
editor_ezObjectSelect_transformSession = {}

--- Ouvre une session sur tous les objets de editor.selection.object. Renvoie false si une session existe déjà, si l'ancre n'est pas sélectionnée ou si un objet ne peut pas être manipulé.
---Source : lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:133
---@param anchorObject userdata Objet ancre (dont la position sert de référence pour la saisie de surface et la distance).
---@param options table|nil historyName (string, nom de la transaction d'historique, défaut "EasySelectDrag").
---@return boolean  true si la session est ouverte.
function editor_ezObjectSelect_transformSession.begin(anchorObject, options) end

--- Annule la session et remet transformation et échelle initiales de chaque objet.
---Source : lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:458
---@return boolean  true si une session était active.
function editor_ezObjectSelect_transformSession.cancel() end

--- Termine la session : s'il y a un changement net, ouvre une transaction d'historique et enregistre une action SetObjectTransform et/ou SetObjectScale par objet ; sinon restaure l'état initial.
---Source : lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:364
---@return boolean|nil  true si changement validé, false si aucun changement (ou pas de session), nil si la transaction n'a pas pu s'ouvrir.
---@return table|nil  {anchorDistance} (m) lorsqu'il y a un changement.
function editor_ezObjectSelect_transformSession.finish() end

--- Calcule la position voulue de l'ancre pour un point de surface (surface - grabOffset), avec accrochage à la grille éventuel.
---Source : lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:191
---@param surfacePosition vec3 Point de surface sous le curseur.
---@param options table|nil gridSize (m), gridRelative (boolean), snapZ (boolean).
---@return vec3|boolean  Position de l'ancre, ou false si pas de session / pas de grabOffset / pas de point.
function editor_ezObjectSelect_transformSession.getDesiredAnchorPosition(surfacePosition, options) end

--- IDs des objets de la session.
---Source : lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:557
---@return integer[]  Liste d'IDs (vide sans session).
function editor_ezObjectSelect_transformSession.getObjectIds() end

--- Indique si une session est ouverte.
---Source : lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:539
---@return boolean  true si active.
function editor_ezObjectSelect_transformSession.isActive() end

--- Remet les objets à la verticale (axe Z monde) en conservant leur cap, dans une transaction d'historique « ResetObjectRotation ». Refuse si une session est active.
---Source : lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:497
---@param objectIds integer[] IDs des objets à redresser.
---@return boolean  true si au moins un objet a changé.
function editor_ezObjectSelect_transformSession.resetRotation(objectIds) end

--- Vérifie que la sélection de l'éditeur est toujours exactement celle de la session et que les objets restent manipulables.
---Source : lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:543
---@return boolean  true sans session ou si la sélection correspond.
function editor_ezObjectSelect_transformSession.selectionMatches() end

--- Définit le décalage entre le point de surface saisi et la position de l'ancre.
---Source : lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:162
---@param surfacePosition vec3 Point de surface saisi.
---@param maintainRelativeZ boolean|nil Si false, le décalage vertical est mis à 0.
---@param verticalOffset number|nil Si fourni, impose le décalage vertical (prioritaire sur maintainRelativeZ).
---@return boolean  false sans session ou sans surfacePosition.
function editor_ezObjectSelect_transformSession.setGrabSurface(surfacePosition, maintainRelativeZ, verticalOffset) end

--- Déplace la sélection pour que l'ancre suive un point de surface ; peut aligner chaque objet sur la normale de surface et utiliser un fournisseur de position/normale individuels.
---Source : lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:331
---@param surfacePosition vec3 Point de surface sous le curseur.
---@param surfaceNormal vec3|nil Normale de la surface.
---@param options table gridSize, gridRelative, snapZ, followRotation (boolean), rotateSnapSize (degrés), rotateRelative (boolean), individualProvider (function(entry, position) -> {position, normal}|nil). Le paramètre doit être une table (déduit du code : options.followRotation est lu sans garde).
---@return boolean  false si pas de session ou de grabOffset.
function editor_ezObjectSelect_transformSession.update(surfacePosition, surfaceNormal, options) end

--- Translate tous les objets de delta par rapport à leur position initiale, avec accrochage à la grille optionnel (masque par axe, absolu ou relatif).
---Source : lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:198
---@param delta vec3 Déplacement en mètres, monde.
---@param options table|nil gridSize (m), gridPivot (vec3), gridMask ({x,y,z} booléens), gridRelative (boolean), snapZ (boolean).
---@return boolean  false sans session ou sans delta.
function editor_ezObjectSelect_transformSession.updateDelta(delta, options) end

--- Fait tourner tous les objets (orientation et position) autour du pivot, à partir de l'état initial.
---Source : lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:245
---@param pivot vec3 Centre de rotation.
---@param axis vec3 Axe (normalisé en interne ; longueur nulle refusée).
---@param angle number Angle en radians.
---@return boolean  true si appliqué.
function editor_ezObjectSelect_transformSession.updateRotation(pivot, axis, angle) end

--- Met à l'échelle les objets autour du pivot le long des axes donnés ; les positions sont étirées par rapport au pivot.
---Source : lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:268
---@param pivot vec3 Centre de l'échelle.
---@param axes table<string, vec3> Axes x, y, z utilisés pour étirer les positions.
---@param factors table<string, number> Facteurs {x, y, z} ; un axe est « édité » si son facteur diffère de 1.
---@return boolean  true si appliqué.
---@return number  Facteur effectif après bornage.
function editor_ezObjectSelect_transformSession.updateScale(pivot, axes, factors) end

