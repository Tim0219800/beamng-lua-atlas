---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/session.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Aide partagée de sauvegarde et chargement de session pour les outils personnalisés de splines et de zones de l'éditeur. Elle gère ce qui est identique pour tous les outils : l'enveloppe JSON portable (version, tool, mapName, items ou state, globals, records), la lecture/écriture de fichier, la boucle de chargement en remplacement ou en fusion, les boutons Save / Save As / Load en haut de fenêtre et la fenêtre modale Replace/Merge. Tout le spécifique à l'outil passe par une table spec. Référence de câblage : heroRoadEditor et roadSpline.
--- Accès : extension `editor_toolUtilities_session` : `extensions.load("editor_toolUtilities_session")`, puis la globale `editor_toolUtilities_session`
---@class editor_toolUtilities_session
editor_toolUtilities_session = {}

--- Renvoie le fichier auquel le document est attaché et s'il a des modifications non enregistrées.
---Source : lua/ge/extensions/editor/toolUtilities/session.lua:109
---@param toolId string Identifiant de l'outil.
---@return table  { path = string|nil, dirty = true|nil }
function editor_toolUtilities_session.attachment(toolId) end

--- Renvoie seulement le chemin lié, pour les appels par frame qui ne doivent pas allouer de table.
---Source : lua/ge/extensions/editor/toolUtilities/session.lua:114
---@param toolId string Identifiant de l'outil.
---@return string|nil  Chemin du fichier lié.
function editor_toolUtilities_session.boundPath(toolId) end

--- Copie profonde d'un élément via le codec string.buffer (encode puis decode), avec en option des clés remplacées par {} ou supprimées. Sert à écrire serializeItem sans muter l'élément vivant.
---Source : lua/ge/extensions/editor/toolUtilities/session.lua:138
---@param item table Élément à copier.
---@param emptyKeys string[]|nil Clés à remplacer par une table vide.
---@param nilKeys string[]|nil Clés à supprimer.
---@return table  Copie propre.
function editor_toolUtilities_session.itemToTable(item, emptyKeys, nilKeys) end

--- Lit le fichier JSON puis applique spec.loadJson s'il existe, sinon loadJson du module.
---Source : lua/ge/extensions/editor/toolUtilities/session.lua:209
---@param path string Chemin du fichier.
---@param spec table Spécification de l'outil.
---@param replace boolean true pour remplacer, false pour fusionner.
---@return boolean  ok.
---@return integer|string  Nombre d'éléments ou erreur.
---@return boolean|nil  keepUnbound (fichier partiel) quand spec.loadJson le renvoie.
function editor_toolUtilities_session.loadFromFile(path, spec, replace) end

--- Applique un JSON de session déjà décodé. replace vide d'abord les éléments courants (et applique globals/records) ; sinon les éléments chargés sont fusionnés, un id déjà utilisé recevant un nouvel UUID. Pour un outil à état global, passe state à spec.loadWhole.
---Source : lua/ge/extensions/editor/toolUtilities/session.lua:183
---@param j table JSON décodé.
---@param spec table Spécification de l'outil.
---@param replace boolean true pour remplacer, false pour fusionner.
---@return boolean  ok.
---@return integer|string  Nombre d'éléments chargés, ou message d'erreur (« not a valid <toolId> session file »).
function editor_toolUtilities_session.loadJson(j, spec, replace) end

--- Marque le document d'un outil comme modifié (non enregistré). À appeler depuis la passe de reconstruction de l'outil, une fois par passe. La garde de chargement avale un appel après un Load.
---Source : lua/ge/extensions/editor/toolUtilities/session.lua:92
---@param toolId string Identifiant de l'outil.
function editor_toolUtilities_session.markEdited(toolId) end

--- Rétablit la liaison fichier et l'état modifié depuis une table renvoyée par attachment (par exemple après un rechargement d'extension).
---Source : lua/ge/extensions/editor/toolUtilities/session.lua:131
---@param toolId string Identifiant de l'outil.
---@param at table { path, dirty } ; ignoré si ce n'est pas une table.
function editor_toolUtilities_session.reattach(toolId, at) end

--- Reconvertit en place un tableau de positions chargées depuis le JSON ({x,y,z} simples) en vec3. Idempotent (les vec3 existants, qui ont une méthode distance, sont laissés tels quels) ; sans danger sur nil ou une non-table.
---Source : lua/ge/extensions/editor/toolUtilities/session.lua:147
---@param arr table|nil Tableau de positions.
function editor_toolUtilities_session.rehydrateVec3Array(arr) end

--- Variante en ligne : dessine Save (une fois un fichier connu), Save As (si l'outil est non vide) et Load côte à côte, puis la fenêtre modale Replace/Merge.
---Source : lua/ge/extensions/editor/toolUtilities/session.lua:345
---@param spec table Spécification de l'outil.
function editor_toolUtilities_session.renderButtons(spec) end

--- Variante en colonnes : dessine Save, Save As et Load comme trois cellules de grille.
---Source : lua/ge/extensions/editor/toolUtilities/session.lua:357
---@param spec table Spécification de l'outil.
function editor_toolUtilities_session.renderButtonsColumns(spec) end

--- Réécrit le document modifié sur le fichier auquel il est lié, pour un outil dont le travail ne doit jamais attendre un appui sur Save. Renvoie false s'il n'y a pas de fichier lié ou pas de modification.
---Source : lua/ge/extensions/editor/toolUtilities/session.lua:173
---@param spec table Spécification de l'outil.
---@return boolean  true si enregistré.
function editor_toolUtilities_session.saveIfEdited(spec) end

--- Écrit tous les éléments dans path en JSON de session portable : version, tool, mapName (niveau courant), items ou state, globals, records.
---Source : lua/ge/extensions/editor/toolUtilities/session.lua:156
---@param path string Chemin du fichier.
---@param spec table Spécification de l'outil.
---@return boolean  ok (toujours true).
---@return integer  Nombre d'éléments de getItems().
function editor_toolUtilities_session.saveToFile(path, spec) end

--- Détache un outil de son fichier : le prochain Save devra demander où écrire au lieu d'écraser silencieusement le dernier fichier chargé.
---Source : lua/ge/extensions/editor/toolUtilities/session.lua:104
---@param toolId string Identifiant de l'outil.
function editor_toolUtilities_session.unbind(toolId) end

--- Titre de fenêtre nommant le fichier lié (ou newName avant qu'il y en ait un, « New Session » par défaut). L'identifiant id suit « ### » pour qu'ImGui garde l'ancrage et la taille. Mis en cache par outil.
---Source : lua/ge/extensions/editor/toolUtilities/session.lua:121
---@param toolId string Identifiant de l'outil.
---@param label string Libellé affiché.
---@param id string Identifiant ImGui stable.
---@param newName string|nil Nom affiché tant qu'aucun fichier n'est lié.
---@return string  Titre « label - [nom]###id ».
function editor_toolUtilities_session.windowTitle(toolId, label, id, newName) end

