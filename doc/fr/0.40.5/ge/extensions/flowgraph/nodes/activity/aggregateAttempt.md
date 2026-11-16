# `flowgraph_nodes_activity_aggregateAttempt`

*Fichier : `lua/ge/extensions/flowgraph/nodes/activity/aggregateAttempt.lua` · VM : Game Engine (GE) · 98 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/activity/aggregateAttempt")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Aggregate Attempt » (catégorie once_p_duration, tags activity/mission). Intègre une tentative à la progression de la mission (gameplay_missions_progress.aggregateAttempt), sauvegarde les données hors carrière, arrête l'enregistrement IA et calcule le texte d'outro de l'étoile par défaut la plus haute débloquée. Entrées : « attempt » (attemptData), « progressKey » (string, sinon currentProgressKey puis defaultProgressKey de la mission). Sorties : « change » (table), « outroText », « outroTranslation » (table translationObject {txt, context}), « newBestType » (bool, caché) ; des pins de sortie personnalisés reçoivent les champs de aggregateChange du même nom.

## Remarques

- Ne fait rien sans activité associée (self.mgr.activity nil).
- Hors carrière, appelle gameplay_missions_progress.saveMissionSaveData pour la mission ; en carrière la sauvegarde est laissée au mode carrière.
- Le texte d'outro prend d'abord careerSetup.starOutroTexts puis defaultStarOutroTexts ; 'noStarExists' sert quand aucune étoile par défaut n'existe ou n'est débloquée.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Vide. | 28 |
| `C:workOnce()` | Agrège la tentative, sauvegarde si hors carrière, stoppe l'enregistrement IA (module aiRecording), calcule outroText/outroTranslation et remplit change et les pins de sortie personnalisés. | 32 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/activity/aggregateAttempt.lua`.*
