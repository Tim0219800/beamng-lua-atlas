# `flowgraph_nodes_thread_receiveMessage`

*Fichier : `lua/ge/extensions/flowgraph/nodes/thread/receiveMessage.lua` · VM : Game Engine (GE) · 84 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/thread/receiveMessage")` (fichier sous extensions/ mais pas une extension classique)

Noeud « Receive Message » (thread). Reçoit un message envoyé par un autre projet flowgraph en cours (Send Message) et expose ses champs sur des pins de sortie personnalisés (nom des pins = clés du message). Pins : flow, reset, isNetwork, name (filtre), sorties flow, receiving (impulsion), received. Un seul message est consommé jusqu'au reset.

## Remarques

- La description du noeud dit « Sends a message... » (copie de Send Message), alors qu'il reçoit.
- Le pin name est seulement requis non nil : le code ne compare pas le nom du message (le filtre « matches exactly » n'est pas appliqué ici).
- Le pin isNetwork n'est pas utilisé.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | done = false. | 74 |
| `C:drawMiddle(builder, style)` | Dessine le contenu central du noeud dans l'éditeur. | 78 |
| `C:init()` | savePins = true, allowCustomOutPins = true. | 42 |
| `C:onThreadMessageProcess(message)` | Hook : mémorise le message reçu s'il n'a pas déjà été traité (done = false). | 47 |
| `C:work()` | Sur reset, remet à zéro ; sinon, si un message est en attente et name est donné, copie ses champs sur les pins, active receiving et received. | 55 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/thread/receiveMessage.lua`.*
