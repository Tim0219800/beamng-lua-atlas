# `flowgraph_nodes_environment_getPhotomode`

*Fichier : `lua/ge/extensions/flowgraph/nodes/environment/getPhotomode.lua` · VM : Game Engine (GE) · 29 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/environment/getPhotomode")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Get Photomode » (catégorie provider, auteur BeamNG, tags photomode/photo/camera/screenshot/capture). Sort un bool « value » : vrai si le mode photo est ouvert, lu dans la variable globale photoModeOpen.

## Remarques

- Dépend d'une variable globale (photoModeOpen) ; elle vaut nil si le mode photo n'a jamais été initialisé.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Chaque frame, copie photoModeOpen sur la sortie value. | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/environment/getPhotomode.lua`.*
