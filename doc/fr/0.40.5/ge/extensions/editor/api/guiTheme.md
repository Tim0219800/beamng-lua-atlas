# `editor_api_guiTheme`

*Fichier : `lua/ge/extensions/editor/api/guiTheme.lua` · VM : Game Engine (GE) · 28 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/api/guiTheme")` (fichier sous extensions/ mais pas une extension classique)

Fichier de l'éditeur : définit la palette de couleurs ImGui partagée par les outils de l'éditeur. Il n'exporte pas de table : il ajoute seulement `editor.setupEditorGuiTheme` à la globale `editor`. Appeler cette fonction remplit `editor.color` (beamng, black, buttonInactive, darkgrey, error, gold, green, grey, lightblue, lightgrey, transparent, warning, white) avec des ImColor.

## Remarques

- Le fichier ne renvoie rien (pas de `return M`) : il agit par effet de bord sur `editor` au moment du chargement.
- `buttonInactive` reprend la couleur Col_Button du style ImGui courant avec l'alpha divisé par 2.
- `transparent` est défini avec RGB (255,0,0) et alpha 0 : totalement transparent malgré la composante rouge.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/guiTheme.lua`.*
