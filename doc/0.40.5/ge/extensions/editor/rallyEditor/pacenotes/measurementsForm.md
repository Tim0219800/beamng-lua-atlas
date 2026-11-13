# `editor_rallyEditor_pacenotes_measurementsForm`

*Fichier : `lua/ge/extensions/editor/rallyEditor/pacenotes/measurementsForm.lua` · VM : Game Engine (GE) · 259 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_rallyEditor_pacenotes_measurementsForm` : `extensions.load("editor_rallyEditor_pacenotes_measurementsForm")`, puis la globale `editor_rallyEditor_pacenotes_measurementsForm`

Section « Measurements » de l'éditeur de pacenotes de rallye : repliable au clic sur son titre. Elle affiche pour le pacenote sélectionné le résumé de la mesure géométrique du virage (type d'ajustement, intensité, direction, diamètre, arc, corde, angle, qualité d'ajustement, candidat épingle) et une liste déroulante « Measurement Type ». Un bouton « Details » ouvre une fenêtre avec l'arbre complet de pacenote.measurements, et un bouton ouvre/ferme la fenêtre de calibration.

## Remarques

- Distances en mètres, arrondies à l'unité ; angle en degrés.
- Le type de mesure par défaut n'est pas stocké dans le carnet (corner.measurementType est remis à nil).
- Changer le type relance la mesure du pacenote (measureSelectedPacenote(true)) si une snaproad est disponible, sinon applyMeasurements ou refreshStructured.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_rallyEditor_pacenotes_measurementsForm.clear()` | Réinitialisation d'état appelée par l'éditeur ; ne fait rien dans ce module. *(interne)* | 256 |
| `editor_rallyEditor_pacenotes_measurementsForm.draw(pacenote, pacenoteToolsState, pacenoteToolsWindow)` | Dessine la section Measurements. Met pacenoteToolsState.showMeasurements à true quand la section est dépliée, false sinon. | 222 |

### Détail des paramètres

#### `editor_rallyEditor_pacenotes_measurementsForm.draw(pacenote, pacenoteToolsState, pacenoteToolsWindow)`

Dessine la section Measurements. Met pacenoteToolsState.showMeasurements à true quand la section est dépliée, false sinon.

- `pacenote` (*table*) : Pacenote sélectionné.
- `pacenoteToolsState` (*table|nil*) : État partagé des outils pacenotes (champ showMeasurements écrit).
- `pacenoteToolsWindow` (*table|nil*) : Fenêtre d'outils pacenotes (rallyEditor, measureSelectedPacenote, markValidationDirty).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/pacenotes/measurementsForm.lua`.*
