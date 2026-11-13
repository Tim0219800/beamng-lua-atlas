---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/export.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Exporte le véhicule du joueur au format glTF 2.0 (.gltf avec JSON ou .glb binaire), ou une séquence d'images clés. Il récupère le maillage GPU du véhicule (GPUMesh.bng_getGPUMesh) puis écrit les buffers (sommets, normales, tangentes, UV, couleurs, indices), les flexbodies et les props, l'arbre de pièces JBeam (sous forme de hiérarchie de nœuds glTF), les matériaux (textures converties en PNG, données du matériau BeamNG dans extras.bngMaterial) et, si exportBeams est vrai, les nœuds et poutres de chaque pièce (extension BNG_JBeamData). La direction du véhicule est écrite dans l'extension BNG_Direction. Les coordonnées sont converties en {x, z, -y}. L'export est asynchrone : il a lieu dans updateGFX quand les données GPU sont prêtes. Utile pour importer un véhicule BeamNG dans Blender ou un autre outil 3D.
--- Accès : extension `util_export` : `extensions.load("util_export")`, puis la globale `util_export`
---@class util_export
---@field embedBuffers boolean true (défaut) : buffers intégrés en base64 dans le JSON ; false : fichiers .bin externes (<nom>_buffer_NNN_<type>.bin). Ignoré en format binaire.
---@field exportBeams boolean Exporte les nœuds et poutres par pièce dans extras (défaut true)
---@field exportColors boolean Exporte les couleurs de sommets (défaut false)
---@field exportNormals boolean Exporte les normales (défaut true)
---@field exportTangents boolean Exporte les tangentes (défaut false)
---@field exportTexCoords boolean Exporte les deux jeux de coordonnées de texture (défaut false)
---@field gltfBinaryFormat boolean true (défaut) : écrit un .glb ; false : écrit un .gltf JSON
util_export = {}

--- Lance l'export du véhicule joueur et appelle handler(gltfRoot) avec la table glTF construite quand les données GPU sont prêtes (dans updateGFX).
---Source : lua/ge/extensions/util/export.lua:1124
---@param handler function Fonction recevant la table glTF racine (ou nil si un export est déjà en cours)
function util_export.export(handler) end

--- Exporte le véhicule joueur dans un fichier glTF (JSON ou binaire selon gltfBinaryFormat). Réinitialise le cache d'images et affiche un message d'interface.
---Source : lua/ge/extensions/util/export.lua:1140
---@param filename string Chemin du fichier de sortie (.gltf ou .glb)
function util_export.exportFile(filename) end

--- Renvoie les réglages de l'export utiles à l'interface (actuellement seulement gltfBinaryFormat).
---Source : lua/ge/extensions/util/export.lua:1284
---@return table  {gltfBinaryFormat = boolean}
function util_export.getGeInfo() end

--- Exporte une première image dans le fichier puis continue d'exporter à chaque frame (animation) jusqu'à l'appel de stopRecording.
---Source : lua/ge/extensions/util/export.lua:1248
---@param filename string Chemin du fichier de sortie
function util_export.startRecording(filename) end

--- Arrête l'enregistrement d'animation démarré par startRecording.
---Source : lua/ge/extensions/util/export.lua:1253
function util_export.stopRecording() end

--- Propose un nom de fichier libre export_NNN.glb ou .gltf dans le dossier du véhicule joueur (pour l'interface).
---Source : lua/ge/extensions/util/export.lua:1263
---@return string  Chemin proposé, ou chaîne vide s'il n'y a pas de véhicule joueur
function util_export.suggestFilename() end

--- Hook appelé chaque frame : si les données GPU du maillage sont prêtes, termine l'export en cours (processExport).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/export.lua:1257
---@param dt number Delta de temps (non utilisé)
function util_export.updateGFX(dt) end

