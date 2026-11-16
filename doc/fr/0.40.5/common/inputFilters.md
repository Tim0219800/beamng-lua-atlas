# `inputFilters`

*Fichier : `lua/common/inputFilters.lua` · VM : Commun (GE + véhicule) · 19 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("inputFilters")`

Définit des constantes globales identifiant le type de filtre d'entrée (clavier, manette, direct, clavier drift, IA) et la table FILTER_NAME qui donne un nom lisible. Utile quand on lit ou envoie des événements d'entrée (input.event) avec un filtre.

## Remarques

- Un filtre valant -1 peut être envoyé par le C++ : il est deviné et traduit côté moteur en un filtre >= 0 avant d'arriver en Lua (commentaire du code).
- FILTER_AI est la chaîne "FILTER_AI" (pas un nombre) et n'a pas d'entrée dans FILTER_NAME.

**Globales affectées :** `FILTER_AI`, `FILTER_DIRECT`, `FILTER_KBD`, `FILTER_KBD2`, `FILTER_NAME`, `FILTER_PAD`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/inputFilters.lua`.*
