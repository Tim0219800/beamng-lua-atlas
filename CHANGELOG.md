# Changelog

## Unreleased (0.40.5, next release)

- Written descriptions (French) now cover all 2507 modules (was 560): every GE, common, vehicle and console file, including the flowgraph nodes, the editor tools, career, gameplay, UI router and bundled third-party libraries.
- New tools: `comparer.py` (API diff between versions, generates `changements.md`), `reporter_descriptions.py` (carries descriptions over, flags changed signatures),
  `verifier_mod.py` (mod checker), `bissecter.py` (mod bisection). Procedure for the next game version in `NOUVELLE_VERSION.md`.
- Generator: descriptions flagged `aVerifier` are shown as "⚠ À revérifier"; line breaks inside parameter/return descriptions no longer break the stubs.
- GitHub Actions upgraded to checkout/setup-python/setup-node v7 (Node 24) and Pages actions v5/v6; CI also checks that the tools compile.

## 0.40.5-1 (2026-11-13)

First release, for BeamNG.drive 0.40.5.0 (build 302427).

- Static extraction of the 2507 Lua files of the game: 13,585 exported functions, fields, classes, instance methods, 838 hooks.
- LuaLS `---@meta` stubs for every module (2509 files, syntax-checked).
- Written descriptions (French) for 560 modules: the whole vehicle layer, and the most used GE and common modules
  (`utils`, `mathlib`, `extensions`, jbeam, `ge/main`, `map`, `spawn`, `core_*`, `freeroam`, `scenario`, `render`, `mcp`).
- In-game scan of the C++ bindings: 103 instance classes (76 scene object types), 39 C++ modules with sub-modules,
  `obj` (`BeamObject`, 347 methods) in the vehicle VM.
- Game bugs found while reading the code are listed in each module's "Remarques" section; 69 exports pointing to undefined functions are flagged with ⚠.
