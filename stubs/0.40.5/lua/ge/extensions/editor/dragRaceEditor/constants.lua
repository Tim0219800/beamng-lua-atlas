---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dragRaceEditor/constants.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Constantes partagées par l'éditeur de drag race : nom et taille de la fenêtre, extension des fichiers de réglages, types de course, phases, types d'arbre de départ, contextes, transformation et waypoint par défaut, couleurs et dimensions d'interface.
--- Accès : extension `editor_dragRaceEditor_constants` : `extensions.load("editor_dragRaceEditor_constants")`, puis la globale `editor_dragRaceEditor_constants`
---@class editor_dragRaceEditor_constants
---@field CONSTANTS table WINDOW_NAME ("Drag Race Editor"), WINDOW_SIZE {x=1800,y=900}, DEFAULT_FILE_DIR ("/levels/"), FILE_EXTENSION (".dragSettings.json"), DRAG_TYPES {"headsUpRace","bracketRace"}, RACE_PHASES {"stage","countdown","race","stop"}, TREE_TYPES {".400",".500"}, CONTEXT_TYPES {"freeroam","activity"}, DEFAULT_TRANSFORM (position 0, rotation quaternion identité, scale 1), DEFAULT_WAYPOINT {speed=5, mode="limit"}, COLORS (WHITE, BLACK, RED, GREEN, BLUE, YELLOW, SUCCESS, WARNING, ERROR), UI {INPUT_WIDTH=120, BUTTON_HEIGHT=20, SPACING=5}.
editor_dragRaceEditor_constants = {}

