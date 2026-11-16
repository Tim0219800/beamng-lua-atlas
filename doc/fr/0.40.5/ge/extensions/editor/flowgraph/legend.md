# `editor_flowgraph_legend`

*Fichier : `lua/ge/extensions/editor/flowgraph/legend.lua` · VM : Game Engine (GE) · 57 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/flowgraph/legend")` (fichier sous extensions/ mais pas une extension classique)

Fenêtre « Legend Test » (fg_legend) de l'éditeur Flowgraph. C'est un squelette de test : quatre onglets A, B, C, D réordonnables et fermables (ImGui TabBar) avec affichage de la liste des onglets ouverts. Sans lien avec le graphe réel.

## Classe `C`

Classe de la fenêtre Legend (windowName = 'fg_legend').

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(data)` | Désérialisation (vide). | 52 |
| `C:_onSerialize(data)` | Sérialisation (vide). | 48 |
| `C:attach(mgr)` | Associe le manager flowgraph. | 11 |
| `C:draw()` | Dessine la barre d'onglets de test si la fenêtre est visible. | 25 |
| `C:init()` | Enregistre la fenêtre et crée les 4 éléments de test. | 15 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/flowgraph/legend.lua`.*
