# `cdefDebugDraw`

*Fichier : `lua/common/cdefDebugDraw.lua` · VM : Commun (GE + véhicule) · 20 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("cdefDebugDraw")`

Déclarations FFI (ffi.cdef) des fonctions C++ de dessin de debug (BNG_DBG_DRAW_*) : sphère, cylindre, ligne, texte, prisme carré, triangle plein et versions par lots (batch). Ne s'exécute que si ffi est disponible. Un moddeur n'appelle normalement pas ces symboles directement : on passe par l'API debugDrawer.

## Remarques

- Le fichier ne définit aucune fonction Lua ni aucun champ : uniquement un ffi.cdef.
- Les couleurs sont passées en entier non signé packé (packedCol).
- Déclare aussi le typedef Vector3 {float x, y, z}.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/cdefDebugDraw.lua`.*
