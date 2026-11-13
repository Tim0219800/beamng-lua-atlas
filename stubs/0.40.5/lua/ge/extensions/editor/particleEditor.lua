---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/particleEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Éditeur de particules (mode d'édition « Particle Editor ») de l'éditeur de monde. Il ajoute un en-tête à l'inspecteur avec un onglet Emitter (choix, création, sauvegarde, suppression d'un ParticleEmitterData) et un onglet pour les ParticleData rattachés. Il enregistre aussi deux éditeurs de champ personnalisés : « particles » (jusqu'à 4 ParticleData, séparés par des tabulations) pour ParticleEmitterData et « textureName » (sélecteur de fichier) pour ParticleData. Les datablocks sont sauvegardés dans art/shapes/particles/managedParticleEmitterData.json et managedParticleData.json, soit dans leur fichier d'origine, soit dans le dossier du niveau courant.
--- Accès : extension `editor_particleEditor` : `extensions.load("editor_particleEditor")`, puis la globale `editor_particleEditor`
---@class editor_particleEditor
editor_particleEditor = {}

--- Appelé une fois l'éditeur initialisé. Déclare le mode d'édition editor.editModes.particleEditMode (nom « Particle Editor ») et enregistre les éditeurs de champ personnalisés pour ParticleEmitterData.particles et ParticleData.textureName.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/particleEditor.lua:544
function editor_particleEditor.onEditorInitialized() end

--- Appelé quand un champ de l'inspecteur est modifié. Si l'objet modifié (selectedIds[1]) est l'émetteur ou la particule courants, le datablock est marqué sale, rechargé (reload) et la liste des datablocks est reconstruite.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/particleEditor.lua:457
---@param selectedIds table<integer, integer> IDs des objets sélectionnés ; seul le premier est utilisé.
---@param fieldName string Nom du champ modifié (non utilisé).
---@param fieldValue any Nouvelle valeur (non utilisée).
---@param arrayIndex integer Index dans un champ tableau (non utilisé).
function editor_particleEditor.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex) end

--- Appelé à chaque frame au début de la fenêtre Inspecteur. Dessine les onglets Emitter / Particle, les boutons nouveau, sauvegarder, sauvegarder dans le niveau, supprimer, et la boîte de confirmation de changement de sélection avec modifications non enregistrées. Ne fait rien hors du mode Particle Editor.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/particleEditor.lua:291
function editor_particleEditor.onEditorInspectorHeaderGui() end

--- Appelé au chargement de l'extension ; écrit seulement « initialized » dans le log (niveau D).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/particleEditor.lua:561
function editor_particleEditor.onExtensionLoaded() end

--- Appelé au déchargement ; supprime le nœud émetteur d'aperçu (editableEmitterNode) s'il existe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/particleEditor.lua:565
function editor_particleEditor.onExtensionUnloaded() end

