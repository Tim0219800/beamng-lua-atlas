# `controller_jato`

*Fichier : `lua/vehicle/controller/jato.lua` · VM : Véhicule · 181 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `jato` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire de propulseurs JATO (fusées d'appoint, type "auxiliary", defaultOrder 1100). Quand electrics.values.jatoInput > 0, ou quand l'accélérateur est à fond en mode manette/direct et en avant, il consomme du carburant (fuel), émet des particules aux nœuds des tuyères et joue un son de boucle. Écrit electrics.values.jato (0..1) et jatofuel (carburant restant, ratio 0..1). Un bouton « JATO » est ajouté au panneau de contrôle simplifié du groupe motopropulseur.

## Remarques

- Clés jbeam (défaut) : fuel (20, unités de temps de poussée à pleine consommation), thrusterNodes_nodes (liste plate de paires de nœuds : nœud d'émission, nœud de direction ; le nombre d'éléments doit être pair sinon erreur journalisée), thrusterLoopName ("event:>Vehicle>Thrusters").
- La poussée elle-même (force) n'est pas appliquée par ce fichier : il ne produit que fumée, son et valeurs electrics (jato, jatofuel) ; la force doit venir d'autres éléments jbeam qui lisent electrics.values.jato.
- Fonction cachée : le code Konami « uuddlrlrba » saisi enregistré par extensions.inputAnalyzer.registerInputString bascule fuelCoef entre 1 et 0 (carburant infini quand 0) et affiche "When in doubt, JATO".
- Le bouton de l'interface met electrics.values.jatoInput à 1 - jatoInput. Le champ M.fuelCoef (1 par défaut) multiplie la consommation.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_jato.getState()` | Renvoie fuel et fuelCoef pour la sauvegarde. | 148 |
| `controller_jato.init(jbeamData)` | Lit fuel et les nœuds de tuyères, initialise electrics.values.jatoInput/jato et enregistre le code secret. *(interne)* | 114 |
| `controller_jato.inputStringCallback(string)` | Appelé par inputAnalyzer quand le code secret est saisi : alterne fuelCoef entre 1 et 0. *(interne)* | 34 |
| `controller_jato.reset()` | Remet le carburant au niveau initial, arrête les sons et remet jatoInput/jato à 0. *(interne)* | 100 |
| `controller_jato.setState(data)` | Restaure fuel (borné 0..fuel initial) et fuelCoef (0..1). | 154 |
| `controller_jato.updateGFX(dt)` | Consomme le carburant, émet particules et sons, écrit electrics.values.jato et jatofuel. *(interne)* | 45 |
| `controller_jato.updateSimpleControlButtons()` | (Re)crée le bouton « JATO » du panneau simplifié avec le ratio de carburant restant. | 41 |

### Détail des paramètres

#### `controller_jato.getState()`

Renvoie fuel et fuelCoef pour la sauvegarde.

- **renvoie** : table Table d'état (réutilisée).

#### `controller_jato.init(jbeamData)`

Lit fuel et les nœuds de tuyères, initialise electrics.values.jatoInput/jato et enregistre le code secret.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_jato.inputStringCallback(string)`

Appelé par inputAnalyzer quand le code secret est saisi : alterne fuelCoef entre 1 et 0.

- `string` (*string*) : Chaîne saisie.

#### `controller_jato.setState(data)`

Restaure fuel (borné 0..fuel initial) et fuelCoef (0..1).

- `data` (*table|nil*) : Table d'état.

#### `controller_jato.updateGFX(dt)`

Consomme le carburant, émet particules et sons, écrit electrics.values.jato et jatofuel.

- `dt` (*number*) : Pas de temps (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultOrder` | number | 1100. |
| `fuelCoef` | number | Coefficient de consommation de carburant (1 normal, 0 = infini). |
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `addParticleByNodes`, `createSFXSource2`, `playSFX`, `setVolume`, `stopSFX`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/jato.lua`.*
