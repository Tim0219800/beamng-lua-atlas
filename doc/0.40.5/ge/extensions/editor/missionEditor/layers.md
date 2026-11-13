# `editor_missionEditor_layers`

*Fichier : `lua/ge/extensions/editor/missionEditor/layers.lua` · VM : Game Engine (GE) · 139 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/missionEditor/layers")` (fichier sous extensions/ mais pas une extension classique)

Panneau « Layers » de l'éditeur de missions. Une mission cherche ses fichiers dans une liste ordonnée de dossiers (mission.layers, chacun avec un champ dir) jusqu'à trouver un fichier correspondant. Ce panneau permet de réordonner les dossiers, de les éditer (texte ou sélecteur de fichier), d'ouvrir le dossier dans l'explorateur, d'en ajouter après une ligne ou d'en supprimer. Le module renvoie un constructeur : require(...)(missionEditor).

## Remarques

- Un layer avec fixed = true est désactivé à l'édition (champ, sélecteur et suppression).
- Le premier layer est étiqueté « Checked First », le dernier « Checked Last ».
- L'ajout d'un dossier appelle dump(add) (reste de débogage dans le log).

## Classe `C`

Instance du panneau Layers. Champs : missionEditor, mission, inputs (tampons de texte imgui par layer).

Le module renvoie un constructeur : `local obj = require("editor_missionEditor_layers")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:createInputFields()` | Recrée les tampons de texte imgui (im.ArrayChar de 1024) à partir de layer.dir pour chaque layer. | 19 |
| `C:draw()` | Dessine la liste des layers avec boutons haut/bas, champ de chemin, dossier, sélecteur, suppression et ajout. Applique les déplacements à la fin de la frame et met mission._dirty à true. | 29 |
| `C:init(missionEditor)` | Constructeur : mémorise missionEditor. | 10 |
| `C:setMission(mission)` | Définit la mission courante et recrée les champs de saisie. | 14 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/missionEditor/layers.lua`.*
