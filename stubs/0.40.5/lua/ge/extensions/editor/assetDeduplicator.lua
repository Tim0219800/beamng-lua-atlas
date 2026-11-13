---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/assetDeduplicator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil d'éditeur « Asset Deduplicator » (menu Window > Assets) : repère les fichiers en double du niveau courant et propose de les remplacer par des fichiers lien. Il construit un cache de hashs (/temp/assetdeduplicator.cache.json, version 3, lié à la version du jeu) via un job, puis compare soit par hash de contenu (sans risque), soit par nom de fichier (revue manuelle requise). Utile surtout aux équipes qui préparent des niveaux ; rien à appeler depuis un mod.
--- Accès : extension `editor_assetDeduplicator` : `extensions.load("editor_assetDeduplicator")`, puis la globale `editor_assetDeduplicator`
---@class editor_assetDeduplicator
editor_assetDeduplicator = {}

--- Hook appelé à l'activation de l'éditeur ; corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/assetDeduplicator.lua:976
function editor_assetDeduplicator.onEditorActivated() end

--- Hook appelé à la désactivation de l'éditeur ; corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/assetDeduplicator.lua:980
function editor_assetDeduplicator.onEditorDeactivated() end

--- Hook appelé à chaque frame de l'éditeur : dessine la fenêtre « Asset Deduplicator » (état du cache, choix du mode hash/nom, bouton « Run assessment », prévisualisation et application des liens, boutons de reset du cache). Lance le job de génération de cache à la première ouverture.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/assetDeduplicator.lua:849
function editor_assetDeduplicator.onEditorGui() end

--- Hook appelé à l'initialisation de l'éditeur : ajoute l'entrée de menu « Asset Deduplicator » (groupe Assets) et enregistre la fenêtre 'assetDeduplicator' (500x300).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/assetDeduplicator.lua:984
function editor_assetDeduplicator.onEditorInitialized() end

--- Callback du menu : affiche la fenêtre 'assetDeduplicator'.
---Source : lua/ge/extensions/editor/assetDeduplicator.lua:38
function editor_assetDeduplicator.onWindowMenuItem() end

