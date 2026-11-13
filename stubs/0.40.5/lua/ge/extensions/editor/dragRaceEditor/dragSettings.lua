---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère les fichiers de réglages de drag (*.dragSettings.json) dans l'éditeur de drag race. Un réglage décrit une course : id, stripId, dragType (headsUpRace/bracketRace), context (freeroam/activity), phases (stage, countdown, race, stop), timers et prefabs (arbre de départ, panneau d'affichage, chemins, décorations). Le module garde en mémoire un seul objet dragSettings (le réglage affiché) et la liste des fichiers trouvés, liste, charge, crée, renomme et sauvegarde ces fichiers, et dessine les panneaux ImGui correspondants.
--- Accès : extension `editor_dragRaceEditor_dragSettings` : `extensions.load("editor_dragRaceEditor_dragSettings")`, puis la globale `editor_dragRaceEditor_dragSettings`
---@class editor_dragRaceEditor_dragSettings
editor_dragRaceEditor_dragSettings = {}

--- Dessine un panneau ImGui « Drag Settings » (ancienne présentation en bloc fixe de 200 px de haut).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:957
function editor_dragRaceEditor_dragSettings.drawDragSettingsSection() end

--- Dessine l'édition des phases de course.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:1108
function editor_dragRaceEditor_dragSettings.drawPhasesSection() end

--- Dessine l'édition des prefabs (arbre, panneau, chemins, décorations).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:1041
function editor_dragRaceEditor_dragSettings.drawPrefabsSection() end

--- Dessine le détail du réglage sélectionné : Basics, Phases, Timers, Prefabs. Les modifications appellent markDirty.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:402
function editor_dragRaceEditor_dragSettings.drawSettingsDetails() end

--- Dessine la section « Drag Settings » (liste, bouton Add via dialogue de sauvegarde, etc.). Les boutons sont désactivés s'il n'y a aucun strip sauvegardé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:236
function editor_dragRaceEditor_dragSettings.drawSettingsList() end

--- Renvoie la liste des fichiers de réglages.
---Source : lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:189
---@return table  tableau de {type, path, name, _dirty…}
function editor_dragRaceEditor_dragSettings.getAllSettings() end

--- Renvoie l'objet dragSettings en cours d'édition.
---Source : lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:834
---@return table  réglage courant
function editor_dragRaceEditor_dragSettings.getDragSettings() end

--- Renvoie l'entrée de fichier sélectionnée.
---Source : lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:201
---@return table|nil  entrée ou nil
function editor_dragRaceEditor_dragSettings.getSelectedSettings() end

--- Index (base 1) du fichier sélectionné, -1 si aucun.
---Source : lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:193
---@return integer  index
function editor_dragRaceEditor_dragSettings.getSelectedSettingsIndex() end

--- Vide la liste puis la remplit avec les fichiers de réglages du niveau courant et de ses missions dragStripRace / dragStripAPM. Le nom affiché est json.id s'il existe, sinon le nom de fichier ou de dossier. Ne fait rien sans niveau chargé.
---Source : lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:68
function editor_dragRaceEditor_dragSettings.loadAllSettings() end

--- Lit un fichier JSON dans dragSettings, supprime facilityId, complète id (nom de fichier) et timers par défaut, et remet _dirty à false pour le fichier correspondant.
---Source : lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:850
---@param filePath string chemin du fichier .dragSettings.json
---@return boolean  false et erreur affichée si la lecture échoue
function editor_dragRaceEditor_dragSettings.loadDragSettings(filePath) end

--- Marque le fichier sélectionné comme modifié et copie dragSettings dans son cache.
---Source : lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:842
function editor_dragRaceEditor_dragSettings.markDirty() end

--- Valide puis écrit dragSettings (sans facilityId) en JSON. Corrige l'extension en .dragSettings.json, retire les caractères *?<>|", renomme le fichier si l'id a changé (dossier du niveau), crée le dossier si besoin et met à jour l'entrée sélectionnée.
---Source : lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:876
---@param filePath string|nil chemin cible ; chemin de l'entrée sélectionnée si nil
---@return boolean  succès
function editor_dragRaceEditor_dragSettings.saveDragSettings(filePath) end

--- Sélectionne un fichier : met en cache le réglage précédent s'il est modifié, désélectionne le strip, puis restaure le cache, ou charge le fichier depuis le disque, ou pour un fichier inexistant reprend le nom comme id.
---Source : lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:208
---@param index integer index base 1
function editor_dragRaceEditor_dragSettings.selectSettings(index) end

--- Remplace l'objet dragSettings courant (inchangé si nil).
---Source : lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:838
---@param settings table|nil nouveau réglage
function editor_dragRaceEditor_dragSettings.setDragSettings(settings) end

--- Fixe l'index sélectionné sans charger de données.
---Source : lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:197
---@param index integer index base 1 ou -1
function editor_dragRaceEditor_dragSettings.setSelectedSettingsIndex(index) end

--- Vérifie qu'un réglage a un dragType et un stripId non vides.
---Source : lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:946
---@param settings table|nil réglage
---@return boolean  validité
---@return string|nil  message d'erreur
function editor_dragRaceEditor_dragSettings.validateDragSettings(settings) end

