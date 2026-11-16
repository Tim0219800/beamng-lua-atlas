# `core_input_deprecatedActions`

*Fichier : `lua/ge/extensions/core/input/deprecatedActions.lua` · VM : Game Engine (GE) · 91 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_input_deprecatedActions` : `extensions.load("core_input_deprecatedActions")`, puis la globale `core_input_deprecatedActions`

Table de données (le fichier retourne une table) qui associe d'anciens noms d'actions d'entrée à leur remplaçant (`replacement`) ou les déclare abandonnés (`obsolete = true`). Consultée par core_input_actions.upgradeAction pour migrer les anciens fichiers de bindings. Un moddeur ne l'appelle pas directement ; il peut y chercher le nom actuel d'une ancienne action.

## Remarques

- Chaque entrée est {replacement = 'nouvelleAction'} ou {obsolete = true}. upgradeAction suit les remplacements récursivement.
- Exemples de remplacements : steer/steer_direct -> steering, accelerate_direct -> accelerate, brake_direct -> brake, clutch_direct -> clutch, handle_escape/toggleQuickAccess/toggle_dashboard -> toggleMenues, hide_ui -> toggleUi, camera_hotkey_N -> camera_N (camera_hotkey_0 -> camera_10), grabNode* -> nodegrabber*, slow_motion/realtime_motion -> toggle_slow_motion, toggle_physics -> pause, toggleConsole -> toggleConsoleNG, oldEditorToggle -> editorToggle.
- Obsolètes (ignorées sans remplacement) : setZoomFOV, toggleZoom, reload_bindings, cui_advanced, toggleFreeLook, camera_hotkey_N_mod1, reload_system_lua, toggleRadialMenu, clear_console, annotatedScreenShot, switch_next_vehicle_multiseat, key_q/e/w/s/a/d/t/f/g/h/r/y.
- Chaînes de remplacement : show_metrics -> cycle_metrics_back -> cycle_metrics, toggleFPS -> cycle_metrics_fwd -> cycle_metrics ; debugmode_toggle_coltris -> debugmode_coltris_fwd.

## Champs

| Champ | Type | Description |
|---|---|---|
| `accelerate_direct` | table | {replacement = 'accelerate'}. |
| `annotatedScreenShot` | table |  |
| `brake_direct` | table | {replacement = 'brake'}. |
| `camera_hotkey_0` | table |  |
| `camera_hotkey_0_mod1` | table |  |
| `camera_hotkey_1` | table |  |
| `camera_hotkey_1_mod1` | table |  |
| `camera_hotkey_2` | table |  |
| `camera_hotkey_2_mod1` | table |  |
| `camera_hotkey_3` | table |  |
| `camera_hotkey_3_mod1` | table |  |
| `camera_hotkey_4` | table |  |
| `camera_hotkey_4_mod1` | table |  |
| `camera_hotkey_5` | table |  |
| `camera_hotkey_5_mod1` | table |  |
| `camera_hotkey_6` | table |  |
| `camera_hotkey_6_mod1` | table |  |
| `camera_hotkey_7` | table |  |
| `camera_hotkey_7_mod1` | table |  |
| `camera_hotkey_8` | table |  |
| `camera_hotkey_8_mod1` | table |  |
| `camera_hotkey_9` | table |  |
| `camera_hotkey_9_mod1` | table |  |
| `clear_console` | table |  |
| `clutch_direct` | table | {replacement = 'clutch'}. |
| `cui_advanced` | table |  |
| `cui_cancel` | table |  |
| `cycle_metrics_back` | table |  |
| `cycle_metrics_fwd` | table |  |
| `debugmode_toggle_coltris` | table |  |
| `decrease_gamepad_zoom` | table |  |
| `decrease_gamepad_zoom2` | table |  |
| `delete_ai_node` | table |  |
| `delete_decal` | table |  |
| `delete_meshRoad_node` | table |  |
| `delete_river_node` | table |  |
| `delete_road_node` | table |  |
| `gamepadPitch` | table |  |
| `gamepadYaw` | table |  |
| `grabNodeForce` | table |  |
| `grabNodeLock` | table |  |
| `grabNodeModeToggle` | table |  |
| `grabNodeToggle` | table |  |
| `handle_escape` | table | {replacement = 'toggleMenues'}. |
| `hide_ui` | table | {replacement = 'toggleUi'}. |
| `increase_gamepad_zoom` | table |  |
| `increase_gamepad_zoom2` | table |  |
| `joystickPitch` | table |  |
| `joystickYaw` | table |  |
| `key_a` | table |  |
| `key_d` | table |  |
| `key_e` | table |  |
| `key_f` | table |  |
| `key_g` | table |  |
| `key_h` | table |  |
| `key_q` | table |  |
| `key_r` | table |  |
| `key_s` | table |  |
| `key_t` | table |  |
| `key_w` | table |  |
| `key_y` | table |  |
| `oldEditorToggle` | table |  |
| `realtime_motion` | table |  |
| `reload_bindings` | table |  |
| `reload_system_lua` | table |  |
| `select_all_meshRoad_nodes` | table |  |
| `select_all_river_nodes` | table |  |
| `select_all_road_nodes` | table |  |
| `setZoomFOV` | table |  |
| `show_metrics` | table |  |
| `slow_motion` | table | {replacement = 'toggle_slow_motion'} (idem realtime_motion). |
| `steer` | table | {replacement = 'steering'} (idem steer_direct). |
| `steer_direct` | table |  |
| `switch_camera` | table | {replacement = 'switch_camera_next'}. |
| `switch_next_vehicle_multiseat` | table |  |
| `switch_reset_vehicle` | table |  |
| `toggleConsole` | table | {replacement = 'toggleConsoleNG'}. |
| `toggleFPS` | table |  |
| `toggleFreeLook` | table |  |
| `toggleQuickAccess` | table |  |
| `toggleRadialMenu` | table |  |
| `toggleZoom` | table |  |
| `toggle_dashboard` | table |  |
| `toggle_physics` | table | {replacement = 'pause'}. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/input/deprecatedActions.lua`.*
