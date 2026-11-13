# `editor_rallyEditor_pacenotes_selectedPacenoteUtility`

*Fichier : `lua/ge/extensions/editor/rallyEditor/pacenotes/selectedPacenoteUtility.lua` · VM : Game Engine (GE) · 154 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_rallyEditor_pacenotes_selectedPacenoteUtility` : `extensions.load("editor_rallyEditor_pacenotes_selectedPacenoteUtility")`, puis la globale `editor_rallyEditor_pacenotes_selectedPacenoteUtility`

Petite fenêtre flottante bleue « Selected Pacenote Utility » de l'éditeur de rallye. Pour le pacenote sélectionné, elle affiche trois blocs : « Actual » (appel de virage, longueur et forme réellement générés par le compositeur), « Adjustment » (risque d'intensité plus/moins, virage plus long/court, longueur ignorée) et « Metadata » (métadonnées de calibration : descripteur ou intensité, direction, longueur, forme). Elle lit le premier virage (slot 4) de la structure du pacenote.

## Remarques

- La fenêtre ne s'affiche pas si aucun pacenote n'est sélectionné, s'il est manquant (pn.missing) ou si le chemin caméra est en lecture.
- Affiche « <none> » quand une information est absente.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_rallyEditor_pacenotes_selectedPacenoteUtility.draw(pacenotesWindow)` | Dessine la fenêtre d'utilité du pacenote sélectionné. À appeler chaque frame depuis la fenêtre des pacenotes. | 121 |

### Détail des paramètres

#### `editor_rallyEditor_pacenotes_selectedPacenoteUtility.draw(pacenotesWindow)`

Dessine la fenêtre d'utilité du pacenote sélectionné. À appeler chaque frame depuis la fenêtre des pacenotes.

- `pacenotesWindow` (*table*) : Fenêtre des pacenotes ; doit fournir selectedPacenote() et cameraPathIsPlaying().

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/pacenotes/selectedPacenoteUtility.lua`.*
