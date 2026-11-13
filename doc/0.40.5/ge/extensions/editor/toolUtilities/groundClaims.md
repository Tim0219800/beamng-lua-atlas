# `editor_toolUtilities_groundClaims`

*Fichier : `lua/ge/extensions/editor/toolUtilities/groundClaims.lua` · VM : Game Engine (GE) · 162 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_groundClaims` : `extensions.load("editor_toolUtilities_groundClaims")`, puis la globale `editor_toolUtilities_groundClaims`

Registre partagé des « revendications de terrain » entre les outils de l'éditeur qui posent des surfaces sur le terrain. Chaque outil publie, sous un nom de propriétaire (owner), les anneaux (contours) qu'il occupe et la marge à respecter ; les autres outils lisent ces anneaux pour ne pas empiéter dessus. Un compteur de révision et des empreintes (fp) permettent de détecter qu'un autre outil a bougé son terrain.

## Exemple

```lua
local claims = require('editor/toolUtilities/groundClaims')
claims.publish('monOutil', {ring1, ring2}, 0.5)
local obs, roads = claims.obstructions(monRing, 'monOutil', roadRings, 0.1)
```

## Remarques

- Les anneaux sont des listes de points {x, y} (au moins 3). publish ne copie pas les anneaux : l'appelant doit republier s'il les modifie.
- publish ignore un propriétaire nil et ne fait rien si l'empreinte (nombre de points et coordonnées, marge) n'a pas changé ; un publish sans anneau valide efface la revendication.
- Un anneau étiqueté 'buried' est un terrain tenu au-dessus de quelque chose (couverture de tunnel) : on peut y planter.
- L'état est local au module (table claims) : il n'est pas sauvegardé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_groundClaims.clear(owner)` | Efface la revendication d'un propriétaire (publish sans anneau). | 71 |
| `editor_toolUtilities_groundClaims.extents(owner)` | Pour chaque autre propriétaire, son empreinte fp et la boîte {x0, y0, x1, y1} que couvre son terrain, marge comprise. Sert à savoir OÙ le terrain d'un autre a bougé. | 63 |
| `editor_toolUtilities_groundClaims.keepOut(out, owner)` | Comme others, mais chaque anneau est agrandi de la marge demandée par son propriétaire (geom.outsetClosedRing2D) : ce qu'il faut soustraire à son propre terrain. Une revendication sans marge est renvoyée telle quelle. | 92 |
| `editor_toolUtilities_groundClaims.obstructions(ring, owner, roadRings, roadMargin, pad, skip)` | Tout ce qui est proche de ring et que son propriétaire ne doit pas recouvrir : les anneaux de route fournis agrandis de roadMargin, plus la revendication de chaque autre outil agrandie de sa marge. Seuls les éléments dont la boîte touche celle de ring sont retenus. | 107 |
| `editor_toolUtilities_groundClaims.others(out, owner, flushOnly, tags)` | Ajoute à out tous les anneaux des autres propriétaires (sans la marge). L'exclusion évite à un outil de se soustraire son propre terrain. | 77 |
| `editor_toolUtilities_groundClaims.publish(owner, rings, margin, tags)` | Remplace tout ce que ce propriétaire détient par les anneaux donnés, avec la marge que les autres doivent respecter. Incrémente la révision seulement si le contenu a changé. | 32 |
| `editor_toolUtilities_groundClaims.sig()` | Compteur de révision, incrémenté à chaque publication qui change quelque chose. Permet à un outil de remarquer que le terrain d'un autre a bougé sans le connaître directement. | 150 |

### Détail des paramètres

#### `editor_toolUtilities_groundClaims.clear(owner)`

Efface la revendication d'un propriétaire (publish sans anneau).

- `owner` (*any*) : Nom du propriétaire.

#### `editor_toolUtilities_groundClaims.extents(owner)`

Pour chaque autre propriétaire, son empreinte fp et la boîte {x0, y0, x1, y1} que couvre son terrain, marge comprise. Sert à savoir OÙ le terrain d'un autre a bougé.

- `owner` (*any*) : Propriétaire exclu du résultat.
- **renvoie** : table<any, table> owner -> { fp, box }.

#### `editor_toolUtilities_groundClaims.keepOut(out, owner)`

Comme others, mais chaque anneau est agrandi de la marge demandée par son propriétaire (geom.outsetClosedRing2D) : ce qu'il faut soustraire à son propre terrain. Une revendication sans marge est renvoyée telle quelle.

- `out` (*table|nil*) : Liste de sortie.
- `owner` (*any*) : Propriétaire exclu.
- **renvoie** : table La liste out.

#### `editor_toolUtilities_groundClaims.obstructions(ring, owner, roadRings, roadMargin, pad, skip)`

Tout ce qui est proche de ring et que son propriétaire ne doit pas recouvrir : les anneaux de route fournis agrandis de roadMargin, plus la revendication de chaque autre outil agrandie de sa marge. Seuls les éléments dont la boîte touche celle de ring sont retenus.

- `ring` (*table*) : Contour testé (au moins 3 points) ; sinon renvoie deux tables vides.
- `owner` (*any*) : Propriétaire exclu.
- `roadRings` (*table[]|nil*) : Anneaux de route fournis par l'appelant.
- `roadMargin` (*number|nil*) : Marge appliquée aux routes (m).
- `pad` (*number|nil*) : Élargit la boîte qui définit « proche ».
- `skip` (*any|nil*) : Ignore les anneaux portant cette étiquette (un site en édition ne se gêne pas lui-même).
- **renvoie** : table[] Anneaux obstacles.
- **renvoie** : table<table, boolean> Ensemble des anneaux de sortie qui sont des routes.

#### `editor_toolUtilities_groundClaims.others(out, owner, flushOnly, tags)`

Ajoute à out tous les anneaux des autres propriétaires (sans la marge). L'exclusion évite à un outil de se soustraire son propre terrain.

- `out` (*table|nil*) : Liste de sortie (créée si nil).
- `owner` (*any*) : Propriétaire exclu.
- `flushOnly` (*boolean|nil*) : Ne garde que les revendications sans marge (terrain avec lequel on se joint à ras).
- `tags` (*table|nil*) : Si fourni, reçoit l'étiquette de chaque anneau (false si aucune) à l'indice de l'anneau dans out.
- **renvoie** : table La liste out.

#### `editor_toolUtilities_groundClaims.publish(owner, rings, margin, tags)`

Remplace tout ce que ce propriétaire détient par les anneaux donnés, avec la marge que les autres doivent respecter. Incrémente la révision seulement si le contenu a changé.

- `owner` (*any*) : Nom du propriétaire (clé de la table) ; nil = sans effet.
- `rings` (*table[]|nil*) : Anneaux de points {x, y} ; ceux de moins de 3 points sont ignorés.
- `margin` (*number|nil*) : Marge (m) que les autres outils laissent autour ; défaut 0 (jonction affleurante).
- `tags` (*table|nil*) : Étiquette par anneau (même indice que rings), pour qu'un outil qui édite cette chose ignore ses propres copies (voir obstructions).

#### `editor_toolUtilities_groundClaims.sig()`

Compteur de révision, incrémenté à chaque publication qui change quelque chose. Permet à un outil de remarquer que le terrain d'un autre a bougé sans le connaître directement.

- **renvoie** : integer Révision courante.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/groundClaims.lua`.*
