---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/vehicleSelector/vehicleSpecifications.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Prépare le panneau de détails d'un véhicule du sélecteur : listes de spécifications (performances, autres), spécifications générales, icônes (transmission, motricité, admission, carburant), étiquettes de provenance, peintures disponibles et en-tête. Les valeurs sont converties dans les unités choisies par le joueur (réglages uiUnitLength, uiUnitWeight, uiUnitPower, uiUnitTorque). Un moddeur y retrouve les clés de propriétés lues dans les fichiers info JSON des véhicules et leurs unités.
--- Accès : extension `ui_vehicleSelector_vehicleSpecifications` : `extensions.load("ui_vehicleSelector_vehicleSpecifications")`, puis la globale `ui_vehicleSelector_vehicleSpecifications`
---@class ui_vehicleSelector_vehicleSpecifications
---@field CONVERSIONS table<string, number> Constantes de conversion : MPS_TO_KMH (3,6), MPS_TO_MPH, BHP_TO_PS, PS_TO_BHP, PS_TO_KW, NM_TO_LBFT, KG_TO_LB, M_TO_FT, KGPS_TO_LBBHP.
---@field dependencies string[] core_locales.
---@field specificationSetup table[] Groupes de spécifications {label, aggregatesImperial, aggregatesMetric, aggregates} : « Performance » et « Other ».
---@field valueToUnit table<string, function> Formateurs de valeurs par type d'unité : value, years, money, seconds, g, kmh, mph, torque, power, speed, weightPower, weight, distanceMinor. Signature (value, modelDetails, configDetails, propName) -> string ou liste de {text, italic}.
ui_vehicleSelector_vehicleSpecifications = {}

--- Calcule les icônes d'étiquettes d'une config : motricité (AWD, RWD, FWD, 4WD ou format NxM), transmission, type d'admission (NA, Turbo, SC, avec N2O) et carburant (batterie, essence, diesel).
---Source : lua/ge/extensions/ui/vehicleSelector/vehicleSpecifications.lua:307
---@param modelDetails table Données du modèle.
---@param configDetails table Données de la config.
---@return table[]  Liste de {icon|iconText, label}.
function ui_vehicleSelector_vehicleSpecifications.addIconTags(modelDetails, configDetails) end

--- Construit toutes les données du panneau de détails d'un véhicule : headerTitle, brand, configDetails, isFavourite, tags, isStandalonePC, specificationsList, generalSpecs, iconTags, paints et preview. Avec l'option includeDevInfo, ajoute un groupe « Dev Info » (fichiers, mod, régions, auxiliaire).
---Source : lua/ge/extensions/ui/vehicleSelector/vehicleSpecifications.lua:359
---@param itemDetails table Table {model, config}.
---@return table  Données de détails pour l'UI.
function ui_vehicleSelector_vehicleSpecifications.getDetails(itemDetails) end

--- Ajoute à une liste une spécification {key, value, isFromConfig} : valeur lue dans la config ou à défaut le modèle, formatée selon son unité. Ne fait rien si la valeur est absente.
---Source : lua/ge/extensions/ui/vehicleSelector/vehicleSpecifications.lua:285
---@param modelDetails table Données du modèle.
---@param configDetails table Données de la config.
---@param key string Propriété à lire.
---@param list table[] Liste à compléter.
function ui_vehicleSelector_vehicleSpecifications.makeSpec(modelDetails, configDetails, key, list) end

--- Renvoie le nom traduit d'une propriété (clé 'ui.vehicles.propName.<clé>'), ou la clé elle-même si absent.
---Source : lua/ge/extensions/ui/vehicleSelector/vehicleSpecifications.lua:4
---@param key string Nom de propriété (Top Speed, Power...).
---@return string  Libellé.
function ui_vehicleSelector_vehicleSpecifications.propTitle(key) end

--- Renvoie la valeur traduite d'une propriété (préfixe 'ui.vehicles.propValue.<propriété>.'), avec repli sur la valeur brute.
---Source : lua/ge/extensions/ui/vehicleSelector/vehicleSpecifications.lua:5
---@param propName string Nom de propriété.
---@param key string Valeur brute.
---@return string  Valeur traduite.
function ui_vehicleSelector_vehicleSpecifications.propValue(propName, key) end

