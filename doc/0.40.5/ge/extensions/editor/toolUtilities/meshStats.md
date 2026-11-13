# `editor_toolUtilities_meshStats`

*Fichier : `lua/ge/extensions/editor/toolUtilities/meshStats.lua` · VM : Game Engine (GE) · 154 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_meshStats` : `extensions.load("editor_toolUtilities_meshStats")`, puis la globale `editor_toolUtilities_meshStats`

Diagnostic du poids de maillage lors d'un import (importeur de ville/réseau de l'éditeur). Distingue la géométrie UNIQUE (ProceduralMesh : bâtiments, tabliers de pont ou de tunnel, portiques, chacun avec son propre tampon et sa propre construction de collision) de la géométrie INSTANCIÉE (TSStatic regroupés par forme, items Forest). Les générateurs appellent recordMesh pendant la construction ; l'importeur appelle begin() au début et report() à la fin, ce qui journalise un récapitulatif par famille.

## Exemple

```lua
local ms = require('editor/toolUtilities/meshStats')
ms.begin()
ms.recordMesh('bld_12', 'building', nVerts, nTris)
ms.recordParts('bridge.deck', nVerts, nTris)
ms.report('import')
```

## Remarques

- La collecte n'est active qu'entre begin() et report() : hors de cette fenêtre, recordMesh et recordParts sont sans effet, donc l'édition normale ne touche pas aux compteurs.
- report() revérifie chaque nom enregistré dans la scène (scenetree.findObject) : un mesh renommé ou supprimé en cours d'import n'est pas compté ; il énumère aussi tous les TSStatic (groupés par fichier shapeName), les items du Forest et les objets WaterBlock/WaterPlane.
- Les sorties sont des lignes de log niveau I préfixées '[mesh]' (par famille : meshes, triangles, sommets ; répartition des parties fusionnées ; props instanciés ; ligne HEADLINE).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_meshStats.begin()` | Démarre une fenêtre de collecte : active la collecte et efface les enregistrements précédents. | 27 |
| `editor_toolUtilities_meshStats.recordMesh(name, family, nVerts, nTris)` | Enregistre un ProceduralMesh par son NOM dans l'arbre de scène (une reconstruction sous le même nom écrase l'entrée). Sans effet hors collecte ou si name est nil. | 35 |
| `editor_toolUtilities_meshStats.recordParts(category, nVerts, nTris)` | Enregistre la géométrie d'UNE partie d'un maillage fusionné par catégorie structurelle (bridge.deck, tunnel.floor, tunnel.shell). Additif : les valeurs s'ajoutent. C'est une ventilation des totaux de maillage, pas un doublon. | 43 |
| `editor_toolUtilities_meshStats.report(tag)` | Agrège tout et journalise le récapitulatif, puis termine la fenêtre de collecte. Sans collecte active, journalise '[mesh] no active mesh-stats session' et revient. | 72 |

### Détail des paramètres

#### `editor_toolUtilities_meshStats.recordMesh(name, family, nVerts, nTris)`

Enregistre un ProceduralMesh par son NOM dans l'arbre de scène (une reconstruction sous le même nom écrase l'entrée). Sans effet hors collecte ou si name est nil.

- `name` (*string*) : Nom de l'objet dans la scène.
- `family` (*string|nil*) : Famille pour le récapitulatif (défaut 'other').
- `nVerts` (*integer|nil*) : Nombre de sommets (défaut 0).
- `nTris` (*integer|nil*) : Nombre de triangles (défaut 0).

#### `editor_toolUtilities_meshStats.recordParts(category, nVerts, nTris)`

Enregistre la géométrie d'UNE partie d'un maillage fusionné par catégorie structurelle (bridge.deck, tunnel.floor, tunnel.shell). Additif : les valeurs s'ajoutent. C'est une ventilation des totaux de maillage, pas un doublon.

- `category` (*string*) : Catégorie de la partie.
- `nVerts` (*integer|nil*) : Sommets à ajouter.
- `nTris` (*integer|nil*) : Triangles à ajouter.

#### `editor_toolUtilities_meshStats.report(tag)`

Agrège tout et journalise le récapitulatif, puis termine la fenêtre de collecte. Sans collecte active, journalise '[mesh] no active mesh-stats session' et revient.

- `tag` (*string|nil*) : Tag de log ; défaut 'meshStats'.

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/meshStats.lua`.*
