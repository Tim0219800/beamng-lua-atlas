---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rayCastTest.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil de debug de l'éditeur (menu Debug > Raycast Test) pour comparer deux types de lancers de rayon. Mode 0 « Gameengine Raycast » : un gizmo de translation place un point, un Engine.castRay vertical (±4 m) dessine le point d'impact et la normale. Mode 1 « Physics Raycast » : une grille de rayons castRayStatic est tirée autour du curseur et les impacts sont colorés selon la distance à la caméra. Le mode est stocké dans la préférence raycastTest.general.rayCastMode.
--- Accès : extension `editor_rayCastTest` : `extensions.load("editor_rayCastTest")`, puis la globale `editor_rayCastTest`
---@class editor_rayCastTest
editor_rayCastTest = {}

--- Hook : dessine la fenêtre « Raycast Test » avec un combo pour choisir le mode de rayon.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rayCastTest.lua:32
function editor_rayCastTest.onEditorGui() end

--- Hook : déclare le mode d'édition checkTerrainCastRay (action map « RayCastTest »), enregistre la fenêtre et l'entrée de menu Debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rayCastTest.lua:133
function editor_rayCastTest.onEditorInitialized() end

--- Hook : enregistre la catégorie de préférences raycastTest/general avec rayCastMode (nombre, défaut 0, caché).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rayCastTest.lua:123
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_rayCastTest.onEditorRegisterPreferences(prefsRegistry) end

--- Hook : si la fenêtre masquée est « raycastTest », repasse en mode d'édition objectSelect.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rayCastTest.lua:145
---@param wndName string Nom de la fenêtre masquée.
function editor_rayCastTest.onEditorToolWindowHide(wndName) end

--- Hook appelé au chargement de l'extension ; vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rayCastTest.lua:47
function editor_rayCastTest.onExtensionLoaded() end

