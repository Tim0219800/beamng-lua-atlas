# `ui_vehicleSelector_vehicleSpecifications`

*Fichier : `lua/ge/extensions/ui/vehicleSelector/vehicleSpecifications.lua` · VM : Game Engine (GE) · 553 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_vehicleSelector_vehicleSpecifications` : `extensions.load("ui_vehicleSelector_vehicleSpecifications")`, puis la globale `ui_vehicleSelector_vehicleSpecifications`

Prépare le panneau de détails d'un véhicule du sélecteur : listes de spécifications (performances, autres), spécifications générales, icônes (transmission, motricité, admission, carburant), étiquettes de provenance, peintures disponibles et en-tête. Les valeurs sont converties dans les unités choisies par le joueur (réglages uiUnitLength, uiUnitWeight, uiUnitPower, uiUnitTorque). Un moddeur y retrouve les clés de propriétés lues dans les fichiers info JSON des véhicules et leurs unités.

## Remarques

- Unités de stockage lues dans les données du véhicule : vitesse en m/s, puissance en PS, couple en Nm, poids en kg, distance en m, rapport poids/puissance en kg/PS, valeur monétaire en dollars.
- Spécifications de performance (système impérial) : Power, Torque, Weight, Top Speed, 0-60 mph, 0-100 mph, 0-200 mph, 60-100 mph, 60-0 mph, Braking G, Weight/Power, Performance Class, Off-Road Score. En métrique, les temps deviennent 0-100 km/h, 0-200 km/h, 0-300 km/h, 100-200 km/h, 100-0 km/h. Groupe « Other » : Type, Config Type, Transmission, Derby Class, Drivetrain, Propulsion, Fuel Type, Induction Type, Commercial Class. Spécifications générales : Years, Country, Power, Weight, Value.
- Le choix métrique ou impérial des spécifications se base sur le réglage uiUnitLength.
- Un champ absent est simplement ignoré (makeSpec ne l'ajoute pas). Chaque spécification indique isFromConfig (la valeur vient de la config et non du modèle).
- Le format de peinture renvoyé contient multiPaintSetups (ceux de la config ou forAllConfigs), factoryPaints (triées par nom) et allowPaintSelection.
- Bug : dans valueToUnit, le test `not type(value) == 'number'` est toujours faux (priorité de `not`) : les valeurs non numériques ne sont pas protégées et feraient planter string.format.
- Dans getDetails, `local type` masque la fonction globale type() après sa déclaration (sans conséquence ici, la fonction n'est plus appelée ensuite).
- Pour 'settings/default.pc' (config héritée), le panneau est remplacé par un titre « Legacy default.pc », sans spécifications ni peintures.
- Émet le hook onVehicleSelectorViewDetails(modelKey, configKey) à chaque appel de getDetails.

**Dépendances (chargées avant) :** `core_locales`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_vehicleSelector_vehicleSpecifications.addIconTags(modelDetails, configDetails)` | Calcule les icônes d'étiquettes d'une config : motricité (AWD, RWD, FWD, 4WD ou format NxM), transmission, type d'admission (NA, Turbo, SC, avec N2O) et carburant (batterie, essence, diesel). | 307 |
| `ui_vehicleSelector_vehicleSpecifications.getDetails(itemDetails)` | Construit toutes les données du panneau de détails d'un véhicule : headerTitle, brand, configDetails, isFavourite, tags, isStandalonePC, specificationsList, generalSpecs, iconTags, paints et preview. Avec l'option includeDevInfo, ajoute un groupe « Dev Info » (fichiers, mod, régions, auxiliaire). | 359 |
| `ui_vehicleSelector_vehicleSpecifications.makeSpec(modelDetails, configDetails, key, list)` | Ajoute à une liste une spécification {key, value, isFromConfig} : valeur lue dans la config ou à défaut le modèle, formatée selon son unité. Ne fait rien si la valeur est absente. | 285 |
| `ui_vehicleSelector_vehicleSpecifications.propTitle(key)` | Renvoie le nom traduit d'une propriété (clé 'ui.vehicles.propName.<clé>'), ou la clé elle-même si absent. | 4 |
| `ui_vehicleSelector_vehicleSpecifications.propValue(propName, key)` | Renvoie la valeur traduite d'une propriété (préfixe 'ui.vehicles.propValue.<propriété>.'), avec repli sur la valeur brute. | 5 |

### Détail des paramètres

#### `ui_vehicleSelector_vehicleSpecifications.addIconTags(modelDetails, configDetails)`

Calcule les icônes d'étiquettes d'une config : motricité (AWD, RWD, FWD, 4WD ou format NxM), transmission, type d'admission (NA, Turbo, SC, avec N2O) et carburant (batterie, essence, diesel).

- `modelDetails` (*table*) : Données du modèle.
- `configDetails` (*table*) : Données de la config.
- **renvoie** : table[] Liste de {icon|iconText, label}.

#### `ui_vehicleSelector_vehicleSpecifications.getDetails(itemDetails)`

Construit toutes les données du panneau de détails d'un véhicule : headerTitle, brand, configDetails, isFavourite, tags, isStandalonePC, specificationsList, generalSpecs, iconTags, paints et preview. Avec l'option includeDevInfo, ajoute un groupe « Dev Info » (fichiers, mod, régions, auxiliaire).

- `itemDetails` (*table*) : Table {model, config}.
- **renvoie** : table Données de détails pour l'UI.

#### `ui_vehicleSelector_vehicleSpecifications.makeSpec(modelDetails, configDetails, key, list)`

Ajoute à une liste une spécification {key, value, isFromConfig} : valeur lue dans la config ou à défaut le modèle, formatée selon son unité. Ne fait rien si la valeur est absente.

- `modelDetails` (*table*) : Données du modèle.
- `configDetails` (*table*) : Données de la config.
- `key` (*string*) : Propriété à lire.
- `list` (*table[]*) : Liste à compléter.

#### `ui_vehicleSelector_vehicleSpecifications.propTitle(key)`

Renvoie le nom traduit d'une propriété (clé 'ui.vehicles.propName.<clé>'), ou la clé elle-même si absent.

- `key` (*string*) : Nom de propriété (Top Speed, Power...).
- **renvoie** : string Libellé.

#### `ui_vehicleSelector_vehicleSpecifications.propValue(propName, key)`

Renvoie la valeur traduite d'une propriété (préfixe 'ui.vehicles.propValue.<propriété>.'), avec repli sur la valeur brute.

- `propName` (*string*) : Nom de propriété.
- `key` (*string*) : Valeur brute.
- **renvoie** : string Valeur traduite.

## Champs

| Champ | Type | Description |
|---|---|---|
| `CONVERSIONS` | table<string, number> | Constantes de conversion : MPS_TO_KMH (3,6), MPS_TO_MPH, BHP_TO_PS, PS_TO_BHP, PS_TO_KW, NM_TO_LBFT, KG_TO_LB, M_TO_FT, KGPS_TO_LBBHP. |
| `dependencies` | string[] | core_locales. |
| `specificationSetup` | table[] | Groupes de spécifications {label, aggregatesImperial, aggregatesMetric, aggregates} : « Performance » et « Other ». |
| `valueToUnit` | table<string, function> | Formateurs de valeurs par type d'unité : value, years, money, seconds, g, kmh, mph, torque, power, speed, weightPower, weight, distanceMinor. Signature (value, modelDetails, configDetails, propName) -> string ou liste de {text, italic}. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onVehicleSelectorViewDetails`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/vehicleSelector/vehicleSpecifications.lua`.*
