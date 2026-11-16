# `editor_dragRaceEditor_constants`

*Fichier : `lua/ge/extensions/editor/dragRaceEditor/constants.lua` · VM : Game Engine (GE) · 56 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dragRaceEditor_constants` : `extensions.load("editor_dragRaceEditor_constants")`, puis la globale `editor_dragRaceEditor_constants`

Constantes partagées par l'éditeur de drag race : nom et taille de la fenêtre, extension des fichiers de réglages, types de course, phases, types d'arbre de départ, contextes, transformation et waypoint par défaut, couleurs et dimensions d'interface.

## Remarques

- Le module est un simple conteneur de données, il n'a pas de fonction. Il est chargé via require, pas comme extension.
- Les couleurs mélangent ColorF/ColorI (dessin 3D) et ImVec4 (interface ImGui).

## Champs

| Champ | Type | Description |
|---|---|---|
| `CONSTANTS` | table | WINDOW_NAME ("Drag Race Editor"), WINDOW_SIZE {x=1800,y=900}, DEFAULT_FILE_DIR ("/levels/"), FILE_EXTENSION (".dragSettings.json"), DRAG_TYPES {"headsUpRace","bracketRace"}, RACE_PHASES {"stage","countdown","race","stop"}, TREE_TYPES {".400",".500"}, CONTEXT_TYPES {"freeroam","activity"}, DEFAULT_TRANSFORM (position 0, rotation quaternion identité, scale 1), DEFAULT_WAYPOINT {speed=5, mode="limit"}, COLORS (WHITE, BLACK, RED, GREEN, BLUE, YELLOW, SUCCESS, WARNING, ERROR), UI {INPUT_WIDTH=120, BUTTON_HEIGHT=20, SPACING=5}. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dragRaceEditor/constants.lua`.*
