---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/decalSpline/populate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module qui peuple une spline de decals avec des instances de decals (DecalData + instances du moteur) le long de sa longueur, pour l'outil Decal Spline. Il échantillonne la spline par abscisse curviligne avec un pas de (4.0 m de longueur de decal + spline.spacing), répartit les composants (matériaux) en alternance ou au hasard selon leur probabilité, oriente chaque decal avec le repère de Frenet, jitter sur Z et rotation préalable, et le place au milieu de sa cellule. Il maintient les templates DecalData partagés dans un SimGroup « DecalSpline - Templates … » sous MissionGroup, avec des compteurs d'instances pour supprimer un template devenu inutile.
--- Accès : extension `editor_decalSpline_populate` : `extensions.load("editor_decalSpline_populate")`, puis la globale `editor_decalSpline_populate`
---@class editor_decalSpline_populate
editor_decalSpline_populate = {}

--- Reprend les decals libérés par release() encore présents dans la scène (retrouvés par uid via Engine.Render.DecalMgr), avec leurs templates et leur dossier, et rétablit les compteurs.
---Source : lua/ge/extensions/editor/decalSpline/populate.lua:291
---@param spline table spline qui reprend ses decals
---@param kept table table renvoyée par release()
function editor_decalSpline_populate.adopt(spline, kept) end

--- Indique si l'outil détient des decals pour cette spline.
---Source : lua/ge/extensions/editor/decalSpline/populate.lua:265
---@param spline table spline testée
---@return boolean  true s'il existe au moins une instance
function editor_decalSpline_populate.hasAny(spline) end

--- Crée les instances de decals le long de la spline, avec création des templates DecalData au besoin (texRows, texCols, material).
---Source : lua/ge/extensions/editor/decalSpline/populate.lua:171
---@param spline table spline de decals (divPoints, tangents, normals, spacing, jitter, composants 1 à 4…)
---@param splines table[] toutes les splines, nettoyées si le dossier de templates doit être recréé
function editor_decalSpline_populate.populateDecalSpline(spline, splines) end

--- Quand lignes/colonnes (numRows/numCols) changent pour un composant, copie ces valeurs dans les autres composants qui utilisent le même matériau et borne leur frame à numRows*numCols-1.
---Source : lua/ge/extensions/editor/decalSpline/populate.lua:313
---@param spline table spline modifiée
---@param componentIdx integer numéro du composant modifié, de 1 à 4
function editor_decalSpline_populate.propagateRowsCols(spline, componentIdx) end

--- Pour un rechargement Lua : lâche les decals d'une spline verrouillée sans les supprimer et renvoie leurs uid par matériau, avec les templates utilisés et l'id du dossier, pour que adopt() puisse les reprendre. Leurs templates restent comptés.
---Source : lua/ge/extensions/editor/decalSpline/populate.lua:275
---@param spline table spline verrouillée
---@return table  {folderId, uids = {matériau = uid[]}, templates = {matériau = id}}
function editor_decalSpline_populate.release(spline) end

--- Supprime le dossier (SimGroup) des templates partagés, sauf si des decals conservés par une spline verrouillée lors d'un rechargement Lua l'utilisent encore.
---Source : lua/ge/extensions/editor/decalSpline/populate.lua:160
function editor_decalSpline_populate.removeFolder() end

--- Supprime de la scène les instances de decals de la spline (editor.deleteDecalInstance), décrémente les compteurs puis supprime les templates dont le compteur tombe sous 1.
---Source : lua/ge/extensions/editor/decalSpline/populate.lua:129
---@param spline table spline dont on retire les decals
function editor_decalSpline_populate.tryRemove(spline) end

