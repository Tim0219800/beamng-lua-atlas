# `render_renderViews`

*Fichier : `lua/ge/extensions/render/renderViews.lua` · VM : Game Engine (GE) · 160 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `render_renderViews` : `extensions.load("render_renderViews")`, puis la globale `render_renderViews`

Prise de captures d'écran depuis une caméra virtuelle indépendante (RenderView) : on donne position, rotation, résolution, FOV et masques d'objets, le module crée une vue de rendu nommée, attend une courte durée, sauvegarde l'image sur disque (PNG, éventuellement réduite) puis détruit la vue. Utile pour des miniatures, aperçus de véhicules ou masques. Pendant la capture il masque CEF, imgui et les marqueurs de gameplay. Global : render_renderViews.

## Exemple

```lua
render_renderViews.takeScreenshot({
  pos = vec3(0, 0, 100), rot = quat(0, 0, 0, 1),
  resolution = vec3(1024, 512, 0), fov = 60,
  filename = '/temp/vue.png', copyMainViewExposure = true,
}, function(success) print(success) end)
```

## Remarques

- L'image est d'abord écrite dans `<filename>.tmp.png` puis copiée (ou réduite avec downscaleFactor) vers filename ; le fichier temporaire est supprimé. La réduction convertit en format R8G8B8 (GFXFormat 10).
- La capture s'exécute dans un job (core_jobsystem) : le callback est appelé à la fin avec un booléen de succès ; options.screenshotDelay (défaut 0.1 s) laisse le temps au rendu.
- L'anticrénelage est temporairement désactivé (GraphicAntialias 4 -> 0) si le type est smaaT2x ou fxaa (sauf allowAntialiasing=true), puis restauré à 4 après la capture.
- La résolution est donnée sous forme de vec3(x=largeur, y=hauteur, z ignoré) ; défaut 512x256. FOV en degrés (défaut 75), plan proche 0.1 m, plan lointain 2000 m (nearPlane, farClip).
- Exposition : copyMainViewExposure copie l'exposition de la vue principale (EV manuel ou exposition courante) ; sinon manualEV/currentExposure des options.
- Le nom de vue par défaut est 'defaultRenderView' (identifiant unique de vue ; namedTexTargetColor reçoit le même nom). Deux captures simultanées avec le même nom partagent la même vue.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `render_renderViews.takeScreenshot(options, callback)` | Crée une RenderView selon les options, programme un job qui masque l'UI, sauvegarde l'image dans options.filename, détruit la vue, restaure l'UI et l'AA, puis appelle le callback. | 78 |

### Détail des paramètres

#### `render_renderViews.takeScreenshot(options, callback)`

Crée une RenderView selon les options, programme un job qui masque l'UI, sauvegarde l'image dans options.filename, détruit la vue, restaure l'UI et l'AA, puis appelle le callback.

- `options` (*table*) : {pos: vec3, rot: quat, filename: string, resolution?: vec3 (px), downscaleFactor?: number, fov?: number°, nearPlane?: number m, farClip?: number m, renderViewName?: string, renderViewMaskBit?: integer, usePostEffects?: boolean, clearColor?: ColorF (déduit du code), objectTypeWhitelistMask?/objectTypeBlacklistMask?/shadowCasterObjectTypeWhitelistMask?/shadowCasterObjectTypeBlacklistMask?: integer, focusObjects?: object[], manualEV?: number, currentExposure?: number, copyMainViewExposure?: boolean, allowAntialiasing?: boolean, screenshotDelay?: number s}
- `callback` (*function|nil*) : function(success: boolean) appelée à la fin.

## Appels vers le moteur (C++)

- `FS:` `copyFile`, `removeFile`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/render/renderViews.lua`.*
