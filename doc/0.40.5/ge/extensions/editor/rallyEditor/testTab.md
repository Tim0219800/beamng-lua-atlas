# `editor_rallyEditor_testTab`

*Fichier : `lua/ge/extensions/editor/rallyEditor/testTab.lua` · VM : Game Engine (GE) · 83 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/rallyEditor/testTab")` (fichier sous extensions/ mais pas une extension classique)

Onglet « Test » de l'éditeur de rallye (outil de debug). Le module renvoie un constructeur de classe C. Il propose un bouton « Test 1 » (affiche un pacenote système aléatoire « precountdown » dans le log), « Load Recce Mission » (recharge l'extension gameplay_rally_recceApp et charge la mission) et « Unload Recce Mission ».

## Remarques

- Aucune fonction exportée : on obtient une instance avec require(...)(rallyEditor).
- self.driveline est initialisé à nil et n'est plus utilisé (le chargement de driveline a été retiré).

## Classe `C`

Instance de l'onglet Test, créée par le constructeur renvoyé par le module (appelle init). Possède windowDescription = 'Test'.

Le module renvoie un constructeur : `local obj = require("editor_rallyEditor_testTab")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:draw()` | Dessine les trois boutons de test (imgui). Ne fait rien sans notebook. | 42 |
| `C:drawDebugEntrypoint()` | Point d'entrée de dessin debug en vue 3D ; vide ici. | 71 |
| `C:init(rallyEditor)` | Constructeur : mémorise rallyEditor, path = nil. | 13 |
| `C:selected()` | Appelé par l'éditeur de rallye quand l'onglet est sélectionné ; relance le hook onEditorEditModeChanged(nil, nil) pour redessiner la légende des raccourcis. | 25 |
| `C:setPath(path)` | Définit le notebook courant. | 20 |
| `C:test1()` | Affiche dans la console le nom d'un pacenote système aléatoire de type 'precountdown' (path:getRandomSystemPacenote). | 64 |
| `C:unselect()` | Appelé quand l'onglet est quitté ; émet aussi onEditorEditModeChanged(nil, nil). | 36 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorEditModeChanged` — écouté par 1 module(s)

**Charge les extensions :** `gameplay_rally_recceApp`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/testTab.lua`.*
