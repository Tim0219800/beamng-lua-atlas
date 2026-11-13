---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/bakeTest.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil de développement interne : après le démarrage d'une mission, il lance le « baker » de matériaux GPU (bakeShapeMaterialsPBR) puis l'export glTF (exportShapeToGltf) sur une liste figée de 10 bâtiments du niveau west_coast_usa, pour valider la chaîne de bout en bout. Les résultats (atlas PNG et fichier .gltf) sont écrits dans /temp/bakeTest/<nom>/.
--- Accès : extension `util_bakeTest` : `extensions.load("util_bakeTest")`, puis la globale `util_bakeTest`
---@class util_bakeTest
util_bakeTest = {}

--- Hook appelé après le démarrage d'une mission : arme le traitement et lance une attente de 60 frames.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/bakeTest.lua:50
function util_bakeTest.onClientPostStartMission() end

--- Hook appelé à chaque frame : après l'attente, traite un mesh par frame (cuisson puis export glTF) jusqu'à la fin de la liste.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/bakeTest.lua:55
function util_bakeTest.onUpdate() end

