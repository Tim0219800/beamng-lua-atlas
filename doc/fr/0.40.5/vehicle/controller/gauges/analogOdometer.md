# `controller_gauges_analogOdometer`

*Fichier : `lua/vehicle/controller/gauges/analogOdometer.lua` · VM : Véhicule · 107 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `gauges/analogOdometer` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire pour un compteur kilométrique analogique affiché par une texture HTML (htmlTexture). Il envoie le total (electrics.values.odometer) et le trip (extensions.odometer.getRelativeRecording()) à la page seulement quand l'un d'eux a changé de plus d'un pas de mise à jour (1000 m, ou 1609.34 m en impérial, divisé par 10 avec séparateur décimal).

## Remarques

- Clés jbeam : configuration (table, fusionnée avec les clés "configuration_xxx") avec materialName, htmlPath, displayWidth, displayHeight (obligatoires pour afficher), unit ("imperial" = pas de 1609.34, sinon 1000), odometerHasDecimalSeparator, tripHasDecimalSeparator (pas divisé par 10). La table de configuration est envoyée entière à la page par callJS("setup").
- La texture est créée en mode "manual" à 1 FPS. L'envoi n'a lieu que si un joueur est assis et si l'UI doit être rafraîchie.
- M.init = nop (fonction globale du moteur). setParameters ne fait rien.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_gauges_analogOdometer.initSecondStage(jbeamData)` | Lit la configuration, calcule le pas de mise à jour, crée la texture HTML et envoie la configuration à la page. *(interne)* | 50 |
| `controller_gauges_analogOdometer.reset()` | Force un nouvel envoi de données au prochain updateGFX. *(interne)* | 46 |
| `controller_gauges_analogOdometer.setParameters(parameters)` | Ne fait rien. | 95 |
| `controller_gauges_analogOdometer.updateGFX(dt)` | Envoie trip et odomètre à la page quand ils ont changé d'au moins un pas. *(interne)* | 25 |

### Détail des paramètres

#### `controller_gauges_analogOdometer.initSecondStage(jbeamData)`

Lit la configuration, calcule le pas de mise à jour, crée la texture HTML et envoie la configuration à la page.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_gauges_analogOdometer.setParameters(parameters)`

Ne fait rien.

- `parameters` (*table*) : Ignoré.

#### `controller_gauges_analogOdometer.updateGFX(dt)`

Envoie trip et odomètre à la page quand ils ont changé d'au moins un pas.

- `dt` (*number*) : Pas de temps (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `init` | function | nop. |
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `getUpdateUIflag`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/gauges/analogOdometer.lua`.*
