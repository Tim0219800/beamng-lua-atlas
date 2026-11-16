# `editor_ffiptrleaktest`

*Fichier : `lua/ge/extensions/editor/ffiptrleaktest.lua` · VM : Game Engine (GE) · 75 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ffiptrleaktest` : `extensions.load("editor_ffiptrleaktest")`, puis la globale `editor_ffiptrleaktest`

Extension de test interne de l'éditeur (fuites de pointeurs FFI avec ImGui). Elle ouvre une fenêtre « ffi ptr leak test » avec des widgets de test (case à cocher, sliders, champ texte, image) et la fenêtre de démo ImGui. Elle est désactivée dans cette version : le fichier exécute `do return M end` juste après `local M = {}`, donc les hooks ne sont jamais exportés.

## Remarques

- Désactivée : `do return M end` en tête de fichier. Le code qui suit (et l'export M.onEditorGui / M.onEditorInitialized) n'est jamais exécuté.
- Si elle était activée, onEditorGui utiliserait `image.tex` alors que `image` n'est créé que dans onEditorInitialized (texture /art/dynamicDecals/textures/00_color_palette_test.png).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ffiptrleaktest.onEditorGui()` | Hook d'éditeur appelé chaque frame GUI : dessine la fenêtre de test ImGui. Non exporté tant que le fichier est désactivé. *(interne)* *(hook)* | 22 |
| `editor_ffiptrleaktest.onEditorInitialized()` | Hook appelé à l'initialisation de l'éditeur : enregistre la fenêtre « ffi ptr leak test », son entrée de menu Window et charge la texture de test. Non exporté tant que le fichier est désactivé. *(interne)* *(hook)* | 48 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ffiptrleaktest.lua`.*
