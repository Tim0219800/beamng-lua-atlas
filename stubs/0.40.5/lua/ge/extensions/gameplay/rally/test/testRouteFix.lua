---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/test/testRouteFix.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension de test de développement pour le module gameplay/route/route : au chargement, elle crée une Route avec un petit chemin de 3 points codés en dur, puis à chaque frame dessine le chemin (sphères, prismes, numéros) via debugDrawer et fait suivre le véhicule joueur par route:trackVehicle. Se charge avec extensions.load('gameplay_rally_test_testRouteFix'). Sans intérêt en jeu normal.
--- Accès : extension `gameplay_rally_test_testRouteFix` : `extensions.load("gameplay_rally_test_testRouteFix")`, puis la globale `gameplay_rally_test_testRouteFix`
---@class gameplay_rally_test_testRouteFix
gameplay_rally_test_testRouteFix = {}

--- Hook appelé au chargement de l'extension : crée la Route et appelle setupPathMulti sur le chemin de test.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/test/testRouteFix.lua:72
function gameplay_rally_test_testRouteFix.onExtensionLoaded() end

--- Hook appelé au déchargement de l'extension ; corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/test/testRouteFix.lua:77
function gameplay_rally_test_testRouteFix.onExtensionUnloaded() end

--- Hook appelé à chaque frame : dessine la route et appelle route:trackVehicle sur le véhicule joueur 0 s'il existe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/test/testRouteFix.lua:56
function gameplay_rally_test_testRouteFix.onUpdate() end

--- Hook appelé quand un véhicule est remis en place ; corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/test/testRouteFix.lua:69
function gameplay_rally_test_testRouteFix.onVehicleResetted() end

