# `controller_sbrGauges`

*Fichier : `lua/vehicle/controller/sbrGauges.lua` · VM : Véhicule · 159 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `sbrGauges` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire OBSOLÈTE (log E au chargement : à remplacer par genericGauges) qui alimente un écran HTML de tableau de bord (htmlTexture) pour un véhicule électrique : vitesse, rapport, capteurs, carte de navigation, consommation moyenne/instantanée (W, kWh/100 km) et autonomie estimée à partir de l'énergie des batteries des moteurs électriques.

## Remarques

- Clés jbeam lues : materialName (matériau du texture HTML, obligatoire), htmlPath (chemin de la page HTML, obligatoire). Sans l'un des deux, log E et updateGFX devient nop.
- Les données ne sont envoyées que si un joueur est assis et si obj:getUpdateUIflag() est vrai (cadence limitée). Appels JS : updateData, updateMap, updateConsum, appendGraphConsum (toutes les 5 s), setUnits, updateMode.
- L'unité est lue dans le réglage uiUnitLength (« metric » par défaut).
- Le moteur électrique doit exposer registeredEnergyStorages pour que les batteries soient comptées.
- reset appelle htmlTexture.call même si gaugesScreenName est nil (matériau absent).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_sbrGauges.init(jbeamData)` | Crée la texture HTML, repère les batteries des moteurs électriques et initialise les lisseurs de consommation. *(interne)* | 95 |
| `controller_sbrGauges.reset()` | Renvoie l'unité de longueur à la page HTML. *(interne)* | 137 |
| `controller_sbrGauges.setParameters(parameters)` | Applique des paramètres externes : si modeName et modeColor sont présents, appelle setUIMode. | 145 |
| `controller_sbrGauges.setUIMode(modeName, modeColor)` | Affiche le nom et la couleur du mode de conduite sur l'écran HTML (updateMode). | 141 |
| `controller_sbrGauges.updateGFX(dt)` | Chaque frame : calcule puissance et consommation et envoie les données à la page HTML. *(interne)* | 37 |

### Détail des paramètres

#### `controller_sbrGauges.init(jbeamData)`

Crée la texture HTML, repère les batteries des moteurs électriques et initialise les lisseurs de consommation.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_sbrGauges.setParameters(parameters)`

Applique des paramètres externes : si modeName et modeColor sont présents, appelle setUIMode.

- `parameters` (*table*) : Table {modeName, modeColor}.

#### `controller_sbrGauges.setUIMode(modeName, modeColor)`

Affiche le nom et la couleur du mode de conduite sur l'écran HTML (updateMode).

- `modeName` (*string*) : Texte du mode.
- `modeColor` (*string*) : Couleur (déduit du code : valeur CSS passée telle quelle).

#### `controller_sbrGauges.updateGFX(dt)`

Chaque frame : calcule puissance et consommation et envoie les données à la page HTML.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `getDirectionVector`, `getEnvTemperature`, `getID`, `getPositionXYZ`, `getUpdateUIflag`, `queueGameEngineLua`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/sbrGauges.lua`.*
