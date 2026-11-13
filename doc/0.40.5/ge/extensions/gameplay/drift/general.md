# `gameplay_drift_general`

*Fichier : `lua/ge/extensions/gameplay/drift/general.lua` · VM : Game Engine (GE) · 458 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drift_general` : `extensions.load("gameplay_drift_general")`, puis la globale `gameplay_drift_general`

Chef d'orchestre du gameplay de drift. Garde le contexte courant (inFreeroam, inChallenge, inFreeroamChallenge, inAnotherMissionType, inFreeroamCruising, inSplitscreen), le mode de défi (None, A to B, A to B with stunt zones, Gymkhana, Competition), les états pause/gel et le flag de debug. À chaque changement de contexte ou de mode, il charge ou décharge les autres extensions gameplay_drift_* selon la table variableExtensions. Un moddeur l'utilise pour lire le contexte drift ou en changer, et pour réinitialiser tout le système.

## Exemple

```lua
if gameplay_drift_general.getContext() == "inFreeroam" then
  gameplay_drift_general.setContext("inFreeroamChallenge")
end
```

## Remarques

- Extensions chargées par contexte : stuntZones (inChallenge), display (inChallenge, inFreeroamChallenge, inFreeroamCruising, inSplitscreen), quickMessages (inFreeroam, inChallenge, inFreeroamChallenge, inFreeroamCruising), bounds (inChallenge, inFreeroamChallenge), freeroam_driftSpots (inFreeroam, inFreeroamChallenge, inFreeroamCruising), scoreboard (inChallenge) ; par mode de défi : stallingSystem (Gymkhana), destination (A to B, A to B with stunt zones, avec le contexte inFreeroamChallenge).
- Chargement manuel : freeroam_cruising (chargé seulement hors carrière, hors multiseat, si le réglage enableDriftFreeroamCruising est actif, hors tutoriel freeroam et hors première conduite), sounds (chargé tant que gameplay_drift_display existe) et multiplayer (chargé via onMPSessionChanged).
- setContext émet toujours le hook onDriftContextChanged(context, oldContext), même si le contexte ne change pas ; les extensions ne sont rechargées que si le contexte a réellement changé. Passer à inFreeroam force le mode de défi à "None".
- Le gel (frozen) vaut vrai si le joueur est hors limites, va à contresens ou est dans la phase de conclusion d'un spot de drift ; il est recalculé à chaque frame et remis à false par reset/clear.
- pause (paused) sert à suspendre les systèmes de drift pendant l'écran de fin des défis de mission.
- getMultiplayerEnabled renvoie un objet de session ou nil/false (pas un booléen strict) : vrai seulement si une session multijoueur existe.
- Dans checkLoadedExtensions, la variable locale driftDebugInfo masque celle du module ; et l'appel ext:getDriftDebugInfo() passe ext comme argument self à une fonction qui n'en a pas besoin (sans conséquence).

**Dépendances (chargées avant) :** `gameplay_drift_drift`, `gameplay_drift_scoring`, `gameplay_drift_statistics`, `gameplay_drift_saveLoad`, `gameplay_util_groundContact`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drift_general.clear()` | Appelle reset() de toutes les extensions drift chargées (sauf general), remet frozen à false puis vide les zones de cascade (gameplay_drift_stuntZones.clear). | 73 |
| `gameplay_drift_general.getChallengeMode()` | Renvoie le mode de défi courant. | 196 |
| `gameplay_drift_general.getContext()` | Renvoie le contexte drift courant. | 179 |
| `gameplay_drift_general.getDriftDebugInfo()` | Renvoie {default=true, canBeChanged=false} pour la fenêtre de debug drift. | 183 |
| `gameplay_drift_general.getExtensionDebug(extName)` | Indique si le debug est activé pour une extension drift donnée (debug général actif, extension connue, case cochée). | 187 |
| `gameplay_drift_general.getFrozen()` | Indique si scoring et détection de drift sont gelés (hors limites, contresens, phase de conclusion). | 192 |
| `gameplay_drift_general.getGeneralDebug()` | Indique si le debug général est actif. | 171 |
| `gameplay_drift_general.getMultiplayerEnabled()` | Renvoie une valeur vraie seulement si une session multijoueur est en cours et que le drift multijoueur est autorisé. | 200 |
| `gameplay_drift_general.getPaused()` | Indique si le système de drift est en pause. | 175 |
| `gameplay_drift_general.onAnyMissionChanged(status, mission)` | Hook : appelé au démarrage ou à l'arrêt d'une mission. Fait clear() ; au démarrage d'une mission non drift passe en "inAnotherMissionType" ; à l'arrêt remet pause/gel à false et le contexte à "inFreeroam". *(interne)* *(hook)* | 204 |
| `gameplay_drift_general.onClientEndMission()` | Hook : fin de niveau, repasse le contexte à "inFreeroam". *(interne)* *(hook)* | 427 |
| `gameplay_drift_general.onClientPostStartMission()` | Hook : appelé quand le niveau est chargé ; si aucune mission n'est au premier plan, passe en "inFreeroam" et fait reset(). *(interne)* *(hook)* | 393 |
| `gameplay_drift_general.onDeserialized(data)` | Hook : restaure debugFlag, context et challengeMode après un rechargement Lua. *(interne)* *(hook)* | 409 |
| `gameplay_drift_general.onExtensionLoaded()` | Hook : liste les fichiers lua de /lua/ge/extensions/gameplay/drift pour le suivi des extensions et du debug. *(interne)* *(hook)* | 415 |
| `gameplay_drift_general.onMPSessionChanged(old, new)` | Hook : charge gameplay_drift_multiplayer à l'entrée en session multijoueur et le décharge à la sortie. *(interne)* *(hook)* | 419 |
| `gameplay_drift_general.onSerialize()` | Hook : sauvegarde debugFlag, context et challengeMode avant un rechargement Lua. *(interne)* *(hook)* | 401 |
| `gameplay_drift_general.onUpdate()` | Appelé à chaque frame : fenêtre debug, chargement/déchargement des sons et du cruising, recalcul de l'état gelé. *(interne)* *(hook)* | 385 |
| `gameplay_drift_general.onVehicleResetted(vid)` | Hook : si le véhicule remis en place est suivi par gameplay_drift_drift, émet onDriftPlVehReset(vid). *(interne)* *(hook)* | 217 |
| `gameplay_drift_general.reset()` | Appelle reset() de toutes les extensions drift chargées (sauf general), remet frozen à false puis réinitialise les zones de cascade (gameplay_drift_stuntZones.reset). | 78 |
| `gameplay_drift_general.setChallengeMode(newChallengeMode)` | Change le mode de défi et recharge/décharge les extensions concernées. Sans effet si le mode est identique. | 136 |
| `gameplay_drift_general.setContext(newContext)` | Change le contexte drift, émet onDriftContextChanged(newContext, oldContext) et met à jour les extensions chargées. | 147 |
| `gameplay_drift_general.setDebug(value)` | Active/désactive le mode debug drift (fenêtre imgui « Drift general ») et émet onDriftDebugChanged(value). | 163 |
| `gameplay_drift_general.setPaused(newPaused)` | Met le système de drift en pause (ou le relance). | 143 |

### Détail des paramètres

#### `gameplay_drift_general.getChallengeMode()`

Renvoie le mode de défi courant.

- **renvoie** : string|nil Mode de défi, nil tant qu'il n'a jamais été défini.

#### `gameplay_drift_general.getContext()`

Renvoie le contexte drift courant.

- **renvoie** : string|nil Contexte courant.

#### `gameplay_drift_general.getDriftDebugInfo()`

Renvoie {default=true, canBeChanged=false} pour la fenêtre de debug drift.

- **renvoie** : table {default = true, canBeChanged = false}

#### `gameplay_drift_general.getExtensionDebug(extName)`

Indique si le debug est activé pour une extension drift donnée (debug général actif, extension connue, case cochée).

- `extName` (*string*) : Nom de l'extension, ex. "gameplay_drift_scoreboard".
- **renvoie** : boolean true si le debug de cette extension est actif.

#### `gameplay_drift_general.getFrozen()`

Indique si scoring et détection de drift sont gelés (hors limites, contresens, phase de conclusion).

- **renvoie** : boolean État de gel.

#### `gameplay_drift_general.getGeneralDebug()`

Indique si le debug général est actif.

- **renvoie** : boolean Flag de debug.

#### `gameplay_drift_general.getMultiplayerEnabled()`

Renvoie une valeur vraie seulement si une session multijoueur est en cours et que le drift multijoueur est autorisé.

- **renvoie** : any Valeur vraie/fausse (peut être nil ou un booléen).

#### `gameplay_drift_general.getPaused()`

Indique si le système de drift est en pause.

- **renvoie** : boolean État de pause.

#### `gameplay_drift_general.onAnyMissionChanged(status, mission)`

Hook : appelé au démarrage ou à l'arrêt d'une mission. Fait clear() ; au démarrage d'une mission non drift passe en "inAnotherMissionType" ; à l'arrêt remet pause/gel à false et le contexte à "inFreeroam".

- `status` (*string*) : "started" ou "stopped".
- `mission` (*table*) : Mission concernée (missionType est lu).

#### `gameplay_drift_general.onDeserialized(data)`

Hook : restaure debugFlag, context et challengeMode après un rechargement Lua.

- `data` (*table*) : Table renvoyée par onSerialize.

#### `gameplay_drift_general.onMPSessionChanged(old, new)`

Hook : charge gameplay_drift_multiplayer à l'entrée en session multijoueur et le décharge à la sortie.

- `old` (*any*) : Ancienne session (nil si aucune).
- `new` (*any*) : Nouvelle session (nil si aucune).

#### `gameplay_drift_general.onSerialize()`

Hook : sauvegarde debugFlag, context et challengeMode avant un rechargement Lua.

- **renvoie** : table {debugFlag, context, challengeMode}

#### `gameplay_drift_general.onVehicleResetted(vid)`

Hook : si le véhicule remis en place est suivi par gameplay_drift_drift, émet onDriftPlVehReset(vid).

- `vid` (*integer*) : Id du véhicule.

#### `gameplay_drift_general.setChallengeMode(newChallengeMode)`

Change le mode de défi et recharge/décharge les extensions concernées. Sans effet si le mode est identique.

- `newChallengeMode` (*string*) : "None", "A to B", "A to B with stunt zones", "Gymkhana" ou "Competition".

#### `gameplay_drift_general.setContext(newContext)`

Change le contexte drift, émet onDriftContextChanged(newContext, oldContext) et met à jour les extensions chargées.

- `newContext` (*string*) : "inFreeroam", "inChallenge", "inFreeroamChallenge", "inAnotherMissionType", "inFreeroamCruising" ou "inSplitscreen".

#### `gameplay_drift_general.setDebug(value)`

Active/désactive le mode debug drift (fenêtre imgui « Drift general ») et émet onDriftDebugChanged(value).

- `value` (*boolean*) : true pour activer le debug.

#### `gameplay_drift_general.setPaused(newPaused)`

Met le système de drift en pause (ou le relance).

- `newPaused` (*boolean*) : true pour mettre en pause.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_drift_drift, gameplay_drift_scoring, gameplay_drift_statistics, gameplay_drift_saveLoad, gameplay_util_groundContact. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onDriftContextChanged` — écouté par 3 module(s)
- `onDriftDebugChanged` — écouté par 3 module(s)
- `onDriftPlVehReset` — écouté par 4 module(s)

## Appels vers le moteur (C++)

- `FS:` `findFiles`

**Charge les extensions :** `gameplay_drift_freeroam_cruising`, `gameplay_drift_multiplayer`, `gameplay_drift_sounds`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/general.lua`.*
