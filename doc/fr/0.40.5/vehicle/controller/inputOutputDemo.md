# `controller_inputOutputDemo`

*Fichier : `lua/vehicle/controller/inputOutputDemo.lua` · VM : Véhicule · 152 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `inputOutputDemo` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur de démonstration (type "auxiliary", defaultOrder 100000) montrant comment lire des données du véhicule, générer des entrées et communiquer par UDP. À chaque image il enregistre temps, accélérateur, frein, énergie de batterie et puissance moteur dans un tableau CSV en mémoire, envoie des entrées aléatoires (throttle, brake, steering en FILTER_DIRECT) et échange un message JSON avec 127.0.0.1:54812. N'est pas destiné à un véhicule jouable.

## Remarques

- Attention : GenerateInputEvents envoie à chaque image des valeurs aléatoires de throttle (0..1), brake (0..1) et steering (-1..1) : le véhicule devient incontrôlable.
- La communication UDP utilise socket.udp() avec un délai de réception de 5 ms, envoie {"test":123} et affiche (dump) la réponse ; le réseau bloque jusqu'à 5 ms par image.
- saveLogToCSV écrit le fichier testLog.csv avec writeFile (chemin relatif au répertoire d'écriture du jeu, déduit du code).
- Aucune clé jbeam n'est lue. Les noms de fonctions locales (SaveLogToDisk, LogInterestingData…) ne sont pas exportés.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_inputOutputDemo.init()` | Prépare l'en-tête CSV, remet le chrono à 0 et configure le socket UDP vers 127.0.0.1:54812. *(interne)* | 125 |
| `controller_inputOutputDemo.reset()` | Vide le journal CSV (en-tête seul) et remet le chrono à 0. *(interne)* | 119 |
| `controller_inputOutputDemo.saveLogToCSV()` | Écrit le journal accumulé dans testLog.csv. | 37 |
| `controller_inputOutputDemo.update(dt)` | Incrémente le chrono interne. *(interne)* | 112 |
| `controller_inputOutputDemo.updateFixedStep(dt)` | Ne fait rien. *(interne)* | 102 |
| `controller_inputOutputDemo.updateGFX(dt)` | Journalise les données, génère des entrées aléatoires et communique par UDP. *(interne)* | 95 |

### Détail des paramètres

#### `controller_inputOutputDemo.update(dt)`

Incrémente le chrono interne.

- `dt` (*number*) : Pas de temps (s).

#### `controller_inputOutputDemo.updateFixedStep(dt)`

Ne fait rien.

- `dt` (*number*) : Pas de temps (s).

#### `controller_inputOutputDemo.updateGFX(dt)`

Journalise les données, génère des entrées aléatoires et communique par UDP.

- `dt` (*number*) : Pas de temps (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultOrder` | number | 100000 (exécuté en dernier). |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/inputOutputDemo.lua`.*
