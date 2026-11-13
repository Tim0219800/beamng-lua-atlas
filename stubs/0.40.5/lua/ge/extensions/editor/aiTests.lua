---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/aiTests.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil de l'éditeur « Vehicle AI Path/Plan Debug » (menu Debug des fenêtres de l'éditeur). Deux onglets : « Route » permet de définir un départ, une arrivée et des waypoints (marqueurs déplaçables, ou position du véhicule joueur / de la caméra), calcule la route sur le navgraph (gameplay/route/route), l'affiche avec debugDrawer et peut l'envoyer aux ground markers ; « AI Vehicles » permet de sélectionner des véhicules IA, régler leurs paramètres (aggression, turnForceCoef, awarenessForceCoef, edgeDist, lookAheadKv, staticFrictionCoefMult), puis lancer, arrêter, replacer ou recharger tous les véhicules sur la route courante ou un chemin aléatoire de 2000 m. Utile pour comparer le comportement de l'IA avec des réglages différents.
--- Accès : extension `editor_aiTests` : `extensions.load("editor_aiTests")`, puis la globale `editor_aiTests`
---@class editor_aiTests
editor_aiTests = {}

--- Hook émis quand l'éditeur est fermé : réactive les collisions dynamiques si l'outil les avait désactivées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/aiTests.lua:404
function editor_aiTests.onEditorDeactivated() end

--- Hook de dessin de l'éditeur : affiche la fenêtre à onglets Route / AI Vehicles.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/aiTests.lua:384
function editor_aiTests.onEditorGui() end

--- Hook émis à l'initialisation de l'éditeur : enregistre la fenêtre (520x420) et son entrée de menu dans le groupe Debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/aiTests.lua:410
function editor_aiTests.onEditorInitialized() end

