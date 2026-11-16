# `gameplay_missions_proceduralMissionGenerators_timeTrialMissions`

*Fichier : `lua/ge/extensions/gameplay/missions/proceduralMissionGenerators/timeTrialMissions.lua` · VM : Game Engine (GE) · 240 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_missions_proceduralMissionGenerators_timeTrialMissions` : `extensions.load("gameplay_missions_proceduralMissionGenerators_timeTrialMissions")`, puis la globale `gameplay_missions_proceduralMissionGenerators_timeTrialMissions`

Générateur procédural de missions « generatedTimeTrial » à partir des courses rapides (quickraces) de chaque niveau. Il charge scenario_quickRaceLoader, parcourt les pistes, convertit celles qui n'ont pas de fichier .race.json (via gameplay/race/path:fromTrack) en fichier de cache dans gameplay/temp/timeTrials/, puis crée une mission avec le fichier de course, les préfabs (normaux, aller, retour), l'aperçu et le déclencheur placé sur la position de départ par défaut.

## Exemple

```lua
local missions = gameplay_missions_proceduralMissionGenerators_timeTrialMissions.generate({'gridmap_v2'})
```

## Remarques

- Les missions ont l'id « <niveau>/timeTrials/<trackName>-procedural », missionType « generatedTimeTrial », startCondition {type='vehicleDriven'}, une seule étoile justFinish, showInCareer=false et showInFreeroam=true.
- Pistes ignorées : race.ignoreAsMission, cache invalide, race.hideMission, ou aucune position de départ correspondant à defaultStartPosition (la mission n'est alors pas ajoutée).
- Le cache est écrit sur disque (jsonWriteFile) au premier passage ; une conversion échouée écrit {invalid=true} pour ne pas réessayer. Supprimer le fichier de cache force une nouvelle conversion.
- Les préfabs non trouvés sont cherchés dans levels/<niveau>/<chemin>.prefab(.json) ; ceux qui n'existent pas sont supprimés de la liste. Les préfabs automatiques <trackName>, <trackName>_reverse, <trackName>_forward dans levels/<niveau>/quickrace/ sont ajoutés s'ils existent.
- Le bloc `enableConversion` (variable locale fixée à false) permettrait de convertir ces missions procédurales en vraies missions timeTrial sur disque via saveMission ; il est inactif. `hiddenFiles` n'est jamais rempli (code commenté), donc le compteur de missions masquées reste à 0 malgré le log final.
- Les tables renvoyées par generate ne sont pas sauvegardées : elles servent à la liste de missions en mémoire.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_missions_proceduralMissionGenerators_timeTrialMissions.generate(levelIdentifier)` | Génère les missions « generatedTimeTrial » pour un ou plusieurs niveaux (tous si nil) à partir de scenario_quickRaceLoader.getQuickraceList. Écrit des fichiers de cache pour les pistes à convertir et journalise le nombre de missions masquées. | 74 |

### Détail des paramètres

#### `gameplay_missions_proceduralMissionGenerators_timeTrialMissions.generate(levelIdentifier)`

Génère les missions « generatedTimeTrial » pour un ou plusieurs niveaux (tous si nil) à partir de scenario_quickRaceLoader.getQuickraceList. Écrit des fichiers de cache pour les pistes à convertir et journalise le nombre de missions masquées.

- `levelIdentifier` (*string|table|nil*) : Nom de niveau ou liste de noms ; nil = tous les niveaux.
- **renvoie** : table Liste de définitions de missions.

## Appels vers le moteur (C++)

- `FS:` `copyFile`, `fileExists`

**Charge les extensions :** `scenario_quickRaceLoader`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/missions/proceduralMissionGenerators/timeTrialMissions.lua`.*
