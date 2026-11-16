# `career_modules_permissions`

*Fichier : `lua/ge/extensions/career/modules/permissions.lua` · VM : Game Engine (GE) · 69 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_permissions` : `extensions.load("career_modules_permissions")`, puis la globale `career_modules_permissions`

Système de permissions de la carrière. Une action (tag comme vehicleModification, vehicleSelling, interactRefuel, recoveryTowToRoad…) peut être allowed, warning, forbidden ou hidden. Le module ne décide rien lui-même : il émet le hook onCheckPermission(tags, permissions, additionalData) et garde la réponse la plus restrictive donnée par les extensions (par ex. une activité en cours).

## Exemple

```lua
local st = career_modules_permissions.getStatusForTag({"vehicleSelling"})
if st.permission == "forbidden" then ... end
```

## Remarques

- Priorité : allowed < warning < forbidden < hidden.
- Le champ allow du résultat vaut true seulement si la permission retenue est "warning" ; si aucune extension ne répond, le résultat est {permission = "allowed", allow = true}. Pour "allowed" renvoyé par une extension, allow vaut donc false (incohérence apparente du code).
- Les extensions répondent en insérant {permission, label, penalty} dans la table permissions du hook.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_permissions.getStatusForTag(tags, additionalData)` | Interroge les extensions via le hook onCheckPermission et renvoie la permission la plus restrictive pour les tags donnés. | 41 |

### Détail des paramètres

#### `career_modules_permissions.getStatusForTag(tags, additionalData)`

Interroge les extensions via le hook onCheckPermission et renvoie la permission la plus restrictive pour les tags donnés.

- `tags` (*string|string[]*) : Un tag ou une liste de tags (une chaîne est encapsulée dans une table).
- `additionalData` (*any*) : Données transmises telles quelles au hook.
- **renvoie** : {allow: boolean, permission: string, label: any, type: string, penalty: any} Statut retenu ; type vaut "text".

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onCheckPermission` — écouté par 2 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/permissions.lua`.*
