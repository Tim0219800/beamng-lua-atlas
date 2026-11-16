# `bananabench_xml`

*Fichier : `lua/console/bananabench-xml.lua` · VM : Console · 197 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("bananabench-xml")`

Script de la VM console : lance bananabench sur une liste fixe de 9 véhicules (barstow, burnside, etki, fullsize, moonhawk, pessima, pickup, pigeon, pressure_ball) et écrit un rapport XML « performance » (report > test > result avec success, performance, executiontime, compiletime et métriques realtime/maxmbeams) dans bananabench.xml. Il définit aussi une petite classe globale `XML` (create, addChild, encode, toString) pour générer du XML.

## Remarques

- Probablement cassé avec la version actuelle de bananabench : `writeXML` lit `v.tests[1].res[dynamicCol]` et les champs `beamspersec`, alors que bananabench.lua renvoie des `res` plats {Mbeamspersec, percentRealtime, time, spawntime} (sans indice 1/2 ni champ beamspersec) ; l'accès à res[dynamicCol] vaut nil et provoque une erreur.
- Le script s'exécute au chargement ; la classe `XML` est une globale. Les variables `str` de XML:encode et XML:toString sont aussi globales (pas de `local`).
- Les attributs `mesure` et `unit` du rapport reprennent le format d'un outil de reporting de performance externe ; le champ executed vaut toujours 'yes' et passed 'yes' (l'analyse des logs est commentée).

## Classe `XML`

Petit constructeur de document XML (classe globale).

| Méthode | Description | Ligne |
|---|---|---|
| `XML:addChild(xml)` | Ajoute un nœud enfant. | dyn |
| `XML:create()` | Crée un nœud XML vide (name, attribs, children). | dyn |
| `XML:encode()` | Renvoie le document complet avec l'en-tête `<?xml version="1.0" encoding="UTF-8"?>`. | dyn |
| `XML:toString(indent)` | Sérialise le nœud et ses enfants avec indentation de 2 espaces. | dyn |

**Globales affectées :** `XML`

## Appels vers le moteur (C++)

- `obj:` `encode`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/console/bananabench-xml.lua`.*
