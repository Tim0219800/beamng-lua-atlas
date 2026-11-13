# `controller_wendoverGauges`

*Fichier : `lua/vehicle/controller/wendoverGauges.lua` · VM : Véhicule · 102 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `wendoverGauges` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire OBSOLÈTE (remplacé par 'genericGauges') pour l'écran numérique du tableau de bord de la Wendover : texture HTML (1024 x hauteur jbeam, 161 par défaut) alimentée avec des valeurs d'electrics et une consommation moyenne de carburant calculée.

## Exemple

```lua
-- jbeam : controller "wendoverGauges" avec materialName, htmlPath et height facultatif
```

## Remarques

- Champs jbeam lus : materialName, htmlPath (obligatoires), height (défaut 161). Sans l'un des deux, updateGFX devient nop. init écrit un log d'erreur d'obsolescence.
- Données envoyées ('updateData') : electrics.{signal_L, signal_R, lights, highbeam, lowfuel, parkingbrake, checkengine, hazard, oil, oiltemp, gear, rpmTacho, fuel, watertemp, engineRunning, wheelspeed, abs, absActive}, averageFuelConsumption, gearboxType (type du premier périphérique de catégorie gearbox, sinon 'none').
- Consommation instantanée = (fuelVolume précédent - fuelVolume) / (dt * wheelspeed) * 1000 * 100 bornée à 0..100 ; la moyenne n'est accumulée que si wheelspeed > 1,4 m/s et est bornée à 0..50. Elle utilise electrics.values.fuelVolume (écrit ailleurs).
- Rafraîchissement : texture à 8 FPS, mise à jour des données au plus toutes les 0,1 s, seulement si un joueur est assis et si obj:getUpdateUIflag() est vrai.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_wendoverGauges.init(jbeamData)` | Appelé à l'initialisation : crée la texture HTML et détermine le type de boîte de vitesses. *(interne)* | 67 |
| `controller_wendoverGauges.reset()` | Appelé au reset ; ne fait rien (les compteurs de consommation ne sont pas remis à zéro). *(interne)* | 94 |
| `controller_wendoverGauges.updateGFX(dt)` | Appelé chaque frame : envoie les valeurs du tableau de bord à la texture HTML environ 10 fois par seconde. *(interne)* | 26 |

### Détail des paramètres

#### `controller_wendoverGauges.init(jbeamData)`

Appelé à l'initialisation : crée la texture HTML et détermine le type de boîte de vitesses.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_wendoverGauges.updateGFX(dt)`

Appelé chaque frame : envoie les valeurs du tableau de bord à la texture HTML environ 10 fois par seconde.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | 'auxiliary' : type de contrôleur. |

## Appels vers le moteur (C++)

- `obj:` `getUpdateUIflag`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/wendoverGauges.lua`.*
