---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/assemblySpline/import.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Import pour l'outil Assembly Spline : convertit des objets TSStatic déjà posés dans le niveau (compatibles avec le kit d'assemblage, c'est-à-dire ayant des ancres nommées 'nail.*') en une assembly spline. Il reconstruit le kit d'assemblage et la molécule à partir des meshes, ajuste une polyligne sur les composants racine (fitPoly), crée la spline, supprime les TSStatic d'origine (et les groupes vides) et enregistre l'action dans l'historique d'annulation (undo/redo restaure les TSStatic sauvegardés). Utilisé par le menu clic droit de l'arbre de scène et par le polygone de sélection de l'outil.
--- Accès : extension `editor_assemblySpline_import` : `extensions.load("editor_assemblySpline_import")`, puis la globale `editor_assemblySpline_import`
---@class editor_assemblySpline_import
editor_assemblySpline_import = {}

--- Convertit une sélection de TSStatic en assembly spline : filtre les compatibles, reconstruit le kit et la molécule, ajuste la polyligne, crée la spline, supprime les objets d'origine, recharge la collision (be:reloadCollision) et enregistre l'action « Convert TSStatics to Assembly Spline » dans editor.history.
---Source : lua/ge/extensions/editor/assemblySpline/import.lua:566
---@param collection integer[]|nil Ids des objets TSStatic sélectionnés.
function editor_assemblySpline_import.convertTSStatics2AssemblySpline(collection) end

--- Mise à jour différée après un import : au bout de 2 appels, marque la dernière assembly spline comme sale pour la reconstruire une fois la collision mise à jour. Appelée à chaque frame par onEditorGui de assemblySpline.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/assemblySpline/import.lua:42
function editor_assemblySpline_import.handleDelayedSplineUpdates() end

--- Cherche tous les TSStatic du niveau dont la position est dans le polygone et les convertit via convertTSStatics2AssemblySpline.
---Source : lua/ge/extensions/editor/assemblySpline/import.lua:651
---@param polygon table Polygone de sélection (liste de points).
function editor_assemblySpline_import.importFromPolygon(polygon) end

--- Indique si l'objet est un TSStatic ayant au moins une ancre dont le nom commence par « nail. ».
---Source : lua/ge/extensions/editor/assemblySpline/import.lua:145
---@param obj table|nil Objet scène.
---@return boolean  true si compatible.
function editor_assemblySpline_import.validateToolCompatibleTSStatic(obj) end

