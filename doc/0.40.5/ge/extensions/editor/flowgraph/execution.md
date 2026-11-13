# `editor_flowgraph_execution`

*Fichier : `lua/ge/extensions/editor/flowgraph/execution.lua` · VM : Game Engine (GE) · 201 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/flowgraph/execution")` (fichier sous extensions/ mais pas une extension classique)

Fenêtre « Task Manager » (fg_execution) de l'éditeur Flowgraph : liste tous les projets flowgraph chargés (core_flowgraphManager.getAllManagers) avec leur état (en marche/arrêté, caché, transitoire) et permet de les démarrer ou arrêter tous d'un coup. Au démarrage global, applique les variables de mission du Mission Editor via missionVariableHelper avant setRunning(true). Les projets cachés/transitoires ne sont visibles qu'avec la préférence flowgraph.debug.editorDebug.

## Remarques

- Peut s'afficher seule (drawAlone, titre avec suffixe ##alone) ou dans l'éditeur (draw).
- Le bouton de redémarrage global est commenté dans le code.

## Classe `C`

Classe de la fenêtre Task Manager (windowName = 'fg_execution').

| Méthode | Description | Ligne |
|---|---|---|
| `C:ExecutionView()` | Dessine le contenu : en-tête Projects, boutons Start All / Stop All, puis chaque projet. | 132 |
| `C:draw()` | Dessine la fenêtre si elle est visible. | 189 |
| `C:drawAlone()` | Affiche la fenêtre hors du contexte d'un projet (self.mgr = nil). | 181 |
| `C:drawManager(mgr)` | Dessine la ligne d'un projet : icône d'état, visibilité, transitoire, nom et boutons. | 22 |
| `C:init()` | Récupère core_flowgraphManager et enregistre la fenêtre. | 16 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/flowgraph/execution.lua`.*
