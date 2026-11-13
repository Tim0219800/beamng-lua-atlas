# `ui_tutorialHighlight`

*Fichier : `lua/ge/extensions/ui/tutorialHighlight.lua` · VM : Game Engine (GE) · 112 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_tutorialHighlight` : `extensions.load("ui_tutorialHighlight")`, puis la globale `ui_tutorialHighlight`

Gère la liste des éléments d'interface à mettre en surbrillance pendant un tutoriel. Chaque élément est identifié par un id (chaîne) ; l'état (ids dans l'ordre d'apparition, options, révision) est diffusé à l'UI via le flux `tutorialHighlight` (guihooks.triggerStream). Un moddeur ou un script de tutoriel appelle show/hide pour allumer ou éteindre un repère.

## Exemple

```lua
ui_tutorialHighlight.show("btnGarage", {focus = true, scroll = true})
-- plus tard
ui_tutorialHighlight.hide("btnGarage")
```

## Remarques

- Seules les options focus et scroll (si true) sont conservées ; si au moins une est active, un `requestId` égal à la révision courante est ajouté.
- L'extension est en mode de déchargement « manual » (setExtensionUnloadMode dans onInit).
- Chaque show/hide/hideAll effectif incrémente la révision et rediffuse le flux ; show rediffuse même si l'id est déjà actif.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_tutorialHighlight.getState()` | Renvoie la charge utile courante du flux. | 17 |
| `ui_tutorialHighlight.hide(id)` | Retire l'id de la surbrillance et diffuse l'état. | 65 |
| `ui_tutorialHighlight.hideAll()` | Retire toutes les surbrillances et diffuse l'état. | 85 |
| `ui_tutorialHighlight.onInit()` | Hook d'initialisation à la création de l'extension : passe le mode de déchargement en « manual ». *(interne)* *(hook)* | 100 |
| `ui_tutorialHighlight.onUiReady()` | Hook appelé quand l'UI est prête : rediffuse l'état courant. *(interne)* *(hook)* | 96 |
| `ui_tutorialHighlight.show(id, options)` | Active la surbrillance de l'id (ajouté en fin d'ordre s'il est nouveau), enregistre ses options et diffuse l'état. | 44 |

### Détail des paramètres

#### `ui_tutorialHighlight.getState()`

Renvoie la charge utile courante du flux.

- **renvoie** : table { ids = string[], options = table<string, table>, revision = integer }

#### `ui_tutorialHighlight.hide(id)`

Retire l'id de la surbrillance et diffuse l'état.

- `id` (*string*) : Identifiant de l'élément.
- **renvoie** : boolean true si l'id était actif.

#### `ui_tutorialHighlight.hideAll()`

Retire toutes les surbrillances et diffuse l'état.

- **renvoie** : boolean false si rien n'était actif.

#### `ui_tutorialHighlight.show(id, options)`

Active la surbrillance de l'id (ajouté en fin d'ordre s'il est nouveau), enregistre ses options et diffuse l'état.

- `id` (*string*) : Identifiant non vide de l'élément.
- `options` (*table|nil*) : {focus = boolean, scroll = boolean}.
- **renvoie** : boolean true si l'id vient d'être ajouté ; false s'il était déjà actif ou si l'id est invalide.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/tutorialHighlight.lua`.*
