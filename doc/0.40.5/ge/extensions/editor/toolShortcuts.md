# `editor_toolShortcuts`

*Fichier : `lua/ge/extensions/editor/toolShortcuts.lua` · VM : Game Engine (GE) · 182 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolShortcuts` : `extensions.load("editor_toolShortcuts")`, puis la globale `editor_toolShortcuts`

Fenêtre « Edit Mode Shortcuts » de l'éditeur : permet d'assigner un mode d'édition (editor.editModes) à chacune des touches F2 à F10 (9 emplacements). Les assignations sont lues/écrites dans settings/editor/editModeShortcuts.json. Sans fichier, les défauts sont objectSelect, createObject puis les modes avec icône triés par nom de clé. L'extension crée aussi editor.openTool1 … editor.openTool9 qui activent le mode assigné.

## Remarques

- Le fichier JSON stocke les clés "F2" à "F10" ; une chaîne vide signifie « None ».
- Seuls les modes ayant une icône (mode.icon) sont assignables.
- La première modification crée les assignations personnalisées à partir des défauts.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolShortcuts.onEditorGui()` | Hook de rendu de l'éditeur : dessine, pour chaque touche F2-F10, l'icône du mode, un combo de recherche pour choisir le mode, et le bouton « Reset to Defaults ». *(interne)* *(hook)* | 112 |
| `editor_toolShortcuts.onEditorInitialized()` | Hook d'initialisation de l'éditeur : charge les assignations, enregistre la fenêtre (380x380) et définit editor.openTool1…openTool9. *(interne)* *(hook)* | 167 |
| `editor_toolShortcuts.openWindow()` | Affiche la fenêtre « Edit Mode Shortcuts » (editor.showWindow). | 108 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolShortcuts.lua`.*
