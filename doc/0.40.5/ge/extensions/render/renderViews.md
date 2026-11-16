# `render_renderViews`

*File: `lua/ge/extensions/render/renderViews.lua` · VM: Game Engine (GE) · 160 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `render_renderViews`: `extensions.load("render_renderViews")`, then the global `render_renderViews`

Takes screenshots from an independent virtual camera (RenderView): you give position, rotation, resolution, FOV and object masks, the module creates a named render view, waits a short time, saves the image to disk (PNG, optionally downscaled) then destroys the view. Useful for thumbnails, vehicle previews or masks. During the capture it hides CEF, imgui and gameplay markers. Global: render_renderViews.

## Example

```lua
render_renderViews.takeScreenshot({
  pos = vec3(0, 0, 100), rot = quat(0, 0, 0, 1),
  resolution = vec3(1024, 512, 0), fov = 60,
  filename = '/temp/vue.png', copyMainViewExposure = true,
}, function(success) print(success) end)
```

## Notes

- The image is first written to `<filename>.tmp.png` then copied (or downscaled with downscaleFactor) to filename; the temporary file is deleted. Downscaling converts to R8G8B8 format (GFXFormat 10).
- The capture runs in a job (core_jobsystem): the callback is called at the end with a success boolean; options.screenshotDelay (default 0.1 s) gives the render time.
- Antialiasing is temporarily disabled (GraphicAntialias 4 -> 0) if the type is smaaT2x or fxaa (unless allowAntialiasing=true), then restored to 4 after the capture.
- The resolution is given as vec3(x=width, y=height, z ignored); default 512x256. FOV in degrees (default 75), near plane 0.1 m, far plane 2000 m (nearPlane, farClip).
- Exposure: copyMainViewExposure copies the main view's exposure (manual EV or current exposure); otherwise manualEV/currentExposure from the options.
- The default view name is 'defaultRenderView' (unique view identifier; namedTexTargetColor receives the same name). Two simultaneous captures with the same name share the same view.

## Functions

| Function | Description | Line |
|---|---|---|
| `render_renderViews.takeScreenshot(options, callback)` | Creates a RenderView according to the options, schedules a job that hides the UI, saves the image to options.filename, destroys the view, restores the UI and AA, then calls the callback. | 78 |

### Parameter details

#### `render_renderViews.takeScreenshot(options, callback)`

Creates a RenderView according to the options, schedules a job that hides the UI, saves the image to options.filename, destroys the view, restores the UI and AA, then calls the callback.

- `options` (*table*) : {pos: vec3, rot: quat, filename: string, resolution?: vec3 (px), downscaleFactor?: number, fov?: number°, nearPlane?: number m, farClip?: number m, renderViewName?: string, renderViewMaskBit?: integer, usePostEffects?: boolean, clearColor?: ColorF (inferred from code), objectTypeWhitelistMask?/objectTypeBlacklistMask?/shadowCasterObjectTypeWhitelistMask?/shadowCasterObjectTypeBlacklistMask?: integer, focusObjects?: object[], manualEV?: number, currentExposure?: number, copyMainViewExposure?: boolean, allowAntialiasing?: boolean, screenshotDelay?: number s}
- `callback` (*function|nil*) : function(success: boolean) called at the end.

## Calls into the engine (C++)

- `FS:` `copyFile`, `removeFile`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/render/renderViews.lua`.*
