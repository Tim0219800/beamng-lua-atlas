# `career_modules_milestones_milestones`

*Fichier : `lua/ge/extensions/career/modules/milestones/milestones.lua` · VM : Game Engine (GE) · 231 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_milestones_milestones` : `extensions.load("career_modules_milestones_milestones")`, puis la globale `career_modules_milestones_milestones`

Module central des jalons (milestones) de la carrière : sauvegarde (milestones.json), liste agrégée pour l'UI via le hook onGetMilestones, réclamation de récompenses (une par une ou toutes), compteur de jalons non réclamés et notifications. Fournit aussi des fonctions de récompense et des couleurs communes aux sous-systèmes (generalMilestones/*).

## Exemple

```lua
local data = career_modules_milestones_milestones.getMilestones({"money"})
for _, m in ipairs(data.list) do print(m.label, m.claimable) end
```

## Remarques

- saveData est chargé depuis <save>/career/milestones.json ; saveData.unclaimedMilestonesCount vaut 0 par défaut et saveData.general est rempli par milestones/general.lua.
- Chaque appel à getMilestones recalcule la liste, réattribue des claimId (index de la liste) et recompte unclaimedMilestonesCount ; les claimId ne sont valides que pour la dernière liste générée.
- claim(id) appelle claimFunction puis claimRefreshFunction, et envoie guihooks milestoneClaimed (sauf noGuiEvent).
- onGetMilestones de ce fichier est vide (stub) ; le travail est fait par milestones/general.lua.
- sortByTimeAndId est défini mais jamais utilisé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_milestones_milestones.claim(id, noGuiEvent)` | Réclame le jalon repéré par son claimId (index dans la dernière liste). Exécute sa claimFunction, met à jour les fonctions de refresh et notifie l'UI (milestoneClaimed avec replacementEntry). | 47 |
| `career_modules_milestones_milestones.claimAllUnclaimed()` | Réclame tous les jalons claimable de la liste complète, relance getMilestones et envoie guihooks allMilestonesClaimed. | 67 |
| `career_modules_milestones_milestones.getMilestones(filter)` | Collecte les jalons via le hook onGetMilestones(list, filter), attribue les claimId, compte les jalons réclamables et renvoie la liste avec les filtres disponibles. | 89 |
| `career_modules_milestones_milestones.loadSaveData()` | Charge saveData depuis career/milestones.json du profil courant. *(interne)* | 136 |
| `career_modules_milestones_milestones.majorLinear(step)` | Fonction de récompense : 250 * (step + 1) en argent. | 186 |
| `career_modules_milestones_milestones.milestoneReached(label)` | Affiche un toast « jalon atteint » (label chaîne ou {txt, context}) et incrémente unclaimedMilestonesCount. Prévu pour être éventuellement différé pendant une mission. | 122 |
| `career_modules_milestones_milestones.minorLinear(step)` | Fonction de récompense : 100 * (step + 1) en argent. | 185 |
| `career_modules_milestones_milestones.onCareerActive(active)` | Hook : affiche un toast si des jalons sont non réclamés. *(interne)* *(hook)* | 169 |
| `career_modules_milestones_milestones.onExtensionLoaded()` | Hook : charge saveData si la carrière est déjà active (renvoie false sinon). *(interne)* *(hook)* | 145 |
| `career_modules_milestones_milestones.onGetMilestones(list)` | Hook vide (stub) ; l'ajout des fiches est fait par milestones/general.lua. *(interne)* *(hook)* | 112 |
| `career_modules_milestones_milestones.onMilestonesRouteEnter(context, toRoute, fromRoute, data)` | Cycle de vie du routeur UI : appelle onPauseEnter de ui_pause_routeLifecycleCallbacks s'il existe et ajoute data.milestones.filterOptions. *(interne)* *(hook)* | 218 |
| `career_modules_milestones_milestones.onMilestonesRouteMount(context, toRoute, fromRoute, data)` | Cycle de vie du routeur UI : appelle onPauseMount puis ajoute data.milestones.filterOptions (options de filtre traduites). *(interne)* *(hook)* | 223 |
| `career_modules_milestones_milestones.onSaveCurrentProfile(currentSavePath)` | Hook de sauvegarde : écrit saveData dans <save>/career/milestones.json. *(interne)* *(hook)* | 150 |
| `career_modules_milestones_milestones.requestMilestones(filter)` | Envoie getMilestones(filter) à l'UI via guihooks milestonesData. | 116 |
| `career_modules_milestones_milestones.unclaimedMilestonesCount()` | Nombre de jalons atteints et non réclamés. | 155 |

### Détail des paramètres

#### `career_modules_milestones_milestones.claim(id, noGuiEvent)`

Réclame le jalon repéré par son claimId (index dans la dernière liste). Exécute sa claimFunction, met à jour les fonctions de refresh et notifie l'UI (milestoneClaimed avec replacementEntry).

- `id` (*integer*) : claimId de la liste courante.
- `noGuiEvent` (*boolean|nil*) : Si vrai, n'envoie pas l'événement UI.
- **renvoie** : table|nil Nouvelle fiche du jalon (palier suivant) ou nil.

#### `career_modules_milestones_milestones.claimAllUnclaimed()`

Réclame tous les jalons claimable de la liste complète, relance getMilestones et envoie guihooks allMilestonesClaimed.

- **renvoie** : {claimed: integer, unclaimedMilestonesCount: integer} Nombre réclamé et compteur restant.

#### `career_modules_milestones_milestones.getMilestones(filter)`

Collecte les jalons via le hook onGetMilestones(list, filter), attribue les claimId, compte les jalons réclamables et renvoie la liste avec les filtres disponibles.

- `filter` (*string[]|nil*) : Filtres (general, mission, branch, delivery, money, speedTrap, insurance, all…).
- **renvoie** : {list: table[], filters: string[]} Fiches et clés de filtres triées.

#### `career_modules_milestones_milestones.majorLinear(step)`

Fonction de récompense : 250 * (step + 1) en argent.

- `step` (*integer*) : Indice de palier (à partir de 0).
- **renvoie** : {attributeKey: string, rewardAmount: number}[] Une récompense money.

#### `career_modules_milestones_milestones.milestoneReached(label)`

Affiche un toast « jalon atteint » (label chaîne ou {txt, context}) et incrémente unclaimedMilestonesCount. Prévu pour être éventuellement différé pendant une mission.

- `label` (*string|table*) : Texte ou table de traduction {txt, context}.

#### `career_modules_milestones_milestones.minorLinear(step)`

Fonction de récompense : 100 * (step + 1) en argent.

- `step` (*integer*) : Indice de palier (à partir de 0).
- **renvoie** : {attributeKey: string, rewardAmount: number}[] Une récompense money.

#### `career_modules_milestones_milestones.onCareerActive(active)`

Hook : affiche un toast si des jalons sont non réclamés.

- `active` (*boolean*) : Rien si false.

#### `career_modules_milestones_milestones.onGetMilestones(list)`

Hook vide (stub) ; l'ajout des fiches est fait par milestones/general.lua.

- `list` (*table[]*) : Liste à compléter.

#### `career_modules_milestones_milestones.onMilestonesRouteEnter(context, toRoute, fromRoute, data)`

Cycle de vie du routeur UI : appelle onPauseEnter de ui_pause_routeLifecycleCallbacks s'il existe et ajoute data.milestones.filterOptions.

- `context` (*any*) : Contexte du routeur.
- `toRoute` (*any*) : Route cible.
- `fromRoute` (*any*) : Route précédente.
- `data` (*table*) : routeData.

#### `career_modules_milestones_milestones.onMilestonesRouteMount(context, toRoute, fromRoute, data)`

Cycle de vie du routeur UI : appelle onPauseMount puis ajoute data.milestones.filterOptions (options de filtre traduites).

- `context` (*any*) : Contexte du routeur.
- `toRoute` (*any*) : Route cible.
- `fromRoute` (*any*) : Route précédente.
- `data` (*table*) : routeData.

#### `career_modules_milestones_milestones.onSaveCurrentProfile(currentSavePath)`

Hook de sauvegarde : écrit saveData dans <save>/career/milestones.json.

- `currentSavePath` (*string*) : Dossier de sauvegarde.

#### `career_modules_milestones_milestones.requestMilestones(filter)`

Envoie getMilestones(filter) à l'UI via guihooks milestonesData.

- `filter` (*string[]|nil*) : Filtres.

#### `career_modules_milestones_milestones.unclaimedMilestonesCount()`

Nombre de jalons atteints et non réclamés.

- **renvoie** : integer Compteur sauvegardé.

## Champs

| Champ | Type | Description |
|---|---|---|
| `colorGeneralGray` | string | Couleur CSS var(--bng-cool-gray-700-rgb). |
| `colorMissionBlue` | string | Couleur CSS var(--bng-add-blue-500-rgb). |
| `colorOrange` | string | Couleur CSS var(--bng-orange-500-rgb). |
| `saveData` | table | Données sauvegardées : general (par id : claimedStep, notificationStep) et unclaimedMilestonesCount. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onGetMilestones` — écouté par 2 module(s)

**Évènements UI (guihooks.trigger) :** `allMilestonesClaimed`, `milestoneClaimed`, `milestonesData`, `toastrMsg`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/milestones/milestones.lua`.*
