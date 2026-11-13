# `flowgraph_nodes_gameplay_race_raceHighscoresLap`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceHighscoresLap.lua` · VM : Game Engine (GE) · 111 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/race/raceHighscoresLap")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Race Highscores » (catégorie repeat_instant, tag scenario), variante « tour ». Identique à raceHighscoresComplete mais enregistre sous l'identifiant missionTypeData.trackName (sans préfixe « mission- »). Écrit le temps du dernier passage du véhicule dans core_highscores.setScenarioHighscoresCustom puis stocke {place, scores} dans state.raceComepleteHighscores. Entrées : flow, raceData, vehId ; sortie : flow.

## Remarques

- S'exécute à chaque frame tant que flow est actif (print « Writing Highscores... » et écriture répétée) : ne lui donner du flux qu'une fois.
- Nécessite self.mgr.activity.missionTypeData.trackName.
- L'ancienne pin 'clear' est redirigée vers 'reset' (legacyPins), mais aucune pin reset n'est déclarée dans le pinSchema de ce fichier.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Initialise self.markers à nil (non utilisé ensuite). | 29 |
| `C:work()` | Recopie flow et enregistre le highscore du véhicule, puis stocke le résultat dans son état. | 49 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceHighscoresLap.lua`.*
