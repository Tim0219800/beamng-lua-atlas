---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/skiaTemplate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pilote Lua des plaques d'immatriculation dessinées avec Skia. Il génère le texte de plaque à partir des motifs de design.vars (texte littéral et jetons {token}), construit la table de variables ({plate}, {line1}/{line2}, {seg1}…, variables prédéfinies ou générées), substitue chaque {clé} dans une copie de l'arbre de mise en page du format choisi, puis envoie le résultat résolu au moteur C++ (veh:renderLicensePlateSkia), qui lie les textures aux tags de matériau @licenseplate-*. Le C++ ne fait que le rendu. Utile pour les mods de plaques (fichiers *.sktemplate.json).
--- Accès : extension `core_skiaTemplate` : `extensions.load("core_skiaTemplate")`, puis la globale `core_skiaTemplate`
---@class core_skiaTemplate
core_skiaTemplate = {}

--- Outil de développement : compare le rendu CPU et GPU des cartes de plaque. Rend de façon synchrone sur le thread appelant, donc à lancer quand aucune plaque n'est en cours de création.
---Source : lua/ge/extensions/core/skiaTemplate.lua:247
---@param design table|string|nil Design, ou chemin VFS d'un *.sktemplate.json (défaut : plaque standard vehicles/common/licenseplates/default/licensePlate-default.sktemplate.json).
---@param format string|nil Format ; par défaut le premier du design.
---@param text string|nil Texte ; défaut 'ABC-1234'.
---@param iterations integer|nil Nombre d'itérations, 20 par défaut.
---@return string  Résumé des temps renvoyé par le moteur, ou un message d'erreur (skiaBenchmark indisponible hors build de dev avec Skia, design introuvable, format non rendable).
function core_skiaTemplate.benchmark(design, format, text, iterations) end

--- Génère un texte de plaque depuis design.vars.plate (texte littéral et jetons {token}). Sans variable exploitable, repli sur un style 'AAA-0000'.
---Source : lua/ge/extensions/core/skiaTemplate.lua:89
---@param design table|nil Design de plaque.
---@param veh userdata|nil Objet véhicule (pour {vid}, {vname} et licenseFormats).
---@return string  Texte de la plaque.
function core_skiaTemplate.generateText(design, veh) end

--- Résout le format puis le soumet au thread de rendu Skia du moteur (veh:renderLicensePlateSkia avec le JSON résolu), qui lie le résultat aux tags de matériau @licenseplate-* du véhicule.
---Source : lua/ge/extensions/core/skiaTemplate.lua:236
---@param veh userdata Véhicule ayant la méthode renderLicensePlateSkia.
---@param design table Design de plaque.
---@param format string Nom du format.
---@param text string Texte de la plaque.
---@return boolean  false si le véhicule ne sait pas rendre ou si le format est introuvable ; sinon le retour du moteur (true si accepté).
function core_skiaTemplate.renderToVehicle(veh, design, format, text) end

--- Résout un format du design en gabarit plat compris par le moteur : {size, background, normal, emboss, finish, maps, root} avec toutes les {clé} substituées. finish contient les valeurs PBR par défaut (0 à 1) : roughness et metallic pour le fond, fgRoughness et fgMetallic pour le texte et les logos ; un noeud peut surcharger avec ses propres metallic/roughness. Applique aussi la découpe en segments, en lignes (limit/limit2) et la logique de design éventuelle.
---Source : lua/ge/extensions/core/skiaTemplate.lua:162
---@param design table Design de plaque.
---@param format string Nom du format dans design.format.
---@param text string|nil Texte de la plaque (vide remplacé par un espace).
---@param veh userdata|nil Véhicule, utilisé pour les variables générées.
---@return table|nil  Gabarit résolu ; nil si le format ou son root manque.
function core_skiaTemplate.resolveFormat(design, format, text, veh) end

--- Résout un gabarit générique (non plaque) plat {size, background?, root} : copie profonde et substitution des {clé} du texte depuis vars. maps vaut diffuse seulement sauf indication contraire.
---Source : lua/ge/extensions/core/skiaTemplate.lua:226
---@param design table Gabarit avec un champ root.
---@param vars table<string, string>|nil Valeurs de substitution.
---@return table|nil  Gabarit résolu ; nil s'il n'y a pas de root.
function core_skiaTemplate.resolveTemplate(design, vars) end

