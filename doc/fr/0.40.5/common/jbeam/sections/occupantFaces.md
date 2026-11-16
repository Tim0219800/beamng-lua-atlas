# `jbeam_sections_occupantFaces`

*Fichier : `lua/common/jbeam/sections/occupantFaces.lua` · VM : Commun (GE + véhicule) · 72 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jbeam/sections/occupantFaces")`

Gère les visages des occupants (têtes de personnages). Charge, une fois, les pièces du slot 'skin_character_face' du véhicule /vehicles/unicycle/ pour construire la liste de visages disponibles et le matériau associé à chacun (base 'character_display'). Fournit des utilitaires pour l'interface et le tirage aléatoire, et une étape process qui enregistre tous les matériaux de visage sur chaque prop 'character_head' d'un véhicule dont le système d'occupants est activé.

## Remarques

- Le matériau d'un visage est 'character_display.skin_character_face.<skinName>' si la pièce a skinName, sinon 'character_display'.
- getFaceOptions renvoie une table partagée (triée par label) : ne pas la modifier.
- getRandomFacePart plante si aucun visage n'est disponible (indice aléatoire sur une liste vide).
- process ne fait rien si vehicle.occupantSystem n'existe pas ou n'est pas enabled (voir jbeam/sections/occupantSlots) ; il pose prop.faceMaterialSwitch sur chaque tête.
- Les instances de matériau n'existent que pour les matériaux connus à la fin du chargement du véhicule, d'où l'enregistrement de tous les visages sur chaque tête.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jbeam_sections_occupantFaces.getFaceMaterial(partName)` | Matériau à utiliser pour un visage (matériau de base si la pièce est inconnue). | 43 |
| `jbeam_sections_occupantFaces.getFaceOptions()` | Liste des visages {value = nom de pièce, label = nom affiché}, triés par label. Table partagée à ne pas modifier. | 33 |
| `jbeam_sections_occupantFaces.getRandomFacePart()` | Nom d'une pièce de visage tirée au hasard. | 38 |
| `jbeam_sections_occupantFaces.isFacePart(partName)` | Indique si le nom de pièce est un visage connu. | 27 |
| `jbeam_sections_occupantFaces.process(vehicleObj, vehicle)` | Enregistre tous les matériaux de visage sur les têtes d'occupants du véhicule. *(interne)* | 49 |

### Détail des paramètres

#### `jbeam_sections_occupantFaces.getFaceMaterial(partName)`

Matériau à utiliser pour un visage (matériau de base si la pièce est inconnue).

- `partName` (*string*) : Nom de pièce de visage.
- **renvoie** : string Nom de matériau.

#### `jbeam_sections_occupantFaces.getFaceOptions()`

Liste des visages {value = nom de pièce, label = nom affiché}, triés par label. Table partagée à ne pas modifier.

- **renvoie** : table[] Options de visages.

#### `jbeam_sections_occupantFaces.getRandomFacePart()`

Nom d'une pièce de visage tirée au hasard.

- **renvoie** : string Nom de pièce.

#### `jbeam_sections_occupantFaces.isFacePart(partName)`

Indique si le nom de pièce est un visage connu.

- `partName` (*string*) : Nom de pièce.
- **renvoie** : boolean true si c'est un visage.

#### `jbeam_sections_occupantFaces.process(vehicleObj, vehicle)`

Enregistre tous les matériaux de visage sur les têtes d'occupants du véhicule.

- `vehicleObj` (*userdata*) : Objet véhicule moteur.
- `vehicle` (*table*) : Données jbeam (occupantSystem, props).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jbeam/sections/occupantFaces.lua`.*
