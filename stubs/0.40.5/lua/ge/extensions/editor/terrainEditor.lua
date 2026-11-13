---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/terrainEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Éditeur de terrain du World Editor (mode d'édition « Terrain Tools », terrainToolsEditMode). Il gère les pinceaux de sculpture, de peinture de matériaux et de terraformage (via extensions/editor/terraformTool), le choix du TerrainBlock actif, la bibliothèque de matériaux de terrain du niveau (art/terrain/main.materials.json) sous forme de « proxies », la fenêtre d'import/export de terrain (heightmap, hole map, cartes de texture, meshes, presets) et la sauvegarde du terrain et des matériaux avant l'enregistrement du niveau. Un moddeur s'en sert surtout pour récupérer le TerrainBlock/l'objet TerrainEditor (getTerrainBlock, getTerrainEditor), marquer le terrain modifié (setTerrainDirty) ou manipuler les matériaux peints.
--- Accès : extension `editor_terrainEditor` : `extensions.load("editor_terrainEditor")`, puis la globale `editor_terrainEditor`
---@class editor_terrainEditor
editor_terrainEditor = {}

--- Active l'auto-répétition du changement de taille de pinceau avec les touches [ et ].
---Source : lua/ge/extensions/editor/terrainEditor.lua:3376
---@param direction integer Sens du changement (convention de changeBrushSize : 1 agrandir, 0 réduire, déduite du code)
function editor_terrainEditor.beginChangeBrushSizeWithKeys(direction) end

--- Augmente (value == 1) ou diminue (value == 0) la taille du pinceau de `step`, bornée à 1-256, et l'applique au TerrainEditor. Toute autre valeur de value ne change rien.
---Source : lua/ge/extensions/editor/terrainEditor.lua:2482
---@param value integer 1 pour agrandir, 0 pour réduire
---@param step number Incrément de taille
function editor_terrainEditor.changeBrushSize(value, step) end

--- Détecte l'emplacement du fichier de matériaux (art/terrain ou ancien art/terrains) et signale le format obsolète (errors.deprecated_material_file).
---Source : lua/ge/extensions/editor/terrainEditor.lua:2798
function editor_terrainEditor.checkForTerrainMaterialFileFormat() end

--- Copie profonde d'un proxy de matériau en recréant les widgets imgui d'entrée (nom, taille, forces…). Remplit le groundmodelName depuis l'internalName en majuscules s'il est vide.
---Source : lua/ge/extensions/editor/terrainEditor.lua:621
---@param mtlProxy table Proxy source
---@return table  Copie avec champs *Input.
function editor_terrainEditor.copyMaterialProxyWithInputs(mtlProxy) end

--- Construit un proxy Lua d'un matériau de terrain (cartes diffuse/normal/detail/macro, tailles, forces, distances, side projection, parallaxScale, groundmodelName, uniqueID = nom-persistentId). Appelle fixGroundmodelName ; si dirty est vrai, marque aussi le terrain modifié.
---Source : lua/ge/extensions/editor/terrainEditor.lua:671
---@param index integer Indice (base 1)
---@param pid string|nil persistentId (créé si vide)
---@param mtlObject userdata Objet matériau de terrain
---@param name string internalName
---@param dirty boolean|nil true pour marquer sale
---@param isNew boolean|nil true si matériau nouvellement créé
---@return table  Proxy du matériau.
function editor_terrainEditor.createMaterialProxy(index, pid, mtlObject, name, dirty, isNew) end

--- Retire de la bibliothèque en mémoire le matériau dont l'internalName est donné (ne modifie pas le fichier).
---Source : lua/ge/extensions/editor/terrainEditor.lua:3346
---@param name string internalName du matériau
function editor_terrainEditor.deleteMaterialInJson(name) end

--- Cible de glisser-déposer imgui pour un asset (payload ASSETDRAGDROP de 2048 octets) : appelle updateMap avec le chemin déposé. À appeler juste après un widget imgui.
---Source : lua/ge/extensions/editor/terrainEditor.lua:409
---@param mtlProxy table Proxy de matériau
---@param map string|table Carte visée
---@param cbData any Non utilisé (déduit du code)
function editor_terrainEditor.dragDropTarget(mtlProxy, map, cbData) end

--- Arrête l'auto-répétition du changement de taille de pinceau.
---Source : lua/ge/extensions/editor/terrainEditor.lua:3377
function editor_terrainEditor.endChangeBrushSizeWithKeys() end

--- Migration : auparavant le groundmodel était stocké dans l'internalName ; maintenant un champ groundmodel dédié existe. Si ce champ est vide, il est rempli depuis l'internalName en majuscules (ou « ASPHALT » pour un matériau neuf), le matériau est marqué sale et un avertissement est logué.
---Source : lua/ge/extensions/editor/terrainEditor.lua:649
---@param name string internalName
---@param mtlObject userdata Matériau
---@param isNew boolean|nil true si nouveau
function editor_terrainEditor.fixGroundmodelName(name, mtlObject, isNew) end

--- Efface l'erreur « deprecated_material_file » (à appeler une fois le fichier de matériaux mis à niveau).
---Source : lua/ge/extensions/editor/terrainEditor.lua:3375
function editor_terrainEditor.fixedFileFormat() end

--- Table des erreurs/avertissements de format détectés (clé -> true).
---Source : lua/ge/extensions/editor/terrainEditor.lua:3373
---@return table<string, boolean>
function editor_terrainEditor.getErrors() end

--- Chemin du niveau courant (var.levelPath).
---Source : lua/ge/extensions/editor/terrainEditor.lua:3374
---@return string|nil
function editor_terrainEditor.getLevelPath() end

--- Chemin (relatif au niveau) du fichier des matériaux de terrain, normalement '/art/terrain/main.materials.json'.
---Source : lua/ge/extensions/editor/terrainEditor.lua:3371
---@return string
function editor_terrainEditor.getMatFilePath() end

--- Bibliothèque de matériaux du niveau lue dans le JSON.
---Source : lua/ge/extensions/editor/terrainEditor.lua:3367
---@return table  Matériaux indexés par id/persistentId, avec internalName, etc.
function editor_terrainEditor.getMaterialsInJson() end

--- Cherche un matériau d'import par nom (exact, puis insensible à la casse). Renvoie son indice à base 0, son nom et si trouvé ; sinon 0 et le premier matériau avec found=false ; (0, 'unknown', false) s'il n'y en a aucun.
---Source : lua/ge/extensions/editor/terrainEditor.lua:223
---@param matName string Nom du matériau
---@return integer  Indice (base 0)
---@return string  Nom retenu
---@return boolean  true si trouvé
function editor_terrainEditor.getMtlIdByName(matName) end

--- Liste des proxies des matériaux de peinture du TerrainBlock actif.
---Source : lua/ge/extensions/editor/terrainEditor.lua:3369
---@return table[]
function editor_terrainEditor.getPaintMaterialProxies() end

--- Proxy du matériau de peinture sélectionné (ou nil).
---Source : lua/ge/extensions/editor/terrainEditor.lua:3368
---@return table|nil
function editor_terrainEditor.getSelectedPaintMaterialProxy() end

--- Renvoie l'objet TerrainBlock actif (recherché par son id) ou nil s'il n'y en a pas.
---Source : lua/ge/extensions/editor/terrainEditor.lua:3366
---@return userdata|nil  TerrainBlock
function editor_terrainEditor.getTerrainBlock() end

--- Indice (base 1) du matériau de peinture portant cet internalName, ou -1 s'il n'est pas dans le bloc.
---Source : lua/ge/extensions/editor/terrainEditor.lua:3355
---@param name string internalName
---@return integer  Indice ou -1
function editor_terrainEditor.getTerrainBlockMaterialIndex(name) end

--- Table des proxies de TerrainBlock indexée par nom d'objet.
---Source : lua/ge/extensions/editor/terrainEditor.lua:3370
---@return table<string, table>  { [nom] = { selected = boolean, id = integer } }
function editor_terrainEditor.getTerrainBlockProxies() end

--- Renvoie l'objet TerrainEditor (C++) utilisé pour les conversions monde/grille, les pinceaux et les actions.
---Source : lua/ge/extensions/editor/terrainEditor.lua:3365
---@return userdata  TerrainEditor
function editor_terrainEditor.getTerrainEditor() end

--- Dossier des matériaux de terrain du niveau : '/art/terrain/' ou l'ancien '/art/terrains/'.
---Source : lua/ge/extensions/editor/terrainEditor.lua:3372
---@return string
function editor_terrainEditor.getTerrainFolder() end

--- Renvoie un nom de matériau absent de la bibliothèque : initialName, puis initialName0, initialName1…
---Source : lua/ge/extensions/editor/terrainEditor.lua:721
---@param initialName string|nil Nom de base (« NewMaterial » par défaut).
---@param counter integer|nil Suffixe de départ (récursif, interne).
---@return string  Nom unique.
function editor_terrainEditor.getUniqueMtlName(initialName, counter) end

--- Renvoie la table interne var (état de l'interface, levelPath, brosse courante…).
---Source : lua/ge/extensions/editor/terrainEditor.lua:3364
---@return table  Table var
function editor_terrainEditor.getVars() end

--- Hook appelé à la fin de la mission : vide la bibliothèque de matériaux en mémoire.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/terrainEditor.lua:3285
function editor_terrainEditor.onClientEndMission() end

--- Hook appelé avant l'enregistrement du niveau : sauvegarde les matériaux de terrain modifiés puis le fichier terrain (en émettant onEditorBeforeSaveTerrain / onEditorAfterSaveTerrain) si des modifications sont en attente.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/terrainEditor.lua:3120
function editor_terrainEditor.onEditorBeforeSaveLevel() end

--- Hook appelé quand l'éditeur est désactivé ; ne fait rien dans cette version.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/terrainEditor.lua:3282
function editor_terrainEditor.onEditorDeactivated() end

--- Hook appelé avant la suppression de la sélection : détache les TerrainBlock sélectionnés du TerrainEditor et vide l'état si c'était le bloc actif, pour éviter des plantages.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/terrainEditor.lua:3297
function editor_terrainEditor.onEditorDeleteSelection() end

--- Hook de rendu : dessine le dialogue d'import, celui d'export, la fenêtre de peinture, la courbe de douceur et la barre d'outils du terrain.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/terrainEditor.lua:2399
function editor_terrainEditor.onEditorGui() end

--- Hook d'initialisation de l'éditeur : enregistre les fenêtres (terrainPainter, import, export, courbe de douceur, modale autoPaint) et le mode d'édition « Terrain Tools », puis appelle initialize().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/terrainEditor.lua:3258
function editor_terrainEditor.onEditorInitialized() end

--- Hook appelé à l'ajout d'un objet dans l'éditeur : si c'est un TerrainBlock, rescanne les blocs (updateEditorTerrainBlocks).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/terrainEditor.lua:3289
---@param id integer Id de l'objet ajouté
function editor_terrainEditor.onEditorObjectAdded(id) end

--- Hook appelé quand une préférence change : répercute terrainEditor.general.* (taille, pression, douceur, hauteur, pentes, filtre de sélection douce) et terrainEditor.terraform.* (DOI, marge, falloff, rugosité, échelle) sur le pinceau/terraformeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/terrainEditor.lua:3145
---@param path string Chemin de la préférence
---@param value any Nouvelle valeur
function editor_terrainEditor.onEditorPreferenceValueChanged(path, value) end

--- Hook d'enregistrement des préférences : crée la catégorie terrainEditor (general, import, terrainMaterialLibrary, terraform) avec leurs valeurs par défaut et bornes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/terrainEditor.lua:3215
---@param prefsRegistry table Registre de préférences de l'éditeur
function editor_terrainEditor.onEditorRegisterPreferences(prefsRegistry) end

--- Vide une carte d'un proxy (updateMap avec un chemin vide). Un TODO du code s'interroge sur l'origine de mtlProxy.
---Source : lua/ge/extensions/editor/terrainEditor.lua:1026
---@param mtlProxy table Proxy de matériau
---@param mapType string Type de carte
function editor_terrainEditor.removeMap(mtlProxy, mapType) end

--- Enregistre les matériaux de terrain modifiés (terrEd_PersistMan:saveDirty).
---Source : lua/ge/extensions/editor/terrainEditor.lua:1031
function editor_terrainEditor.saveMaterials() end

--- Enregistre les matériaux puis le fichier terrain (.ter) du TerrainBlock actif, efface les notifications et affiche « Saved TerrainBlock ».
---Source : lua/ge/extensions/editor/terrainEditor.lua:1036
function editor_terrainEditor.saveTerrainAndMaterials() end

--- Sélectionne un matériau de peinture et règle l'indice de peinture du TerrainEditor (index - 1).
---Source : lua/ge/extensions/editor/terrainEditor.lua:884
---@param matProxy table Proxy de matériau (avec .index à base 1)
function editor_terrainEditor.selectPaintMaterial(matProxy) end

--- Définit le TerrainBlock sur lequel travaillent les outils (jusqu'à ce que l'utilisateur en choisisse un autre) : l'attache au TerrainEditor, réinitialise le matériau de peinture sélectionné et sélectionne le premier. Sans effet si l'id est introuvable.
---Source : lua/ge/extensions/editor/terrainEditor.lua:1059
---@param id integer Id de l'objet TerrainBlock
function editor_terrainEditor.setActiveTerrainBlock(id) end

--- Marque les matériaux de terrain comme modifiés (editor.setDirty + notification) ; ils seront sauvegardés avec le niveau.
---Source : lua/ge/extensions/editor/terrainEditor.lua:530
function editor_terrainEditor.setMaterialsDirty() end

--- Marque le terrain comme modifié (editor.setDirty) et affiche la notification « unsaved terrain changes ». Le terrain sera enregistré à la sauvegarde du niveau. À appeler après toute modification directe de la heightmap.
---Source : lua/ge/extensions/editor/terrainEditor.lua:525
function editor_terrainEditor.setTerrainDirty() end

--- Voir plus haut : recalcule les variables d'interface.
---Source : lua/ge/extensions/editor/terrainEditor.lua:2389
function editor_terrainEditor.setupVars() end

--- Rescanne les TerrainBlock du niveau, détache les anciens et attache tous les nouveaux au TerrainEditor, puis réactive le bloc préféré (ou l'actif, ou le premier) ; vide l'état s'il n'y en a plus.
---Source : lua/ge/extensions/editor/terrainEditor.lua:1108
---@param preferredId integer|nil Id du bloc à activer en priorité.
function editor_terrainEditor.updateEditorTerrainBlocks(preferredId) end

--- Affecte un chemin de texture à une carte d'un proxy ('diffuse', 'macro', 'detail', 'normal') ou aux champs de l'importeur/exporteur ('heightMap', 'holeMap', 'textureMap', 'mesh', ou table {meshIndex=…}).
---Source : lua/ge/extensions/editor/terrainEditor.lua:377
---@param mtlProxy table Proxy de matériau (ignoré pour les cartes d'import)
---@param map string|table Type de carte
---@param path string Chemin du fichier
function editor_terrainEditor.updateMap(mtlProxy, map, path) end

--- Relit le fichier de matériaux JSON du niveau et reconstruit la bibliothèque (materialsInJson). (Un TODO du code indique que cela devrait migrer vers terrainMaterialsEditor.lua.)
---Source : lua/ge/extensions/editor/terrainEditor.lua:733
function editor_terrainEditor.updateMaterialLibrary() end

--- Reconstruit les proxies des matériaux de peinture du TerrainBlock actif (noms, indices, inTerrainBlock), avertit si le nombre ne correspond pas et resélectionne le matériau précédent.
---Source : lua/ge/extensions/editor/terrainEditor.lua:900
function editor_terrainEditor.updatePaintMaterialProxies() end

--- Reconstruit la liste des TerrainBlock du niveau (proxies {selected, id} par nom) et la liste triée des noms pour le combo.
---Source : lua/ge/extensions/editor/terrainEditor.lua:1046
function editor_terrainEditor.updateTerrainBlockProxies() end

