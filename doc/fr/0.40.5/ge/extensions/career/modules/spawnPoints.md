# `career_modules_spawnPoints`

*Fichier : `lua/ge/extensions/career/modules/spawnPoints.lua` · VM : Game Engine (GE) · 120 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_spawnPoints` : `extensions.load("career_modules_spawnPoints")`, puis la globale `career_modules_spawnPoints`

Découverte des points d'apparition (spawn points) d'un niveau en carrière. Chaque seconde, si le joueur conduit un véhicule de l'inventaire, il teste la distance aux points non découverts (seuil 75 m) ; à la découverte il ajoute une entrée au journal de bord (career_modules_logbook.spawnPointUnlocked), émet le hook onSpawnPointUnlocked(spawnPoint) et vide gameplay_rawPois. L'état est sauvegardé dans <save>/career/spawnPoints.json.

## Remarques

- Données : table niveau -> nom d'objet du spawn point -> true.
- Le fichier est ignoré (table vide) si la version de info.json est < 42.
- Aucune vérification n'est faite pendant le tutoriel.
- getSpawnPointTranslation est défini mais jamais utilisé.

**Dépendances (chargées avant) :** `career_career`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_spawnPoints.getUnlockedSpawnpointsData()` | Renvoie la table des points découverts, par niveau. | 77 |
| `career_modules_spawnPoints.isSpawnPointDiscovered(level, spawnPointName)` | Indique si un point d'apparition est découvert (crée l'entrée de niveau si besoin). | 91 |
| `career_modules_spawnPoints.onCareerActive(active)` | Hook : charge les points découverts quand la carrière devient active. *(interne)* *(hook)* | 103 |
| `career_modules_spawnPoints.onExtensionLoaded()` | Hook : charge les points découverts si la carrière est déjà active (renvoie false sinon). *(interne)* *(hook)* | 98 |
| `career_modules_spawnPoints.onSaveCurrentProfile(currentSavePath)` | Hook de sauvegarde : écrit spawnPoints.json dans <save>/career/. *(interne)* *(hook)* | 109 |
| `career_modules_spawnPoints.onUpdate(dtReal, dtSim, dtRaw)` | Hook appelé chaque frame : toutes les secondes (dtReal cumulé), recherche un point non découvert à moins de 75 m du véhicule joueur et le débloque. *(interne)* *(hook)* | 28 |

### Détail des paramètres

#### `career_modules_spawnPoints.getUnlockedSpawnpointsData()`

Renvoie la table des points découverts, par niveau.

- **renvoie** : table<string, table<string, boolean>> niveau -> nom du point -> true.

#### `career_modules_spawnPoints.isSpawnPointDiscovered(level, spawnPointName)`

Indique si un point d'apparition est découvert (crée l'entrée de niveau si besoin).

- `level` (*string*) : Identifiant du niveau.
- `spawnPointName` (*string*) : Nom de l'objet du point (objectname).
- **renvoie** : boolean|nil true si découvert, nil sinon.

#### `career_modules_spawnPoints.onCareerActive(active)`

Hook : charge les points découverts quand la carrière devient active.

- `active` (*boolean*) : Rien si false.

#### `career_modules_spawnPoints.onSaveCurrentProfile(currentSavePath)`

Hook de sauvegarde : écrit spawnPoints.json dans <save>/career/.

- `currentSavePath` (*string*) : Dossier de sauvegarde.

#### `career_modules_spawnPoints.onUpdate(dtReal, dtSim, dtRaw)`

Hook appelé chaque frame : toutes les secondes (dtReal cumulé), recherche un point non découvert à moins de 75 m du véhicule joueur et le débloque.

- `dtReal` (*number*) : Temps réel écoulé (s).
- `dtSim` (*number*) : Temps de simulation (s), non utilisé.
- `dtRaw` (*number*) : Temps brut (s), non utilisé.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : career_career. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onSpawnPointUnlocked`

## Appels vers le moteur (C++)

- `obj:` `getPosition`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/spawnPoints.lua`.*
