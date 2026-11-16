# `gameplay_speedTrapLeaderboards`

*Fichier : `lua/ge/extensions/gameplay/speedTrapLeaderboards.lua` · VM : Game Engine (GE) · 132 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_speedTrapLeaderboards` : `extensions.load("gameplay_speedTrapLeaderboards")`, puis la globale `gameplay_speedTrapLeaderboards`

Extension qui tient les classements (top 10) des radars de vitesse, par niveau et par radar (triggerName), en mode freeroam uniquement. Les classements sont chargés depuis settings/cloud/speedTrapLeaderboards/<niveau>.json au démarrage du niveau et sauvegardés à la fin de la mission ou avant l'activation du mode carrière. Une entrée contient speed (m/s), modelName (nom JBeam) et date (UTC ISO 8601).

## Exemple

```lua
local isBest, board = gameplay_speedTrapLeaderboards.addRecord(data, vehSpeed, overSpeed, veh)
```

## Remarques

- Chargement et sauvegarde automatiques seulement si l'état de jeu est « freeroam » et que la carrière n'est pas active.
- Seuls les niveaux marqués « dirty » (nouveau record ajouté) sont réécrits, sauf forceOverwrite.
- onSerialize utilise career_career.isActive() sans vérifier que career_career existe ; si l'extension est absente, erreur Lua possible.
- Le commentaire du code signale l'absence d'un hook « onFreeroamStart » : le chargement se fait sur onClientPostStartMission.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_speedTrapLeaderboards.addRecord(speedTrapData, playerSpeed, overSpeed, veh)` | Ajoute un passage au classement du radar du niveau courant s'il y a de la place (10 entrées max) ou s'il bat la dernière entrée, puis trie par vitesse décroissante. | 58 |
| `gameplay_speedTrapLeaderboards.getLeaderboards()` | Renvoie tous les classements en mémoire. | 106 |
| `gameplay_speedTrapLeaderboards.loadLeaderboards(folderPath)` | Vide la mémoire puis charge tous les *.json du dossier ; le nom de fichier sans extension sert de nom de niveau. | 21 |
| `gameplay_speedTrapLeaderboards.onBeforeCareerActivate()` | Hook appelé avant l'activation de la carrière : en freeroam, sauvegarde. *(interne)* *(hook)* | 100 |
| `gameplay_speedTrapLeaderboards.onClientEndMission()` | Hook appelé à la fin de la mission : en freeroam, sauvegarde les classements. *(interne)* *(hook)* | 94 |
| `gameplay_speedTrapLeaderboards.onClientPostStartMission(levelPath)` | Hook appelé après le démarrage d'un niveau : en freeroam, charge les classements. *(interne)* *(hook)* | 88 |
| `gameplay_speedTrapLeaderboards.onDeserialized(data)` | Restaure l'état après rechargement Lua. *(interne)* *(hook)* | 116 |
| `gameplay_speedTrapLeaderboards.onSerialize()` | Sauvegarde l'état avant rechargement Lua (classements et niveaux modifiés) ; ne renvoie rien si la carrière est active. *(interne)* *(hook)* | 110 |
| `gameplay_speedTrapLeaderboards.saveLeaderboards(folderPath, forceOverwrite)` | Écrit sur disque les classements modifiés (un fichier par niveau). | 35 |

### Détail des paramètres

#### `gameplay_speedTrapLeaderboards.addRecord(speedTrapData, playerSpeed, overSpeed, veh)`

Ajoute un passage au classement du radar du niveau courant s'il y a de la place (10 entrées max) ou s'il bat la dernière entrée, puis trie par vitesse décroissante.

- `speedTrapData` (*table*) : Données du trigger (utilise triggerName).
- `playerSpeed` (*number*) : Vitesse du véhicule en m/s.
- `overSpeed` (*number*) : Dépassement de la limite en m/s (non utilisé pour l'entrée).
- `veh` (*userdata*) : Objet véhicule (son champ JBeam donne le modèle).
- **renvoie** : boolean true si la vitesse égale ou dépasse le meilleur score du classement.
- **renvoie** : table[] Classement de ce radar, trié.

#### `gameplay_speedTrapLeaderboards.getLeaderboards()`

Renvoie tous les classements en mémoire.

- **renvoie** : table<string, table> niveau -> radar -> liste d'entrées {speed, modelName, date}.

#### `gameplay_speedTrapLeaderboards.loadLeaderboards(folderPath)`

Vide la mémoire puis charge tous les *.json du dossier ; le nom de fichier sans extension sert de nom de niveau.

- `folderPath` (*string|nil*) : Dossier ; défaut settings/cloud/speedTrapLeaderboards/.

#### `gameplay_speedTrapLeaderboards.onClientPostStartMission(levelPath)`

Hook appelé après le démarrage d'un niveau : en freeroam, charge les classements.

- `levelPath` (*string*) : Chemin du niveau.

#### `gameplay_speedTrapLeaderboards.onDeserialized(data)`

Restaure l'état après rechargement Lua.

- `data` (*table*) : Table {leaderboards, dirtyLevels}.

#### `gameplay_speedTrapLeaderboards.saveLeaderboards(folderPath, forceOverwrite)`

Écrit sur disque les classements modifiés (un fichier par niveau).

- `folderPath` (*string|nil*) : Dossier ; défaut settings/cloud/speedTrapLeaderboards/.
- `forceOverwrite` (*boolean|nil*) : Écrire tous les niveaux, même non modifiés.

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/speedTrapLeaderboards.lua`.*
