# `ui_liveries_textures`

*Fichier : `lua/ge/extensions/ui/liveries/textures.lua` · VM : Game Engine (GE) · 232 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_liveries_textures` : `extensions.load("ui_liveries_textures")`, puis la globale `ui_liveries_textures`

Fournit à l'interface des livrées le catalogue des textures de décalcomanies dynamiques, classées par tags (digit, gradient, letter, logo, noise, pattern, shape, textureFill, Team Offroad) plus une catégorie « others » pour les textures sans tag. Le scan des textures tourne dans un job (editor_api_dynamicDecals_textures.setupAsync) avec un flux de progression, et les résultats sont envoyés à l'UI par guihooks. Mémorise aussi l'élément choisi dans le sélecteur.

## Remarques

- Événements guihooks émis : liveries_textureSelectorDataLoaded (métadonnées, fin du scan), liveries_textureCategoryData ({requestId, category, groups}), flux liveries_textureLoadProgress ({count, total, percent, inProgress}).
- percent vaut -1 tant que le nombre total de fichiers est inconnu (progression indéterminée).
- Une texture portant plusieurs tags apparaît dans chacun de leurs groupes (voulu, d'après le commentaire du code).
- Si l'API editor_api_dynamicDecals_textures est absente, loadTextures renvoie « unavailable ».

**Dépendances (chargées avant) :** `editor_api_dynamicDecals_textures`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_liveries_textures.clearSelectedItem()` | Oublie l'élément choisi. | 227 |
| `ui_liveries_textures.getSelectedItem()` | Renvoie l'élément mémorisé par setSelectorItem. | 223 |
| `ui_liveries_textures.getSelectorMetadata()` | Construit les métadonnées du sélecteur : catégorie par défaut « all », puis liste triée des catégories (tags connus, « others » s'il existe des textures sans tag), « all » en tête. | 165 |
| `ui_liveries_textures.getTagLabel(tag)` | Renvoie la clé de traduction (ui.liveries.edit.decalCategories.*) associée à un tag de texture. | 98 |
| `ui_liveries_textures.loadTextures()` | Lance dans un job (cadence 1/30) le scan asynchrone des textures si elles ne sont pas déjà chargées, publie la progression, puis déclenche liveries_textureSelectorDataLoaded avec getSelectorMetadata(). | 139 |
| `ui_liveries_textures.requestSelectorCategory(category, requestId)` | Prépare les groupes de textures d'une catégorie (« all » : tous les tags plus « others » ; « others » : textures sans tag ; ou un tag précis) et les envoie à l'UI par l'événement liveries_textureCategoryData. Chaque élément a name, label, value (nom de fichier) et preview (chemin). | 190 |
| `ui_liveries_textures.setSelectorItem(item)` | Mémorise l'élément de catalogue choisi, conservé pendant la navigation vers l'écran de transformation. | 219 |

### Détail des paramètres

#### `ui_liveries_textures.getSelectedItem()`

Renvoie l'élément mémorisé par setSelectorItem.

- **renvoie** : table|nil Élément choisi ou nil.

#### `ui_liveries_textures.getSelectorMetadata()`

Construit les métadonnées du sélecteur : catégorie par défaut « all », puis liste triée des catégories (tags connus, « others » s'il existe des textures sans tag), « all » en tête.

- **renvoie** : table {defaultCategory = "all", categories = {{value, label}, ...}}.

#### `ui_liveries_textures.getTagLabel(tag)`

Renvoie la clé de traduction (ui.liveries.edit.decalCategories.*) associée à un tag de texture.

- `tag` (*string*) : Identifiant de tag, par exemple « logo ».
- **renvoie** : string|nil Clé de traduction, nil si le tag est inconnu.

#### `ui_liveries_textures.loadTextures()`

Lance dans un job (cadence 1/30) le scan asynchrone des textures si elles ne sont pas déjà chargées, publie la progression, puis déclenche liveries_textureSelectorDataLoaded avec getSelectorMetadata().

- **renvoie** : string « startLoading », « alreadyLoading » (job en cours, la progression est renvoyée) ou « unavailable » (API absente).

#### `ui_liveries_textures.requestSelectorCategory(category, requestId)`

Prépare les groupes de textures d'une catégorie (« all » : tous les tags plus « others » ; « others » : textures sans tag ; ou un tag précis) et les envoie à l'UI par l'événement liveries_textureCategoryData. Chaque élément a name, label, value (nom de fichier) et preview (chemin).

- `category` (*string*) : Catégorie demandée ; une valeur non string est remplacée par « all ».
- `requestId` (*number*) : Identifiant renvoyé tel quel dans l'événement (0 par défaut).

#### `ui_liveries_textures.setSelectorItem(item)`

Mémorise l'élément de catalogue choisi, conservé pendant la navigation vers l'écran de transformation.

- `item` (*table|nil*) : Élément choisi.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : editor_api_dynamicDecals_textures. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/liveries/textures.lua`.*
