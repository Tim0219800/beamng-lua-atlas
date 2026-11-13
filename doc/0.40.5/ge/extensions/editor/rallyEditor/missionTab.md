# `editor_rallyEditor_missionTab`

*Fichier : `lua/ge/extensions/editor/rallyEditor/missionTab.lua` · VM : Game Engine (GE) · 116 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/rallyEditor/missionTab")` (fichier sous extensions/ mais pas une extension classique)

Onglet « Mission » de l'éditeur de rallye. Il affiche en lecture seule le nom, l'identifiant et le dossier de la mission courante (avec un bouton qui ouvre le dossier dans l'explorateur), puis liste les voicepacks locaux à la mission trouvés dans <missionDir>/rally/voicepacks/<nom>/ : dossier, nombre de fichiers pacenote_*.ogg et carnets associés. Le voicepack actuellement choisi est marqué d'une étoile verte. Le module renvoie un constructeur (classe C).

## Remarques

- Ne modifie aucune donnée : onglet purement informatif.
- Si l'entrée info.json n'existe pas, le bouton ouvre le dossier rally/ puis à défaut le dossier de la mission.
- Sans mission chargée, affiche un message invitant à ouvrir l'éditeur depuis le Mission Editor.

## Classe `C`

Objet onglet renvoyé par le constructeur (new(rallyEditor)). Champs : rallyEditor, path, windowDescription = 'Mission'.

Le module renvoie un constructeur : `local obj = require("editor_rallyEditor_missionTab")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:draw(mouseInfo)` | Dessine l'interface imgui de l'onglet (infos mission, liste des voicepacks locaux). | 45 |
| `C:init(rallyEditor)` | Constructeur interne : mémorise l'éditeur. | 14 |
| `C:selected()` | Appelée quand l'onglet est sélectionné : émet le hook onEditorEditModeChanged(nil, nil) pour quitter tout mode d'édition. | 22 |
| `C:setPath(path)` | Mémorise le carnet courant (appelé par l'éditeur). | 18 |
| `C:unselect()` | Appelée quand l'onglet est quitté : émet le hook onEditorEditModeChanged(nil, nil). | 26 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorEditModeChanged` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `FS:` `directoryExists`, `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/missionTab.lua`.*
