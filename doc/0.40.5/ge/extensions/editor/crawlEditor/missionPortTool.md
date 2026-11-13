# `editor_crawlEditor_missionPortTool`

*Fichier : `lua/ge/extensions/editor/crawlEditor/missionPortTool.lua` · VM : Game Engine (GE) · 502 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_crawlEditor_missionPortTool` : `extensions.load("editor_crawlEditor_missionPortTool")`, puis la globale `editor_crawlEditor_missionPortTool`

Outil de migration de l'éditeur de crawl : convertit d'anciennes missions crawl (dossier /gameplay/missions/<niveau>/crawl/<mission>/ contenant bounds.sites.json et race.race.json) vers le nouveau système de crawl. Pour chaque mission il génère un fichier .boundary.json (zone issue de bounds.sites.json), un .path.json (nœuds issus des pathnodes de race.race.json, avec drapeaux de recovery), un .startingPosition.json (position de départ) dans /levels/<niveau>/crawls/, puis un .trail.json dans le dossier de la mission, qui relie le tout. Passe par gameplay/crawl/saveSystem (saveBoundary, savePath, saveStartingPosition, saveTrail).

## Exemple

```lua
extensions.load('editor_crawlEditor_missionPortTool')
editor_crawlEditor_missionPortTool.portMission('/gameplay/missions/west_coast_usa/crawl/maMission', 'west_coast_usa')
```

## Remarques

- Fichiers requis : bounds.sites.json et race.race.json (sinon échec, retour false) ; info.json absent = simple avertissement.
- Seule la première zone (zones[1]) de bounds.sites.json est convertie ; elle doit avoir au moins 3 sommets. Si top/bot sont absents, des plans inactifs par défaut sont créés (haut z=10 normale +Z, bas z=-10 normale -Z).
- Chaque pathnode devient un nœud {name, pos, radius (défaut 6), flags}. Flags : normal, recovery, reverseRecovery, sidePadding ; isRecoveryCheckpoint = true si recovery ou reverseRecovery valent autre chose que -1. recovery/reverseRecovery pointent vers un oldId de startPositions, pas un indice de pathnode.
- Position de départ : startPositions dont oldId == defaultStartPosition, sinon la première entrée (avertissement). Rotation = direction vers le premier nœud (identité si distance <= 0,001), rayon 10, icône 2 m au-dessus.
- Le trail créé a isFromMission = true, pathReversed = false, rules {isPointsBased = false, isTimed = false}, prefabs vide.
- Le niveau cible vaut getCurrentLevelIdentifier() si targetLevel est nil. Les mots de passe ne sont pas concernés ; les fichiers existants du même nom sont réécrits (portAllMissions ne vérifie pas si une mission est déjà portée).
- Les fonctions locales convertBoundsToBoundary, convertRaceToPath, extractMissionName, scanMissions et portAllMissions ne sont pas exportées ; le bouton « Port All Missions » parcourt tous les niveaux (getAllLevelIdentifiers) puis appelle editor_crawlEditor.loadAllObjects().

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_crawlEditor_missionPortTool.openPortingDialog()` | Rescanne les missions du niveau courant et ouvre la fenêtre de portage. | 492 |
| `editor_crawlEditor_missionPortTool.portMission(missionDir, targetLevel)` | Convertit une mission crawl : lit bounds.sites.json, race.race.json, crée boundary/path/startingPosition dans /levels/<niveau>/crawls/ et le trail dans le dossier de la mission. Journalise chaque erreur avec le tag mission_port_tool. | 132 |
| `editor_crawlEditor_missionPortTool.showPortingDialog()` | Dessine la fenêtre imgui « Mission Port Tool » (Port All Missions, liste des missions convertibles du niveau courant avec un bouton par mission, Refresh, Close) si le dialogue est ouvert. À appeler à chaque frame (depuis l'éditeur). *(interne)* | 409 |

### Détail des paramètres

#### `editor_crawlEditor_missionPortTool.portMission(missionDir, targetLevel)`

Convertit une mission crawl : lit bounds.sites.json, race.race.json, crée boundary/path/startingPosition dans /levels/<niveau>/crawls/ et le trail dans le dossier de la mission. Journalise chaque erreur avec le tag mission_port_tool.

- `missionDir` (*string*) : Chemin du dossier de la mission (le nom de la mission est son dernier segment)
- `targetLevel` (*string|nil*) : Identifiant du niveau de destination ; par défaut le niveau chargé
- **renvoie** : boolean true si boundary, path et trail ont été sauvés ; false en cas d'échec (la position de départ est facultative)

## Appels vers le moteur (C++)

- `FS:` `directoryExists`, `fileExists`, `findFiles`, `stat`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/crawlEditor/missionPortTool.lua`.*
