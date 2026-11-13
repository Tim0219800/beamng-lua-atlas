# `core_interAero`

*Fichier : `lua/ge/extensions/core/interAero.lua` · VM : Game Engine (GE) · 608 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_interAero` : `extensions.load("core_interAero")`, puis la globale `core_interAero`

Extension GE `core_interAero` : simule les interactions aérodynamiques ENTRE véhicules (aspiration / slipstream, « bump drafting » et effet de côté). À chaque image de simulation, pour chaque paire de véhicules en mouvement, il calcule un vent local (vec3, en m/s) à appliquer à chaque véhicule via `veh:setWindAero(x, y, z)`. L'extension n'a pas d'API publique à appeler : elle s'exécute seule dans onUpdate et ses réglages sont des constantes locales. Un moddeur la lit pour comprendre ou reproduire l'effet.

## Remarques

- Trois effets, avec constantes en tête de fichier : slipstream (vert) : sillage derrière un véhicule, portée 1,5 s de vitesse (slipSec) depuis 0,5 m derrière le pare-chocs avant, largeur latérale pleine +0,5 m et nulle à +3 m de part et d'autre de la largeur du véhicule, force 0,5 x vitesse du véhicule de devant pondérée par couverture et distance ; bump drafting (bleu) : air lissé juste devant un véhicule qui en suit un autre de très près, portée 0,065 s de vitesse, latéral +0,4 m, force 0,17 ; side drafting (rouge) : véhicules côte à côte, portée latérale +1,25 m, force 0,12, contribution par côté 0,85, effet de FREINAGE (vent = -0,12 x vitesse du véhicule x facteur).
- Seuls les véhicules allant à plus de 2 m/s (velLen >= 2) créent des effets ; la vitesse est déduite de la variation de position du centre de la boîte englobante (getSpawnWorldOOBBCenterXYZ) d'une image à l'autre, et remise à zéro en cas de téléportation (accélération supérieure à 40 g = 392 m/s²).
- Le vent calculé n'est envoyé au véhicule que si le changement dépasse 0,28 m/s (distance au dernier vent envoyé), pour économiser les appels. Aucun calcul si dtSim <= 0,0001 (pause).
- Les données par véhicule (vehicles[vehId]) sont mises en cache et vidées par onVehicleActiveChanged, onVehicleSpawned et onVehicleDestroyed (le cache doit changer quand un véhicule est remplacé par un autre).
- Outils de debug internes (debugDrawEnabled, profilerType, debugSpeed, mouseWidth) : désactivés par défaut ; le dessin de debug montre les zones d'effet en vert, bleu et rouge.
- Incohérences repérées : (1) dans l'effet de côté GAUCHE, `coverage / 0.5*sideReach` est évalué comme (coverage / 0.5) * sideReach alors que le côté DROIT utilise `coverage / (0.5*sideReach + 1e-30)` : les deux côtés n'ont donc pas la même normalisation (la valeur gauche est environ 6,25 fois plus forte avant clamp à 1) ; (2) dzLongCurve et dzLooongCurve appellent linearCurve avant sa définition locale (elles résoudraient une globale nil) mais ne sont jamais utilisées ; (3) un commentaire dans le code demande de retirer le code de profilage avant publication.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_interAero.onUpdate(dtReal, dtSim, dtRaw)` | Hook par image : calcule les effets aérodynamiques inter-véhicules (calculateAero) à partir de dtSim et applique le vent résultant à chaque véhicule actif par setWindAero. *(interne)* *(hook)* | 563 |
| `core_interAero.onVehicleActiveChanged(vehId)` | Hook : un véhicule est devenu actif ou inactif. Supprime son entrée du cache pour qu'elle soit recalculée. *(interne)* *(hook)* | 260 |
| `core_interAero.onVehicleDestroyed(vehId)` | Hook à la destruction d'un véhicule : vide son entrée de cache. *(interne)* *(hook)* | 260 |
| `core_interAero.onVehicleSpawned(vehId)` | Hook à la création d'un véhicule : vide son entrée de cache (nécessaire quand un véhicule en remplace un autre avec le même id). *(interne)* *(hook)* | 260 |

### Détail des paramètres

#### `core_interAero.onUpdate(dtReal, dtSim, dtRaw)`

Hook par image : calcule les effets aérodynamiques inter-véhicules (calculateAero) à partir de dtSim et applique le vent résultant à chaque véhicule actif par setWindAero.

- `dtReal` (*number*) : Delta temps réel en secondes (utilisé pour le clignotement du debug).
- `dtSim` (*number*) : Delta temps de simulation en secondes ; sert à estimer les vitesses.
- `dtRaw` (*number*) : Delta temps brut (non utilisé).

#### `core_interAero.onVehicleActiveChanged(vehId)`

Hook : un véhicule est devenu actif ou inactif. Supprime son entrée du cache pour qu'elle soit recalculée.

- `vehId` (*integer*) : Id du véhicule.

#### `core_interAero.onVehicleDestroyed(vehId)`

Hook à la destruction d'un véhicule : vide son entrée de cache.

- `vehId` (*integer*) : Id du véhicule.

#### `core_interAero.onVehicleSpawned(vehId)`

Hook à la création d'un véhicule : vide son entrée de cache (nécessaire quand un véhicule en remplace un autre avec le même id).

- `vehId` (*integer*) : Id du véhicule.

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/interAero.lua`.*
