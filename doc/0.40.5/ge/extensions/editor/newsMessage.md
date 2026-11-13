# `editor_newsMessage`

*Fichier : `lua/ge/extensions/editor/newsMessage.lua` · VM : Game Engine (GE) · 62 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_newsMessage` : `extensions.load("editor_newsMessage")`, puis la globale `editor_newsMessage`

Extension d'éditeur qui affiche une fenêtre modale « World Editor News » avec les notes de version importantes, une seule fois par version de message (EditorNewsMessageVersion = 5), avec des liens vers le support et le forum BeamNG. Elle mémorise l'affichage dans deux préférences cachées (newsMessage.general.newsMessageShown et newsMessageVersion).

## Remarques

- Dans 0.40.5, newsText est vide : onEditorGui retourne tout de suite et la fenêtre ne s'affiche jamais.
- Pour que le message s'affiche de nouveau, il faut augmenter EditorNewsMessageVersion et remplir newsText.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_newsMessage.onEditorGui()` | Hook d'éditeur appelé à chaque frame : ouvre la fenêtre modale si le message n'a pas encore été vu pour cette version, puis la dessine (texte, liens, bouton Close). *(interne)* *(hook)* | 13 |
| `editor_newsMessage.onEditorInitialized()` | Hook appelé à l'initialisation de l'éditeur : enregistre la fenêtre modale « newsModalDlg ». *(interne)* *(hook)* | 54 |
| `editor_newsMessage.onEditorRegisterPreferences(prefsRegistry)` | Hook d'enregistrement des préférences : crée la catégorie newsMessage avec les préférences cachées newsMessageShown (bool) et newsMessageVersion (int). *(interne)* *(hook)* | 43 |

### Détail des paramètres

#### `editor_newsMessage.onEditorRegisterPreferences(prefsRegistry)`

Hook d'enregistrement des préférences : crée la catégorie newsMessage avec les préférences cachées newsMessageShown (bool) et newsMessageVersion (int).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/newsMessage.lua`.*
