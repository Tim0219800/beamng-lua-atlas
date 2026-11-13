# `editor_assemblySpline_molecule`

*Fichier : `lua/ge/extensions/editor/assemblySpline/molecule.lua` · VM : Game Engine (GE) · 822 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_assemblySpline_molecule` : `extensions.load("editor_assemblySpline_molecule")`, puis la globale `editor_assemblySpline_molecule`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_assemblySpline_molecule.applyEnabledStatesToMolecule(spline, molecule)` | Apply enabled states to a molecule after deserialisation. | 767 |
| `editor_assemblySpline_molecule.buildMolecule(assemblyKit, spline)` | Build the molecule from the given assembly kit. | 425 |
| `editor_assemblySpline_molecule.getAssemblyKit(kitFolderPath)` | Gets the assembly kit from the selected .dae file (will take all siblings and extract bounding box data). | 127 |
| `editor_assemblySpline_molecule.getBridgeEnabled(spline, meshId)` | Checks if the bridge mesh with the given id is enabled or disabled for the given spline. | 56 |
| `editor_assemblySpline_molecule.getBridgeRandom(spline, meshId)` | Gets the random distribution flag for the bridge mesh with the given ID for the given spline. | 99 |
| `editor_assemblySpline_molecule.getBridgeRandomWeight(spline, meshId)` | Gets the random weight for the bridge mesh with the given ID for the given spline. | 113 |
| `editor_assemblySpline_molecule.getRigidEnabled(spline, meshId)` | Checks if the rigid mesh with the given id is enabled or disabled for the given spline. | 41 |
| `editor_assemblySpline_molecule.getRigidRandom(spline, meshId)` | Gets the random distribution flag for the rigid mesh with the given ID for the given spline. | 71 |
| `editor_assemblySpline_molecule.getRigidRandomWeight(spline, meshId)` | Gets the random weight for the rigid mesh with the given ID for the given spline. | 85 |
| `editor_assemblySpline_molecule.setBridgeEnabled(spline, meshId, enabled)` | Sets the enabled state for the bridge mesh with the given ID for the given spline. | 65 |
| `editor_assemblySpline_molecule.setBridgeRandom(spline, meshId, isRandom)` | Sets the random distribution flag for the bridge mesh with the given ID for the given spline. | 107 |
| `editor_assemblySpline_molecule.setBridgeRandomWeight(spline, meshId, weight)` | Sets the random weight for the bridge mesh with the given ID for the given spline. | 121 |
| `editor_assemblySpline_molecule.setRigidEnabled(spline, meshId, enabled)` | Sets the enabled state for the rigid mesh with the given id for the given spline. | 50 |
| `editor_assemblySpline_molecule.setRigidRandom(spline, meshId, isRandom)` | Sets the random distribution flag for the rigid mesh with the given ID for the given spline. | 79 |
| `editor_assemblySpline_molecule.setRigidRandomWeight(spline, meshId, weight)` | Sets the random weight for the rigid mesh with the given ID for the given spline. | 93 |

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `FS:` `findFiles`
- `obj:` `delete`, `getAnchorNames`, `getNodeTransform`, `getObjBox`, `registerObject`, `setField`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/assemblySpline/molecule.lua`.*
