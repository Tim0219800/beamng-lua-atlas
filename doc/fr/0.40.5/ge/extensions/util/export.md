# `util_export`

*Fichier : `lua/ge/extensions/util/export.lua` · VM : Game Engine (GE) · 1311 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_export` : `extensions.load("util_export")`, puis la globale `util_export`

Exporte le véhicule du joueur au format glTF 2.0 (.gltf avec JSON ou .glb binaire), ou une séquence d'images clés. Il récupère le maillage GPU du véhicule (GPUMesh.bng_getGPUMesh) puis écrit les buffers (sommets, normales, tangentes, UV, couleurs, indices), les flexbodies et les props, l'arbre de pièces JBeam (sous forme de hiérarchie de nœuds glTF), les matériaux (textures converties en PNG, données du matériau BeamNG dans extras.bngMaterial) et, si exportBeams est vrai, les nœuds et poutres de chaque pièce (extension BNG_JBeamData). La direction du véhicule est écrite dans l'extension BNG_Direction. Les coordonnées sont converties en {x, z, -y}. L'export est asynchrone : il a lieu dans updateGFX quand les données GPU sont prêtes. Utile pour importer un véhicule BeamNG dans Blender ou un autre outil 3D.

## Exemple

```lua
extensions.util_export.gltfBinaryFormat = false
extensions.util_export.exportFile('vehicle.gltf')
```

## Remarques

- L'export prend le véhicule joueur 0 à l'état courant (déformations comprises : positions de nœuds actuelles pour les poutres).
- export(handler) : si un export est déjà en cours (lastMeshInfo non nil), le handler est appelé avec nil et rien d'autre n'est fait.
- startRecording écrit une première image puis continue à exporter à chaque frame jusqu'à stopRecording ; les temps sont stockés dans une animation glTF. La sortie journalise chaque image.
- suggestFilename cherche export_001 à export_100 dans le dossier du véhicule, avec l'extension .glb ou .gltf selon gltfBinaryFormat ; si tous existent, renvoie le dernier nom testé.
- Bug : dans _addTimeBuffers, le buffer des numéros d'images clés utilise la variable bufferID (non définie, donc nil) au lieu de bufferIDKeyframes, et la borne max du temps utilise keyFrameTimes[#keyFrameTimes - 1]. L'enregistrement d'animation est donc probablement incorrect.
- Bug : dans _convertType, `dumps(value)" to "` (opérateur .. manquant) est un appel de fonction sur une chaîne et provoquerait une erreur Lua dans les cas d'erreur de conversion.
- Bug : _isTextureCookerFilepath teste `not string.sub(filepath, -4) == ".png"`, expression toujours fausse en pratique (priorité de l'opérateur not) ; le test d'extension n'est donc pas fait.
- Après un export, le hook GUI ThreeDExported est déclenché et un message « GLTF Vehicle exported » s'affiche 5 s.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_export.export(handler)` | Lance l'export du véhicule joueur et appelle handler(gltfRoot) avec la table glTF construite quand les données GPU sont prêtes (dans updateGFX). | 1124 |
| `util_export.exportFile(filename)` | Exporte le véhicule joueur dans un fichier glTF (JSON ou binaire selon gltfBinaryFormat). Réinitialise le cache d'images et affiche un message d'interface. | 1140 |
| `util_export.getGeInfo()` | Renvoie les réglages de l'export utiles à l'interface (actuellement seulement gltfBinaryFormat). | 1284 |
| `util_export.startRecording(filename)` | Exporte une première image dans le fichier puis continue d'exporter à chaque frame (animation) jusqu'à l'appel de stopRecording. | 1248 |
| `util_export.stopRecording()` | Arrête l'enregistrement d'animation démarré par startRecording. | 1253 |
| `util_export.suggestFilename()` | Propose un nom de fichier libre export_NNN.glb ou .gltf dans le dossier du véhicule joueur (pour l'interface). | 1263 |
| `util_export.updateGFX(dt)` | Hook appelé chaque frame : si les données GPU du maillage sont prêtes, termine l'export en cours (processExport). *(interne)* | 1257 |

### Détail des paramètres

#### `util_export.export(handler)`

Lance l'export du véhicule joueur et appelle handler(gltfRoot) avec la table glTF construite quand les données GPU sont prêtes (dans updateGFX).

- `handler` (*function*) : Fonction recevant la table glTF racine (ou nil si un export est déjà en cours)

#### `util_export.exportFile(filename)`

Exporte le véhicule joueur dans un fichier glTF (JSON ou binaire selon gltfBinaryFormat). Réinitialise le cache d'images et affiche un message d'interface.

- `filename` (*string*) : Chemin du fichier de sortie (.gltf ou .glb)

#### `util_export.getGeInfo()`

Renvoie les réglages de l'export utiles à l'interface (actuellement seulement gltfBinaryFormat).

- **renvoie** : table {gltfBinaryFormat = boolean}

#### `util_export.startRecording(filename)`

Exporte une première image dans le fichier puis continue d'exporter à chaque frame (animation) jusqu'à l'appel de stopRecording.

- `filename` (*string*) : Chemin du fichier de sortie

#### `util_export.suggestFilename()`

Propose un nom de fichier libre export_NNN.glb ou .gltf dans le dossier du véhicule joueur (pour l'interface).

- **renvoie** : string Chemin proposé, ou chaîne vide s'il n'y a pas de véhicule joueur

#### `util_export.updateGFX(dt)`

Hook appelé chaque frame : si les données GPU du maillage sont prêtes, termine l'export en cours (processExport).

- `dt` (*number*) : Delta de temps (non utilisé)

## Champs

| Champ | Type | Description |
|---|---|---|
| `embedBuffers` | boolean | true (défaut) : buffers intégrés en base64 dans le JSON ; false : fichiers .bin externes (<nom>_buffer_NNN_<type>.bin). Ignoré en format binaire. |
| `exportBeams` | boolean | Exporte les nœuds et poutres par pièce dans extras (défaut true) |
| `exportColors` | boolean | Exporte les couleurs de sommets (défaut false) |
| `exportNormals` | boolean | Exporte les normales (défaut true) |
| `exportTangents` | boolean | Exporte les tangentes (défaut false) |
| `exportTexCoords` | boolean | Exporte les deux jeux de coordonnées de texture (défaut false) |
| `gltfBinaryFormat` | boolean | true (défaut) : écrit un .glb ; false : écrit un .gltf JSON |

**Évènements UI (guihooks.trigger) :** `ThreeDExported`

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`
- `be:` `getPlayerVehicleID`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/export.lua`.*
