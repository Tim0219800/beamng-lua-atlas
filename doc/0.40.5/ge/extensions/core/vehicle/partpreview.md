# `core_vehicle_partpreview`

*Fichier : `lua/ge/extensions/core/vehicle/partpreview.lua` · VM : Game Engine (GE) · 220 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_vehicle_partpreview` : `extensions.load("core_vehicle_partpreview")`, puis la globale `core_vehicle_partpreview`

Extension GE `core_vehicle_partpreview` : aperçu temporaire de pièces dans l'UI de configuration (survol dans les partpacks), sans respawn du véhicule. Compare les meshes (flexbodies) de la pièce actuelle d'un slot avec ceux d'une pièce candidate, masque les meshes de la pièce actuelle (alpha 0) et affiche ceux de la candidate (alpha 1), en mémorisant les alphas d'origine pour les restaurer.

## Exemple

```lua
-- Aperçu de deux pièces candidates (slot -> nom de pièce)
core_vehicle_partpreview.previewPartMeshes({['pickup_hood'] = 'pickup_hood_vented'})
-- Retour à l'état normal
core_vehicle_partpreview.clearPartPreview()
```

## Remarques

- Les clés de partsBySlot sont les identifiants de slot (id du noeud de partsTree), les valeurs sont des noms de pièces jbeam.
- previewPartMeshes appelle dump(...) et getFlexmeshChanges (qui logue en niveau I) à chaque appel : sortie de log bruyante, apparemment laissée de côté lors du développement.
- L'aperçu ne change que l'alpha des meshes (flexbodies et props) : aucune pièce n'est réellement installée, la physique et le jbeam du véhicule ne changent pas.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_vehicle_partpreview.clearPartPreview(inVehID)` | Restaure l'alpha d'origine de tous les meshes modifiés par l'aperçu pour le véhicule et oublie l'état. | 99 |
| `core_vehicle_partpreview.getFlexmeshChanges(partsBySlot, inVehID)` | Calcule quels meshes de flexbodies disparaissent ou apparaissent si les pièces candidates remplaçaient les pièces actuelles de leurs slots. | 110 |
| `core_vehicle_partpreview.previewPartMeshes(partsBySlot, inVehID)` | Affiche l'aperçu des pièces candidates : efface l'aperçu précédent, masque les meshes de la pièce actuelle de chaque slot et affiche ceux de la candidate (meshes de flexbodies et de props). | 171 |
| `core_vehicle_partpreview.reset()` | Oublie tous les états d'aperçu mémorisés, sans restaurer les alphas (à utiliser quand les véhicules ont été recréés). | 210 |

### Détail des paramètres

#### `core_vehicle_partpreview.clearPartPreview(inVehID)`

Restaure l'alpha d'origine de tous les meshes modifiés par l'aperçu pour le véhicule et oublie l'état.

- `inVehID` (*integer|nil*) : véhicule ; nil = joueur 0

#### `core_vehicle_partpreview.getFlexmeshChanges(partsBySlot, inVehID)`

Calcule quels meshes de flexbodies disparaissent ou apparaissent si les pièces candidates remplaçaient les pièces actuelles de leurs slots.

- `partsBySlot` (*table<string, string>*) : [slot] = nom de pièce candidate (valeurs vides ignorées)
- `inVehID` (*integer|nil*) : véhicule ; nil = joueur 0
- **renvoie** : table[] liste de {slotName, oldPartName, newPartName, oldMesh, newMesh} (oldMesh nil = nouveau mesh ; newMesh nil = mesh supprimé)

#### `core_vehicle_partpreview.previewPartMeshes(partsBySlot, inVehID)`

Affiche l'aperçu des pièces candidates : efface l'aperçu précédent, masque les meshes de la pièce actuelle de chaque slot et affiche ceux de la candidate (meshes de flexbodies et de props).

- `partsBySlot` (*table<string, string>*) : [slot] = nom de pièce candidate
- `inVehID` (*integer|nil*) : véhicule ; nil = joueur 0

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/vehicle/partpreview.lua`.*
