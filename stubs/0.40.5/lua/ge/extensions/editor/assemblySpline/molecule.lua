---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/assemblySpline/molecule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Modèle de « molécule » de l'outil Assembly Spline. Un kit d'assemblage est un dossier de fichiers .dae (noms contenant 'root', 'bridge', 'sag', 'var') dont les ancres 'nail.*' (point, head, aux) définissent des jonctions de type nail (1 degré de liberté), fixed (0) ou ball (3). Le module charge le kit (getAssemblyKit), construit la molécule (rigids = éléments rigides, bridges = éléments reliant deux rigides, avec leurs variations) et gère par spline les états activé/aléatoire/poids de chaque mesh.
--- Accès : extension `editor_assemblySpline_molecule` : `extensions.load("editor_assemblySpline_molecule")`, puis la globale `editor_assemblySpline_molecule`
---@class editor_assemblySpline_molecule
editor_assemblySpline_molecule = {}

--- Après désérialisation, réapplique à la molécule les états activé des rigides, ponts et leurs variations enregistrés dans la spline. Ne fait rien si spline ou molécule est nil.
---Source : lua/ge/extensions/editor/assemblySpline/molecule.lua:767
---@param spline table|nil Spline.
---@param molecule table|nil Molécule.
function editor_assemblySpline_molecule.applyEnabledStatesToMolecule(spline, molecule) end

--- Construit la molécule depuis le kit : regroupe les variations (_var) avec leur mesh de base, identifie racine, rigides et ponts, calcule les jonctions d'après les ancres nail.* puis corrige les points d'attache des ponts pour les placer aux bords des meshes.
---Source : lua/ge/extensions/editor/assemblySpline/molecule.lua:425
---@param assemblyKit table Résultat de getAssemblyKit.
---@param spline table Spline utilisée pour les états activé/aléatoire (déduit du code).
---@return table  Molécule avec les listes rigids et bridges (chaque entrée : mesh, variations, isRandom, randomWeight).
function editor_assemblySpline_molecule.buildMolecule(assemblyKit, spline) end

--- Charge un kit : liste tous les .dae du dossier et sous-dossiers (FS:findFiles) et extrait pour chacun ses données (boîte englobante, ancres). Chemin vide ou nil : renvoie une table vide et une chaîne vide.
---Source : lua/ge/extensions/editor/assemblySpline/molecule.lua:127
---@param kitFolderPath string Dossier du kit (ex. 'assets/meshes/props/assembly_kit/ak_wood_fence_001/').
---@return table  Liste des meshes du kit (id, fileName, meshPath, ancres…).
---@return string  Chaîne vide si chemin invalide (deuxième valeur seulement dans ce cas, déduit du code).
function editor_assemblySpline_molecule.getAssemblyKit(kitFolderPath) end

--- Indique si le mesh pont d'id donné est activé pour la spline (même règle que getRigidEnabled).
---Source : lua/ge/extensions/editor/assemblySpline/molecule.lua:56
---@param spline table Assembly spline.
---@param meshId string Id du mesh.
---@return boolean  Activé ou non.
function editor_assemblySpline_molecule.getBridgeEnabled(spline, meshId) end

--- Indique si la distribution du groupe pont est aléatoire. Défaut false.
---Source : lua/ge/extensions/editor/assemblySpline/molecule.lua:99
---@param spline table Assembly spline.
---@param meshId string Id du mesh.
---@return boolean  true si aléatoire.
function editor_assemblySpline_molecule.getBridgeRandom(spline, meshId) end

--- Poids de tirage d'un mesh pont (défaut 1.0).
---Source : lua/ge/extensions/editor/assemblySpline/molecule.lua:113
---@param spline table Assembly spline.
---@param meshId string Id du mesh.
---@return number  Poids.
function editor_assemblySpline_molecule.getBridgeRandomWeight(spline, meshId) end

--- Indique si le mesh rigide d'id donné est activé pour la spline (voir notes pour le piège).
---Source : lua/ge/extensions/editor/assemblySpline/molecule.lua:41
---@param spline table Assembly spline.
---@param meshId string Id du mesh.
---@return boolean  Activé ou non.
function editor_assemblySpline_molecule.getRigidEnabled(spline, meshId) end

--- Indique si la distribution du groupe rigide est aléatoire (sinon tourniquet). Défaut false.
---Source : lua/ge/extensions/editor/assemblySpline/molecule.lua:71
---@param spline table Assembly spline.
---@param meshId string Id du mesh.
---@return boolean  true si aléatoire.
function editor_assemblySpline_molecule.getRigidRandom(spline, meshId) end

--- Poids de tirage d'un mesh rigide (défaut 1.0).
---Source : lua/ge/extensions/editor/assemblySpline/molecule.lua:85
---@param spline table Assembly spline.
---@param meshId string Id du mesh.
---@return number  Poids.
function editor_assemblySpline_molecule.getRigidRandomWeight(spline, meshId) end

--- Définit l'état activé d'un mesh pont.
---Source : lua/ge/extensions/editor/assemblySpline/molecule.lua:65
---@param spline table Assembly spline.
---@param meshId string Id du mesh.
---@param enabled boolean Activé.
function editor_assemblySpline_molecule.setBridgeEnabled(spline, meshId, enabled) end

--- Définit le mode de distribution aléatoire d'un pont.
---Source : lua/ge/extensions/editor/assemblySpline/molecule.lua:107
---@param spline table Assembly spline.
---@param meshId string Id du mesh.
---@param isRandom boolean Aléatoire.
function editor_assemblySpline_molecule.setBridgeRandom(spline, meshId, isRandom) end

--- Définit le poids de tirage d'un mesh pont.
---Source : lua/ge/extensions/editor/assemblySpline/molecule.lua:121
---@param spline table Assembly spline.
---@param meshId string Id du mesh.
---@param weight number Poids.
function editor_assemblySpline_molecule.setBridgeRandomWeight(spline, meshId, weight) end

--- Définit l'état activé d'un mesh rigide pour la spline (crée la table au besoin).
---Source : lua/ge/extensions/editor/assemblySpline/molecule.lua:50
---@param spline table Assembly spline.
---@param meshId string Id du mesh.
---@param enabled boolean Activé.
function editor_assemblySpline_molecule.setRigidEnabled(spline, meshId, enabled) end

--- Définit le mode de distribution aléatoire d'un rigide.
---Source : lua/ge/extensions/editor/assemblySpline/molecule.lua:79
---@param spline table Assembly spline.
---@param meshId string Id du mesh.
---@param isRandom boolean Aléatoire.
function editor_assemblySpline_molecule.setRigidRandom(spline, meshId, isRandom) end

--- Définit le poids de tirage d'un mesh rigide.
---Source : lua/ge/extensions/editor/assemblySpline/molecule.lua:93
---@param spline table Assembly spline.
---@param meshId string Id du mesh.
---@param weight number Poids.
function editor_assemblySpline_molecule.setRigidRandomWeight(spline, meshId, weight) end

