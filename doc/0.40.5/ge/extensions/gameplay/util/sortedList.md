# `gameplay_util_sortedList`

*Fichier : `lua/ge/extensions/gameplay/util/sortedList.lua` · VM : Game Engine (GE) · 113 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/util/sortedList")` (fichier sous extensions/ mais pas une extension classique)

Liste d'objets ordonnée par `sortOrder`, avec index par id (objects) et par nom (byName). Elle fabrique les objets via un constructeur fourni, gère le tri, le déplacement, la sérialisation et le dessin de debug. Le module renvoie un constructeur de liste ; il sert aux collections de l'éditeur de gameplay (sites, zones, etc.).

## Exemple

```lua
local liste = require("gameplay/util/sortedList")("zones", parent, function(parent, name, forceId) return maClasse(parent, name, forceId) end)
local obj = liste:create("zone1")
liste:buildNamesDir()
```

## Remarques

- Les objets créés doivent avoir id, name, sortOrder, drawDebug(), onSerialize() et onDeserialized().
- objects a une métatable : lire un id inexistant renvoie {name = "Missing!", missing = true, id = -1} au lieu de nil.
- byName n'est mis à jour que par buildNamesDir() ; en cas de doublon de nom, le premier objet trié gagne.
- create() force obj.isProcedural = false ; seuls les objets non procéduraux sont sérialisés.
- Dans onDeserialized, les anciens ids sont enregistrés dans oldIdMap[oldId] = nouvel id.
- Les hooks postClear, postRemove et postCreate valent nop par défaut et peuvent être remplacés sur l'instance.

## Classe `C`

Liste ordonnée. Champs : name, parent, objectConstructor, objects (id -> objet), sorted (tableau trié), byName.

Le module renvoie un constructeur : `local obj = require("gameplay_util_sortedList")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:buildNamesDir()` | Reconstruit l'index byName. | 74 |
| `C:clear()` | Vide la liste (objects, sorted, byName) puis appelle postClear. | 22 |
| `C:create(name, forceId, skipSort)` | Crée un élément via objectConstructor, l'enregistre et retrie (sauf skipSort), puis appelle postCreate. | 32 |
| `C:drawDebug(drawMode)` | Appelle drawDebug(drawMode) sur chaque élément. | 83 |
| `C:init(name, parent, objectConstructor)` | Crée la liste (vide). | 10 |
| `C:move(id, dir)` | Échange la position d'un élément avec son voisin dans la direction donnée. | 63 |
| `C:onDeserialized(data, oldIdMap)` | Vide la liste et recrée les éléments depuis les données. | 98 |
| `C:onSerialize(parent)` | Renvoie la liste des éléments non procéduraux sérialisés, dans l'ordre. | 89 |
| `C:remove(obj)` | Retire un élément (objet ou id), retrie puis appelle postRemove. | 43 |
| `C:sort()` | Reconstruit sorted selon sortOrder et renumérote sortOrder de 1 à N. | 52 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/util/sortedList.lua`.*
