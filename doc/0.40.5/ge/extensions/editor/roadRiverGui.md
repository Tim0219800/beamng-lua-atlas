# `editor_roadRiverGui`

*Fichier : `lua/ge/extensions/editor/roadRiverGui.lua` · VM : Game Engine (GE) · 52 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadRiverGui` : `extensions.load("editor_roadRiverGui")`, puis la globale `editor_roadRiverGui`

Éléments d'interface partagés par les éditeurs de routes (DecalRoad) et de rivières : palette de couleurs de surbrillance (survol, sélection, nœuds, duplication…), facteur de taille des nœuds, et le bouton de barre d'outils « Add Road/Nodes » qui active le mode création. Utilisé notamment par editor_roadEditor.

## Remarques

- editModeToolbar lit M.isRoad (vrai = « Road », sinon « River ») et écrit M.createMode ; ces deux champs ne sont pas définis par ce fichier, ils doivent être posés par l'éditeur appelant.
- Le mode création est actif si le bouton a été activé OU si la touche Alt est enfoncée (editor.keyModifiers.alt).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadRiverGui.editModeToolbar()` | Dessine dans la barre d'outils le bouton icône « Add Road/Nodes » (info-bulle incluse), bascule l'état du bouton au clic et met à jour M.createMode (bouton actif ou Alt enfoncé). Appelée par l'interface de l'éditeur de routes ou de rivières. | 36 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `highlightColors` | table<string, ColorF> | Couleurs de surbrillance : hover, lightHover, hoverSelectNotAllowed, lightHoverSelectNotAllowed, selected, darkSelected, duplicated, nearby, cursor, createModeCursor, selectedNode, hoveredNode, node, nodeTransparent. |
| `nodeSizeFactor` | number | Facteur de taille d'affichage des nœuds (0.012). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadRiverGui.lua`.*
