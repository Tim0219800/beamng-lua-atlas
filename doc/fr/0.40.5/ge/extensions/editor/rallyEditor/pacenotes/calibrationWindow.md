# `editor_rallyEditor_pacenotes_calibrationWindow`

*Fichier : `lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationWindow.lua` · VM : Game Engine (GE) · 866 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_rallyEditor_pacenotes_calibrationWindow` : `extensions.load("editor_rallyEditor_pacenotes_calibrationWindow")`, puis la globale `editor_rallyEditor_pacenotes_calibrationWindow`

Fenêtre imgui flottante « Pacenote Calibration » de l'éditeur de rallye, avec trois onglets. « Calibration » : édition des bornes (seuils) du diamètre d'intensité des virages et des longueurs d'arc par intensité, sur des lignes graduées colorées, enregistrées comme surcharges de mission (calibrationOverrides) pour le style de compositeur actif. « Analysis » : compare les étiquettes manuelles de calibration des pacenotes (cibles) avec les intensités et longueurs projetées par les mesures actuelles, avec tooltips d'exemples. « Export » : boutons « Export Analysis JSON » et « Export Analysis JSON v2 » (voir calibrationAnalysisExport). Après modification des bornes, les caches du compositeur du carnet sont invalidés et les notes structurées recalculées.

## Remarques

- Ne s'affiche que si openPtr[0] est vrai, qu'un carnet est chargé dans l'onglet Pacenotes et que le dossier de mission et le style de compositeur actif sont connus.
- Seules les bornes valides (calibrationOverrides.validateBoundaries) sont enregistrées.
- Les fonctions d'analyse sont dupliquées dans calibrationAnalysisExport.lua (matchers, distributions) ; les deux fichiers peuvent diverger.
- Fenêtre non dockable (WindowFlags_NoDocking), taille initiale 620 x 720.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_rallyEditor_pacenotes_calibrationWindow.draw(rallyEditor, openPtr)` | Dessine la fenêtre de calibration (onglets Calibration, Analysis, Export). À appeler à chaque image par l'éditeur ; ne fait rien si la fenêtre est fermée ou sans carnet. | 832 |

### Détail des paramètres

#### `editor_rallyEditor_pacenotes_calibrationWindow.draw(rallyEditor, openPtr)`

Dessine la fenêtre de calibration (onglets Calibration, Analysis, Export). À appeler à chaque image par l'éditeur ; ne fait rien si la fenêtre est fermée ou sans carnet.

- `rallyEditor` (*table*) : Extension de l'éditeur de rallye (fournit getPacenotesWindow).
- `openPtr` (*BoolPtr*) : Pointeur imgui de l'état ouvert/fermé de la fenêtre ; mis à jour par la croix de fermeture.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationWindow.lua`.*
