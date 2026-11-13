# `editor_cefHelper`

*Fichier : `lua/ge/extensions/editor/cefHelper.lua` · VM : Game Engine (GE) · 23 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_cefHelper` : `extensions.load("editor_cefHelper")`, puis la globale `editor_cefHelper`

Petit outil prévu pour masquer l'interface CEF (scenetree.maincef) quand l'éditeur imgui est actif. Dans la version 0.40.5 le code est commenté (« disabled for release due to bugs with the track editor »), donc le module ne fait rien.

## Remarques

- Les deux hooks sont vides : les lignes scenetree.maincef.visible = true/false sont en commentaire.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_cefHelper.onEditorActivated()` | Appelé à l'activation de l'éditeur. Devrait cacher l'UI CEF mais est désactivé (corps commenté). *(interne)* *(hook)* | 14 |
| `editor_cefHelper.onEditorDeactivated()` | Appelé à la désactivation de l'éditeur. Devrait réafficher l'UI CEF mais est désactivé (corps commenté). *(interne)* *(hook)* | 9 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/cefHelper.lua`.*
