# `flowgraph_nodes_ui_buttons_getButton`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/buttons/getButton.lua` · VM : Game Engine (GE) · 46 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/buttons/getButton")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Get Button » (catégorie once_instant) : lit l'état d'un bouton créé avec Create Button. Entrée « buttonId ». Sorties : « clicked » (impulsion au clic), « used » / « unused » (déjà cliqué ou non, cachés ; anciens noms complete/incomplete), « label », « active », « order », « style » (cachés).

## Remarques

- Bug : la ligne 'unused' lit self.pinOut.complete.value, or le pin 's'appelle 'used' dans pinSchema (complete n'existe qu'en legacyPins) ; selon la gestion des legacyPins cela peut donner nil.
- Catégorie once_instant : workOnce ne lit l'état qu'une fois ; pour surveiller un clic en continu, utiliser plutôt Get Multiple Buttons ou Simple Button.

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Récupère le bouton par id et recopie clicked, used, unused, label, active, order, style sur les pins de sortie. | 30 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/buttons/getButton.lua`.*
