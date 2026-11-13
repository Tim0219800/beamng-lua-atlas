---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/splineLock.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- État de verrouillage partagé par les outils de splines personnalisés de l'éditeur. Une spline verrouillée (isEnabled == false) reste dans son outil, mais les objets générés appartiennent au niveau : ils sont sauvegardés (canSave = true) et collisionnent. Une spline déverrouillée produit des objets d'aperçu transitoires (canSave = false, sans collision). Chaque outil appelle sync() depuis sa reconstruction, et fournit un itérateur `each(fn)` qui appelle fn(obj, collides, isParked) pour chaque objet qu'il possède. Tant que c'est verrouillé, l'outil ne déplace ni ne refait les objets existants : les retouches manuelles restent.
--- Accès : extension `editor_toolUtilities_splineLock` : `extensions.load("editor_toolUtilities_splineLock")`, puis la globale `editor_toolUtilities_splineLock`
---@class editor_toolUtilities_splineLock
editor_toolUtilities_splineLock = {}

--- Met un objet généré dans l'état de verrouillage : canSave = isLocked, et collisionType = 'Collision Mesh' si verrouillé et `collides`, sinon 'None'.
---Source : lua/ge/extensions/editor/toolUtilities/splineLock.lua:38
---@param obj userdata Objet de scène.
---@param isLocked boolean Spline verrouillée.
---@param collides boolean|nil Collision une fois verrouillé ; nil laisse la collision inchangée.
function editor_toolUtilities_splineLock.applyObject(obj, isLocked, collides) end

--- Enregistre l'état éditable à la main des objets d'une spline (transformation, échelle, forme pour les TSStatic, dossier), indexé par id d'objet. À prendre avant un déverrouillage qui les réinitialise, pour pouvoir annuler.
---Source : lua/ge/extensions/editor/toolUtilities/splineLock.lua:100
---@param each function Itérateur de l'outil.
---@return table  id -> { xf, scale, shape, groupId }.
function editor_toolUtilities_splineLock.capture(each) end

--- Retire d'une liste les références à des objets qui n'existent plus (par ex. supprimés à la main dans l'arbre de scène). Compacte la liste en place.
---Source : lua/ge/extensions/editor/toolUtilities/splineLock.lua:18
---@param list table Tableau d'objets de scène, modifié en place.
function editor_toolUtilities_splineLock.dropDeleted(list) end

--- Vrai si l'outil possède encore au moins un objet vivant (non parqué) pour la spline.
---Source : lua/ge/extensions/editor/toolUtilities/splineLock.lua:46
---@param each function Itérateur de l'outil.
---@return boolean  Un objet vivant existe.
function editor_toolUtilities_splineLock.hasAny(each) end

--- Remet une capture en place après le re-verrouillage qui annule un déverrouillage : forme (shapeName + postApply), transformation, échelle, dossier. Les objets créés entre-temps et absents de la capture sont supprimés. Appelle be:reloadCollision().
---Source : lua/ge/extensions/editor/toolUtilities/splineLock.lua:118
---@param rec table Résultat de capture.
---@param each function Itérateur de l'outil.
function editor_toolUtilities_splineLock.restore(rec, each) end

--- Aligne les objets générés d'une spline sur son état de verrouillage. N'agit que si l'état diffère du dernier appliqué (table `applied` id -> isLocked). Met à jour le dossier de scène (canSave, tag), les objets (applyObject, tag, remise dans le dossier si déplacé à la main). Au déverrouillage, supprime les objets du dossier portant le tag de la spline mais non possédés par l'outil. Appelle be:reloadCollision().
---Source : lua/ge/extensions/editor/toolUtilities/splineLock.lua:62
---@param applied table<any, boolean> Table id de spline -> dernier état appliqué ; modifiée.
---@param spline table Spline (id, name, isEnabled, sceneTreeFolderId).
---@param toolName string Nom de l'outil, utilisé pour le tag.
---@param each function Itérateur de l'outil.
---@return boolean  Vrai si une action a été menée.
function editor_toolUtilities_splineLock.sync(applied, spline, toolName, each) end

--- Marque un objet généré avec la spline d'origine (champs dynamiques sourceTool, sourceSplineId, sourceSplineName) pour le retrouver dans l'arbre de scène ou l'inspecteur.
---Source : lua/ge/extensions/editor/toolUtilities/splineLock.lua:31
---@param obj userdata Objet de scène.
---@param toolName string Nom de l'outil.
---@param spline table Spline avec .id et .name.
function editor_toolUtilities_splineLock.tag(obj, toolName, spline) end

