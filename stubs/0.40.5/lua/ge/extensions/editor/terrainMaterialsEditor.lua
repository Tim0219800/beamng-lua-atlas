---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/terrainMaterialsEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre « Terrain Material Library » du World Editor : liste, édite, duplique, supprime et importe depuis un autre niveau les matériaux de terrain (TerrainMaterial) du niveau, avec validation des textures (format PNG, tailles puissances de 2, plages de valeurs, ordre des distances), annulation par historique pour les propriétés, changement de textures en masse et mise à niveau de l'ancien format de fichier (art/terrains/materials.json vers art/terrain/main.materials.json). Dépend de editor_terrainEditor (qui fournit la bibliothèque et les proxies de matériaux). Publie editor.showTerrainMaterialsEditor(internalName) pour ouvrir la fenêtre sur un matériau donné.
--- Accès : extension `editor_terrainMaterialsEditor` : `extensions.load("editor_terrainMaterialsEditor")`, puis la globale `editor_terrainMaterialsEditor`
---@class editor_terrainMaterialsEditor
---@field dependencies string[] {"editor_terrainEditor"} : extensions à charger avant celle-ci.
editor_terrainMaterialsEditor = {}

--- Hook appelé quand l'éditeur est activé : si la fenêtre est visible, recharge la bibliothèque de matériaux (editor_terrainEditor.updateMaterialLibrary) et invalide le cache de validation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/terrainMaterialsEditor.lua:2282
function editor_terrainMaterialsEditor.onEditorActivated() end

--- Hook de rendu de l'éditeur : dessine la fenêtre « Terrain Material Library » (liste des matériaux, propriétés V0/V1, validation, boutons d'import/duplication/suppression/mise à niveau) et les fenêtres modales associées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/terrainMaterialsEditor.lua:1666
function editor_terrainMaterialsEditor.onEditorGui() end

--- Hook d'initialisation de l'éditeur : enregistre la fenêtre (710x530), les modales (changement de textures en masse, mise à niveau, import) et publie editor.showTerrainMaterialsEditor.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/terrainMaterialsEditor.lua:2272
function editor_terrainMaterialsEditor.onEditorInitialized() end

