# `editor_shortcutLegend`

*Fichier : `lua/ge/extensions/editor/shortcutLegend.lua` · VM : Game Engine (GE) · 175 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_shortcutLegend` : `extensions.load("editor_shortcutLegend")`, puis la globale `editor_shortcutLegend`

Fenêtre de l'éditeur de monde (sans barre de titre) qui affiche une légende des raccourcis du mode d'édition actif. Elle lit soit editor.editMode.getLegendCurrentActionNames(), soit les actions de l'actionMap du mode (bindings clavier et souris de core_input_bindings), plus editor.editMode.auxShortcuts, puis les trie et les affiche en ligne. Un moddeur d'outil d'éditeur remplit auxShortcuts ou getLegendCurrentActionNames pour que ses raccourcis apparaissent.

## Remarques

- auxShortcuts est une table {drapeau editor.AuxControl_xxx ou chaîne = titre} ; les drapeaux numériques sont combinés en texte (ex. 'Ctrl + LMB').
- Le titre passe par _tr() pour la traduction.
- La liste est reconstruite uniquement après un changement de mode d'édition (onEditorEditModeChanged).
- La touche 'zaxis' est affichée sous le nom 'MouseWheel'.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_shortcutLegend.onEditorEditModeChanged(oldEditMode, newEditMode)` | Hook appelé quand le mode d'édition change : demande la reconstruction de la liste des raccourcis. *(interne)* *(hook)* | 165 |
| `editor_shortcutLegend.onEditorGui()` | Hook appelé à chaque frame de l'UI de l'éditeur : reconstruit la liste des raccourcis si nécessaire et dessine la légende centrée avec des pastilles pour les touches. *(interne)* *(hook)* | 22 |
| `editor_shortcutLegend.onEditorInitialized()` | Hook appelé à l'initialisation de l'éditeur : remplit la table des noms de modificateurs (Ctrl, Shift, Alt, LMB, MMB, RMB, MouseWheel, Copy, Paste, etc.), enregistre et affiche la fenêtre shortcutLegend. *(interne)* *(hook)* | 140 |
| `editor_shortcutLegend.onExtensionLoaded()` | Hook de chargement de l'extension ; vide. *(interne)* *(hook)* | 137 |

### Détail des paramètres

#### `editor_shortcutLegend.onEditorEditModeChanged(oldEditMode, newEditMode)`

Hook appelé quand le mode d'édition change : demande la reconstruction de la liste des raccourcis.

- `oldEditMode` (*table*) : Ancien mode d'édition.
- `newEditMode` (*table*) : Nouveau mode d'édition.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/shortcutLegend.lua`.*
