# `flowgraph_nodes_logic_edgeDetect`

*Fichier : `lua/ge/extensions/flowgraph/nodes/logic/edgeDetect.lua` · VM : Game Engine (GE) · 64 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/logic/edgeDetect")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Edge Detector' (categorie logic). Laisse passer le flux (une frame) quand la valeur du pin 'signal' change par rapport a la frame precedente. Pour des nombres (et des elements de tables), le changement doit depasser le pin 'threshold' (defaut 0). Si le type change, il y a toujours flux. La derniere valeur est conservee dans self.lastSignal.

## Remarques

- Pour les nombres : changement si |signal - dernier| > threshold ; si threshold est nil, le code utilise 0.0001 (mais le pin vaut 0 par defaut).
- Dans la comparaison de tables, la branche 'elseif v ~= self.lastSignal' compare l'element a la table entiere (probable faute de frappe pour self.lastSignal[i]), donc elle est toujours vraie pour les elements non numeriques.
- Pas de reinitialisation de lastSignal au demarrage de l'execution.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Affiche la derniere valeur memorisee (dumpsz). | 58 |
| `C:work()` | Compare signal a lastSignal (nombres avec seuil, tables element par element, autres types par egalite), met pinOut.flow a true en cas de changement, puis memorise le signal. | 33 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/logic/edgeDetect.lua`.*
