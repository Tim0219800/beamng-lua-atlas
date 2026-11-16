# Procedure: moving the atlas to a new game version (planned for 0.41)

*[Version française : NOUVELLE_VERSION.md](NOUVELLE_VERSION.md)*

Example with `0.40.5` → `0.41.0`. Use the real number (the one shown by the game, without the last `.0`: `0.41.0.0` → `0.41.0`).
Run every command from the repository root.

## 0. Before the game update

Nothing mandatory: the 0.40.5 data is in the release (`donnees-0.40.5.zip`).
Just check that `donnees/0.40.5/statique.json` and `runtime_*.json` exist locally (otherwise unzip the archive).

## 1. Static extraction of the new version

```
python -I outils/extraire.py "D:/SteamLibrary/steamapps/common/BeamNG.drive" donnees/0.41.0/statique.json
```

Quick check: `python -I outils/voir.py donnees/0.41.0/statique.json` (number of modules, parse errors).
If `errors` is not empty, a new code pattern slipped past the tokenizer: fix `extraire.py` before going further.

## 2. In-game scan of the C++ bindings

1. Copy `outils/mod_releve/` to `%LOCALAPPDATA%/BeamNG/BeamNG.drive/current/mods/unpacked/tim19_atlas/`.
2. Start the game, load a map with a car, wait 5 s (or run `tim19Atlas_dump.run()` in the GE console).
3. Quit, remove the mod, then: `python -I outils/importer_releve.py 0.41.0`

## 3. API diff

```
python -I outils/comparer.py 0.40.5 0.41.0
```

Produces `donnees/0.41.0/diff-0.40.5.json` (read by the mod checker), `doc/0.41.0/changements.md` (English) and `doc/fr/0.41.0/changements.md` (French).
Read the printed summary: a very large number of removed + added modules means the folder layout changed
(moves are only detected when the access name is identical).

## 4. Carrying descriptions over

```
python -I outils/reporter_descriptions.py 0.40.5 0.41.0
```

- copies the descriptions in both languages (`descriptions/0.40.5/` in English, `descriptions/fr/0.40.5/` in French), follows moved modules, removes functions that disappeared;
- flags with `"aVerifier"` the functions whose parameters changed (shown as "⚠ To re-check" in the docs);
- writes `donnees/0.41.0/lots_nouveaux.json`: new or changed modules, in batches of 30.

## 5. Describing what is new

For each batch of `lots_nouveaux.json`, write descriptions following [`DESCRIPTION_GUIDELINES.md`](DESCRIPTION_GUIDELINES.md), replacing `0.40.5` with `0.41.0`, with two extra rules:
- if the description file already exists: **complete it** (added functions) instead of skipping it;
- for each function flagged `aVerifier`: re-read the code, fix the description and parameters, then **delete** the `aVerifier` field.

Descriptions exist in two languages: English (`descriptions/0.41.0/`, main language) and French
(`descriptions/fr/0.41.0/`). Write in one, then translate into the other while keeping exactly the same JSON structure
(same keys, same types; only the texts change).

Check: `grep -rl aVerifier descriptions/0.41.0 descriptions/fr/0.41.0` must return nothing.

## 6. Generation

```
python -I outils/generer.py 0.41.0              # English: stubs/0.41.0/ and doc/0.41.0/
python -I outils/generer.py 0.41.0 --lang fr    # French: stubs/fr/0.41.0/ and doc/fr/0.41.0/
```

Rebuilds the stubs and the docs (with `changements.md`, linked from the index). `stubs/fr/` is not tracked by git: it is only used for the release zip.

## 7. Site, README, changelog

- `mkdocs.yml`, `nav` section: add at the top
  ```yaml
    - 0.41.0:
        - Index: 0.41.0/index.md
        - Changes since 0.40.5: 0.41.0/changements.md
        - Hooks: 0.41.0/hooks.md
        - C++ objects: 0.41.0/cpp.md
  ```
  and the same under `Français` with `fr/0.41.0/...` paths. Keep 0.40.5 in the nav: modders who have not updated still need it.
- `README.md` / `README.fr.md`: covered version, `stubs/0.41.0/...` paths in the `.luarc.json` example, coverage table.
- `CHANGELOG.md`: new `0.41.0-1` entry with the diff summary (number of breaking changes, notable new modules).
- `doc/index.md` and `doc/fr/index.md`: link to the new version and to the changes page.

## 8. Checking installed mods

```
python -I outils/verifier_mod.py --mods-actifs --version 0.41.0
```

`[RETIRÉ]` entries are calls that will break for sure; `[INCONNU]` entries need to be checked one by one.
If a mod misbehaves in game and you don't know which one: `python -I outils/bissecter.py debut` (game closed).

## 9. Publishing

```
python -I outils/empaqueter.py 0.41.0
git add -A && git commit -m "Atlas 0.41.0"
git push
gh release create v0.41.0-1 dist/stubs-0.41.0.zip dist/stubs-0.41.0-fr.zip dist/donnees-0.41.0.zip --title "0.41.0-1" --notes-file <notes>
```

The site redeploys by itself (`Pages` workflow).
