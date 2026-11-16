# `flowgraph_nodes_ui_setUILayout`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/setUILayout.lua` · VM : Game Engine (GE) · 106 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/setUILayout")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Set UI Layout » (catégorie once_instant) : change la disposition des apps de l'UI via self.mgr.modules.ui:setGameState. Entrées : flow, « reset » (permet de redéclencher), « layout » (nom ou table layoutData), « menu », « keepLayout » (garde la disposition après l'arrêt du graphe), « gameStateName » (caché), « appContainerContext » (app du conteneur topCenter à afficher, caché). Sortie : flow.

## Remarques

- Si le réglage 'restrictScenarios' est désactivé, le menu 'freeroam' est forcé (message d'avertissement).
- Les listes de modèles layout/menu sont vides (appel à ui_apps.getLayouts commenté).
- afterTrigger est écrit sans underscore, donc jamais appelé par le moteur : active (utilisé par onUiChangedState) ne devient jamais vrai.
- Dans onClientPostStartMission, 'menuState' n'est pas défini dans cette fonction (variable globale nil).

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:afterTrigger()` | Met active selon le flux d'entrée (nom sans underscore : probablement jamais appelé). | 63 |
| `C:drawMiddle(builder, style)` | Zone centrale vide. | 59 |
| `C:init()` | useFreeroamMenuWhenUnrestricted = true. | 29 |
| `C:onClientPostStartMission()` | Hook : réapplique le layout après le démarrage du niveau. | 87 |
| `C:onUiChangedState(cur, prev)` | Hook : changement d'état UI (cur, prev) ; en mode 'quickraceScenario' dans le menu, déclenche setQuickRaceMode et HotlappingResetApp. | 96 |
| `C:postInit()` | Remplit les modèles layout, menu et appContainerContext. | 33 |
| `C:workOnce()` | Applique l'état de jeu (layout/menu) et affiche l'app de conteneur demandée. | 71 |

**Évènements UI (guihooks.trigger) :** `HotlappingResetApp`, `setQuickRaceMode`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/setUILayout.lua`.*
