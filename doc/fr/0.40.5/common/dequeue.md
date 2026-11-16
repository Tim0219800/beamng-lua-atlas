# `dequeue`

*Fichier : `lua/common/dequeue.lua` · VM : Commun (GE + véhicule) · 224 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("dequeue")`

File à double extrémité (deque) : on peut ajouter et retirer des éléments au début comme à la fin. Bibliothèque de Pierre Chapuis (licence MIT en en-tête). Utile pour des historiques ou tampons glissants. L'objet est une table indexée par des entiers entre head+1 et tail.

## Exemple

```lua
local dq = require('dequeue').new()
dq:push_right(1); dq:push_right(2); dq:push_left(0)
print(dq:pop_left(), dq:length())  -- 0  2
```

## Remarques

- Les éléments nil sont interdits par push (assert).
- new(data) réutilise la table fournie comme file (head/tail initialisés à 0 si absents) et marque _serialize = true.
- rotate_* sur une file vide renvoie nil ; remove_left/right ne retirent que la première occurrence trouvée et décalent les éléments.
- push_left/pop_left utilisent des indices <= 0 : la table n'est plus un tableau Lua pur (# n'est pas fiable, utiliser length()).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `dequeue.new(data)` | Crée une deque vide, ou transforme la table fournie en deque. | 157 |

### Détail des paramètres

#### `dequeue.new(data)`

Crée une deque vide, ou transforme la table fournie en deque.

- `data` (*table|nil*) : Table existante à réutiliser (peut contenir head/tail).
- **renvoie** : table Objet deque.

## Classe `deque`

Objet renvoyé par new. Champs : head, tail, _serialize.

| Méthode | Description | Ligne |
|---|---|---|
| `deque:contents()` | Copie le contenu dans un tableau ordonné de 1 à length(). | dyn |
| `deque:is_empty()` | Indique si la file est vide. | dyn |
| `deque:iter_left()` | Itérateur du début vers la fin. | dyn |
| `deque:iter_right()` | Itérateur de la fin vers le début. | dyn |
| `deque:length()` | Nombre d'éléments. | dyn |
| `deque:peek_left()` | Renvoie le premier élément sans le retirer. | dyn |
| `deque:peek_right()` | Renvoie le dernier élément sans le retirer. | dyn |
| `deque:pop_left()` | Retire et renvoie le premier élément. | dyn |
| `deque:pop_right()` | Retire et renvoie le dernier élément. | dyn |
| `deque:push_left(x)` | Ajoute x au début. | dyn |
| `deque:push_right(x)` | Ajoute x à la fin. | dyn |
| `deque:remove_left(x)` | Supprime la première occurrence de x en cherchant depuis le début. | dyn |
| `deque:remove_right(x)` | Supprime la première occurrence de x en cherchant depuis la fin. | dyn |
| `deque:reset()` | Remet head et tail à 0 (les anciens éléments ne sont pas effacés de la table). | dyn |
| `deque:rotate_left(n)` | Fait passer n éléments du début vers la fin. | dyn |
| `deque:rotate_right(n)` | Fait passer n éléments de la fin vers le début. | dyn |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/dequeue.lua`.*
