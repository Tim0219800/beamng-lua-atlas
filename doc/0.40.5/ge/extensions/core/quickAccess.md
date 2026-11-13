# `core_quickAccess`

*Fichier : `lua/ge/extensions/core/quickAccess.lua` · VM : Game Engine (GE) · 2782 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_quickAccess` : `extensions.load("core_quickAccess")`, puis la globale `core_quickAccess`

Extension GE `core_quickAccess` : le menu radial (menu rapide) du jeu. Elle garde un arbre de menus (chemins du type '/root/sandbox/other/'), l'assemble à l'ouverture (entrées statiques, générateurs, entrées demandées au véhicule joueur), le positionne sur les 8 emplacements du cercle puis l'envoie à l'interface (guihooks 'radialMenuUpdated', route UI 'radial'). Elle ralentit le temps pendant que le menu est ouvert, mémorise les actions récentes et la configuration des emplacements dynamiques (settings/radialRecentActions.json et settings/radialDynamicSlotSettings.json). Un mod ajoute ses propres boutons avec core_quickAccess.addEntry, de préférence dans le hook onRegisterQuickAccessMenus.

## Exemple

```lua
-- dans l'extension du mod (GE)
local M = {}
local function onRegisterQuickAccessMenus()
  if not core_quickAccess then return end
  core_quickAccess.addEntry({
    level = '/root/sandbox/other/',   -- sous-menu "Autres"
    uniqueID = 'monModAction',        -- remplace l'entrée si déjà présente, permet les actions récentes
    generator = function(entries)     -- appelé à chaque ouverture, ajoute des boutons à `entries`
      table.insert(entries, {
        title = 'Mon action', icon = 'wrench', uniqueID = 'monModAction',
        onSelect = function() log('I','','clic') return {'hide'} end,
      })
    end,
  })
end
M.onRegisterQuickAccessMenus = onRegisterQuickAccessMenus
return M
```

## Remarques

- COMMENT UN MOD AJOUTE DES ENTRÉES : (1) définir dans son extension GE le hook onRegisterQuickAccessMenus (appelé par registerDefaultMenus au premier onInit de core_quickAccess, après les menus de base) et y appeler core_quickAccess.addEntry(...). (2) Si l'extension est chargée plus tard, appeler addEntry directement ou écouter onQuickAccessLoaded (émis à onExtensionLoaded de quickAccess). Les entrées ajoutées après le premier onInit ne sont prises en compte qu'à la prochaine ouverture du menu (l'arbre est recopié à chaque show). core_quickAccess.registerMenu est obsolète : il se contente de logger une erreur.
- Arguments de addEntry : `level` (chemin du menu ; défaut '/root/sandbox/general/' ; s'il ne commence pas par '/root/' il est préfixé par '/root/sandbox' ; un '/' final est ajouté) ; soit `generator = function(entries)` qui insère des tables-boutons dans `entries`, soit directement `title` + (`onSelect` ou `goto`). Si `uniqueID` est donné, une entrée existante du même level avec le même uniqueID est remplacée. L'argument est copié par deepcopy : ne pas y mettre d'objets partagés dont l'identité compte, mais les fonctions sont conservées.
- Champs d'un bouton (lus dans le code) : title (clé de traduction ou texte), desc, icon (nom d'icône ; les anciens noms listés dans ui/assets/iconMappings/iconTags.json sont remplacés avec un avertissement), goto (chemin d'un sous-menu : le bouton devient un dossier), onSelect/onSecondarySelect/onTertiarySelect(item) pour les actions 1, 2, 3, onDeselect/onSecondaryDeselect/onTertiaryDeselect(item) au relâchement, startSlot/endSlot (position), priority, uniqueID, enabled (défaut true), categoryOrder (pour les catégories), ignoreAsRecentAction, ignoreForCheckingIfMenuIsEmpty, contextAction (fonction, appelée par contextAction()), dynamicSlot = {id=...}.
- Valeur de retour de onSelect/onDeselect : une table dont le 1er élément est l'ordre : {'hide'} ferme le menu, {'reload'} le reconstruit, {'goto', chemin} ouvre un sous-menu, {'back'} revient, {'hideMeOnly'} ferme, {'temporaryHide'} masque l'interface en remettant le temps normal (pour viser/cliquer), {'temporaryUnhide'} la réaffiche et ralentit de nouveau, {'hideAndIgnoreSlowmotion'} ferme sans restaurer le temps. Tout autre retour (nil compris) est loggé comme erreur 'invalid item result args' : toujours renvoyer une table.
- Emplacements du cercle (maxSlotAmount = 8) : 1 gauche, 3 haut, 5 droite, 7 bas, 2/4/6/8 diagonales. startSlot seul = 1 case ; startSlot + endSlot = bouton large couvrant la plage. Deux boutons aux emplacements qui se chevauchent : le second perd sa position avec un avertissement. Les boutons sans emplacement sont répartis dans les trous. Plus de boutons que de place restent possibles (ils rétrécissent).
- Les niveaux racines valides sont '/root/playerVehicle/' (actions véhicule, défaut '/root/playerVehicle/general/') et '/root/sandbox/' (défaut '/root/sandbox/quick/'; remplacé par '/root/sandbox/career/' en carrière et '/root/sandbox/mission/' pendant un défi). Catégories sandbox de base : other, funStuff, repair, quick, mission, career, vehicles, traffic, ai. Les boutons goto manquants entre niveaux sont ajoutés automatiquement (titre via toNiceName, icône 'material_traffic'). Un niveau vide (aucun bouton utile) est retiré de l'arbre sauf les chemins protégés.
- Les entrées côté véhicule (VM véhicule) passent par vehicle/extensions core_quickAccess.requestItems : à l'ouverture le GE envoie requestItems(level) au véhicule joueur et attend jusqu'à 4 frames GFX (vehicleWaitFrames). Au-delà, onUpdate affiche le menu quand même avec une erreur 'vehicle didn't respond in time'. Le véhicule rappelle vehicleItemsCallback(objID, level, tree). Les sélections d'items venant du véhicule sont renvoyées à son extension via selectItem.
- Emplacements dynamiques (dynamicSlot) : emplacements configurables par le joueur (ids comme root_up, sandbox_left, vehicle_down, funstuff_left...) avec un mode 'recentActions', 'uniqueAction' (action précise identifiée par level + uniqueID) ou 'empty'. Seules les actions ayant un uniqueID et sans ignoreAsRecentAction sont mémorisées comme actions récentes (10 max pour 'all'). Donner un uniqueID stable permet donc à un mod d'apparaître dans ces emplacements.
- Bug probable : dans _assembleMenuComplete, `if not item.title then item.title = toNiceName(str) end` utilise une variable `str` jamais définie (nil), donc une catégorie sans title provoquerait une erreur dans toNiceName (déduit du code).
- Incohérence : au chargement, `recentActions` ne contient que la catégorie 'all', mais clearRecentActions() la remplace par une table avec playerVehicle, sandbox, other et all.
- Dans selectItem et contextAction, si l'item n'existe pas, l'erreur est loggée mais le code continue : selectItem appelle itemAction(nil) (ignoré) mais contextAction lit m.contextAction sur nil et plante.
- Dépendances chargées avant : core_vehicleTriggers, core_funstuff. Le module utilise aussi le global ui_imgui (im) et lit settings/radialFavorites.json comme nom (variable safeFile non utilisée dans les parties lues).

**Dépendances (chargées avant) :** `core_vehicleTriggers`, `core_funstuff`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_quickAccess.addEntry(_args)` | Ajoute (ou remplace, si uniqueID identique au même level) une entrée dans l'arbre du menu radial. Voir notes pour tous les champs. Renvoie false seulement si `level` n'est pas une chaîne ; un avertissement est loggé si l'entrée n'a ni générateur, ni title avec onSelect/goto, mais l'entrée est quand même ajoutée. | 619 |
| `core_quickAccess.adjustCruiseSpeed(direction)` | Callback de l'interface : demande au véhicule joueur d'ajuster la vitesse du régulateur (extension côté véhicule). *(interne)* | 2480 |
| `core_quickAccess.back()` | Revient au niveau précédent (historique), ou au niveau parent selon le chemin si l'historique est vide. | 2182 |
| `core_quickAccess.beginRouteHandoff()` | Marque le passage du menu radial vers un écran enfant (ex. radial.mirrors) sans vraie fermeture, et masque temporairement l'interface. *(interne)* | 2219 |
| `core_quickAccess.clearRecentActions()` | Efface l'historique des actions récentes et émet onQuickAccessClearRecentActions. | 2279 |
| `core_quickAccess.contextAction(id, buttonDown, actionIndex)` | Appelée par l'interface pour l'action contextuelle d'un bouton (ex. ouvrir la configuration d'un emplacement dynamique). *(interne)* | 2499 |
| `core_quickAccess.endRouteHandoff()` | Termine le handoff et réaffiche le menu (temps ralenti de nouveau). *(interne)* | 2224 |
| `core_quickAccess.finishRouteHandoffExit()` | Nettoie l'état radial quand un écran enfant retourne directement au jeu, sans renaviguer vers 'play'. *(interne)* | 2237 |
| `core_quickAccess.getDynamicSlotConfigurationData()` | Prépare pour l'interface les données de configuration de l'emplacement ouvert par openDynamicSlotConfigurator (arbre de menus et réglage courant). Plante si aucun emplacement n'a été ouvert. *(interne)* | 467 |
| `core_quickAccess.getMostRecentAvailableActions(category, limit, dynamicItems)` | Renvoie les actions récentes (de la catégorie donnée) encore disponibles dans le menu, hors celles déjà affectées à un emplacement 'uniqueAction', limitées à `limit`. *(interne)* | 1897 |
| `core_quickAccess.getMovedRadialLastTimeMs()` | Renvoie l'instant (ms système) du dernier appel de moved(). *(interne)* | 2537 |
| `core_quickAccess.getUiData()` | Renvoie les données envoyées à l'interface du menu : canGoBack, items, categories, pathBeforeCategory, selectedCategory, backButtonIndex, currentLevel, breadcrumbs, menuIcon, hasLRShoulderButtons, tutorialHighlightTargets. *(interne)* | 1765 |
| `core_quickAccess.getVehicleName(veh)` | Construit un nom lisible du véhicule : marque, nom et configuration d'après core_vehicles.getModel ; sinon le nom JBeam. | 2660 |
| `core_quickAccess.gotoLevel(level)` | Va vers un autre niveau de menu en empilant le niveau actuel dans l'historique (pour back). | 2138 |
| `core_quickAccess.isEnabled()` | Indique si le menu radial est actuellement affiché. | 275 |
| `core_quickAccess.isRouteHandoffActive()` | Indique si un handoff vers un écran enfant est en cours. *(interne)* | 2230 |
| `core_quickAccess.moved()` | Enregistre l'instant actuel comme dernier mouvement du curseur radial (appelé par l'interface). *(interne)* | 2541 |
| `core_quickAccess.onBeforeBigMapActivated()` | Avant l'ouverture de la grande carte : ferme le menu radial. *(interne)* *(hook)* | 2656 |
| `core_quickAccess.onClientEndMission()` | À la fin d'un niveau : sauvegarde les actions récentes. *(interne)* *(hook)* | 2632 |
| `core_quickAccess.onExit()` | À la fermeture du jeu : sauvegarde les actions récentes. *(interne)* *(hook)* | 2628 |
| `core_quickAccess.onExtensionLoaded()` | Au chargement : émet onQuickAccessLoaded, lit les actions récentes et les réglages d'emplacements dynamiques. *(interne)* *(hook)* | 2618 |
| `core_quickAccess.onExtensionUnloaded()` | Au déchargement : sauvegarde les actions récentes. *(interne)* *(hook)* | 2624 |
| `core_quickAccess.onInit()` | Hook d'initialisation de l'extension : au premier appel enregistre les menus par défaut (puis émet onRegisterQuickAccessMenus), puis ferme le menu. *(interne)* *(hook)* | 2471 |
| `core_quickAccess.onSerialize()` | Avant un rechargement Lua : ferme le menu et sauvegarde actions récentes et emplacements dynamiques. *(interne)* *(hook)* | 2650 |
| `core_quickAccess.onUiChangedState(toState)` | Quand la route UI change : si une autre route prend le dessus pendant que le menu est visible, le ferme sans naviguer ; termine aussi un handoff quand l'état devient 'play'. *(interne)* *(hook)* | 2640 |
| `core_quickAccess.onUpdate()` | Appelé à chaque frame GFX : gère le délai d'attente des entrées du véhicule (4 frames) et force l'assemblage si le véhicule ne répond pas. *(interne)* *(hook)* | 2590 |
| `core_quickAccess.onVehicleSpawned()` | Quand un véhicule apparaît : sauvegarde les actions récentes. *(interne)* *(hook)* | 2636 |
| `core_quickAccess.onVehicleSwitched()` | Au changement de véhicule joueur : recharge le menu s'il est ouvert. *(interne)* *(hook)* | 2611 |
| `core_quickAccess.openDynamicSlotConfigurator(dynamicSlotKey)` | Ouvre l'écran de configuration d'un emplacement dynamique (guihooks 'OpenDynamicSlotConfigurator', hook onOpenDynamicSlotConfigurator). | 460 |
| `core_quickAccess.registerMenu()` | Obsolète : logge une erreur demandant d'utiliser addEntry, ne fait rien d'autre. | 2754 |
| `core_quickAccess.reload()` | Reconstruit et réaffiche le niveau courant (si le menu est ouvert). | 2178 |
| `core_quickAccess.resetDynamicSlotSettings()` | Restaure la configuration par défaut des emplacements dynamiques, la sauvegarde et émet onQuickAccessResetDynamicSlotSettings. | 347 |
| `core_quickAccess.resetSlowMoFactor()` | Remet le facteur de ralenti à sa valeur d'origine (0.01). | 26 |
| `core_quickAccess.selectItem(id, buttonDown, actionIndex)` | Appelée par l'interface quand le joueur appuie/relâche un bouton : exécute l'action de l'item d'index id dans le menu courant. *(interne)* | 2488 |
| `core_quickAccess.setDynamicSlotConfiguration(dynamicSlotKey, data)` | Enregistre le choix du joueur pour un emplacement dynamique (modes uniqueAction, recentActions ou empty), émet les hooks onQuickAccessSetUniqueAction / SetRecentActions / SetEmpty puis onQuickAccessSetDynamicSlotConfiguration, sauvegarde et recharge le menu. | 534 |
| `core_quickAccess.setEnabled(enabled, level, force)` | Ouvre ou ferme le menu. L'ouverture n'a lieu que si l'état UI est 'play' ou inconnu, ou si le menu est déjà visible, ou si force. Émet le hook onQuickAccessOpened(level). La fermeture est ignorée pendant un route handoff. | 2511 |
| `core_quickAccess.setSlowMoFactor(factor)` | Définit le facteur de temps (simTimeAuthority) appliqué pendant que le menu radial est ouvert. 0.01 par défaut. | 25 |
| `core_quickAccess.setTutorialHighlightTargets(targets)` | Définit la liste d'identifiants à mettre en évidence dans le menu (tutoriel). Les valeurs non chaînes, vides ou en double sont filtrées. Rafraîchit l'interface si visible. | 1769 |
| `core_quickAccess.toNiceName(str)` | Transforme un identifiant en nom lisible : '_' devient espace, espace avant chaque majuscule collée à une minuscule, première lettre de chaque mot en majuscule, reste en minuscules. | 562 |
| `core_quickAccess.toggle(level)` | Ouvre le menu s'il est fermé, le ferme sinon. Utilisée par l'action 'toggleRadialMenuMulti'. | 2528 |
| `core_quickAccess.tryAction(action)` | Exécute une action liée aux touches du menu parmi : toggleBigMap, toggleRadialMenuMulti, recoverVehicle, resetVehicle, activateStarterMotor. Ignorée si core_input_actionFilter la bloque ; une action inconnue est loggée en erreur. | 2719 |
| `core_quickAccess.vehicleItemSelectCallback(objID, args)` | Rappel du véhicule après exécution d'une action d'item : traite l'ordre renvoyé ({'hide'}, {'goto', ...}, etc.). *(interne)* | 2605 |
| `core_quickAccess.vehicleItemsCallback(objID, level, vehicleMenuTree)` | Rappel du véhicule joueur avec ses entrées de menu pour un niveau : les mémorise et affiche le menu. *(interne)* | 2125 |

### Détail des paramètres

#### `core_quickAccess.addEntry(_args)`

Ajoute (ou remplace, si uniqueID identique au même level) une entrée dans l'arbre du menu radial. Voir notes pour tous les champs. Renvoie false seulement si `level` n'est pas une chaîne ; un avertissement est loggé si l'entrée n'a ni générateur, ni title avec onSelect/goto, mais l'entrée est quand même ajoutée.

- `_args` (*table*) : { level, generator | (title, onSelect|goto, icon, desc, uniqueID, priority, startSlot, endSlot, ... ) }
- **renvoie** : boolean true si ajoutée, false si level invalide.

#### `core_quickAccess.adjustCruiseSpeed(direction)`

Callback de l'interface : demande au véhicule joueur d'ajuster la vitesse du régulateur (extension côté véhicule).

- `direction` (*number*) : Positif = augmenter, négatif = diminuer ; 0 ou non-nombre ignoré.

#### `core_quickAccess.back()`

Revient au niveau précédent (historique), ou au niveau parent selon le chemin si l'historique est vide.

- **renvoie** : boolean true si on a changé de niveau, false sinon (menu fermé ou déjà en haut).

#### `core_quickAccess.contextAction(id, buttonDown, actionIndex)`

Appelée par l'interface pour l'action contextuelle d'un bouton (ex. ouvrir la configuration d'un emplacement dynamique).

- `id` (*integer*) : Indice de l'item.
- `buttonDown` (*boolean*) : Non utilisé (déduit du code).
- `actionIndex` (*integer|nil*) : Non utilisé (déduit du code).

#### `core_quickAccess.getDynamicSlotConfigurationData()`

Prépare pour l'interface les données de configuration de l'emplacement ouvert par openDynamicSlotConfigurator (arbre de menus et réglage courant). Plante si aucun emplacement n'a été ouvert.

- **renvoie** : table Données pour l'interface.

#### `core_quickAccess.getMostRecentAvailableActions(category, limit, dynamicItems)`

Renvoie les actions récentes (de la catégorie donnée) encore disponibles dans le menu, hors celles déjà affectées à un emplacement 'uniqueAction', limitées à `limit`.

- `category` (*string*) : Catégorie (ex. 'all').
- `limit` (*integer|nil*) : Nombre max ; nil ou 0 renvoie {}.
- `dynamicItems` (*table[]|nil*) : Items de type dynamicSlot du niveau courant.
- **renvoie** : table[] Enregistrements { uniqueID, level, title, timestamp, icon }.

#### `core_quickAccess.getMovedRadialLastTimeMs()`

Renvoie l'instant (ms système) du dernier appel de moved().

- **renvoie** : number Millisecondes (0 si jamais).

#### `core_quickAccess.getUiData()`

Renvoie les données envoyées à l'interface du menu : canGoBack, items, categories, pathBeforeCategory, selectedCategory, backButtonIndex, currentLevel, breadcrumbs, menuIcon, hasLRShoulderButtons, tutorialHighlightTargets.

- **renvoie** : table|nil uiData, nil avant la première ouverture.

#### `core_quickAccess.getVehicleName(veh)`

Construit un nom lisible du véhicule : marque, nom et configuration d'après core_vehicles.getModel ; sinon le nom JBeam.

- `veh` (*userdata|nil*) : Objet véhicule ; nil renvoie la clé de traduction 'ui.radialmenu2.noVehicle'.
- **renvoie** : string Nom du véhicule.

#### `core_quickAccess.gotoLevel(level)`

Va vers un autre niveau de menu en empilant le niveau actuel dans l'historique (pour back).

- `level` (*string*) : Chemin du niveau cible.

#### `core_quickAccess.isEnabled()`

Indique si le menu radial est actuellement affiché.

- **renvoie** : boolean true si l'interface radiale est visible.

#### `core_quickAccess.isRouteHandoffActive()`

Indique si un handoff vers un écran enfant est en cours.

- **renvoie** : boolean true si actif.

#### `core_quickAccess.onUiChangedState(toState)`

Quand la route UI change : si une autre route prend le dessus pendant que le menu est visible, le ferme sans naviguer ; termine aussi un handoff quand l'état devient 'play'.

- `toState` (*string*) : Nouvel état/route UI.

#### `core_quickAccess.openDynamicSlotConfigurator(dynamicSlotKey)`

Ouvre l'écran de configuration d'un emplacement dynamique (guihooks 'OpenDynamicSlotConfigurator', hook onOpenDynamicSlotConfigurator).

- `dynamicSlotKey` (*string*) : Id de l'emplacement (ex. 'root_up').

#### `core_quickAccess.selectItem(id, buttonDown, actionIndex)`

Appelée par l'interface quand le joueur appuie/relâche un bouton : exécute l'action de l'item d'index id dans le menu courant.

- `id` (*integer*) : Indice (base 1) de l'item dans currentMenuItems.
- `buttonDown` (*boolean*) : true à l'appui, false au relâchement.
- `actionIndex` (*integer|nil*) : 1 = principale, 2 = secondaire, 3 = tertiaire (défaut 1).

#### `core_quickAccess.setDynamicSlotConfiguration(dynamicSlotKey, data)`

Enregistre le choix du joueur pour un emplacement dynamique (modes uniqueAction, recentActions ou empty), émet les hooks onQuickAccessSetUniqueAction / SetRecentActions / SetEmpty puis onQuickAccessSetDynamicSlotConfiguration, sauvegarde et recharge le menu.

- `dynamicSlotKey` (*string*) : Id de l'emplacement.
- `data` (*table*) : { mode, uniqueID, level } ou { mode, category }.

#### `core_quickAccess.setEnabled(enabled, level, force)`

Ouvre ou ferme le menu. L'ouverture n'a lieu que si l'état UI est 'play' ou inconnu, ou si le menu est déjà visible, ou si force. Émet le hook onQuickAccessOpened(level). La fermeture est ignorée pendant un route handoff.

- `enabled` (*boolean*) : true pour ouvrir, false pour fermer.
- `level` (*string|nil*) : Niveau à ouvrir (ex. '/root/sandbox/other/') ; nil = '/root/'.
- `force` (*boolean|nil*) : Ouvre même si un autre écran est actif.

#### `core_quickAccess.setSlowMoFactor(factor)`

Définit le facteur de temps (simTimeAuthority) appliqué pendant que le menu radial est ouvert. 0.01 par défaut.

- `factor` (*number*) : Facteur de vitesse de simulation (1 = temps réel).

#### `core_quickAccess.setTutorialHighlightTargets(targets)`

Définit la liste d'identifiants à mettre en évidence dans le menu (tutoriel). Les valeurs non chaînes, vides ou en double sont filtrées. Rafraîchit l'interface si visible.

- `targets` (*string[]*) : Identifiants de cibles.

#### `core_quickAccess.toNiceName(str)`

Transforme un identifiant en nom lisible : '_' devient espace, espace avant chaque majuscule collée à une minuscule, première lettre de chaque mot en majuscule, reste en minuscules.

- `str` (*string*) : Identifiant, ex. 'funStuff'.
- **renvoie** : string Ex. 'Fun Stuff'.

#### `core_quickAccess.toggle(level)`

Ouvre le menu s'il est fermé, le ferme sinon. Utilisée par l'action 'toggleRadialMenuMulti'.

- `level` (*string|nil*) : Niveau à ouvrir.

#### `core_quickAccess.tryAction(action)`

Exécute une action liée aux touches du menu parmi : toggleBigMap, toggleRadialMenuMulti, recoverVehicle, resetVehicle, activateStarterMotor. Ignorée si core_input_actionFilter la bloque ; une action inconnue est loggée en erreur.

- `action` (*string*) : Nom de l'action.

#### `core_quickAccess.vehicleItemSelectCallback(objID, args)`

Rappel du véhicule après exécution d'une action d'item : traite l'ordre renvoyé ({'hide'}, {'goto', ...}, etc.).

- `objID` (*integer*) : Id du véhicule (inutilisé).
- `args` (*table*) : Ordre à exécuter, même format que le retour de onSelect.

#### `core_quickAccess.vehicleItemsCallback(objID, level, vehicleMenuTree)`

Rappel du véhicule joueur avec ses entrées de menu pour un niveau : les mémorise et affiche le menu.

- `objID` (*integer*) : Id du véhicule.
- `level` (*string*) : Niveau demandé.
- `vehicleMenuTree` (*table*) : Table niveau -> liste d'entrées.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | { 'core_vehicleTriggers', 'core_funstuff' }, chargées avant cette extension. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onBeforeRadialOpened` — écouté par 3 module(s)
- `onHideRadialMenu` — écouté par 1 module(s)
- `onOpenDynamicSlotConfigurator`
- `onQuickAccessClearRecentActions`
- `onQuickAccessItemSelected`
- `onQuickAccessLoaded` — écouté par 2 module(s)
- `onQuickAccessOpened`
- `onQuickAccessResetDynamicSlotSettings`
- `onQuickAccessSetDynamicSlotConfiguration`
- `onQuickAccessSetEmpty`
- `onQuickAccessSetRecentActions`
- `onQuickAccessSetUniqueAction`
- `onRegisterQuickAccessMenus` — écouté par 1 module(s)
- `onVehicleFlippedUpright` — écouté par 1 module(s)
- `trackNewVeh`
- `trackVehReset`

**Évènements UI (guihooks.trigger) :** `OpenDynamicSlotConfigurator`, `RadialTemporaryHide`, `radialMenuUpdated`

## Appels vers le moteur (C++)

- `be:` `enterNextVehicle`, `enterVehicle`, `getObject`, `getObjectCount`, `getPlayerVehicle`, `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/quickAccess.lua`.*
