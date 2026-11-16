# `utRecorder`

*Fichier : `lua/vehicle/extensions/utRecorder.lua` · VM : Véhicule · 31 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `utRecorder` : `extensions.load (VM véhicule)("utRecorder")`, puis la globale `utRecorder`

Envoie à chaque frame les données du véhicule au Lua du moteur de jeu (GE) pour qu'elles soient enregistrées avec le reste (outil de test). Le message est mis en file par obj:queueGameEngineLua et appelle extensions.test_utRecorder.onVehicleData(vehId, tableDonnées) côté GE.

## Remarques

- Table envoyée (tableau indexé, sérialisé avec serialize) : [1] input.throttle, [2] input.brake, [3] input.steering, [4] norme de la vitesse obj:getVelocity() (m/s), [5] electrics.values.airspeed, [6] electrics.values.wheelspeed, [7] input.parkingbrake, [8] {x,y,z} position, [9] {x,y,z} direction avant.
- Les valeurs nil (ex. airspeed absent) créent des trous dans le tableau et la sérialisation peut en être affectée.
- Côté GE l'extension cible s'appelle test_utRecorder : elle doit être chargée sinon l'appel échoue.
- Envoi à chaque frame sans limitation de débit.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `utRecorder.updateGFX(dt)` | Appelé à chaque frame graphique (extensions.hook('updateGFX')). Construit la table de données du véhicule et l'envoie à extensions.test_utRecorder.onVehicleData côté GE. *(interne)* | 9 |

### Détail des paramètres

#### `utRecorder.updateGFX(dt)`

Appelé à chaque frame graphique (extensions.hook('updateGFX')). Construit la table de données du véhicule et l'envoie à extensions.test_utRecorder.onVehicleData côté GE.

- `dt` (*number*) : Pas de temps (non utilisé).

## Appels vers le moteur (C++)

- `obj:` `getDirectionVector`, `getId`, `getPosition`, `getVelocity`, `queueGameEngineLua`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/utRecorder.lua`.*
