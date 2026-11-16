# `controller_powertrainControl_combustionEngineGovenor`

*Fichier : `lua/vehicle/controller/powertrainControl/combustionEngineGovenor.lua` · VM : Véhicule · 56 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `powertrainControl/combustionEngineGovenor` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire « régulateur de régime » d'un moteur thermique (le nom du fichier contient la faute « Govenor »). Un PID calcule une commande de gaz pour que le régime du moteur suive une consigne qui varie linéairement de rpmTarget0 à rpmTarget1 selon l'entrée d'accélérateur ; la commande est publiée dans electrics.values.throttleGoverned (ou nom jbeam).

## Remarques

- Clés jbeam lues : controlledEngineName ("mainEngine"), rpmPIDp (0.5), rpmPIDi (0.1), rpmPIDd (0.05), rpmTarget0 (ralenti du moteur), rpmTarget1 (régime max du moteur), throttleCommandElectricsName ("throttleGoverned"), throttleInputElectricsName ("throttle").
- Le moteur introuvable laisse M.updateFixedStep à nil (log E « throttleGovenor »).
- updateFixedStep est nil à la déclaration et affecté seulement après une init réussie.
- Le contrôleur n'écrit que l'electric de commande : c'est à un autre élément (jbeam/électrique) de l'utiliser pour piloter le moteur.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_powertrainControl_combustionEngineGovenor.init(jbeamData)` | Récupère le moteur, crée le PID, calcule les consignes de vitesse angulaire et les noms d'electrics. *(interne)* | 33 |
| `controller_powertrainControl_combustionEngineGovenor.reset(jbeamData)` | Réinitialise le PID si le moteur existe. *(interne)* | 27 |

### Détail des paramètres

#### `controller_powertrainControl_combustionEngineGovenor.init(jbeamData)`

Récupère le moteur, crée le PID, calcule les consignes de vitesse angulaire et les noms d'electrics.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_powertrainControl_combustionEngineGovenor.reset(jbeamData)`

Réinitialise le PID si le moteur existe.

- `jbeamData` (*table*) : Données jbeam.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |
| `updateFixedStep` | function|nil | Boucle PID, affectée dans init si le moteur est trouvé. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/powertrainControl/combustionEngineGovenor.lua`.*
