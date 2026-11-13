---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/objectScreenSizeViz.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil de débogage « Object Screen Size » (menu Debug) du World Editor. Pour les objets (editor.selection.object) et éléments de forêt (editor.selection.forestItem) sélectionnés, il calcule la distance à la caméra et la taille en pixels à l'écran de leur boîte englobante monde (projection des 8 coins avec le champ de vision de la caméra). Il peut dessiner la boîte (lignes orange), une ligne caméra-centre (magenta) et un rectangle de superposition à l'écran. Utile pour régler les distances de LOD et la taille visible des objets.
--- Accès : extension `editor_objectScreenSizeViz` : `extensions.load("editor_objectScreenSizeViz")`, puis la globale `editor_objectScreenSizeViz`
---@class editor_objectScreenSizeViz
editor_objectScreenSizeViz = {}

--- Hook d'éditeur appelé à chaque frame : dessine la fenêtre « Object Screen Size » (cases à cocher d'affichage et résultats par objet sélectionné) et les lignes de debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/objectScreenSizeViz.lua:160
function editor_objectScreenSizeViz.onEditorGui() end

--- Hook appelé à l'initialisation de l'éditeur : enregistre la fenêtre (480x320) et l'entrée de menu « Object Screen Size » (groupe Debug).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/objectScreenSizeViz.lua:259
function editor_objectScreenSizeViz.onEditorInitialized() end

