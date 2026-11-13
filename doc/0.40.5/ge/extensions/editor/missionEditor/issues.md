# `editor_missionEditor_issues`

*Fichier : `lua/ge/extensions/editor/missionEditor/issues.lua` · VM : Game Engine (GE) · 241 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/missionEditor/issues")` (fichier sous extensions/ mais pas une extension classique)

Panneau « Issues » de l'éditeur de missions. Il agrège les problèmes détectés par les autres panneaux (méthode getMissionIssues de chaque fenêtre) pour toutes les missions, les stocke dans mission._issueList et affiche une fenêtre tableau triable « Mission Issues Overview ». Le module renvoie un constructeur : require(...)(missionEditor).

## Remarques

- Sévérités reconnues : unknown (-1), minor (1), warning (10), error (50), critical (100). Seules warning et error comptent dans importantCount.
- calculateMissionIssues ignore les missions devMission quand shipping_build est faux (build de développement).
- Dans drawIssuesWindow, la colonne « Level » est triée par sortByLevel (colonne 4) et la colonne « Availability » par sortByAvailability (colonne 5).
- Les menus de la fenêtre peuvent corriger automatiquement les problèmes de missionTypeData de toutes les missions (checkContainer(mission, true)) ou supprimer les données en trop (checkContainer(mission, true, {})) : action de masse, à utiliser avec prudence.

## Classe `C`

Instance du panneau Issues. Champs : missionEditor, mission, issues = {list = {...}}.

Le module renvoie un constructeur : `local obj = require("editor_missionEditor_issues")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:calculateMissionIssues(missionList, windows, missionTypeWindow)` | Recalcule tous les problèmes : pour chaque mission, appelle setMission sur missionTypeWindow puis getMissionIssues(mission) sur chaque fenêtre qui le définit. Remplit issue.label, severity, idx, missionId, missionType, level, availability, et pour la mission _issueList (importantCount, highestSeverity, icon, color). | 188 |
| `C:draw()` | Affiche, pour la mission courante, la liste à puces des labels de problèmes (ou « No Issues! »). Ne fait rien si mission._issueList n'existe pas. | 22 |
| `C:drawIssuesWindow()` | Dessine la fenêtre « mission_issues » : menu d'actions de masse et tableau à 7 colonnes (#, Type, Mission, MissionType, Level, Availability, Label). Cliquer sur une mission l'ouvre dans l'éditeur (setMissionById). Respecte la préférence missionEditor.general.shortIds. | 107 |
| `C:init(missionEditor)` | Constructeur : mémorise missionEditor et initialise issues.list. | 13 |
| `C:setMission(mission)` | Définit la mission courante. | 18 |
| `C:showIssuesWindow()` | Affiche la fenêtre d'éditeur « mission_issues ». | 182 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/missionEditor/issues.lua`.*
