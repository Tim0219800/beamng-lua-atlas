# `gameplay_rally_enums`

*Fichier : `lua/ge/extensions/gameplay/rally/enums.lua` · VM : Game Engine (GE) · 86 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_enums` : `extensions.load("gameplay_rally_enums")`, puis la globale `gameplay_rally_enums`

Énumérations partagées du système de rallye (notes de copilote) : mode audio des pacenotes, type de déclenchement (trigger), type de relâchement pour les virages lents, avec leurs noms lisibles. Ce sont des tables de constantes consultées par l'éditeur de notes et par le moteur de rallye ; le fichier ne contient aucune fonction.

## Remarques

- Les valeurs numériques sont persistées dans les carnets de notes : ne pas les renuméroter.
- Plusieurs valeurs de triggerType et de slowCornerReleaseType sont commentées dans le code (csStatic, csHalf, ceMinus5, ceStatic pour triggerType) et donc indisponibles.
- slowCornerReleaseType : écarts de 10 en 10 (10 à 50) ; csHalf (30) est la valeur par défaut d'après son libellé.

## Champs

| Champ | Type | Description |
|---|---|---|
| `pacenoteAudioMode` | table<string, integer> | Modes audio : auto=1, freeform=2, structuredOnline=3, structuredOffline=4, custom=5. |
| `pacenoteAudioModeDisplayNames` | table<integer, string> | Noms affichés à l'utilisateur (éditeur, debug) ; structuredOffline s'affiche 'structured'. |
| `pacenoteAudioModeHidden` | table<string, boolean> | Modes masqués dans les listes de choix (freeform, structuredOnline) mais toujours fonctionnels pour les carnets existants. |
| `pacenoteAudioModeNames` | table<integer, string> | Nom technique de chaque mode audio, indexé par valeur. |
| `slowCornerReleaseType` | table<string, integer> | Moment de relâche d'une note de virage lent : csStaticMinus40=10, csStatic=20, csHalf=30, ceMinus5=40, ceStatic=50. |
| `slowCornerReleaseTypeName` | table<integer, string> | Libellés correspondants (ex. '40m before corner start', 'at corner end'). |
| `triggerType` | table<string, integer> | Types de déclenchement d'une note : dynamic=1, csImmediate=15. |
| `triggerTypeName` | table<integer, string> | Libellés des types de déclenchement ('dynamic (default)', 'immediate (only use for first pacenote)'). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/enums.lua`.*
