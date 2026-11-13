---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/resourceChecker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre « Resources Checker » de l'éditeur (menu Assets) pour auditer les ressources du niveau courant. Trois onglets : « Materials Verification » (version des matériaux, doublons, suppression de pid, conversion en PNG, vérification des cartes/fichiers de textures, matériaux manquants ou factices), « Resources Explorer » (TSStatics chargés, ForestItems, terrains, matériaux/meshes/textures utilisés ou non, données de collision) et « Asset Stats » (scan des fichiers, treemap et liste par taille). Permet aussi d'aperçu d'images, de résoudre des doublons et de supprimer des fichiers inutilisés. Les calculs lourds sont faits par resourceUtil (extensions.editor_resourceChecker_resourceUtil) qui renvoie ses résultats par jobData.
--- Accès : extension `editor_resourceChecker` : `extensions.load("editor_resourceChecker")`, puis la globale `editor_resourceChecker`
---@class editor_resourceChecker
editor_resourceChecker = {}

--- Reçoit le résultat d'un job asynchrone de resourceUtil et le range pour l'affichage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/resourceChecker.lua:1805
---@param type integer 2 = résultats de vérification des matériaux, 3 = résultats de l'explorateur de ressources.
---@param data any Données du job.
function editor_resourceChecker.jobData(type, data) end

--- Hook à l'activation de l'éditeur ; vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/resourceChecker.lua:1818
function editor_resourceChecker.onEditorActivated() end

--- Hook à la désactivation de l'éditeur ; vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/resourceChecker.lua:1822
function editor_resourceChecker.onEditorDeactivated() end

--- Hook : dessine la fenêtre à onglets, l'aperçu d'image et le résolveur de doublons.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/resourceChecker.lua:1778
function editor_resourceChecker.onEditorGui() end

--- Hook : ajoute l'entrée de menu « Resources Checker » (groupe Assets) et enregistre les trois fenêtres (principale, aperçu d'image, doublons).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/resourceChecker.lua:1826
function editor_resourceChecker.onEditorInitialized() end

--- Affiche la fenêtre « resourceChecker » (appelé par l'entrée de menu).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/resourceChecker.lua:17
function editor_resourceChecker.onWindowMenuItem() end

--- Remplace la table des doublons affichée dans le résolveur de doublons.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/resourceChecker.lua:1814
---@param data table Table de doublons calculée par resourceUtil (déduit du code).
function editor_resourceChecker.updateDuplicateTable(data) end

