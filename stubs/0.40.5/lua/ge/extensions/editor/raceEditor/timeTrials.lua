---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/raceEditor/timeTrials.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre Time Trials (windowDescription = 'Time Trials'). Instanciée avec init(raceEditor) ; le module est stocké dans self.pathEditor.
---@class editor_raceEditor_timeTrials
local editor_raceEditor_timeTrials = {}

--- Si la nouvelle valeur diffère de path[field], valide une action d'historique qui modifie ce champ du chemin.
---Source : lua/ge/extensions/editor/raceEditor/timeTrials.lua:65
---@param field string Nom du champ du chemin (name, description, authors, difficulty, prefabs, forwardPrefabs, reversePrefabs).
---@param new any Nouvelle valeur.
---@param add string|nil Précision ajoutée au nom de l'action d'historique.
function editor_raceEditor_timeTrials:changeField(field, new, add) end

--- Affiche une ligne « nom : » avec une icône coche ou croix selon classification[field].
---Source : lua/ge/extensions/editor/raceEditor/timeTrials.lua:148
---@param classification table Résultat de path:classify() (clés reversible, allowRollingStart…).
---@param name string Libellé.
---@param field string Clé testée dans classification.
---@param tt string|nil Infobulle.
function editor_raceEditor_timeTrials:displayClassification(classification, name, field, tt) end

--- Appelé à chaque frame : dessine les informations générales.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/timeTrials.lua:58
function editor_raceEditor_timeTrials:draw() end

--- Dessine tout le formulaire : champs texte, difficulté, classification, indicateur d'aperçu (survol = image, clic = actualiser) et listes de prefabs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/timeTrials.lua:74
function editor_raceEditor_timeTrials:drawGeneralInfo() end

--- Dessine la liste de prefabs d'un champ : entrée automatique en lecture seule, puis pour chaque prefab suppression, saisie, sélecteur de fichier et icône d'existence, et bouton Add.
---Source : lua/ge/extensions/editor/raceEditor/timeTrials.lua:195
---@param fieldName string prefabs, forwardPrefabs ou reversePrefabs.
---@param default string Nom du prefab chargé automatiquement.
function editor_raceEditor_timeTrials:drawPrefabs(fieldName, default) end

--- Affiche une icône coche (fichier trouvé) ou erreur (introuvable) pour un prefab, en testant plusieurs chemins (avec/sans .prefab, .prefab.json, .json, dossier du niveau ou du chemin). L'infobulle liste le fichier trouvé ou les chemins essayés.
---Source : lua/ge/extensions/editor/raceEditor/timeTrials.lua:159
---@param f string|table<integer, string> Nom de fichier, ou liste explicite de chemins à tester.
---@param inPathFolder boolean|nil Censé chercher dans le dossier du chemin de course (sans effet, voir notes).
function editor_raceEditor_timeTrials:existsIcon(f, inPathFolder) end

--- Cherche <dossier><nom du fichier>.jpg ; si présent, le charge comme texture d'aperçu, sinon efface l'aperçu.
---Source : lua/ge/extensions/editor/raceEditor/timeTrials.lua:48
function editor_raceEditor_timeTrials:findPreview() end

--- Mémorise le module raceEditor dans self.pathEditor.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/timeTrials.lua:24
---@param raceEditor table Module editor_raceEditor.
function editor_raceEditor_timeTrials:init(raceEditor) end

--- Recharge nom, description, auteurs et listes de prefabs depuis le chemin, puis cherche l'image d'aperçu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/timeTrials.lua:32
function editor_raceEditor_timeTrials:selected() end

--- Définit le chemin de course édité et recharge les champs de la fenêtre (appelle selected()).
---Source : lua/ge/extensions/editor/raceEditor/timeTrials.lua:28
---@param path table Objet gameplay/race/path.
function editor_raceEditor_timeTrials:setPath(path) end

--- Appelé quand l'onglet est quitté ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/timeTrials.lua:56
function editor_raceEditor_timeTrials:unselect() end

