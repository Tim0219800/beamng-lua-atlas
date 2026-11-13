---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/bulkRename.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre « Bulk Rename » (menu Assets) de l'éditeur de niveaux : renomme en lot les objets de la scène. On choisit le champ à renommer (name ou internalName), l'ensemble d'objets (sélection courante, ou objets dont le nom correspond à un motif avec * et ?), et un motif de renommage où %n insère un compteur (%4n = 4 chiffres avec zéros), et %o l'ancien nom. Un tableau d'aperçu montre ancien nom, nouveau nom, ID et ID de collision ; le renommage passe par objectHistoryActions.changeObjectFieldMultipleValuesWithUndo (annulable).
--- Accès : extension `editor_bulkRename` : `extensions.load("editor_bulkRename")`, puis la globale `editor_bulkRename`
---@class editor_bulkRename
editor_bulkRename = {}

--- Hook appelé à l'activation de l'éditeur ; fonction vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/bulkRename.lua:245
function editor_bulkRename.onEditorActivated() end

--- Appelé chaque frame de l'éditeur : dessine la fenêtre Bulk Rename (options, motifs, bouton RENAME, tableau d'aperçu).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/bulkRename.lua:139
function editor_bulkRename.onEditorGui() end

--- Enregistre la fenêtre « bulkRename » (600x600) et l'entrée de menu « Bulk Rename » (groupe Assets).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/bulkRename.lua:256
function editor_bulkRename.onEditorInitialized() end

--- Hook appelé quand la sélection d'objets de l'éditeur change ; recalcule l'aperçu des noms.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/bulkRename.lua:248
function editor_bulkRename.onEditorObjectSelectionChanged() end

--- Hook appelé au chargement de l'extension ; fonction vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/bulkRename.lua:261
function editor_bulkRename.onExtensionLoaded() end

