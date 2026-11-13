---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/objectToSplineEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil « Object To Spline Editor » du World Editor : copie un objet (TSStatic ou BeamNGVehicle) le long d'une spline guide (DecalRoad ou MeshRoad). On choisit l'objet et la spline depuis la sélection, puis on règle l'écart (gap), les décalages de début et de fin, l'axe de l'objet, le nombre maximal de copies (500 par défaut), l'orientation selon la normale du terrain, un mode alternatif, le placement dans un SimGroup et des variations aléatoires (écart, position, rotation, gaussienne). La spline est dessinée en vert et les positions prévues en jaune avec debugDrawer.
--- Accès : extension `editor_objectToSplineEditor` : `extensions.load("editor_objectToSplineEditor")`, puis la globale `editor_objectToSplineEditor`
---@class editor_objectToSplineEditor
editor_objectToSplineEditor = {}

--- Hook d'éditeur appelé à chaque frame : dessine la fenêtre « Object To Spline Editor » (sélection de l'objet et de la spline, paramètres, création) et la spline guide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/objectToSplineEditor.lua:254
function editor_objectToSplineEditor.onEditorGui() end

--- Hook appelé à l'initialisation de l'éditeur : enregistre la fenêtre (420x500) et l'entrée de menu « Object To Spline Editor ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/objectToSplineEditor.lua:490
function editor_objectToSplineEditor.onEditorInitialized() end

