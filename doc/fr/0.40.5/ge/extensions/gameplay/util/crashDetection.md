# `gameplay_util_crashDetection`

*Fichier : `lua/ge/extensions/gameplay/util/crashDetection.lua` · VM : Game Engine (GE) · 770 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_util_crashDetection` : `extensions.load("gameplay_util_crashDetection")`, puis la globale `gameplay_util_crashDetection`

Détecteur de collisions (« crashes ») pour des véhicules suivis. Il compare à chaque image les dégâts du véhicule (map.objects[id].damage et somme des dégâts de sections) à un seuil qui baisse quand la secousse (jerk d'accélération avant/arrière) augmente, regroupe les impacts proches en un crash, puis émet des hooks. Un moddeur ajoute un véhicule avec addTrackedVehicleById() et écoute onVehicleCrashStarted / onVehicleCrashEnded (utilisé notamment par les missions et le gameplay de dégâts). Dépend de gameplay_util_damageAssessment pour décrire les zones endommagées.

## Exemple

```lua
gameplay_util_crashDetection.addTrackedVehicleById(be:getPlayerVehicleID(0), {minDamage = 150, enableImpactLocationData = true}, "monMod")
local function onVehicleCrashEnded(data) dump(data.totalDamage, data.vehId) end
```

## Remarques

- Hooks émis : onVehicleCrashStarted({vehId, vehImpactPos, vehImpactSpeed}) au premier impact d'un crash ; onNewImpactStarted({newImpactData}) pour les impacts suivants du même crash ; onVehicleCrashEnded({impacts, sanitizedData = {touchedVehIds, initialImpactPos, initialImpactSpeed}, totalDamage, vehId}).
- Constantes internes : seuil de dégâts par image 40, fin de crash après 1,8 s sans nouvel impact (ou vitesse < minVelocity), durée maximale d'un impact 0,3 s.
- Valeurs par défaut de crashSettings : minAccel 0, maxAccel 100, minDamage 150, maxDamage 5000, verticallyUnweighted false, minVelocity 1, groupImpactsDist 1 (minimum 0,1), enableImpactLocationData false. La table passée en argument est modifiée sur place.
- addTrackedVehicleById ne fait rien (sans log) si l'id est nil/négatif ou si le véhicule est absent de map.objects ou de l'arbre de scène ; il ne vérifie pas si le véhicule est déjà suivi et réinitialise alors ses données.
- Le véhicule est retiré automatiquement de la liste s'il disparaît de map.objects ou sur onVehicleDestroyed.
- Le mode debug (setDebug(true)) dessine des sphères/textes et ouvre une fenêtre ImGui de graphiques.
- onSerialize/onDeserialized sérialisent toute la table trackedVehIds, y compris des pointeurs ImGui de debug.

**Dépendances (chargées avant) :** `gameplay_util_damageAssessment`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_util_crashDetection.addTrackedVehicleById(vehId_, crashSettings, owner)` | Commence à suivre un véhicule pour détecter ses crashes, avec des réglages de sensibilité optionnels. | 633 |
| `gameplay_util_crashDetection.isVehCrashing(vehId)` | Indique si un véhicule suivi est actuellement en crash. | 728 |
| `gameplay_util_crashDetection.isVehTracked(vehId)` | Indique si le véhicule est dans la liste de suivi. | 733 |
| `gameplay_util_crashDetection.onDeserialized(data)` | Hook appelé après rechargement : restaure l'état sérialisé. *(interne)* *(hook)* | 745 |
| `gameplay_util_crashDetection.onSerialize()` | Hook appelé lors du rechargement des extensions Lua : renvoie l'état (véhicules suivis, debug). *(interne)* *(hook)* | 737 |
| `gameplay_util_crashDetection.onUpdate(dtReal, _dtSim)` | Hook appelé à chaque image : met à jour accélérations, détection d'impacts, fin de pré-impact/impact/crash pour chaque véhicule suivi ; supprime ceux qui n'existent plus. *(interne)* *(hook)* | 599 |
| `gameplay_util_crashDetection.onVehicleDestroyed(vehId)` | Hook appelé à la destruction d'un véhicule : le retire du suivi. *(interne)* *(hook)* | 751 |
| `gameplay_util_crashDetection.removeTrackedVehicleById(vehId)` | Arrête de suivre un véhicule. | 718 |
| `gameplay_util_crashDetection.resetCrashData(vehId)` | Réinitialise les données de crash, d'impact en cours et de pré-impact d'un véhicule suivi (sans le retirer). | 73 |
| `gameplay_util_crashDetection.setDebug(_debug)` | Active ou désactive le dessin de debug et la fenêtre ImGui. | 724 |

### Détail des paramètres

#### `gameplay_util_crashDetection.addTrackedVehicleById(vehId_, crashSettings, owner)`

Commence à suivre un véhicule pour détecter ses crashes, avec des réglages de sensibilité optionnels.

- `vehId_` (*integer*) : Id du véhicule.
- `crashSettings` (*table|nil*) : minAccel, maxAccel, minDamage, maxDamage, verticallyUnweighted, minVelocity (m/s), groupImpactsDist (m), enableImpactLocationData.
- `owner` (*string|nil*) : Nom de l'appelant, pour le debug (« unknown » par défaut).

#### `gameplay_util_crashDetection.isVehCrashing(vehId)`

Indique si un véhicule suivi est actuellement en crash.

- `vehId` (*integer*) : Id du véhicule.
- **renvoie** : boolean false si non suivi.

#### `gameplay_util_crashDetection.isVehTracked(vehId)`

Indique si le véhicule est dans la liste de suivi.

- `vehId` (*integer*) : Id du véhicule.
- **renvoie** : boolean 

#### `gameplay_util_crashDetection.onDeserialized(data)`

Hook appelé après rechargement : restaure l'état sérialisé.

- `data` (*table*) : Table renvoyée par onSerialize.

#### `gameplay_util_crashDetection.onSerialize()`

Hook appelé lors du rechargement des extensions Lua : renvoie l'état (véhicules suivis, debug).

- **renvoie** : table {trackedVehIds, debug, debugDamageAssessmentUIPtr}

#### `gameplay_util_crashDetection.onUpdate(dtReal, _dtSim)`

Hook appelé à chaque image : met à jour accélérations, détection d'impacts, fin de pré-impact/impact/crash pour chaque véhicule suivi ; supprime ceux qui n'existent plus.

- `dtReal` (*number*) : Delta temps réel (s), inutilisé.
- `_dtSim` (*number*) : Delta temps simulé (s).

#### `gameplay_util_crashDetection.onVehicleDestroyed(vehId)`

Hook appelé à la destruction d'un véhicule : le retire du suivi.

- `vehId` (*integer*) : Id du véhicule détruit.

#### `gameplay_util_crashDetection.removeTrackedVehicleById(vehId)`

Arrête de suivre un véhicule.

- `vehId` (*integer*) : Id du véhicule.

#### `gameplay_util_crashDetection.resetCrashData(vehId)`

Réinitialise les données de crash, d'impact en cours et de pré-impact d'un véhicule suivi (sans le retirer).

- `vehId` (*integer*) : Id du véhicule.

#### `gameplay_util_crashDetection.setDebug(_debug)`

Active ou désactive le dessin de debug et la fenêtre ImGui.

- `_debug` (*boolean*) : true pour activer.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"gameplay_util_damageAssessment"} |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onNewImpactStarted`
- `onVehicleCrashEnded` — écouté par 2 module(s)
- `onVehicleCrashStarted` — écouté par 2 module(s)

## Appels vers le moteur (C++)

- `be:` `getObjectByID`
- `debugDrawer:` `drawSphere`, `drawText`, `drawTextAdvanced`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/util/crashDetection.lua`.*
