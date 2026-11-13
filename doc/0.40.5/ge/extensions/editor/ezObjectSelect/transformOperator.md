# `editor_ezObjectSelect_transformOperator`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/transformOperator.lua` · VM : Game Engine (GE) · 421 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_transformOperator` : `extensions.load("editor_ezObjectSelect_transformOperator")`, puis la globale `editor_ezObjectSelect_transformOperator`

Opérateur de translation « modal » d'Easy Object Select, façon Blender : la touche G démarre le déplacement de la sélection, X/Y/Z contraignent à un axe, Shift+axe à un plan, appuyer deux fois sur le même axe bascule monde/local, des chiffres tapés donnent une distance exacte (transformNumericInput), clic gauche ou Entrée confirment, clic droit ou Échap annulent. S'appuie sur transformSession pour appliquer et valider (historique annulable) et sur transformGizmo/débug pour les guides.

## Remarques

- Sans contrainte, le déplacement se fait dans le plan de la vue à la profondeur du pivot (centre de la boîte de sélection).
- Le pas de grille (options.gridSize, absolu ou relatif) est ignoré pendant une saisie numérique.
- L'ancre est le dernier objet de editor.selection.object ; begin échoue si une session est déjà active.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_transformOperator.begin(options)` | Démarre l'opération sur la sélection éditeur courante (ancre = dernier objet) : ouvre une transformSession, mémorise pivot, caméra, rayon de départ, axes monde/locaux, et masque le curseur. | 259 |
| `editor_ezObjectSelect_transformOperator.cancel()` | Annule l'opération en cours et restaure les transformations d'origine. | 332 |
| `editor_ezObjectSelect_transformOperator.drawScreen(options)` | Dessine l'infobulle écran près du curseur : contrainte, espace, valeur (distance ou saisie), grille, rappel des raccourcis. | 372 |
| `editor_ezObjectSelect_transformOperator.getObjectIds()` | IDs des objets manipulés par la session. | 350 |
| `editor_ezObjectSelect_transformOperator.isActive()` | Indique si une opération est en cours. | 346 |
| `editor_ezObjectSelect_transformOperator.setLocalSpace(localSpace)` | Fixe l'espace local/monde par défaut et l'applique à la contrainte courante. | 338 |
| `editor_ezObjectSelect_transformOperator.status()` | Résumé de l'état : contrainte ("VIEW", "X", "SHIFT+X"…), espace ("WORLD"/"LOCAL"), texte numérique saisi et delta courant. | 354 |
| `editor_ezObjectSelect_transformOperator.update(options)` | À appeler chaque frame tant que l'opération est active : gère annulation/confirmation, contraintes, saisie numérique, calcule le delta et l'applique via transformSession.updateDelta, puis dessine les guides. | 300 |
| `editor_ezObjectSelect_transformOperator.wantsBegin()` | Indique si la touche G vient d'être pressée. | 255 |

### Détail des paramètres

#### `editor_ezObjectSelect_transformOperator.begin(options)`

Démarre l'opération sur la sélection éditeur courante (ancre = dernier objet) : ouvre une transformSession, mémorise pivot, caméra, rayon de départ, axes monde/locaux, et masque le curseur.

- `options` (*table|nil*) : defaultLocal (boolean) : démarrer les contraintes en espace local.
- **renvoie** : boolean true si l'opération a démarré.

#### `editor_ezObjectSelect_transformOperator.cancel()`

Annule l'opération en cours et restaure les transformations d'origine.

- **renvoie** : boolean true si une opération était active.

#### `editor_ezObjectSelect_transformOperator.drawScreen(options)`

Dessine l'infobulle écran près du curseur : contrainte, espace, valeur (distance ou saisie), grille, rappel des raccourcis.

- `options` (*table|nil*) : gridSize (m), gridRelative (boolean) pour l'affichage de la grille.

#### `editor_ezObjectSelect_transformOperator.getObjectIds()`

IDs des objets manipulés par la session.

- **renvoie** : integer[] Liste d'IDs (vide si inactive).

#### `editor_ezObjectSelect_transformOperator.isActive()`

Indique si une opération est en cours.

- **renvoie** : boolean true si active.

#### `editor_ezObjectSelect_transformOperator.setLocalSpace(localSpace)`

Fixe l'espace local/monde par défaut et l'applique à la contrainte courante.

- `localSpace` (*boolean*) : true pour local.
- **renvoie** : boolean false si aucune opération active.

#### `editor_ezObjectSelect_transformOperator.status()`

Résumé de l'état : contrainte ("VIEW", "X", "SHIFT+X"…), espace ("WORLD"/"LOCAL"), texte numérique saisi et delta courant.

- **renvoie** : table|nil {constraint, space, numeric, delta}, ou nil si inactive.

#### `editor_ezObjectSelect_transformOperator.update(options)`

À appeler chaque frame tant que l'opération est active : gère annulation/confirmation, contraintes, saisie numérique, calcule le delta et l'applique via transformSession.updateDelta, puis dessine les guides.

- `options` (*table|nil*) : gridSize (m), gridRelative (boolean).
- **renvoie** : string|nil nil si inactive ; "active" en cours ; "confirm" ou "cancel" à la fin.
- **renvoie** : table|nil À la confirmation, infos de fin ({anchorDistance} en m) renvoyées par transformSession.finish.

#### `editor_ezObjectSelect_transformOperator.wantsBegin()`

Indique si la touche G vient d'être pressée.

- **renvoie** : boolean true si G pressée cette frame.

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLineInstance`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/transformOperator.lua`.*
