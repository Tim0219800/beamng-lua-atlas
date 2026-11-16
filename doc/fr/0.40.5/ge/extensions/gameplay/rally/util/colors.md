# `gameplay_rally_util_colors`

*Fichier : `lua/ge/extensions/gameplay/rally/util/colors.lua` · VM : Game Engine (GE) · 156 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_util_colors` : `extensions.load("gameplay_rally_util_colors")`, puis la globale `gameplay_rally_util_colors`

Palette de couleurs et constantes d'affichage (alphas, rayons, largeurs) partagées par les outils de rallye : snaproads, notes d'allure (pacenotes), waypoints et curseur de l'éditeur. Ne contient aucune fonction, uniquement des champs. Les couleurs sont des tables {r, g, b} entre 0 et 1, sauf clr_error et clr_no_error qui sont des ImVec4 (ui_imgui).

## Remarques

- Les couleurs sont des tables {r,g,b} sans alpha : l'alpha est fourni séparément (champs *_alpha*).
- clr_error (1, 0.2, 0.2, 1) et clr_no_error (0.2, 1, 0.2, 1) sont des ImVec4 pour imgui, pas des tables.
- Autres champs non listés individuellement : snaproads_* (rayon 0.7, 0.5 recce, 0.2 conduite ; alphas 0.8/0.2/0.5 ; couleurs recce rouge, route orange), recce_* (driveline rouge, cut teal), pacenote_* (alphas, largeurs de lien 1.5 -> 0.25, couleur interlink rose), waypoint_* (cs vert, ce rouge, variantes adjacentes et fonds, alphas de survol 0.95/1.0), new_pacenote_cursor_* (lien blanc, cs vert clair, ce rouge clair, alpha 0.8).

## Champs

| Champ | Type | Description |
|---|---|---|
| `cam_last_pos_alpha` | number | Alpha de cette sphère (0.8). |
| `cam_last_pos_radius` | number | Rayon de la sphère de dernière position caméra : snaproads_radius x 2 = 1.4 m. |
| `clr_aqua` | number[] | {0, 0.8, 0.8}. |
| `clr_black` | number[] | {0, 0, 0}. |
| `clr_blue` | number[] | {0, 0, 1}. |
| `clr_blue_light` | number[] | {0.392, 0.612, 1}. |
| `clr_error` | ImVec4 | Rouge d'erreur pour imgui (1, 0.2, 0.2, 1). |
| `clr_green` | number[] | {0, 1, 0}. |
| `clr_green_dark` | number[] | {0, 0.5, 0}. |
| `clr_green_pastel` | number[] | {0.718, 1, 0.455}. |
| `clr_grey` | number[] | {0.5, 0.5, 0.5}. |
| `clr_grey_dark` | number[] | {0.2, 0.2, 0.2}. |
| `clr_grey_light` | number[] | {0.75, 0.75, 0.75}. |
| `clr_grey_light_2` | number[] | {0.8, 0.8, 0.8}. |
| `clr_light_green` | number[] | {0.5, 1, 0.5}. |
| `clr_light_red` | number[] | {1, 0.5, 0.5}. |
| `clr_lime_green` | number[] | {0.66, 1, 0}. |
| `clr_no_error` | ImVec4 | Vert « pas d'erreur » pour imgui (0.2, 1, 0.2, 1). |
| `clr_orange` | number[] | {1, 0.64, 0}. |
| `clr_pink` | number[] | {1, 0, 1} (magenta). |
| `clr_purple` | number[] | {0.73, 0, 1}. |
| `clr_red` | number[] | {1, 0, 0}. |
| `clr_red_dark` | number[] | {0.5, 0, 0}. |
| `clr_red_pastel` | number[] | {1, 0.494, 0.635}. |
| `clr_teal` | number[] | {0, 0.76, 0.55}. |
| `clr_teal_2` | number[] | {0, 1, 0.58}. |
| `clr_white` | number[] | {1, 1, 1}. |
| `clr_yellow` | number[] | {1, 1, 0}. |
| `new_pacenote_cursor_alpha` | number | Alpha du curseur de nouvelle note d'allure dans l'éditeur (0.8). |
| `new_pacenote_cursor_clr_ce` | number[] | Couleur du point d'arrivée (CE) du curseur : clr_light_red. |
| `new_pacenote_cursor_clr_cs` | number[] | Couleur du point de départ (CS) du curseur : clr_light_green. |
| `new_pacenote_cursor_clr_link` | any | rallyEditor/pacenotes.lua |
| `new_pacenote_cursor_linkFromWidth` | number |  |
| `new_pacenote_cursor_linkHeightRadiusShinkFactor` | number |  |
| `new_pacenote_cursor_linkToWidth` | number |  |
| `pacenote_adjacent_radius_factor` | number |  |
| `pacenote_alpha_interlink` | number |  |
| `pacenote_alpha_recce` | number |  |
| `pacenote_alpha_text_selected` | number |  |
| `pacenote_base_alpha_background` | number |  |
| `pacenote_base_alpha_next` | number |  |
| `pacenote_base_alpha_no_sel` | number |  |
| `pacenote_base_alpha_prev` | number |  |
| `pacenote_base_alpha_selected` | number |  |
| `pacenote_clr_cs_to_ce_direct` | any |  |
| `pacenote_clr_interlink` | any |  |
| `pacenote_clr_interlink_txt` | any |  |
| `pacenote_clr_link_bg` | any |  |
| `pacenote_clr_link_fg` | any |  |
| `pacenote_linkFromWidth` | number |  |
| `pacenote_linkHeightRadiusShinkFactor` | number |  |
| `pacenote_linkToWidth` | number |  |
| `pacenote_shapeAlpha_factor` | number |  |
| `recce_alpha` | any |  |
| `recce_cut_clr` | any |  |
| `recce_driveline_clr` | any |  |
| `snaproads_alpha` | number |  |
| `snaproads_alpha_cameraPoint` | number |  |
| `snaproads_alpha_driving` | number |  |
| `snaproads_clr_recce` | any | M.snaproads_clr = M.clr_red |
| `snaproads_clr_route` | any |  |
| `snaproads_radius` | number | snaproads.lua |
| `snaproads_radius_driving` | number |  |
| `snaproads_radius_recce` | number |  |
| `waypoint_alpha_selected` | number |  |
| `waypoint_alpha_shape_background` | number |  |
| `waypoint_alpha_text_background` | number |  |
| `waypoint_clr_background` | any |  |
| `waypoint_clr_ce` | any |  |
| `waypoint_clr_ce_adjacent` | any |  |
| `waypoint_clr_ce_adjacent_bg` | any |  |
| `waypoint_clr_cs` | any | pacenoteWaypoint.lua |
| `waypoint_clr_cs_adjacent` | any |  |
| `waypoint_clr_cs_adjacent_bg` | any |  |
| `waypoint_clr_sphere_hover` | any |  |
| `waypoint_clr_sphere_selected` | any |  |
| `waypoint_clr_txt_bg` | any |  |
| `waypoint_clr_txt_fg` | any |  |
| `waypoint_planeAlphaFactor` | number | M.waypoint_sphereAlphaReducionFactor = 0.6 |
| `waypoint_shapeAlpha_hover` | number |  |
| `waypoint_shapeAlpha_intersectPlane` | number |  |
| `waypoint_textAlpha_hover` | number |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/util/colors.lua`.*
