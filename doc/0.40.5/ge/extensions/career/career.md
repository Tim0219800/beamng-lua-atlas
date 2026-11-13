# `career_career`

*Fichier : `lua/ge/extensions/career/career.lua` · VM : Game Engine (GE) · 790 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_career` : `extensions.load("career_career")`, puis la globale `career_career`

Point d'entrée du mode carrière. Il active et désactive la carrière : charge le niveau (west_coast_usa par défaut, ou celui de la sauvegarde), charge tous les modules de lua/ge/extensions/career/modules/ (sauf /tutorial/step), bloque certaines actions d'entrée (vehicleTeleporting, vehicleMenues, physicsControls, aiControls…), affiche un menu de debug imgui, gère les modes de départ (startingModes), le véhicule de départ, les interactions avec les organisations, la liste des profils/sauvegardes envoyée à l'UI et la sauvegarde de general.json (niveau, options de départ, boughtStarterVehicle, organizationInteraction).

## Exemple

```lua
career_career.createOrLoadCareerAndStart('monProfil', nil, {startMode = 'apmOnboarding'})
if career_career.isActive() then print(career_career.getBeamXPLevel(250)) end
```

## Remarques

- Activation : activateCareer demande l'écran de chargement, émet le hook onBeforeCareerActivate, lit <sauvegarde>/career/general.json ; si le niveau courant diffère, lance freeroam_freeroam.startFreeroam et charge les modules à la fin ; sinon supprime les véhicules (core_vehicles.removeAll, ou seulement ceux hors trafic/parking si removeVehicles est faux) puis émet onCareerActive(true, newSave).
- Désactivation : onCareerActive(false) est émis à tous les modules (27 l'écoutent) et les actions d'entrée sont débloquées.
- Tutoriel : M.tutorialEnabled est vrai si startingOptions.startMode == « apmOnboarding » et que le véhicule de départ n'a pas encore été acheté ; l'autosave est alors désactivé.
- Niveaux BeamXP (beamXPLevels) : seuils 0, 100, 300, 600 et 1000.
- Bug : dans toggleCareerModules, l'appel extensions.luaPathToExtName(modulePath) utilise une variable modulePath non définie (nil) et son résultat est ignoré.
- deactivateCareer et deactivateCareerAndReloadLevel acceptent saveCareer mais ne l'utilisent pas.
- Le menu debug (imgui) n'existe que si debugMenuEnabled, vrai par défaut hors version shipping_build ; il est relié à M.onUpdate uniquement pendant que la carrière est active.
- onSerialize désactive la carrière et note reactivate = true ; onDeserialized la réactive avec removeVehicles = false (utile lors d'un rechargement des extensions Lua).
- onLoadingScreenFadeout navigue vers « play » une seule fois après une activation avec chargement de niveau (drapeau playNavigationPendingAfterActivation).
- onClientEndMission désactive la carrière si le niveau qui se termine est west_coast_usa.

**Dépendances (chargées avant) :** `career_saveSystem`, `core_recoveryPrompt`, `gameplay_traffic`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_career.activateCareer(removeVehicles)` | Active la carrière pour le profil courant (career_saveSystem.getCurrentProfile) : sans effet si déjà active ou sans profil. Charge le niveau et les modules (voir notes). | 257 |
| `career_career.closeAllMenus()` | Ferme les menus en naviguant vers l'écran « play ». | 715 |
| `career_career.createOrLoadCareerAndStart(name, specificAutosave, startingOptions)` | Sélectionne (ou crée) un profil de sauvegarde avec career_saveSystem.setProfile puis active la carrière avec les options de départ données. | 342 |
| `career_career.deactivateCareer(saveCareer)` | Désactive la carrière : décharge les modules, débloque les actions, remet les valeurs de récupération du freeroam et cache la liste des tâches. | 317 |
| `career_career.deactivateCareerAndReloadLevel(saveCareer)` | Désactive la carrière puis relance le niveau courant en freeroam. | 332 |
| `career_career.getAdditionalMenuButtons()` | Boutons ajoutés au menu pause : carte (ou « mon chargement » en livraison), progression (si le véhicule de départ est acheté et hors tutoriel), annulation de certification, annulation d'essai routier. | 728 |
| `career_career.getAutosavesForProfile(profile)` | Pour chaque dossier de sauvegarde du profil, retourne le contenu de playerAttributes.json avec id et autosaveName. | 599 |
| `career_career.getBeamXPLevel(xp)` | Calcule le niveau BeamXP : seuils 0, 100, 300, 600, 1000. Retourne -1 pour les valeurs de progression s'il n'y a pas de niveau suivant. | 451 |
| `career_career.getCurrentStartingModeData()` | Retourne la définition complète du mode de départ de la partie courante (startingOptions.startMode), ou nil. | 398 |
| `career_career.getSaveFoldersForProfile(profile)` | Retourne la liste des dossiers de sauvegarde d'un profil avec ce qu'il faut à l'UI pour choisir (nom, dates, version, corrupted, isCurrent, incompatibleVersion, outdatedVersion, money, beamXP, vehicleCount), triée du plus récent au plus ancien. | 614 |
| `career_career.getStartingModeOptions()` | Liste les modes de départ (fichiers *.lua de lua/ge/extensions/career/startingModes/ exécutés par dofile, sauf ceux avec ignore) et retourne pour l'UI : id, order, tier, title, description, image, tag, triés par order puis id. | 359 |
| `career_career.hasBoughtStarterVehicle()` | Indique si le joueur a acheté son véhicule de départ. | 688 |
| `career_career.hasInteractedWithOrganization(id)` | Indique si le joueur a déjà interagi avec une organisation. | 692 |
| `career_career.interactWithOrganization(id)` | Note que le joueur a interagi avec une organisation (sauvegardé dans general.json). | 696 |
| `career_career.isActive()` | Indique si la carrière est active. | 338 |
| `career_career.isAutosaveEnabled()` | Indique si l'autosave est autorisé. | 720 |
| `career_career.onAnyMissionChanged(state, mission)` | Hook de changement d'état d'un défi : bloque les actions d'entrée quand il s'arrête (« stopped ») et les débloque quand il démarre (« started »). *(interne)* *(hook)* | 677 |
| `career_career.onBeforeSetProfile(currentSavePath)` | Hook appelé avant de changer de profil : désactive la carrière si elle est active. *(interne)* *(hook)* | 438 |
| `career_career.onCameraModeChanged(modeName)` | Hook de changement de mode caméra : met à jour le blocage du nodegrabber si la carrière est active. *(interne)* *(hook)* | 69 |
| `career_career.onCareerActive(active)` | Hook onCareerActive reçu par ce module lui-même (émis par initAfterLevelLoad et deactivateCareer). À l'activation : applique les valeurs de récupération carrière ou tutoriel, vide la liste de tâches et les POI bruts, installe M.onUpdate (menu debug), bloque les actions d'entrée et passe l'état de jeu à « career ». Ne fait rien si active est faux. *(interne)* *(hook)* | 158 |
| `career_career.onClientEndMission(levelPath)` | Hook de fin de niveau : désactive la carrière si le niveau est west_coast_usa. *(interne)* *(hook)* | 654 |
| `career_career.onClientPostStartMission()` | Hook après le démarrage d'un niveau : exécute l'initialisation différée de la carrière (émet onCareerActive(true, newSave)). *(interne)* *(hook)* | 240 |
| `career_career.onDeserialized(v)` | Hook après rechargement : réactive la carrière (activateCareer(false)) si v.reactivate. *(interne)* *(hook)* | 671 |
| `career_career.onGlobalCameraSet(modeName)` | Hook de changement de caméra globale : met à jour le blocage du nodegrabber. *(interne)* *(hook)* | 74 |
| `career_career.onLoadingScreenFadeout()` | Navigue vers « play » exactement une fois, à la fin du fondu de l'écran de chargement qui suit l'activation (le routeur renvoie la demande jusqu'à ce que l'UI confirme). *(interne)* *(hook)* | 250 |
| `career_career.onSaveCurrentProfile(currentSavePath)` | Hook de sauvegarde du profil : écrit career/general.json (niveau, startingOptions, boughtStarterVehicle, organizationInteraction, états des fenêtres de debug). *(interne)* *(hook)* | 417 |
| `career_career.onSerialize()` | Hook de rechargement des extensions : désactive la carrière et note reactivate = true si elle était active. *(interne)* *(hook)* | 662 |
| `career_career.onVehicleAddedToInventory(data)` | Hook d'ajout d'un véhicule à l'inventaire : marque le véhicule de départ comme acheté (sauvegarde immédiate) et débloque le succès FIRST_SET_OF_KEYS pour un achat instantané chez apmStarterVehicles. *(interne)* *(hook)* | 701 |
| `career_career.sendAllCareerProfilesData()` | Construit les infos de chaque profil (argent, beamXP, vouchers, score d'assurance, branches « apm », véhicule courant, nombre de véhicules, versions) et les envoie à l'UI via guihooks « allCareerProfiles » ; trie par creationDate. | 569 |
| `career_career.sendCurrentProfileData()` | Retourne les infos du profil courant (même format qu'un profil de sendAllCareerProfilesData). Nil si la carrière n'est pas active. | 591 |
| `career_career.setAutosaveEnabled(enabled)` | Active ou coupe l'autosave. | 724 |
| `career_career.setDebugMenuEnabled(enabled)` | Active ou coupe le menu de debug imgui de la carrière. | 749 |

### Détail des paramètres

#### `career_career.activateCareer(removeVehicles)`

Active la carrière pour le profil courant (career_saveSystem.getCurrentProfile) : sans effet si déjà active ou sans profil. Charge le niveau et les modules (voir notes).

- `removeVehicles` (*boolean|nil*) : Supprimer tous les véhicules du niveau déjà chargé ; true par défaut.

#### `career_career.createOrLoadCareerAndStart(name, specificAutosave, startingOptions)`

Sélectionne (ou crée) un profil de sauvegarde avec career_saveSystem.setProfile puis active la carrière avec les options de départ données.

- `name` (*string*) : Nom du profil.
- `specificAutosave` (*string|nil*) : Nom d'une autosave précise à charger.
- `startingOptions` (*table|nil*) : Options de départ (copiées).
- **renvoie** : boolean false si le profil n'a pas pu être sélectionné.

#### `career_career.deactivateCareer(saveCareer)`

Désactive la carrière : décharge les modules, débloque les actions, remet les valeurs de récupération du freeroam et cache la liste des tâches.

- `saveCareer` (*boolean|nil*) : Non utilisé.

#### `career_career.deactivateCareerAndReloadLevel(saveCareer)`

Désactive la carrière puis relance le niveau courant en freeroam.

- `saveCareer` (*boolean|nil*) : Transmis à deactivateCareer.

#### `career_career.getAdditionalMenuButtons()`

Boutons ajoutés au menu pause : carte (ou « mon chargement » en livraison), progression (si le véhicule de départ est acheté et hors tutoriel), annulation de certification, annulation d'essai routier.

- **renvoie** : table[] Boutons {label, luaFun, showIndicator?}.

#### `career_career.getAutosavesForProfile(profile)`

Pour chaque dossier de sauvegarde du profil, retourne le contenu de playerAttributes.json avec id et autosaveName.

- `profile` (*string*) : Nom du profil.
- **renvoie** : table[] Attributs de chaque autosave.

#### `career_career.getBeamXPLevel(xp)`

Calcule le niveau BeamXP : seuils 0, 100, 300, 600, 1000. Retourne -1 pour les valeurs de progression s'il n'y a pas de niveau suivant.

- `xp` (*number*) : Valeur de BeamXP.
- **renvoie** : integer Niveau (1 à 5).
- **renvoie** : number Progression dans le niveau courant (-1 au maximum).
- **renvoie** : number Seuil requis pour le niveau suivant (-1 au maximum).

#### `career_career.getCurrentStartingModeData()`

Retourne la définition complète du mode de départ de la partie courante (startingOptions.startMode), ou nil.

- **renvoie** : table|nil Données du mode de départ.

#### `career_career.getSaveFoldersForProfile(profile)`

Retourne la liste des dossiers de sauvegarde d'un profil avec ce qu'il faut à l'UI pour choisir (nom, dates, version, corrupted, isCurrent, incompatibleVersion, outdatedVersion, money, beamXP, vehicleCount), triée du plus récent au plus ancien.

- `profile` (*string|nil*) : Nom du profil ; liste vide si nil.
- **renvoie** : table[] Dossiers de sauvegarde.

#### `career_career.getStartingModeOptions()`

Liste les modes de départ (fichiers *.lua de lua/ge/extensions/career/startingModes/ exécutés par dofile, sauf ceux avec ignore) et retourne pour l'UI : id, order, tier, title, description, image, tag, triés par order puis id.

- **renvoie** : table[] Modes de départ.

#### `career_career.hasBoughtStarterVehicle()`

Indique si le joueur a acheté son véhicule de départ.

- **renvoie** : boolean|nil Résultat.

#### `career_career.hasInteractedWithOrganization(id)`

Indique si le joueur a déjà interagi avec une organisation.

- `id` (*string*) : Identifiant de l'organisation.
- **renvoie** : boolean|nil true si déjà interagi.

#### `career_career.interactWithOrganization(id)`

Note que le joueur a interagi avec une organisation (sauvegardé dans general.json).

- `id` (*string*) : Identifiant de l'organisation.

#### `career_career.isActive()`

Indique si la carrière est active.

- **renvoie** : boolean true si active.

#### `career_career.isAutosaveEnabled()`

Indique si l'autosave est autorisé.

- **renvoie** : boolean État.

#### `career_career.onAnyMissionChanged(state, mission)`

Hook de changement d'état d'un défi : bloque les actions d'entrée quand il s'arrête (« stopped ») et les débloque quand il démarre (« started »).

- `state` (*string*) : « started » ou « stopped ».
- `mission` (*table|nil*) : Défi concerné.

#### `career_career.onBeforeSetProfile(currentSavePath)`

Hook appelé avant de changer de profil : désactive la carrière si elle est active.

- `currentSavePath` (*string*) : Dossier de sauvegarde courant.

#### `career_career.onCameraModeChanged(modeName)`

Hook de changement de mode caméra : met à jour le blocage du nodegrabber si la carrière est active.

- `modeName` (*string*) : Nom du mode.

#### `career_career.onCareerActive(active)`

Hook onCareerActive reçu par ce module lui-même (émis par initAfterLevelLoad et deactivateCareer). À l'activation : applique les valeurs de récupération carrière ou tutoriel, vide la liste de tâches et les POI bruts, installe M.onUpdate (menu debug), bloque les actions d'entrée et passe l'état de jeu à « career ». Ne fait rien si active est faux.

- `active` (*boolean*) : true à l'activation.

#### `career_career.onClientEndMission(levelPath)`

Hook de fin de niveau : désactive la carrière si le niveau est west_coast_usa.

- `levelPath` (*string*) : Chemin du niveau qui se termine.

#### `career_career.onDeserialized(v)`

Hook après rechargement : réactive la carrière (activateCareer(false)) si v.reactivate.

- `v` (*table*) : Données de onSerialize.

#### `career_career.onGlobalCameraSet(modeName)`

Hook de changement de caméra globale : met à jour le blocage du nodegrabber.

- `modeName` (*string*) : Nom du mode.

#### `career_career.onSaveCurrentProfile(currentSavePath)`

Hook de sauvegarde du profil : écrit career/general.json (niveau, startingOptions, boughtStarterVehicle, organizationInteraction, états des fenêtres de debug).

- `currentSavePath` (*string*) : Dossier de sauvegarde.

#### `career_career.onSerialize()`

Hook de rechargement des extensions : désactive la carrière et note reactivate = true si elle était active.

- **renvoie** : table Données ({reactivate = true} si active).

#### `career_career.onVehicleAddedToInventory(data)`

Hook d'ajout d'un véhicule à l'inventaire : marque le véhicule de départ comme acheté (sauvegarde immédiate) et débloque le succès FIRST_SET_OF_KEYS pour un achat instantané chez apmStarterVehicles.

- `data` (*table*) : Contient purchaseData et vehicleInfo.

#### `career_career.sendAllCareerProfilesData()`

Construit les infos de chaque profil (argent, beamXP, vouchers, score d'assurance, branches « apm », véhicule courant, nombre de véhicules, versions) et les envoie à l'UI via guihooks « allCareerProfiles » ; trie par creationDate.

- **renvoie** : table[] Données des profils.

#### `career_career.sendCurrentProfileData()`

Retourne les infos du profil courant (même format qu'un profil de sendAllCareerProfilesData). Nil si la carrière n'est pas active.

- **renvoie** : table|nil Données du profil.

#### `career_career.setAutosaveEnabled(enabled)`

Active ou coupe l'autosave.

- `enabled` (*boolean*) : Nouvel état.

#### `career_career.setDebugMenuEnabled(enabled)`

Active ou coupe le menu de debug imgui de la carrière.

- `enabled` (*boolean*) : Nouvel état.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | career_saveSystem, core_recoveryPrompt, gameplay_traffic. |
| `startingOptions` | table | Options de départ de la partie (par ex. startMode), venues de createOrLoadCareerAndStart ou de la sauvegarde. |
| `tutorialEnabled` | boolean | Vrai pendant le tutoriel de la carrière (voir notes). |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onBeforeCareerActivate` — écouté par 1 module(s)
- `onCareerActive` — écouté par 27 module(s)

**Évènements UI (guihooks.trigger) :** `ClearTasklist`, `HideCareerTasklist`, `allCareerProfiles`

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `be:` `getObject`, `getObjectCount`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/career.lua`.*
