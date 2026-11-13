---@meta
-- tim19Atlas stub generated from lua/ge/client/core.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Initialisation du « core » graphique du client : crée par code Lua les matériaux, shaders et state blocks de base qui étaient autrefois des scripts Torque. Il couvre les matériaux communs (WarningMaterial, BlankWhite, Corona_Mat, ciels BlackSky/BlueSky/GreySky, grilles Grid512_*, matériaux du track editor, flèche de spawn), les états d'échantillonnage (SamplerClampLinear/Point, SamplerWrapLinear/Point), les shaders de particules, de réflexion, de feuillage et de terrain, l'eau (WaterMat, UnderwaterMat et versions « Basic »), le ciel (atmosphère ScatterSky, SkyLut, étoiles, lune, Voie lactée, météores), les nuages et le matériau de surbrillance et de transparence des véhicules (VehicleHighlightMat, vehicleGhost). Il charge aussi tous les fichiers *.materials.json du dossier core/.
--- Accès : `require("client/core")`
---@class client_core
local client_core = {}

--- Initialise le client une seule fois : graine aléatoire (setRandomSeed(-1)), objectsRequiredForStartup, création du canvas, matériaux de base, shaders, eau, ciel, nuages et données véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/core.lua:1182
function client_core.initializeCore() end

--- Crée les matériaux communs et ceux du track editor, puis charge chaque fichier core/**/*.materials.json avec loadJsonMaterialsFile.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/core.lua:719
function client_core.loadCoreMaterials() end

--- Recrée le canvas via initializeCanvas (utile après un changement de configuration de fenêtre) et marque le core comme initialisé. Ne recrée pas les matériaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/core.lua:1209
function client_core.reloadCore() end

return client_core
