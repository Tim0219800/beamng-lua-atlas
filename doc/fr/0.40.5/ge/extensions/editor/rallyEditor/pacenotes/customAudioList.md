# `editor_rallyEditor_pacenotes_customAudioList`

*Fichier : `lua/ge/extensions/editor/rallyEditor/pacenotes/customAudioList.lua` · VM : Game Engine (GE) · 214 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_rallyEditor_pacenotes_customAudioList` : `extensions.load("editor_rallyEditor_pacenotes_customAudioList")`, puis la globale `editor_rallyEditor_pacenotes_customAudioList`

Liste imgui des clips audio personnalisés d'un carnet de rallye, utilisée dans l'éditeur de pacenotes (mode audio custom). Elle affiche tous les clips dans l'ordre, regroupés sous un en-tête par pacenote (couleurs jaune/violet en alternance, vert pour le pacenote sélectionné). Chaque ligne a un bouton de lecture, un bouton « ancre » (viseur) pour choisir dans la vue 3D le pacenote auquel rattacher le clip, un bouton pour effacer l'ancre, et le texte de transcription (sinon le nom du fichier). Un bouton « Sync audio files » relit le dossier audio.

## Remarques

- Les clips entre deux ancres sont répartis par estimation (« guessed ») ; une ancre en conflit d'ordre avec une autre est signalée par un avertissement dans l'infobulle.
- Sans pacenote dans le carnet, les clips sont listés sous « Unassigned audio » et le bouton d'ancre est désactivé.
- Un clip dont le fichier n'existe pas a un bouton de lecture rouge.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_rallyEditor_pacenotes_customAudioList.draw(notebook, selectedPacenote, pacenoteToolsWindow)` | Dessine la barre d'outils, l'aide de sélection d'ancre et la liste défilante des clips. Affiche un message si le carnet est absent ou si aucun fichier audio n'est trouvé. | 184 |

### Détail des paramètres

#### `editor_rallyEditor_pacenotes_customAudioList.draw(notebook, selectedPacenote, pacenoteToolsWindow)`

Dessine la barre d'outils, l'aide de sélection d'ancre et la liste défilante des clips. Affiche un message si le carnet est absent ou si aucun fichier audio n'est trouvé.

- `notebook` (*table|nil*) : Carnet (méthodes customAudioBasenamesFor, scanCustomAudioBasenames, syncCustomAudioFromDisk, resolveCustomAudioBasename, getCustomAudioAnchorInfo, clearCustomAudioAnchor, loadCustomPacenoteTranscriptions).
- `selectedPacenote` (*table|nil*) : Pacenote actuellement sélectionné, dont le groupe est surligné.
- `pacenoteToolsWindow` (*table|nil*) : Fenêtre d'outils pacenotes : fournit beginCustomAudioAnchorPick, isPickingCustomAudioAnchorFor, getCustomAudioAnchorPickBasename.

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/pacenotes/customAudioList.lua`.*
