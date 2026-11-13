# `freeroam_dragRace`

*Fichier : `lua/ge/extensions/freeroam/dragRace.lua` · VM : Game Engine (GE) · 906 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `freeroam_dragRace` : `extensions.load("freeroam_dragRace")`, puis la globale `freeroam_dragRace`

Course de dragster au quart de mile contre une IA (« drag_opponent ») sur les dragstrips des niveaux gridmap_v2 et west_coast_usa. Gère l'arbre de départ (lumières de pré-stage, stage, ambres, vert, rouge), la mise en place de l'adversaire IA (positions, pré-stage/stage/départ, nitro/JATO), l'alignement du joueur sur la ligne, la détection de faux départ, le chronométrage jusqu'au déclencheur d'arrivée, les afficheurs 7 segments (temps et vitesse) et l'écran de résultats UI. S'appuie sur des objets de scène nommés (Prestagelight_l, Amberlight1_R, display_time_1_l, dragTrigger, startTrigger_L…) et sur les BeamNGTrigger du niveau. Global : freeroam_dragRace.

## Exemple

```lua
-- depuis un déclencheur du dragstrip, l'UI appelle :
freeroam_dragRace.selectOpponent(freeroam_dragRace.selectRandomOpponent(true))
freeroam_dragRace.enableProTree(true) -- arbre « pro » (départ immédiat sur les 3 ambres)
```

## Remarques

- BUG : `M.onUpdate = onUpdate` et `M.startRace = startRace` exportent des variables qui ne sont jamais définies dans ce fichier : M.onUpdate et M.startRace valent donc nil. De même setupStage teste `if startRace` (variable globale nil).
- BUG : dans setupPrestage, la ligne `opponentVehicle:queLuaComuemand(...)` est une faute de frappe de queueLuaCommand : appeler une méthode inexistante lève une erreur d'exécution à la fin de la mise en place du pré-stage (l'événement « AI_prestage » n'est jamais envoyé aux contrôleurs moddés et le reste de la fonction — be:enterVehicle, message — n'est pas exécuté).
- Les conversions d'angle utilisent 3.1459 comme valeur de pi (faute de frappe pour 3.14159) dans setupVehicle et selectOpponent (légère erreur d'orientation).
- Le niveau courant (`level`) est une variable locale fixée à 'gridmap_v2' par défaut ; setLevel(lvl) la change et recharge. Les positions de reset de l'adversaire/joueur sont codées en dur par niveau. Sur gridmap_v2 la caméra cinématique est désactivée (cinematicCam=false dans selectOpponent).
- Les temps et la vitesse sont en secondes et en mph (facteur speedUnit = 2.2369362920544 appliqué à m/s). Les afficheurs ont 5 chiffres par côté ; time < 10 ajoute un chiffre « empty ».
- Un faux départ (joueur franchissant la ligne de plus de 0.25 m pendant le compte à rebours) disqualifie : feux rouge/ambres côté joueur, l'IA est arrêtée. Rouler dans la voie de l'adversaire (laneTrigger_L) pendant la course disqualifie aussi.
- Dans onBeamNGTrigger, `table.getn(vehicles)` et la modification de `vehicles` pendant le parcours (table.remove dans pairs) peuvent sauter des éléments.
- Le module utilise des commandes envoyées à la VM de l'IA : controller.setFreeze, ai.setSpeed/setAggression/setAvoidCars/setSpeedMode, electrics.values.jatoInput, controller nitrousOxideInjection, et l'évènement controller.onGameplayEvent('freeroam_dragRace', 'AI_prestage'|'AI_stage'|'AI_setupStart'|'AI_start'|'AI_stop') pour les contrôleurs moddés.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `freeroam_dragRace.accept()` | Appelé par le bouton « Accept/Configure » du dialogue du dragstrip : ouvre l'écran d'aperçu (displayOverview(true, false)) qui passe la simulation au ralenti (1/100) et navigue vers menu.dragRaceOverview. | 728 |
| `freeroam_dragRace.closeOverview()` | Ferme l'aperçu : remet la simulation à 1x, le FOV à 65 et rétablit la caméra précédente. | 298 |
| `freeroam_dragRace.enableCinematicCam(value)` | Lit ou règle l'utilisation de la caméra cinématique (externe) pendant la course. | 808 |
| `freeroam_dragRace.enableProTree(val)` | Lit ou règle l'arbre « pro » (compte à rebours de 2 s puis les 3 ambres 0.4 s puis le vert) au lieu de l'arbre classique (ambres successifs 1.0/1.5/2.0 s, vert à 2.5 s). | 815 |
| `freeroam_dragRace.exit()` | Quitte la course : masque le menu, ferme le dialogue et l'aperçu, supprime l'objet scène drag_opponent, oublie l'adversaire et ré-initialise le module (onExtensionLoaded). | 732 |
| `freeroam_dragRace.onBeamNGTrigger(data)` | Hook des déclencheurs du niveau : dialogue d'entrée/sortie (dragTrigger), arrivée (endTrigger : mise à jour des afficheurs et des résultats, arrêt de l'IA), voie adverse (laneTrigger_L), enregistrement des véhicules (startTrigger_R/L) et préparation (dragTrigger_L). *(interne)* *(hook)* | 620 |
| `freeroam_dragRace.onClientEndMission()` | Hook de fin de niveau : vide les références de lumières, afficheurs, véhicules, déclencheurs et résultats. *(interne)* *(hook)* | 867 |
| `freeroam_dragRace.onExtensionLoaded()` | Hook de chargement : cherche les lumières, afficheurs (display_time_i_l/r, display_speed_i_l/r, i = 1..5) et déclencheurs de la scène, masque les afficheurs et fixe les positions de reset selon le niveau. *(interne)* *(hook)* | 742 |
| `freeroam_dragRace.onExtensionUnloaded()` | Hook de déchargement : masque le menu, ferme dialogue et aperçu, supprime drag_opponent. *(interne)* *(hook)* | 859 |
| `freeroam_dragRace.onPreRender(dtReal, dtSim, dtRaw)` | Hook avant rendu, cœur de la course : fait progresser le compte à rebours (starttimer en temps simulé), le chrono, les messages d'alignement du joueur (distance à la ligne en m), le faux départ et les phases pré-stage/stage/départ de l'IA. *(interne)* *(hook)* | 333 |
| `freeroam_dragRace.onUpdate()` | Exporté mais valant nil (aucune fonction locale onUpdate définie). (assignée dynamiquement) *(interne)* *(hook)* | dyn |
| `freeroam_dragRace.onVehicleDestroyed(id)` | Hook de suppression de véhicule : oublie le joueur ou l'adversaire et masque les lumières. *(interne)* *(hook)* | 550 |
| `freeroam_dragRace.onVehicleResetted(vid)` | Hook de reset de véhicule : ferme le dialogue si c'est le joueur dans le déclencheur ; repositionne l'adversaire (setupVehicle) s'il s'agit de drag_opponent. *(interne)* *(hook)* | 791 |
| `freeroam_dragRace.onVehicleSpawned(vehicleID)` | Hook d'apparition : si c'est l'adversaire, masque le menu et le place (setupVehicle) ; retrouve aussi le véhicule joueur nommé « thePlayer ». *(interne)* *(hook)* | 541 |
| `freeroam_dragRace.resetLights()` | Cache tous les objets lumineux de l'arbre de départ. | 107 |
| `freeroam_dragRace.restartRace()` | Redémarre : reset de l'adversaire et du joueur, retour au menu, simulation à vitesse normale, caméra orbit. | 717 |
| `freeroam_dragRace.selectOpponent(selection)` | Choisit et fait apparaître l'adversaire (core_vehicles.spawnNewVehicle avec vehicleName 'drag_opponent', plaque '2slow'), réinitialise la course et les afficheurs, et replace le joueur sur la ligne de départ si besoin. | 822 |
| `freeroam_dragRace.selectRandomOpponent(sameClass)` | Tire au hasard une config de voiture ou camion ; avec sameClass=true, restreint aux configs dont le 0-100 km/h est à ±1 s de celui du véhicule du joueur. Ajoute Brand et Country du modèle pour l'UI. | 562 |
| `freeroam_dragRace.setLevel(lvl)` | Choisit le niveau pour lequel les positions et caméras sont codées (gridmap_v2 ou west_coast_usa) et réinitialise le module. | 878 |
| `freeroam_dragRace.setupPrestage()` | Allume le pré-stage de l'IA et fait avancer ou retenir l'adversaire selon que le joueur est prêt ; voir le bug (queLuaComuemand) dans les notes. *(interne)* | 158 |
| `freeroam_dragRace.setupStage()` | Allume le feu de stage de l'IA et la fait s'approcher de la ligne (vitesse 5, agressivité 0). *(interne)* | 179 |
| `freeroam_dragRace.startRace()` | Exporté mais valant nil : aucune implémentation dans ce fichier (voir notes). (assignée dynamiquement) | dyn |

### Détail des paramètres

#### `freeroam_dragRace.enableCinematicCam(value)`

Lit ou règle l'utilisation de la caméra cinématique (externe) pendant la course.

- `value` (*boolean|nil*) : Nouvelle valeur ; nil pour seulement lire.
- **renvoie** : boolean Valeur actuelle.

#### `freeroam_dragRace.enableProTree(val)`

Lit ou règle l'arbre « pro » (compte à rebours de 2 s puis les 3 ambres 0.4 s puis le vert) au lieu de l'arbre classique (ambres successifs 1.0/1.5/2.0 s, vert à 2.5 s).

- `val` (*boolean|nil*) : Nouvelle valeur ; nil pour seulement lire.
- **renvoie** : boolean Valeur actuelle.

#### `freeroam_dragRace.onBeamNGTrigger(data)`

Hook des déclencheurs du niveau : dialogue d'entrée/sortie (dragTrigger), arrivée (endTrigger : mise à jour des afficheurs et des résultats, arrêt de l'IA), voie adverse (laneTrigger_L), enregistrement des véhicules (startTrigger_R/L) et préparation (dragTrigger_L).

- `data` (*table*) : {triggerName, event ('enter'|'exit'), subjectID}

#### `freeroam_dragRace.onPreRender(dtReal, dtSim, dtRaw)`

Hook avant rendu, cœur de la course : fait progresser le compte à rebours (starttimer en temps simulé), le chrono, les messages d'alignement du joueur (distance à la ligne en m), le faux départ et les phases pré-stage/stage/départ de l'IA.

- `dtReal` (*number*) : Durée réelle (s).
- `dtSim` (*number*) : Durée simulée (s), utilisée pour les timers.
- `dtRaw` (*number*) : Durée brute (s).

#### `freeroam_dragRace.onVehicleDestroyed(id)`

Hook de suppression de véhicule : oublie le joueur ou l'adversaire et masque les lumières.

- `id` (*integer*) : Id du véhicule.

#### `freeroam_dragRace.onVehicleResetted(vid)`

Hook de reset de véhicule : ferme le dialogue si c'est le joueur dans le déclencheur ; repositionne l'adversaire (setupVehicle) s'il s'agit de drag_opponent.

- `vid` (*integer*) : Id du véhicule.

#### `freeroam_dragRace.onVehicleSpawned(vehicleID)`

Hook d'apparition : si c'est l'adversaire, masque le menu et le place (setupVehicle) ; retrouve aussi le véhicule joueur nommé « thePlayer ».

- `vehicleID` (*integer*) : Id du véhicule.

#### `freeroam_dragRace.selectOpponent(selection)`

Choisit et fait apparaître l'adversaire (core_vehicles.spawnNewVehicle avec vehicleName 'drag_opponent', plaque '2slow'), réinitialise la course et les afficheurs, et replace le joueur sur la ligne de départ si besoin.

- `selection` (*table*) : {model, config, color} (par ex. un élément de selectRandomOpponent).

#### `freeroam_dragRace.selectRandomOpponent(sameClass)`

Tire au hasard une config de voiture ou camion ; avec sameClass=true, restreint aux configs dont le 0-100 km/h est à ±1 s de celui du véhicule du joueur. Ajoute Brand et Country du modèle pour l'UI.

- `sameClass` (*boolean|nil*) : true pour une classe de performance similaire.
- **renvoie** : table Entrée de config véhicule (model_key, key, Brand, Country…).

#### `freeroam_dragRace.setLevel(lvl)`

Choisit le niveau pour lequel les positions et caméras sont codées (gridmap_v2 ou west_coast_usa) et réinitialise le module.

- `lvl` (*string*) : Nom du niveau.

**Évènements UI (guihooks.trigger) :** `MenuHide`, `Message`

## Appels vers le moteur (C++)

- `be:` `enterVehicle`, `getPlayerVehicleID`
- `debugDrawer:` `drawLine`, `drawSphere`, `drawTextAdvanced`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/freeroam/dragRace.lua`.*
