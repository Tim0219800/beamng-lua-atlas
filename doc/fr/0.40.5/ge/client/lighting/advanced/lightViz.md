# `client_lighting_advanced_lightViz`

*Fichier : `lua/ge/client/lighting/advanced/lightViz.lua` · VM : Game Engine (GE) · 247 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("client/lighting/advanced/lightViz")`

Modes de visualisation de débogage de l'éclairage avancé. Il crée des PostEffect (priorité 9999, cible $backBuffer) : AL_DepthVisualize, AL_NormalsVisualize, AL_LightColorVisualize, AL_LightSpecularVisualize, AL_VelocityVisualize et AnnotationVisualize, avec leurs shaders et state blocks. Il définit des globales de bascule (toggleDepthViz, toggleNormalsViz, toggleLightColorViz, toggleLightSpecularViz, toggleVelocityViz, toggleAnnotationVisualize, toggleLightVisualizer) et des tables de callbacks onEnabled/onDisabled. Un seul mode est actif à la fois : activer un mode désactive le précédent.

## Exemple

```lua
toggleDepthViz()        -- bascule la visualisation de la profondeur
toggleNormalsViz(true)  -- force l'activation
toggleNormalsViz(false) -- force la désactivation
```

## Remarques

- Argument des fonctions toggleXxxViz(enable) : nil ou "" bascule (et met à jour la variable $AL_xxxVisualizeVar), true active, false désactive.
- Les callbacks onEnabled retournent true. Celui d'AnnotationVisualize active Engine.Annotation.enable(true) s'il existe, et onDisabled le désactive.
- Incohérence : la table des callbacks des normales est publiée sous la globale « AL_NormalsVisualize » (même nom que l'objet PostEffect) au lieu de « AL_NormalsVisualizeCallbacks » comme pour les autres modes.
- Les tables de callbacks sont locales avec rawset sur _G : AL_DepthVisualizeCallbacks, AL_LightColorVisualizeCallbacks, AL_LightSpecularVisualizeCallbacks, AL_VelocityVisualizeCallbacks, AnnotationVisualizeCallbacks.

## Classe `aL_LightColorVisualizeCallbacks`

Callbacks de AL_LightColorVisualize.

| Méthode | Description | Ligne |
|---|---|---|
| `aL_LightColorVisualizeCallbacks.onEnabled()` | Même logique pour AL_LightColorVisualize. | 113 |

## Classe `aL_LightSpecularVisualizeCallbacks`

Callbacks de AL_LightSpecularVisualize.

| Méthode | Description | Ligne |
|---|---|---|
| `aL_LightSpecularVisualizeCallbacks.onEnabled()` | Même logique pour AL_LightSpecularVisualize. | 140 |

## Classe `aL_NormalsVisualizeCallbacks`

Callbacks de AL_NormalsVisualize (publiés sous la globale AL_NormalsVisualize).

| Méthode | Description | Ligne |
|---|---|---|
| `aL_NormalsVisualizeCallbacks.onEnabled()` | Même logique pour AL_NormalsVisualize. | 85 |

## Classe `al_DepthVisualizeCallbacks`

Callbacks de AL_DepthVisualize (globale AL_DepthVisualizeCallbacks).

| Méthode | Description | Ligne |
|---|---|---|
| `al_DepthVisualizeCallbacks.onEnabled()` | Désactive le mode de visualisation précédent, mémorise AL_DepthVisualize comme mode courant, retourne true. | 56 |

## Classe `al_VelocityVisualizeCallbacks`

Callbacks de AL_VelocityVisualize (texture #VelocityBuffer).

| Méthode | Description | Ligne |
|---|---|---|
| `al_VelocityVisualizeCallbacks.onEnabled()` | Même logique pour AL_VelocityVisualize. | 167 |

## Classe `annotationVisualizeCallbacks`

Callbacks de AnnotationVisualize (buffer d'annotations).

| Méthode | Description | Ligne |
|---|---|---|
| `annotationVisualizeCallbacks.onDisabled()` | Désactive Engine.Annotation si disponible. | 203 |
| `annotationVisualizeCallbacks.onEnabled()` | Si Engine.Annotation existe : sélectionne le mode AnnotationVisualize et active Engine.Annotation. | 195 |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/client/lighting/advanced/lightViz.lua`.*
