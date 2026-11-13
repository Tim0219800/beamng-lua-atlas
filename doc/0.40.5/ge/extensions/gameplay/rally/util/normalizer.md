# `gameplay_rally_util_normalizer`

*Fichier : `lua/ge/extensions/gameplay/rally/util/normalizer.lua` · VM : Game Engine (GE) · 24 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_util_normalizer` : `extensions.load("gameplay_rally_util_normalizer")`, puis la globale `gameplay_rally_util_normalizer`

Petit utilitaire de normalisation de texte pour les notes du rallye : applique successivement une liste de remplacements (motif, remplacement) à une chaîne.

## Remarques

- Les motifs `from` sont passés à string.gsub : ce sont des motifs Lua (pas des chaînes littérales), les caractères spéciaux comme `-`, `%` ou `.` doivent être échappés.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_util_normalizer.replaceWords(word_map, note)` | Applique dans l'ordre chaque paire {from, to} de word_map à la note via gsub et renvoie la note transformée. Si note vaut nil, la renvoie telle quelle. | 7 |

### Détail des paramètres

#### `gameplay_rally_util_normalizer.replaceWords(word_map, note)`

Applique dans l'ordre chaque paire {from, to} de word_map à la note via gsub et renvoie la note transformée. Si note vaut nil, la renvoie telle quelle.

- `word_map` (*table<integer, string[]>*) : Liste de paires {motif, remplacement}.
- `note` (*string|nil*) : Texte à normaliser.
- **renvoie** : string|nil Texte après remplacements, ou nil si note était nil.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/util/normalizer.lua`.*
