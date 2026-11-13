# `editor_util_vehicleFilterUtil`

*Fichier : `lua/ge/extensions/editor/util/vehicleFilterUtil.lua` · VM : Game Engine (GE) · 1653 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/util/vehicleFilterUtil")` (fichier sous extensions/ mais pas une extension classique)

Élément d'interface de l'éditeur de missions (via editorElementHelper) pour définir un filtre de véhicules : un filtre de base (whiteList/blackList) hérité par des « réglages de probabilité », une limite maxVehicles, un attribut de population, et les options Allow Auxiliary Vehicles / Allow Loaded Trailers. À partir des filtres il génère une liste d'options de véhicules (modèle, config) grâce à `extensions/util/configListGenerator`. Le module renvoie un constructeur : `require('editor/util/vehicleFilterUtil')(element)`.

## Remarques

- L'`element` stocke l'état : baseFilter {whiteList, blackList}, probabilitySettings, manualAdditions, manualRemovals, maxVehicles, popAttribute ('Population' par défaut), allowAuxiliaryVehicles, allowLoadedTrailers, filterByProp, filterUiData, cachedVehicleOptions.
- initialize() scanne tous les modèles et configs de core_vehicles.getModelsData() pour construire les filtres disponibles. Filtres reconnus : Drivetrain, Config Type, Body Style, Transmission, Weight, Top Speed, 0-100 km/h, 0-60 mph, Power, Torque, Weight/Power, Years, Value, Brand, Country, Region, Source, Type, Derby Class, Performance Class, Off-Road Score, Propulsion, Fuel Type, Induction Type, Commercial Class.
- Filtres de type 'range' (Value, Weight, Top Speed, 0-100 km/h, 0-60 mph, Power, Torque, Weight/Power, Off-Road Score, Years) avec min/max ; les autres sont de type 'set' avec une option supplémentaire 'Other...'. Source propose seulement Mod/Official.
- La valeur 'Powerglow' est ignorée lors de la collecte des valeurs de propriété.
- Ancien format de sauvegarde (tableau de configs avec model/config) : détecté dans setContainer() et ignoré, les réglages repartent vides.
- init() lève une erreur (error) si `extensions/util/configListGenerator` ne peut pas être chargé.
- Les commentaires du code indiquent que la configuration du filtre est enregistrée dans additionalAttributes plutôt que dans ctd.

## Classe `C`

Instance liée à un `element` d'éditeur.

Le module renvoie un constructeur : `local obj = require("editor_util_vehicleFilterUtil")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:draw(ctd, container, labelFn)` | Dessine l'éditeur de filtre complet (options d'éligibilité, filtre de base, réglages de probabilité, ajouts/retraits manuels, aperçu des véhicules résultants). | 785 |
| `C:init(element)` | Constructeur : mémorise l'élément et charge (une fois) le module configListGenerator. | 565 |
| `C:initialize()` | Prépare une seule fois les données de filtre (filterByProp, filterUiData), initialise baseFilter/probabilitySettings et génère la liste initiale d'options de véhicules. | 581 |
| `C:setContainer(ctd, container)` | Restaure le filtre depuis ctd[element.fieldName] (copie profonde) ou les valeurs par défaut, puis vide tous les caches pour régénération. | 727 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/util/vehicleFilterUtil.lua`.*
