# `editor_missionEditor_dev`

*Fichier : `lua/ge/extensions/editor/missionEditor/dev.lua` · VM : Game Engine (GE) · 60 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/missionEditor/dev")` (fichier sous extensions/ mais pas une extension classique)

Section « Dev Notes » du Mission Editor : édite mission.devNotes (texte libre, mode silent/info/warning/error, case « Dev Mission » qui cache la mission hors mode développeur). Le module renvoie un constructeur. Chaque modification met mission._dirty = true.

## Remarques

- Dans missionEditor.lua la ligne qui crée cette fenêtre est commentée : le module n'est actuellement pas instancié.
- mission.devNotes doit exister (setMission lit devNotes.text et devNotes.devMission sans test) sinon erreur.
- Modes : silent, info, warning, error (icônes visibility_off, info, warning, error, déclarées mais non affichées ici).

## Classe `C`

Sous-fenêtre des notes de développement.

Le module renvoie un constructeur : `local obj = require("editor_missionEditor_dev")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:draw()` | Dessine le texte multiligne, le sélecteur de mode et la case « Dev Mission » (infobulle : la mission n'apparaît que si le mode dev est activé). | 20 |
| `C:init(missionEditor)` | Constructeur : mémorise la référence au missionEditor. | 9 |
| `C:setMission(mission)` | Sélectionne la mission : crée le tampon du texte (2048 caractères) et la case devMission à partir de mission.devNotes. | 14 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/missionEditor/dev.lua`.*
