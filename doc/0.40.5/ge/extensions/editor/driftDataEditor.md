# `editor_driftDataEditor`

*Fichier : `lua/ge/extensions/editor/driftDataEditor.lua` · VM : Game Engine (GE) · 864 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_driftDataEditor` : `extensions.load("editor_driftDataEditor")`, puis la globale `editor_driftDataEditor`

Drift Data Editor (menu Gameplay > Drift Data Editor) : fenêtre à deux onglets pour les données du mode drift. « Drift stunt zones editor » crée, déplace et réordonne des zones de figures (donut, driftThrough, hitPole, nearPole) avec leur score, et les enregistre en JSON (par défaut dans /gameplay/temp/). « Drift spots editor » édite les spots de drift du niveau courant (lignes avec position, rotation, échelle, direction d'entrée, point de téléportation de la grande carte, infos d'objectifs) chargés via gameplay_drift_saveLoad. Exige un niveau chargé.

## Remarques

- Types de zones et paliers de score proposés : driftThrough 1000/1500/2000 (points max), donut 250/500/750 (points fixes), hitPole et nearPole 500/1000/1500 (points max). Le score par défaut vient de gameplay_drift_scoring.getScoreOptions().defaultPoints.
- Les positions, rotations et échelles lues dans un JSON sont converties en vec3/quat au chargement.
- Seuls donut, driftThrough et hitPole ont un gizmo de transformation dans selectStuntZone ; nearPole n'en a pas.
- Bug probable : la variable logTag utilisée dans loadDriftData n'est pas déclarée dans ce fichier (nil) : le message d'erreur de fichier introuvable est journalisé sans tag.
- onSerialize/onDeserialized conservent le fichier courant, les zones et l'index sélectionné lors d'un rechargement ; la sélection est restaurée plus tard via autoSelectElement.
- M.drawAxisBox est un doublon des utilitaires de dessin de boîte des autres éditeurs.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_driftDataEditor.clearStuntZonesEditor()` | Réinitialise l'onglet des zones de figures : fichier courant remis à /gameplay/temp/ sans nom, données vides ({stuntZones = {}}). Appelée aussi quand l'onglet Drift spots est affiché. *(interne)* | 171 |
| `editor_driftDataEditor.drawAxisBox(corner, x, y, z, clr)` | Dessine en debug une boîte pleine (triangles recto/verso et arêtes noires) à partir d'un coin et de trois vecteurs d'arête. | 795 |
| `editor_driftDataEditor.drawElementDetail(elem)` | Dessine l'édition de la zone sélectionnée : met à jour pos/rot/scl depuis le gizmo (transformUtil), le délai cooldown si présent, et le score par une liste de paliers selon le type. | 58 |
| `editor_driftDataEditor.onDeserialized(data)` | Hook après rechargement : restaure le fichier, les données et l'index à resélectionner. *(interne)* *(hook)* | 749 |
| `editor_driftDataEditor.onEditorGui()` | Hook chaque frame : dessine les onglets si un niveau est chargé, sinon un message demandant de charger un niveau. *(interne)* *(hook)* | 699 |
| `editor_driftDataEditor.onEditorInitialized()` | Hook : enregistre la fenêtre (1500x700), l'entrée de menu Gameplay et crée des données vides si besoin. *(interne)* *(hook)* | 731 |
| `editor_driftDataEditor.onSerialize()` | Hook avant rechargement : renvoie selectedStuntZoneIndex, currentFileDir, currentFileName et driftData. *(interne)* *(hook)* | 739 |
| `editor_driftDataEditor.selectStuntZone(index)` | Sélectionne une zone de figure et crée le gizmo adapté à son type (donut : position et échelle uniforme ; driftThrough : position, rotation, échelle ; hitPole : position). *(interne)* | 113 |
| `editor_driftDataEditor.show()` | Vide la sélection d'objets et affiche la fenêtre driftDataEditor. | 726 |
| `editor_driftDataEditor.updateMouseInfo()` | Met à jour la table souris locale (rayon caméra, raycast, clic/maintien/relâchement et positions associées) utilisée par les gizmos. | 759 |

### Détail des paramètres

#### `editor_driftDataEditor.drawAxisBox(corner, x, y, z, clr)`

Dessine en debug une boîte pleine (triangles recto/verso et arêtes noires) à partir d'un coin et de trois vecteurs d'arête.

- `corner` (*vec3*) : coin
- `x` (*vec3*) : arête X
- `y` (*vec3*) : arête Y
- `z` (*vec3*) : arête Z
- `clr` (*ColorF*) : couleur

#### `editor_driftDataEditor.drawElementDetail(elem)`

Dessine l'édition de la zone sélectionnée : met à jour pos/rot/scl depuis le gizmo (transformUtil), le délai cooldown si présent, et le score par une liste de paliers selon le type.

- `elem` (*table|nil*) : zone de figure (type, pos, rot, scl, score, cooldown)

#### `editor_driftDataEditor.onDeserialized(data)`

Hook après rechargement : restaure le fichier, les données et l'index à resélectionner.

- `data` (*table*) : table produite par onSerialize

#### `editor_driftDataEditor.onSerialize()`

Hook avant rechargement : renvoie selectedStuntZoneIndex, currentFileDir, currentFileName et driftData.

- **renvoie** : table état à conserver

#### `editor_driftDataEditor.selectStuntZone(index)`

Sélectionne une zone de figure et crée le gizmo adapté à son type (donut : position et échelle uniforme ; driftThrough : position, rotation, échelle ; hitPole : position).

- `index` (*integer*) : index (base 1) dans driftData.stuntZones

## Appels vers le moteur (C++)

- `FS:` `remove`
- `be:` `getPlayerVehicleID`
- `debugDrawer:` `drawCylinder`, `drawLine`, `drawSphere`, `drawTextAdvanced`, `drawTriSolid`
- `obj:` `getPosition`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/driftDataEditor.lua`.*
