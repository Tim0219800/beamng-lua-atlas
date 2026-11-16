# `flowgraph_nodes_ui_updatedUI_startScreenRallySettings`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua` · VM : Game Engine (GE) · 321 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings")` (fichier sous extensions/ mais pas une extension classique)

Nœud « StartScreen Rally Settings » (repeat_instant, couleur ui). Ajoute à l'écran de démarrage d'une mission de rallye un panneau « coDriverSelector » : choix du copilote (voicepack), case des notes visuelles et réglages booléens (rallyRepairVehicleOnRecovery, rallyEnableFalseStarts, rallyEnableEarlyTimeControlPenalties). Joue un échantillon audio du copilote choisi. Les choix sont mémorisés en attente et appliqués au clic sur Start (hook onUIStartButtonClicked). Gère aussi le mode « rallyLoop ». Entrée flow, sortie flow (chainFlow).

## Remarques

- Les fonctions locales du fichier gèrent l'échantillon audio : intercomCheckAudioObjs, composedSampleAudioObjs, recordedSampleAudioObjs (mission de référence automation_test_track/rallyStage/002-mixedstage, pacenote_27.ogg).
- Le fichier dépend de gameplay/rally/voicepack, util, audioManager et compositors/helpers/textCompositor.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Vide pendingValue et pendingSettings. | 115 |
| `C:applyPick(value)` | Applique le choix de copilote : enregistre rallyVoicepackPick (boucle) ou recharge les assets du voicepack via rm:reloadVoicepackAssets ; logue une erreur en cas d'échec. | 290 |
| `C:buildBoolSettings(mission)` | Renvoie les réglages booléens de la mission retenus dans settingKeys, avec la valeur en attente si elle existe. | 154 |
| `C:buildLoopOptions(loopManager)` | Construit la liste des copilotes pour une mission de boucle rallye (label, value, shortLabel, detail) et la valeur sélectionnée ; renvoie nil si rien n'est disponible. | 125 |
| `C:buildStageOptions(rm)` | Idem pour une spéciale rallye standard à partir du rally manager. | 140 |
| `C:getMission(loopManager)` | Renvoie la mission rallye de la boucle (loopManager:getRallyLoopMission()) ou, sans boucle, l'activité du gestionnaire. | 120 |
| `C:init()` | Crée le panneau {type='coDriverSelector', ...} et vide les choix en attente. | 102 |
| `C:onCoDriverSelectedByPanel(value)` | Appelé par le panneau quand un copilote est choisi : mémorise le choix et joue un échantillon (composé, enregistré ou test d'interphone). | 236 |
| `C:onRallyStartSettingChanged(key, value)` | Appelé quand un réglage booléen change : met à jour pendingSettings, mission.lastUserSettings et le panneau. Accepte soit (key, value), soit une table {key, value}. | 252 |
| `C:onUIStartButtonClicked()` | Hook appelé au clic sur Start : coupe l'audio, écrit les réglages en attente via settings.setValue et applique le copilote choisi (applyPick). | 276 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` | Appelé chaque frame comme extension ; fait avancer la file audio de l'échantillon. | 232 |
| `C:onVisualPacenotesChangedByPanel(value)` | Appelé quand la case notes visuelles change ; mémorise rallyVisualPacenotes en attente. | 243 |
| `C:playSample(entry, audioObjs)` | Réinitialise la file audio d'échantillon puis y met les objets audio donnés (timing du voicepack de l'entrée). | 224 |
| `C:resolveEntry(value)` | Retrouve l'entrée de voicepack correspondant à la valeur choisie (mode boucle ou spéciale). | 214 |
| `C:work()` | Construit le panneau (options de copilote, sélection, notes visuelles, réglages booléens, note de boucle) et l'ajoute à l'UI, puis joue le test d'interphone du copilote sélectionné. Sans rally manager ou sans option, logue un avertissement et saute le panneau. | 173 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua`.*
