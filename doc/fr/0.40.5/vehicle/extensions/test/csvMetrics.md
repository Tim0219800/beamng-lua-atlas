# `test_csvMetrics`

*Fichier : `lua/vehicle/extensions/test/csvMetrics.lua` · VM : Véhicule · 103 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `test_csvMetrics` : `extensions.load (VM véhicule)("test_csvMetrics")`, puis la globale `test_csvMetrics`

Outil de test : enregistre périodiquement des métriques du véhicule (temps, position, rotation quaternion, et en mode étendu températures, régime, carburant, vitesses, thermique des freins et des moteurs) dans un rapport CSV écrit avec csvlib à l'appel de disable(). Lit electrics.values et powertrain.getDevicesByType('combustionEngine').

## Exemple

```lua
extensions.load('test_csvMetrics')
test_csvMetrics.enable('metrics.csv', 64, nil)
-- ...
test_csvMetrics.disable() -- écrit le fichier
```

## Remarques

- Bug : `logExtendedMetrics = extended == nil and true or false` donne true seulement si extended est nil ; passer extended=true donne false (mode simple) et extended=false donne aussi false. Le mode étendu s'obtient donc en passant nil.
- Une ligne est écrite toutes les `rate` frames (frame % rate == 0), pas à intervalle de temps fixe ; la valeur par défaut est 64 frames. Le compteur de frames démarre à 1 et n'est remis à 1 que par disable().
- Le temps (colonne Time) est la somme des dt reçus, en secondes ; la température ambiante est convertie de K en °C (obj:getEnvTemperature() - 273.15) ; la rotation est le quaternion (x,y,z,w).
- En-tête : les colonnes thermiques moteur ne sont ajoutées que si device.thermals ~= nil, mais writeRow ajoute toujours 4 valeurs par moteur et indexe v.thermals sans test : erreur si un moteur n'a pas de thermals, et colonnes désalignées.
- Colonnes de roue : 3 colonnes par entrée de electrics.values.wheelThermals (BrakeCoreTemp, BrakeSurfaceTemp, BrakeThermalEfficiency) ; electrics.values.wheelThermals doit exister.
- csvFile n'est pas écrit tant que disable() n'est pas appelé ; disable() sans enable() préalable planterait (csvFile nil).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `test_csvMetrics.disable()` | Écrit le CSV accumulé sur disque (csvData:write(path)), désactive l'enregistrement et remet le compteur de frames à 1. | 95 |
| `test_csvMetrics.enable(path, writeRate, extended)` | Démarre l'enregistrement : mémorise le chemin de sortie, la cadence, construit l'en-tête du CSV (simple ou étendu) et active updateGFX. | 16 |
| `test_csvMetrics.updateGFX(dt)` | Appelé à chaque frame graphique (extensions.hook('updateGFX')). Si activé, cumule le temps et écrit une ligne toutes les `rate` frames. *(interne)* | 82 |

### Détail des paramètres

#### `test_csvMetrics.enable(path, writeRate, extended)`

Démarre l'enregistrement : mémorise le chemin de sortie, la cadence, construit l'en-tête du CSV (simple ou étendu) et active updateGFX.

- `path` (*string*) : Chemin du fichier CSV écrit par disable().
- `writeRate` (*integer|nil*) : Une ligne toutes les N frames ; 64 si nil.
- `extended` (*boolean|nil*) : nil = métriques étendues ; toute autre valeur = métriques simples (voir notes, comportement inversé).

#### `test_csvMetrics.updateGFX(dt)`

Appelé à chaque frame graphique (extensions.hook('updateGFX')). Si activé, cumule le temps et écrit une ligne toutes les `rate` frames.

- `dt` (*number*) : Pas de temps en secondes.

## Appels vers le moteur (C++)

- `obj:` `getEnvTemperature`, `getPosition`, `getRotation`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/test/csvMetrics.lua`.*
