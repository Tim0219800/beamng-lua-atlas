---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/notebook/test/testNotebook.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tests manuels du carnet de notes de rallye (notebook), à lancer depuis la console Lua du jeu. testAll() enchaîne dix tests avec une assertion maison (assertEqual : journalise 'I' si OK, log 'E' puis error() au premier échec) puis affiche les compteurs total/passed/failed. Les tests couvrent la migration du stockage structuré (schémas v1, v2, v3 vers six emplacements), la suppression des champs hérités (arcDegrees, intensity, direction, lengthFeel…), la projection de mesures vivantes (structuredForProjection) et l'ordre distance/modificateurs de compositorUtil.compositePhraseEntries.
--- Accès : extension `gameplay_rally_notebook_test_testNotebook` : `extensions.load("gameplay_rally_notebook_test_testNotebook")`, puis la globale `gameplay_rally_notebook_test_testNotebook`
---@class gameplay_rally_notebook_test_testNotebook
gameplay_rally_notebook_test_testNotebook = {}

--- Exécute tous les tests (structured : désérialisation, sérialisation, migration, lengthMode, v1 -> emplacements fixes, aller-retour v3, v2 avec emplacements vides, slotItem ; projection de mesure d'un Pacenote factice ; ordre distance/modificateurs du compositeur) et affiche les compteurs avec dump().
---Source : lua/ge/extensions/gameplay/rally/notebook/test/testNotebook.lua:384
function gameplay_rally_notebook_test_testNotebook.testAll() end

