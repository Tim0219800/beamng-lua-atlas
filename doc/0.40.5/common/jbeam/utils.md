# `jbeam_utils`

*Fichier : `lua/common/jbeam/utils.lua` · VM : Commun (GE + véhicule) · 359 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jbeam/utils")`

Fonctions utilitaires partagées du chargeur jbeam : ajout de nœuds et de poutres au véhicule en construction (compteurs maxIDs, copie des options), ajout de rotators, et calcul des transformations nodeRotate / nodeOffset / nodeMove appliquées aux positions de nœuds et de flexbodies (avec cache), plus deux helpers d'encodage string.buffer. Utilisé par les gestionnaires de roues, par le chargeur et par l'éditeur ; un mod qui génère des véhicules par code peut s'en servir pour ajouter des nœuds/poutres.

## Exemple

```lua
local jbeamUtils = require('jbeam/utils')
local n = jbeamUtils.addNodeWithOptions(vehicle, vec3(0, 0, 1), 0, {nodeWeight = 5})
local b = jbeamUtils.addBeamWithOptions(vehicle, n1, n2, 0, {beamSpring = 1e6})
```

## Remarques

- Les identifiants de nœuds et poutres sont des cid à base 0 ; vehicle.maxIDs[nom] compte les éléments déjà créés (increaseMax renvoie la valeur AVANT incrémentation, donc le prochain cid libre).
- addNode/addBeamWithOptions copient (deepcopy) la table d'options reçue : les options d'une roue ou du véhicule (vehicle.options) deviennent les champs de chaque nœud / poutre créé.
- addBeamWithOptions : id1/id2 sont utilisés pour chercher vehicle.nodes[id] (clé = cid, et dans le chargeur aussi le nom du nœud) ; si id1/id2 sont nil ils sont lus dans options.id1/options.id2. Les champs id1, id2 de la poutre créée sont les cid des nœuds trouvés. Si un nœud est invalide, la fonction journalise un avertissement et renvoie nil (sans créer de poutre) : les appelants (gestionnaires de roues) ne vérifient pas ce retour.
- Avec id3 (3e nœud), la poutre devient une poutre en L (BEAM_LBEAM = 4) quel que soit beamType et b.id3 est renseigné.
- Constantes C codées en dur : NORMALTYPE = 0, BEAM_LBEAM = 4 (ne pas changer).
- Transformations jbeam : les clés 'nodeRotateN', 'nodeOffsetN' et 'nodeMoveN' (N = 0 à 99, 1 ou 2 chiffres) d'un bloc jbeamData sont des tables {x, y, z} (nodeRotate : angles en degrés autour de x/y/z, avec pivot optionnel px, py, pz). Elles s'appliquent dans l'ordre de N croissant, et pour chaque N : rotation, puis offset, puis move. nodeOffset est ignoré si jbeamData.ignoreNodeOffset est vrai ; son x est multiplié par le signe de posX (symétrie gauche/droite).
- Les fonctions de transformation partagent un cache au niveau du module (une seule transformation à la fois) et des vecteurs/quats temporaires : pas réentrantes.
- Les angles d'Euler de rotation sont ceux de MatrixF (ZXY intrinsèque), en radians avec signe inversé pour les angles jbeam (rad(-angle)).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jbeam_utils.addBeam(vehicle, id1, id2)` | addBeamWithOptions de type NORMALTYPE (0) avec les options du véhicule. | 100 |
| `jbeam_utils.addBeamWithOptions(vehicle, id1, id2, beamType, options, id3)` | Ajoute une poutre entre deux nœuds existants avec les options copiées, plus cid, id1, id2 (cid des nœuds) et beamType. Avec id3, crée une poutre en L (BEAM_LBEAM). Renvoie nil avec un avertissement si un nœud est introuvable. | 51 |
| `jbeam_utils.addNode(vehicle, pos, ntype)` | addNodeWithOptions avec les options globales du véhicule (vehicle.options). | 47 |
| `jbeam_utils.addNodeWithOptions(vehicle, pos, ntype, options)` | Ajoute un nœud au véhicule (table.insert dans vehicle.nodes) avec les champs de `options` copiés, plus cid, pos et ntype. | 29 |
| `jbeam_utils.addRotator(vehicle, wheelKey, wheel)` | Prépare un rotator (roue sans pneu) : frictionCoef vaut 1 par défaut ; collecte les nœuds des groupes _group_nodes et _rotatorGroup_nodes dans wheel.nodes (références vers vehicle.nodes). *(interne)* | 104 |
| `jbeam_utils.getFlexbodyPosRotAfterNodeRotateOffsetMove(jbeamData, x, y, z, rx, ry, rz)` | Position et rotation (degrés, rx/ry/rz) d'un flexbody après application des transformations nodeRotate/nodeOffset/nodeMove. Sans transformation (opCount == 0) ne renvoie rien (nil). Sans rotation, renvoie seulement x, y, z décalés. | 281 |
| `jbeam_utils.getPosAfterNodeRotateOffsetMove(jbeamData, x, y, z)` | Position (x, y, z) après application des transformations nodeRotate / nodeOffset / nodeMove contenues dans jbeamData. Sans transformation, renvoie x, y, z inchangés. | 267 |
| `jbeam_utils.getPosRotBeforeNodeRotateOffsetMove(jbeamData, x, y, z, rx, ry, rz)` | Opération inverse : retrouve la position et la rotation d'origine (avant nodeRotate/nodeOffset/nodeMove) à partir de valeurs transformées. Teste les signes de x (1, 0, puis -1) car nodeOffset dépend du signe de posX. | 300 |
| `jbeam_utils.increaseMax(vehicle, name)` | Réserve le prochain identifiant : renvoie vehicle.maxIDs[name] (0 si nil) puis incrémente le compteur. | 23 |
| `jbeam_utils.stringBufferDecode(buf)` | Décode la valeur en tête d'un string.buffer SANS la consommer (buf:peekdecode()). | 343 |
| `jbeam_utils.stringBufferEncode(data)` | Encode data avec string.buffer (buf:encode) dans un nouveau buffer et le renvoie (format binaire LuaJIT). | 337 |

### Détail des paramètres

#### `jbeam_utils.addBeam(vehicle, id1, id2)`

addBeamWithOptions de type NORMALTYPE (0) avec les options du véhicule.

- `vehicle` (*table*) : véhicule en construction
- `id1` (*integer|string*) : premier nœud
- `id2` (*integer|string*) : second nœud
- **renvoie** : table|nil poutre créée

#### `jbeam_utils.addBeamWithOptions(vehicle, id1, id2, beamType, options, id3)`

Ajoute une poutre entre deux nœuds existants avec les options copiées, plus cid, id1, id2 (cid des nœuds) et beamType. Avec id3, crée une poutre en L (BEAM_LBEAM). Renvoie nil avec un avertissement si un nœud est introuvable.

- `vehicle` (*table*) : véhicule en construction
- `id1` (*integer|string|nil*) : premier nœud (clé dans vehicle.nodes ; nil = options.id1)
- `id2` (*integer|string|nil*) : second nœud (nil = options.id2)
- `beamType` (*integer*) : type de poutre (0 normale, 1 anisotrope, 3 pressurisée, 7 soutien… valeurs du moteur C)
- `options` (*table|nil*) : options de la poutre (beamSpring, beamDamp, beamStrength…)
- `id3` (*integer|string|nil*) : troisième nœud pour une poutre en L
- **renvoie** : table|nil poutre créée (avec cid), nil si échec

#### `jbeam_utils.addNode(vehicle, pos, ntype)`

addNodeWithOptions avec les options globales du véhicule (vehicle.options).

- `vehicle` (*table*) : véhicule en construction
- `pos` (*vec3*) : position
- `ntype` (*integer*) : type de nœud
- **renvoie** : integer cid du nœud créé

#### `jbeam_utils.addNodeWithOptions(vehicle, pos, ntype, options)`

Ajoute un nœud au véhicule (table.insert dans vehicle.nodes) avec les champs de `options` copiés, plus cid, pos et ntype.

- `vehicle` (*table*) : véhicule en construction
- `pos` (*vec3*) : position du nœud
- `ntype` (*integer*) : type de nœud (0 = NORMALTYPE, valeurs du moteur C)
- `options` (*table|nil*) : options à copier dans le nœud (nodeWeight, collision, group…)
- **renvoie** : integer cid du nœud créé

#### `jbeam_utils.addRotator(vehicle, wheelKey, wheel)`

Prépare un rotator (roue sans pneu) : frictionCoef vaut 1 par défaut ; collecte les nœuds des groupes _group_nodes et _rotatorGroup_nodes dans wheel.nodes (références vers vehicle.nodes).

- `vehicle` (*table*) : véhicule en construction
- `wheelKey` (*integer*) : indice du rotator (non utilisé)
- `wheel` (*table*) : définition du rotator (modifiée)

#### `jbeam_utils.getFlexbodyPosRotAfterNodeRotateOffsetMove(jbeamData, x, y, z, rx, ry, rz)`

Position et rotation (degrés, rx/ry/rz) d'un flexbody après application des transformations nodeRotate/nodeOffset/nodeMove. Sans transformation (opCount == 0) ne renvoie rien (nil). Sans rotation, renvoie seulement x, y, z décalés.

- `jbeamData` (*table*) : bloc jbeam avec les opérations
- `x` (*number*) : x
- `y` (*number*) : y
- `z` (*number*) : z
- `rx` (*number*) : rotation x (degrés)
- `ry` (*number*) : rotation y (degrés)
- `rz` (*number*) : rotation z (degrés)
- **renvoie** : number|nil x
- **renvoie** : number|nil y
- **renvoie** : number|nil z
- **renvoie** : number|nil rx (degrés), seulement s'il y a une rotation
- **renvoie** : number|nil ry
- **renvoie** : number|nil rz

#### `jbeam_utils.getPosAfterNodeRotateOffsetMove(jbeamData, x, y, z)`

Position (x, y, z) après application des transformations nodeRotate / nodeOffset / nodeMove contenues dans jbeamData. Sans transformation, renvoie x, y, z inchangés.

- `jbeamData` (*table*) : bloc jbeam contenant les clés nodeRotateN / nodeOffsetN / nodeMoveN
- `x` (*number*) : x d'origine
- `y` (*number*) : y d'origine
- `z` (*number*) : z d'origine
- **renvoie** : number x transformé
- **renvoie** : number y transformé
- **renvoie** : number z transformé

#### `jbeam_utils.getPosRotBeforeNodeRotateOffsetMove(jbeamData, x, y, z, rx, ry, rz)`

Opération inverse : retrouve la position et la rotation d'origine (avant nodeRotate/nodeOffset/nodeMove) à partir de valeurs transformées. Teste les signes de x (1, 0, puis -1) car nodeOffset dépend du signe de posX.

- `jbeamData` (*table*) : bloc jbeam avec les opérations
- `x` (*number*) : x transformé
- `y` (*number*) : y transformé
- `z` (*number*) : z transformé
- `rx` (*number*) : rotation x (degrés)
- `ry` (*number*) : rotation y (degrés)
- `rz` (*number*) : rotation z (degrés)
- **renvoie** : number x d'origine
- **renvoie** : number y d'origine
- **renvoie** : number z d'origine
- **renvoie** : number rx d'origine
- **renvoie** : number ry d'origine
- **renvoie** : number rz d'origine

#### `jbeam_utils.increaseMax(vehicle, name)`

Réserve le prochain identifiant : renvoie vehicle.maxIDs[name] (0 si nil) puis incrémente le compteur.

- `vehicle` (*table*) : véhicule en construction (doit avoir maxIDs)
- `name` (*string*) : nom du compteur ('nodes', 'beams', 'wheels'…)
- **renvoie** : integer identifiant réservé (cid)

#### `jbeam_utils.stringBufferDecode(buf)`

Décode la valeur en tête d'un string.buffer SANS la consommer (buf:peekdecode()).

- `buf` (*string.buffer*) : buffer produit par stringBufferEncode
- **renvoie** : any valeur décodée

#### `jbeam_utils.stringBufferEncode(data)`

Encode data avec string.buffer (buf:encode) dans un nouveau buffer et le renvoie (format binaire LuaJIT).

- `data` (*any*) : valeur encodable
- **renvoie** : string.buffer buffer contenant les données encodées

## Champs

| Champ | Type | Description |
|---|---|---|
| `ignoreSections` | table<string, boolean> | Sections jbeam ignorées par certains traitements : {maxIDs = true, options = true}. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jbeam/utils.lua`.*
