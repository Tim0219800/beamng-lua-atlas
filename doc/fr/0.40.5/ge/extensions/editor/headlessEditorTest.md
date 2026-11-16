# `editor_headlessEditorTest`

*Fichier : `lua/ge/extensions/editor/headlessEditorTest.lua` · VM : Game Engine (GE) · 92 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_headlessEditorTest` : `extensions.load("editor_headlessEditorTest")`, puis la globale `editor_headlessEditorTest`

Exemple de développement du mode « headless » de l'éditeur (masque menus et barres d'outils pour n'afficher que son propre outil). Le module n'exporte ses hooks que si shipping_build est faux : en build de production, il est vide. Il montre comment entrer/sortir du mode (editor.enableHeadless), dessiner sa propre barre de menu via onEditorHeadlessMainMenuBar et ouvrir une fenêtre d'outil et une barre d'outils flottante.

## Exemple

```lua
-- activer le mode headless pour un outil
editor.enableHeadless(true, 'myHeadlessTool')
-- le désactiver
editor.enableHeadless(false, 'myHeadlessTool')
```

## Remarques

- Aucune fonction n'est exportée en build de production (shipping_build) : les hooks ne sont définis que hors shipping.
- Le nom d'outil (« myHeadlessTool ») doit être unique ; les fonctions n'agissent que si editor.isHeadlessToolActive(toolName) est vrai.
- Le menu s'appelle « Headless Editor Test » (groupe Debug) ; les boutons de la barre d'outils ne font que des print.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/headlessEditorTest.lua`.*
