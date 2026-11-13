# `editor_rallyEditor_systemPacenotesTab`

*Fichier : `lua/ge/extensions/editor/rallyEditor/systemPacenotesTab.lua` · VM : Game Engine (GE) · 204 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/rallyEditor/systemPacenotesTab")` (fichier sous extensions/ mais pas une extension classique)

Onglet « System Pacenotes » de l'éditeur de rallye : tableau en lecture seule des pacenotes système (usage interne, par ex. compte à rebours) du notebook, avec nom, poids, texte et bouton de lecture audio. Disponible seulement pour les missions de type rallyStage. Le bouton « Refresh System Pacenotes » vide les compositeurs en cache, recharge le module du style de compositeur, sauvegarde le notebook puis relit les pacenotes. Le module renvoie un constructeur de classe C.

## Remarques

- Aucune fonction exportée : on obtient une instance avec require(...)(rallyEditor).
- Les pacenotes requis (systemPacenotes.required) sont affichés en premier, les autres triés par nom.
- Couleur du bouton audio : vert si audio perso présent, rouge si audio perso manquant, gris si fichier standard absent.

## Classe `C`

Instance de l'onglet (windowDescription = 'System Pacenotes').

Le module renvoie un constructeur : `local obj = require("editor_rallyEditor_systemPacenotesTab")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearState()` | Oublie le notebook et les pacenotes système affichés. | 18 |
| `C:draw(mouseInfo)` | Dessine l'onglet (message si mission non rallyStage, sinon bouton de rafraîchissement et tableau à 4 colonnes). | 122 |
| `C:init(rallyEditor)` | Constructeur : mémorise rallyEditor, liste vide de pacenotes système. | 11 |
| `C:selected()` | Appelé quand l'onglet est sélectionné : charge path:getSystemPacenotesForAudioMode() puis émet onEditorEditModeChanged(nil, nil). | 36 |
| `C:setPath(path)` | Définit le notebook courant (le commentaire du code précise que « path » désigne le notebook) ; active l'affichage seulement si path:getMissionType() == 'rallyStage'. | 25 |
| `C:unselect()` | Appelé quand l'onglet est quitté : émet onEditorEditModeChanged(nil, nil). | 50 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorEditModeChanged` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/systemPacenotesTab.lua`.*
