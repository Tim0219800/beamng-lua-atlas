# `editor_rendererComponents`

*Fichier : `lua/ge/extensions/editor/rendererComponents.lua` · VM : Game Engine (GE) · 977 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_rendererComponents` : `extensions.load("editor_rendererComponents")`, puis la globale `editor_rendererComponents`

Fenêtre « Renderer Components » de l'éditeur (menu Debug) pour régler en direct les effets de rendu : profondeur de champ (DOF), HDR, SSAO, anti-aliasing, flou de mouvement, bloom, ombres en espace écran, CloudLayer, et en build non-shipping Coconut, Cluster Shading et Shadows. Chaque onglet n'apparaît que si l'objet post-effet correspondant existe dans la scène. Un menu « Reset All » et des boutons de réinitialisation par onglet remettent les valeurs par défaut. S'appuie sur core/settings/graphic et client/postFx/ssao.

## Remarques

- Le commentaire du fichier dit que c'est un utilitaire pour les créateurs de niveaux.
- L'onglet Weather du CloudLayer permet de régénérer la weather map avec une graine aléatoire (max 2147483647).
- onEditorActivated applique à DOFPostEffect l'état enregistré (debugModeEnabled, enable/disable) ; il suppose que DOFSettings est initialisé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_rendererComponents.onEditorActivated()` | Hook : à l'activation de l'éditeur, initialise les réglages si besoin et réapplique l'état du DOFPostEffect (mode debug, enable/disable). *(interne)* *(hook)* | 955 |
| `editor_rendererComponents.onEditorGui()` | Hook : dessine la fenêtre avec barre de menu et barre d'onglets ; un onglet n'est affiché que si le post-effet/objet existe. *(interne)* *(hook)* | 866 |
| `editor_rendererComponents.onEditorInitialized()` | Hook : ajoute les entrées de menu Debug (Renderer Components, et Cluster Shading hors shipping), enregistre la fenêtre (300x500), initialise les réglages et capture les valeurs par défaut des ombres en espace écran. *(interne)* *(hook)* | 944 |

## Appels vers le moteur (C++)

- `Sim.` `upcast`
- `obj:` `getField`, `setField`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rendererComponents.lua`.*
