# `editor_imguiCDemo`

*Fichier : `lua/ge/extensions/editor/imguiCDemo.lua` · VM : Game Engine (GE) · 26 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_imguiCDemo` : `extensions.load("editor_imguiCDemo")`, puis la globale `editor_imguiCDemo`

Extension de l'éditeur qui ajoute l'entrée de menu « ImGui Demo » (groupe Debug du menu Window). Elle ouvre la fenêtre de démonstration intégrée de Dear ImGui (ui_imgui.ShowDemoWindow), utile à un moddeur pour voir tous les widgets ImGui disponibles. Elle n'écrit aucune donnée.

## Remarques

- L'état d'ouverture est un BoolPtr local (windowOpen) ; la fenêtre de démo met la valeur à false quand l'utilisateur la ferme.
- onWindowMenuItem est local (non exporté) : il ne peut pas être appelé depuis un autre module.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_imguiCDemo.onEditorGui()` | Appelé à chaque frame par l'éditeur ; si la fenêtre est ouverte, affiche la fenêtre de démo ImGui. *(interne)* *(hook)* | 9 |
| `editor_imguiCDemo.onEditorInitialized()` | Appelé à l'initialisation de l'éditeur ; enregistre le menu « ImGui Demo » dans le groupe Debug via editor.addWindowMenuItem. *(interne)* *(hook)* | 19 |

## Appels vers le moteur (C++)

- `ui_imgui.` `BoolPtr`, `ShowDemoWindow`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/imguiCDemo.lua`.*
