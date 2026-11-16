# `flowgraph_nodes_gfx_blur`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gfx/blur.lua` · VM : Game Engine (GE) · 62 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gfx/blur")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Blur » (repeat_instant, tags gfx/blur). Floute la scène : pin blurAmount (0 à 1, défaut 1) devient l'alpha d'un rectangle plein écran ajouté à l'effet ScreenBlurFX à chaque frame de rendu. Ne dessine rien si l'UI CEF n'est pas visible ou si work n'a pas tourné depuis plus de 10 frames.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(mgr, ...)` | Initialise lastWorking, blurAmount et blurColor. | 24 |
| `C:onPreRender(dt, dtSim)` | Hook appelé avant le rendu (dt, dtSim) ; ajoute un rectangle de flou plein écran à ScreenBlurFX si le nœud a été actif dans les 10 dernières frames. | 45 |
| `C:postInit()` | Configure le pin blurAmount comme curseur float entre 0 et 1. | 30 |
| `C:work()` | Mémorise la quantité de flou, la couleur correspondante et le numéro de frame courant. | 39 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gfx/blur.lua`.*
