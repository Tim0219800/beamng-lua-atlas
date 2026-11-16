# `editor_flowgraph_events`

*Fichier : `lua/ge/extensions/editor/flowgraph/events.lua` · VM : Game Engine (GE) · 156 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/flowgraph/events")` (fichier sous extensions/ mais pas une extension classique)

Fenêtre « Event Log » (fg_events) de l'éditeur Flowgraph : journal des évènements du projet (niveaux Debug, Info, Warning, Error, States) avec couleurs, options « Hide Duplicates », format d'heure (Project Time, Global Time, Frame) et défilement automatique (préférences flowgraph.general.*). Un double-clic sur une entrée liée à un nœud ou un graphe y navigue. Retourne _flowgraph_createMgrWindow(C).

## Remarques

- Dans handleMeta, la branche meta.type == 'graph' lit e.meta.node.graph alors que seule e.meta.graph est testé : si meta.node est nil, ce chemin provoquerait une erreur (incohérence du code du jeu).
- Utilisé via require, pas comme extension classique.

## Classe `C`

Classe de la fenêtre Event Log (windowName = 'fg_events').

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(data)` | Désérialisation (vide). | 151 |
| `C:_onSerialize(data)` | Sérialisation (vide). | 147 |
| `C:attach(mgr)` | Associe le manager flowgraph. | 17 |
| `C:draw()` | Dessine la fenêtre « Event Log » si elle est visible. | 116 |
| `C:drawContent()` | Dessine les contrôles (Hide Duplicates, Time Format, Auto Scroll) et la liste à colonnes des évènements. | 29 |
| `C:handleMeta(e)` | Gère l'infobulle et le double-clic d'une entrée ayant des métadonnées (nœud ou graphe) : sélectionne le graphe et centre la vue. | 123 |
| `C:init()` | Enregistre la fenêtre éditeur (150x300). | 21 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/flowgraph/events.lua`.*
