# `controller_pyrotechnicCharge`

*Fichier : `lua/vehicle/controller/pyrotechnicCharge.lua` · VM : Véhicule · 87 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `pyrotechnicCharge` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire de charge pyrotechnique à usage unique : dès qu'un des electrics listés dans triggerElectrics vaut 1 ou true, il joue un son, casse des breakgroups et détache des coupleurs, puis affiche un message. Sert aux séparations explosives (boulons, étages, remorques). Peut aussi être déclenché à la main par trigger().

## Exemple

```lua
controller.getController("pyrotechnicCharge").trigger()
```

## Remarques

- Clés jbeam lues : triggerElectrics (liste de noms d'electrics), breakgroups (liste de noms de breakgroups), couplers (liste de noms de coupleurs), eventName ("event:>Vehicle>Failures>pyrotechnic_charge"), eventVolume (1), uiName ("", utilisé dans le message), eventNode (nom de nœud ; premier nœud de ce nom, sinon 0).
- Un déclenchement par updateGFX ne se produit qu'une fois (hasTriggered) jusqu'au reset ; l'appel direct à trigger() n'est pas protégé et ne met pas hasTriggered à vrai.
- Les coupleurs sont détachés avec beamstate.detachCouplers(nom, true, true).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_pyrotechnicCharge.init(jbeamData)` | Lit la configuration jbeam et retrouve le nœud sonore. *(interne)* | 52 |
| `controller_pyrotechnicCharge.reset()` | Réarme la charge (hasTriggered = false). *(interne)* | 48 |
| `controller_pyrotechnicCharge.trigger()` | Déclenche la charge : joue le son sur le nœud, casse les breakgroups, détache les coupleurs et affiche un message de 5 s. | 19 |
| `controller_pyrotechnicCharge.updateGFX(dt)` | Chaque frame : si un electric de déclenchement est actif et que la charge n'est pas déjà tirée, appelle trigger(). *(interne)* | 32 |

### Détail des paramètres

#### `controller_pyrotechnicCharge.init(jbeamData)`

Lit la configuration jbeam et retrouve le nœud sonore.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_pyrotechnicCharge.updateGFX(dt)`

Chaque frame : si un electric de déclenchement est actif et que la charge n'est pas déjà tirée, appelle trigger().

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/pyrotechnicCharge.lua`.*
