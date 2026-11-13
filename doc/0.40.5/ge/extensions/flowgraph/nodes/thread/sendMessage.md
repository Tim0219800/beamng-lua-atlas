# `flowgraph_nodes_thread_sendMessage`

*Fichier : `lua/ge/extensions/flowgraph/nodes/thread/sendMessage.lua` · VM : Game Engine (GE) · 81 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/thread/sendMessage")` (fichier sous extensions/ mais pas une extension classique)

Noeud « Send Message » (thread). Envoie un message (table des pins d'entrée non fixes) au projet flowgraph d'id donné (-1 = parent) via modules.thread:sendMessage, ou sendNetworkedMessage si le pin networked est vrai. Envoie une seule fois jusqu'au reset. Pins fixes : flow, reset, networked, id, name ; sortie flow.

## Remarques

- Le pin name (nom du message) est fixe donc n'est pas ajouté au contenu du message.
- Le résultat de sendMessage n'est pas utilisé.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | done = false. | 71 |
| `C:drawMiddle(builder, style)` | Dessine le contenu central du noeud dans l'éditeur. | 75 |
| `C:init()` | savePins = true, allowCustomInPins = true. | 41 |
| `C:work()` | Sur reset, done = false ; sinon, au flow avec un id, assemble les pins non fixes en table et envoie le message, puis recopie flow. | 47 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/thread/sendMessage.lua`.*
