# `flowgraph_nodes_career_customTowAction`

*Fichier : `lua/ge/extensions/flowgraph/nodes/career/customTowAction.lua` · VM : Game Engine (GE) · 38 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/career/customTowAction")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « On Custom Tow » (catégorie repeat_instant, couleur/icône career). Détecte quand le joueur utilise une action de remorquage personnalisée dans le tutoriel de carrière. Sortie : tow (flow, impulsion) à vrai une frame après le hook onCareerCustomTowHook. Le flowgraph doit refaire un fondu depuis le noir après l'action.

## Remarques

- Schéma d'évènement commun : le hook pose un drapeau, work() le transforme en impulsion d'une frame puis efface les drapeaux.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Crée la table de drapeaux. | 21 |
| `C:onCareerCustomTowHook(poiId)` | Hook de carrière : lève le drapeau tow. | 33 |
| `C:work(args)` | Chaque frame : met tow à faux, applique les drapeaux reçus puis les efface. | 25 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/career/customTowAction.lua`.*
