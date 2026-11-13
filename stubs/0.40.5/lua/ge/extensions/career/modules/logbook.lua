---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/logbook.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Journal de bord de la carrière (logbook.json dans le dossier career de la sauvegarde). Stocke les entrées affichées dans l'UI : déblocage de missions, d'installations de livraison, de points d'apparition, et pages d'aide/tutoriel. Au premier lancement (logbook vide), il crée les entrées d'introduction (welcome, logbook, driving, delivery…) à partir de ui/modules/careerLogbook/pages/<id>/.
--- Accès : extension `career_modules_logbook` : `extensions.load("career_modules_logbook")`, puis la globale `career_modules_logbook`
---@class career_modules_logbook
---@field dependencies table<integer, string> Extensions chargées avant : career_career.
career_modules_logbook = {}

--- Crée l'entrée réelle : fixe time, entryId, isNew, l'insère en tête de liste (sauf skipSave) et, si entry.showMessage et hors tutoriel, affiche un message UI (guihooks Message, 15 s).
---Source : lua/ge/extensions/career/modules/logbook.lua:84
---@param entry table|nil Données de l'entrée (type, title, text, cover…).
---@param skipSave boolean|nil Si vrai, l'entrée est renvoyée mais pas stockée.
---@return table  L'entrée complétée.
function career_modules_logbook.addNewLogbookEntry(entry, skipSave) end

--- Appelé quand une installation de livraison est débloquée : crée une entrée progress (nom et aperçu de l'installation). Ne fait rien si l'installation est introuvable.
---Source : lua/ge/extensions/career/modules/logbook.lua:120
---@param id string Identifiant de l'installation.
function career_modules_logbook.deliveryFacilityUnlocked(id) end

--- Entrée « normale » d'information/tutoriel ; joue le son UI_Checkpoint (une seule fois par frame, jamais pendant le tutoriel).
---Source : lua/ge/extensions/career/modules/logbook.lua:148
---@param title string|table Titre ou clé de traduction.
---@param text string|table Contenu.
---@param cover string|nil Image de couverture.
---@param ratio string|nil Ratio d'image, "16x9" par défaut.
---@param flavour any Non utilisé dans le code.
---@param type string|nil Type d'entrée, "info" par défaut.
---@return table  L'entrée créée.
function career_modules_logbook.genericInfoUnlocked(title, text, cover, ratio, flavour, type) end

--- Entrée générique de type info, sans son ni particularité.
---Source : lua/ge/extensions/career/modules/logbook.lua:170
---@param title string|table Titre.
---@param text string|table Contenu.
---@param cover string|nil Image de couverture.
---@param coverText string|nil Texte sur la couverture.
---@return table  L'entrée créée.
function career_modules_logbook.genericLogbookEntry(title, text, cover, coverText) end

--- Renvoie une copie de la liste des entrées, enrichie par le hook onLogbookGetEntries et triée de la plus récente à la plus ancienne.
---Source : lua/ge/extensions/career/modules/logbook.lua:23
---@return table[]  Entrées du journal.
function career_modules_logbook.getLogbook() end

--- Renvoie jusqu'à `limit` entrées récentes (hideInRecent exclu) en plaçant d'abord les non lues, puis les lues.
---Source : lua/ge/extensions/career/modules/logbook.lua:46
---@param limit integer|nil Nombre maximal d'entrées, 3 par défaut.
---@return table[]  Entrées sélectionnées.
function career_modules_logbook.getLogbookMostRecentUnread(limit) end

--- Renvoie les entrées non lues (read faux) marquées isPopup.
---Source : lua/ge/extensions/career/modules/logbook.lua:35
---@return table[]  Entrées à afficher en popup.
function career_modules_logbook.getPopups() end

--- Crée une entrée d'aide depuis l'id d'une page : titre ui.introPopup.<id>.title, contenu de ui/modules/careerLogbook/pages/<id>/content.html (sauts de ligne retirés) et image header.jpg.
---Source : lua/ge/extensions/career/modules/logbook.lua:203
---@param id string Nom de la page (ex. welcome, driving).
function career_modules_logbook.logbookEntry(id) end

--- Appelé quand une mission est débloquée : crée une entrée de type progress avec nom et image de la mission.
---Source : lua/ge/extensions/career/modules/logbook.lua:106
---@param id string Identifiant de la mission.
function career_modules_logbook.missionUnlocked(id) end

--- Hook : charge logbook.json ; si vide, crée les entrées d'introduction dans l'ordre inverse de la liste interne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/logbook.lua:221
---@param active boolean Rien si false.
function career_modules_logbook.onCareerActive(active) end

--- Hook de sauvegarde : écrit {logbook = ...} dans <save>/career/logbook.json.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/logbook.lua:232
---@param currentSavePath string Dossier de sauvegarde.
function career_modules_logbook.onSaveCurrentProfile(currentSavePath) end

--- Hook appelé chaque frame : réinitialise le garde-fou du son (un son max par frame).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/logbook.lua:239
function career_modules_logbook.onUpdate() end

--- Met isNew = not read sur l'entrée d'identifiant entryId. Ignore entryId == -1.
---Source : lua/ge/extensions/career/modules/logbook.lua:72
---@param entryId integer Identifiant de l'entrée.
---@param read boolean true pour la marquer lue.
function career_modules_logbook.setLogbookEntryRead(entryId, read) end

--- Appelé quand un point d'apparition est découvert : crée une entrée progress avec showMessage = true.
---Source : lua/ge/extensions/career/modules/logbook.lua:134
---@param spawnPoint table Point d'apparition (translationId, previews, logbookEntry).
function career_modules_logbook.spawnPointUnlocked(spawnPoint) end

