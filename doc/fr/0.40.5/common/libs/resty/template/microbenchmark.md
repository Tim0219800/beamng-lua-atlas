# `libs_resty_template_microbenchmark`

*Fichier : `lua/common/libs/resty/template/microbenchmark.lua` · VM : Commun (GE + véhicule) · 148 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/resty/template/microbenchmark")`

Bibliothèque tierce lua-resty-template : micro-benchmark du moteur (temps d'analyse, de compilation et d'exécution d'un petit gabarit en boucle). Outil de développement de la bibliothèque, sans usage pour un moddeur.

## Remarques

- Bug : la dernière boucle de `run` référence les tables `views` et `contexts` qui ne sont déclarées nulle part dans le fichier (variables globales nil) ; l'appel plante à la mesure « Execution Time ».
- Affiche via print (ou ngx.say) ; vide `template.cache` pendant la mesure de compilation.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_resty_template_microbenchmark.run(iterations)` | Exécute le benchmark : mesure `parse`, `compile` et l'exécution de gabarits sur `iterations` boucles et affiche les temps (os.clock). | 8 |

### Détail des paramètres

#### `libs_resty_template_microbenchmark.run(iterations)`

Exécute le benchmark : mesure `parse`, `compile` et l'exécution de gabarits sur `iterations` boucles et affiche les temps (os.clock).

- `iterations` (*integer|nil*) : Nombre d'itérations (défaut 1000).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/resty/template/microbenchmark.lua`.*
