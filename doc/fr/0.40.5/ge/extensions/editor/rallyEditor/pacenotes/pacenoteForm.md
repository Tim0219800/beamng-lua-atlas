# `editor_rallyEditor_pacenotes_pacenoteForm`

*Fichier : `lua/ge/extensions/editor/rallyEditor/pacenotes/pacenoteForm.lua` · VM : Game Engine (GE) · 457 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/rallyEditor/pacenotes/pacenoteForm")` (fichier sous extensions/ mais pas une extension classique)

Formulaire principal d'édition d'un pacenote dans l'éditeur de rallye. Il affiche le nom, les actions (Place Vehicle, TODO, Done, Delete..., fusion avec le précédent/suivant), le statut, puis le sous-formulaire selon le mode audio (structuré via structuredForm, personnalisé via customForm, ou freeform avec champ texte, lecture audio et « Generate from Structured »), les métadonnées de calibration, les mesures, et les options (override du mode audio, type de déclencheur). Une confirmation modale précède la suppression. Le module renvoie un constructeur de classe C.

## Remarques

- Aucune fonction exportée : on obtient une instance avec require(...)(pacenoteToolsWindow).
- Une aide « Playback Rules » est définie (variables currLap et maxLap, code Lua libre évalué) ; le champ de saisie correspondant est commenté dans ce fichier.

## Classe `C`

Instance du formulaire de pacenote.

Le module renvoie un constructeur : `local obj = require("editor_rallyEditor_pacenotes_pacenoteForm")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearState()` | Remet à zéro l'état d'édition (édition en cours, confirmation de suppression) et retire le pacenote. | 50 |
| `C:draw()` | Dessine le formulaire dans une zone enfant imgui, ou « No pacenote selected ». | 440 |
| `C:init(pacenoteToolsWindow)` | Constructeur : mémorise la fenêtre d'outils et son état, sans pacenote. | 37 |
| `C:setPacenote(pacenote)` | Définit le pacenote édité et réinitialise StructuredForm, CustomForm et MeasurementsForm. | 43 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/pacenotes/pacenoteForm.lua`.*
