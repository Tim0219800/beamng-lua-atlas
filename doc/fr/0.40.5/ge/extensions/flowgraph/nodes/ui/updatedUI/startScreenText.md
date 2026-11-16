# `flowgraph_nodes_ui_updatedUI_startScreenText`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenText.lua` · VM : Game Engine (GE) · 61 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/updatedUI/startScreenText")` (fichier sous extensions/ mais pas une extension classique)

Nœud « StartScreen Text Panel » (repeat_instant, couleur ui). Ajoute à l'écran de démarrage un panneau texte avec en-tête. Entrées : flow, header et text (string ou table), experimental (caché, obsolète), flavour (caché ; default, experimental ou info). Sortie : flow (chainFlow).

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:postInit()` | Définit les modèles imposés du pin flavour : default, experimental, info. | 25 |
| `C:work()` | Recopie flow ; si text est non vide, ajoute un textPanel. Si l'en-tête est « missions.missions.general.rules » ou « Rules », le panneau va sur la page rules au lieu de main. experimental=true force le flavour « experimental ». | 32 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenText.lua`.*
