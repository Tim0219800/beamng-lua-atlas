---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/meshSpline/populate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Placement des meshes statiques le long d'une mesh spline. À partir de la géométrie de la spline, il échantillonne des positions (période = longueur du mesh + espacement, plancher de 10 % de la longueur ou 0.1 m), choisit les composants (mesh central, capuchons, alias), gère des réserves (pools) de TSStatic dans le dossier de scène de la spline, applique jitter, décalage vertical et rotation, et synchronise l'état verrouillé. Une spline est « discrète » (lampadaires, espacement > 5 m) ou « en tuilage » (barrières bout à bout).
--- Accès : extension `editor_meshSpline_populate` : `extensions.load("editor_meshSpline_populate")`, puis la globale `editor_meshSpline_populate`
---@class editor_meshSpline_populate
editor_meshSpline_populate = {}

--- Reprend les meshes lâchés par release() (ceux encore dans la scène), tels quels, et mémorise l'état de verrou de la spline.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshSpline/populate.lua:464
---@param spline table Mesh spline.
---@param ids table<string, integer[]> Table renvoyée par release().
function editor_meshSpline_populate.adopt(spline, ids) end

--- Appelle fn(mesh, true) pour chaque mesh que l'outil détient pour cette spline (le « each » de splineLock).
---Source : lua/ge/extensions/editor/meshSpline/populate.lua:252
---@param spline table Mesh spline.
---@param fn function Callback appelé avec le mesh et true.
function editor_meshSpline_populate.eachObject(spline, fn) end

--- Pour l'étiquette « Lock ends » : renvoie l'espacement centre à centre effectif (m) et le nombre d'intervalles que produirait l'ajustement uniforme, soit n = max(1, round(longueur / période)) et longueur / n. Renvoie nil si le calcul est impossible (moins de 2 points, pas de longueur de mesh).
---Source : lua/ge/extensions/editor/meshSpline/populate.lua:487
---@param spline table|nil Mesh spline.
---@return number|nil  Espacement effectif en mètres.
---@return integer|nil  Nombre d'intervalles.
function editor_meshSpline_populate.evenFitInfo(spline) end

--- Dit si la spline est « discrète » (éléments posés sur les points d'échantillonnage, comme des lampadaires) plutôt qu'en tuilage : vrai si spacing dépasse 5 m. L'interface s'en sert pour afficher l'option « Lock ends ».
---Source : lua/ge/extensions/editor/meshSpline/populate.lua:480
---@param spline table|nil Mesh spline.
---@return boolean|nil  true/false, ou nil/false si la spline ou son spacing est absent.
function editor_meshSpline_populate.isDiscreteSpline(spline) end

--- Plancher du curseur « Spacing » pour cette pièce : la valeur qui atteint la période minimale autorisée (recouvrement maximal). En dessous, la période serait de toute façon bornée.
---Source : lua/ge/extensions/editor/meshSpline/populate.lua:65
---@param spline table Mesh spline avec extentsL_Center / extentsW_Center et rot.
---@return number|nil  Espacement minimal en mètres, nil si la longueur du mesh n'est pas encore mesurée.
function editor_meshSpline_populate.minSpacingFor(spline) end

--- Peuple la spline avec des instances de mesh statique sur sa longueur : échantillonne, répartit les composants, ajuste les réserves de meshes puis positionne et oriente chaque instance. Sort sans rien faire si la spline est verrouillée avec ses meshes, si la longueur ou le chemin du mesh central manque, ou si moins de 2 points subdivisés.
---Source : lua/ge/extensions/editor/meshSpline/populate.lua:294
---@param spline table Mesh spline à peupler.
---@param splineIdx integer Indice de la spline dans la liste (base 1).
function editor_meshSpline_populate.populateMeshSpline(spline, splineIdx) end

--- Pour un rechargement Lua : l'outil lâche les meshes d'une spline verrouillée sans les supprimer (ils appartiennent au niveau) et renvoie leurs ids par composant, pour adopt().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshSpline/populate.lua:449
---@param spline table Mesh spline verrouillée.
---@return table<string, integer[]>  Ids des meshes par identifiant de composant.
function editor_meshSpline_populate.release(spline) end

--- Supprime de la scène les meshes statiques de la spline (s'ils existent encore) et oublie leur état.
---Source : lua/ge/extensions/editor/meshSpline/populate.lua:429
---@param spline table Mesh spline.
function editor_meshSpline_populate.tryRemove(spline) end

