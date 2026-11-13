---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/materialEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Éditeur de matériaux du monde (fenêtre « materialEditor » de l'éditeur de niveau). Il liste les matériaux du niveau et de art/, permet de modifier leurs propriétés par couche (textures, couleurs, flottants, cases à cocher, animation, mélange alpha, cubemap…), avec undo/redo, aperçu 3D (cube de art/shapes/material_preview), détection de problèmes de textures, estimation de taille GPU, usage du matériau dans la scène, focus/isolation dans la vue et sauvegarde des matériaux modifiés. Les fonctions exportées servent surtout à d'autres outils de l'éditeur : sélectionner un matériau, changer une propriété, réutiliser les widgets.
--- Accès : extension `editor_materialEditor` : `extensions.load("editor_materialEditor")`, puis la globale `editor_materialEditor`
---@class editor_materialEditor
---@field customMaterialsArray string[] Classes de matériaux proposées : 'Standard', 'MetalicCarPaint'.
---@field customMaterialsArrayPtr any Tableau de chaînes imgui (ArrayCharPtrByTbl) construit à partir de customMaterialsArray.
---@field dbg boolean Drapeau de debug (copie de la valeur locale initiale, false).
---@field o table Pointeurs imgui des options de l'éditeur, notamment o.layer (IntPtr, couche courante) et o.reflectionMode.
---@field v table État de l'interface : materialNameList, currentMaterialIndex, dirtyMaterials, materialUsage, inputWidgetHeight, style…
editor_materialEditor = {}

--- Widget imgui : éditeur de couleur RGBA lié à une propriété du matériau courant ; applique la valeur en direct et crée une entrée d'undo en fin d'édition.
---Source : lua/ge/extensions/editor/materialEditor.lua:1749
---@param label string Libellé (affiché si non vide).
---@param property string Propriété couleur (chaîne « r g b a »).
---@param id string|nil Identifiant imgui ; property par défaut.
---@param layer integer|nil Couche ; o.layer[0] si nil.
---@param labelSameLine boolean|nil Si vrai, le widget est placé sur la même ligne que le libellé.
function editor_materialEditor.colorEdit4(label, property, id, layer, labelSameLine) end

--- Dessine un bouton d'icône qui vide la texture de la propriété (valeur "") avec undo.
---Source : lua/ge/extensions/editor/materialEditor.lua:1552
---@param label string Libellé utilisé dans l'infobulle « Remove … ».
---@param property string Propriété texture à vider.
---@param layer integer|nil Couche ; o.layer[0] si nil.
function editor_materialEditor.deleteMapButton(label, property, layer) end

--- Widget imgui : miniature de la texture d'une propriété, avec aperçu, glisser-déposer et sélection de fichier ; modifie la propriété avec undo.
---Source : lua/ge/extensions/editor/materialEditor.lua:1598
---@param label string Libellé du widget.
---@param property string Propriété texture.
---@param layer integer|nil Couche ; o.layer[0] si nil.
---@param additionalGuiFn function|nil Fonction de dessin additionnelle (déduit du code).
function editor_materialEditor.imageButton(label, property, layer, additionalGuiFn) end

--- Widget imgui : champ numérique lié à une propriété flottante du matériau courant ; applique en direct et ajoute une entrée d'undo en fin d'édition.
---Source : lua/ge/extensions/editor/materialEditor.lua:1869
---@param label string Libellé.
---@param property string Propriété flottante.
---@param float_step number|nil Pas (0.01 par défaut).
---@param float_step_fast number|nil Pas rapide (0.1 par défaut).
---@param string_format string|nil Format d'affichage ("%.2f" par défaut).
---@param layer integer|nil Couche ; o.layer[0] si nil.
---@param tooltip string|nil Texte d'aide affiché à côté du libellé.
function editor_materialEditor.inputFloat(label, property, float_step, float_step_fast, string_format, layer, tooltip) end

--- Hook appelé à l'activation de l'éditeur : charge matériaux, ground models et meshes d'aperçu, prépare les aperçus 3D (cube_1m.dae) et le chemin du niveau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/materialEditor.lua:3786
function editor_materialEditor.onEditorActivated() end

--- Hook appelé à la désactivation de l'éditeur : retire le focus de scène, libère listes de matériaux, caches de taille et meshes d'aperçu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/materialEditor.lua:3816
function editor_materialEditor.onEditorDeactivated() end

--- Hook de suppression de la sélection ; vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/materialEditor.lua:3846
function editor_materialEditor.onEditorDeleteSelection() end

--- Hook appelé à chaque image de l'éditeur : dessine la fenêtre principale et les fenêtres annexes (aperçu, usage du matériau, création, copie, matériaux par tag), gère le focus et les travaux d'arrière-plan.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/materialEditor.lua:3552
function editor_materialEditor.onEditorGui() end

--- Hook d'initialisation de l'éditeur : ajoute le menu « Material Editor », enregistre les six fenêtres (cinq annexes masquées) et lance le job de cartographie des tags.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/materialEditor.lua:3827
function editor_materialEditor.onEditorInitialized() end

--- Hook de changement de sélection d'objets ; vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/materialEditor.lua:3843
function editor_materialEditor.onEditorObjectSelectionChanged() end

--- Hook appelé quand une préférence change ; réagit à thumbnailSize, maxMaterialPreviewSize, textFilterResultsWithSameFirstCharAtTop (recharge la liste) et showEstimatedSizeInList.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/materialEditor.lua:3753
---@param path string Chemin de la préférence, ex. materialEditor.general.thumbnailSize.
---@param value any Nouvelle valeur.
function editor_materialEditor.onEditorPreferenceValueChanged(path, value) end

--- Hook d'enregistrement des préférences : crée la catégorie materialEditor et la sous-catégorie general.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/materialEditor.lua:3771
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_materialEditor.onEditorRegisterPreferences(prefsRegistry) end

--- Hook appelé quand des fichiers changent sur disque ; recharge les matériaux si un main.materials.json sous /levels/ ou /art/ est concerné.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/materialEditor.lua:3738
---@param files table[] Liste d'entrées avec un champ filename.
function editor_materialEditor.onFilesChanged(files) end

--- Hook appelé au changement de véhicule joué ; si la fenêtre est visible et l'éditeur actif, relance le job de tags et recharge les matériaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/materialEditor.lua:3729
---@param oid integer Id de l'ancien véhicule.
---@param nid integer Id du nouveau véhicule.
---@param player integer Indice du joueur (non utilisé).
function editor_materialEditor.onVehicleSwitched(oid, nid, player) end

--- Sélectionne dans la liste le matériau portant ce nom, met à jour ses propriétés affichées et mémorise le choix pour le niveau courant dans la préférence levelMaterialNames. Si le nom est introuvable, l'indice courant passe à 0. Ne fait rien tant que la liste n'est pas chargée (éditeur non activé).
---Source : lua/ge/extensions/editor/materialEditor.lua:948
---@param matName string Nom du matériau.
---@param clearFilter boolean|nil Si vrai, vide d'abord le filtre texte (sinon la sélection peut échouer).
function editor_materialEditor.selectMaterialByName(matName, clearFilter) end

--- Marque le matériau comme modifié (v.dirtyMaterials[nom] = true) pour qu'il soit sauvegardé.
---Source : lua/ge/extensions/editor/materialEditor.lua:1247
---@param materialObj userdata|nil Objet matériau ; matériau courant si nil.
function editor_materialEditor.setMaterialDirty(materialObj) end

--- Définit une propriété d'une couche du matériau via editor.setMaterialProperty ; en cas de succès, marque dirty, invalide l'estimation de taille et redessine l'aperçu. Mémorise la valeur précédente pour l'undo.
---Source : lua/ge/extensions/editor/materialEditor.lua:1254
---@param materialObj userdata|nil Matériau à modifier ; courant si nil.
---@param property string Nom du champ (ex. diffuseMap, diffuseColor).
---@param layer integer Indice de couche du matériau.
---@param value any Nouvelle valeur.
function editor_materialEditor.setProperty(materialObj, property, layer, value) end

--- Affiche la fenêtre de l'éditeur de matériaux, ou lui donne le focus si elle est déjà visible.
---Source : lua/ge/extensions/editor/materialEditor.lua:3005
function editor_materialEditor.showMaterialEditor() end

