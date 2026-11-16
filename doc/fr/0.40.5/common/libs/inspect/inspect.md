# `libs_inspect_inspect`

*Fichier : `lua/common/libs/inspect/inspect.lua` · VM : Commun (GE + véhicule) · 330 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/inspect/inspect")`

inspect.lua 3.1.0 : bibliothèque tierce (Enrique García Cota, licence MIT) qui transforme n'importe quelle valeur Lua en chaîne lisible : tables triées, indentation, références circulaires repérées par <id>, métatables affichées. Le module est appelable : inspect(t, options). Pratique pour déboguer.

## Exemple

```lua
local inspect = require("libs/inspect/inspect")
print(inspect({1, 2, a = {b = true}}, {depth = 2}))
```

## Remarques

- Options de inspect.inspect : depth (profondeur max, défaut illimitée), newline (défaut "\n"), indent (défaut deux espaces), process (fonction process(item, path) appliquée récursivement avant l'affichage).
- Les fonctions, userdata et threads sont affichés sous la forme <type id>.
- Les champs KEY et METATABLE sont des marqueurs internes utilisés dans process (déduit du code).
- `i` est listé comme globale affectée par l'extracteur automatique ; c'est en pratique une variable de boucle locale du fichier (à vérifier, non essentiel).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_inspect_inspect.inspect(root, options)` | Renvoie une représentation textuelle de root. Peut aussi s'appeler directement : inspect(root, options). | 298 |

### Détail des paramètres

#### `libs_inspect_inspect.inspect(root, options)`

Renvoie une représentation textuelle de root. Peut aussi s'appeler directement : inspect(root, options).

- `root` (*any*) : Valeur à afficher
- `options` (*table|nil*) : {depth, newline, indent, process}
- **renvoie** : string Texte formaté

## Champs

| Champ | Type | Description |
|---|---|---|
| `KEY` | any | Marqueur de clé utilisé dans le chemin passé à options.process. |
| `METATABLE` | any | Marqueur de métatable utilisé dans le chemin passé à options.process. |

## Classe `Inspector`

Objet interne qui accumule le texte dans un tampon pendant le parcours de la valeur.

| Méthode | Description | Ligne |
|---|---|---|
| `Inspector:alreadyVisited(v)` | Indique si la valeur a déjà un identifiant (table déjà rencontrée). | 208 |
| `Inspector:down(f)` | Exécute f un niveau plus profond (incrémente puis décrémente le niveau). | 198 |
| `Inspector:getId(v)` | Renvoie l'identifiant numérique de la valeur, selon son type, en le créant au besoin. | 212 |
| `Inspector:putKey(k)` | Écrit une clé de table : identifiant brut ou [clé] entre crochets. | 223 |
| `Inspector:putTable(t)` | Écrit une table : parties séquentielle et non séquentielle, métatable, limite de profondeur, références répétées. | 230 |
| `Inspector:putValue(v)` | Écrit une valeur selon son type (chaîne échappée, nombre, booléen, table, ou <type id>). | 281 |
| `Inspector:puts(...)` | Ajoute des morceaux de texte au tampon. | 188 |
| `Inspector:tabify()` | Ajoute un saut de ligne suivi de l'indentation du niveau courant. | 204 |

**Globales affectées :** `i`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/inspect/inspect.lua`.*
