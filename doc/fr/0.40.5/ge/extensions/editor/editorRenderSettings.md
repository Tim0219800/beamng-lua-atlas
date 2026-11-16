# `editor_editorRenderSettings`

*Fichier : `lua/ge/extensions/editor/editorRenderSettings.lua` · VM : Game Engine (GE) · 533 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_editorRenderSettings` : `extensions.load("editor_editorRenderSettings")`, puis la globale `editor_editorRenderSettings`

Fenêtre « Editor Render Settings » de l'éditeur : permet d'utiliser dans l'éditeur des réglages graphiques différents de ceux du jeu (anti-aliasing, résolution, qualité des meshes/terrain/clusters/nuages, herbe, ombres, réflexions dynamiques, SSAO, DOF, flou de mouvement, limite de FPS). Les valeurs sont stockées dans les préférences editor.renderSettings.* (followGameSettings, values). À l'activation de l'éditeur l'état graphique du jeu est capturé, puis restauré à la désactivation, à l'arrêt de l'éditeur ou au déchargement de l'extension.

## Remarques

- Si « followGameSettings » est vrai (défaut), les réglages du jeu sont utilisés tels quels ; sinon les valeurs sauvegardées sont appliquées à l'activation de l'éditeur.
- Certains réglages ne sont proposés que si l'objet correspondant existe dans la scène (CloudLayer, ScreenSpaceShadowsPostFx, SSAOPostFx, DOFPostEffect, PostFxMotionBlur).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_editorRenderSettings.onEditorActivated()` | Capture l'état graphique du jeu ; si followGameSettings est faux, sauvegarde et applique les valeurs de l'éditeur. *(interne)* *(hook)* | 504 |
| `editor_editorRenderSettings.onEditorDeactivated()` | Restaure l'état graphique du jeu capturé à l'activation. *(interne)* *(hook)* | 520 |
| `editor_editorRenderSettings.onEditorGui()` | Dessine la fenêtre : case « suivre les réglages du jeu », bouton de synchronisation depuis le jeu, préréglages de qualité, puis sections Antialiasing, Qualité de scène, Ombres, Réflexions, Post-traitement et Limite de FPS. *(interne)* *(hook)* | 426 |
| `editor_editorRenderSettings.onEditorInitialized()` | Enregistre la fenêtre « editorRenderSettings » (420x700). *(interne)* *(hook)* | 500 |
| `editor_editorRenderSettings.onEditorRegisterPreferences(prefsRegistry)` | Enregistre la catégorie « editor » et la sous-catégorie renderSettings (followGameSettings = true par défaut, values = {}). *(interne)* *(hook)* | 492 |
| `editor_editorRenderSettings.onEditorShutdown()` | Même fonction que la restauration de l'état du jeu (alias). *(interne)* *(hook)* | 513 |
| `editor_editorRenderSettings.onExtensionUnloaded()` | Même fonction que la restauration de l'état du jeu (alias). *(interne)* *(hook)* | 513 |

### Détail des paramètres

#### `editor_editorRenderSettings.onEditorRegisterPreferences(prefsRegistry)`

Enregistre la catégorie « editor » et la sous-catégorie renderSettings (followGameSettings = true par défaut, values = {}).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/editorRenderSettings.lua`.*
