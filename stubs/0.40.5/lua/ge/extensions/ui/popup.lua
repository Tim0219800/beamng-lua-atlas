---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/popup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE qui ouvre les popups de tutoriel de l'interface (hook UI OpenTutorialPopup). Un popup est décrit par un dossier de contenu (par défaut /gameplay/tutorials/pages/<id>/) contenant content.json (titre, texte, image, lignes, composant Vue) ou content.html. Le module lit ces fichiers, traduit les textes et envoie la liste d'entrées à l'UI. Il propose aussi des popups prédéfinis (aides à la conduite, choix de défi, contrat, drag).
--- Accès : extension `ui_popup` : `extensions.load("ui_popup")`, puis la globale `ui_popup`
---@class ui_popup
ui_popup = {}

--- Ferme le popup de tutoriel affiché (hook UI CloseTutorialPopup).
---Source : lua/ge/extensions/ui/popup.lua:104
---@return boolean  Toujours true.
function ui_popup.closeTutorialPopup() end

--- Parcourt récursivement une racine et renvoie les noms de sous-dossiers contenant content.json ou content.html, triés alphabétiquement.
---Source : lua/ge/extensions/ui/popup.lua:109
---@param root string|nil Dossier racine (défaut '/gameplay/tutorials/pages/v2/') ; un '/' final est ajouté si absent.
---@return string[]  Liste d'identifiants triée.
---@return string  La racine normalisée.
function ui_popup.collectPopupIdsFromRoot(root) end

--- Ouvre tous les popups trouvés sous une racine (utile pour tout prévisualiser).
---Source : lua/ge/extensions/ui/popup.lua:138
---@param options table|nil options.root pour la racine ; les autres options sont transmises à openPopupsByIds.
---@return boolean  false si aucun popup trouvé.
function ui_popup.openAllPopupsFromRoot(options) end

--- Ouvre le popup de signature de contrat (composant Vue ContractSign), avec titre, texte, nom du joueur, somme et image configurables, puis d'éventuels popups supplémentaires.
---Source : lua/ge/extensions/ui/popup.lua:193
---@param options table|nil id, title, text, contractTitle, contractText, userName, money (défaut 10000), image, root ; textes par défaut issus des clés ui.career.tutorial.popup.contractSign.*.
---@param additionalIds string[]|nil Popups à ajouter à la suite.
---@return boolean  Résultat de openPopupEntries.
function ui_popup.openContractSignPopup(options, additionalIds) end

--- Ouvre l'intro du ticket de chronométrage drag ('v2/dragStripTimeslipIntro') suivie éventuellement d'autres popups. Voir la note sur le bug de la variable slip.
---Source : lua/ge/extensions/ui/popup.lua:171
---@param options table|nil Passé à openPopupEntries.
---@param additionalIds string[]|nil Identifiants de popups à ajouter à la suite.
---@return boolean  Résultat de openPopupEntries.
function ui_popup.openDragTimeslipTutorialPopup(options, additionalIds) end

--- Ouvre le popup « aides à la conduite » (composant Vue GearboxSelect, id 'drivingAssists').
---Source : lua/ge/extensions/ui/popup.lua:152
---@param options table|nil Non utilisé.
---@return boolean  true.
function ui_popup.openDrivingAssistsPopup(options) end

--- Ouvre le popup de sélection de défi facultatif (composant Vue OptionalChallengeSelect).
---Source : lua/ge/extensions/ui/popup.lua:162
---@param options table|nil Non utilisé.
---@return boolean  true.
function ui_popup.openOptionalChallengeSelectionPopup(options) end

--- Lit puis ouvre un seul popup.
---Source : lua/ge/extensions/ui/popup.lua:85
---@param id string Identifiant du popup.
---@param options table|nil Voir readPopupEntryById.
---@return boolean  false si le contenu est introuvable.
function ui_popup.openPopupById(id, options) end

--- Envoie des entrées déjà construites à l'UI via guihooks.trigger('OpenTutorialPopup', {popups = entries}).
---Source : lua/ge/extensions/ui/popup.lua:77
---@param entries table[]|nil Liste d'entrées de popup.
---@param options table|nil Non utilisé.
---@return boolean  false si la liste est vide ou nil, sinon true.
function ui_popup.openPopupEntries(entries, options) end

--- Lit plusieurs popups (en ignorant ceux introuvables) et les ouvre ensemble, dans l'ordre donné.
---Source : lua/ge/extensions/ui/popup.lua:91
---@param ids string[] Identifiants des popups.
---@param options table|nil Voir readPopupEntryById.
---@return boolean  false si ids est vide/invalide ou si aucun contenu n'a été trouvé.
function ui_popup.openPopupsByIds(ids, options) end

--- Lit le contenu d'un popup : content.json (prioritaire) ou content.html, et renvoie une entrée {id, type='info', isPopup=true, title, text, image, aspectRatio, vueComponent, topics, rows…} ou {id, content, …} pour le HTML.
---Source : lua/ge/extensions/ui/popup.lua:15
---@param id string Identifiant du popup (sous-dossier de la racine).
---@param options table|nil root (défaut '/gameplay/tutorials/pages/'), context (contexte de traduction), slip, startingMoney/startMoney, endMoney/money.
---@return table|nil  L'entrée, ou nil si aucun des deux fichiers n'existe.
function ui_popup.readPopupEntryById(id, options) end

--- Construit le chemin d'une ressource : renvoie assetPath tel quel s'il commence par '/', sinon basePath concaténé avec assetPath.
---Source : lua/ge/extensions/ui/popup.lua:7
---@param basePath string Dossier de base (avec '/' final).
---@param assetPath string|nil Chemin relatif ou absolu.
---@return string|nil  nil si assetPath est nil ou vide.
function ui_popup.resolveAssetPath(basePath, assetPath) end

--- Ouvre en série les popups dragStripStageCar, dragTreeStages, dragTreeCountdown et dragStripTimeslipIntro.
---Source : lua/ge/extensions/ui/popup.lua:218
---@param options table|nil options.root (défaut '/gameplay/tutorials/pages/v2/').
---@return boolean  Résultat de openPopupsByIds.
function ui_popup.showDragTreeStagesPopup(options) end

