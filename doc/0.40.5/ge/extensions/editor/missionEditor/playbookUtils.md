# `editor_missionEditor_playbookUtils`

*Fichier : `lua/ge/extensions/editor/missionEditor/playbookUtils.lua` · VM : Game Engine (GE) · 117 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/missionEditor/playbookUtils")` (fichier sous extensions/ mais pas une extension classique)

Onglet « Playbook Utils » de l'éditeur de missions. Il propose des boutons qui ajoutent à editor_missionPlaybook.book.instructions des instructions de type missionAttempt pour la mission courante, avec différentes combinaisons d'étoiles (toutes, par défaut, bonus, aléatoires, une par une). Le module renvoie un constructeur : require(...)(missionEditor).

## Remarques

- Chaque instruction a la forme {type = 'missionAttempt', missionId = id, stars = {clé = true}}.
- Utilise careerSetup._activeStarCache (sortedStars, defaultStarKeysSorted, bonusStarKeysSorted) de l'instance de mission.
- « Add Random Single Star » n'ajoute une étoile que s'il y a plus d'une étoile ; sinon l'instruction est ajoutée avec stars vide.

## Classe `C`

Instance de l'onglet. Champs : missionEditor, tabName = 'Playbook Utils', mission, missionInstance.

Le module renvoie un constructeur : `local obj = require("editor_missionEditor_playbookUtils")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:draw()` | Dessine les boutons d'ajout d'instructions au playbook (vide, toutes les étoiles, étoiles par défaut, bonus, une étoile aléatoire, étoiles aléatoires, ajout individuel progressif, bonus dans un ordre aléatoire). | 24 |
| `C:init(missionEditor)` | Constructeur : mémorise missionEditor et le nom d'onglet. | 9 |
| `C:setMission(mission)` | Définit la mission courante et son instance de jeu. | 16 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/missionEditor/playbookUtils.lua`.*
