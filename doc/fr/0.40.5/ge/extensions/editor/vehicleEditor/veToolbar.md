# `editor_vehicleEditor_veToolbar`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/veToolbar.lua` · VM : Game Engine (GE) · 377 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_veToolbar` : `extensions.load("editor_vehicleEditor_veToolbar")`, puis la globale `editor_vehicleEditor_veToolbar`

Barre d'outils de l'éditeur de véhicule (Vehicle Editor). Elle affiche deux onglets, « Static Editor » et « Live Editor » (un clic change vEditor.editorMode), chacun avec des menus Apps et View (layouts de fenêtres, ajout d'une vue). L'onglet Live ajoute un menu Vehicles (faire apparaître un véhicule de type Car ou Truck à la position de la caméra, en retirer un ou tous) et des curseurs Camera Speed et Time of day. Elle gère aussi les fenêtres Save Layout, Delete Layout et Reset Layouts.

## Remarques

- N'affiche rien tant que vEditor n'existe pas ou que vEditor.editorActive est faux.
- Le curseur Time of day lit core_environment.getTimeOfDay() (champ time entre 0 et 1, affiché 0 à 100) et écrit avec core_environment.setTimeOfDay(tod). Le curseur Camera Speed (2 à 100) lit core_camera.getSpeed() et écrit avec editor.setCameraSpeed.
- Spawn depuis le menu : core_vehicles.spawnNewVehicle(model.key, {pos = caméra, rot = getCameraQuat()}) puis queueLuaCommand("input.event('parkingbrake', 0, 1)") pour serrer le frein à main.
- Les layouts passent par editor_layoutManager (getWindowLayouts, loadWindowLayout, saveWindowLayout, deleteWindowLayout, resetLayouts) avec vEditor.getEditorName().
- La seconde barre « Toolbar2 » (mode d'édition courant) n'est dessinée que si la préférence ui.general.singleLineToolbar est fausse ; onEditorGuiEditModeToolbar est alors diffusé aux extensions.
- Bug mineur : le code teste une variable noDisplay jamais définie (toujours nil) avant le goto safeFinish.
- Dans onEditorGuiToolBar, le commentaire indique que la fenêtre de la barre (toolName 'vehicleEditor') n'est pas restaurée avec les layouts Static/Live, donc elle est réaffichée de force.

**Dépendances (chargées avant) :** `core_environment`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_veToolbar.onEditorGuiToolBar()` | Hook de l'éditeur appelé quand la barre d'outils principale doit être dessinée. Dessine la fenêtre « veToolbar » avec les onglets Static/Live, les menus et les fenêtres de layout, puis éventuellement la barre du mode d'édition courant. Sans effet si l'éditeur de véhicule n'est pas actif. *(interne)* *(hook)* | 262 |
| `editor_vehicleEditor_veToolbar.onEditorInitialized()` | Hook de l'éditeur appelé à l'initialisation : construit la liste triée des véhicules de type Car ou Truck (core_vehicles.getVehicleList()), enregistre la fenêtre veToolbar (800x40, outil 'vehicleEditor') et l'affiche. *(interne)* *(hook)* | 353 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | {'core_environment'} : extension chargée avant celle-ci. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorGuiEditModeToolbar`

## Appels vers le moteur (C++)

- `core_environment.` `getTimeOfDay`, `setTimeOfDay`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/veToolbar.lua`.*
