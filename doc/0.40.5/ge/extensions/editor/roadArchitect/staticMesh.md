# `editor_roadArchitect_staticMesh`

*Fichier : `lua/ge/extensions/editor/roadArchitect/staticMesh.lua` · VM : Game Engine (GE) · 268 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_staticMesh` : `extensions.load("editor_roadArchitect_staticMesh")`, puis la globale `editor_roadArchitect_staticMesh`

Place des objets TSStatic (fichiers .dae) le long des routes du Road Architect, à partir des couches (layers) du profil latéral. Deux types de couches sont gérés : le type 4 (même maillage répété sur toute la longueur de la route) et le type 5 (une seule unité de maillage). Appelé par roads.finalise ; les objets sont retirés par tryRemove lors du unfinalise ou de la suppression de la route.

## Remarques

- Les objets sont créés avec decalType = 'None', canSave = true et ajoutés au dossier de scène de la route.
- Le nom de chaque objet unique de type 5 est '<matDisplay> <indice de route>- single -<indice de couche>'.
- Le champ layer.mat contient le chemin du fichier de forme (shapeName).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_staticMesh.createStaticMeshes(r, roadIdx, folder)` | Parcourt les couches du profil de la route et crée les objets statiques correspondants (type 4 : répétition le long de la route ; type 5 : unité unique). | 228 |
| `editor_roadArchitect_staticMesh.tryRemove(roadName)` | Supprime de la scène tous les maillages statiques (répétés et uniques) créés pour la route, et oublie leurs entrées. | 246 |

### Détail des paramètres

#### `editor_roadArchitect_staticMesh.createStaticMeshes(r, roadIdx, folder)`

Parcourt les couches du profil de la route et crée les objets statiques correspondants (type 4 : répétition le long de la route ; type 5 : unité unique).

- `r` (*table*) : Route avec profile.layers.
- `roadIdx` (*integer*) : Indice de la route (sert au nommage).
- `folder` (*userdata*) : SimGroup de scène.

#### `editor_roadArchitect_staticMesh.tryRemove(roadName)`

Supprime de la scène tous les maillages statiques (répétés et uniques) créés pour la route, et oublie leurs entrées.

- `roadName` (*string*) : Nom de la route (le commentaire du code parle d'indice, mais la clé est le nom).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/staticMesh.lua`.*
