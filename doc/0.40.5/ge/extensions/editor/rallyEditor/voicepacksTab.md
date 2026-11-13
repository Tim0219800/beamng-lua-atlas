# `editor_rallyEditor_voicepacksTab`

*Fichier : `lua/ge/extensions/editor/rallyEditor/voicepacksTab.lua` · VM : Game Engine (GE) · 291 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/rallyEditor/voicepacksTab")` (fichier sous extensions/ mais pas une extension classique)

Onglet « Voicepacks » de l'éditeur de rallye. Il permet de choisir le voicepack et le notebook associé (menus déroulants), et liste les voicepacks globaux (jeu/mods) et ceux locaux à la mission (<mission>/rally/voicepacks/<nom>/) avec persona, langue, dialecte, style, style de compositeur, dossier, précédence des notebooks et notebooks qui existent dans cette mission. Le nom est en vert si les fichiers audio requis sont tous présents, en rouge sinon (résultat mis en cache). Le module renvoie un constructeur de classe C.

## Remarques

- Aucune fonction exportée : on obtient une instance avec require(...)(rallyEditor).
- Le bouton « Refresh voicepacks » invalide les caches de voicepack.lua et le cache de validation audio.
- Utilise rallyEditor.getCurrentMissionDir, getCurrentVoicepackPick, setVoicepackPick, getCurrentPath et loadNotebook.

## Classe `C`

Instance de l'onglet (windowDescription = 'Voicepacks').

Le module renvoie un constructeur : `local obj = require("editor_rallyEditor_voicepacksTab")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:draw(mouseInfo)` | Dessine l'onglet ; message si aucune mission n'est chargée. | 255 |
| `C:drawGlobalVoicepacks(missionDir)` | Dessine la liste des voicepacks globaux (voicepack.scan()). | 241 |
| `C:drawMissionLocalVoicepacks(missionDir)` | Dessine la liste des voicepacks de la mission (voicepack.scanMission). | 248 |
| `C:drawPickers(missionDir)` | Dessine les menus « Voicepack » et « Notebook » ; changer de sélection appelle setVoicepackPick ou loadNotebook de l'éditeur. | 130 |
| `C:init(rallyEditor)` | Constructeur : mémorise rallyEditor et crée le cache de validation audio. | 20 |
| `C:selected()` | Appelé à la sélection de l'onglet : émet onEditorEditModeChanged(nil, nil). | 29 |
| `C:setPath(path)` | Définit le notebook courant. | 25 |
| `C:unselect()` | Appelé quand l'onglet est quitté : émet onEditorEditModeChanged(nil, nil). | 33 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorEditModeChanged` — écouté par 1 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/voicepacksTab.lua`.*
