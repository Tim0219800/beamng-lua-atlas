---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/dependencyTree.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil de développement qui analyse les fichiers de contenu du niveau 'levels/gridmap' (*.level.json, *.material.json, *.datablock.json et *.meshes.json) pour construire un graphe de dépendances : chaque entité déclare ce qu'elle fournit (provides : nom d'objet, matériau mapTo, shape) et ce dont elle dépend (deps : fichiers, textures, matériaux, shapes, objets). Le résultat est écrit dans dependencytree.json. Un moddeur peut s'en servir pour savoir quelles textures, matériaux et formes un niveau utilise.
--- Accès : extension `util_dependencyTree` : `extensions.load("util_dependencyTree")`, puis la globale `util_dependencyTree`
---@class util_dependencyTree
util_dependencyTree = {}

--- Analyse tous les fichiers de contenu du dossier, remplit la liste d'entités (deps et provides) et l'écrit dans dependencytree.json (JSON indenté).
---Source : lua/ge/extensions/util/dependencyTree.lua:220
function util_dependencyTree.test() end

