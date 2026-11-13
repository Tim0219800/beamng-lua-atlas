# `flowgraph_nodes_gameplay_race_raceHighscoresComplete`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceHighscoresComplete.lua` · VM : Game Engine (GE) · 111 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/race/raceHighscoresComplete")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Race Highscores » (catégorie repeat_instant, tag scenario), variante « course complète ». Enregistre le temps du dernier passage du véhicule (state.historicTimes[#…].endTime en ms) dans core_highscores.setScenarioHighscoresCustom, avec un enregistrement (nom de licence, marque, nom de config, fichier de config, modèle), la clé de niveau, l'identifiant « mission-<trackName> » et une clé de configuration (standing/rolling, Reverse, nombre de tours). Relit ensuite les scores et les place dans state.raceComepleteHighscores = {place, scores} (utilisé par Race End Screen). Entrées : flow, raceData, vehId ; sortie : flow.

## Remarques

- S'exécute à chaque frame tant que flow est actif : il écrit les highscores en continu (avec un print « Writing Highscores... »). Il faut ne lui donner du flux qu'une fois.
- Nécessite self.mgr.activity.missionTypeData.trackName (donc un graphe lancé comme mission).
- Même nom d'affichage que raceHighscoresLap.lua ; la différence est l'identifiant « mission-<trackName> » contre « <trackName> » seul.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Initialise self.markers à nil (non utilisé ensuite). | 29 |
| `C:work()` | Recopie flow ; sur reset appelle _executionStopped ; sinon enregistre le highscore et stocke le résultat dans l'état du véhicule. | 49 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceHighscoresComplete.lua`.*
