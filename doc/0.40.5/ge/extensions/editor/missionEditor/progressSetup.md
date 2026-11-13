# `editor_missionEditor_progressSetup`

*Fichier : `lua/ge/extensions/editor/missionEditor/progressSetup.lua` · VM : Game Engine (GE) · 108 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/missionEditor/progressSetup")` (fichier sous extensions/ mais pas une extension classique)

Onglet « Progress » (configuration de progression) de l'éditeur de missions. Il récupère la définition de progression du type de mission (gameplay_missions_missions.getMissionProgressSetupData) et propose un mode « Raw » pour éditer le JSON de saveData. Le module renvoie un constructeur : require(...)(missionEditor). Fichier apparemment incomplet.

## Remarques

- Bug : draw appelle self:drawProgress(), qui n'est pas définie dans ce fichier (copie de progressSingle) ; hors mode Raw, l'appel provoque une erreur Lua.
- Bug : self.missionInstance n'est jamais défini dans setMission, alors que le mode Raw lit self.missionInstance.saveData.
- Le mode Raw affiche missionInstance.saveData mais écrit le résultat dans mission.saveData.

## Classe `C`

Instance de l'onglet. Champs : missionEditor, mission, progressSetup, rawEditPerMission.

Le module renvoie un constructeur : `local obj = require("editor_missionEditor_progressSetup")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:draw()` | Dessine l'en-tête avec la case Raw puis la vue de progression ou l'éditeur JSON brut (Edit / Finish Editing / Cancel). | 45 |
| `C:init(missionEditor)` | Constructeur. | 24 |
| `C:setMission(mission)` | Définit la mission courante et charge progressSetup pour son type. | 33 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/missionEditor/progressSetup.lua`.*
