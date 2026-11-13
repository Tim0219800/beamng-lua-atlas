# `client_renderManager`

*Fichier : `lua/ge/client/renderManager.lua` · VM : Game Engine (GE) · 56 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("client/renderManager")`

Prépare le format de rendu hors écran : crée le RenderFormatToken « AL_FormatToken » (couleur R8G8B8A8, profondeur $GFXFormatDefaultDepth ou D24S8, aaLevel 0, désactivé au départ), le state block « AL_FormatTokenState » (hérite de PFX_DefaultStateBlock, échantillonneur SamplerClampPoint) et le PostEffect « AL_FormatCopy » (passthrough vers $backbuffer). Ce token est activé/désactivé par les light managers.

## Remarques

- Les objets AL_FormatTokenState et AL_FormatCopy sont créés à l'import du module, hors de initRenderManager ; AL_FormatToken est créé à chaque appel d'initRenderManager (pas de test d'existence).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `client_renderManager.initRenderManager()` | Crée et enregistre l'objet RenderFormatToken « AL_FormatToken » (désactivé) avec AL_FormatCopy comme effet de copie et de résolution. *(interne)* | 7 |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/client/renderManager.lua`.*
