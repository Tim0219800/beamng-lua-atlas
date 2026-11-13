# `jbeam_sections_meshs`

*Fichier : `lua/common/jbeam/sections/meshs.lua` · VM : Commun (GE + véhicule) · 382 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jbeam/sections/meshs")`

Traite les sections jbeam qui concernent les meshes 3D du véhicule : triangles (triangles de collision physique), props (meshes rigides attachés à trois nœuds de référence, y compris les lumières SPOTLIGHT/POINTLIGHT) et flexbodies (meshes déformables liés à des groupes de nœuds). Applique d'abord les rotations/déplacements du composant aux positions/rotations des flexbodies, demande au moteur le chargement groupé des meshes, crée les triangles physiques, les props et les flexmeshes avec leurs transformations, puis valide (meshCommit).

## Remarques

- Props : requièrent idRef, idX, idY, translation et rotation (sinon erreur et prop ignoré). Rotation en degrés dans le jbeam, convertie en radians ; baseRotation/baseRotationGlobal aussi. Si le moteur renomme le mesh, le nom d'origine est mémorisé dans originalMesh et mesh est mis à jour. Le paramètre utilisateur « disableSteeringwheel » désactive les props dont func == 'steering'.
- Valeurs par défaut des props : min 0, max 100, offset 0, multiplier 1 ; ils sont créés visibles avec valeur de donnée 0. prop.pid et prop.slotID reçoivent l'identifiant moteur.
- Lumières (mesh SPOTLIGHT ou POINTLIGHT) : lightInnerAngle (40), lightOuterAngle (45), lightBrightness (1) ou lightIntensityCd / lightIntensityLm (convertis en luminosité / 5000), lightRange (10), lightCastShadows (false), flareName ('vehicleDefaultLightflare'), flareScale 1, cookieName, animationType/Period/Phase, texSize 256, shadowSoftness 1, lightColor (table {r,g,b,a} 0-255 ou chaîne '#RRGGBBAA'), lightAttenuation (0,1,1), lightSourceRadius (en mètres, -1 par défaut).
- materialOverride (props et flexbodies) doit être un tableau de paires {ancien, nouveau} ; une paire simple {a, b} provoque une erreur de journal.
- Flexbodies : créés seulement s'ils ont au moins un nœud dans _group_nodes ; pos/rot (degrés)/scale optionnels appliqués via setInitialTransformation (flatMap optionnel). Les meshes renommés sont suivis comme pour les props.
- Les triangles dégénérés (deux indices identiques) sont ignorés.
- Le module ne fait rien côté moteur si vehicleObj est nil (VM véhicule).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jbeam_sections_meshs.process(objID, vehicleObj, vehicle)` | Charge et configure triangles, props et flexbodies du véhicule dans le moteur. *(interne)* | 322 |

### Détail des paramètres

#### `jbeam_sections_meshs.process(objID, vehicleObj, vehicle)`

Charge et configure triangles, props et flexbodies du véhicule dans le moteur.

- `objID` (*integer*) : Identifiant du véhicule (non utilisé).
- `vehicleObj` (*userdata|nil*) : Objet véhicule moteur.
- `vehicle` (*table*) : Données jbeam du véhicule (modifiées en place : pid, fid, mesh, rotation...).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jbeam/sections/meshs.lua`.*
