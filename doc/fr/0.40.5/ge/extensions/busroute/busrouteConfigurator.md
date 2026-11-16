# `busroute_busrouteConfigurator`

*Fichier : `lua/ge/extensions/busroute/busrouteConfigurator.lua` · VM : Game Engine (GE) · 100 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `busroute_busrouteConfigurator` : `extensions.load("busroute_busrouteConfigurator")`, puis la globale `busroute_busrouteConfigurator`

Backend de l'étape « aperçu / options » de l'assistant Vue des lignes de bus. Il décrit le mode « busRoute » (descripteur) et le passe à oneshotRaceCore.createConfigurator, dont le résultat est le module exporté. Ici le choix « du milieu » est un fichier de scénario complet (scenario_scenariosLoader.getLevels("bus")) ; le choix de véhicule est limité aux bus de transport en commun (vehicleRestrictionMode = "busRoute"). Les réglages sont : strictStop (arrêt strict, vrai par défaut) et traffic (circulation, faux par défaut). Rien n'est sauvegardé (en mémoire seulement).

## Remarques

- Au lancement (start), le scénario est copié (deepcopy), busdriver.strictStop/traffic et userSelectedVehicle {model, config} y sont écrits, puis scenario_scenariosLoader.start(routeFile) est appelé.
- La clé de highscore est toujours configKey = "busRoute" : le code d'origine Angular calculait une vraie clé puis l'ignorait ; le commentaire dit que c'est conservé tel quel.
- Les fonctions du descripteur (defaultSettings, onSelectMiddle, buildLevelSummary, buildMiddleSummary, getHighscoreKey, start) sont locales et appelées par oneshotRaceCore ; elles ne sont pas exportées.
- La taille d'un niveau est affichée sous la forme « %d m x %d m » à partir de levelInfo.size.

**Dépendances (chargées avant) :** `scenario_scenariosLoader`, `core_highscores`, `ui_vehicleSelector_general`, `ui_busRouteSelector_general`

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : scenario_scenariosLoader, core_highscores, ui_vehicleSelector_general, ui_busRouteSelector_general. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/busroute/busrouteConfigurator.lua`.*
