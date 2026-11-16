# `flowgraph_nodes_career_playerAttribute`

*Fichier : `lua/ge/extensions/flowgraph/nodes/career/playerAttribute.lua` · VM : Game Engine (GE) · 45 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/career/playerAttribute")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Add Or Remove Player Attribute » (catégorie once_instant, couleur/icône career). Ajoute ou retire une quantité d'un attribut du joueur (par défaut « money ») dans l'emplacement de sauvegarde de carrière courant, via career_modules_playerAttributes.addAttributes. Entrées : add (bool, vrai = ajouter, défaut true), amount (number, défaut 0), playerAttribute (string, défaut 'money'), reason (string, texte du journal ; sinon clé « ui.career.attributeLog.unknownFlowgraphReason »). N'agit qu'en carrière et une seule fois jusqu'à réinitialisation.

## Remarques

- Le drapeau interne empêche une seconde application tant que le nœud n'est pas réinitialisé (pin reset ou onNodeReset).
- Les descriptions des pins parlent d'argent (« money ») même si l'attribut est configurable.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Appelle onNodeReset au démarrage du graphe. | 30 |
| `C:onNodeReset()` | Remet le drapeau d'application à faux. | 26 |
| `C:work()` | Si carrière active et pas encore appliqué, ajoute amount (signé selon add) à l'attribut et marque appliqué ; réinitialise si le pin reset est actif. | 34 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/career/playerAttribute.lua`.*
