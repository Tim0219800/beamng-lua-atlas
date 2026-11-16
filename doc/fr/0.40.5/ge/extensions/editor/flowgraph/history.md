# `editor_flowgraph_history`

*Fichier : `lua/ge/extensions/editor/flowgraph/history.lua` · VM : Game Engine (GE) · 90 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/flowgraph/history")` (fichier sous extensions/ mais pas une extension classique)

Fenêtre « History » (fg_history) de l'éditeur Flowgraph : boutons Undo/Redo et liste des actions (mgr.history) de la plus récente à la plus ancienne. L'entrée courante (mgr.currentHistoryIndex) est marquée « > », les entrées annulées sont grisées ; cliquer sur une entrée appelle mgr:goToHistory(index).

## Classe `C`

Classe de la fenêtre History (windowName = 'fg_history').

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(data)` | Désérialisation (vide). | 85 |
| `C:_onSerialize(data)` | Sérialisation (vide). | 81 |
| `C:attach(mgr)` | Associe le manager flowgraph. | 12 |
| `C:draw()` | Dessine la fenêtre si visible : Undo, Redo et tableau Idx/Action cliquable. | 20 |
| `C:init()` | Enregistre la fenêtre éditeur. | 16 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/flowgraph/history.lua`.*
