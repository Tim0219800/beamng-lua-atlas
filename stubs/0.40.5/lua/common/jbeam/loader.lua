---@meta
-- tim19Atlas stub generated from lua/common/jbeam/loader.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Chargeur principal des véhicules jbeam : orchestre toutes les étapes qui transforment les fichiers .jbeam et la configuration choisie en un « bundle » de données véhicule (vdata) prêt pour la physique. Ordre : lecture des fichiers (jbeam/io), choix des pièces par le système de slots, application des variables, unification des pièces, schéma de tables, fusion de sections, résolution des liens et cid, nœuds/poutres, roues, groupes, mise à l'échelle, valeurs par défaut des options, optimisation, interaction. Puis loadBundle crée côté moteur : événements, plaques, couleurs, positions initiales des nœuds, meshes, cordes, matériaux, visages, rétroviseurs. Tourne dans les deux VM (GE et véhicule, vmType). Un moddeur s'en sert surtout pour lire la config chargée ou utiliser les hooks onJbeamLoadingPhase1/2.
--- Accès : `require("jbeam/loader")`
---@class jbeam_loader
---@field _noSerialize boolean true : le module n'est pas sérialisé lors d'un rechargement de la VM.
---@field data table Table vide créée à l'initialisation (non remplie dans ce fichier).
---@field defaultBeamDamp number Amortissement par défaut (580).
---@field defaultBeamDeform number Seuil de déformation par défaut (220000 N).
---@field defaultBeamSpring number Raideur par défaut des poutres (4300000 N/m).
---@field defaultBeamStrength number Résistance par défaut d'une poutre : math.huge (infinie).
---@field defaultNodeWeight number Masse par défaut d'un nœud (25 kg).
local jbeam_loader = {}

--- Si le cache éditeur est activé, enregistre une copie encodée du bundle (en ajoutant temporairement editorTransform aux props) pour l'éditeur.
---Source : lua/common/jbeam/loader.lua:73
---@param vehicleId integer Identifiant du véhicule.
---@param vehicleBundle table Bundle à mémoriser.
---@param vehicleObj userdata Objet véhicule moteur (pour lire les transformations des props).
function jbeam_loader.cacheVehicleBundleForEditor(vehicleId, vehicleBundle, vehicleObj) end

--- Renvoie une copie décodée du bundle mis en cache pour l'éditeur.
---Source : lua/common/jbeam/loader.lua:95
---@param vehicleId integer Identifiant du véhicule.
---@return table|nil  Bundle ou nil.
function jbeam_loader.getCachedVehicleBundle(vehicleId) end

--- Crée côté moteur tout ce qui dépend de l'objet véhicule : événements d'entrée, plaques, couleurs, peintures, positions initiales et collisions des nœuds, nœuds de référence, meshes, cordes visuelles, matériaux, visages d'occupants, rétroviseurs, et charge les extensions listées dans gameEngineExtensions. Sans objet véhicule (VM véhicule), met props et flexbodies à {}.
---Source : lua/common/jbeam/loader.lua:367
---@param objID integer Identifiant du véhicule.
---@param vehicleBundle table Bundle produit par loadJbeam.
---@param loadingProgress table|nil Objet de progression.
---@return userdata|nil  L'objet véhicule moteur (GE seulement).
function jbeam_loader.loadBundle(objID, vehicleBundle, loadingProgress) end

--- Charge et assemble en mémoire toutes les données jbeam du véhicule (pièces, variables, tables, liens, cid, roues, groupes, optimisation) sans toucher aux objets 3D.
---Source : lua/common/jbeam/loader.lua:144
---@param objID integer Identifiant du véhicule.
---@param loadingProgress table|nil Objet de progression du LoadingManager (méthode update).
---@param vehicleDirectories string[] Dossiers jbeam (le premier est le dossier du véhicule).
---@param vehicleConfig table|nil Configuration du véhicule.
---@return table|nil  Bundle véhicule ; nil si une étape échoue.
function jbeam_loader.loadJbeam(objID, loadingProgress, vehicleDirectories, vehicleConfig) end

--- Comme loadJbeam mais ne fait que choisir les pièces : renvoie la configuration complétée (model, mainPartName, mainPartPath, partsTree).
---Source : lua/common/jbeam/loader.lua:132
---@param vehicleDirectories string[] Dossiers jbeam.
---@param vehicleConfig table|nil Configuration de départ.
---@return table|nil  vehicleConfig complétée ; nil si aucune pièce principale.
function jbeam_loader.loadJbeamOnlyConfig(vehicleDirectories, vehicleConfig) end

--- Point d'entrée de chargement d'un véhicule : normalise le dossier (slash initial et final), ajoute /vehicles/common/, consulte le cache, appelle loadJbeam puis loadBundle et suit la progression dans le LoadingManager (côté GE).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/loader.lua:452
---@param objID integer Identifiant de l'objet véhicule.
---@param vehicleDir string Dossier du véhicule (ex. 'vehicles/pickup').
---@param vehicleConfig table|nil Configuration (pièces choisies, couleurs/paints, variables, mainPartName...).
---@return table|nil  Bundle {id, vehicleDirectory, directoriesLoaded, vdata, config, mainPartName, ioCtx} ; nil en cas d'échec.
function jbeam_loader.loadVehicleStage1(objID, vehicleDir, vehicleConfig) end

--- Hook appelé quand un fichier change : vide le cache de bundles et le cache éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/loader.lua:525
---@param filename string Fichier modifié.
---@param type string Type de changement.
function jbeam_loader.onFileChanged(filename, type) end

--- Active ou désactive le cache éditeur ; désactiver le vide.
---Source : lua/common/jbeam/loader.lua:102
---@param enabled boolean true pour activer.
function jbeam_loader.setEditorCacheEnabled(enabled) end

return jbeam_loader
