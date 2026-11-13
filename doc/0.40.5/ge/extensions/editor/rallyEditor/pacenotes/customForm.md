# `editor_rallyEditor_pacenotes_customForm`

*Fichier : `lua/ge/extensions/editor/rallyEditor/pacenotes/customForm.lua` · VM : Game Engine (GE) · 120 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_rallyEditor_pacenotes_customForm` : `extensions.load("editor_rallyEditor_pacenotes_customForm")`, puis la globale `editor_rallyEditor_pacenotes_customForm`

Formulaire imgui de l'éditeur de pacenotes pour les pacenotes en mode audio « custom » (fichiers audio personnalisés). Il affiche la case « Slow Corner » et son type de relâchement, l'aperçu texte du pacenote (noteOutputCustom), des boutons pour ouvrir ou copier le dossier des fichiers audio, puis la liste des clips assignés avec un bouton de lecture (Engine.Audio.intercomPlayPacenote). La description affichée d'un clip vient des transcriptions du carnet, sinon du nom du fichier.

## Remarques

- Le dossier audio est créé s'il n'existe pas quand on clique sur « ouvrir le dossier ».
- Les clips dont le fichier n'existe pas ont un bouton de lecture rouge et ne jouent rien.
- Les champs Slow Corner modifient les mêmes champs que le formulaire structuré et marquent la validation comme à refaire (markValidationDirty).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_rallyEditor_pacenotes_customForm.clear()` | Réinitialisation d'état appelée par l'éditeur ; ne fait rien dans ce module. *(interne)* | 116 |
| `editor_rallyEditor_pacenotes_customForm.draw(pacenote)` | Dessine le formulaire d'un pacenote en mode audio custom. | 86 |

### Détail des paramètres

#### `editor_rallyEditor_pacenotes_customForm.draw(pacenote)`

Dessine le formulaire d'un pacenote en mode audio custom.

- `pacenote` (*table*) : Pacenote édité (méthodes toggleSlowCorner, getCustomAudioFiles, noteOutputCustom, customAudioFileDir…).

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/pacenotes/customForm.lua`.*
