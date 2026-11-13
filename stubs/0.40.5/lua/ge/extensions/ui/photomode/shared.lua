---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/shared.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bibliothèque d'outils et état partagé de tous les modules du mode photo (ui_photomode_*). Elle contient la table d'état de session S, le journal de debug, des fonctions de normalisation (nombres, booléens, chemins), des accès protégés (pcall) à VariableRegistry, aux réglages (settings) et à l'API de capture « screenshot », ainsi que le calcul de la disponibilité des actions média (téléversement, Steam, ouverture d'URL de partage).
--- Accès : extension `ui_photomode_shared` : `extensions.load("ui_photomode_shared")`, puis la globale `ui_photomode_shared`
---@class ui_photomode_shared
---@field S table Table d'état mutable partagée par tous les modules du mode photo (session active, états de restauration, lecture d'aperçu en attente, etc.). Les autres modules la lisent et l'écrivent directement via ui_photomode_shared.S.
ui_photomode_shared = {}

--- Construit une table de sortie à partir de source en ne copiant que les champs décrits et non nil, en appliquant field.normalize si présent et en renommant la clé en field.outputKey si défini.
---Source : lua/ge/extensions/ui/photomode/shared.lua:143
---@param source table Table source ; un non-table donne {}.
---@param fieldDescriptors table[] Liste de descripteurs {key, outputKey?, normalize?}.
---@return table  État construit.
function ui_photomode_shared.buildDescribedState(source, fieldDescriptors) end

--- Calcule la disponibilité des actions média du mode photo à partir du contexte d'exécution (build shipping, fonctionnalités en ligne, service en ligne, compte connecté, backends screenshot, navigateur).
---Source : lua/ge/extensions/ui/photomode/shared.lua:313
---@return table  {runtime={shippingBuild, uiDevMode, onlineFeaturesEnabled, onlineServiceWorking, onlineAccountLoggedIn}, capture={upload, steam}, preview={openShareUrl}} ; chaque action vaut {visible, enabled, reason, reasonLabel}.
function ui_photomode_shared.buildMediaActions() end

--- Convertit en nombre et borne entre minValue et maxValue ; renvoie fallback si la valeur n'est pas numérique.
---Source : lua/ge/extensions/ui/photomode/shared.lua:95
---@param value any Valeur à convertir avec tonumber.
---@param minValue number Borne basse.
---@param maxValue number Borne haute.
---@param fallback any Valeur renvoyée si la conversion échoue (non bornée).
---@return number|any  Nombre borné ou fallback.
function ui_photomode_shared.clampNumber(value, minValue, maxValue, fallback) end

--- Renvoie la fonction core_camera[name] si elle existe, sinon nil.
---Source : lua/ge/extensions/ui/photomode/shared.lua:160
---@param name string Nom de la fonction de core_camera (par exemple setPosRot, setFOV).
---@return function|nil  La fonction, ou nil.
function ui_photomode_shared.getCoreCameraFunction(name) end

--- Charge le module « screenshot » avec pcall(require) et le renvoie, ou nil s'il est indisponible.
---Source : lua/ge/extensions/ui/photomode/shared.lua:263
---@return table|nil  Module screenshot.
function ui_photomode_shared.getScreenshotApi() end

--- Indique si la table state contient au moins un des champs décrits par fieldDescriptors (clé field.key non nil).
---Source : lua/ge/extensions/ui/photomode/shared.lua:131
---@param state table Table à tester ; un non-table donne false.
---@param fieldDescriptors table[] Liste de descripteurs {key, outputKey?, normalize?}.
---@return boolean  true si un champ est présent.
function ui_photomode_shared.hasAnyDescribedField(state, fieldDescriptors) end

--- Indique si le journal de debug du mode photo est activé.
---Source : lua/ge/extensions/ui/photomode/shared.lua:55
---@return boolean  true si le debug est activé.
function ui_photomode_shared.isDebugEnabled() end

--- Écrit un message de niveau Info préfixé par « [Photomode] » si le debug est activé.
---Source : lua/ge/extensions/ui/photomode/shared.lua:68
---@param message any Message (converti avec tostring).
function ui_photomode_shared.logDebug(message) end

--- Convertit une valeur en booléen : booléen inchangé, nombre (~= 0), chaînes "true"/"1" et "false"/"0" (insensible à la casse) ; sinon fallback == true. nil donne fallback == true.
---Source : lua/ge/extensions/ui/photomode/shared.lua:109
---@param value any Valeur à normaliser.
---@param fallback any Valeur par défaut (seul fallback == true compte).
---@return boolean  Booléen normalisé.
function ui_photomode_shared.normalizeBoolean(value, fallback) end

--- Normalise un chemin pour comparaison : antislashs convertis en /, slashs initiaux et espaces finaux retirés, passage en minuscules.
---Source : lua/ge/extensions/ui/photomode/shared.lua:171
---@param value any Chemin (nil donne chaîne vide).
---@return string  Chemin normalisé.
function ui_photomode_shared.normalizePathForCompare(value) end

--- Vérifie qu'une table contient au moins expectedLength nombres convertibles et renvoie une copie des expectedLength premiers ; nil si l'un manque.
---Source : lua/ge/extensions/ui/photomode/shared.lua:179
---@param values table Tableau d'entrée.
---@param expectedLength integer Nombre d'éléments attendus (3 pour une position, 4 pour un quaternion).
---@return number[]|nil  Tableau normalisé ou nil.
function ui_photomode_shared.normalizePreviewNumberArray(values, expectedLength) end

--- Demande à l'interface de se rafraîchir en appelant settings.notifyUI (protégé par pcall).
---Source : lua/ge/extensions/ui/photomode/shared.lua:254
function ui_photomode_shared.notifySettingsUi() end

--- Joue le son de capture photo (événement FMOD "event:>UI>Main>Photo" sur AudioGui).
---Source : lua/ge/extensions/ui/photomode/shared.lua:89
function ui_photomode_shared.playPhotoCaptureSound() end

--- Lit un réglage via settings.getValue (protégé par pcall) ; nil en cas d'indisponibilité ou d'erreur.
---Source : lua/ge/extensions/ui/photomode/shared.lua:218
---@param settingName string Nom du réglage.
---@return any  Valeur du réglage ou nil.
function ui_photomode_shared.readSettingValue(settingName) end

--- Lit une variable de VariableRegistry (protégé par pcall). Renvoie nil si le registre est indisponible ou en cas d'erreur.
---Source : lua/ge/extensions/ui/photomode/shared.lua:194
---@param variableName string Nom de la variable.
---@return any  Valeur ou nil.
function ui_photomode_shared.readVariableRegistryValue(variableName) end

--- Active ou désactive le debug du mode photo et propage le réglage à l'API screenshot (setDebugTracingEnabled) si elle est disponible.
---Source : lua/ge/extensions/ui/photomode/shared.lua:59
---@param value any Activé uniquement si value == true.
function ui_photomode_shared.setDebugEnabled(value) end

--- Convertit une charge utile en texte pour le journal : chaîne vide pour nil, chaîne inchangée, sinon JSON (jsonEncode) ou tostring en cas d'échec.
---Source : lua/ge/extensions/ui/photomode/shared.lua:75
---@param payload any Valeur à convertir.
---@return string  Texte à journaliser.
function ui_photomode_shared.stringifyDebugPayload(payload) end

--- Écrit un réglage via settings.setValue (protégé par pcall, erreur journalisée).
---Source : lua/ge/extensions/ui/photomode/shared.lua:230
---@param settingName string Nom du réglage.
---@param value any Nouvelle valeur.
---@return boolean  true si l'écriture a réussi.
function ui_photomode_shared.writeSettingValue(settingName, value) end

--- Applique plusieurs réglages d'un coup via settings.setState (protégé par pcall).
---Source : lua/ge/extensions/ui/photomode/shared.lua:242
---@param partialState table<string, any> Réglages à modifier.
---@return boolean  true si l'appel a réussi.
function ui_photomode_shared.writeSettingsState(partialState) end

--- Écrit une variable de VariableRegistry (protégé par pcall, erreur journalisée).
---Source : lua/ge/extensions/ui/photomode/shared.lua:206
---@param variableName string Nom de la variable.
---@param value any Valeur à écrire.
---@return boolean  true si l'écriture a réussi.
function ui_photomode_shared.writeVariableRegistryValue(variableName, value) end

