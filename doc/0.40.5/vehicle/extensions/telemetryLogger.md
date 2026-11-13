# `telemetryLogger`

*Fichier : `lua/vehicle/extensions/telemetryLogger.lua` · VM : Véhicule · 87 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetryLogger` : `extensions.load (VM véhicule)("telemetryLogger")`, puis la globale `telemetryLogger`

Enregistreur de télémétrie simple : à chaque frame graphique (quand l'enregistrement est actif) il mémorise timestamp, position, vitesse, gaz, frein, direction, frein à main et forces G (sensors.gx2/gy2), puis saveDataToDisk écrit le tout dans un fichier CSV `telemetryData_HH-MM-SS.csv`. Pratique pour un moddeur qui veut exporter une session de conduite.

## Exemple

```lua
extensions.load('telemetryLogger')
telemetryLogger.startRecording()
-- ... conduire ...
telemetryLogger.saveDataToDisk()
```

## Remarques

- Colonnes du CSV : frame, timestamp, position, velocity, throttle, brake, steering, parkingbrake, gForceX, gForceY. La position est une chaîne "(x,y,z)" (entre guillemets dans le CSV car elle contient des virgules). La ligne se termine par une virgule en trop ; fins de ligne \r\n.
- timestamp = somme des dt reçus (secondes de simulation), velocity = norme de obj:getVelocity() (m/s).
- Le fichier est créé avec un chemin relatif (répertoire de travail du jeu, pas un dossier utilisateur dédié). L'ordre des lignes vient de pairs() sur un tableau indexé, donc normalement croissant mais non garanti.
- saveDataToDisk arrête l'enregistrement, écrit, puis appelle onInit() qui vide les données. Il renvoie false si le fichier ne peut pas être ouvert (et dans ce cas n'efface pas les données) ; sinon il ne renvoie rien.
- escapeCSV plante si une valeur est nil (ex. sensors.gx2 absent).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetryLogger.onInit()` | Hook appelé à l'initialisation du véhicule : vide les données, remet l'index et le timestamp à zéro et arrête l'enregistrement. *(interne)* *(hook)* | 72 |
| `telemetryLogger.onReset()` | Hook appelé au reset du véhicule ; même fonction que onInit (efface les données et arrête l'enregistrement). *(interne)* *(hook)* | 72 |
| `telemetryLogger.saveDataToDisk()` | Arrête l'enregistrement et écrit les données collectées dans `telemetryData_<heure>.csv`, puis réinitialise l'état. | 40 |
| `telemetryLogger.startRecording()` | Active l'enregistrement : updateGFX ajoute un point de données à chaque frame. Ne remet pas les données à zéro (utiliser onInit/onReset ou saveDataToDisk pour cela). | 64 |
| `telemetryLogger.stopRecording()` | Suspend l'enregistrement sans vider les données déjà collectées. | 68 |
| `telemetryLogger.updateGFX(dt)` | Appelé à chaque frame graphique (extensions.hook('updateGFX')). Si l'enregistrement est actif, ajoute un point de données. *(interne)* | 13 |

### Détail des paramètres

#### `telemetryLogger.saveDataToDisk()`

Arrête l'enregistrement et écrit les données collectées dans `telemetryData_<heure>.csv`, puis réinitialise l'état.

- **renvoie** : boolean|nil false si le fichier n'a pas pu être ouvert, nil sinon.

#### `telemetryLogger.updateGFX(dt)`

Appelé à chaque frame graphique (extensions.hook('updateGFX')). Si l'enregistrement est actif, ajoute un point de données.

- `dt` (*number*) : Pas de temps en secondes, ajouté au timestamp.

## Appels vers le moteur (C++)

- `obj:` `getPosition`, `getVelocity`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/telemetryLogger.lua`.*
