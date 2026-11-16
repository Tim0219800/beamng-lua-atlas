# `ui_missionInfo`

*Fichier : `lua/ge/extensions/ui/missionInfo.lua` · VM : Game Engine (GE) · 115 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_missionInfo` : `extensions.load("ui_missionInfo")`, puis la globale `ui_missionInfo`

Gère la fenêtre d'information de mission et l'invite d'activité (« activity accept ») affichée en jeu. Il mémorise les boutons actifs, envoie le contenu à l'interface par guihooks, joue le son d'ouverture, suit l'état ouvert/fermé et émet les hooks correspondants. Il bloque aussi, pendant l'invite sur la route « play », les actions qui partagent les mêmes touches que gameplay_interact.

## Remarques

- Événements guihooks émis : MissionInfoUpdate, ActivityAcceptUpdate, ActivityAcceptClose.
- Hooks émis : onActivityAcceptUpdate(content), onActivityIndexVisible(data), onMissionInfoChangedState(ancienEtat, nouvelEtat[, content]) ; l'état vaut « opened » ou « closed » (nil au départ).
- performAction exécute button.cmd avec loadstring, sans protection contre une erreur.
- setActivityIndexVisible suppose que elemDataTable existe (créé par openActivityAcceptDialogue) ; sinon erreur.
- closeDialogue dépile l'action map MissionUIActionMap ; openActivityAcceptDialogue ne la pousse pas (code commenté).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_missionInfo.closeDialogue()` | Ferme la fenêtre/l'invite : dépile MissionUIActionMap, vide buttonsTable, lève le blocage des actions, envoie MissionInfoUpdate(nil) et ActivityAcceptClose, passe à l'état « closed ». | 82 |
| `ui_missionInfo.onAfterRouteChange(routeEntry)` | Hook appelé après un changement de route de l'interface ; active le blocage des actions en conflit seulement si l'invite a du contenu et que la route est « play ». *(interne)* *(hook)* | 109 |
| `ui_missionInfo.onInputBindingsChanged()` | Hook appelé quand les liaisons de touches changent ; recalcule le filtre d'actions si le blocage est actif. *(interne)* *(hook)* | 105 |
| `ui_missionInfo.openActivityAcceptDialogue(content)` | Affiche l'invite d'activités : mémorise elem.buttonFun et elem.data de chaque élément, active ou non le blocage des actions en conflit, émet onActivityAcceptUpdate puis ActivityAcceptUpdate et passe à l'état « opened ». | 58 |
| `ui_missionInfo.openDialogue(content)` | Ouvre la fenêtre d'information : pousse l'action map MissionUIActionMap (sauf si content.actionMap == false), mémorise content.buttons, envoie MissionInfoUpdate à l'UI et joue le son UI>Missions>Info_Open. | 38 |
| `ui_missionInfo.performAction(actionName)` | Cherche dans buttonsTable le bouton dont action vaut actionName et exécute sa commande Lua (button.cmd). | 26 |
| `ui_missionInfo.performActivityAction(id)` | Appelle la fonction du bouton d'index id dans buttonsTable (rien si elle n'existe pas). | 51 |
| `ui_missionInfo.setActivityIndexVisible(index)` | Signale quel élément de l'invite est visible : émet onActivityIndexVisible avec ses données, ou nil si index vaut -1. | 96 |

### Détail des paramètres

#### `ui_missionInfo.onAfterRouteChange(routeEntry)`

Hook appelé après un changement de route de l'interface ; active le blocage des actions en conflit seulement si l'invite a du contenu et que la route est « play ».

- `routeEntry` (*table*) : Entrée de route (resolved.name).

#### `ui_missionInfo.openActivityAcceptDialogue(content)`

Affiche l'invite d'activités : mémorise elem.buttonFun et elem.data de chaque élément, active ou non le blocage des actions en conflit, émet onActivityAcceptUpdate puis ActivityAcceptUpdate et passe à l'état « opened ».

- `content` (*table*) : Liste d'éléments {buttonFun, data, ...} ; vide pour retirer l'invite.

#### `ui_missionInfo.openDialogue(content)`

Ouvre la fenêtre d'information : pousse l'action map MissionUIActionMap (sauf si content.actionMap == false), mémorise content.buttons, envoie MissionInfoUpdate à l'UI et joue le son UI>Missions>Info_Open.

- `content` (*table|nil*) : Contenu à afficher, avec éventuellement buttons et actionMap.

#### `ui_missionInfo.performAction(actionName)`

Cherche dans buttonsTable le bouton dont action vaut actionName et exécute sa commande Lua (button.cmd).

- `actionName` (*string*) : Nom de l'action du bouton.

#### `ui_missionInfo.performActivityAction(id)`

Appelle la fonction du bouton d'index id dans buttonsTable (rien si elle n'existe pas).

- `id` (*integer*) : Index du bouton (missionInfoPerformActionIndex de l'élément).

#### `ui_missionInfo.setActivityIndexVisible(index)`

Signale quel élément de l'invite est visible : émet onActivityIndexVisible avec ses données, ou nil si index vaut -1.

- `index` (*integer*) : Index à partir de 0 côté interface (-1 pour aucun) ; converti en index Lua +1.

## Champs

| Champ | Type | Description |
|---|---|---|
| `buttonsTable` | table|nil | Boutons/fonctions du dialogue courant (indexés par action ou par numéro selon le type d'ouverture). |
| `openState` | string|nil | « opened » ou « closed » ; nil avant la première ouverture. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onActivityAcceptUpdate`
- `onActivityIndexVisible` — écouté par 1 module(s)
- `onMissionInfoChangedState` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `ActivityAcceptClose`, `ActivityAcceptUpdate`, `MissionInfoUpdate`

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/missionInfo.lua`.*
