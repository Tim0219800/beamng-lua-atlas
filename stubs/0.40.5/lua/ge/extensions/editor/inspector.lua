---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/inspector.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre Inspector du World Editor : affiche et modifie les champs (statiques, dynamiques, tableaux) de l'objet ou des objets sélectionnés, avec éditeurs spécialisés (peinture métallique de véhicule, UV de billboards GroundCover, couleur/intensité/cookie des lumières, labels de DecalData) et undo/redo via editor.history. Plusieurs instances peuvent coexister, dont des instances verrouillées sur une sélection. Un moddeur s'en sert pour enregistrer des gestionnaires par type de sélection ou des modificateurs de champs.
--- Accès : extension `editor_inspector` : `extensions.load("editor_inspector")`, puis la globale `editor_inspector`
---@class editor_inspector
editor_inspector = {}

--- Appelé à l'activation de l'éditeur : réinitialise les tables du valueInspector et le contexte partagé, puis rafraîchit la sélection.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/inspector.lua:1590
function editor_inspector.onEditorActivated() end

--- Appelé après l'ouverture d'un niveau : recharge les listes de datablocks des menus déroulants.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/inspector.lua:2292
function editor_inspector.onEditorAfterOpenLevel() end

--- Appelé à la désactivation de l'éditeur. Corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/inspector.lua:1596
function editor_inspector.onEditorDeactivated() end

--- Dessine chaque fenêtre d'inspecteur à chaque frame (ferme les instances dont la fenêtre n'est plus visible) et traite le rafraîchissement d'éclairage nocturne en attente.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/inspector.lua:1484
function editor_inspector.onEditorGui() end

--- Initialise le valueInspector, enregistre le gestionnaire « object », l'entrée de menu Window > Inspector et les éditeurs/labels de champs personnalisés (BeamNGVehicle.metallicPaintData, GroundCover.billboardUVs, DecalData.texRows/texCols, PointLight/SpotLight color, intensity, cookie).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/inspector.lua:2234
function editor_inspector.onEditorInitialized() end

--- Restaure les instances d'inspecteur depuis l'état sauvegardé de l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/inspector.lua:1599
---@param state table État de l'éditeur.
function editor_inspector.onEditorLoadGuiInstancerState(state) end

--- Appelé quand la sélection change : termine un éventuel « pickingLinkTo » ou reconstruit la liste des champs communs aux objets sélectionnés (avec compteur d'usage).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/inspector.lua:2262
function editor_inspector.onEditorObjectSelectionChanged() end

--- Définit editor.checkEditorDirtyFlag et editor.requestInspectorScrollToTopOnceForSelection(selectionId).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/inspector.lua:2227
function editor_inspector.onEditorRegisterApi() end

--- Écrit les instances d'inspecteur dans l'état de l'éditeur (clé « inspectorInstances »).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/inspector.lua:1607
---@param state table État à compléter.
function editor_inspector.onEditorSaveGuiInstancerState(state) end

--- Appelé au chargement : initialise les groupes repliables et installe l'API editor.* (addInspectorInstance, registerInspectorTypeHandler…).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/inspector.lua:1007
function editor_inspector.onExtensionLoaded() end

--- Méthodes ajoutées à la table globale `editor` par ce module.
---@class editor_inspector_editor
local editor_inspector_editor = {}

--- Crée une nouvelle fenêtre d'inspecteur. Avec une sélection, l'instance est verrouillée dessus (contexte propre) ; sans, elle suit la sélection courante.
---Source : lua/ge/extensions/editor/inspector.lua:132
---@param selection table|nil Sélection à verrouiller (copiée en profondeur).
---@return string  Index (clé chaîne) de l'instance.
function editor_inspector_editor.addInspectorInstance(selection) end

--- Pour chaque objet sélectionné, appelle inspectUpdate() ; si l'objet est modifié (ou isEditorDirty), marque l'éditeur comme modifié (editor.setDirty). Ne fait rien si déjà dirty.
---Source : lua/ge/extensions/editor/inspector.lua:100
function editor_inspector_editor.checkEditorDirtyFlag() end

--- Ferme une instance d'inspecteur et désenregistre sa fenêtre.
---Source : lua/ge/extensions/editor/inspector.lua:157
---@param idx string Index renvoyé par addInspectorInstance.
function editor_inspector_editor.closeInspectorInstance(idx) end

--- Renvoie les instances d'inspecteur ouvertes.
---Source : lua/ge/extensions/editor/inspector.lua:163
---@return table  Table index -> infos d'instance.
function editor_inspector_editor.getInspectorInstances() end

--- Renvoie les gestionnaires enregistrés par type de sélection.
---Source : lua/ge/extensions/editor/inspector.lua:167
---@return table<string, table>  typeName -> {typeName, guiCallback}.
function editor_inspector_editor.getInspectorTypeHandlers() end

--- Indique si l'inspecteur partagé affiche actuellement un champ de ce nom.
---Source : lua/ge/extensions/editor/inspector.lua:986
---@param fieldName string Nom du champ.
---@return boolean  true si le champ est présent.
function editor_inspector_editor.inspectorHasField(fieldName) end

--- Enregistre un callback de modification de champs, identifié par un nom unique.
---Source : lua/ge/extensions/editor/inspector.lua:182
---@param uniqueName string Identifiant unique.
---@param callback function Fonction de modification (signature non détaillée ici).
function editor_inspector_editor.registerInspectorFieldModifier(uniqueName, callback) end

--- Enregistre le rendu d'inspecteur d'un type de sélection (clé de editor.selection).
---Source : lua/ge/extensions/editor/inspector.lua:171
---@param typeName string Nom du type, par ex. « object ».
---@param guiCallback function Fonction de dessin ImGui appelée avec l'instance d'inspecteur (déduit du code d'appel de levelSettings).
function editor_inspector_editor.registerInspectorTypeHandler(typeName, guiCallback) end

--- Retire un modificateur de champs.
---Source : lua/ge/extensions/editor/inspector.lua:188
---@param uniqueName string Identifiant utilisé à l'enregistrement.
function editor_inspector_editor.unregisterInspectorFieldModifier(uniqueName) end

--- Retire un gestionnaire de type.
---Source : lua/ge/extensions/editor/inspector.lua:178
---@param typeName string Nom du type.
function editor_inspector_editor.unregisterInspectorTypeHandler(typeName) end

