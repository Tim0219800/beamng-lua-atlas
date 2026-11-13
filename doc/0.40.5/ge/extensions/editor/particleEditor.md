# `editor_particleEditor`

*Fichier : `lua/ge/extensions/editor/particleEditor.lua` · VM : Game Engine (GE) · 578 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_particleEditor` : `extensions.load("editor_particleEditor")`, puis la globale `editor_particleEditor`

Éditeur de particules (mode d'édition « Particle Editor ») de l'éditeur de monde. Il ajoute un en-tête à l'inspecteur avec un onglet Emitter (choix, création, sauvegarde, suppression d'un ParticleEmitterData) et un onglet pour les ParticleData rattachés. Il enregistre aussi deux éditeurs de champ personnalisés : « particles » (jusqu'à 4 ParticleData, séparés par des tabulations) pour ParticleEmitterData et « textureName » (sélecteur de fichier) pour ParticleData. Les datablocks sont sauvegardés dans art/shapes/particles/managedParticleEmitterData.json et managedParticleData.json, soit dans leur fichier d'origine, soit dans le dossier du niveau courant.

## Remarques

- Le module n'exporte que des hooks ; toute la logique (undo/redo de création et suppression, sauvegarde, confirmation de changement non sauvegardé) est locale.
- Un émetteur nommé « DefaultEmitter » est protégé : les boutons d'édition sont désactivés pour lui.
- Les fenêtres n'agissent que si editor.editMode est le mode particleEditMode.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_particleEditor.onEditorInitialized()` | Appelé une fois l'éditeur initialisé. Déclare le mode d'édition editor.editModes.particleEditMode (nom « Particle Editor ») et enregistre les éditeurs de champ personnalisés pour ParticleEmitterData.particles et ParticleData.textureName. *(interne)* *(hook)* | 544 |
| `editor_particleEditor.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)` | Appelé quand un champ de l'inspecteur est modifié. Si l'objet modifié (selectedIds[1]) est l'émetteur ou la particule courants, le datablock est marqué sale, rechargé (reload) et la liste des datablocks est reconstruite. *(interne)* *(hook)* | 457 |
| `editor_particleEditor.onEditorInspectorHeaderGui()` | Appelé à chaque frame au début de la fenêtre Inspecteur. Dessine les onglets Emitter / Particle, les boutons nouveau, sauvegarder, sauvegarder dans le niveau, supprimer, et la boîte de confirmation de changement de sélection avec modifications non enregistrées. Ne fait rien hors du mode Particle Editor. *(interne)* *(hook)* | 291 |
| `editor_particleEditor.onExtensionLoaded()` | Appelé au chargement de l'extension ; écrit seulement « initialized » dans le log (niveau D). *(interne)* *(hook)* | 561 |
| `editor_particleEditor.onExtensionUnloaded()` | Appelé au déchargement ; supprime le nœud émetteur d'aperçu (editableEmitterNode) s'il existe. *(interne)* *(hook)* | 565 |

### Détail des paramètres

#### `editor_particleEditor.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)`

Appelé quand un champ de l'inspecteur est modifié. Si l'objet modifié (selectedIds[1]) est l'émetteur ou la particule courants, le datablock est marqué sale, rechargé (reload) et la liste des datablocks est reconstruite.

- `selectedIds` (*table<integer, integer>*) : IDs des objets sélectionnés ; seul le premier est utilisé.
- `fieldName` (*string*) : Nom du champ modifié (non utilisé).
- `fieldValue` (*any*) : Nouvelle valeur (non utilisée).
- `arrayIndex` (*integer*) : Index dans un champ tableau (non utilisé).

## Appels vers le moteur (C++)

- `Sim.` `getDataBlockSet`, `getUniqueName`, `upcast`
- `scenetree.` `findObject`, `findObjectById`
- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/particleEditor.lua`.*
