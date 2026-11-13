# `gameplay_util_customFields`

*Fichier : `lua/ge/extensions/gameplay/util/customFields.lua` · VM : Game Engine (GE) · 174 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/util/customFields")` (fichier sous extensions/ mais pas une extension classique)

Petit conteneur de « champs personnalisés » typés (string, number, boolean, vec3, quat) et d'étiquettes (tags) triées, avec sérialisation. Le module renvoie un constructeur : chaque appel crée un objet indépendant. Utile pour attacher des données libres à un objet de gameplay tout en les sauvegardant en JSON.

## Exemple

```lua
local cf = require("gameplay/util/customFields")()
cf:add("difficulte", "number", 3)
cf:addTag("ville")
local valeur, type, existe = cf:get("difficulte")
```

## Remarques

- Types gérés à la désérialisation : string, number, boolean, vec3, quat ; un champ d'un autre type est ignoré.
- validate() convertit les chaînes : '', '0', 0 et 'false' donnent false pour un booléen ; vec3 et quat acceptent 'x,y,z' / 'x,y,z,w' (séparés par des virgules), sinon une valeur nulle.
- add(), set(), remove() et has() testent `self.values[name]` : un champ booléen valant false est donc considéré comme inexistant (set() refuse de le modifier, add() accepte de le ré-ajouter et duplique alors son nom dans names).
- Un champ spécial nommé « tags » déclenche updateTags() à l'ajout ou à la modification.
- get() renvoie (valeur, type, true) ou (nil, nil, false).
- addTag() renvoie false si le tag existe déjà mais ne renvoie rien (nil) en cas de succès.

## Classe `C`

Objet renvoyé par le constructeur du module. Champs : names (ordre des champs), types, values, tags (ensemble) et sortedTags (liste triée).

Le module renvoie un constructeur : `local obj = require("gameplay_util_customFields")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:add(name, datatype, value)` | Ajoute un champ typé ; la valeur est validée selon le type. | 137 |
| `C:addTag(tag)` | Ajoute un tag et retrie la liste. | 103 |
| `C:get(name)` | Lit un champ. | 152 |
| `C:has(name)` | Teste l'existence d'un champ. | 151 |
| `C:init()` | Initialise les tables names, types, values, tags et sortedTags. | 10 |
| `C:onDeserialized(data)` | Recrée tous les champs et tags depuis les données sérialisées (efface l'état existant). | 37 |
| `C:onSerialize()` | Renvoie {names, types, values, tags} ; vec3 et quat sont convertis en tables. | 18 |
| `C:remove(name)` | Supprime un champ. | 125 |
| `C:removeTag(tag)` | Retire un tag, désigné par son nom ou son indice dans sortedTags. | 112 |
| `C:set(name, value)` | Change la valeur d'un champ existant (sans validation de type). | 91 |
| `C:updateTags()` | Reconstruit sortedTags (tags triés alphabétiquement) à partir de tags. | 160 |
| `C:validate(value, datatype)` | Convertit une valeur vers le type demandé (string, number, boolean, vec3, quat). | 62 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/util/customFields.lua`.*
