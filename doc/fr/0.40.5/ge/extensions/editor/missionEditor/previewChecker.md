# `editor_missionEditor_previewChecker`

*Fichier : `lua/ge/extensions/editor/missionEditor/previewChecker.lua` · VM : Game Engine (GE) · 151 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/missionEditor/previewChecker")` (fichier sous extensions/ mais pas une extension classique)

Panneau « Preview » de l'éditeur de missions. Il vérifie la présence et la taille de l'image d'aperçu (preview.png/jpg/jpeg, attendue en 1920x1080, <= 1024 ko) et de la vignette (thumbnail.*, carrée entre 200 et 400 px, <= 100 ko) dans le dossier de la mission, affiche des infobulles avec les images et signale les problèmes à l'onglet Issues. Le module renvoie un constructeur : require(...)(missionEditor).

## Remarques

- Bug : dans draw, le test de taille de la vignette compare deux fois size.y à 200 (size.y == 200 and size.y == 200) ; size.x n'est pas vérifié pour l'icône verte. getMissionIssues, lui, vérifie bien une vignette carrée entre 200 et 400 px, donc les deux contrôles ne concordent pas.
- Si aucune vignette n'est trouvée mais que l'aperçu existe, l'aperçu sert de vignette (avertissement « Using Preview as Thumbnail! »).
- La préférence missionEditor.general.alwaysShowScreenshots affiche en permanence les deux images dans le panneau.

## Classe `C`

Instance du panneau. Champs : missionEditor, mission, previewFile, previewFound, previewImage, thumbFile, thumbFound, thumbImage (objets texObj de ui/imguiUtils).

Le module renvoie un constructeur : `local obj = require("editor_missionEditor_previewChecker")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:checkPreview()` | Détermine les fichiers d'aperçu et de vignette (mission.previewFile / thumbnailFile ou gameplay_missions_missions.getMissionPreviewFilepath / getThumbnailFilepath), indique s'ils sont trouvés et charge leurs textures. | 19 |
| `C:draw()` | Dessine les icônes d'état, les aperçus au survol, le bouton d'ouverture du dossier de la mission et la case « Always show Preview ». | 64 |
| `C:getMissionIssues(m)` | Appelle setMission(m) puis renvoie les problèmes : fichier manquant (error), dimensions ou poids hors limites (warning). | 31 |
| `C:init(missionEditor)` | Constructeur. | 8 |
| `C:setMission(mission)` | Définit la mission courante et relance checkPreview. | 12 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/missionEditor/previewChecker.lua`.*
