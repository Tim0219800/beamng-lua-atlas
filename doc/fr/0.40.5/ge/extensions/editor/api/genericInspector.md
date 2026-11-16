# `editor_api_genericInspector`

*Fichier : `lua/ge/extensions/editor/api/genericInspector.lua` · VM : Game Engine (GE) · 254 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/api/genericInspector")` (fichier sous extensions/ mais pas une extension classique)

Inspecteur ImGui générique de l'éditeur : affiche une liste de champs (nom, type, valeur, groupe, id) sous forme de groupes repliables avec filtre de recherche, tableaux dépliables et éditeurs de valeur (via editor/api/valueInspector). Un moddeur d'outil d'éditeur l'utilise pour exposer des champs arbitraires ; chaque modification est renvoyée à la fonction `fieldSetter` fournie à `initialize`. Le module renvoie un constructeur sans argument.

## Exemple

```lua
local gi = require("editor/api/genericInspector")()
gi:initialize(function(fieldName, fieldValue, arrayIndex, customData, editEnded) end)
-- dans le rendu de la fenêtre :
gi:inspectorGui(fields)
```

## Remarques

- Le constructeur n'appelle PAS `init`/`initialize` : il faut appeler `initialize(fieldSetter)` avant tout usage, sinon valueInspector, fieldNameFilter etc. sont nil.
- Les champs sont triés par `id` (ordre de déclaration C++), regroupés par `groupName` (le dernier nom de groupe rencontré est propagé, défaut "General"), et les champs avec `hideInInspector` sont ignorés.
- Dans `inspectorGuiWithFieldCallback`, le test `if #fields then` est toujours vrai en Lua (0 est truthy) : `inspectorGui` est appelé même sans champ.
- Dans `inspectorGuiWithFieldCallback`, la boucle lit au plus 1000 champs ; un avertissement est loggué si le 1000e existe (il utilise self.valueInspector.inspectorName, donc initialize doit avoir été appelé).

## Classe `C`

Objet inspecteur. Après `initialize` il contient valueInspector, fieldSetter, fieldNameFilter (ImGuiTextFilter), inspectorFieldModifiers, etc.

Le module renvoie un constructeur : `local obj = require("editor_api_genericInspector")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:initialize(fieldSetter)` | Prépare l'inspecteur : crée un valueInspector (nom unique "genericInspectorN"), le filtre de recherche et les tampons ImGui, et branche `fieldSetter` comme callback de modification de valeur. | 214 |
| `C:inspectorGui(fields)` | Dessine l'inspecteur pour la liste de champs donnée : barre de recherche, groupes, champs simples, tableaux de valeurs et tableaux de champs (type beginArray). Affiche "<No search matches>" si le filtre ne retient rien. À appeler à chaque frame dans la fenêtre ImGui. | 37 |
| `C:inspectorGuiWithFieldCallback(fieldCallback)` | Construit la liste de champs en appelant `fieldCallback(i)` pour i = 1, 2, … jusqu'à un retour nil (maximum 1000), puis appelle `inspectorGui`. | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/genericInspector.lua`.*
