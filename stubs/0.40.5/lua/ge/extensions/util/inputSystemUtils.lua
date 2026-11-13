---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/inputSystemUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outils de maintenance pour les fichiers inputmaps (profils de contrôleurs dans /settings/inputmaps/, format JSON). printStats compte les liaisons et affiche les 20 actions les plus utilisées ; resave relit tous les inputmaps, complète vidpid et vendorName (d'après vendorNames.json), trie les liaisons par contrôle puis action et les réécrit avec un formatage JSON personnalisé. Destiné aux développeurs du jeu et aux créateurs de profils de contrôleurs.
--- Accès : extension `util_inputSystemUtils` : `extensions.load("util_inputSystemUtils")`, puis la globale `util_inputSystemUtils`
---@class util_inputSystemUtils
util_inputSystemUtils = {}

--- Parcourt tous les fichiers JSON dont le chemin contient inputmaps/, affiche le nombre total de liaisons et les 20 actions les plus fréquentes.
---Source : lua/ge/extensions/util/inputSystemUtils.lua:20
function util_inputSystemUtils.printStats() end

--- Réécrit tous les inputmaps avec un formatage normalisé (clé control en tête, bindings en dernier, petites tables repliées sur une ligne) ; n'écrit le fichier que si le contenu change, et affiche le résultat par fichier.
---Source : lua/ge/extensions/util/inputSystemUtils.lua:77
function util_inputSystemUtils.resave() end

