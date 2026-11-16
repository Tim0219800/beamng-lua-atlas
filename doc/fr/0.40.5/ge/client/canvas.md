# `client_canvas`

*Fichier : `lua/ge/client/canvas.lua` · VM : Game Engine (GE) · 66 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("client/canvas")`

Gère le GuiCanvas (la fenêtre de rendu) côté client : création unique de l'objet « Canvas » et affichage/masquage du curseur de la souris. Appelé au démarrage du jeu (initializeCanvas) ; un moddeur peut utiliser showCursor/hideCursor pour libérer ou verrouiller la souris.

## Remarques

- createCanvas réutilise l'objet « Canvas » s'il existe déjà dans le scenetree ; sinon il le crée avec displayWindow = false.
- Si la variable $forceFullscreen est vraie, $pref::Video::displayOutputDevice est vidée ; si $pref::Video::autoDetect est vraie, core_settings_graphic.autoDetectApplyGraphicsQuality() est appelée.
- showCursor et hideCursor appellent aussi lockMouse (false / true) en plus de changer la visibilité du curseur du canvas.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `client_canvas.createCanvas(windowPlacement)` | Retourne l'objet GuiCanvas « Canvas », en le créant et l'enregistrant s'il n'existe pas. Applique les préférences de plein écran et d'auto-détection graphique. *(interne)* | 8 |
| `client_canvas.hideCursor()` | Verrouille la souris (lockMouse(true)) et cache le curseur du canvas. | 57 |
| `client_canvas.initializeCanvas()` | Crée le canvas une seule fois (journalise une erreur si déjà créé), lit WindowPlacement dans les options graphiques, et appelle quit() si la création échoue. *(interne)* | 28 |
| `client_canvas.showCursor()` | Déverrouille la souris (lockMouse(false)) et rend le curseur du canvas visible. | 48 |

### Détail des paramètres

#### `client_canvas.createCanvas(windowPlacement)`

Retourne l'objet GuiCanvas « Canvas », en le créant et l'enregistrant s'il n'existe pas. Applique les préférences de plein écran et d'auto-détection graphique.

- `windowPlacement` (*any*) : Placement de fenêtre ; non utilisé dans le corps de la fonction (déduit du code).
- **renvoie** : userdata L'objet Canvas.

#### `client_canvas.initializeCanvas()`

Crée le canvas une seule fois (journalise une erreur si déjà créé), lit WindowPlacement dans les options graphiques, et appelle quit() si la création échoue.

- **renvoie** : userdata|nil Le canvas, ou nil si déjà créé.

## Champs

| Champ | Type | Description |
|---|---|---|
| `canvasCreated` | boolean | Vrai une fois le canvas créé par initializeCanvas ; empêche une seconde création. |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/client/canvas.lua`.*
