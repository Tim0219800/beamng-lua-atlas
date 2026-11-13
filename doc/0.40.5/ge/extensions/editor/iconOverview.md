# `editor_iconOverview`

*Fichier : `lua/ge/extensions/editor/iconOverview.lua` · VM : Game Engine (GE) · 140 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_iconOverview` : `extensions.load("editor_iconOverview")`, puis la globale `editor_iconOverview`

Fenêtre d'éditeur « Available Icons » (menu Window > Debug) qui liste toutes les icônes de editor.icons dans une grille filtrable, avec infobulle du nom. Un clic sur une icône copie son nom dans le presse-papiers. Le menu de la fenêtre permet de recréer l'atlas d'icônes (editor.createIconAtlas). drawContent est réutilisable par d'autres outils pour proposer un sélecteur d'icône.

## Exemple

```lua
extensions.load('editor_iconOverview')
editor_iconOverview.drawContent(function(iconName) print(iconName) end) -- dans une fenêtre ImGui d'éditeur
```

## Remarques

- La liste des icônes (tableKeys(editor.icons), triée) est calculée une seule fois dans onEditorInitialized, ou à nouveau après « Re-create icon atlas ».
- drawContent utilise les variables locales icons et style initialisées par onEditorInitialized : l'appeler avant l'initialisation de l'éditeur provoquerait une erreur.
- Les icônes sont dessinées en 32x32 multiplié par imgui.uiscale ; la grille utilise un ImGuiListClipper pour ne dessiner que les lignes visibles.
- Le paramètre editEnded passé à uiInputSearchTextFilter est une globale non définie (donc nil) dans ce fichier.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_iconOverview.drawContent(selectedFun)` | Dessine le champ de recherche et la grille d'icônes filtrée dans la fenêtre ImGui courante. Appelle selectedFun(nomIcone) quand l'utilisateur clique sur une icône. | 40 |
| `editor_iconOverview.onEditorActivated()` | Hook appelé à l'activation de l'éditeur ; vide dans ce fichier. *(interne)* *(hook)* | 116 |
| `editor_iconOverview.onEditorGui()` | Appelé à chaque frame par l'éditeur ; affiche la fenêtre « Available Icons » (menu + drawContent avec copie dans le presse-papiers). *(interne)* *(hook)* | 32 |
| `editor_iconOverview.onEditorInitialized()` | Appelé à l'initialisation de l'éditeur ; construit la liste triée des icônes, enregistre la fenêtre (600x600) et ajoute le menu « Available Icons » dans le groupe Debug. *(interne)* *(hook)* | 123 |
| `editor_iconOverview.onExtensionLoaded()` | Hook appelé au chargement de l'extension ; vide dans ce fichier. *(interne)* *(hook)* | 131 |
| `editor_iconOverview.open()` | Affiche la fenêtre « iconOverview » (editor.showWindow). Même fonction que l'entrée de menu. | 119 |

### Détail des paramètres

#### `editor_iconOverview.drawContent(selectedFun)`

Dessine le champ de recherche et la grille d'icônes filtrée dans la fenêtre ImGui courante. Appelle selectedFun(nomIcone) quand l'utilisateur clique sur une icône.

- `selectedFun` (*function|nil*) : Callback recevant le nom de l'icône cliquée (string). Par défaut nop.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/iconOverview.lua`.*
