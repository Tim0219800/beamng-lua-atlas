# `controller_shiftLights`

*Fichier : `lua/vehicle/controller/shiftLights.lua` · VM : Véhicule · 110 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `shiftLights` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire de LEDs de changement de rapport (shift lights). Découpe la plage de régime [minRPM, maxRPM] en paliers (un par electric listé dans outputElectrics) et met chaque electric à 1 quand le régime atteint son palier ; au-dessus de maxRPM (ou moteur calé si hasStallWarning), les LEDs « flashing » clignotent et electrics.values.shouldShift passe à vrai.

## Exemple

```lua
-- jbeam : "outputElectrics":["shiftLight1","shiftLight2","shiftLight3"], "maxRPM":6800, "rpmRange":1500
```

## Remarques

- Clés jbeam lues : rpmRange (3000), engineName et maxEngineRPMOffset (maxRPM = engine.maxRPM - offset), hasStallWarning (false), maxRPM (7000 par défaut sans moteur), minRPM (maxRPM - rpmRange), inputElectricsName ("rpm"), keepLEDsActive (true : les LEDs inférieures restent allumées), flashDuration (0.1 s), outputElectrics (liste ordonnée des electrics des paliers), flashingOutputElectrics et flashingAlternateOutputElectrics (électrics qui clignotent en phase / en opposition).
- Chaque pas écrit electrics.values[nom] = 0 ou 1 (nombres, pas booléens) ; shouldShift est un booléen.
- L'alerte de calage n'existe que si engineName ET maxEngineRPMOffset sont définis et hasStallWarning vrai.
- Si outputElectrics est vide, stepCount = 0 et le calcul rpmStep divise par zéro (inf), sans effet ensuite car aucun palier n'est créé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_shiftLights.init(jbeamData)` | Lit les clés jbeam et construit les paliers de régime et les listes de LEDs clignotantes. *(interne)* | 59 |
| `controller_shiftLights.updateGFX(dt)` | Chaque frame : met à jour les electrics des paliers, shouldShift et le clignotement. *(interne)* | 25 |

### Détail des paramètres

#### `controller_shiftLights.init(jbeamData)`

Lit les clés jbeam et construit les paliers de régime et les listes de LEDs clignotantes.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_shiftLights.updateGFX(dt)`

Chaque frame : met à jour les electrics des paliers, shouldShift et le clignotement.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/shiftLights.lua`.*
