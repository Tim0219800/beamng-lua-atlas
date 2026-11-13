# `flowgraph_nodes_ui_customUiLayout`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/customUiLayout.lua` · VM : Game Engine (GE) · 96 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/customUiLayout")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Custom UI Layout » (catégorie provider) : enregistre une disposition d'apps UI (layout) dans le nœud pour la réutiliser. Sortie « layout » (table layoutData : {apps, layoutName = 'procedural Layout <id>'}) à brancher sur Set UI Layout. Propriétés : Capture (lit le layout courant via 'getCurrentLayoutToLua'), Clear, Load Stored Layout, Load Freeroam layout.

## Remarques

- La liste « Copy Layout from... » est vide (layouts = {} , appel à ui_apps.getLayouts commenté).
- setLayout est appelée par l'UI via getCmd(), qui renvoie un nom de fonction sans parenthèses (commande qui reçoit les données de l'UI).

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Écrit {apps = storedLayout, layoutName = ...} sur « layout ». | 25 |
| `C:_onDeserialized(data)` | Restaure storedLayout. | 90 |
| `C:_onSerialize(res)` | Sauvegarde storedLayout. | 86 |
| `C:drawCustomProperties()` | Boutons Capture, Clear, Load Stored Layout, Load Freeroam layout et liste de copie. | 30 |
| `C:getCmd(action)` | Renvoie la chaîne de la fonction Lua de rappel (setLayout) de ce nœud. | 82 |
| `C:init()` | Vide. | 21 |
| `C:setLayout(data)` | Reçoit le layout capturé par l'UI et mémorise data.apps dans storedLayout. | 77 |
| `C:uniqueId()` | Renvoie « <idManager>_<idNœud> », utilisé pour nommer l'état de jeu temporaire. | 29 |

**Évènements UI (guihooks.trigger) :** `getCurrentLayoutToLua`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/customUiLayout.lua`.*
