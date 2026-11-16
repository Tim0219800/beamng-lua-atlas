# `gameplay_rally_recce_cutsRecording`

*Fichier : `lua/ge/extensions/gameplay/rally/recce/cutsRecording.lua` · VM : Game Engine (GE) · 79 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_recce_cutsRecording` : `extensions.load("gameplay_rally_recce_cutsRecording")`, puis la globale `gameplay_rally_recce_cutsRecording`

Chargeur des « cuts » de reconnaissance (recce) d'un rallye. Un cut est un marqueur de position où le copilote a fait un enregistrement vocal pendant la reconnaissance. Le module lit le fichier des cuts de la mission et y rattache, si elles existent, les transcriptions du fichier de transcripts. C'est une extension (gameplay_rally_recce_cutsRecording), utilisée par la classe recce.

## Remarques

- Les chemins des fichiers viennent de rallyUtil.cutsFile(missionDir) et rallyUtil.transcriptsFile(missionDir) ; les deux fichiers sont au format JSONL (une ligne = un objet).
- Une transcription n'est retenue que si son cutId est un nombre > 0 ; elle est rattachée au cut dont l'id est égal.
- Le word_map de normalisation est actuellement un tableau vide (TODO dans le code : à rebrancher quand le travail sur le texte libre reprendra), donc le texte n'est pas modifié en pratique.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_recce_cutsRecording.load(missionDir)` | Charge les cuts de la mission avec leurs transcriptions. Chaque ligne du fichier de cuts devient un objet dont pos est converti en vec3 et quat en quat, avec un champ transcript ajouté ({error, text} si une transcription existe, sinon table vide). | 36 |

### Détail des paramètres

#### `gameplay_rally_recce_cutsRecording.load(missionDir)`

Charge les cuts de la mission avec leurs transcriptions. Chaque ligne du fichier de cuts devient un objet dont pos est converti en vec3 et quat en quat, avec un champ transcript ajouté ({error, text} si une transcription existe, sinon table vide).

- `missionDir` (*string*) : Dossier de la mission contenant les fichiers de recce
- **renvoie** : table[] Tableau d'objets cut ; tableau vide (et non nil) si le fichier de cuts n'existe pas

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/recce/cutsRecording.lua`.*
