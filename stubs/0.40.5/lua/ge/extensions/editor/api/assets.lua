---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/assets.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- API de l'éditeur pour le glisser-déposer d'assets (chemins de fichiers sous forme de chaînes) entre fenêtres ImGui. À l'initialisation, ajoute à l'instance de l'éditeur : editor.dragDropAsset (état interne), editor.dragDropSource et editor.dragDropTarget. Une source et une cible se correspondent si elles utilisent le même dragDropId ; la donnée est transportée dans un tampon de 2048 caractères.
--- Accès : extension `editor_api_assets` : `extensions.load("editor_api_assets")`, puis la globale `editor_api_assets`
---@class editor_api_assets
editor_api_assets = {}

--- Initialise le module : mémorise l'éditeur et y installe dragDropAsset, dragDropSource et dragDropTarget.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/assets.lua:39
---@param editorInstance table Instance de l'éditeur.
function editor_api_assets.initialize(editorInstance) end

--- Méthodes ajoutées à l'instance de l'éditeur par ce module.
---@class editor_api_assets_editor
local editor_api_assets_editor = {}

--- À appeler pendant le dessin de l'élément ImGui qui sert de source : si un glissement commence, crée la charge utile (data, tampon de 2048 caractères), mémorise le callback et affiche le texte pendant le glissement.
---Source : lua/ge/extensions/editor/api/assets.lua:13
---@param dragDropId string Identifiant de type de charge utile ; les cibles n'acceptent que le même identifiant.
---@param data string Chaîne transportée (ex. chemin d'asset).
---@param callback function|nil Appelée avec la chaîne quand le dépôt a réussi.
function editor_api_assets_editor.dragDropSource(dragDropId, data, callback) end

--- À appeler après l'élément ImGui qui sert de cible : accepte une charge utile du même dragDropId, appelle le callback de la source avec la chaîne reçue puis réinitialise l'état.
---Source : lua/ge/extensions/editor/api/assets.lua:25
---@param dragDropId string Identifiant de type de charge utile accepté.
function editor_api_assets_editor.dragDropTarget(dragDropId) end

