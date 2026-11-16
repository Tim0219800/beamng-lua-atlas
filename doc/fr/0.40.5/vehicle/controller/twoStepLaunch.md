# `controller_twoStepLaunch`

*Fichier : `lua/vehicle/controller/twoStepLaunch.lua` · VM : Véhicule · 229 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `twoStepLaunch` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire de « two-step » (limiteur de régime de départ arrêté). Une fois activé, il s'arme quand le véhicule est quasi à l'arrêt avec gaz ET frein enfoncés, puis impose au moteur un limiteur de régime temporaire (engine:setTempRevLimiter) à tempRevLimiterRPM. Relâcher frein ou gaz le désarme. Un moddeur l'active par toggleTwoStep/setTwoStep ou via le menu radial qu'il enregistre. Publie electrics.values.twoStep (nom jbeam electricsName).

## Exemple

```lua
local ts = controller.getController("twoStepLaunch")
ts.setParameters({isEnabled = true, launchRPM = 4500})
```

## Remarques

- Clés jbeam lues dans init : engineName ("mainEngine"), electricsName ("twoStep"), rpmLimit (2000 tr/min).
- États internes : deactivated -> idle -> armed. Armement au clavier : vitesse <= 2 m/s, gaz >= 0.2, frein >= 0.2 ; sinon (manette/volant) : vitesse <= 0.5 m/s, gaz >= 0.8, frein >= 0.8.
- Sans moteur, updateGFX est nop et les fonctions de commande ne font rien.
- init enregistre (une seule fois) des entrées de menu rapide « Two-Step » (bascule, RPM +/-100) via core_quickAccess ; l'appel suppose que core_quickAccess existe dans la VM de jeu (pas de test nil).
- M.updateGFX vaut nop à la déclaration puis est réaffecté dans init (nop est un global moteur non défini dans ce fichier).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_twoStepLaunch.changeTwoStepRPM(amount)` | Ajoute une valeur à la limite de régime du two-step et affiche un message. | 56 |
| `controller_twoStepLaunch.deserialize(data)` | Restaure l'état et le régime depuis la table de serialize. | 176 |
| `controller_twoStepLaunch.getState()` | État synchronisable : <nom>_enabled (booléen) et <nom>_rpm. | 192 |
| `controller_twoStepLaunch.init(jbeamData)` | Lit les clés jbeam, récupère le moteur, fixe la limite de régime et enregistre les entrées du menu rapide. *(interne)* | 91 |
| `controller_twoStepLaunch.reset()` | Réinitialise le limiteur temporaire du moteur et repasse l'état en idle s'il était actif. *(interne)* | 82 |
| `controller_twoStepLaunch.serialize()` | Renvoie {state, rpm} pour la sauvegarde. | 169 |
| `controller_twoStepLaunch.setParameters(parameters)` | Applique des paramètres externes : isEnabled (booléen) et launchRPM (tr/min). | 183 |
| `controller_twoStepLaunch.setState(data)` | Restaure activation et régime depuis la table de getState (silencieux). | 198 |
| `controller_twoStepLaunch.setTwoStep(enabled, silent)` | Active (état idle) ou désactive le two-step (réinitialise le limiteur temporaire) et affiche un message sauf si silent. | 28 |
| `controller_twoStepLaunch.toggleTwoStep()` | Bascule l'activation du two-step. | 42 |
| `controller_twoStepLaunch.updateGFX(dt)` | Chaque frame : fait avancer l'état (idle -> armed) et applique/enlève le limiteur temporaire, publie l'electric. (assignée dynamiquement) *(interne)* | dyn |

### Détail des paramètres

#### `controller_twoStepLaunch.changeTwoStepRPM(amount)`

Ajoute une valeur à la limite de régime du two-step et affiche un message.

- `amount` (*number*) : Variation en tr/min.

#### `controller_twoStepLaunch.deserialize(data)`

Restaure l'état et le régime depuis la table de serialize.

- `data` (*table*) : Table {state, rpm}.

#### `controller_twoStepLaunch.getState()`

État synchronisable : <nom>_enabled (booléen) et <nom>_rpm.

- **renvoie** : table Table d'état.

#### `controller_twoStepLaunch.init(jbeamData)`

Lit les clés jbeam, récupère le moteur, fixe la limite de régime et enregistre les entrées du menu rapide.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_twoStepLaunch.serialize()`

Renvoie {state, rpm} pour la sauvegarde.

- **renvoie** : table État courant.

#### `controller_twoStepLaunch.setParameters(parameters)`

Applique des paramètres externes : isEnabled (booléen) et launchRPM (tr/min).

- `parameters` (*table*) : Table {isEnabled?, launchRPM?}.

#### `controller_twoStepLaunch.setState(data)`

Restaure activation et régime depuis la table de getState (silencieux).

- `data` (*table|nil*) : Table produite par getState.

#### `controller_twoStepLaunch.setTwoStep(enabled, silent)`

Active (état idle) ou désactive le two-step (réinitialise le limiteur temporaire) et affiche un message sauf si silent.

- `enabled` (*boolean*) : Activer ?
- `silent` (*boolean|nil*) : Ne pas afficher de message.

#### `controller_twoStepLaunch.updateGFX(dt)`

Chaque frame : fait avancer l'état (idle -> armed) et applique/enlève le limiteur temporaire, publie l'electric. (assignée dynamiquement)

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/twoStepLaunch.lua`.*
