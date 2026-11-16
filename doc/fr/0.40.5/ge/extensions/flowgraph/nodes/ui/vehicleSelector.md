# `flowgraph_nodes_ui_vehicleSelector`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua` · VM : Game Engine (GE) · 307 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/vehicleSelector")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Vehicle Selector » (couleur ui, singleActive, dépend de core_input_bindings). Ouvre un écran de démarrage (via le module ui) avec un sélecteur de véhicule pour un adversaire : panneau texte, panneau vehicleSelector (nom, miniature, stats Power/Weight/Top Speed), boutons « Change Opponent » et « Abandon ». Entrées : flow, reset (impulsion), title, text, startButtonText (caché), changeOpponentLabel, abandonLabel, saveSelection (garde le dernier choix entre redémarrages ; sinon retour au véhicule du joueur). Sorties : flow (une fois Start pressé), exit (Abandon pressé), model, config, color, dial (caché, temps 1/4 de mile, 12 par défaut).

## Remarques

- Fonctions locales : getVehicleDial (core_vehicles config « Performance Data »/« Drag Times » .time_1_4, sinon 12), getVehicleColor (peinture par défaut du modèle/config), getVehicleDisplayData.
- Les statistiques sont obtenues via ui_vehicleSelector_vehicleSpecifications.makeSpec, chargée à la demande.

**Dépendances (chargées avant) :** `core_input_bindings`

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Remet les pins de sortie à false et réinitialise l'état. | 129 |
| `C:_executionStopped()` | Ferme le dialogue et réinitialise l'état. | 140 |
| `C:abandonFromUi()` | Marque exited=true et ferme le dialogue. | 257 |
| `C:buildScreen()` | Construit l'écran de démarrage via le module ui (en-tête, bouton Start, panneaux, boutons Change Opponent / Abandon) puis finishUIBuilding. Logue une erreur si le module ui est absent. | 185 |
| `C:closeDialogue()` | Si l'écran est construit, navigue vers « play » et efface modules.ui.uiLayout. | 163 |
| `C:getDefaultVehicle()` | Renvoie {model, config} du véhicule actuel du joueur (core_vehicles.getCurrentVehicleDetails) ou nil. | 177 |
| `C:getSavedVehData()` | Renvoie la sélection mémorisée sur le gestionnaire flowgraph (mgr._vehicleSelectorSavedVeh), partagée entre tous les Vehicle Selector du projet. | 119 |
| `C:getSelectedVehicleDisplayData()` | Renvoie les données d'affichage (nom, miniature, stats) du véhicule sélectionné, ou nil. | 172 |
| `C:init()` | Initialise built/done/exited/_needsRebuild et la sélection. | 109 |
| `C:onClientEndMission()` | Hook de fin de mission côté client ; ferme le dialogue. | 149 |
| `C:requestChangeOpponent()` | Ouvre le sélecteur de véhicules du jeu (ui_vehicleSelector_general.openVehicleSelectorForChallenge, chargé au besoin). Au retour, mémorise le choix et demande une reconstruction de l'écran. | 234 |
| `C:reset()` | Réinitialise built/done/exited et remet les pins de sortie à false (appelée via le pin reset). | 153 |
| `C:setSavedVehData(vehData)` | Mémorise la sélection sur le gestionnaire flowgraph. | 123 |
| `C:startFromUi()` | Marque le choix comme validé (done=true) et ferme le dialogue. | 252 |
| `C:work()` | Gère reset ; à la première frame choisit le véhicule (sauvegardé si saveSelection, sinon défaut) et construit l'écran ; reconstruit si demandé ; publie model, config, color, dial, flow (done) et exit. | 262 |

**Charge les extensions :** `ui_vehicleSelector_general`, `ui_vehicleSelector_vehicleSpecifications`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua`.*
