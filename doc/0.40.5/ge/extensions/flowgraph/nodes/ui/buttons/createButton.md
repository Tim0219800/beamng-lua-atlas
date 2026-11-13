# `flowgraph_nodes_ui_buttons_createButton`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/buttons/createButton.lua` · VM : Game Engine (GE) · 33 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/buttons/createButton")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Create Button » (catégorie once_instant) : crée un bouton dans le module flowgraph 'button' (self.mgr.modules.button:addButton) et sort son identifiant. Entrées : « label » (défaut 'Button'), « active » (caché, vrai), « order » (caché, vide = ordre automatique), « style » (caché, 'default'). Sortie « buttonId » (number) à utiliser avec Get Button, Set Button Property, etc.

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:postInit()` | Définit le modèle de valeur du pin style (seulement 'default'). | 20 |
| `C:workOnce()` | Crée le bouton avec label/active/order/style et écrit son id sur « buttonId ». | 24 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/buttons/createButton.lua`.*
