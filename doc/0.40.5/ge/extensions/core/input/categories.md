# `core_input_categories`

*Fichier : `lua/ge/extensions/core/input/categories.lua` · VM : Game Engine (GE) · 23 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_input_categories` : `extensions.load("core_input_categories")`, puis la globale `core_input_categories`

Table de données (le fichier retourne directement une table, pas de fonctions) listant les catégories d'actions d'entrée affichées dans l'écran des contrôles. Chaque catégorie a un ordre d'affichage, une icône et un titre (clé de traduction ou texte). Les actions de core_input_actions y font référence par leur champ `cat`.

## Remarques

- Champs de chaque catégorie : order (nombre, tri d'affichage), icon (nom d'icône Material), title (clé de traduction ou texte brut), simplemenu (false = masquée du menu simplifié ; présent pour editor, flowgraph, debug, vehicle_debug).
- Une action dont `cat` n'est pas dans cette table déclenche un avertissement dans actionToCommands.
- Particularité : le fichier fait `return { ... }` sans table M ; les entrées sont donc les champs de l'extension core_input_categories.

## Champs

| Champ | Type | Description |
|---|---|---|
| `camera` | table | order 5, icône videocam. |
| `debug` | table | order 11, icône bug_report, simplemenu = false. |
| `editor` | table | order 9, simplemenu = false. |
| `flowgraph` | table | order 10, titre 'Flowgraph Editor', simplemenu = false. |
| `gameplay` | table | order 4, icône extension. |
| `general` | table | order 3, icône language. |
| `menu` | table | order 6, navigation dans les menus (rend aussi l'actionmap 'Menu'). |
| `menuExtra` | table | order 6.5, navigation de menu supplémentaire. |
| `modifier` | table | order 0.5, icône settings : touches modificatrices. |
| `replay` | table | order 8, icône local_movies. |
| `slowmotion` | table | order 7, icône timer. |
| `splitscreen` | table | order 4.5, titre 'Split Screen'. |
| `vehicle` | table | order 2, icône directions_car. |
| `vehicle_debug` | table | order 12, simplemenu = false. |
| `vehicle_specific` | table | order 1, icône local_taxi : actions propres au véhicule actuel. |
| `vehicle_specific_unusable` | table | order 1.5 : actions de véhicules non utilisables avec le véhicule courant. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/input/categories.lua`.*
