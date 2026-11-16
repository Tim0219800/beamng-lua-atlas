# `editor_biomeTool`

*Fichier : `lua/ge/extensions/editor/biomeTool.lua` · VM : Game Engine (GE) · 3986 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_biomeTool` : `extensions.load("editor_biomeTool")`, puis la globale `editor_biomeTool`

Outil « Biome Tool » (mode d'édition « Edit Biome ») de l'éditeur de niveaux : génère de la végétation (objets Forest) et peint des matériaux de terrain par couches. Deux types de couches (terrain = 0, area = 1) ; les couches « area » contiennent des zones au lasso (inclusion/exclusion) ou par matériau de terrain. Chaque couche a des champs (densité de forêt, influence et plage de pente, falloff et densité de bordure, méthode de fusion Add/Replace/Delete, placement en champ avec distance/rangées/orientation, zone aléatoire par bruit RA_*, placement sur les bords EP_*). L'outil s'appuie sur ForestBrushTool et les brosses de forêt. Les couches sont lues dans <niveau>/art/biomeTool/biomeTool.json à l'initialisation et réécrites après chaque sauvegarde du niveau.

## Remarques

- Presque tout le fichier est local (140 fonctions locales) ; l'API exportée se limite à 5 hooks. La table « var » est l'état interne de l'outil, pas une classe exposée ; ses méthodes get/setEP* sont listées dans classes.var pour référence.
- Bug : M.onExtensionLoaded = onExtensionLoaded référence une variable jamais définie dans le fichier : le champ exporté vaut nil.
- Si aucun objet Forest n'existe, onEditorGui ouvre une fenêtre modale « NoForestObjDialog » proposant d'en créer un (worldEditorCppApi.createObject('Forest'), nommé « theForest »).
- Au chargement et à la sauvegarde, le chemin du niveau est déduit de getMissionFilename() (deuxième segment du chemin) ; le fichier biomeTool.json est supprimé puis réécrit seulement s'il existe au moins une couche.
- Les fonctions var.setEP* renvoient parfois fieldInfo.val (valeur par défaut du modèle) lorsqu'elles créent le champ, et nil sinon : valeur de retour peu fiable, à ignorer.
- var.setEPRandomTiltRange modifie la table passée en paramètre (range est réutilisée comme slopeRangeValid).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_biomeTool.onEditorAfterSaveLevel()` | Hook appelé après la sauvegarde du niveau : écrit les couches (var.layers) dans <niveau>/art/biomeTool/biomeTool.json (ancien fichier supprimé d'abord). Ne fait rien si aucune couche. *(interne)* *(hook)* | 3962 |
| `editor_biomeTool.onEditorGui()` | Appelé chaque frame de l'éditeur. Ne fait rien hors du mode « Edit Biome ». Sinon vérifie la présence d'un objet Forest (dialogue de création sinon) et dessine l'interface (onglets Level Biome / Biome Areas), le lasso, les zones et les animations de mise en évidence. *(interne)* *(hook)* | 3623 |
| `editor_biomeTool.onEditorInitialized()` | Initialisation : charge biomeTool.json du niveau s'il existe, remplit la liste des brosses de forêt et des matériaux, enregistre le mode d'édition biomeEditMode (icône biome_tool), la fenêtre « biomeTool » (500x560), la fenêtre modale NoForestObjDialog et les éditeurs de champs personnalisés (TerrainMaterial, BlendingMethod, SlopeRange, VegetationFalloff, FieldPlacement, RA_Map). *(interne)* *(hook)* | 3903 |
| `editor_biomeTool.onEditorToolWindowGotFocus(windowName)` | Hook : quand la fenêtre « biomeTool » prend le focus, active le mode d'édition biomeEditMode. *(interne)* *(hook)* | 3956 |
| `editor_biomeTool.onEditorToolWindowHide(windowName)` | Hook : quand la fenêtre « biomeTool » est masquée, repasse en mode d'édition objectSelect. *(interne)* *(hook)* | 3950 |

### Détail des paramètres

#### `editor_biomeTool.onEditorToolWindowGotFocus(windowName)`

Hook : quand la fenêtre « biomeTool » prend le focus, active le mode d'édition biomeEditMode.

- `windowName` (*string*) : Nom de la fenêtre qui a pris le focus.

#### `editor_biomeTool.onEditorToolWindowHide(windowName)`

Hook : quand la fenêtre « biomeTool » est masquée, repasse en mode d'édition objectSelect.

- `windowName` (*string*) : Nom de la fenêtre masquée.

## Champs

| Champ | Type | Description |
|---|---|---|
| `onExtensionLoaded` | nil | Vaut nil : référence à une variable jamais définie dans le fichier. ⚠ référence `onExtensionLoaded` non définie dans le fichier (vaut probablement nil) |

## Classe `var`

Table d'état interne de l'outil (couches, zones, lasso, brosses de forêt, file de génération). Seules quelques méthodes d'accès aux champs « edge placement » et aux bornes sont définies dessus ; layerType vaut 0 (terrain), 1 (area) ou 2 (any, dans les modèles de champs).

| Méthode | Description | Ligne |
|---|---|---|
| `var.getEPFalloff(layerType, layerID)` | Renvoie l'atténuation de bordure (EP_BorderFalloff, -10 à 10) d'une couche ; crée le champ avec la valeur par défaut (0.0) s'il manque. | 1473 |
| `var.getEPItemDistance(layerType, layerID)` | Renvoie la distance entre objets pour le placement sur les bords (EP_ItemDistance, -10 à 10, défaut 1) ; crée le champ s'il manque. | 1516 |
| `var.getEPRandomTiltRange(layerType, layerID)` | Renvoie la plage d'inclinaison aléatoire (champ EP_RandomTilt) d'une couche ; {-5, 5} par défaut si la couche n'a pas ce champ. | 1431 |
| `var.getFieldMinMax(layerType, layerID, fieldName)` | Renvoie les bornes {min, max} d'un champ du modèle fieldInfoTemplate pour ce type de couche ; {0, 0} si introuvable. | 1421 |
| `var.setEPFalloff(layerType, layerID, val)` | Fixe EP_BorderFalloff d'une couche, bornée aux minValue/maxValue du champ ; crée le champ s'il manque. | 1494 |
| `var.setEPItemDistance(layerType, layerID, val)` | Fixe EP_ItemDistance d'une couche, bornée à -10..10 ; crée le champ s'il manque. | 1537 |
| `var.setEPRandomTiltRange(layerType, layerID, range)` | Fixe la plage EP_RandomTilt d'une couche, bornée à -40..40 ; crée le champ s'il manque. La table passée est modifiée. | 1447 |

## Appels vers le moteur (C++)

- `Engine.` `castRay`
- `FS:` `fileExists`, `removeFile`
- `debugDrawer:` `drawLineInstance`, `drawSphere`
- `obj:` `getClassName`, `getId`, `getInternalName`
- `scenetree.` `findClassObjects`, `findObject`
- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/biomeTool.lua`.*
