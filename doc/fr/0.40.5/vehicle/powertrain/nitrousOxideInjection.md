# `powertrain_nitrousOxideInjection`

*Fichier : `lua/vehicle/powertrain/nitrousOxideInjection.lua` · VM : Véhicule · 284 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de composant powertrain `nitrousOxideInjection` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`

Sous-module d'injection de protoxyde d'azote (NOS) pour un moteur à combustion. Ce n'est PAS un composant powertrain indépendant : il n'exporte pas `new` ; c'est un module à état global dans le fichier (une seule instance par VM véhicule), initialisé par le moteur avec `init(device, data)`. Il lit trois valeurs electrics (armement, forçage, activation), ajoute du couple au moteur (`engine.nitrousOxideTorque`) selon une table par régime, consomme l'énergie des réservoirs `n2o` enregistrés et gère la purge des conduites (particules et son).

## Exemple

```lua
electrics.values.nitrousOxideArm = 1       -- armer (>= 1)
electrics.values.nitrousOxideOverride = 1  -- forcer l'injection sans conditions
print(electrics.values.nitrousOxideActive)
```

## Remarques

- Clés jbeam lues dans data (init) : addedPower (kW), cutInRPM (régime d'enclenchement, défaut = idleRPM du moteur, borné à 0.9 * maxRPM), cutInRange (tr/min de montée progressive, 50), electricsArmName ('nitrousOxideArm'), electricsOverrideName ('nitrousOxideOverride'), electricsActiveName ('nitrousOxideActive'), minimumGear (0), volumeCoef (1.5, multiplie le volume sonore du moteur quand le NOS agit), purgeValves_nodes (liste de paires de cid de nœuds). initSounds lit data.purgeSoundEvent ('event:>Vehicle>Nitrous_Purging') et purgeSoundVolume (1). Si data est nil, le module est désactivé (updateGFX = nop).
- Conditions d'activation (par image) : (armé ET papillon du moteur >= 1 ET régime >= cutInRPM ET |electrics.gearIndex| >= minimumGear ET embrayage non utilisé (electrics.clutch == 0)) OU forçage manuel, ET du liquide disponible, ET pas de purge en cours. L'armement et le forçage se lisent depuis electrics.values avec un seuil >= 1.
- Effets sur le moteur : engine.nitrousOxideTorque += couple additionnel (N·m, = puissance ajoutée / vitesse angulaire), engine.engineVolumeCoef *= volumeCoef si couple > 0, engine.invBurnEfficiencyCoef *= 2 quand actif. Le moteur doit remettre ces champs à leur valeur avant chaque appel à updateGFX. La consommation passe par engine.spentEnergyNitrousOxide partagée entre les réservoirs enregistrés.
- Champs publics : isExisting (true), isArmed (booléen mis à jour chaque image), isActive (booléen), updateGFX et updateSounds (réaffectés par init ; nop par défaut).
- Bugs / pièges : les tables de couple nitrousOxideTorqueLookup sont remplies à l'indice i + 1 (valeur pour i tr/min) mais sont lues à l'indice du régime entier (updateGFX) ou rpm (getAddedTorque) : décalage d'un tr/min sans conséquence pratique. registerStorage plante si le nom de stockage est inconnu (storage nil, puis storage.storedEnergy). updateGFX lit abs(electrics.values.gearIndex) : erreur si gearIndex n'existe pas. cutInRange = 0 donne une division par zéro. Un seul moteur à la fois (état global dans le module).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `powertrain_nitrousOxideInjection.getAddedTorque()` | Renvoie la table du couple additionnel (N·m) par tr/min de la courbe de couple du moteur (indexée comme torqueCurve, k+1), sans condition d'activation. Sert à tracer la courbe de couple avec NOS. | 259 |
| `powertrain_nitrousOxideInjection.getPurgeTimeRemaining()` | Renvoie le temps de purge restant en secondes (0 si aucune purge). | 53 |
| `powertrain_nitrousOxideInjection.getTankRatio()` | Renvoie la moyenne du niveau relatif (remainingRatio, 0..1) des réservoirs enregistrés, ou 0 s'il n'y en a pas. Utile pour une jauge. | 57 |
| `powertrain_nitrousOxideInjection.init(device, data)` | Initialise le module pour un moteur : construit les tables de couple additionnel par tr/min (montée progressive de cutInStart à cutInRPM), lit les noms electrics, le rapport minimal, les valves de purge. Appelée par le moteur à combustion à l'initialisation ; avec data nil, désactive le module. *(interne)* | 193 |
| `powertrain_nitrousOxideInjection.initSounds(data)` | Lit l'événement et le volume du son de purge depuis le jbeam. Appelée à l'initialisation des sons du moteur. *(interne)* | 248 |
| `powertrain_nitrousOxideInjection.purgeLines(purgeTime)` | Lance la purge des conduites de NOS pendant purgeTime secondes (particules et son aux valves) s'il y a des valves de purge et du liquide ; sinon remet le temps de purge à 0. Bloque l'injection pendant la purge. | 49 |
| `powertrain_nitrousOxideInjection.registerStorage(storageName)` | Enregistre un réservoir d'énergie (liquide de protoxyde) du moteur pour la consommation du NOS. Appelée par le moteur pour chaque stockage d'énergie du type attendu. *(interne)* | 166 |
| `powertrain_nitrousOxideInjection.reset()` | Remet à zéro les états (armement, forçage, purge, réservoirs enregistrés, énergie). Appelée au reset du véhicule. *(interne)* | 177 |
| `powertrain_nitrousOxideInjection.resetSounds()` | Arrête les sons de purge de toutes les valves. Appelée au reset des sons. *(interne)* | 253 |

### Détail des paramètres

#### `powertrain_nitrousOxideInjection.getAddedTorque()`

Renvoie la table du couple additionnel (N·m) par tr/min de la courbe de couple du moteur (indexée comme torqueCurve, k+1), sans condition d'activation. Sert à tracer la courbe de couple avec NOS.

- **renvoie** : table<integer, number> Couple additionnel par régime (N·m).

#### `powertrain_nitrousOxideInjection.getPurgeTimeRemaining()`

Renvoie le temps de purge restant en secondes (0 si aucune purge).

- **renvoie** : number Secondes restantes.

#### `powertrain_nitrousOxideInjection.getTankRatio()`

Renvoie la moyenne du niveau relatif (remainingRatio, 0..1) des réservoirs enregistrés, ou 0 s'il n'y en a pas. Utile pour une jauge.

- **renvoie** : number Niveau moyen 0..1.

#### `powertrain_nitrousOxideInjection.init(device, data)`

Initialise le module pour un moteur : construit les tables de couple additionnel par tr/min (montée progressive de cutInStart à cutInRPM), lit les noms electrics, le rapport minimal, les valves de purge. Appelée par le moteur à combustion à l'initialisation ; avec data nil, désactive le module.

- `device` (*table*) : Moteur à combustion (idleRPM, maxRPM, outputAV1, throttle, nitrousOxideTorque, engineVolumeCoef, invBurnEfficiencyCoef…).
- `data` (*table|nil*) : Données jbeam de NOS (addedPower en kW, cutInRPM, electricsArmName…) ; nil pour désactiver.

#### `powertrain_nitrousOxideInjection.initSounds(data)`

Lit l'événement et le volume du son de purge depuis le jbeam. Appelée à l'initialisation des sons du moteur.

- `data` (*table*) : Données jbeam NOS (purgeSoundEvent, purgeSoundVolume).

#### `powertrain_nitrousOxideInjection.purgeLines(purgeTime)`

Lance la purge des conduites de NOS pendant purgeTime secondes (particules et son aux valves) s'il y a des valves de purge et du liquide ; sinon remet le temps de purge à 0. Bloque l'injection pendant la purge.

- `purgeTime` (*number*) : Durée de la purge en secondes.

#### `powertrain_nitrousOxideInjection.registerStorage(storageName)`

Enregistre un réservoir d'énergie (liquide de protoxyde) du moteur pour la consommation du NOS. Appelée par le moteur pour chaque stockage d'énergie du type attendu.

- `storageName` (*string*) : Nom du stockage (energyStorage.getStorage).

## Champs

| Champ | Type | Description |
|---|---|---|
| `isActive` | boolean | true si l'injection est en cours (conditions remplies, liquide présent, pas de purge). |
| `isArmed` | boolean | true si le NOS est armé (electrics nitrousOxideArm >= 1). |
| `isExisting` | boolean | Toujours true : permet de tester si le module de NOS est présent sur le véhicule. |
| `updateGFX` | function | Fonction de mise à jour par image : nop jusqu'à init, puis la vraie fonction. Appelée par le moteur après avoir préparé nitrousOxideTorque. |
| `updateSounds` | function | Fonction son : nop (la vraie fonction est vide). |

## Appels vers le moteur (C++)

- `obj:` `addParticleByNodesRelative`, `createSFXSource2`, `cutSFX`, `playSFX`, `setVolume`, `stopSFX`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/powertrain/nitrousOxideInjection.lua`.*
