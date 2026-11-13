---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/input/categories.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Table de données (le fichier retourne directement une table, pas de fonctions) listant les catégories d'actions d'entrée affichées dans l'écran des contrôles. Chaque catégorie a un ordre d'affichage, une icône et un titre (clé de traduction ou texte). Les actions de core_input_actions y font référence par leur champ `cat`.
--- Accès : extension `core_input_categories` : `extensions.load("core_input_categories")`, puis la globale `core_input_categories`
---@class core_input_categories
---@field camera table order 5, icône videocam.
---@field debug table order 11, icône bug_report, simplemenu = false.
---@field editor table order 9, simplemenu = false.
---@field flowgraph table order 10, titre 'Flowgraph Editor', simplemenu = false.
---@field gameplay table order 4, icône extension.
---@field general table order 3, icône language.
---@field menu table order 6, navigation dans les menus (rend aussi l'actionmap 'Menu').
---@field menuExtra table order 6.5, navigation de menu supplémentaire.
---@field modifier table order 0.5, icône settings : touches modificatrices.
---@field replay table order 8, icône local_movies.
---@field slowmotion table order 7, icône timer.
---@field splitscreen table order 4.5, titre 'Split Screen'.
---@field vehicle table order 2, icône directions_car.
---@field vehicle_debug table order 12, simplemenu = false.
---@field vehicle_specific table order 1, icône local_taxi : actions propres au véhicule actuel.
---@field vehicle_specific_unusable table order 1.5 : actions de véhicules non utilisables avec le véhicule courant.
core_input_categories = {}

