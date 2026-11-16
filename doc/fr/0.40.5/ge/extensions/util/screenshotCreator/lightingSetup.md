# `util_screenshotCreator_lightingSetup`

*Fichier : `lua/ge/extensions/util/screenshotCreator/lightingSetup.lua` · VM : Game Engine (GE) · 939 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_lightingSetup` : `extensions.load("util_screenshotCreator_lightingSetup")`, puis la globale `util_screenshotCreator_lightingSetup`

Prépare l'éclairage de studio pour les vignettes de véhicules et le remet en état ensuite. Il retrouve dans la scène (scenetree) les objets marqués par le champ dynamique thumbnailRole : des SpotLight (rôles key, fill, rim, top, groundFill, horizonFill) et des TSStatic « lightplane » servant de cartes de réflexion (horizonCard, shoulderCard, topCard, cameraCard). adjust() les place autour du véhicule en fonction de la caméra et de la boîte englobante, règle leur intensité en lux, applique une correction d'exposition, ajuste le SSAO, affiche ou masque le marquage de parking (champ thumbnailLayer = parkingMarkup) et cache les occupants du véhicule. restore() annule tout (transformations, champs de lumière, visibilité).

## Remarques

- adjust() commence par restore() ; il renvoie false (et restaure) à la moindre erreur. Appeler restore() après la capture est donc obligatoire (job.lua le fait).
- Les réglages viennent de util_screenshotCreator_settings.getLightingRig() : enabled, roles, exposureCorrection, ssaoMode, parkingMarkup.
- Si le rig est désactivé, seuls les projecteurs existants proches du véhicule sont ajustés (plans de spots), plus les cartes, le SSAO, le marquage et les occupants.
- Une correction d'exposition vise 850 lx au total sur les faces visibles du véhicule, avec un gain borné entre 0,5 et 2 ; seuls key, fill, rim et top sont modifiés.
- Chaque rôle ne peut être pris que par un seul objet : les doublons ou objets de mauvaise classe sont ignorés avec un avertissement dans le journal (tag screenshotCreatorLighting).
- selfCheck() est exécuté une fois au premier adjust ; une assertion échouée lèverait une erreur Lua.

**Dépendances (chargées avant) :** `util_screenshotCreator_settings`, `util_screenshotCreator_vehicleSetup`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_lightingSetup.adjust(vehicle, camera)` | Met en place l'éclairage de capture pour ce véhicule et cette caméra : projecteurs du rig, cartes de réflexion, SSAO, marquage de parking, masquage des occupants, et activation du masque de rendu des cartes sur la vue principale. | 876 |
| `util_screenshotCreator_lightingSetup.clearMarkupTags()` | Efface le champ thumbnailLayer de tous les objets de marquage de parking. | 719 |
| `util_screenshotCreator_lightingSetup.getMarkupCount()` | Compte les objets de la scène marqués thumbnailLayer = parkingMarkup. | 714 |
| `util_screenshotCreator_lightingSetup.hideReflectionCardsForTechCapture()` | Cache temporairement les cartes de réflexion actives (setHidden et setRenderEnabled(false)) pour une capture « Tech ». À rappeler avec restoreReflectionCardsAfterTechCapture. | 295 |
| `util_screenshotCreator_lightingSetup.restore()` | Annule tous les changements faits par adjust : masque de vue, SSAO, marquage, occupants, cartes de réflexion et lumières (transformation et champs intensity, innerAngle, outerAngle, range, castShadows). Les états non restaurés sont conservés pour une nouvelle tentative. | 334 |
| `util_screenshotCreator_lightingSetup.restoreReflectionCardsAfterTechCapture()` | Rétablit la visibilité d'origine des cartes cachées par hideReflectionCardsForTechCapture. | 260 |
| `util_screenshotCreator_lightingSetup.selfCheck()` | Test interne par assertions sur la géométrie des cartes (direction, transformation, côté arrière, rotation autour de l'axe vertical). *(interne)* | 548 |

### Détail des paramètres

#### `util_screenshotCreator_lightingSetup.adjust(vehicle, camera)`

Met en place l'éclairage de capture pour ce véhicule et cette caméra : projecteurs du rig, cartes de réflexion, SSAO, marquage de parking, masquage des occupants, et activation du masque de rendu des cartes sur la vue principale.

- `vehicle` (*table*) : Objet véhicule à photographier.
- `camera` (*table*) : Caméra résolue : {pos = vec3, rot = quat, ...} (résultat du cadrage).
- **renvoie** : boolean true si tout a été appliqué, false en cas d'échec (l'état est alors restauré).

#### `util_screenshotCreator_lightingSetup.clearMarkupTags()`

Efface le champ thumbnailLayer de tous les objets de marquage de parking.

- **renvoie** : integer Nombre d'objets dont le tag a été effacé.

#### `util_screenshotCreator_lightingSetup.getMarkupCount()`

Compte les objets de la scène marqués thumbnailLayer = parkingMarkup.

- **renvoie** : integer Nombre d'objets de marquage.

#### `util_screenshotCreator_lightingSetup.hideReflectionCardsForTechCapture()`

Cache temporairement les cartes de réflexion actives (setHidden et setRenderEnabled(false)) pour une capture « Tech ». À rappeler avec restoreReflectionCardsAfterTechCapture.

- **renvoie** : boolean false si un masquage est déjà en cours (appel imbriqué) ou en cas d'erreur (visibilité restaurée).

#### `util_screenshotCreator_lightingSetup.restore()`

Annule tous les changements faits par adjust : masque de vue, SSAO, marquage, occupants, cartes de réflexion et lumières (transformation et champs intensity, innerAngle, outerAngle, range, castShadows). Les états non restaurés sont conservés pour une nouvelle tentative.

- **renvoie** : boolean true si tout a été restauré exactement.

#### `util_screenshotCreator_lightingSetup.restoreReflectionCardsAfterTechCapture()`

Rétablit la visibilité d'origine des cartes cachées par hideReflectionCardsForTechCapture.

- **renvoie** : boolean true si toutes les cartes ont retrouvé leur état.

#### `util_screenshotCreator_lightingSetup.selfCheck()`

Test interne par assertions sur la géométrie des cartes (direction, transformation, côté arrière, rotation autour de l'axe vertical).

- **renvoie** : boolean Toujours true (sinon une assertion échoue).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant : util_screenshotCreator_settings et util_screenshotCreator_vehicleSetup. |
| `onClientEndMission` | function | Alias de M.restore : restaure l'éclairage à la fin du niveau. |
| `onExit` | function | Alias de M.restore : restaure l'éclairage à la fermeture du jeu. |
| `onExtensionUnloaded` | function | Alias de M.restore : restaure l'éclairage au déchargement de l'extension. |

## Appels vers le moteur (C++)

- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`, `getAllObjects`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/lightingSetup.lua`.*
