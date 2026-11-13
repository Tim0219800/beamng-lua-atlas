# `gameplay_forceField`

*Fichier : `lua/ge/extensions/gameplay/forceField.lua` · VM : Game Engine (GE) · 113 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_forceField` : `extensions.load("gameplay_forceField")`, puis la globale `gameplay_forceField`

Mode « champ de force » du menu radial Fun Stuff : crée autour du véhicule du joueur 0 une « planète » de gravité (obj:setPlanets) envoyée à tous les autres véhicules, qui sont ainsi repoussés (multiplicateur > 0) ou attirés (< 0). Mise à jour toutes les 0.05 s de temps simulé. Se désactive au changement de véhicule, en fin de niveau, au passage en carrière et avant une sérialisation.

## Exemple

```lua
extensions.load('gameplay_forceField')
gameplay_forceField.setForceMultiplier(-1) -- attraction
gameplay_forceField.activate()
```

## Remarques

- Paramètres codés en dur : portée 100 (inutilisée), rayon de la planète 5, masse de base -6e13 (négative = répulsion), multiplié par la taille du véhicule (plus grand demi-côté / 3) et par forceMultiplier.
- Commande envoyée à chaque véhicule (VM véhicule) : obj:setPlanets({x, y, z, rayon, masse}). La désactivation envoie obj:setPlanets({}) à tous les véhicules.
- active vaut nil (et non false) tant que le mode n'a jamais été activé : isActive peut renvoyer nil.
- Bug : longestHalfExtent = math.max(math.max(halfExtents.x, halfExtents.y), halfExtents.y) répète y et ignore z. Aussi, l'appel vehicle:getID() est utilisé pour la comparaison alors que le reste du code utilise getId().
- La variable range est déclarée mais jamais utilisée.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_forceField.activate()` | Active le champ de force (sans effet s'il est déjà actif) et affiche un message UI indiquant répulsion ou attraction selon le signe de forceMultiplier. | 17 |
| `gameplay_forceField.deactivate(silent)` | Désactive le champ : envoie obj:setPlanets({}) à tous les véhicules et affiche un message « désactivé » sauf si silent. Sans effet s'il est inactif. | 24 |
| `gameplay_forceField.getForceMultiplier()` | Renvoie le multiplicateur de force courant. | 95 |
| `gameplay_forceField.isActive()` | Indique si le champ de force est actif. | 74 |
| `gameplay_forceField.onCareerActive(enabled)` | Hook : activation de la carrière ; désactive le champ si enabled est vrai. *(interne)* *(hook)* | 85 |
| `gameplay_forceField.onClientEndMission()` | Hook : fin de niveau ; désactive le champ. *(interne)* *(hook)* | 66 |
| `gameplay_forceField.onDeserialized()` | Hook : après un rechargement Lua ; ne fait rien. *(interne)* *(hook)* | 82 |
| `gameplay_forceField.onSerialize()` | Hook : avant un rechargement Lua ; désactive le champ (ne renvoie rien). *(interne)* *(hook)* | 78 |
| `gameplay_forceField.onUpdate(dtReal, dtSim, dtRaw)` | Appelé à chaque frame : si actif, toutes les 0.05 s (dtSim) calcule la planète à partir de la boîte englobante du véhicule du joueur 0 et l'envoie aux autres véhicules. *(interne)* *(hook)* | 45 |
| `gameplay_forceField.onVehicleSwitched()` | Hook : changement de véhicule du joueur ; désactive le champ. *(interne)* *(hook)* | 70 |
| `gameplay_forceField.setForceMultiplier(factor)` | Définit le multiplicateur de force : positif = répulsion, négatif = attraction. Pris en compte à la prochaine mise à jour. | 91 |
| `gameplay_forceField.toggleActive()` | Bascule entre actif et inactif. | 36 |

### Détail des paramètres

#### `gameplay_forceField.deactivate(silent)`

Désactive le champ : envoie obj:setPlanets({}) à tous les véhicules et affiche un message « désactivé » sauf si silent. Sans effet s'il est inactif.

- `silent` (*boolean|nil*) : true pour ne pas afficher de message.

#### `gameplay_forceField.getForceMultiplier()`

Renvoie le multiplicateur de force courant.

- **renvoie** : number Multiplicateur.

#### `gameplay_forceField.isActive()`

Indique si le champ de force est actif.

- **renvoie** : boolean|nil true si actif, false ou nil sinon.

#### `gameplay_forceField.onCareerActive(enabled)`

Hook : activation de la carrière ; désactive le champ si enabled est vrai.

- `enabled` (*boolean*) : Carrière activée.

#### `gameplay_forceField.onUpdate(dtReal, dtSim, dtRaw)`

Appelé à chaque frame : si actif, toutes les 0.05 s (dtSim) calcule la planète à partir de la boîte englobante du véhicule du joueur 0 et l'envoie aux autres véhicules.

- `dtReal` (*number*) : Delta temps réel (inutilisé).
- `dtSim` (*number*) : Delta temps simulé, cumulé pour la cadence.
- `dtRaw` (*number*) : Delta temps brut (inutilisé).

#### `gameplay_forceField.setForceMultiplier(factor)`

Définit le multiplicateur de force : positif = répulsion, négatif = attraction. Pris en compte à la prochaine mise à jour.

- `factor` (*number*) : Multiplicateur (1 par défaut).

## Appels vers le moteur (C++)

- `be:` `getObject`, `getObjectCount`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/forceField.lua`.*
