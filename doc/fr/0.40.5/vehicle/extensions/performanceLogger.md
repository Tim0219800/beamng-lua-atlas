# `performanceLogger`

*Fichier : `lua/vehicle/extensions/performanceLogger.lua` · VM : Véhicule · 63 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `performanceLogger` : `extensions.load (VM véhicule)("performanceLogger")`, puis la globale `performanceLogger`

Petit outil de profilage : mesure des durées en millisecondes avec HighPerfTimer, soit une mesure unique (startMeasurement / stopMeasurement), soit une moyenne sur N mesures écrite dans le log (measureAverage).

## Exemple

```lua
local pl = extensions.performanceLogger
pl.startMeasurement('monCode')
-- ... code à mesurer ...
pl.measureAverage('monCode', 100)  -- log après 100 mesures
```

## Remarques

- measureAverage arrête le chronomètre nommé, accumule, puis après stopCount mesures écrit un log 'name: x ms (avg over N measurements)' et réinitialise l'accumulation. Il faut rappeler startMeasurement avant chaque mesure (il remet le chronomètre à zéro).
- showMin = true affiche le minimum des moyennes déjà observées au lieu de la moyenne courante.
- Anomalie : le résultat est mis en forme avec '%.5f' à partir d'une chaîne (tostring) ; fonctionne grâce à la conversion de chaîne numérique de LuaJIT.
- Les noms mal orthographiés sont tels quels dans le code : stopAvergage (sans 'a' avant 'g').
- measureAverage/stopMeasurement lèvent une erreur Lua si startMeasurement n'a pas été appelé avec ce nom.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `performanceLogger.measureAverage(name, stopCount, showMin)` | Arrête le chronomètre, ajoute la mesure à la moyenne et, après stopCount mesures, écrit la moyenne dans le log. | 28 |
| `performanceLogger.onInit()` | Hook d'initialisation : efface chronomètres et mesures. *(interne)* *(hook)* | 48 |
| `performanceLogger.onReset()` | Même fonction que onInit. *(interne)* *(hook)* | 48 |
| `performanceLogger.startMeasurement(name)` | Crée (ou remet à zéro) le chronomètre nommé. | 12 |
| `performanceLogger.stopAvergage(name)` | Termine la moyenne nommée et renvoie la moyenne accumulée (supprime le chronomètre). | 22 |
| `performanceLogger.stopMeasurement(name)` | Arrête le chronomètre et renvoie la durée mesurée. | 41 |

### Détail des paramètres

#### `performanceLogger.measureAverage(name, stopCount, showMin)`

Arrête le chronomètre, ajoute la mesure à la moyenne et, après stopCount mesures, écrit la moyenne dans le log.

- `name` (*string*) : Nom de la mesure.
- `stopCount` (*integer*) : Nombre de mesures avant affichage.
- `showMin` (*boolean|nil*) : Afficher le minimum des moyennes.

#### `performanceLogger.startMeasurement(name)`

Crée (ou remet à zéro) le chronomètre nommé.

- `name` (*string*) : Nom de la mesure.

#### `performanceLogger.stopAvergage(name)`

Termine la moyenne nommée et renvoie la moyenne accumulée (supprime le chronomètre).

- `name` (*string*) : Nom de la mesure.
- **renvoie** : number Moyenne en millisecondes.

#### `performanceLogger.stopMeasurement(name)`

Arrête le chronomètre et renvoie la durée mesurée.

- `name` (*string*) : Nom de la mesure.
- **renvoie** : number Durée en millisecondes.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/performanceLogger.lua`.*
