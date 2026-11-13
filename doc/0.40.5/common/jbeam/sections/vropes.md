# `jbeam_sections_vropes`

*Fichier : `lua/common/jbeam/sections/vropes.lua` · VM : Commun (GE + véhicule) · 128 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jbeam/sections/vropes")`

Traite la section jbeam « vropes » (cordes visuelles simulées, sans poutres physiques). Pour chaque entrée ayant anchorAProp et anchorBProp (noms de props du véhicule), crée une corde visuelle côté moteur (createRopeVisual/getRopeVisual), l'attache aux deux props (vehiclePropIdA/B) et applique ses propriétés avec des valeurs par défaut, puis appelle rope:rebuild(). La liste des identifiants créés est mise dans vehicleObj.ropeIds pour le rendu automatique.

## Remarques

- Valeurs par défaut : dirA/dirB (0,0,-1), nodeCount 16, lengthScale 1.2, diameter 0.05, damping 0.995, bendStiffness 0.8, useXPBD false, useBending true, bendSegmentLength 2, useWorldCollision false, useSelfCollision false, useStrainLimit true, maxStrainLimit 2.0, totalMass 0.5, massFalloff 0.0, iterations 1, youngsModulus 1e6, renderRope true, windScale 0.5, windDrag 0.5, materialName '', anchorAFixed/anchorBFixed false, simFPS 60.
- Les props sont retrouvés par leur champ name ; un prop introuvable journalise une erreur et la corde est ignorée. Le message de succès parle de 'nodes' mais il s'agit de props.
- findPropIdByName renvoie le cid du prop (identifiant de prop), pas un identifiant de nœud.
- Ne s'exécute que si l'objet véhicule moteur est disponible (VM GE).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jbeam_sections_vropes.process(objID, vehicleObj, vehicle)` | Crée les cordes visuelles décrites par vehicle.vropes et enregistre leurs identifiants dans vehicleObj.ropeIds. *(interne)* | 117 |

### Détail des paramètres

#### `jbeam_sections_vropes.process(objID, vehicleObj, vehicle)`

Crée les cordes visuelles décrites par vehicle.vropes et enregistre leurs identifiants dans vehicleObj.ropeIds.

- `objID` (*integer*) : Identifiant du véhicule (non utilisé).
- `vehicleObj` (*userdata*) : Objet véhicule moteur.
- `vehicle` (*table*) : Données jbeam (vropes, props).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jbeam/sections/vropes.lua`.*
