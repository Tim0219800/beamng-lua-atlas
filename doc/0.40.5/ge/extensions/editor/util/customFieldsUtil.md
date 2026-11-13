# `editor_util_customFieldsUtil`

*Fichier : `lua/ge/extensions/editor/util/customFieldsUtil.lua` · VM : Game Engine (GE) · 200 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/util/customFieldsUtil")` (fichier sous extensions/ mais pas une extension classique)

Aide d'éditeur : widget imgui pour éditer des tags et des champs personnalisés (nom, valeur, type) d'un objet de type gameplay/util/customFields. Le module renvoie un constructeur : require('/lua/ge/extensions/editor/util/customFieldsUtil')(name, fields, options). Utile à un moddeur d'outil d'éditeur qui veut afficher la liste de tags et la table de champs, avec ajout et suppression.

## Exemple

```lua
local cf = require('/lua/ge/extensions/editor/util/customFieldsUtil')('monOutil', monObjetCustomFields, {presetTags = {'a','b'}})
-- à chaque frame, dans une fenêtre imgui :
cf:widget()
```

## Remarques

- Les options ne remplacent que les attributs déjà existants (if self[k]) : enableTags, enableFields, tagsText, fieldsText, presetTags, allowedTypes.
- Types autorisés par défaut : string et number (le code mentionne aussi boolean, vec3, quat).
- Si fields est nil, un nouvel objet gameplay/util/customFields est créé.

## Classe `C`

Instance du widget de champs personnalisés.

Le module renvoie un constructeur : `local obj = require("editor_util_customFieldsUtil")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:addTag()` | Ajoute le tag saisi aux fields (ignoré si vide) puis vide la zone de saisie. | 168 |
| `C:drawCustomFields()` | Dessine la table des champs (Nom, Valeur, Type, bouton Remove) et la ligne d'ajout avec choix du type et bouton Add. | 38 |
| `C:drawTags()` | Dessine la liste des tags (clic : popup « Remove Tag »), la saisie d'un tag, le combo des presetTags et le bouton Add Tag. | 105 |
| `C:init(name, fields, options)` | Initialise le widget : nom unique (utilisé dans les identifiants imgui), textes, drapeaux enableTags/enableFields, liste presetTags, types autorisés ; applique les options puis setFields et refresh. | 9 |
| `C:onActivate()` | Callback pour le mode d'édition ; vide. | 188 |
| `C:onDeactivate()` | Callback pour le mode d'édition ; vide. | 191 |
| `C:refresh()` | Réinitialise les zones de saisie (nom, valeur, tag) et le type courant à « string ». | 27 |
| `C:setFields(fields)` | Définit l'objet customFields édité (en crée un vide si nil). | 34 |
| `C:widget()` | Dessine les tags puis les champs, selon enableTags et enableFields. | 178 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/util/customFieldsUtil.lua`.*
