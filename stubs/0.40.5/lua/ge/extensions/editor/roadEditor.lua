---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Éditeur de routes en décalque (DecalRoad) du World Editor : mode d'édition « Edit Road » (icône create_road_decal) pour créer des routes (Alt + clic gauche), sélectionner routes et nœuds (Ctrl pour la multi-sélection, Ctrl+Maj+glisser pour une sélection rectangle), déplacer nœuds, régler la largeur, dupliquer, copier/coller les propriétés, supprimer, avec historique d'annulation. Il enregistre aussi les préférences « roadEditor.general.* » et un filtre de matériaux pour DecalRoad (tag « RoadAndPath »). Le fichier est très long (environ 2 400 lignes) : presque tout est local ; seuls quelques hooks et une fonction sont exportés.
--- Accès : extension `editor_roadEditor` : `extensions.load("editor_roadEditor")`, puis la globale `editor_roadEditor`
---@class editor_roadEditor
editor_roadEditor = {}

--- Appelée par l'action map « RoadEditor » : fait défiler le choix parmi les routes survolées superposées. 1 passe à la route suivante, 0 à la précédente (boucle). Sans effet s'il n'y a aucune route survolée.
---Source : lua/ge/extensions/editor/roadEditor.lua:2150
---@param value integer 1 = suivante, 0 = précédente.
function editor_roadEditor.cycleHoveredRoadsAM(value) end

--- Hook appelé à l'initialisation de l'éditeur : crée le mode d'édition « Edit Road » avec ses raccourcis (LMB+Alt créer/ajouter un nœud, Ctrl+LMB multi-sélection, Ctrl+Maj+glisser sélection rectangle, copie/colle/duplication), enregistre le filtre de matériaux DecalRoad, la fenêtre modale d'erreur, la fenêtre de modèles de routes, recharge les modèles (editor_roadUtils.reloadTemplates) et applique la préférence updateDecalRoadsOnStaticMeshTransform si l'API C++ existe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadEditor.lua:2315
function editor_roadEditor.onEditorInitialized() end

--- Hook appelé quand l'inspecteur dessine son en-tête. Si le mode « Edit Road » est actif, ajoute les champs de position et de largeur des nœuds sélectionnés (multi-édition quand toutes les valeurs sont égales) avec enregistrement dans l'historique.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadEditor.lua:1213
---@param inspectorInfo table Informations de l'inspecteur fournies par l'éditeur (déduit du code).
function editor_roadEditor.onEditorInspectorHeaderGui(inspectorInfo) end

--- Hook appelé quand la sélection d'objets de l'éditeur change. Si le mode « Edit Road » est actif, termine la route en cours de création (si aucune sélection), reconstruit la liste des DecalRoad sélectionnés et ne conserve que les nœuds sélectionnés des routes encore sélectionnées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadEditor.lua:2275
function editor_roadEditor.onEditorObjectSelectionChanged() end

--- Hook appelé quand une préférence change. Pour roadEditor.general.updateDecalRoadsOnStaticMeshTransform, transmet la valeur à worldEditorCppApi.setUpdateDecalRoadsOnStaticMeshTransform (si disponible).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadEditor.lua:2220
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_roadEditor.onEditorPreferenceValueChanged(path, value) end

--- Hook appelé pour enregistrer les préférences : crée la catégorie « roadEditor » et la sous-catégorie « general » avec ses réglages (voir notes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadEditor.lua:2226
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_roadEditor.onEditorRegisterPreferences(prefsRegistry) end

--- Hook appelé au chargement de l'extension ; écrit seulement un log « initialized » (niveau D).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadEditor.lua:2072
function editor_roadEditor.onExtensionLoaded() end

--- Hook appelé avant le rendu de chaque frame ; sort immédiatement si le mode « Edit Road » n'est pas actif et ne fait rien d'autre (corps vide).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadEditor.lua:2077
function editor_roadEditor.onPreRender() end

