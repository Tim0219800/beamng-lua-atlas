# `flowgraph_nodes_gameplay_rally_rallyStageCountdownSetup`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageCountdownSetup.lua` · VM : Game Engine (GE) · 51 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/rallyStageCountdownSetup")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Stage Countdown Setup » (catégorie once_instant, tag rally, sans pin). Prépare le flux UI du compte à rebours rally avant le fondu d'entrée de la spéciale : charge l'extension de la boucle rally si besoin, efface les temps intermédiaires du rally manager (clearSplitTimes), lit les réglages du compte à rebours (StagedCountdownUtils.getStageCountdownSettings, défauts durée 3 et 3 annonces max) puis lance le hook onRallyDataUpdated avec l'état inactif et countdownData {countdown = durée, state = 'waiting'}.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Exécute la préparation décrite ci-dessus une seule fois. | 34 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRallyDataUpdated` — écouté par 2 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageCountdownSetup.lua`.*
