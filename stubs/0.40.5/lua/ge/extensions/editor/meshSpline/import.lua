---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/meshSpline/import.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Import dans l'outil Mesh Spline : transforme des objets TSStatic déjà placés dans le niveau en une mesh spline équivalente. Les TSStatic sont ordonnés en polyligne (editor/toolUtilities/fitPoly), simplifiés (RDP), analysés (motif de meshes, capuchons de début et de fin) puis convertis ; les objets d'origine sont supprimés, leurs groupes vides aussi, et l'opération est enregistrée dans l'historique (undo/redo). Appelé depuis meshSpline.lua (menu contextuel du scenetree ou polygone de sélection).
--- Accès : extension `editor_meshSpline_import` : `extensions.load("editor_meshSpline_import")`, puis la globale `editor_meshSpline_import`
---@class editor_meshSpline_import
editor_meshSpline_import = {}

--- Convertit les TSStatic donnés en une mesh spline : filtre les TSStatic valides, les ordonne en polyligne, crée la spline, supprime les objets d'origine (et leurs groupes devenus vides), enregistre l'action d'historique et déclenche le rechargement de la collision.
---Source : lua/ge/extensions/editor/meshSpline/import.lua:508
---@param collection integer[] Identifiants d'objets (typiquement editor.selection.object).
function editor_meshSpline_import.convertTSStatics2MeshSpline(collection) end

--- Gère la mise à jour différée après un import : si un import vient d'avoir lieu, compte les images ; à la 2e, marque la dernière mesh spline comme isDirty pour forcer sa reconstruction une fois la collision rechargée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshSpline/import.lua:35
function editor_meshSpline_import.handleDelayedSplineUpdates() end

--- Importe une mesh spline à partir d'un polygone de sélection dessiné par l'utilisateur : collecte les TSStatic dont la position est dans le polygone (pos:inPolygon) puis les convertit.
---Source : lua/ge/extensions/editor/meshSpline/import.lua:627
---@param polygon table Polygone de sélection (liste de points) fourni par toolUtilities/polygon.
function editor_meshSpline_import.importFromPolygon(polygon) end

