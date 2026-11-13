# `gameplay_skidpadTest`

*Fichier : `lua/ge/extensions/gameplay/skidpadTest.lua` · VM : Game Engine (GE) · 61 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_skidpadTest` : `extensions.load("gameplay_skidpadTest")`, puis la globale `gameplay_skidpadTest`

Extension de test de skidpad : téléporte un véhicule au point de départ « skidpadSpawn » puis lui fait suivre par l'IA le circuit défini par les waypoints skidpadWP1 à skidpadWP4 (2 tours). Utilise util_stepHandler pour enchaîner les étapes. Le niveau doit contenir ces objets de scène.

## Exemple

```lua
extensions.load('gameplay_skidpadTest')
gameplay_skidpadTest.startTest(be:getPlayerVehicleID(0))
```

## Remarques

- testResults n'est jamais renseigné par ce fichier : getData() renvoie toujours nil (remis à nil au démarrage).
- cancelTest ne fait que lever un drapeau cancelTestRequested qui n'est lu nulle part : l'annulation n'a aucun effet.
- startTest suppose que l'objet « skidpadSpawn » existe, sinon erreur Lua (spawnPoint nil).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_skidpadTest.cancelTest()` | Lève le drapeau d'annulation (sans effet réel, voir notes). | 53 |
| `gameplay_skidpadTest.getData()` | Renvoie les résultats du test (testResults). | 49 |
| `gameplay_skidpadTest.startTest(vehId)` | Lance la séquence : téléportation sûre du véhicule sur skidpadSpawn (orientation retournée de 180°), attente 0,2 s, puis ai.driveUsingPath sur les waypoints skidpadWP1..4, WP1 avec noOfLaps = 2 et aggression = 1. | 44 |

### Détail des paramètres

#### `gameplay_skidpadTest.getData()`

Renvoie les résultats du test (testResults).

- **renvoie** : table|nil Toujours nil dans cette version (jamais rempli).

#### `gameplay_skidpadTest.startTest(vehId)`

Lance la séquence : téléportation sûre du véhicule sur skidpadSpawn (orientation retournée de 180°), attente 0,2 s, puis ai.driveUsingPath sur les waypoints skidpadWP1..4, WP1 avec noOfLaps = 2 et aggression = 1.

- `vehId` (*integer*) : Identifiant du véhicule à tester.

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/skidpadTest.lua`.*
