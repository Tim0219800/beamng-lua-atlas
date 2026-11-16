# `editor_windows`

*Fichier : `lua/ge/extensions/editor/windows.lua` · VM : Game Engine (GE) · 140 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_windows` : `extensions.load("editor_windows")`, puis la globale `editor_windows`

Fenêtre « Windows » de l'éditeur (menu Window > Window Position Reset...). Elle liste toutes les fenêtres enregistrées de l'éditeur (editor.getWindowsState()), triées par titre et filtrables, avec deux boutons par fenêtre : « Move to center » (recentre la fenêtre dans le viewport) et « Highlight » (entoure la fenêtre d'un rectangle orange pendant 3,5 s). Utile quand une fenêtre est perdue hors de l'écran.

## Remarques

- Si la fenêtre « Windows » elle-même sort du viewport, elle est replacée à (40, 40) par rapport au viewport principal.
- Dans onEditorInitialized, le code crée aussi editor.editModes.assetBrowserEditMode = {onToolbar = nil, icon = nil}, ce qui écrase le mode d'édition de l'explorateur d'assets s'il existait déjà (probable copier-coller).
- Le titre de la fenêtre est « Windows » mais le fichier utilise un windowName interne « windows » ; le recentrage utilise getImGuiWindowName(key, data) = titre .. '##' .. clé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_windows.onEditorGui()` | Hook de l'éditeur appelé à chaque frame d'interface. Dessine la fenêtre « Windows » (filtre de recherche et tableau à deux colonnes) puis les rectangles de surbrillance en cours. *(interne)* *(hook)* | 82 |
| `editor_windows.onEditorInitialized()` | Hook de l'éditeur appelé à l'initialisation. Enregistre la fenêtre (taille 800x500) et ajoute l'entrée de menu « Window Position Reset... ». *(interne)* *(hook)* | 126 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/windows.lua`.*
