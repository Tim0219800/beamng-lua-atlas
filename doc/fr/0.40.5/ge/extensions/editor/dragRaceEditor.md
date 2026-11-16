# `editor_dragRaceEditor`

*Fichier : `lua/ge/extensions/editor/dragRaceEditor.lua` · VM : Game Engine (GE) · 286 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dragRaceEditor` : `extensions.load("editor_dragRaceEditor")`, puis la globale `editor_dragRaceEditor`

Fenêtre principale de l'éditeur de drag race (menu Gameplay > Drag Race Editor). Elle assemble les sous-modules dragRaceEditor/* : liste des strips et des fichiers de réglages (dragSettings) à gauche, détails du strip ou des réglages sélectionnés à droite. Elle enregistre aussi le mode d'édition « Edit Drag Zone » pour éditer les zones (strip ou voie) dans la vue 3D. Au premier affichage dans un niveau, elle charge tous les strips et réglages.

## Remarques

- Le menu File propose Save All (sauve seulement les éléments marqués _dirty), Clear All (retire de la liste les éléments non sauvegardés) et Refresh Editor (recharge tout depuis le disque).
- Dans le mode Edit Drag Zone : Maj+clic gauche ajoute un sommet, Alt+clic insère un sommet entre deux, Ctrl+clic sélectionne plusieurs sommets.
- M.selectStrip est une référence à strips.selectStrip prise au chargement du module.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dragRaceEditor.onDeserialized(data)` | Hook appelé après rechargement : restaure l'état renvoyé par onSerialize (valeurs par défaut -1 pour les index). *(interne)* *(hook)* | 212 |
| `editor_dragRaceEditor.onEditorGui()` | Hook appelé à chaque frame par l'éditeur : synchronise l'éditeur de zone, dessine la fenêtre (menu, listes, détails) et l'aperçu 3D des strips. Charge les strips et réglages une seule fois si un niveau est chargé. *(interne)* *(hook)* | 228 |
| `editor_dragRaceEditor.onEditorInitialized()` | Hook de l'éditeur : enregistre la fenêtre (1800x900), l'entrée de menu, crée les données drag vides si besoin et déclare le mode d'édition editor.editModes.dragZoneEditMode. *(interne)* *(hook)* | 178 |
| `editor_dragRaceEditor.onSerialize()` | Hook appelé avant un rechargement des extensions Lua : renvoie le dossier/nom de fichier courant, les données drag, l'indicateur de modifications non sauvées et les index de strip/réglage sélectionnés. *(interne)* *(hook)* | 201 |
| `editor_dragRaceEditor.show()` | Vide la sélection d'objets de l'éditeur et affiche la fenêtre « Drag Race Editor ». | 223 |

### Détail des paramètres

#### `editor_dragRaceEditor.onDeserialized(data)`

Hook appelé après rechargement : restaure l'état renvoyé par onSerialize (valeurs par défaut -1 pour les index).

- `data` (*table|nil*) : Table produite par onSerialize.

#### `editor_dragRaceEditor.onSerialize()`

Hook appelé avant un rechargement des extensions Lua : renvoie le dossier/nom de fichier courant, les données drag, l'indicateur de modifications non sauvées et les index de strip/réglage sélectionnés.

- **renvoie** : table currentFileDir, currentFileName, dragRaceData, hasUnsavedChanges, selectedStripIndex, selectedSettingsIndex

## Champs

| Champ | Type | Description |
|---|---|---|
| `selectStrip` | function | Alias de strips.selectStrip (sélectionne un strip par index dans l'éditeur). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dragRaceEditor.lua`.*
