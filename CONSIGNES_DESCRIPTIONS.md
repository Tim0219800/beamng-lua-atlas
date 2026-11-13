# Consignes de rédaction des descriptions (tim19Atlas)

But : documenter en détail l'API Lua de BeamNG.drive 0.40.5 à partir du **code du jeu uniquement**.
Code source (lecture seule, ne JAMAIS modifier) : `<BeamNG.drive>/lua/` (dossier d'installation du jeu).
Liste des fonctions déjà extraites automatiquement : `<atlas-lua>/doc/0.40.5/<chemin>.md`
(lire cette page d'abord : elle donne les fonctions exportées, les champs, les classes et méthodes d'instance, avec les lignes).

## Ce qu'on écrit

Un fichier JSON par fichier source :
`<atlas-lua>/descriptions/0.40.5/<chemin relatif à lua/>.json`
(ex. `lua/vehicle/electrics.lua` -> `descriptions/0.40.5/vehicle/electrics.json`). Utiliser l'outil Write (pas de heredoc).

```json
{
  "path": "lua/vehicle/electrics.lua",
  "module": "2 à 5 phrases : rôle du module, quand un moddeur s'en sert, ce qu'il lit/écrit.",
  "usage": "exemple Lua court et réaliste (facultatif, seulement si utile)",
  "notes": ["pièges, unités (m/s, rad, N·m, K…), ordre d'appel, valeurs spéciales"],
  "fields": {
    "values": {"type": "table<string, number|boolean>", "desc": "…"}
  },
  "functions": {
    "setIgnitionLevel": {
      "desc": "Ce que fait la fonction (1 à 3 phrases).",
      "params": {"ignitionLevel": {"type": "integer", "desc": "0 arrêt, 1 accessoires, 2 marche, 3 démarreur"}},
      "returns": [{"type": "boolean", "desc": "…"}],
      "internal": false
    }
  },
  "classes": {
    "device": {
      "desc": "Objet renvoyé par new(jbeamData) …",
      "functions": {"setIgnition": {"desc": "…", "params": {"value": {"type": "number", "desc": "…"}}}}
    }
  }
}
```

## Règles

1. **Français**, phrases courtes et concrètes. Les noms de code restent tels quels.
2. **Rien d'inventé** : chaque affirmation vient du code lu. Si le sens d'un paramètre est incertain, mettre `"type": "any"` et dire « (déduit du code) » ou ne rien dire.
3. Types au format LuaLS : `number`, `integer`, `string`, `boolean`, `table`, `table<string, number>`, `vec3`, `quat`, `function`, `nil`, unions `number|nil`, `any`.
4. Documenter **toutes** les fonctions exportées et toutes les méthodes des classes/instances listées dans la page .md, dans la limite du raisonnable : pour un fichier énorme, priorité aux fonctions utiles à un moddeur ; les autres peuvent n'avoir que `desc`.
5. `internal: true` pour ce qui est appelé seulement par le moteur ou la boucle principale (init, reset, updateGFX, onXxx appelés par main.lua…) ; dans ce cas `desc` dit quand c'est appelé.
6. Les hooks (`onXxx`) : dire quand ils sont appelés et avec quels arguments.
7. Si tu vois un bug ou une incohérence dans le code du jeu (champ exporté qui vaut nil, etc.), l'écrire dans `notes`.
8. JSON valide (UTF-8, guillemets doubles, pas de virgule finale). Vérifier chaque fichier avec `python -I -c "import json,sys;json.load(open(sys.argv[1],encoding='utf-8'))" <fichier>`.
9. Ne rien écrire ailleurs que dans `descriptions/0.40.5/`.

## Rapport final (court, ≤ 150 mots)

Nombre de fichiers écrits, fichiers non traités et pourquoi, bugs du jeu repérés.
