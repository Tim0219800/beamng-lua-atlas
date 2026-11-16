# `libs_lustach_src_lustache_context`

*Fichier : `lua/common/libs/lustach/src/lustache/context.lua` · VM : Commun (GE + véhicule) · 67 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/lustach/src/lustache/context")`

Bibliothèque tierce lustache : contexte de rendu Mustache. Un contexte enveloppe la vue (table de données) courante, garde un lien vers le contexte parent (pile d'imbrication des sections) et un cache de résolution de noms. Le renderer s'en sert pour résoudre `{{nom}}`, `{{a.b.c}}` et `{{.}}`.

## Remarques

- Les méthodes s'appellent avec les deux-points sur une instance créée par `Context:new(view, parent)` ; `new` renvoie une table dont la métatable est `context` elle-même.
- Bug mineur : `lookup` teste `string_find(name, ".") > 0` ; le motif "." désigne n'importe quel caractère, donc la condition est toujours vraie pour un nom non vide et le chemin découpé par points est toujours emprunté (le résultat reste correct).
- Les valeurs `false` ou nil ne sont pas mises en cache efficacement (le test `if not value` relance la recherche) et la recherche remonte alors aux contextes parents.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_lustach_src_lustache_context.clear_cache(self)` | Vide le cache de résolution de ce contexte. | 7 |
| `libs_lustach_src_lustache_context.lookup(self, name)` | Résout un nom dans la vue courante puis, à défaut, dans les contextes parents. Gère les chemins à points (`a.b.c`) et le nom `.` (la vue elle-même). Le résultat est mis en cache. | 15 |
| `libs_lustach_src_lustache_context.new(self, view, parent)` | Crée un contexte pour `view` avec un parent optionnel et un cache vide. | 57 |
| `libs_lustach_src_lustache_context.push(self, view)` | Crée un contexte enfant pour `view` dont le parent est le contexte courant (entrée dans une section). | 11 |

### Détail des paramètres

#### `libs_lustach_src_lustache_context.lookup(self, name)`

Résout un nom dans la vue courante puis, à défaut, dans les contextes parents. Gère les chemins à points (`a.b.c`) et le nom `.` (la vue elle-même). Le résultat est mis en cache.

- `self` (*any*) : 
- `name` (*string*) : Nom ou chemin à résoudre.
- **renvoie** : any Valeur trouvée, ou nil.

#### `libs_lustach_src_lustache_context.new(self, view, parent)`

Crée un contexte pour `view` avec un parent optionnel et un cache vide.

- `self` (*table*) : Classe context (appel avec les deux-points).
- `view` (*any*) : Données du contexte (table, nombre ou autre valeur).
- `parent` (*table|nil*) : Contexte parent.
- **renvoie** : table Nouveau contexte {view, parent, cache}.

#### `libs_lustach_src_lustache_context.push(self, view)`

Crée un contexte enfant pour `view` dont le parent est le contexte courant (entrée dans une section).

- `self` (*any*) : 
- `view` (*any*) : Données de la section.
- **renvoie** : table Contexte enfant.

## Champs

| Champ | Type | Description |
|---|---|---|
| `__index` | table | Auto-référence de la classe (la table `context` sert de métatable). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/lustach/src/lustache/context.lua`.*
