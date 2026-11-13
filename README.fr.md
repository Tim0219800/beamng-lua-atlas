# tim19Atlas : atlas de l'API Lua de BeamNG.drive

*[English version: README.md](README.md)* · **Consulter en ligne : https://tim0219800.github.io/beamng-lua-atlas/**

Documentation détaillée de l'API Lua de BeamNG.drive et stubs LuaLS pour l'autocomplétion dans VS Code.
Tout est généré à partir du code Lua fourni avec le jeu (lecture seule) et d'un relevé en jeu des liaisons C++.

**Version couverte : 0.40.5.0 (build 302427).**

> Projet non officiel, sans lien avec BeamNG GmbH.

## Contenu

| Dossier | Contenu |
|---|---|
| [`doc/0.40.5/index.md`](doc/0.40.5/index.md) | Point d'entrée : tous les modules par VM (véhicule, GE, commun), avec liens |
| [`doc/0.40.5/hooks.md`](doc/0.40.5/hooks.md) | Les 838 hooks : qui les émet, qui les écoute |
| [`doc/0.40.5/cpp.md`](doc/0.40.5/cpp.md) | Classes et modules C++ exposés au Lua (`obj`, `be`, `Engine.*`, objets de scène…) |
| `stubs/0.40.5/lua/...` | Stubs `---@meta` pour LuaLS, même arborescence que le dossier `lua/` du jeu |
| `stubs/0.40.5/cpp/ge.lua`, `cpp/vehicle.lua` | Stubs des objets C++ |
| `descriptions/0.40.5/` | Descriptions rédigées (JSON), fusionnées par le générateur |
| `donnees-0.40.5.zip` (fichier de la release) | Données brutes : extraction statique et relevés en jeu, nécessaires pour régénérer |
| `outils/` | Les outils : `extraire.py`, `generer.py`, `importer_releve.py`, `mod_releve/` |

### Couverture

| Couche | Modules décrits (✍) | Fonctions documentées |
|---|---|---|
| Véhicule | 239 / 242 | 1664 / 1667 |
| Commun (GE + véhicule) | 87 / 188 | 412 / 869 |
| GE | 234 / 2060 | 2394 / 11506 |

Côté GE, la rédaction couvre ce que les moddeurs utilisent le plus : `utils`, `mathlib` (vec3, quat), `extensions`, `guihooks`, jbeam,
`ge/main`, `map`, `spawn`, tous les `core_*`, `freeroam`, `scenario`, `render`, `mcp`.
Les autres modules ont une page automatique : fonctions exportées avec paramètres, champs, classes, hooks et commentaires d'origine.

Côté C++ (relevé en jeu) : 103 classes d'instance en GE (dont 76 types d'objets de scène, par exemple `BeamNGVehicle` et ses 300 méthodes),
39 modules C++ avec leurs sous-modules (`Engine.Render`, `Engine.Audio`, `Engine.imgui`…), et `obj` (`BeamObject`, 347 méthodes) dans la VM véhicule.

## Utiliser les stubs dans VS Code

1. Installer l'extension **Lua** (sumneko / LuaLS).
2. Télécharger `stubs-0.40.5.zip` dans la [dernière release](https://github.com/Tim0219800/beamng-lua-atlas/releases/latest) et le décompresser, ou cloner ce dépôt, par exemple dans `C:/dev/tim19Atlas`.
3. À la racine du mod, créer `.luarc.json`. Pour du Lua **véhicule** :

```json
{
  "runtime.version": "LuaJIT",
  "workspace.library": [
    "C:/dev/tim19Atlas/stubs/0.40.5/lua/vehicle",
    "C:/dev/tim19Atlas/stubs/0.40.5/lua/common",
    "C:/dev/tim19Atlas/stubs/0.40.5/cpp/vehicle.lua"
  ],
  "runtime.path": ["?.lua", "?/init.lua"],
  "diagnostics.globals": ["obj", "v"]
}
```

Pour du Lua **GE** : remplacer `lua/vehicle` par `lua/ge` et `cpp/vehicle.lua` par `cpp/ge.lua`.
Ne pas mélanger `ge` et `vehicle` : les deux VM sont séparées dans le jeu (une extension véhicule ne voit pas `core_vehicles`, par exemple).

## Régénérer pour une nouvelle version du jeu

Décompresser d'abord `donnees-<version>.zip` de la release dans `donnees/` (le dossier n'est pas suivi par git).

```
python -I outils/extraire.py "<dossier d'installation de BeamNG.drive>" donnees/<version>/statique.json
python -I outils/importer_releve.py <version>     # après une partie avec le mod tim19_atlas
python -I outils/generer.py <version>
```

Relevé en jeu : copier `outils/mod_releve/` dans `mods/unpacked/tim19_atlas/` du dossier utilisateur de BeamNG, lancer le jeu et charger une carte avec une voiture.
Cinq secondes plus tard, il écrit `atlas_dump/ge.json` et `atlas_dump/vehicle.json` dans le dossier utilisateur. Il ne modifie rien dans le jeu.
On peut le relancer depuis la console GE : `tim19Atlas_dump.run()`. Retirer le mod ensuite.

Pour rédiger de nouvelles descriptions : suivre [`CONSIGNES_DESCRIPTIONS.md`](CONSIGNES_DESCRIPTIONS.md).

## Fiabilité

- **Signatures, lignes, hooks, dépendances** : extraits du code, fiables.
- **Descriptions marquées ✍** : rédigées en lisant le code ; les types sont déduits. La ligne source est toujours donnée : la vérifier en cas de doute.
- **Classes C++** : noms et méthodes exacts, relevés dans le jeu en marche. Les paramètres C++ ne sont pas visibles depuis le Lua : les stubs les déclarent en `...`.
- **Bugs du jeu** : plusieurs centaines d'incohérences relevées à la lecture sont listées dans les « Remarques » de chaque module,
  et 69 exports qui pointent vers des fonctions inexistantes sont marqués ⚠. Seuls quelques-uns ont été vérifiés à la main.

## Suite prévue

1. Diff d'API entre versions du jeu (relancer l'extraction à chaque mise à jour et comparer les `statique.json`).
2. Vérificateur de mods : conflits de fichiers, appels à des fonctions disparues, bissection.
3. Descriptions rédigées pour `gameplay` (trafic, police, missions).

## Licence

- `doc/`, `stubs/`, `descriptions/`, `donnees/` : dérivés du code Lua de BeamNG GmbH, distribués sous
  **bCDDL 1.1** (licence de BeamNG pour son code Lua, copie dans [`LICENSE`](LICENSE)). Contributeur : Tim0219800.
- `outils/` : **MIT** ([`LICENSE-tools`](LICENSE-tools)).

BeamNG et BeamNG.drive sont des marques de BeamNG GmbH.
