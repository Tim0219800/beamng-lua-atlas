---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/preferencesRegistry.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet registre. Champs : categories, nonPersistentItemPaths, preferences (valeurs courantes par catégorie), changedItems, dirty.
---@class editor_api_preferencesRegistry
local editor_api_preferencesRegistry = {}

--- Marque un chemin comme non persistant : il n'est pas écrit dans les fichiers de préférences.
---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:128
---@param subCategoryPath string chemin complet de l'item (malgré le nom du paramètre)
function editor_api_preferencesRegistry:addNonPersistentItemPath(subCategoryPath) end

--- Émet onEditorPreferenceValueChanged pour chaque changement en file puis vide la file.
---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:288
---@return boolean  true s'il y avait des changements
function editor_api_preferencesRegistry:broadcastPreferenceValueChanged() end

--- Émet onEditorPreferenceValueChanged pour TOUS les items enregistrés avec leur valeur actuelle (utile après un chargement).
---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:412
function editor_api_preferencesRegistry:callHookForSetValue() end

--- Vide catégories, chemins non persistants, préférences, éléments modifiés et remet dirty à false.
---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:69
function editor_api_preferencesRegistry:clear() end

--- Cherche une catégorie par nom.
---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:189
---@param name string nom
---@return table|nil  catégorie
function editor_api_preferencesRegistry:findCategory(name) end

--- Cherche un item par chemin "cat.souscat.item" ; nil si moins de 3 segments ou introuvable.
---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:201
---@param itemPath string chemin
---@return table|nil  item du registre
function editor_api_preferencesRegistry:findItem(itemPath) end

--- Cherche un item par nom dans une sous-catégorie.
---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:217
---@param subCateg table|nil sous-catégorie
---@param itemName string nom
---@return table|nil  item
function editor_api_preferencesRegistry:findItemInSubCategory(subCateg, itemName) end

--- Cherche une sous-catégorie par nom dans une catégorie.
---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:195
---@param category table catégorie
---@param name string nom
---@return table|nil  sous-catégorie
function editor_api_preferencesRegistry:findSubCategory(category, name) end

--- Renvoie la valeur d'une préférence par chemin (équivalent de editor.getPreference).
---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:301
---@param itemPath string "cat.souscat.item"
---@return any  valeur, ou nil si inconnue
function editor_api_preferencesRegistry:get(itemPath) end

--- Renvoie la valeur d'une préférence sérialisée en texte selon son type.
---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:314
---@param itemPath string chemin
---@return any  valeur sérialisée
function editor_api_preferencesRegistry:getAsString(itemPath) end

--- Appelle clear(). Appelé par le constructeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:77
function editor_api_preferencesRegistry:init() end

--- Convertit une valeur texte (lue du fichier) en valeur Lua selon item.type (nombre, bool, table JSON, vec3, Point2F, ColorF…).
---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:11
---@param item table item du registre (champ type)
---@param itemVal string valeur texte
---@return any  valeur convertie (inchangée pour les types non listés)
function editor_api_preferencesRegistry:itemValueFromString(item, itemVal) end

--- Convertit une valeur en texte pour le fichier : tostring pour les nombres/bool, JSON pour table (inchangé si déjà une string), tostring sans virgules pour les vecteurs/couleurs.
---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:41
---@param item table item du registre
---@param itemVal any valeur
---@return any  valeur sérialisée
function editor_api_preferencesRegistry:itemValueToString(item, itemVal) end

--- Charge une seule catégorie depuis un fichier au format de saveCategory et applique ses valeurs ; marque dirty.
---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:424
---@param categoryName string catégorie
---@param filename string fichier json
function editor_api_preferencesRegistry:loadCategory(categoryName, filename) end

--- Lit le fichier de préférences (défaut settings/editor/preferences.json), rejette un format de version différente, puis remplit chaque item enregistré avec la valeur du fichier ou la valeur par défaut. Gère les anciennes valeurs (non-table) et appelle onEditorPreferenceVersionChanged si la version d'un item a changé. Pas de hook de changement pendant le chargement.
---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:319
---@param filename string|nil fichier json
function editor_api_preferencesRegistry:loadPreferences(filename) end

--- Parcourt les préférences chargées et, pour chaque item absent du registre, émet onEditorDeprecatedPreferencesItem ; supprime l'item si deleteDeprecatedItems est vrai ou si le hook renvoie true. Corrige aussi les catégories/sous-catégories qui ne sont pas des tables.
---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:224
---@param deleteDeprecatedItems boolean|nil true = supprimer tous les items obsolètes
function editor_api_preferencesRegistry:migratePreferences(deleteDeprecatedItems) end

--- Crée (ou retrouve) une catégorie de premier niveau. Si elle existe avec un autre libellé, avertit et remplace le libellé.
---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:81
---@param categName string nom interne
---@param categLabel string|nil libellé affiché (défaut sentenceCase du nom)
---@return table  la catégorie {name, label, subcategories}
function editor_api_preferencesRegistry:registerCategory(categName, categLabel) end

--- Ajoute des items à une sous-catégorie existante. Un nom déjà présent est refusé avec une erreur loguée.
---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:136
---@param categName string catégorie
---@param subCategName string sous-catégorie
---@param prefs table liste de tables à une paire {nom = {type, défaut, description, label, min, max, hidden, advanced, customUiFunc, enumLabels, version}}
function editor_api_preferencesRegistry:registerPreferences(categName, subCategName, prefs) end

--- Crée (ou retrouve) une sous-catégorie dans une catégorie déjà enregistrée et y enregistre éventuellement des préférences. Logue une erreur et renvoie nil si la catégorie n'existe pas.
---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:99
---@param categName string catégorie parente
---@param subCategName string nom interne
---@param subCategLabel string|nil libellé affiché
---@param prefs table|nil liste de {nom = {type, défaut, …}} (voir notes)
---@return table|nil  la sous-catégorie {name, label, items}
function editor_api_preferencesRegistry:registerSubCategory(categName, subCategName, subCategLabel, prefs) end

--- Retire un chemin de la liste des non persistants.
---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:132
---@param subCategoryPath string chemin de l'item
function editor_api_preferencesRegistry:removeNonPersistentItemPath(subCategoryPath) end

--- Remet un item à sa valeur par défaut.
---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:542
---@param itemPath string chemin de l'item
---@return boolean  true
function editor_api_preferencesRegistry:resetItemToDefault(itemPath) end

--- Remet à leur valeur par défaut tous les items d'une catégorie, ou de toutes les catégories si categoryName est nil.
---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:523
---@param categoryName string|nil catégorie ou nil pour tout
---@return boolean  false si la catégorie n'existe pas
function editor_api_preferencesRegistry:resetToDefaults(categoryName) end

--- Sauvegarde toutes les préférences d'une catégorie (même celles à la valeur par défaut, hors chemins non persistants) dans un fichier json.
---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:452
---@param categoryName string catégorie et ses sous-catégories
---@param filename string fichier json cible
function editor_api_preferencesRegistry:saveCategory(categoryName, filename) end

--- Écrit les préférences dans le fichier (défaut settings/editor/preferences.json) en omettant les valeurs égales au défaut et les chemins non persistants ; remet dirty à false. Conserve les valeurs d'extensions non chargées.
---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:475
---@param filename string|nil fichier json
---@return boolean|nil  false si aucune préférence chargée
function editor_api_preferencesRegistry:savePreferences(filename) end

--- Fixe la valeur d'une préférence par chemin (bornée pour un nombre), marque dirty et met le changement en file pour le hook.
---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:255
---@param itemPath string "cat.souscat.item"
---@param value any nouvelle valeur
function editor_api_preferencesRegistry:set(itemPath, value) end

