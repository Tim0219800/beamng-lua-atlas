# `flowgraph_nodes_gameplay_careerActive`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/careerActive.lua` · VM : Game Engine (GE) · 38 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/careerActive")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Career Active » (catégorie repeat_instant). Teste si le mode carrière est actif via career_career.isActive(). Sorties : enabled (flux si actif), disabled (flux sinon), active (bool caché). Met aussi flow à vrai.

## Remarques

- Déclare une dépendance à gameplay_walk alors qu'il utilise career_career (copier-coller probable).
- Le pin de sortie « flow » n'est pas déclaré dans pinSchema mais work y écrit.

**Dépendances (chargées avant) :** `gameplay_walk`

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Affiche une icône coche ou croix. | 30 |
| `C:work(args)` | Renseigne enabled, disabled et active selon career_career.isActive(). | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/careerActive.lua`.*
