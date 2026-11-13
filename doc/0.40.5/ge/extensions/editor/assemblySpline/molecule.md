# `editor_assemblySpline_molecule`

*Fichier : `lua/ge/extensions/editor/assemblySpline/molecule.lua` · VM : Game Engine (GE) · 822 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_assemblySpline_molecule` : `extensions.load("editor_assemblySpline_molecule")`, puis la globale `editor_assemblySpline_molecule`

Modèle de « molécule » de l'outil Assembly Spline. Un kit d'assemblage est un dossier de fichiers .dae (noms contenant 'root', 'bridge', 'sag', 'var') dont les ancres 'nail.*' (point, head, aux) définissent des jonctions de type nail (1 degré de liberté), fixed (0) ou ball (3). Le module charge le kit (getAssemblyKit), construit la molécule (rigids = éléments rigides, bridges = éléments reliant deux rigides, avec leurs variations) et gère par spline les états activé/aléatoire/poids de chaque mesh.

## Remarques

- Constantes de nommage : 'root' (mesh racine), 'bridge' (ponts), 'sag' (ponts qui s'affaissent), 'var' (variations, nom de forme <base>_var...; le mesh de base est <base>.dae), préfixe d'ancre 'nail', ancres 'point', 'head', 'aux'.
- Piège sur les états d'activation : si spline.rigidEnabledStates (ou bridgeEnabledStates) n'existe pas, tous les meshes sont activés ; dès que la table existe, un mesh absent de la table est considéré désactivé (seul == true compte). Le commentaire du code dit pourtant « only true if explicitly set to true ».
- Les états aléatoires valent false (round robin) et les poids 1.0 par défaut.
- Les getters/setters stockent les états dans la spline : rigidEnabledStates, bridgeEnabledStates, rigidRandomStates, rigidRandomWeights, bridgeRandomStates, bridgeRandomWeights (clés = id du mesh).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_assemblySpline_molecule.applyEnabledStatesToMolecule(spline, molecule)` | Après désérialisation, réapplique à la molécule les états activé des rigides, ponts et leurs variations enregistrés dans la spline. Ne fait rien si spline ou molécule est nil. | 767 |
| `editor_assemblySpline_molecule.buildMolecule(assemblyKit, spline)` | Construit la molécule depuis le kit : regroupe les variations (_var) avec leur mesh de base, identifie racine, rigides et ponts, calcule les jonctions d'après les ancres nail.* puis corrige les points d'attache des ponts pour les placer aux bords des meshes. | 425 |
| `editor_assemblySpline_molecule.getAssemblyKit(kitFolderPath)` | Charge un kit : liste tous les .dae du dossier et sous-dossiers (FS:findFiles) et extrait pour chacun ses données (boîte englobante, ancres). Chemin vide ou nil : renvoie une table vide et une chaîne vide. | 127 |
| `editor_assemblySpline_molecule.getBridgeEnabled(spline, meshId)` | Indique si le mesh pont d'id donné est activé pour la spline (même règle que getRigidEnabled). | 56 |
| `editor_assemblySpline_molecule.getBridgeRandom(spline, meshId)` | Indique si la distribution du groupe pont est aléatoire. Défaut false. | 99 |
| `editor_assemblySpline_molecule.getBridgeRandomWeight(spline, meshId)` | Poids de tirage d'un mesh pont (défaut 1.0). | 113 |
| `editor_assemblySpline_molecule.getRigidEnabled(spline, meshId)` | Indique si le mesh rigide d'id donné est activé pour la spline (voir notes pour le piège). | 41 |
| `editor_assemblySpline_molecule.getRigidRandom(spline, meshId)` | Indique si la distribution du groupe rigide est aléatoire (sinon tourniquet). Défaut false. | 71 |
| `editor_assemblySpline_molecule.getRigidRandomWeight(spline, meshId)` | Poids de tirage d'un mesh rigide (défaut 1.0). | 85 |
| `editor_assemblySpline_molecule.setBridgeEnabled(spline, meshId, enabled)` | Définit l'état activé d'un mesh pont. | 65 |
| `editor_assemblySpline_molecule.setBridgeRandom(spline, meshId, isRandom)` | Définit le mode de distribution aléatoire d'un pont. | 107 |
| `editor_assemblySpline_molecule.setBridgeRandomWeight(spline, meshId, weight)` | Définit le poids de tirage d'un mesh pont. | 121 |
| `editor_assemblySpline_molecule.setRigidEnabled(spline, meshId, enabled)` | Définit l'état activé d'un mesh rigide pour la spline (crée la table au besoin). | 50 |
| `editor_assemblySpline_molecule.setRigidRandom(spline, meshId, isRandom)` | Définit le mode de distribution aléatoire d'un rigide. | 79 |
| `editor_assemblySpline_molecule.setRigidRandomWeight(spline, meshId, weight)` | Définit le poids de tirage d'un mesh rigide. | 93 |

### Détail des paramètres

#### `editor_assemblySpline_molecule.applyEnabledStatesToMolecule(spline, molecule)`

Après désérialisation, réapplique à la molécule les états activé des rigides, ponts et leurs variations enregistrés dans la spline. Ne fait rien si spline ou molécule est nil.

- `spline` (*table|nil*) : Spline.
- `molecule` (*table|nil*) : Molécule.

#### `editor_assemblySpline_molecule.buildMolecule(assemblyKit, spline)`

Construit la molécule depuis le kit : regroupe les variations (_var) avec leur mesh de base, identifie racine, rigides et ponts, calcule les jonctions d'après les ancres nail.* puis corrige les points d'attache des ponts pour les placer aux bords des meshes.

- `assemblyKit` (*table*) : Résultat de getAssemblyKit.
- `spline` (*table*) : Spline utilisée pour les états activé/aléatoire (déduit du code).
- **renvoie** : table Molécule avec les listes rigids et bridges (chaque entrée : mesh, variations, isRandom, randomWeight).

#### `editor_assemblySpline_molecule.getAssemblyKit(kitFolderPath)`

Charge un kit : liste tous les .dae du dossier et sous-dossiers (FS:findFiles) et extrait pour chacun ses données (boîte englobante, ancres). Chemin vide ou nil : renvoie une table vide et une chaîne vide.

- `kitFolderPath` (*string*) : Dossier du kit (ex. 'assets/meshes/props/assembly_kit/ak_wood_fence_001/').
- **renvoie** : table Liste des meshes du kit (id, fileName, meshPath, ancres…).
- **renvoie** : string Chaîne vide si chemin invalide (deuxième valeur seulement dans ce cas, déduit du code).

#### `editor_assemblySpline_molecule.getBridgeEnabled(spline, meshId)`

Indique si le mesh pont d'id donné est activé pour la spline (même règle que getRigidEnabled).

- `spline` (*table*) : Assembly spline.
- `meshId` (*string*) : Id du mesh.
- **renvoie** : boolean Activé ou non.

#### `editor_assemblySpline_molecule.getBridgeRandom(spline, meshId)`

Indique si la distribution du groupe pont est aléatoire. Défaut false.

- `spline` (*table*) : Assembly spline.
- `meshId` (*string*) : Id du mesh.
- **renvoie** : boolean true si aléatoire.

#### `editor_assemblySpline_molecule.getBridgeRandomWeight(spline, meshId)`

Poids de tirage d'un mesh pont (défaut 1.0).

- `spline` (*table*) : Assembly spline.
- `meshId` (*string*) : Id du mesh.
- **renvoie** : number Poids.

#### `editor_assemblySpline_molecule.getRigidEnabled(spline, meshId)`

Indique si le mesh rigide d'id donné est activé pour la spline (voir notes pour le piège).

- `spline` (*table*) : Assembly spline.
- `meshId` (*string*) : Id du mesh.
- **renvoie** : boolean Activé ou non.

#### `editor_assemblySpline_molecule.getRigidRandom(spline, meshId)`

Indique si la distribution du groupe rigide est aléatoire (sinon tourniquet). Défaut false.

- `spline` (*table*) : Assembly spline.
- `meshId` (*string*) : Id du mesh.
- **renvoie** : boolean true si aléatoire.

#### `editor_assemblySpline_molecule.getRigidRandomWeight(spline, meshId)`

Poids de tirage d'un mesh rigide (défaut 1.0).

- `spline` (*table*) : Assembly spline.
- `meshId` (*string*) : Id du mesh.
- **renvoie** : number Poids.

#### `editor_assemblySpline_molecule.setBridgeEnabled(spline, meshId, enabled)`

Définit l'état activé d'un mesh pont.

- `spline` (*table*) : Assembly spline.
- `meshId` (*string*) : Id du mesh.
- `enabled` (*boolean*) : Activé.

#### `editor_assemblySpline_molecule.setBridgeRandom(spline, meshId, isRandom)`

Définit le mode de distribution aléatoire d'un pont.

- `spline` (*table*) : Assembly spline.
- `meshId` (*string*) : Id du mesh.
- `isRandom` (*boolean*) : Aléatoire.

#### `editor_assemblySpline_molecule.setBridgeRandomWeight(spline, meshId, weight)`

Définit le poids de tirage d'un mesh pont.

- `spline` (*table*) : Assembly spline.
- `meshId` (*string*) : Id du mesh.
- `weight` (*number*) : Poids.

#### `editor_assemblySpline_molecule.setRigidEnabled(spline, meshId, enabled)`

Définit l'état activé d'un mesh rigide pour la spline (crée la table au besoin).

- `spline` (*table*) : Assembly spline.
- `meshId` (*string*) : Id du mesh.
- `enabled` (*boolean*) : Activé.

#### `editor_assemblySpline_molecule.setRigidRandom(spline, meshId, isRandom)`

Définit le mode de distribution aléatoire d'un rigide.

- `spline` (*table*) : Assembly spline.
- `meshId` (*string*) : Id du mesh.
- `isRandom` (*boolean*) : Aléatoire.

#### `editor_assemblySpline_molecule.setRigidRandomWeight(spline, meshId, weight)`

Définit le poids de tirage d'un mesh rigide.

- `spline` (*table*) : Assembly spline.
- `meshId` (*string*) : Id du mesh.
- `weight` (*number*) : Poids.

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `FS:` `findFiles`
- `obj:` `delete`, `getAnchorNames`, `getNodeTransform`, `getObjBox`, `registerObject`, `setField`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/assemblySpline/molecule.lua`.*
