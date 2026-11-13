---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/createObjectTool.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil « Create Object(s) » du World Editor : barre d'outils de création d'objets de niveau (SimObjects). Il définit les groupes de boutons (Environment, Level, BeamNG, Other Classes), le mode d'édition editor.editModes.createObject (placement au clic dans la vue 3D, prévisualisation par raycast, rotation autour de l'axe vertical avec Ctrl+molette, magnétisme à la grille), un sélecteur de toutes les classes SimObject avec filtre et fréquence d'usage, et l'historique d'annulation de chaque création. Un moddeur d'éditeur s'en sert pour ajouter ses propres groupes de création ou créer un objet par script via les fonctions injectées dans editor.
--- Accès : extension `editor_createObjectTool` : `extensions.load("editor_createObjectTool")`, puis la globale `editor_createObjectTool`
---@class editor_createObjectTool
editor_createObjectTool = {}

--- Recrée les quatre groupes standard (Environment, Level, BeamNG, Other Classes) avec leurs boutons et attache à editor les fonctions de création (addObjectCreateGroup, makeCreateObjectItem, createObjectInstance…). Peut être appelée même si l'éditeur n'est pas actif.
---Source : lua/ge/extensions/editor/createObjectTool.lua:1001
function editor_createObjectTool.initGroups() end

--- Déplace la sélection dans la liste de recherche de classes (vers le haut si up est vrai, sinon vers le bas), bornée à la liste.
---Source : lua/ge/extensions/editor/createObjectTool.lua:350
---@param up boolean true pour monter, false pour descendre
function editor_createObjectTool.navigateList(up) end

--- Hook appelé quand le World Editor se ferme ; retire l'action map « CreateObjectTool ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/createObjectTool.lua:1129
function editor_createObjectTool.onEditorDeactivated() end

--- Hook appelé à chaque frame de l'éditeur ; retire l'action map « CreateObjectTool » tant qu'aucun popup de sélection de classe n'est ouvert.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/createObjectTool.lua:1133
function editor_createObjectTool.onEditorGui() end

--- Hook appelé à l'initialisation de l'éditeur : déclare le mode d'édition « Create Object(s) », les raccourcis auxiliaires (Ctrl+molette pour tourner, Alt pour le magnétisme), editor.stopCreatingObjects, editor.togglePlaceNewObjectAtCamera, appelle initGroups() et charge la liste des classes SimObject (Sim.getSimObjectDerivedClassNames).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/createObjectTool.lua:1073
function editor_createObjectTool.onEditorInitialized() end

--- Hook appelé pour enregistrer les préférences de la catégorie createObjectTool.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/createObjectTool.lua:1118
---@param prefsRegistry table registre de préférences de l'éditeur
function editor_createObjectTool.onEditorRegisterPreferences(prefsRegistry) end

--- Valide la classe actuellement surlignée dans le sélecteur de classes (équivalent à Entrée, déclenché par l'action map).
---Source : lua/ge/extensions/editor/createObjectTool.lua:345
function editor_createObjectTool.selectClass() end

--- Fonctions ajoutées à la table globale editor par initGroups().
---@class editor_createObjectTool_editor
local editor_createObjectTool_editor = {}

--- Ajoute un bouton de groupe de création à la barre d'outils.
---Source : lua/ge/extensions/editor/createObjectTool.lua:979
---@param name string nom du groupe
---@param icon any icône (editor.icons.xxx)
---@param objectClasses table[] éléments créés avec editor.makeCreateObjectItem
function editor_createObjectTool_editor.addObjectCreateGroup(name, icon, objectClasses) end

--- Crée un objet de la classe donnée sous un nœud de l'arbre de scène. Émet le hook onEditorCustomClassBuildFunc(obj) avant l'enregistrement, donne un shapeName de substitution aux TSStatic sans forme, enregistre l'objet avec un nom numéroté et l'ajoute au parent.
---Source : lua/ge/extensions/editor/createObjectTool.lua:288
---@param clsName string nom de la classe C++
---@param parentNode userdata|nil parent (par défaut : sélection courante)
---@return userdata|nil  objet créé
function editor_createObjectTool_editor.createCustomClassObject(clsName, parentNode) end

--- Crée une instance via worldEditorCppApi.createObject, la nomme (<Classe>_<n>), exécute le buildFunc de l'item, puis l'enregistre (déclenche onAdd). Ne l'ajoute pas à un groupe.
---Source : lua/ge/extensions/editor/createObjectTool.lua:113
---@param classname string classe C++
---@param createObjectItem table|nil item de création (par défaut : recherché par classname)
---@return userdata|nil  instance
function editor_createObjectTool_editor.createObjectInstance(classname, createObjectItem) end

--- Renvoie la table complète des groupes de création.
---Source : lua/ge/extensions/editor/createObjectTool.lua:996
---@return table[]  groupes {name, icon, objectClasses}
function editor_createObjectTool_editor.getAllObjectCreateGroups() end

--- Renvoie le parent par défaut pour les nouveaux objets (groupe en focus, groupe de la sélection, ou MissionGroup).
---Source : lua/ge/extensions/editor/createObjectTool.lua:61
---@return userdata  SimSet/SimGroup
function editor_createObjectTool_editor.getCurrentSelectedParent() end

--- Renvoie un groupe de création par son nom.
---Source : lua/ge/extensions/editor/createObjectTool.lua:988
---@param name string nom du groupe
---@return table|nil  groupe
function editor_createObjectTool_editor.getObjectCreateGroup(name) end

--- Cherche dans tous les groupes l'item dont le classname correspond (le premier trouvé).
---Source : lua/ge/extensions/editor/createObjectTool.lua:103
---@param classname string classe C++
---@return table|nil  item de création
function editor_createObjectTool_editor.getObjectCreateItem(classname) end

--- Construit un item de création {icon, classname, title, buildFunc, singleInstance}. title vaut classname par défaut.
---Source : lua/ge/extensions/editor/createObjectTool.lua:965
---@param icon any icône du bouton
---@param classname string classe C++ à instancier
---@param title string|nil nom affiché
---@param buildFunc function|nil appelée avec l'instance juste avant son enregistrement
---@param singleInstance boolean|nil true : une seule instance créée au clic sur le bouton ; sinon création par clics dans la vue 3D jusqu'à Échap
---@return table  item
function editor_createObjectTool_editor.makeCreateObjectItem(icon, classname, title, buildFunc, singleInstance) end

