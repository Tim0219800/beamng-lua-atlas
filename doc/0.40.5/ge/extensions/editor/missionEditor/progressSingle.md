# `editor_missionEditor_progressSingle`

*Fichier : `lua/ge/extensions/editor/missionEditor/progressSingle.lua` · VM : Game Engine (GE) · 171 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/missionEditor/progressSingle")` (fichier sous extensions/ mais pas une extension classique)

Onglet « Progress Single » de l'éditeur de missions : montre la progression sauvegardée d'une mission (étoiles débloquées par défaut et au total, clé de progression par défaut, tableau des tentatives par clé). Les données viennent de gameplay_missions_progress.formatSaveDataForUi(mission.id). Un mode « Raw » permet d'éditer le JSON de saveData, et un bouton « Reload » relit les données. Le module renvoie un constructeur : require(...)(missionEditor).

## Remarques

- Le mode Raw affiche missionInstance.saveData mais écrit le JSON validé dans mission.saveData.
- Dans le mode Raw, pushStyle/popStyle sont définies localement ici (contrairement à objectives.lua).
- Les cases à cocher des étoiles sont créées avec une copie (im.BoolPtr) : cliquer dessus ne modifie pas la sauvegarde.

## Classe `C`

Instance de l'onglet. Champs : missionEditor, tabName = 'Progress Single', mission, missionInstance, formattedSaveData, currentProgressKey.

Le module renvoie un constructeur : `local obj = require("editor_missionEditor_progressSingle")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:draw()` | Dessine l'en-tête (case Raw, bouton Reload) puis drawProgress ou l'éditeur JSON brut. | 105 |
| `C:drawProgress()` | Affiche le nombre d'étoiles débloquées, la clé de progression par défaut, un combo de clés et le tableau des tentatives (ou un dump brut si aucune tentative n'est disponible). | 46 |
| `C:init(missionEditor)` | Constructeur. | 25 |
| `C:setMission(mission)` | Définit la mission courante, son instance et les données de progression formatées. | 34 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/missionEditor/progressSingle.lua`.*
