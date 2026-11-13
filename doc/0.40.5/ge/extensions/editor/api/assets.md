# `editor_api_assets`

*Fichier : `lua/ge/extensions/editor/api/assets.lua` · VM : Game Engine (GE) · 49 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_assets` : `extensions.load("editor_api_assets")`, puis la globale `editor_api_assets`

API de l'éditeur pour le glisser-déposer d'assets (chemins de fichiers sous forme de chaînes) entre fenêtres ImGui. À l'initialisation, ajoute à l'instance de l'éditeur : editor.dragDropAsset (état interne), editor.dragDropSource et editor.dragDropTarget. Une source et une cible se correspondent si elles utilisent le même dragDropId ; la donnée est transportée dans un tampon de 2048 caractères.

## Exemple

```lua
-- source
editor.dragDropSource("MonAsset", "/art/shapes/x.dae", function(str) end)
-- cible
editor.dragDropTarget("MonAsset")
```

## Remarques

- dragDropTarget vérifie par assert que la taille de la charge utile vaut 2048 ; le callback enregistré par la source est appelé avec la chaîne déposée, puis l'état est réinitialisé.
- Dans dragDropSource, le code utilise `im.ArrayChar` et `im.ArraySize` alors que la variable locale s'appelle `imgui` : `im` n'est pas défini dans ce fichier, ce qui provoquerait une erreur si une globale `im` n'existe pas (déduit du code).
- Les deux fonctions sont installées sur l'objet editor, pas sur le module ; seule initialize est exportée par le module.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_assets.initialize(editorInstance)` | Initialise le module : mémorise l'éditeur et y installe dragDropAsset, dragDropSource et dragDropTarget. *(interne)* | 39 |

### Détail des paramètres

#### `editor_api_assets.initialize(editorInstance)`

Initialise le module : mémorise l'éditeur et y installe dragDropAsset, dragDropSource et dragDropTarget.

- `editorInstance` (*table*) : Instance de l'éditeur.

## Classe `editor`

Méthodes ajoutées à l'instance de l'éditeur par ce module.

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.dragDropSource(dragDropId, data, callback)` | À appeler pendant le dessin de l'élément ImGui qui sert de source : si un glissement commence, crée la charge utile (data, tampon de 2048 caractères), mémorise le callback et affiche le texte pendant le glissement. | 13 |
| `editor.dragDropTarget(dragDropId)` | À appeler après l'élément ImGui qui sert de cible : accepte une charge utile du même dragDropId, appelle le callback de la source avec la chaîne reçue puis réinitialise l'état. | 25 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/assets.lua`.*
