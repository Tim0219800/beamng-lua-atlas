# `editor_missionEditor_progressMulti`

*Fichier : `lua/ge/extensions/editor/missionEditor/progressMulti.lua` · VM : Game Engine (GE) · 95 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/missionEditor/progressMulti")` (fichier sous extensions/ mais pas une extension classique)

Onglet « Progress Multi » de l'éditeur de missions : affiche la progression sauvegardée d'une mission à progression multiple. Il lit gameplay_missions_progress.formatSaveDataForUi(mission.id), propose un combo de clé de progression et un tableau des agrégats de la mission (ownAggregate : labels et lignes). Lecture seule. Le module renvoie un constructeur : require(...)(missionEditor).

## Remarques

- Les fonctions pushStyle/popStyle et la case Raw sont déclarées mais pas utilisées dans ce fichier (code hérité de progressSingle).
- draw lève une erreur si formattedProgressByKey[currentProgressKey] est nil (pas de test avant l'accès à ownAggregate).
- Le commentaire du code précise que seule la mission courante est affichée depuis un changement de formatSaveDataForUi.

## Classe `C`

Instance de l'onglet. Champs : missionEditor, tabName = 'Progress Multi', mission, missionInstance, formattedSaveData, currentProgressKey.

Le module renvoie un constructeur : `local obj = require("editor_missionEditor_progressMulti")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:draw()` | Affiche le combo de clé de progression et le tableau d'agrégats. | 46 |
| `C:init(missionEditor)` | Constructeur. | 25 |
| `C:setMission(mission)` | Définit la mission courante, recharge les données de progression formatées et choisit la clé de progression (currentProgressKey, defaultProgressKey ou 'default'). | 34 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/missionEditor/progressMulti.lua`.*
