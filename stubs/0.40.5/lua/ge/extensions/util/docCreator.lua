---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/docCreator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil interne de BeamNG pour générer les données JSON et les ressources (images copiées avec un nom basé sur le hash SHA1) qui alimentent la documentation en ligne (système Hugo). Pour chaque langue disponible, il exporte la liste des niveaux et des véhicules (modèles et configurations) ; il exporte aussi la version du jeu, les matériaux physiques, les valeurs par défaut JBeam, les statistiques JBeam et les contrôleurs de jeu testés (d'après /settings/inputmaps/). Tout est écrit dans le dossier doc-out/ (data/ et resources/). Peu utile à un moddeur, sauf comme exemple d'accès aux listes de niveaux/véhicules.
--- Accès : extension `util_docCreator` : `extensions.load("util_docCreator")`, puis la globale `util_docCreator`
---@class util_docCreator
util_docCreator = {}

--- Crée un job asynchrone qui génère toutes les données de documentation (niveaux, véhicules par langue, puis données communes) dans doc-out/data/ et doc-out/resources/.
---Source : lua/ge/extensions/util/docCreator.lua:290
function util_docCreator.run() end

--- Comme run(), mais quitte le jeu (shutdown(0)) une fois la génération terminée. Prévu pour une génération en ligne de commande.
---Source : lua/ge/extensions/util/docCreator.lua:294
function util_docCreator.runAndQuit() end

