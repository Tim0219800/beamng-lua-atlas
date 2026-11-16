# `gameplay_markerInteraction`

*Fichier : `lua/ge/extensions/gameplay/markerInteraction.lua` · VM : Game Engine (GE) · 718 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_markerInteraction` : `extensions.load("gameplay_markerInteraction")`, puis la globale `gameplay_markerInteraction`

Gère chaque frame (onPreRender) l'affichage et l'interaction des marqueurs de mission/activité en freeroam et en carrière : sélectionne les clusters de marqueurs proches (rayon 100 m) via le quadtree de gameplay_playmodeMarkers, les affiche, met à jour leurs décalques au sol, et ouvre la fenêtre d'acceptation d'activité quand le joueur est à l'arrêt (moins de 1 km/h, avec hystérésis jusqu'à 3 km/h) ou à pied dans une zone. Gère aussi l'effacement du guidage à l'arrivée (moins de 7 m), le mode multi-joueur sur un écran (multiseat) et le formatage des missions pour l'UI. Les anciennes fonctions de lancement de mission sont dépréciées.

## Remarques

- Déprécié : startMissionById, stopMissionById et changeUserSettings ne font que loguer une erreur et une trace de pile ; utiliser gameplay_missions_missionManager.
- Incohérence : M.restartCurrent, M.abandonCurrent et M.getClusterMarker sont assignés à des variables locales jamais définies : ces champs valent nil.
- Bug probable : formatMission lit « mission.missionType » alors que la variable est m (la globale mission est nil dans ce fichier) ; si m.missionTypeLabel est nil, l'évaluation provoque une erreur.
- Bug probable : formatDataForUi appelle M.isStateWithPlaymodeMarkers, qui n'est pas défini dans ce module (il existe dans gameplay_playmodeMarkers) ; l'appel échouerait.
- Vitesses seuils : arrêt < 1/3.6 puis > 3/3.6 m/s ; croisière 20 à 30 km/h (en m/s, 20/3.6 et 30/3.6).
- Les marqueurs ne sont montrés que si la caméra n'est pas en mode photo, l'éditeur n'est pas actif et le réglage showMissionMarkers (ou carrière, tutoriel, premier trajet) l'autorise, sauf pour un cluster pris en focus (navigation).
- Émet les hooks onActivityAcceptGatherData(elemData, activityData), onMissionAvailabilityChanged({missionCount}) et onReachedTargetPos.

**Dépendances (chargées avant) :** `gameplay_missions_missions`, `gameplay_missions_missionManager`, `freeroam_bigMapMode`, `gameplay_playmodeMarkers`, `freeroam_bigMapPoiProvider`, `ui_missionInfo`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_markerInteraction.changeUserSettings(id, settings)` | Déprécié : logge une erreur et une trace de pile. | 138 |
| `gameplay_markerInteraction.clearCache()` | Force la réévaluation de la fenêtre d'acceptation au prochain passage. | 651 |
| `gameplay_markerInteraction.closeViewDetailPrompt(force)` | Si force est vrai, ferme la fenêtre d'acceptation, envoie onMissionAvailabilityChanged avec missionCount = 0 à l'UI et aux extensions. | 211 |
| `gameplay_markerInteraction.formatDataForUi()` | Formate les missions des éléments interactifs courants pour l'UI, triées par gameplay_missions_unlocks.depthIdSort. | 114 |
| `gameplay_markerInteraction.formatMission(m)` | Construit la table de données d'une mission pour l'UI (nom, description, aperçu, réglages, attributs, progression, déblocages, boutons de contexte). | 66 |
| `gameplay_markerInteraction.getCurrentInteractableElements()` | Renvoie la liste des éléments actuellement interactifs (ceux de la fenêtre d'acceptation ouverte). | 61 |
| `gameplay_markerInteraction.getGameContext(fromMissionMenu)` | Renvoie les données de l'écran de mission via gameplay_missions_missionScreen.getMissionScreenData(). | 149 |
| `gameplay_markerInteraction.onAnyMissionChanged(state)` | Hook : à tout changement d'état de mission, force le renvoi des POI ; au démarrage (state == "started"), désélectionne la grande carte, retire les focus et ferme la fenêtre d'acceptation si ouverte. *(interne)* *(hook)* | 666 |
| `gameplay_markerInteraction.onClientEndMission(levelPath)` | Hook de fin de niveau : oublie le POI de navigation. *(interne)* *(hook)* | 685 |
| `gameplay_markerInteraction.onNavigateToMission(poiId)` | Hook : remet à zéro les focus de marqueurs puis mémorise le POI vers lequel on navigue. *(interne)* *(hook)* | 678 |
| `gameplay_markerInteraction.onPreRender(dtReal, dtSim)` | Hook avant rendu, chaque frame : si l'état de jeu a des marqueurs de mode jeu, gère l'arrivée à la cible, le guidage et appelle l'affichage des marqueurs de mission du niveau courant ; sinon vide gameplay_playmodeMarkers. *(interne)* *(hook)* | 603 |
| `gameplay_markerInteraction.onSelectDetailPromptClicked(idx)` | Appelée par l'UI quand le joueur choisit une entrée de la fenêtre d'acceptation : ferme le dialogue, vide ActivityAcceptUpdate et exécute le buttonFun de l'entrée choisie. *(hook)* | 199 |
| `gameplay_markerInteraction.onSettingsChanged()` | Hook de changement de réglages : relit la résolution (GFXDevice.getVideoMode) et le rapport d'aspect. *(interne)* *(hook)* | 221 |
| `gameplay_markerInteraction.onUIPlayStateChanged(enteredPlay)` | Hook : à l'entrée en mode jeu (enteredPlay vrai), force la réévaluation de la fenêtre d'acceptation. *(interne)* *(hook)* | 713 |
| `gameplay_markerInteraction.setForceReevaluateOpenPrompt()` | Force la réévaluation de la fenêtre d'acceptation à la prochaine frame. | 709 |
| `gameplay_markerInteraction.setMarkersVisibleTemporary(visible)` | Affiche ou cache temporairement tous les marqueurs (sauf cluster en focus). | 689 |
| `gameplay_markerInteraction.setPreselectedMissionId(mId)` | Mémorise un ID de mission présélectionné (la variable n'est lue nulle part dans ce fichier). | 144 |
| `gameplay_markerInteraction.showMissionMarkersToggled(active)` | À appeler quand le réglage d'affichage des marqueurs change : vide les POI bruts (gameplay_rawPois.clear) et force le renvoi des POI de grande carte. | 660 |
| `gameplay_markerInteraction.skipNextIconFading()` | Active un drapeau local skipIconFading remis à false à la fin de la frame suivante (aucune lecture dans ce fichier). | 656 |
| `gameplay_markerInteraction.startMissionById(id, userSettings, startingOptions)` | Déprécié : logge une erreur et une trace de pile, ne démarre rien. | 128 |
| `gameplay_markerInteraction.stopMissionById(id, force)` | Déprécié : logge une erreur et une trace de pile. | 133 |

### Détail des paramètres

#### `gameplay_markerInteraction.changeUserSettings(id, settings)`

Déprécié : logge une erreur et une trace de pile.

- `id` (*string*) : ID de mission (ignoré).
- `settings` (*table*) : Ignoré.

#### `gameplay_markerInteraction.closeViewDetailPrompt(force)`

Si force est vrai, ferme la fenêtre d'acceptation, envoie onMissionAvailabilityChanged avec missionCount = 0 à l'UI et aux extensions.

- `force` (*boolean|nil*) : Sans true, ne fait rien.

#### `gameplay_markerInteraction.formatDataForUi()`

Formate les missions des éléments interactifs courants pour l'UI, triées par gameplay_missions_unlocks.depthIdSort.

- **renvoie** : table[]|nil Liste de missions formatées, ou nil.

#### `gameplay_markerInteraction.formatMission(m)`

Construit la table de données d'une mission pour l'UI (nom, description, aperçu, réglages, attributs, progression, déblocages, boutons de contexte).

- `m` (*table*) : Objet mission.
- **renvoie** : table Informations de mission formatées pour l'interface.

#### `gameplay_markerInteraction.getCurrentInteractableElements()`

Renvoie la liste des éléments actuellement interactifs (ceux de la fenêtre d'acceptation ouverte).

- **renvoie** : table[] Éléments d'interaction des marqueurs.

#### `gameplay_markerInteraction.getGameContext(fromMissionMenu)`

Renvoie les données de l'écran de mission via gameplay_missions_missionScreen.getMissionScreenData().

- `fromMissionMenu` (*boolean|nil*) : Non utilisé.
- **renvoie** : table Données de l'écran de mission.

#### `gameplay_markerInteraction.onAnyMissionChanged(state)`

Hook : à tout changement d'état de mission, force le renvoi des POI ; au démarrage (state == "started"), désélectionne la grande carte, retire les focus et ferme la fenêtre d'acceptation si ouverte.

- `state` (*string*) : État de la mission (par exemple "started").

#### `gameplay_markerInteraction.onClientEndMission(levelPath)`

Hook de fin de niveau : oublie le POI de navigation.

- `levelPath` (*string*) : Chemin du niveau.

#### `gameplay_markerInteraction.onNavigateToMission(poiId)`

Hook : remet à zéro les focus de marqueurs puis mémorise le POI vers lequel on navigue.

- `poiId` (*string*) : ID du POI cible.

#### `gameplay_markerInteraction.onPreRender(dtReal, dtSim)`

Hook avant rendu, chaque frame : si l'état de jeu a des marqueurs de mode jeu, gère l'arrivée à la cible, le guidage et appelle l'affichage des marqueurs de mission du niveau courant ; sinon vide gameplay_playmodeMarkers.

- `dtReal` (*number*) : Delta temps réel en secondes.
- `dtSim` (*number*) : Delta temps de simulation en secondes.

#### `gameplay_markerInteraction.onSelectDetailPromptClicked(idx)`

Appelée par l'UI quand le joueur choisit une entrée de la fenêtre d'acceptation : ferme le dialogue, vide ActivityAcceptUpdate et exécute le buttonFun de l'entrée choisie.

- `idx` (*integer*) : Indice de l'entrée (1-based) dans promptData.

#### `gameplay_markerInteraction.onUIPlayStateChanged(enteredPlay)`

Hook : à l'entrée en mode jeu (enteredPlay vrai), force la réévaluation de la fenêtre d'acceptation.

- `enteredPlay` (*boolean*) : true si l'UI passe en mode jeu.

#### `gameplay_markerInteraction.setMarkersVisibleTemporary(visible)`

Affiche ou cache temporairement tous les marqueurs (sauf cluster en focus).

- `visible` (*boolean*) : true pour afficher.

#### `gameplay_markerInteraction.setPreselectedMissionId(mId)`

Mémorise un ID de mission présélectionné (la variable n'est lue nulle part dans ce fichier).

- `mId` (*string|nil*) : ID de mission.

#### `gameplay_markerInteraction.showMissionMarkersToggled(active)`

À appeler quand le réglage d'affichage des marqueurs change : vide les POI bruts (gameplay_rawPois.clear) et force le renvoi des POI de grande carte.

- `active` (*boolean*) : Nouvel état (non utilisé).

#### `gameplay_markerInteraction.startMissionById(id, userSettings, startingOptions)`

Déprécié : logge une erreur et une trace de pile, ne démarre rien.

- `id` (*string*) : ID de mission (ignoré).
- `userSettings` (*table|nil*) : Ignoré.
- `startingOptions` (*table|nil*) : Ignoré.

#### `gameplay_markerInteraction.stopMissionById(id, force)`

Déprécié : logge une erreur et une trace de pile.

- `id` (*string*) : ID de mission (ignoré).
- `force` (*boolean|nil*) : Ignoré.

## Champs

| Champ | Type | Description |
|---|---|---|
| `abandonCurrent` | nil | Toujours nil : référence à une variable locale non définie. ⚠ référence `abandonCurrent` non définie dans le fichier (vaut probablement nil) |
| `dependencies` | string[] | gameplay_missions_missions, gameplay_missions_missionManager, freeroam_bigMapMode, gameplay_playmodeMarkers, freeroam_bigMapPoiProvider, ui_missionInfo. |
| `getClusterMarker` | nil | Toujours nil : référence à une variable locale non définie. ⚠ référence `getClusterMarker` non définie dans le fichier (vaut probablement nil) |
| `restartCurrent` | nil | Toujours nil : référence à une variable locale non définie. ⚠ référence `restartCurrent` non définie dans le fichier (vaut probablement nil) |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onActivityAcceptGatherData` — écouté par 7 module(s)
- `onMissionAvailabilityChanged` — écouté par 1 module(s)
- `onReachedTargetPos` — écouté par 2 module(s)

**Évènements UI (guihooks.trigger) :** `ActivityAcceptUpdate`, `onMissionAvailabilityChanged`

## Appels vers le moteur (C++)

- `be:` `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfAxisXYZ`, `getObjectVelocityXYZ`
- `debugDrawer:` `drawCylinder`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/markerInteraction.lua`.*
