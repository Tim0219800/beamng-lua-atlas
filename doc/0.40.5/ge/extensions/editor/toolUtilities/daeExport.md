# `editor_toolUtilities_daeExport`

*Fichier : `lua/ge/extensions/editor/toolUtilities/daeExport.lua` · VM : Game Engine (GE) · 422 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_daeExport` : `extensions.load("editor_toolUtilities_daeExport")`, puis la globale `editor_toolUtilities_daeExport`

Exporteur COLLADA (.dae 1.4.1) pour les pièces de kit « baked » des outils de l'éditeur. Sérialise des meshParts ({ verts, normals, uvs, faces, material, tint? }) en documents que le loader Torque de BeamNG lit comme une forme statique, pour les placer en TSStatic. Gère : forme simple, multi-matériaux, et multi-LOD avec mesh de collision (nœuds '<gid>_p<i>_L<taille>', 'Colmesh-1', 'nulldetail<taille>' sous une hiérarchie base00/start01 exigée par l'importeur). Les formes vont soit dans la racine publiée /assets/procedural_meshes/, soit dans la racine de travail /assets/procedural_meshes_wip/ (filtrée du build).

## Remarques

- Les fichiers sont écrits via writeFile (chemin VFS) ; les fonctions renvoient le résultat de writeFile.
- prepDir VIDE le dossier : il refuse (log E) tout chemin qui n'est pas sous procRoot ou wipRoot, et vide aussi /temp<dir>. Il n'agit qu'une fois par dossier et par run (réinitialisé par beginBake).
- (ox,oy,oz) est une origine locale soustraite de tous les sommets : placer le TSStatic à cette origine ; évite de dépasser la portée de 2048 m du moteur.
- Si une seule partie a un tint, toutes les parties sont blanchies (tint = {1,1,1}) pour avoir des couleurs cohérentes ; writeDaeLODs et writeDaeParts le font tous deux.
- Deux LODs consécutifs identiques sont fusionnés (conservés à la plus petite taille).
- Dans la table RELEASED (vide pour l'instant), outDir teste RELEASED[folder] : il faut donc y mettre RELEASED['nomDuKit'] = true ; ajouter le nom comme élément de liste comme le suggère le commentaire ne marcherait pas.
- La date écrite dans <created>/<modified> est fixe (2020-01-01).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_daeExport.beginBake()` | Démarre un run de bake : le prochain prepDir de chaque dossier le vide à nouveau. | 380 |
| `editor_toolUtilities_daeExport.lenTag(L)` | Convertit une longueur en étiquette sûre pour nom de fichier/id : 16.0 -> "16", 0.5 -> "0_5", 0.125 -> "0_125". | 33 |
| `editor_toolUtilities_daeExport.outDir(folder)` | Dossier où vivent les formes baked d'un kit : racine publiée si RELEASED[folder] est vrai, sinon racine de travail. Prend le nom de dossier seul. | 407 |
| `editor_toolUtilities_daeExport.prepDir(dir)` | Prépare un dossier de sortie : le vide s'il existe, sinon le crée, et vide son équivalent sous /temp. Une seule fois par dossier et par run. Refuse (log erreur) un dossier hors procRoot/wipRoot ; sans effet si FS est absent. | 390 |
| `editor_toolUtilities_daeExport.writeDae(path, part, matName, gid)` | Sérialise `part` et l'écrit au chemin VFS `path` comme forme statique simple (un nœud, matériau lié par nom). | 342 |
| `editor_toolUtilities_daeExport.writeDaeLODs(path, lods, colParts, gid, ox, oy, oz, nullSize)` | Écrit une forme multi-LOD avec collision. lods = { {size=S, parts={...}}, ... } par S décroissant (LOD0 = S le plus grand) ; colParts = pièces du mesh de collision (nœud 'Colmesh-1') ; nullSize ajoute un nœud vide 'nulldetail<nullSize>' sous lequel la forme disparaît. | 365 |
| `editor_toolUtilities_daeExport.writeDaeParts(path, parts, gid, ox, oy, oz)` | Écrit une liste de parts (chacune avec .material) dans un seul .dae multi-matériaux (un effect/material/geometry/node par part). | 373 |

### Détail des paramètres

#### `editor_toolUtilities_daeExport.lenTag(L)`

Convertit une longueur en étiquette sûre pour nom de fichier/id : 16.0 -> "16", 0.5 -> "0_5", 0.125 -> "0_125".

- `L` (*number*) : Longueur
- **renvoie** : string Étiquette.

#### `editor_toolUtilities_daeExport.outDir(folder)`

Dossier où vivent les formes baked d'un kit : racine publiée si RELEASED[folder] est vrai, sinon racine de travail. Prend le nom de dossier seul.

- `folder` (*string*) : Nom du dossier du kit
- **renvoie** : string Chemin se terminant par '/'.

#### `editor_toolUtilities_daeExport.prepDir(dir)`

Prépare un dossier de sortie : le vide s'il existe, sinon le crée, et vide son équivalent sous /temp. Une seule fois par dossier et par run. Refuse (log erreur) un dossier hors procRoot/wipRoot ; sans effet si FS est absent.

- `dir` (*string*) : Dossier VFS sous procRoot ou wipRoot

#### `editor_toolUtilities_daeExport.writeDae(path, part, matName, gid)`

Sérialise `part` et l'écrit au chemin VFS `path` comme forme statique simple (un nœud, matériau lié par nom).

- `path` (*string*) : Chemin VFS du .dae
- `part` (*table*) : meshPart { verts, normals, uvs, faces, tint? }
- `matName` (*string*) : Nom du matériau du jeu
- `gid` (*string*) : Id de géométrie/nœud (aussi le nom de base du fichier)
- **renvoie** : boolean true en cas de succès.

#### `editor_toolUtilities_daeExport.writeDaeLODs(path, lods, colParts, gid, ox, oy, oz, nullSize)`

Écrit une forme multi-LOD avec collision. lods = { {size=S, parts={...}}, ... } par S décroissant (LOD0 = S le plus grand) ; colParts = pièces du mesh de collision (nœud 'Colmesh-1') ; nullSize ajoute un nœud vide 'nulldetail<nullSize>' sous lequel la forme disparaît.

- `path` (*string*) : Chemin VFS
- `lods` (*table*) : Liste { size, parts } décroissante
- `colParts` (*table|nil*) : Parts de collision (sans chanfrein)
- `gid` (*string*) : Id de base
- `ox` (*number|nil*) : Origine locale x
- `oy` (*number|nil*) : Origine locale y
- `oz` (*number|nil*) : Origine locale z
- `nullSize` (*number|nil*) : Taille du détail nul (rien rendu en dessous)
- **renvoie** : boolean true en cas de succès.

#### `editor_toolUtilities_daeExport.writeDaeParts(path, parts, gid, ox, oy, oz)`

Écrit une liste de parts (chacune avec .material) dans un seul .dae multi-matériaux (un effect/material/geometry/node par part).

- `path` (*string*) : Chemin VFS
- `parts` (*table*) : Liste de meshParts avec .material
- `gid` (*string*) : Base des ids de géométrie/nœud
- `ox` (*number|nil*) : Origine locale x soustraite des sommets (défaut 0)
- `oy` (*number|nil*) : Origine locale y
- `oz` (*number|nil*) : Origine locale z
- **renvoie** : boolean true en cas de succès.

## Champs

| Champ | Type | Description |
|---|---|---|
| `procRoot` | string | Racine publiée des formes générées : '/assets/procedural_meshes/'. |
| `wipRoot` | string | Racine de travail : '/assets/procedural_meshes_wip/' (exclue du build). |

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `findFiles`, `removeFile`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/daeExport.lua`.*
