# `editor_renderTest`

*Fichier : `lua/ge/extensions/editor/renderTest.lua` · VM : Game Engine (GE) · 133 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_renderTest` : `extensions.load("editor_renderTest")`, puis la globale `editor_renderTest`

Outil de debug de l'éditeur (fenêtre « Render test ») destiné à afficher une vue de la scène rendue dans une texture (vues dessus/dessous/gauche/droite/avant/arrière/3d, ortho, near/far clip, fov, suivi du véhicule joueur) via renderCameraToTexture. Il est désactivé : le module exporte une table vide.

## Remarques

- Les exports M.onEditorInitialized et M.onEditorGui sont commentés dans le code (« renderCameraToTexture does not exist ») : l'extension ne fait donc rien.
- Dans onEditorGui, la variable locale « rot » est redéfinie (quatFromEuler(pi/2, 0, 0)) et masque celle calculée avant ; la vue est donc toujours la même.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/renderTest.lua`.*
