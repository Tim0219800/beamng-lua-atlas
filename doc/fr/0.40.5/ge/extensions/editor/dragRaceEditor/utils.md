# `editor_dragRaceEditor_utils`

*Fichier : `lua/ge/extensions/editor/dragRaceEditor/utils.lua` · VM : Game Engine (GE) · 244 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dragRaceEditor_utils` : `extensions.load("editor_dragRaceEditor_utils")`, puis la globale `editor_dragRaceEditor_utils`

Utilitaires de l'éditeur de drag race : affichage des erreurs, drapeau de modifications non sauvées, pile undo/redo sur dragRaceData, validation et création de données de course/voies par défaut, mise à jour de la souris, création d'un transformUtil et widgets d'en-tête ImGui.

## Remarques

- La pile d'annulation est limitée à state.getMaxUndoSteps() (20) entrées ; saveToUndoStack vide la pile de rétablissement.
- updateMouseInfo ici (contrairement à input.updateMouseInfo) suppose que core_forest existe et force down/hold/up à false si le raycast échoue.
- dragHeaderLabel renvoie deux valeurs (gsub renvoie aussi le nombre de remplacements) ; seule la première est utilisée à la concaténation.
- La validation exige stripId non vide ou strip.lanes, plus un dragType non vide.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dragRaceEditor_utils.clearUnsavedChanges()` | Efface le drapeau de modifications non sauvées. | 34 |
| `editor_dragRaceEditor_utils.createNewDragRaceData()` | Crée un dragRaceData par défaut : contexte activity, type headsUpRace, 4 phases (stage, countdown, race, stop), prefabs (christmasTree .500, displaySign, paths, decorations) non utilisés. | 116 |
| `editor_dragRaceEditor_utils.createNewLane(laneIndex)` | Crée une voie par défaut : noms « Lane N », couleur blue, waypoints stage et endLine, boundary, tous avec la transformation par défaut. | 94 |
| `editor_dragRaceEditor_utils.dragHeaderLabel(s)` | Texte d'en-tête sûr pour ImGui : « Untitled » si vide, sinon la chaîne sans caractère #. | 227 |
| `editor_dragRaceEditor_utils.dragSectionHeader(visibleLabel, idSuffix, defaultOpen)` | Dessine un CollapsingHeader avec un padding plus grand. | 235 |
| `editor_dragRaceEditor_utils.logError(message)` | Mémorise le message comme dernière erreur, l'affiche 3 s et l'écrit dans le log (niveau E, tag DragRaceEditor). | 11 |
| `editor_dragRaceEditor_utils.markUnsavedChanges()` | Marque l'état comme modifié non sauvegardé. | 30 |
| `editor_dragRaceEditor_utils.redo()` | Rétablit l'état annulé : le courant retourne dans la pile undo. | 62 |
| `editor_dragRaceEditor_utils.reorderLanes(t, old, new)` | Déplace un élément d'un tableau de la position old à new en décalant les autres (modifie t sur place). | 163 |
| `editor_dragRaceEditor_utils.saveToUndoStack()` | Empile une copie profonde de dragRaceData (supprime la plus ancienne si la pile est pleine) et vide la pile redo. | 38 |
| `editor_dragRaceEditor_utils.setupTransform(label, transform, allowTranslate, allowRotate, allowScale)` | Crée un transformUtil (gizmo) initialisé depuis une table transform {position, rotation, scale}. | 212 |
| `editor_dragRaceEditor_utils.showError()` | Affiche en rouge l'erreur courante tant que son délai n'est pas écoulé ; décrémente le délai avec le DeltaTime ImGui. À appeler à chaque frame. | 17 |
| `editor_dragRaceEditor_utils.undo()` | Dépile l'état précédent : le courant va dans la pile redo. Ne fait rien si la pile est vide. | 50 |
| `editor_dragRaceEditor_utils.updateMouseInfo()` | Met à jour la table souris de state (rayon caméra, raycast, clic/maintien/relâchement bouton gauche si ImGui ne capture pas la souris). | 173 |
| `editor_dragRaceEditor_utils.validateDragRaceData(data)` | Vérifie qu'un dragRaceData est exploitable. | 74 |

### Détail des paramètres

#### `editor_dragRaceEditor_utils.createNewDragRaceData()`

Crée un dragRaceData par défaut : contexte activity, type headsUpRace, 4 phases (stage, countdown, race, stop), prefabs (christmasTree .500, displaySign, paths, decorations) non utilisés.

- **renvoie** : table données

#### `editor_dragRaceEditor_utils.createNewLane(laneIndex)`

Crée une voie par défaut : noms « Lane N », couleur blue, waypoints stage et endLine, boundary, tous avec la transformation par défaut.

- `laneIndex` (*integer*) : numéro de voie (laneOrder)
- **renvoie** : table voie

#### `editor_dragRaceEditor_utils.dragHeaderLabel(s)`

Texte d'en-tête sûr pour ImGui : « Untitled » si vide, sinon la chaîne sans caractère #.

- `s` (*string|nil*) : texte
- **renvoie** : string libellé

#### `editor_dragRaceEditor_utils.dragSectionHeader(visibleLabel, idSuffix, defaultOpen)`

Dessine un CollapsingHeader avec un padding plus grand.

- `visibleLabel` (*string|nil*) : texte affiché
- `idSuffix` (*string*) : suffixe d'ID ImGui (ex. "##xyz")
- `defaultOpen` (*boolean*) : ouvert par défaut
- **renvoie** : boolean true si la section est ouverte

#### `editor_dragRaceEditor_utils.logError(message)`

Mémorise le message comme dernière erreur, l'affiche 3 s et l'écrit dans le log (niveau E, tag DragRaceEditor).

- `message` (*string*) : texte de l'erreur

#### `editor_dragRaceEditor_utils.reorderLanes(t, old, new)`

Déplace un élément d'un tableau de la position old à new en décalant les autres (modifie t sur place).

- `t` (*table*) : tableau
- `old` (*integer*) : index source
- `new` (*integer*) : index destination

#### `editor_dragRaceEditor_utils.setupTransform(label, transform, allowTranslate, allowRotate, allowScale)`

Crée un transformUtil (gizmo) initialisé depuis une table transform {position, rotation, scale}.

- `label` (*string*) : nom/identifiant du transformUtil
- `transform` (*table*) : position {x,y,z}, rotation quaternion {x,y,z,w}, scale {x,y,z}
- `allowTranslate` (*boolean|nil*) : faux seulement si false explicite
- `allowRotate` (*boolean|nil*) : faux seulement si false explicite
- `allowScale` (*boolean|nil*) : faux seulement si false explicite
- **renvoie** : table transformUtil

#### `editor_dragRaceEditor_utils.validateDragRaceData(data)`

Vérifie qu'un dragRaceData est exploitable.

- `data` (*table|nil*) : données à vérifier
- **renvoie** : boolean validité
- **renvoie** : string|nil message d'erreur si invalide

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dragRaceEditor/utils.lua`.*
