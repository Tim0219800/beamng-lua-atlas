# `util_tileBake`

*Fichier : `lua/ge/extensions/util/tileBake.lua` · VM : Game Engine (GE) · 163 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_tileBake` : `extensions.load("util_tileBake")`, puis la globale `util_tileBake`

Outil réservé au développement : produit des proxys de tuiles pour la ville lointaine. Il répartit chaque mesh statique (TSStatic) et chaque gros objet de forêt du niveau en tuiles de 200 m, fusionne chaque tuile en un mesh, le cuit sur GPU dans un atlas partagé et écrit un glTF par tuile (via la fonction C++ bakeTileToGltf). Les sorties servent ensuite à l'outil DevTools/instalod pour fabriquer des LOD simplifiés. Sortie : /temp/tileBake/<niveau>/tile_<tx>_<ty>/ (PNG d'atlas, tile_<tx>_<ty>.gltf et tile.json).

## Exemple

```lua
extensions.load('util/tileBake')
-- le baking démarre tout seul quand un niveau est chargé
```

## Remarques

- Constantes : tuile 200 m, page d'atlas 4096 px, gouttière de 8 px, rayon minimal 4 m pour les objets de forêt.
- La végétation (chemins contenant /trees/, /vegetation/, /foliage/, /plants/, bush, shrub, fern, grass, hedge, weed) est ignorée car elle a son propre système de LOD/imposteurs.
- Séquence : 60 frames d'attente (le temps que le rendu et les shaders se stabilisent), une passe de collecte (gather), puis une tuile cuite par frame pour laisser respirer le jeu.
- Chaque tuile écrit un tile.json (niveau, tx, ty, tileSize, origine, nombre de statiques/forêt/instances) pour la replacer à son origine monde.
- Les transformations de la forêt sont constantes ; le code reconstruit une matrice modifiable avant d'appliquer l'échelle (voir scaledTransform).
- Le nom du niveau est tiré de getMissionFilename() ('level' par défaut).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_tileBake.onClientPostStartMission()` | Hook appelé à la fin du chargement d'un niveau ; réarme le baking (même fonction que onExtensionLoaded). *(interne)* *(hook)* | 136 |
| `util_tileBake.onExtensionLoaded()` | Armement du baking quand l'extension est chargée alors qu'un niveau est déjà en place : active le mode pending, attente de 60 frames, remise à zéro des compteurs. Même fonction que onClientPostStartMission. *(interne)* *(hook)* | 136 |
| `util_tileBake.onUpdate()` | Hook appelé à chaque frame. Une fois armé : attend la fin du warmup, collecte les instances par tuile, puis cuit une tuile par appel et logue la progression et le bilan final (OK/échecs). *(interne)* *(hook)* | 144 |

## Appels vers le moteur (C++)

- `obj:` `getField`, `getScale`, `getTransform`, `getWorldBox`, `isSubClassOf`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/tileBake.lua`.*
