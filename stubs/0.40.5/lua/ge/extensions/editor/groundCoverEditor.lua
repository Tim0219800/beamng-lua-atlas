---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/groundCoverEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Éditeur de GroundCover (herbe, cailloux, billboards répartis sur le terrain) de l'éditeur de monde. Fenêtre « Ground Cover Editor » en deux colonnes : liste des objets GroundCover à gauche, détails à droite (types jusqu'à 8, champs d'objet comme reflectScale/maxBillboardTiltAngle/shapesCastShadows, paramètres de vent windDirection/windGust*/windTurbulence*, panneau de validation). Les modifications passent par setField/postApply et l'historique d'actions de l'éditeur. Charge l'extension editor_inspector.
--- Accès : extension `editor_groundCoverEditor` : `extensions.load("editor_groundCoverEditor")`, puis la globale `editor_groundCoverEditor`
---@class editor_groundCoverEditor
editor_groundCoverEditor = {}

--- Hook appelé chaque frame par l'éditeur : dessine la fenêtre (tableau à deux colonnes : liste d'objets et détails ; repli en affichage simple si le tableau ne peut pas être ouvert).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/groundCoverEditor.lua:1914
function editor_groundCoverEditor.onEditorGui() end

--- Hook appelé à l'initialisation de l'éditeur : enregistre la fenêtre (920x720), le mode d'édition groundCoverEditMode et l'entrée de menu « Ground Cover Editor » (groupe Terrain).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/groundCoverEditor.lua:1960
function editor_groundCoverEditor.onEditorInitialized() end

--- Hook appelé quand la sélection d'objets de l'éditeur change : retient le premier GroundCover sélectionné et invalide le cache de validation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/groundCoverEditor.lua:1952
function editor_groundCoverEditor.onEditorObjectSelectionChanged() end

--- Affiche la fenêtre de l'éditeur de GroundCover et active son mode d'édition. Utilisable par script ou par un autre outil.
---Source : lua/ge/extensions/editor/groundCoverEditor.lua:1943
function editor_groundCoverEditor.show() end

