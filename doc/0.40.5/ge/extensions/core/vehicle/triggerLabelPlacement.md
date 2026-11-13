# `core_vehicle_triggerLabelPlacement`

*Fichier : `lua/ge/extensions/core/vehicle/triggerLabelPlacement.lua` · VM : Game Engine (GE) · 359 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_vehicle_triggerLabelPlacement` : `extensions.load("core_vehicle_triggerLabelPlacement")`, puis la globale `core_vehicle_triggerLabelPlacement`

Extension GE `core_vehicle_triggerLabelPlacement` : calcule où placer l'étiquette d'UI d'un trigger de véhicule (zones d'interaction jbeam) autour de sa boîte projetée à l'écran. Reconstruit la base (axes) du trigger à partir des noeuds idRef/idX/idY et de ses rotations (en reproduisant la séquence du code C++), en déduit les demi-dimensions, projette les 8 coins à l'écran et choisit le côté (droite, gauche, haut, bas) avec le plus de place. Fonctions utilitaires sans état persistant, utilisées par les outils d'UI/debug des triggers et par core_vehicle_vehicleTriggerHighlight.

## Remarques

- Les coordonnées d'écran sont des fractions 0..1 (worldToScreenPercent01 doit renvoyer une table {x, y} dans cet intervalle). Les tables renvoyées par computeForTrigger sont réutilisées d'un appel à l'autre (pas de copie) : l'appelant doit consommer ou copier le résultat tout de suite.
- Le côté est 'bottom' si la boîte projetée tient entièrement dans la zone centrale 15 %-85 % de l'écran ; sinon c'est le côté qui offre le plus d'espace libre.
- Taille du trigger : un nombre donne une sphère de demi-dimension |size| ; une table/vecteur est lue comme dimensions complètes (converties en demi-dimensions, défaut 0.2). Les angles dont la valeur dépasse 2π sont considérés comme des degrés.
- Si idRef/idX/idY sont absents ou dégénérés, la base retombe sur les axes monde (1,0,0), (0,1,0), (0,0,1).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_vehicle_triggerLabelPlacement.computeForTrigger(vehicleObj, triggerObj, triggerData, worldToScreenPercent01, p, centerWorld, centerScreen)` | Calcule le placement de l'étiquette d'un trigger : projette la boîte du trigger à l'écran et choisit le côté de l'étiquette avec sa position (labelX, labelY en fraction d'écran) et décalages CSS (labelTx, labelTy, avec 0.6em de marge). | 282 |
| `core_vehicle_triggerLabelPlacement.computeTriggerBasisAndHalfExtents(vehicleObj, triggerData)` | Renvoie la base orthonormée du trigger et ses demi-dimensions, partagées avec les dessins debug/surbrillance pour rester cohérentes avec le placement. | 352 |

### Détail des paramètres

#### `core_vehicle_triggerLabelPlacement.computeForTrigger(vehicleObj, triggerObj, triggerData, worldToScreenPercent01, p, centerWorld, centerScreen)`

Calcule le placement de l'étiquette d'un trigger : projette la boîte du trigger à l'écran et choisit le côté de l'étiquette avec sa position (labelX, labelY en fraction d'écran) et décalages CSS (labelTx, labelTy, avec 0.6em de marge).

- `vehicleObj` (*userdata*) : véhicule portant le trigger
- `triggerObj` (*userdata|nil*) : objet trigger (méthode getCenter) ; inutile si centerWorld est fourni
- `triggerData` (*table*) : données jbeam du trigger (idRef, idX, idY, size, baseRotation, rotation…)
- `worldToScreenPercent01` (*function|nil*) : fonction(posMonde, sortie) -> {x, y} en fractions d'écran
- `p` (*table|nil*) : profileur optionnel (méthode add) pour mesurer les étapes
- `centerWorld` (*vec3|nil*) : centre du trigger en repère monde (sinon triggerObj:getCenter())
- `centerScreen` (*table|nil*) : centre à l'écran, déjà calculé (sinon calculé via worldToScreenPercent01)
- **renvoie** : table|nil {labelX, labelY, labelTx, labelTy, labelSide ('right'|'left'|'top'|'bottom'), bounds = {minX, maxX, minY, maxY, centerX, centerY}} ; nil si la projection est impossible

#### `core_vehicle_triggerLabelPlacement.computeTriggerBasisAndHalfExtents(vehicleObj, triggerData)`

Renvoie la base orthonormée du trigger et ses demi-dimensions, partagées avec les dessins debug/surbrillance pour rester cohérentes avec le placement.

- `vehicleObj` (*userdata*) : véhicule portant le trigger
- `triggerData` (*table*) : données du trigger
- **renvoie** : vec3 axe X
- **renvoie** : vec3 axe Y
- **renvoie** : vec3 axe Z
- **renvoie** : number demi-dimension X
- **renvoie** : number demi-dimension Y
- **renvoie** : number demi-dimension Z

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/vehicle/triggerLabelPlacement.lua`.*
