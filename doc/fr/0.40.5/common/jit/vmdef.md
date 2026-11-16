# `jit_vmdef`

*Fichier : `lua/common/jit/vmdef.lua` · VM : Commun (GE + véhicule) · 399 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jit/vmdef")`

Fichier généré (« DO NOT EDIT ») de LuaJIT : tables de noms internes utilisées par les modules jit.dump, jit.bc, jit.v et le profileur pour afficher bytecodes, instructions IR, fonctions rapides (fast functions) et causes d'abandon de trace. Le fichier vérifie au chargement que jit.version == « LuaJIT 2.1.1788767029 », sinon l'assertion échoue (« LuaJIT core/library version mismatch »). Un moddeur n'a normalement aucune raison de l'utiliser.

## Remarques

- L'assertion de version lie ce fichier au LuaJIT embarqué ; ne pas le remplacer par une autre version.
- bcnames et irnames sont de longues chaînes de noms à largeur fixe (6 caractères) et non des tables.

## Champs

| Champ | Type | Description |
|---|---|---|
| `bcnames` | string | Noms des opcodes de bytecode LuaJIT concaténés (6 caractères chacun). |
| `ffnames` | table | Noms des fonctions rapides (fast functions) de LuaJIT. |
| `ircall` | table | Noms des fonctions C appelées depuis l'IR. |
| `irfield` | table | Noms des champs de structures pour l'IR (FLOAD/XLOAD). |
| `irfpm` | table | Noms des fonctions math pour FPMATH. |
| `irnames` | string | Noms des opcodes de la représentation intermédiaire (IR) concaténés. |
| `traceerr` | table | Messages d'erreur des traces abandonnées. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jit/vmdef.lua`.*
