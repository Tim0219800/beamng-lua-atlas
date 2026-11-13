# `editor_flowgraph_garbageDebug`

*Fichier : `lua/ge/extensions/editor/flowgraph/garbageDebug.lua` · VM : Game Engine (GE) · 308 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/flowgraph/garbageDebug")` (fichier sous extensions/ mais pas une extension classique)

Fenêtre « Garbage Debug » (fg_garbage) de l'éditeur Flowgraph : analyse l'allocation mémoire (garbage) par graphe et par nœud d'un projet après exécution, à partir de mgr.garbageData. Elle calcule total, moyenne par frame active, maximum, quantiles (25/50/75/90 %), nombre de frames actives, trie selon la préférence flowgraph.debug.garbageSort et trace des courbes. Affiche « Info only shows after running. » tant qu'il n'y a pas de données.

## Remarques

- Les statistiques de quantiles ne sont calculées que s'il y a plus de 10 entrées d'historique.
- L'unité est « Bytes » sauf pour activeCount (« Frames »).
- Case « Debug Garbage » : préférence flowgraph.debug.debugGarbage.

## Classe `C`

Classe de la fenêtre Garbage Debug (windowName = 'fg_garbage').

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(data)` | Désérialisation (vide). | 303 |
| `C:_onSerialize(data)` | Sérialisation (vide). | 299 |
| `C:attach(mgr)` | Associe le manager flowgraph. | 12 |
| `C:computeAllStats()` | Calcule une fois les stats de tous les graphes/nœuds et leur somme, puis les trie par valeur décroissante. | 95 |
| `C:computeStats(entry)` | Complète et calcule les statistiques d'une entrée (historiques, moyenne, quantiles, min/max, pourcentage d'activité). | 26 |
| `C:draw()` | Dessine la fenêtre : case Debug Garbage, tri, projet complet, graphes puis nœuds. | 244 |
| `C:drawStats(label, entry)` | Dessine le bloc de statistiques et les courbes d'une entrée ; ignore les entrées sans valeur ou inactives. | 151 |
| `C:handleMeta(e)` | Affiche un bouton « View Node » ou « View Graph » qui sélectionne et centre l'élément. | 220 |
| `C:init()` | Enregistre la fenêtre et prépare une palette de couleurs par magnitude (20 niveaux). | 18 |
| `C:setSortingValue(entry)` | Définit entry.value (selon la clé de tri courante) et sa magnitude en puissance de 2. | 71 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/flowgraph/garbageDebug.lua`.*
