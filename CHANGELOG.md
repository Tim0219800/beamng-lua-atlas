# Changelog

## 0.40.5-3 (2026-11-16)

English becomes the main language of the atlas; French stays available as the secondary language.

- All 2507 module descriptions translated into English (`descriptions/0.40.5/`); the French originals moved to `descriptions/fr/0.40.5/`.
- Documentation generated in both languages: English in `doc/0.40.5/` (site root), French in `doc/fr/0.40.5/` (site section "Français").
- Stubs: English comments in `stubs/0.40.5/` and `stubs-0.40.5.zip`; French comments in the new release asset `stubs-0.40.5-fr.zip`.
- `generer.py` takes `--lang en|fr` (default `en`); every fixed label of the pages and stubs is translated.
- `comparer.py` writes the changes page in both languages; `reporter_descriptions.py` carries both description trees over.
- New English guides: `NEW_VERSION.md`, `DESCRIPTION_GUIDELINES.md` (French versions kept: `NOUVELLE_VERSION.md`, `CONSIGNES_DESCRIPTIONS.md`).

## 0.40.5-2 (2026-11-13)

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
