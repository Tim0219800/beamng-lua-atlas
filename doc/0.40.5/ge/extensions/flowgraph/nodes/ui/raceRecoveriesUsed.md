# `flowgraph_nodes_ui_raceRecoveriesUsed`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/raceRecoveriesUsed.lua` · VM : Game Engine (GE) · 43 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/raceRecoveriesUsed")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Set UI Race Recovery » (catégorie repeat_instant, auteur BeamNG, durée) : met à jour l'app UI du compteur de récupérations (reset véhicule). Entrées : « cur » (number ou string), « max ». Texte envoyé via 'RaceRecoveryCounterSet' (ex. « Recoveries Used: 2 / 5 ») ; réinitialisé avec 'RaceRecoveryCounterReset'.

## Remarques

- Le texte « Recoveries Used » est en dur (non traduit).

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Envoie le compteur si cur et le flux d'entrée sont actifs, sinon réinitialise. | 25 |

**Évènements UI (guihooks.trigger) :** `RaceRecoveryCounterReset`, `RaceRecoveryCounterSet`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/raceRecoveriesUsed.lua`.*
