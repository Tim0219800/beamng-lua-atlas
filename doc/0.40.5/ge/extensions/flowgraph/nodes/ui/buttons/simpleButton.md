# `flowgraph_nodes_ui_buttons_simpleButton`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleButton.lua` · VM : Game Engine (GE) · 82 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/buttons/simpleButton")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Simple Button » (catégorie once_instant) : crée un bouton tout-en-un dont les valeurs ne peuvent plus être changées. Entrées : « hideWhenDone » (désactive le bouton après le premier clic), « label », « order » (caché), « style » (caché). Sorties : « clicked » (impulsion), « used » / « unused » (cachés), « buttonId » (caché).

## Remarques

- Bug : workOnce lit self.pinIn.active alors que le pin 'active' n'existe pas dans pinSchema (nil -> erreur à l'index) ; et la clé passée à addButton est 'stlye' (faute de frappe), donc le style n'est pas transmis.
- Bug : work() utilise button.used.value pour hideWhenDone alors que les autres lignes utilisent button.complete.
- Il y a deux définitions de C:workOnce, la seconde remplace la première (vide).
- Au reset, le bouton est désactivé puis réactivé au prochain work().

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Remet hiddenAfterDone et hiddenAfterReset à false. | 30 |
| `C:onNodeReset()` | Désactive le bouton (active=false) une fois et remet hiddenAfterDone à false. | 39 |
| `C:postInit()` | Définit le modèle de valeur du pin style. | 35 |
| `C:work()` | Réactive le bouton après un reset, met à jour clicked/used/unused et le désactive si hideWhenDone et déjà cliqué. | 63 |
| `C:workOnce()` | Crée le bouton et écrit son id (voir notes : bugs). | 50 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleButton.lua`.*
