# `event`

*Fichier : `lua/common/event.lua` · VM : Commun (GE + véhicule) · 46 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("event")`

Petite classe d'événements (délégués) exposée comme global Event. On crée un objet avec Event.new(), on y abonne des fonctions avec add, et on les déclenche avec call ou en appelant l'objet directement.

## Exemple

```lua
local ev = Event.new()
local function cb(x) print('reçu', x) end
ev:add(cb)
ev(42)      -- ou ev:call(42)
ev:remove(cb)
```

## Remarques

- Les abonnés sont stockés comme clés d'une table : l'ordre d'appel n'est pas garanti et ajouter deux fois la même fonction ne la compte qu'une fois.
- add et remove lèvent error('Wrong parameter type: must be a function') si l'argument n'est pas une fonction.
- Les fonctions sont des champs de la table globale Event (appel conseillé en notation ':').

**Globales affectées :** `Event`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/event.lua`.*
