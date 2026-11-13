# `util_dependencyTree`

*Fichier : `lua/ge/extensions/util/dependencyTree.lua` · VM : Game Engine (GE) · 247 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_dependencyTree` : `extensions.load("util_dependencyTree")`, puis la globale `util_dependencyTree`

Outil de développement qui analyse les fichiers de contenu du niveau 'levels/gridmap' (*.level.json, *.material.json, *.datablock.json et *.meshes.json) pour construire un graphe de dépendances : chaque entité déclare ce qu'elle fournit (provides : nom d'objet, matériau mapTo, shape) et ce dont elle dépend (deps : fichiers, textures, matériaux, shapes, objets). Le résultat est écrit dans dependencytree.json. Un moddeur peut s'en servir pour savoir quelles textures, matériaux et formes un niveau utilise.

## Exemple

```lua
util_dependencyTree.test()  -- écrit dependencytree.json
```

## Remarques

- Le dossier analysé est codé en dur : 'levels/gridmap'.
- Classes de SimObject reconnues : BeamNGVehicle (JBeam, partConfig), BasicClouds, CloudLayer, DecalRoad, MeshRoad, River, WaterPlane, ScatterSky, SkyBox, Sun, Forest (fichier de données), ForestBrush, ForestItemData, Material (4 stages, textures et cubemap), SFXAmbience, SFXDescription, DecalData, GroundCover, ParticleData, ParticleEmitterData, PrecipitationData, ConvexShape, GroundPlane, LevelInfo, TSStatic.
- Les chemins de fichiers relatifs (sans dossier) sont complétés avec le dossier du fichier source ; les extensions des shapes et textures sont retirées.
- Incohérence : GroundCover enregistre sa dépendance de couche sous la catégorie 'SimObject' (majuscules), alors que les autres utilisent 'simobject'.
- Bug probable : pour la classe Material, le code lit n.Stages[i] pour i de 1 à 4 sans vérifier que le stage existe : erreur si un matériau a moins de 4 stages.
- removeFileExtensions construit un motif avec '.' non échappé pour retirer l'extension (peut aussi toucher un autre caractère identique dans le chemin).
- Le nom de la shape fournie est déduit du nom du fichier .meshes.json en retirant ses 12 derniers caractères ('.meshes.json').

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_dependencyTree.test()` | Analyse tous les fichiers de contenu du dossier, remplit la liste d'entités (deps et provides) et l'écrit dans dependencytree.json (JSON indenté). | 220 |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/dependencyTree.lua`.*
