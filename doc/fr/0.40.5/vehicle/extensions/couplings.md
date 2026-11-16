# `couplings`

*Fichier : `lua/vehicle/extensions/couplings.lua` · VM : Véhicule · 69 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `couplings` : `extensions.load (VM véhicule)("couplings")`, puis la globale `couplings`

Extension de gestion des attelages de type sellette (fifth wheel). Elle réagit aux événements de beamstate (activation/désactivation de l'attelage automatique, détachement) en relayant aux contrôleurs 'couplings/fifthwheel' et répond aux questions de beamstate sur l'état d'attelage.

## Exemple

```lua
-- appelé par beamstate, pas par le moddeur directement
extensions.couplings.isCouplerAttached()
```

## Remarques

- isAutoCouplingActive renvoie toujours false ; isCouplerAttached renvoie true si au moins une sellette est attachée, sinon nil (pas false).
- couplingAttached appelle obj:stopLatching() puis beamstate.disableAutoCoupling() : l'attelage automatique est coupé dès qu'un attelage est réalisé.
- couplingDetached et onReset sont vides.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `couplings.couplingAttached(nodeId, obj2id, obj2nodeId)` | Appelé par le moteur/beamstate quand un coupleur s'attache : arrête le verrouillage automatique et désactive l'attelage auto. *(interne)* | 30 |
| `couplings.couplingDetached(nodeId, obj2id, obj2nodeId)` | Appelé quand un coupleur se détache ; ne fait rien. *(interne)* | 35 |
| `couplings.isAutoCouplingActive()` | Indique si l'attelage automatique est actif pour cette extension (toujours false). *(interne)* | 39 |
| `couplings.isCouplerAttached()` | Indique si au moins une sellette est attachée. *(interne)* | 44 |
| `couplings.onBeamstateActivateAutoCoupling()` | Appelé par beamstate à l'activation de l'attelage automatique : affiche l'indicateur de chaque sellette. *(interne)* *(hook)* | 7 |
| `couplings.onBeamstateDetachCouplers()` | Appelé par beamstate pour détacher les coupleurs : détache chaque sellette. *(interne)* *(hook)* | 23 |
| `couplings.onBeamstateDisableAutoLatching()` | Appelé par beamstate à la désactivation de l'attelage automatique : masque l'indicateur de chaque sellette. *(interne)* *(hook)* | 15 |
| `couplings.onReset()` | Hook de reset du véhicule ; vide. *(interne)* *(hook)* | 53 |

### Détail des paramètres

#### `couplings.couplingAttached(nodeId, obj2id, obj2nodeId)`

Appelé par le moteur/beamstate quand un coupleur s'attache : arrête le verrouillage automatique et désactive l'attelage auto.

- `nodeId` (*integer*) : Nœud du coupleur.
- `obj2id` (*integer*) : Identifiant de l'autre véhicule.
- `obj2nodeId` (*integer*) : Nœud du coupleur de l'autre véhicule.

#### `couplings.couplingDetached(nodeId, obj2id, obj2nodeId)`

Appelé quand un coupleur se détache ; ne fait rien.

- `nodeId` (*integer*) : Nœud du coupleur.
- `obj2id` (*integer*) : Autre véhicule.
- `obj2nodeId` (*integer*) : Nœud de l'autre véhicule.

#### `couplings.isAutoCouplingActive()`

Indique si l'attelage automatique est actif pour cette extension (toujours false).

- **renvoie** : boolean false.

#### `couplings.isCouplerAttached()`

Indique si au moins une sellette est attachée.

- **renvoie** : boolean|nil true si attachée, sinon nil.

## Appels vers le moteur (C++)

- `obj:` `stopLatching`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/couplings.lua`.*
