---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/importFile.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utilitaires d'import de fichiers pour Road Architect, pensés pour un usage sans interface (pont tech/BeamNGpy). Ils lisent un fichier depuis un chemin virtuel ou natif, le copient si besoin dans /temp/roadArchitectImport, préparent les API de l'éditeur (historique, préférences) sans ouvrir l'UI, puis finalisent les routes (DecalRoads, collisions, navgraph).
--- Accès : extension `editor_roadArchitect_importFile` : `extensions.load("editor_roadArchitect_importFile")`, puis la globale `editor_roadArchitect_importFile`
---@class editor_roadArchitect_importFile
editor_roadArchitect_importFile = {}

--- Prépare les API du World Editor nécessaires à l'import et à la finalisation sans ouvrir l'interface : charge editor_main si besoin, appelle editor.initializeModules pour créer l'historique, puis editor.ensurePreferencesApi ou editor.loadPreferences pour les préférences (nécessaires à roadRiver.getPreference lors de la finalisation des DecalRoads).
---Source : lua/ge/extensions/editor/roadArchitect/importFile.lua:84
function editor_roadArchitect_importFile.ensureEditorHistory() end

--- Si options.finalize est true, pose les DecalRoads et meshes, recharge les collisions et reconstruit le navgraph, comme la bascule Render/finalise de Road Architect. Déjà finalisé (objet « Road Architect » existant) : appelle d'abord roads.unfinalise() pour éviter les doublons.
---Source : lua/ge/extensions/editor/roadArchitect/importFile.lua:114
---@param options table|nil Options d'import ; seul le champ finalize (boolean) est lu.
---@return boolean  true si la finalisation a eu lieu.
---@return string|nil  Message d'erreur, par exemple « finalize requires a loaded level (MissionGroup missing) ».
function editor_roadArchitect_importFile.maybeFinalise(options) end

--- Lit le contenu d'un fichier à partir d'un chemin virtuel ou natif absolu. Essaie readFile, la conversion native vers virtuel, puis io.open en binaire. Renvoie nil si le chemin est invalide ou si le fichier est introuvable.
---Source : lua/ge/extensions/editor/roadArchitect/importFile.lua:16
---@param filePath string Chemin virtuel ou natif (les antislashs sont normalisés en /).
---@return string|nil  Contenu du fichier, ou nil.
function editor_roadArchitect_importFile.readTextFile(filePath) end

--- Écrit le contenu fourni dans /temp/roadArchitectImport/<nom du fichier> (dossier créé si nécessaire) afin que le jeu puisse le lire dans son système de fichiers virtuel. Convertit fileContent en string avec tostring s'il n'en est pas une. Lève une erreur si l'écriture échoue.
---Source : lua/ge/extensions/editor/roadArchitect/importFile.lua:60
---@param filePath string Chemin d'origine, dont seul le nom de fichier est conservé (import.bin par défaut).
---@param fileContent string|nil Contenu à déposer ; si nil ou vide, rien n'est écrit.
---@return string  Chemin utilisable : le fichier déposé, ou filePath si rien n'a été écrit.
---@return boolean  true si le fichier a été déposé.
function editor_roadArchitect_importFile.stageText(filePath, fileContent) end

