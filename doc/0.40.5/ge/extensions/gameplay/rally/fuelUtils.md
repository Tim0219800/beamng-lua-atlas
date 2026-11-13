# `gameplay_rally_fuelUtils`

*Fichier : `lua/ge/extensions/gameplay/rally/fuelUtils.lua` · VM : Game Engine (GE) · 139 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_fuelUtils` : `extensions.load("gameplay_rally_fuelUtils")`, puis la globale `gameplay_rally_fuelUtils`

Outils pour sauvegarder et restaurer le carburant d'un véhicule de rallye (par exemple après un reset ou une réparation). createFuelSnapshot analyse les données energyStorage : avec un seul réservoir essence/diesel valide, il mémorise le niveau courant (mode 'remembered') ; sinon il prévoit un plein (mode 'full') avec la raison du repli. applyFuelSnapshot réapplique l'instantané via core_vehicleBridge.

## Exemple

```lua
gameplay_rally_fuelUtils.requestFuelSnapshot(veh, function(snap)
  -- plus tard :
  gameplay_rally_fuelUtils.applyFuelSnapshot(veh, snap, 'MonTag', 'reset')
end)
```

## Remarques

- Seuls les carburants 'gasoline' et 'diesel' sont mémorisés ; batterie électrique, réservoir multiple, autre type de stockage (hors n2oTank) forcent le mode 'full'.
- Les énergies sont celles d'energyStorage (unité du jeu, déduit du code).
- Snapshot : {mode='full'|'remembered', tanks={...}, reason=string|nil}. En mode 'full', tanks contient {name, maxEnergy} ; en 'remembered', {name, currentEnergy}.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_fuelUtils.applyFuelSnapshot(veh, snapshot, logTag, reason)` | Applique l'instantané : en mode 'remembered' remet currentEnergy dans chaque réservoir ; sinon remplit chaque réservoir à maxEnergy (avec un avertissement dans le log si une raison est fournie). Utilise l'action véhicule setEnergyStorageEnergy. Ne fait rien sans véhicule, sans instantané ou sans réservoir. | 112 |
| `gameplay_rally_fuelUtils.createFuelSnapshot(energyStorageData)` | Construit un instantané de carburant à partir des données energyStorage d'un véhicule. | 31 |
| `gameplay_rally_fuelUtils.requestFuelSnapshot(veh, callback)` | Demande asynchrone la valeur 'energyStorage' au véhicule (core_vehicleBridge.requestValue) puis appelle callback avec l'instantané. Sans véhicule, appelle callback immédiatement avec un instantané 'full' vide. | 101 |

### Détail des paramètres

#### `gameplay_rally_fuelUtils.applyFuelSnapshot(veh, snapshot, logTag, reason)`

Applique l'instantané : en mode 'remembered' remet currentEnergy dans chaque réservoir ; sinon remplit chaque réservoir à maxEnergy (avec un avertissement dans le log si une raison est fournie). Utilise l'action véhicule setEnergyStorageEnergy. Ne fait rien sans véhicule, sans instantané ou sans réservoir.

- `veh` (*table*) : Objet véhicule.
- `snapshot` (*table*) : Instantané issu de createFuelSnapshot.
- `logTag` (*string|nil*) : Tag de log.
- `reason` (*string|nil*) : Contexte pour le message de log ('recovery' par défaut).

#### `gameplay_rally_fuelUtils.createFuelSnapshot(energyStorageData)`

Construit un instantané de carburant à partir des données energyStorage d'un véhicule.

- `energyStorageData` (*table|nil*) : Liste des stockages d'énergie (storageType, energyType, name, currentEnergy, maxEnergy).
- **renvoie** : table {mode, tanks, reason} ; reason explique pourquoi on retombe sur un plein.

#### `gameplay_rally_fuelUtils.requestFuelSnapshot(veh, callback)`

Demande asynchrone la valeur 'energyStorage' au véhicule (core_vehicleBridge.requestValue) puis appelle callback avec l'instantané. Sans véhicule, appelle callback immédiatement avec un instantané 'full' vide.

- `veh` (*table|nil*) : Objet véhicule.
- `callback` (*function*) : function(snapshot).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/fuelUtils.lua`.*
