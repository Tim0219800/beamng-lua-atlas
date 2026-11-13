# `editor_api_decal`

*Fichier : `lua/ge/extensions/editor/api/decal.lua` · VM : Game Engine (GE) · 162 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_decal` : `extensions.load("editor_api_decal")`, puis la globale `editor_api_decal`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_decal.initialize(editorInstance)` |  | 133 |

## Classe `editor`

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.addDecalInstance(pos, normal, rotAroundNormal, template, decalScale, decalTexIndex, flags, initialAlpha)` |  | 55 |
| `editor.addDecalInstanceWithTan(pos, normal, tangent, template, decalScale, decalTexIndex, flags, initialAlpha)` |  | 62 |
| `editor.addDecalInstanceWithTanForceId(pos, normal, tangent, template, decalScale, decalTexIndex, flags, initialAlpha, index)` |  | 69 |
| `editor.createDecalTemplate()` |  | 18 |
| `editor.deleteDecalInstance(instance)` |  | 94 |
| `editor.deleteDecalTemplate(template)` |  | 34 |
| `editor.getClosestDecal(pos)` |  | 99 |
| `editor.getDecalDataFilePath()` |  | 10 |
| `editor.getDecalInstance(index)` |  | 76 |
| `editor.getDecalInstanceByUid(uid)` |  | 83 |
| `editor.getDecalInstanceVecSize()` |  | 90 |
| `editor.getDecalTemplates()` |  | 47 |
| `editor.hasDirtyDecalTemplates()` |  | 51 |
| `editor.isDecalDirty(decal)` |  | 108 |
| `editor.notifyDecalModified(instance)` |  | 103 |
| `editor.saveDecal(template)` |  | 112 |
| `editor.saveDecals()` |  | 116 |

## Appels vers le moteur (C++)

- `Sim.` `getUniqueName`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/decal.lua`.*
