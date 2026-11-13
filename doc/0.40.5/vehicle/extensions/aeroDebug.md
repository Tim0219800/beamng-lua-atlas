# `aeroDebug`

*Fichier : `lua/vehicle/extensions/aeroDebug.lua` · VM : Véhicule · 157 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `aeroDebug` : `extensions.load (VM véhicule)("aeroDebug")`, puis la globale `aeroDebug`

Extension de débogage aérodynamique pour l'établi (workbench) : mesure la force et le moment aérodynamiques totaux du véhicule autour de son centre de gravité, les exprime dans le repère du véhicule (droite, avant, haut) et estime la répartition de la portance (appui) entre essieu avant et arrière à partir des noms de roues fournis.

## Exemple

```lua
extensions.aeroDebug.setWheelNames('wheel_FL', 'wheel_FR', 'wheel_RL', 'wheel_RR')
extensions.aeroDebug.enable()
local d = extensions.aeroDebug.getAeroData()
print(d.frontDownForce, d.rearDownForce, d.percentFront)
```

## Remarques

- Champs de aeroData (renvoyé par getAeroData) : vehID, totalAeroForce, totalAeroTorque (moment physique, signe inversé par rapport à calcTotalAeroTorque), totalAeroForceVehicle/afX/afY/afZ (force dans le repère véhicule), totalAeroTorqueVehicle/aTX/aTY/aTZ ((tangage, roulis, lacet) : tangage positif nez vers le haut), frontDownForce, rearDownForce (appui par essieu, positif = appui, en N), percentFront, percentRear, wheelNameStrings (liste des roues après enable), wheelNameFL/FR/RL/RR, test (=100, valeur de test).
- Le calcul d'appui par essieu suppose un roulement libre (pas de force horizontale des pneus) : les hauteurs disparaissent, seule la distance longitudinale au CoG compte. Les pourcentages restent à 0 si la somme des appuis est <= 1 N.
- Anomalie : rearLeftWheelPos est affecté à la roue nommée wheelNameRR et rearRightWheelPos à wheelNameRL (inversion) ; sans effet car seule la moyenne des deux est utilisée.
- M.directionVector, M.directionVectorUp et M.directionVectorRight sont réécrits chaque frame par updateGFX (vecteurs avant, haut et droite).
- L'extension ne fait rien tant que enable() n'a pas été appelé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `aeroDebug.disable()` | Désactive le calcul et efface wheelNameStrings. | 142 |
| `aeroDebug.enable()` | Active le calcul et remplit wheelNameStrings avec les noms de toutes les roues si ce n'est pas déjà fait. | 132 |
| `aeroDebug.getAeroData()` | Renvoie la table aeroData courante (voir notes pour ses champs). | 121 |
| `aeroDebug.onInit()` | Hook d'initialisation : désactive le calcul. *(interne)* *(hook)* | 17 |
| `aeroDebug.setWheelNames(FL, FR, RL, RR)` | Indique les noms des quatre roues pour la répartition par essieu. | 125 |
| `aeroDebug.updateGFX(dt)` | Appelé chaque frame : si activé, calcule forces et moments aérodynamiques et la répartition d'appui avant/arrière. *(interne)* | 21 |

### Détail des paramètres

#### `aeroDebug.getAeroData()`

Renvoie la table aeroData courante (voir notes pour ses champs).

- **renvoie** : table Données aérodynamiques.

#### `aeroDebug.setWheelNames(FL, FR, RL, RR)`

Indique les noms des quatre roues pour la répartition par essieu.

- `FL` (*string*) : Nom de la roue avant gauche.
- `FR` (*string*) : Roue avant droite.
- `RL` (*string*) : Roue arrière gauche.
- `RR` (*string*) : Roue arrière droite.

#### `aeroDebug.updateGFX(dt)`

Appelé chaque frame : si activé, calcule forces et moments aérodynamiques et la répartition d'appui avant/arrière.

- `dt` (*number*) : Pas de temps en secondes (non utilisé).

## Appels vers le moteur (C++)

- `obj:` `calcCenterOfGravityRel`, `calcTotalAeroForces`, `calcTotalAeroTorque`, `getDirectionVector`, `getDirectionVectorUp`, `getID`, `getNodePosition`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/aeroDebug.lua`.*
