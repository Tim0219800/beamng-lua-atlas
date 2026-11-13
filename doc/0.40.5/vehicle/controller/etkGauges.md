# `controller_etkGauges`

*Fichier : `lua/vehicle/controller/etkGauges.lua` · VM : Véhicule · 106 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `etkGauges` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Ancien contrôleur d'instruments HTML (type "auxiliary"), déprécié : init journalise une erreur demandant de passer à genericGauges. Il crée une texture HTML (htmlTexture.create) et envoie 30 fois par seconde : rapport engagé, consommation moyenne, affichage de consommation, température extérieure, heure (HH:MM), vitesse de roue. À ne pas utiliser pour de nouveaux véhicules.

## Remarques

- Clés jbeam : materialName (obligatoire), htmlPath (obligatoire), unitType ("metric" par défaut), textureWidth (512), textureHeight (256). Sans materialName ou htmlPath, updateGFX est remplacé par nop.
- La page HTML doit définir setUnits et updateData ; les données ne sont envoyées qu'après l'appel de uiReady et seulement si un joueur est assis et que l'UI est à mettre à jour.
- Consommation en l/100 km déduite de la variation de electrics.values.fuelVolume ; averageFuelConsumption est bornée à 30, fuelDisplay à -1..3. Température en °C (obj:getEnvTemperature() - 273.15), vitesse en m/s.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_etkGauges.init(jbeamData)` | Journalise l'avertissement de dépréciation, remet à zéro les lisseurs et crée la texture HTML. *(interne)* | 68 |
| `controller_etkGauges.uiReady()` | À appeler quand la page HTML est chargée : envoie setUnits avec unitType et autorise les mises à jour. | 96 |
| `controller_etkGauges.updateGFX(dt)` | Envoie périodiquement les données au tableau de bord HTML via htmlTexture.call("updateData"). *(interne)* | 28 |

### Détail des paramètres

#### `controller_etkGauges.init(jbeamData)`

Journalise l'avertissement de dépréciation, remet à zéro les lisseurs et crée la texture HTML.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_etkGauges.updateGFX(dt)`

Envoie périodiquement les données au tableau de bord HTML via htmlTexture.call("updateData").

- `dt` (*number*) : Pas de temps (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `getEnvTemperature`, `getUpdateUIflag`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/etkGauges.lua`.*
