# `editor_api_navigation`

*Fichier : `lua/ge/extensions/editor/api/navigation.lua` · VM : Game Engine (GE) · 59 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_navigation` : `extensions.load("editor_api_navigation")`, puis la globale `editor_api_navigation`

Module d'API de l'éditeur prévu pour gérer les maillages de navigation (NavMesh), les liens hors-maillage et les couvertures (cover) pour l'IA. Dans 0.40.5 c'est une coquille vide : toutes les fonctions sont des `--TODO` sans corps. `initialize` les attache à l'objet `editor` (editor.createNavMesh, etc.).

## Remarques

- Toutes les fonctions installées sur `editor` ne font rien et renvoient nil (corps = TODO).
- Les paramètres `navMeshInfo`, `linkInfo`, `coverInfo` n'ont aucune structure définie dans le code.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_navigation.initialize(editorInstance)` | Mémorise l'instance de l'éditeur et y installe les neuf fonctions navmesh/cover/offmeshlink (non implémentées). *(interne)* | 43 |

### Détail des paramètres

#### `editor_api_navigation.initialize(editorInstance)`

Mémorise l'instance de l'éditeur et y installe les neuf fonctions navmesh/cover/offmeshlink (non implémentées).

- `editorInstance` (*table*) : objet `editor` sur lequel poser les fonctions

## Classe `editor`

Fonctions ajoutées à l'objet `editor` par `initialize`. Toutes sont des stubs vides (TODO).

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.createCover(coverInfo)` | Stub : devrait créer une couverture. | 23 |
| `editor.createNavMesh(navMeshInfo)` | Stub : devrait créer un navmesh. | 7 |
| `editor.createOffMeshLink(navMeshObjectId, linkInfo)` | Stub : devrait créer un lien hors-maillage. | 15 |
| `editor.deleteCover(coverObjectId)` | Stub : devrait supprimer une couverture. | 27 |
| `editor.deleteNavMesh(navMeshObjectId)` | Stub : devrait supprimer un navmesh. | 11 |
| `editor.deleteOffMeshLink(linkId)` | Stub : devrait supprimer un lien hors-maillage. | 19 |
| `editor.getCovers(navMeshObjectId)` | Stub : devrait lister les couvertures d'un navmesh. | 35 |
| `editor.getNavMeshes()` | Stub : devrait lister les navmeshes. | 31 |
| `editor.getOffMeshLinks()` | Stub : devrait lister les liens hors-maillage. | 39 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/navigation.lua`.*
