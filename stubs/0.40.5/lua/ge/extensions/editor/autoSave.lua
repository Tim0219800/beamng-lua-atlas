---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/autoSave.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sauvegarde automatique de l'éditeur de niveaux. Un minuteur (preference files.autoSave.interval, 120 s par défaut) appelle editor.autoSaveLevel() quand files.autoSave.active est vrai, avec un compte à rebours dans la barre d'état pendant files.autoSave.noticeInterval secondes. Une fenêtre modale « AutoSave Restore » permet de restaurer l'arbre de scène depuis /temp/level_autosaves/<niveau>/ ; elle s'ouvre seule si l'éditeur ne s'est pas fermé proprement sur ce niveau, ou via le menu des fenêtres.
--- Accès : extension `editor_autoSave` : `extensions.load("editor_autoSave")`, puis la globale `editor_autoSave`
---@class editor_autoSave
editor_autoSave = {}

--- Appelé chaque frame de l'éditeur : affiche la fenêtre de restauration si nécessaire, décrémente le minuteur, affiche l'avertissement et déclenche editor.autoSaveLevel() quand il atteint 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/autoSave.lua:110
---@param dtReal number Durée réelle de la frame (s), utilisée pour le minuteur.
---@param dtSim number Durée simulée (non utilisée).
---@param dtRaw number Durée brute (non utilisée).
function editor_autoSave.onEditorGui(dtReal, dtSim, dtRaw) end

--- Initialise le minuteur avec files.autoSave.interval et ajoute l'entrée « AutoSave Restore » au menu des fenêtres.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/autoSave.lua:133
function editor_autoSave.onEditorInitialized() end

--- Hook appelé quand une préférence change : remet le minuteur à jour pour files.autoSave.interval et garde noticeInterval <= interval.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/autoSave.lua:138
---@param path string Chemin de la préférence, ex. "files.autoSave.interval".
---@param value any Nouvelle valeur.
function editor_autoSave.onEditorPreferenceValueChanged(path, value) end

--- Hook d'enregistrement des préférences de l'éditeur : déclare la catégorie « files » et la sous-catégorie « autoSave ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/autoSave.lua:153
---@param prefsRegistry table Registre de préférences de l'éditeur (registerCategory / registerSubCategory).
function editor_autoSave.onEditorRegisterPreferences(prefsRegistry) end

