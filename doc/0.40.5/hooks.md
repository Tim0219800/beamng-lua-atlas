# Hooks — BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)

Un hook est une fonction `M.onXxx` d'une extension, appelée par `extensions.hook("onXxx", ...)`. 
« Émis par » = modules Lua qui le déclenchent ; s'il est vide, il est appelé par le moteur C++ ou par du code construit dynamiquement.

## Game Engine (GE) (749)

| Hook | Émis par | Écouté par |
|---|---|---|
| `asyncGameplaySelectorLoadComplete` | `util_asyncBulkLoader` |  |
| `asyncLevelLoadComplete` | `util_asyncBulkLoader` |  |
| `asyncVehicleLoadComplete` | `util_asyncBulkLoader` |  |
| `dragRaceEndLineReached` | `gameplay_drag_phaseHandlers` |  |
| `dragRaceStarted` | `gameplay_drag_phaseHandlers` |  |
| `dragRaceVehicleStopped` | `gameplay_drag_phaseHandlers` |  |
| `dynamicDecals_moveLayer` | `editor_api_dynamicDecals` |  |
| `dynamicDecals_onLayerAdded` | `editor_api_dynamicDecals` |  |
| `dynamicDecals_onLayerDeleted` | `editor_api_dynamicDecals` |  |
| `dynamicDecals_onLayerUpdated` | `editor_api_dynamicDecals` |  |
| `dynamicDecals_onTextureFileAdded` | `editor_api_dynamicDecals_textures` |  |
| `dynamicDecals_onTextureFileDeleted` | `editor_api_dynamicDecals_textures` |  |
| `dynamicDecals_setLayer` | `editor_api_dynamicDecals` |  |
| `on` | `flowgraph_nodes_gameplay_rally_fireRallyEvent` |  |
| `onActionEvent` | *moteur* | 1 : `core_vehicleTriggers` |
| `onActionFilterUpdated` | `core_input_actionFilter` | 2 : `core_nodegrabberGamepad`, `ui_bindingsLegend` |
| `onActivateBigMapCallback` | `freeroam_bigMapMode` | 1 : `career_modules_tutorial_step07bigmap` |
| `onActivate_` | *moteur* | 1 : `editor_meshEditor` |
| `onActivityAcceptGatherData` | `gameplay_markerInteraction` | 7 : `career_modules_delivery_general`, `career_modules_inspectVehicle`, `core_sounds`, `freeroam_facilities`, `freeroam_gasStations` … |
| `onActivityAcceptUpdate` | `ui_missionInfo` |  |
| `onActivityIndexVisible` | `ui_missionInfo` | 1 : `gameplay_crawl_general` |
| `onAddWaypoint` | *moteur* | 1 : `map` |
| `onAddedVehiclePartsToInventory` | `career_modules_partInventory` | 1 : `career_modules_vehicleShopping` |
| `onAfterDriftSpotsLoaded` | `gameplay_drift_saveLoad` |  |
| `onAfterRouteChange` | *moteur* | 6 : `core_gamestate`, `core_input_bindings`, `gameplay_multiseat_gamemodeManager`, `render_splitScreen`, `telemetry_trackers_ui` … |
| `onAiModeChange` | `main` |  |
| `onAiRouteDone` | `main` | 1 : `gameplay_taxi` |
| `onAllUiReady` | `ui_uiStateManager` |  |
| `onAnyMissionChanged` | `gameplay_missions_missionManager`, `telemetry_trackers_performanceSpatial` | 19 : `career_career`, `career_modules_delivery_general`, `career_modules_inspectVehicle`, `career_modules_milestones_generalMilestones_missions`, `career_modules_missionWrapper` … |
| `onAnyMissionWillChange` | `gameplay_missions_missionManager` | 2 : `gameplay_rallyLoop`, `telemetry_trackers_gameplay_missions` |
| `onAnyStuntZoneAccomplished` | `gameplay_drift_stuntZones_donut`, `gameplay_drift_stuntZones_driftThrough`, `gameplay_drift_stuntZones_hitPole`, `gameplay_drift_stuntZones_nearPole` | 3 : `gameplay_drift_drift`, `gameplay_drift_scoring`, `gameplay_drift_stuntZones` |
| `onApply` | *moteur* | 3 : `core_settings_lightingQuality`, `core_settings_terrainQuality`, `core_settings_textureQuality` |
| `onApplyMultiseatGameSettings` | `ui_multiseat_multiseatSettings` | 1 : `ui_multiseat_generalSettings` |
| `onAtStop` | *moteur* | 1 : `core_busRouteManager` |
| `onAttemptCompleted` | `scenario_scenarios` | 1 : `util_richPresence` |
| `onAttemptFailed` | `scenario_scenarios` | 1 : `util_richPresence` |
| `onAudioOutputDeviceChanged` | *moteur* | 1 : `telemetry_trackers_hardware` |
| `onAvailableMissionsSentToUi` | `gameplay_missions_missionScreen` | 1 : `career_modules_inventory` |
| `onAxisGizmoAlignmentChanged` | *moteur* | 1 : `editor_ezObjectSelect_controller` |
| `onAxisGizmoModeChanged` | *moteur* | 1 : `editor_ezObjectSelect_controller` |
| `onBananaBenchReady` | *moteur* | 1 : `core_hardwareinfo` |
| `onBeamNGTrigger` | `main` | 8 : `campaign_photoSafari`, `career_modules_vehiclePerformance`, `core_busRouteManager`, `freeroam_dragRace`, `freeroam_specialTriggers` … |
| `onBeamNGWaypoint` | `main` |  |
| `onBeforeBigMapActivated` | `freeroam_bigMapMode` | 2 : `core_quickAccess`, `freeroam_crashCamMode` |
| `onBeforeCareerActivate` | `career_career` | 1 : `gameplay_speedTrapLeaderboards` |
| `onBeforeDragUnloadAllExtensions` | `gameplay_drag_core` | 1 : `gameplay_drag_display` |
| `onBeforeMenuOpened` | `ui_menuManager` | 1 : `freeroam_crashCamMode` |
| `onBeforeMountEntry` | `core_modmanager` |  |
| `onBeforeRadialOpened` | `core_quickAccess` | 3 : `career_modules_testDrive`, `core_recoveryPrompt`, `gameplay_freeformDelivery_freeformDelivery` |
| `onBeforeSetProfile` | `career_saveSystem` | 1 : `career_career` |
| `onBeforeVehicleReplaced` | `core_vehicles` | 3 : `core_devices`, `core_nodegrabberGamepad`, `gameplay_seatOccupants` |
| `onBeforeVehicleSell` | `career_modules_inventory` | 1 : `telemetry_trackers_career` |
| `onBeforeWalkingModeToggled` | `gameplay_walk` | 2 : `career_modules_inventory`, `gameplay_seatOccupants` |
| `onBigMapActivated` | `freeroam_bigMapMode` | 2 : `career_modules_inventory`, `gameplay_missions_missionScreen` |
| `onBigmapBuildCustomGroupStructures` | `freeroam_vueBigMap` | 1 : `gameplay_freeformDelivery_routes` |
| `onBigmapBuildGroupData` | `freeroam_vueBigMap` | 1 : `gameplay_freeformDelivery_routes` |
| `onBigmapHoveredPoiIdChanged` | `freeroam_bigMapMode` | 1 : `career_modules_delivery_cargoScreen` |
| `onBigmapStartTransition` | `freeroam_bigMapMode` |  |
| `onBoundaryViolation` | *moteur* | 1 : `gameplay_crawl_utils` |
| `onBranchTierReached` | `career_modules_milestones_generalMilestones_branches` | 1 : `career_modules_delivery_progress` |
| `onBusUpdate` | *moteur* | 2 : `core_busRouteManager`, `scenario_busdriver` |
| `onCameraChanged` | `core_cameraUpdate` | 3 : `gameplay_seatOccupants`, `gameplay_walk`, `ui_appLayouts` |
| `onCameraHandlerSet` | `server/commands` |  |
| `onCameraHandlerSetInitial` | *moteur* | 1 : `serverConnection` |
| `onCameraModeChanged` | `core_camera`, `core_cameraModes_observer` | 3 : `career_career`, `core_nodegrabberGamepad`, `scenario_scenarios` |
| `onCameraPreRender` | `core_cameraUpdate` | 1 : `freeroam_bigMapMode` |
| `onCameraReset` | `core_camera` |  |
| `onCameraToggled` | `core_camera`, `server/commands` | 1 : `core_camera` |
| `onCareerActivated` | *moteur* | 18 : `career_modules_debug_cargoFluidDebug`, `career_modules_debug_deliveryRoutes`, `career_modules_debug_marketplaceDebug`, `career_modules_debug_parcelDebug`, `career_modules_debug_vehOfferDebug` … |
| `onCareerActive` | `career_career` | 27 : `career_branches`, `career_career`, `career_modules_branches_leagues`, `career_modules_delivery_general`, `career_modules_fuel` … |
| `onCareerPaintingStarted` | *moteur* | 1 : `career_modules_delivery_general` |
| `onCareerProgressPageGetTasklistData` | `career_modules_branches_landing` | 1 : `career_modules_delivery_tutorial` |
| `onCareerTuningApplied` | `career_modules_tuning` |  |
| `onCareerTuningStarted` | `career_modules_tuning` | 1 : `career_modules_delivery_general` |
| `onCareerTutorialAdvancedOrDragSelection` | *moteur* | 1 : `career_modules_tutorial_step04timeTrial` |
| `onCareerTutorialLeftBounds` | `career_modules_tutorial_debug`, `gameplay_tutorial_bounds` | 8 : `career_modules_tutorial_step01enterVehicle`, `career_modules_tutorial_step02moveOff`, `career_modules_tutorial_step03basicManeuvers`, `career_modules_tutorial_step04timeTrial`, `career_modules_tutorial_step05driveToDragStrip` … |
| `onCareerTutorialOutOfBoundsEnded` | `gameplay_tutorial_bounds` | 1 : `gameplay_tutorial_damageTracker` |
| `onCareerTutorialOutOfBoundsStarted` | `gameplay_tutorial_bounds` | 1 : `gameplay_tutorial_damageTracker` |
| `onCareerTutorialOutOfBoundsTimedOut` | `gameplay_tutorial_bounds` | 1 : `career_modules_tutorial_step04timeTrial` |
| `onCareerTutorialRedeemedContractVoucher` | *moteur* | 1 : `career_modules_tutorial_step09spmSignup` |
| `onCargoDelivered` | *moteur* | 1 : `career_modules_delivery_progress` |
| `onCargoGenerated` | `career_modules_delivery_parcelManager` | 1 : `career_modules_delivery_cargoScreen` |
| `onCargoOverviewRouteLeave` | *moteur* | 1 : `career_modules_delivery_cargoScreen` |
| `onCargoPickedUp` | *moteur* | 1 : `career_modules_delivery_cargoScreen` |
| `onCefVisibilityChanged` | `ui_visibility` | 2 : `core_nodegrabberGamepad`, `core_vehicleTriggers` |
| `onChangeDestinationCalled` | *moteur* | 1 : `gameplay_taxi` |
| `onChangeFlowRate` | *moteur* | 2 : `career_modules_debug_cargoContainerDebug`, `career_modules_fuel` |
| `onChangeUiFilter` | *moteur* | 1 : `freeroam_bigMapMode` |
| `onCheckPermission` | `career_modules_permissions` | 2 : `career_modules_delivery_general`, `career_modules_inventory` |
| `onCheckPointPassed` | *moteur* | 1 : `core_hotlapping` |
| `onClientCustomObjectSpawning` | `server/server` | 2 : `core_audioForest`, `core_audioRibbon` |
| `onClientEndMission` | `main` | 83 : `career_career`, `career_modules_fuel`, `core_audio`, `core_audioForest`, `core_audioRibbon` … |
| `onClientPostStartMission` | `flowgraph_nodes_util_loadLevel`, `main` | 15 : `career_career`, `core_cameraUpdate`, `core_celestial`, `core_environment`, `core_levels` … |
| `onClientPreEndMission` | `main`, `telemetry_trackers_performanceSpatial` |  |
| `onClientPreStartMission` | `main` | 6 : `core_audio`, `core_checkpoints`, `core_environment`, `freeroam_freeroam`, `gameplay_garageMode` … |
| `onClientStartMission` | `flowgraph_nodes_util_loadLevel`, `gameplay_missions_missionManager`, `main` | 40 : `career_modules_vehicleDeletionService`, `core_busRouteManager`, `core_environment`, `core_hotlapping`, `core_paths` … |
| `onClusterRouteEnter` | *moteur* | 1 : `ui_gameplaySelector_general` |
| `onClusterRouteMount` | *moteur* | 1 : `ui_gameplaySelector_general` |
| `onCollectScreenshotMetadata` | `screenshot` | 2 : `ui_pause_photomode`, `util_trackBuilder_splineTrack` |
| `onComputerAddFunctions` | `career_modules_computer` | 11 : `career_modules_branches_landing`, `career_modules_insurance_insurance`, `career_modules_insurance_repairScreen`, `career_modules_inventory`, `career_modules_painting` … |
| `onComputerInsurance` | `career_modules_insurance_insurance` |  |
| `onComputerMenuOpened` | `career_modules_computer` | 1 : `career_modules_tutorial_step09spmSignup` |
| `onComputerPlayerAbstract` | `career_modules_playerAbstract` |  |
| `onConsoleExecuteCommand` | `core_windowsConsole` | 1 : `util_followTheWhiteRabbit` |
| `onConsoleLog` | *moteur* | 2 : `editor_missionEditor`, `util_compileImposters` |
| `onControllerSelect` | *moteur* | 1 : `freeroam_bigMapMode` |
| `onCountdownEnded` | `scenario_scenarios` | 2 : `scenario_quickRace`, `scenario_raceGoals` |
| `onCountdownStarted` | `scenario_scenarios` |  |
| `onCouplerAttached` | `main` | 4 : `core_couplerCameraModifier`, `core_trailerRespawn`, `core_vehicles`, `gameplay_freeformDelivery_routes` |
| `onCouplerDetach` | `main` |  |
| `onCouplerDetached` | `main` | 4 : `core_couplerCameraModifier`, `core_trailerRespawn`, `core_vehicles`, `gameplay_freeformDelivery_routes` |
| `onCrashCamEnded` | `freeroam_crashCamMode` | 1 : `gameplay_crashTest_scenarioManager` |
| `onCrashScenarioFailed` | `gameplay_crashTest_scenarioManager` |  |
| `onCrashTestShowEndStepDetails` | `gameplay_crashTest_scenarioManager` |  |
| `onCrashTestShowStepDetails` | `gameplay_crashTest_scenarioManager` |  |
| `onCrashTestStepFailed` | *moteur* | 1 : `gameplay_crashTest_crashTestTaskList` |
| `onCrawlCleared` | `gameplay_crawl_utils` | 2 : `gameplay_crawl_general`, `util_richPresence` |
| `onCrawlComplete` | *moteur* | 2 : `gameplay_crawl_debug`, `gameplay_crawl_display` |
| `onCrawlDisqualified` | `gameplay_crawl_utils` | 2 : `gameplay_crawl_debug`, `gameplay_crawl_freeroamMultiplayer` |
| `onCrawlPathnodeReached` | `gameplay_crawl_utils` | 2 : `gameplay_crawl_crawlFlowgraphBridge`, `gameplay_crawl_flowgraphBridge` |
| `onCrawlPenaltyScoreChanged` | `gameplay_crawl_utils` | 1 : `gameplay_crawl_freeroamMultiplayer` |
| `onCrawlResultsShown` | `gameplay_crawl_utils` | 5 : `gameplay_crawl_crawlFlowgraphBridge`, `gameplay_crawl_display`, `gameplay_crawl_flowgraphBridge`, `gameplay_crawl_freeroamMultiplayer`, `gameplay_crawl_general` |
| `onCrawlStarted` | `gameplay_crawl_general` | 6 : `gameplay_crawl_crawlFlowgraphBridge`, `gameplay_crawl_debug`, `gameplay_crawl_display`, `gameplay_crawl_flowgraphBridge`, `gameplay_crawl_freeroamMultiplayer` … |
| `onCreatedRallyGroundMarkerRoute` | `flowgraph_nodes_gameplay_rally_createRallyGroundMarker` | 1 : `gameplay_rallyLoop` |
| `onCursorVisibilityChanged` | *moteur* | 1 : `core_vehicleTriggers` |
| `onCustomWaypoints` | `scenario_scenarios` | 1 : `scenario_quickRace` |
| `onDeactivateBigMapCallback` | `freeroam_bigMapMode` | 3 : `career_modules_delivery_cargoScreen`, `career_modules_tutorial_step07bigmap`, `gameplay_taxi` |
| `onDebugDisabled` | *moteur* | 1 : `career_modules_debug_precisionParkingDebug` |
| `onDebugMenu` | *moteur* | 9 : `career_modules_tutorial_step01enterVehicle`, `career_modules_tutorial_step02moveOff`, `career_modules_tutorial_step03basicManeuvers`, `career_modules_tutorial_step04timeTrial`, `career_modules_tutorial_step05driveToDragStrip` … |
| `onDecalCameraEnter` | *moteur* | 1 : `ui_liveries_routeLifecycleCallbacks` |
| `onDecalMaterialEnter` | *moteur* | 1 : `ui_liveries_routeLifecycleCallbacks` |
| `onDecalMirrorEnter` | *moteur* | 1 : `ui_liveries_routeLifecycleCallbacks` |
| `onDecalSelectorMount` | *moteur* | 1 : `ui_liveries_routeLifecycleCallbacks` |
| `onDecalTransformLeave` | *moteur* | 1 : `ui_liveries_routeLifecycleCallbacks` |
| `onDecalTransformMount` | *moteur* | 1 : `ui_liveries_routeLifecycleCallbacks` |
| `onDecalTransformSettingsEnter` | *moteur* | 1 : `ui_liveries_routeLifecycleCallbacks` |
| `onDecalTransformSettingsLeave` | *moteur* | 1 : `ui_liveries_routeLifecycleCallbacks` |
| `onDecalsEnter` | *moteur* | 1 : `ui_liveries_routeLifecycleCallbacks` |
| `onDecalsLeave` | *moteur* | 1 : `ui_liveries_routeLifecycleCallbacks` |
| `onDecalsMount` | *moteur* | 1 : `ui_liveries_routeLifecycleCallbacks` |
| `onDeleteSelection` | *moteur* | 1 : `editor_meshEditor` |
| `onDeliveryDropOffCargoSelectionPopupClosed` | `career_modules_delivery_cargoScreen` |  |
| `onDeliveryFacilityProgressStatsChanged` | `career_modules_delivery_progress` | 1 : `career_modules_milestones_generalMilestones_delivery` |
| `onDeliveryModeStarted` | `career_modules_delivery_general` | 2 : `career_modules_inspectVehicle`, `util_richPresence` |
| `onDeliveryModeStopped` | `career_modules_delivery_general` | 1 : `util_richPresence` |
| `onDeliveryRewardsPopupClosed` | `career_modules_delivery_cargoScreen` | 1 : `career_modules_delivery_cargoScreen` |
| `onDeselect_` | *moteur* | 1 : `editor_meshEditor` |
| `onDeserialize` | *moteur* | 10 : `editor_forestEditor`, `editor_textEditor`, `editor_veMain`, `editor_vehicleEditor_liveEditor_vePowerTrain`, `editor_vehicleEditor_staticEditor_veStaticRenderView` … |
| `onDeserialized` | *moteur* | 130 : `campaign_dealer`, `career_career`, `career_saveSystem`, `core_audio`, `core_audioForest` … |
| `onDespawnObject` | *moteur* | 4 : `core_camera`, `core_nodegrabberGamepad`, `core_recoveryCamera`, `core_vehicle_manager` |
| `onDeviceChanged` | *moteur* | 3 : `core_input_bindings`, `telemetry_trackers_hardware`, `ui_bindingsLegend` |
| `onDisplayModeChanged` | `core_settings_graphic` | 1 : `telemetry_trackers_hardware` |
| `onDonutDriftAccomplished` | *moteur* | 1 : `gameplay_drift_scoring` |
| `onDonutDriftScored` | `gameplay_drift_scoring` | 1 : `gameplay_drift_display` |
| `onDragClear` | `gameplay_drag_core` | 5 : `gameplay_drag_display`, `gameplay_drag_dragBridge`, `gameplay_drag_phaseHandlers`, `gameplay_drag_times`, `util_richPresence` |
| `onDragClearComplete` | `gameplay_drag_core` | 1 : `util_richPresence` |
| `onDragCountdownStarted` | `gameplay_drag_display` | 1 : `career_modules_vehiclePerformance` |
| `onDragDataSet` | `gameplay_drag_core` | 3 : `gameplay_drag_display`, `gameplay_drag_dragBridge`, `util_richPresence` |
| `onDragMPTimeslipRequested` | `gameplay_drag_core` |  |
| `onDragRaceCancelled` | `gameplay_drag_mpDragHandlers` | 1 : `gameplay_drag_core` |
| `onDragRaceClientDisconnected` | *moteur* | 1 : `gameplay_drag_core` |
| `onDragRaceCountdownStart` | `gameplay_drag_mpDragHandlers` | 1 : `gameplay_drag_core` |
| `onDragRaceFinishTimesUpdated` | `gameplay_drag_mpDragHandlers` |  |
| `onDragRaceJoinAccepted` | *moteur* | 1 : `gameplay_drag_core` |
| `onDragRaceListChanged` | `gameplay_drag_mpDragHandlers` | 2 : `gameplay_drag_core`, `gameplay_drag_dragBridge` |
| `onDragRacePlayerLeft` | *moteur* | 1 : `gameplay_drag_core` |
| `onDragRacePlayersUpdated` | `gameplay_drag_mpDragHandlers` | 1 : `gameplay_drag_dragBridge` |
| `onDragRaceReset` | `gameplay_drag_mpDragHandlers` | 1 : `gameplay_drag_core` |
| `onDragRaceStart` | `gameplay_drag_mpDragHandlers` | 1 : `gameplay_drag_core` |
| `onDragRaceStarted` | `gameplay_drag_mpDragHandlers` | 2 : `gameplay_drag_core`, `gameplay_drag_dragBridge` |
| `onDragRaceStateChanged` | `gameplay_drag_mpDragHandlers` | 1 : `gameplay_drag_dragBridge` |
| `onDragRaceTimerUpdated` | `gameplay_drag_mpDragHandlers` | 2 : `gameplay_drag_core`, `gameplay_drag_display` |
| `onDragRaceTimerValuesUpdated` | `gameplay_drag_mpDragHandlers` |  |
| `onDragRaceTreeLights` | `gameplay_drag_mpDragHandlers` | 1 : `gameplay_drag_core` |
| `onDragRaceWinningLights` | `gameplay_drag_mpDragHandlers` | 1 : `gameplay_drag_core` |
| `onDragRacersSetup` | `gameplay_drag_core` | 2 : `career_modules_tutorial_step06dragStripBasics`, `gameplay_drag_dragBridge` |
| `onDragReset` | `gameplay_drag_core` | 4 : `gameplay_drag_display`, `gameplay_drag_dragBridge`, `gameplay_drag_times`, `util_richPresence` |
| `onDrawDebug` | `main` | 3 : `editor_scriptAIManager`, `scenario_raceDebug`, `scenario_scenarios` |
| `onDrawOnMinimap` | `ui_apps_minimap_minimap` | 2 : `gameplay_crawl_general`, `gameplay_crawl_utils` |
| `onDriftActiveDataFinished` | `gameplay_drift_drift` | 2 : `gameplay_drift_quickMessages`, `gameplay_drift_scoreboard` |
| `onDriftCachedScoreReset` | `gameplay_drift_scoring` | 1 : `gameplay_drift_display` |
| `onDriftChainStarted` | `gameplay_drift_drift` | 1 : `gameplay_drift_scoring` |
| `onDriftChallengeFinished` | *moteur* | 1 : `gameplay_drift_drift` |
| `onDriftCompleted` | `gameplay_drift_drift` | 3 : `gameplay_drift_quickMessages`, `gameplay_drift_scoring`, `gameplay_drift_statistics` |
| `onDriftCompletedScored` | `gameplay_drift_scoring` | 5 : `gameplay_drift_display`, `gameplay_drift_freeroam_driftSpots`, `gameplay_drift_scoreboard`, `gameplay_drift_sounds`, `gameplay_drift_statistics` |
| `onDriftContextChanged` | `gameplay_drift_general` | 3 : `gameplay_drift_display`, `gameplay_drift_drift`, `util_richPresence` |
| `onDriftCrash` | `gameplay_drift_drift` | 7 : `gameplay_drift_display`, `gameplay_drift_multiplayer`, `gameplay_drift_quickMessages`, `gameplay_drift_scoreboard`, `gameplay_drift_scoring` … |
| `onDriftDebugChanged` | `gameplay_drift_general` | 3 : `gameplay_drift_display`, `gameplay_drift_sounds`, `gameplay_drift_stuntZones` |
| `onDriftFreeroamCruisingStarted` | `gameplay_drift_freeroam_cruising` | 1 : `gameplay_drift_scoring` |
| `onDriftNewCombo` | `gameplay_drift_scoring` | 1 : `gameplay_drift_sounds` |
| `onDriftPlVehReset` | `gameplay_drift_general` | 4 : `gameplay_drift_display`, `gameplay_drift_drift`, `gameplay_drift_quickMessages`, `gameplay_drift_scoring` |
| `onDriftQuickMessageDisplay` | `gameplay_drift_quickMessages` | 1 : `gameplay_drift_display` |
| `onDriftQuickMessageReached` | `gameplay_drift_quickMessages` | 1 : `gameplay_drift_scoreboard` |
| `onDriftScoreChanged` | `gameplay_drift_scoring` | 1 : `gameplay_drift_multiplayer` |
| `onDriftScoreWrappedUp` | `gameplay_drift_scoring` | 1 : `gameplay_drift_display` |
| `onDriftSpinout` | `gameplay_drift_drift` | 6 : `gameplay_drift_display`, `gameplay_drift_quickMessages`, `gameplay_drift_scoreboard`, `gameplay_drift_scoring`, `gameplay_drift_sounds` … |
| `onDriftSpotCompleted` | `gameplay_drift_freeroam_driftSpots` | 1 : `gameplay_drift_display` |
| `onDriftSpotFailed` | `gameplay_drift_freeroam_driftSpots` | 2 : `gameplay_drift_display`, `gameplay_drift_multiplayer` |
| `onDriftSpotFinishLineCrossed` | `gameplay_drift_freeroam_driftSpots` | 1 : `gameplay_drift_multiplayer` |
| `onDriftSpotForcedEnd` | `gameplay_drift_freeroam_driftSpots` |  |
| `onDriftSpotStarted` | `gameplay_drift_freeroam_driftSpots` | 1 : `gameplay_drift_multiplayer` |
| `onDriftStatusChanged` | `gameplay_drift_drift` | 2 : `gameplay_drift_stallingSystem`, `gameplay_drift_stuntZones` |
| `onDriftThroughAccomplished` | *moteur* | 1 : `gameplay_drift_scoring` |
| `onDriftTransition` | `gameplay_drift_drift` | 1 : `gameplay_drift_scoring` |
| `onDriftWrongWay` | `gameplay_drift_destination` |  |
| `onEditorActivated` | `editor_main` | 29 : `editor_assetBrowser`, `editor_assetDeduplicator`, `editor_assetManagementTool`, `editor_bulkRename`, `editor_cameraTransform` … |
| `onEditorAfterNewLevel` | `editor_api_core` |  |
| `onEditorAfterOpenLevel` | `editor_api_core` | 3 : `editor_inspector`, `editor_navMeshEditor`, `editor_sceneTree` |
| `onEditorAfterSaveLevel` | `editor_api_core` | 5 : `core_environment`, `editor_biomeTool`, `editor_forestEditor`, `editor_levelValidator`, `editor_navMeshEditor` |
| `onEditorAfterSaveLevelBackup` | `editor_api_core` |  |
| `onEditorAfterSaveTerrain` | `editor_terrainEditor` |  |
| `onEditorAxisGizmoAligmentChanged` | `editor_api_gizmo` | 4 : `editor_decalEditor`, `editor_ezObjectSelect`, `editor_forestEditor`, `editor_objectTool` |
| `onEditorAxisGizmoAligmentChanged_` | *moteur* | 1 : `editor_meshEditor` |
| `onEditorAxisGizmoModeChanged` | `editor_api_gizmo` | 2 : `editor_ezObjectSelect`, `editor_forestEditor` |
| `onEditorBeforeNewLevel` | `editor_api_core` |  |
| `onEditorBeforeOpenLevel` | `editor_api_core` |  |
| `onEditorBeforeSaveLevel` | `editor_api_core` | 7 : `core_audioForest`, `core_audioRibbon`, `core_environment`, `editor_decalEditor`, `editor_sceneTree` … |
| `onEditorBeforeSaveLevelBackup` | `editor_api_core` |  |
| `onEditorBeforeSaveTerrain` | `editor_terrainEditor` |  |
| `onEditorCopy` | `editor_api_core` |  |
| `onEditorCustomClassBuildFunc` | `editor_createObjectTool` |  |
| `onEditorCut` | `editor_api_core` |  |
| `onEditorDeactivated` | `editor_main` | 26 : `core_environment`, `editor_aiTests`, `editor_assetDeduplicator`, `editor_cameraTransform`, `editor_cameraV2` … |
| `onEditorDeleteSelection` | `editor_api_core` | 2 : `editor_materialEditor`, `editor_terrainEditor` |
| `onEditorDeprecatedPreferencesItem` | `editor_api_preferencesRegistry` |  |
| `onEditorDeselect` | `editor_api_core` |  |
| `onEditorDuplicate` | `editor_api_core` |  |
| `onEditorEditModeActivated` | `editor_api_core` | 1 : `editor_objectTool` |
| `onEditorEditModeChanged` | `editor_api_core`, `editor_forestEditor`, `editor_rallyEditor_drivelineTab`, `editor_rallyEditor_measurementsTab`, `editor_rallyEditor_missionTab`, `editor_rallyEditor_notebookInfo` … | 1 : `editor_shortcutLegend` |
| `onEditorEditModeDeactivated` | `editor_api_core` | 1 : `editor_objectTool` |
| `onEditorEnabled` | `main` |  |
| `onEditorExitLevel` | `editor_api_core` | 2 : `editor_mapJsonEditor`, `editor_shapeEditor` |
| `onEditorFocusLockChanged` | `editor_api_object` | 1 : `editor_sceneTree` |
| `onEditorGui` | `editor_api_gui` | 103 : `core_vehicle_manager`, `editor_aiTests`, `editor_aiViz`, `editor_assemblySpline`, `editor_assetBrowser` … |
| `onEditorGuiEditModeToolbar` | `editor_mainToolbar`, `editor_vehicleEditor_veToolbar` |  |
| `onEditorGuiEditModesToolbar` | `editor_mainToolbar` |  |
| `onEditorGuiGeneralToolbar` | `editor_mainToolbar` |  |
| `onEditorGuiMainMenu` | `editor_api_gui` | 1 : `editor_mainMenu` |
| `onEditorGuiStatusBar` | `editor_api_gui` |  |
| `onEditorGuiToolBar` | `editor_api_gui` | 2 : `editor_mainToolbar`, `editor_vehicleEditor_veToolbar` |
| `onEditorHeadlessChange` | `editor_api_core` | 3 : `editor_veMain`, `editor_vehicleEditor_liveEditor_veView`, `editor_vehicleEditor_staticEditor_veStaticRenderView` |
| `onEditorHeadlessMainMenuBar` | `editor_mainMenu` | 1 : `editor_veMain` |
| `onEditorInitialized` | `editor_main` | 121 : `core_vehicle_manager`, `editor_aiTests`, `editor_assemblySpline`, `editor_assetBrowser`, `editor_assetDeduplicator` … |
| `onEditorInspectorDynFieldChanged` | `editor_api_objectHistoryActions` | 1 : `editor_ezObjectSelect` |
| `onEditorInspectorFieldChanged` | `editor_api_objectHistoryActions` | 9 : `editor_dataBlockEditor`, `editor_decalEditor`, `editor_ezObjectSelect`, `editor_forestEditor`, `editor_objectTool` … |
| `onEditorInspectorFieldChanged_` | *moteur* | 1 : `editor_meshEditor` |
| `onEditorInspectorHeaderGui` | `editor_inspector` | 8 : `editor_dataBlockEditor`, `editor_decalEditor`, `editor_lightClassConverter`, `editor_measuresInspectorHeader`, `editor_particleEditor` … |
| `onEditorInspectorHeaderGui_` | *moteur* | 1 : `editor_meshEditor` |
| `onEditorLoadGuiInstancerState` | `editor_api_gui` | 2 : `editor_inspector`, `editor_sceneTree` |
| `onEditorLoadState` | `editor_main` | 2 : `editor_mainMenu`, `editor_mainToolbar` |
| `onEditorLoadWindowsState` | `editor_api_gui` |  |
| `onEditorMainMenuBar` | `editor_mainMenu` | 1 : `editor_logHelper` |
| `onEditorModulesInitialized` | `editor_main` |  |
| `onEditorMouseWheel` | *moteur* | 1 : `editor_cameraV2_controller` |
| `onEditorObjectAdded` | `editor_api_objectHistoryActions`, `editor_ezObjectSelect_subtools_fence_session`, `editor_lightClassConverter` | 3 : `editor_ezObjectSelect`, `editor_sceneTree`, `editor_terrainEditor` |
| `onEditorObjectSelectionChanged` | `editor_api_forestItemTools`, `editor_api_object`, `editor_api_objectHistoryActions`, `editor_copyToSelected`, `editor_forestEditor`, `editor_forestTsstaticMover` | 8 : `editor_bulkRename`, `editor_dataBlockEditor`, `editor_groundCoverEditor`, `editor_inspector`, `editor_materialEditor` … |
| `onEditorObjectSelectionChanged_` | *moteur* | 1 : `editor_meshEditor` |
| `onEditorObjectSelectionTransformChanged` | `editor_ezObjectSelect_nativeGizmo`, `editor_ezObjectSelect_transformSession` |  |
| `onEditorPaste` | `editor_api_core` |  |
| `onEditorPrefabExploded` | `editor_api_object` | 2 : `editor_ezObjectSelect`, `editor_roadRiverCacheHandler` |
| `onEditorPreferenceValueChanged` | `editor_api_preferencesRegistry` | 15 : `editor_assetBrowser`, `editor_autoSave`, `editor_cameraV2`, `editor_extensionsEditor`, `editor_ezObjectSelect` … |
| `onEditorPreferenceValueChanged_` | *moteur* | 1 : `editor_meshEditor` |
| `onEditorPreferenceVersionChanged` | `editor_api_preferencesRegistry` |  |
| `onEditorRegisterApi` | `editor_main` | 1 : `editor_inspector` |
| `onEditorRegisterPreferences` | *moteur* | 27 : `editor_assetBrowser`, `editor_autoSave`, `editor_cameraV2`, `editor_createObjectTool`, `editor_editorRenderSettings` … |
| `onEditorRegisterPreferences_` | *moteur* | 1 : `editor_meshEditor` |
| `onEditorSaveGuiInstancerState` | `editor_api_gui` | 2 : `editor_inspector`, `editor_sceneTree` |
| `onEditorSaveState` | `editor_main` | 2 : `editor_mainMenu`, `editor_mainToolbar` |
| `onEditorSaveWindowsState` | `editor_api_gui` |  |
| `onEditorSelectAll` | `editor_api_core` |  |
| `onEditorShutdown` | `editor_main` | 1 : `editor_editorRenderSettings` |
| `onEditorToolWindowGotFocus` | `editor_api_gui` | 4 : `editor_assetBrowser`, `editor_biomeTool`, `editor_sceneTree`, `editor_sitesEditor` |
| `onEditorToolWindowHide` | `editor_api_gui` | 10 : `editor_audioEventsList`, `editor_biomeTool`, `editor_engineAudioDebug`, `editor_mapJsonEditor`, `editor_particleEditor2` … |
| `onEditorToolWindowLostFocus` | `editor_api_gui` | 2 : `editor_assetBrowser`, `editor_sceneTree` |
| `onEditorToolWindowOpened` | `editor_mainMenu` | 1 : `telemetry_trackers_editor` |
| `onEditorToolWindowShow` | `editor_api_gui` | 3 : `editor_audioEventsList`, `editor_engineAudioDebug`, `editor_particleEditor2` |
| `onEndGarageMode` | `gameplay_garageMode` |  |
| `onEndScenario` | `scenario_scenarios` |  |
| `onEndScreenUIOpened` | `flowgraph_nodes_ui_updatedUI_endScreenBegin` | 1 : `telemetry_trackers_gameplay_missions` |
| `onEnterCargoOverviewScreen` | `career_modules_delivery_cargoScreen` |  |
| `onEnterVehicleFinished` | `career_modules_inventory` | 4 : `career_modules_insurance_insurance`, `career_modules_inventory`, `career_modules_partInventory`, `gameplay_garageMode` |
| `onEnvironmentChanged` | `core_environment` |  |
| `onEnvironmentGetOtherButtons` | `ui_pause_providers_routeData_environment` |  |
| `onExistingDecalTransformEnter` | *moteur* | 1 : `ui_liveries_routeLifecycleCallbacks` |
| `onExistingDecalTransformLeave` | *moteur* | 1 : `ui_liveries_routeLifecycleCallbacks` |
| `onExistingDecalTransformMount` | *moteur* | 1 : `ui_liveries_routeLifecycleCallbacks` |
| `onExit` | `main` | 16 : `core_audioRibbon`, `core_groundMarkerArrows`, `core_quickAccess`, `editor_main`, `gameplay_statistic` … |
| `onExitInsurancesComputerScreen` | *moteur* | 1 : `career_modules_insurance_insurance` |
| `onExitVehicleInventory` | *moteur* | 1 : `career_modules_inventory` |
| `onExtensionLoaded` | *moteur* | 159 : `career_modules_inventory`, `career_modules_marketplace`, `career_modules_milestones_milestones`, `career_modules_missionWrapper`, `career_modules_partInventory` … |
| `onExtensionUnloaded` | *moteur* | 95 : `campaign_campaigns`, `career_modules_missionWrapper`, `career_modules_tutorial`, `core_couplerCameraModifier`, `core_groundMarkers` … |
| `onFFBConfigChanged` | `core_input_bindings` | 1 : `core_devices` |
| `onFailureTimerFired` | `scenario_scenarios` |  |
| `onFileChanged` | `main` | 13 : `core_camera`, `core_flowgraphManager`, `core_input_actions`, `core_input_bindings`, `core_modmanager` … |
| `onFileChangedEnd` | `main` | 1 : `core_vehicles` |
| `onFilesChanged` | `main` | 12 : `core_audio`, `core_environment`, `core_levels`, `core_locales`, `core_settings_settings` … |
| `onFilterCustomLevelTiles` | *moteur* | 1 : `ui_gameplaySelector_tileGenerators_levelTiles` |
| `onFilteredInputChanged` | *moteur* | 1 : `scenario_scenarios` |
| `onFirstDriveEnded` | *moteur* | 1 : `telemetry_trackers_gameplay_firstDrive` |
| `onFirstDriveLessonCompleted` | *moteur* | 1 : `telemetry_trackers_gameplay_firstDrive` |
| `onFirstDriveLessonStarted` | *moteur* | 1 : `telemetry_trackers_gameplay_firstDrive` |
| `onFirstDriveLessonStopped` | *moteur* | 1 : `telemetry_trackers_gameplay_firstDrive` |
| `onFirstDriveMoveOffSectionCompleted` | `ui_firstDrive_moveOff` |  |
| `onFirstDriveStarted` | *moteur* | 1 : `telemetry_trackers_gameplay_firstDrive` |
| `onFirstUpdate` | `main` | 10 : `core_audio`, `core_commandhandler`, `core_input_actions`, `core_input_bindings`, `core_schemeCommandServer` … |
| `onFirstUpdateSettings` | *moteur* | 2 : `core_settings_audio`, `core_settings_graphic` |
| `onFlowgraphScenarioStarted` | `scenario_scenariosLoader` | 1 : `telemetry_trackers_level` |
| `onFlowgraphSceneObjectAdd` | *moteur* | 1 : `core_flowgraphManager` |
| `onFlowgraphSceneObjectChanged` | *moteur* | 1 : `core_flowgraphManager` |
| `onFlowgraphSceneObjectRemove` | *moteur* | 1 : `core_flowgraphManager` |
| `onFreeroamConfiguratorApplyOptions` | `freeroam_freeroamConfigurator` | 1 : `freeroam_configuratorOptions_freeroamOptions` |
| `onFreeroamConfiguratorGetOptions` | `freeroam_freeroamConfigurator` | 1 : `freeroam_configuratorOptions_freeroamOptions` |
| `onFreeroamConfiguratorOverrideStartButton` | `freeroam_freeroamConfigurator` |  |
| `onFreeroamDriftZoneNewHighscore` | `gameplay_drift_freeroam_driftSpots` | 1 : `gameplay_drift_display` |
| `onFreeroamLoaded` | `freeroam_freeroam` |  |
| `onFreeroamSelectorClosed` | `ui_freeroamSelector_general` |  |
| `onFreeroamSelectorGetDetails` | `ui_gameplaySelector_tileGenerators_levelTiles` |  |
| `onFreeroamSelectorOpen` | `ui_freeroamSelector_general` |  |
| `onFreeroamSelectorOpenedWithItemDetails` | *moteur* | 1 : `ui_gameplaySelector_tileGenerators_levelTiles` |
| `onGameStateUpdate` | `core_gamestate` | 3 : `core_hotlapping`, `gameplay_statistic`, `util_richPresence` |
| `onGameplayActivityAborted` | `career_modules_delivery_cargoScreen`, `career_modules_testDrive`, `career_modules_vehiclePerformance`, `gameplay_freeformDelivery_freeformDelivery`, `gameplay_missions_missionManager`, `telemetry_trackers_performanceSpatial` … |  |
| `onGameplayFlashMessage` | *moteur* | 1 : `ui_appContainers_topCenter` |
| `onGameplayInteract` | `gameplay_rally_tools_loopToolbox` | 2 : `gameplay_rallyLoop`, `gameplay_taxi` |
| `onGameplaySelectorGetDetails` | `ui_freeroamSelector_general`, `ui_gameplaySelector_general` | 5 : `ui_gameplaySelector_tileGenerators_campaignTiles`, `ui_gameplaySelector_tileGenerators_discoverTiles`, `ui_gameplaySelector_tileGenerators_levelTiles`, `ui_gameplaySelector_tileGenerators_missionTiles`, `ui_gameplaySelector_tileGenerators_scenarioTiles` |
| `onGameplaySelectorGetTiles` | `ui_freeroamSelector_general`, `ui_gameplaySelector_general` | 5 : `ui_gameplaySelector_tileGenerators_campaignTiles`, `ui_gameplaySelector_tileGenerators_discoverTiles`, `ui_gameplaySelector_tileGenerators_levelTiles`, `ui_gameplaySelector_tileGenerators_missionTiles`, `ui_gameplaySelector_tileGenerators_scenarioTiles` |
| `onGarageEnter` | *moteur* | 1 : `gameplay_garageMode` |
| `onGeneralMilestoneClaimed` | `career_modules_milestones_general` | 1 : `career_modules_milestones_generalMilestones_statistic` |
| `onGeneralMilestonesCollect` | `career_modules_milestones_general` | 7 : `career_modules_milestones_generalMilestones_branches`, `career_modules_milestones_generalMilestones_delivery`, `career_modules_milestones_generalMilestones_insurance`, `career_modules_milestones_generalMilestones_missions`, `career_modules_milestones_generalMilestones_money` … |
| `onGeneralMilestonesSetupCallbacks` | `career_modules_milestones_general` | 5 : `career_modules_milestones_generalMilestones_branches`, `career_modules_milestones_generalMilestones_delivery`, `career_modules_milestones_generalMilestones_missions`, `career_modules_milestones_generalMilestones_money`, `career_modules_milestones_generalMilestones_statistic` |
| `onGetIsMissionStartOrEndScreenActive` | `gameplay_missions_missionScreen` | 1 : `gameplay_multiseat_gamemodeManager` |
| `onGetMilestones` | `career_modules_milestones_milestones` | 2 : `career_modules_milestones_general`, `career_modules_milestones_milestones` |
| `onGetMultiseatGameSettings` | `ui_multiseat_multiseatSettings` | 1 : `ui_multiseat_generalSettings` |
| `onGetMultiseatGamemodeInfos` | `gameplay_multiseat_gamemodeManager` |  |
| `onGetMultiseatSettingsScreenData` | `ui_multiseat_multiseatSettings` |  |
| `onGetRawPoiListForLevel` | `gameplay_rawPois` | 15 : `career_modules_debug_vehicleSpawn`, `career_modules_delivery_general`, `career_modules_inspectVehicle`, `career_modules_inventory`, `career_modules_testDrive` … |
| `onGetRawPoiListForTutorial` | `gameplay_rawPois` | 4 : `career_modules_tutorial`, `career_modules_tutorial_step09spmSignup`, `freeroam_facilities`, `gameplay_drag_core` |
| `onGetUnlockFlagDefinitions` | `career_modules_unlockFlags` | 1 : `career_branches` |
| `onGlobalCameraSet` | `core_camera` | 2 : `career_career`, `core_nodegrabberGamepad` |
| `onGridSelectorDisplayDataChanged` | `ui_gridSelectorUtils_displayDataModule` |  |
| `onGridSelectorFavouriteToggled` | `ui_gridSelectorUtils_displayDataModule` |  |
| `onGridSelectorGetTiles` | `ui_gridSelectorUtils_tilesModule` |  |
| `onGui` | *moteur* | 8 : `editor_dynamicDecals_browser`, `editor_dynamicDecals_colorHistory`, `editor_dynamicDecals_colorPresets`, `editor_dynamicDecals_inspector_utils`, `editor_dynamicDecals_layerTypes_group` … |
| `onGuiUpdate` | `main` | 6 : `gameplay_rallyLoop`, `ui_fadeScreen`, `ui_policeInfo`, `ui_router`, `ui_uiNavi` … |
| `onHideRadialMenu` | `core_quickAccess` | 1 : `core_recoveryPrompt` |
| `onHitPoleAccomplished` | *moteur* | 1 : `gameplay_drift_scoring` |
| `onHitPoleScored` | `gameplay_drift_scoring` | 1 : `gameplay_drift_display` |
| `onHurryUpCalled` | *moteur* | 1 : `gameplay_taxi` |
| `onInit` | *moteur* | 20 : `core_environment`, `core_metrics`, `core_quickAccess`, `core_replay`, `editor_audioRibbonEditor` … |
| `onInitSettings` | *moteur* | 1 : `core_settings_graphic` |
| `onInput` | *moteur* | 1 : `core_vehicle_inplaceEdit` |
| `onInputBindingsChanged` | `core_input_bindings` | 6 : `core_input_actionFilter`, `core_remoteController`, `core_vehicleTriggers`, `scenario_scenarios`, `ui_missionInfo` … |
| `onInputTestStats` | *moteur* | 1 : `core_input_tests` |
| `onInputTestStatus` | *moteur* | 1 : `core_input_tests` |
| `onInstabilityDetected` | `main` | 4 : `career_modules_debug_cargoContainerDebug`, `core_vehicles`, `mcp_tools_vehicle`, `telemetry_trackers_physics` |
| `onInstructions` | *moteur* | 1 : `core_online` |
| `onInsuranceRepairClaim` | `career_modules_insurance_insurance` | 1 : `career_modules_milestones_generalMilestones_insurance` |
| `onIntroPopupCareerClosed` | *moteur* | 8 : `career_modules_tutorialPopups`, `career_modules_tutorial_step01enterVehicle`, `career_modules_tutorial_step04timeTrial`, `career_modules_tutorial_step05driveToDragStrip`, `career_modules_tutorial_step06dragStripBasics` … |
| `onInventoryPreRemoveVehicleObject` | `career_modules_inventory` | 1 : `career_modules_delivery_general` |
| `onJobDone` | `core_jobsystem` | 1 : `util_worker` |
| `onLanguageChanged` | `core_locales` | 9 : `career_modules_delivery_cargoCards`, `core_celestial`, `core_multiseat`, `core_vehicle_partmgmt`, `core_vehicles` … |
| `onLastAttemptTaken` | `scenario_scenarios` |  |
| `onLevelValidationFinished` | `editor_levelValidator` |  |
| `onLicensePlateChanged` | `core_vehicles` |  |
| `onLiveriesEditEnter` | *moteur* | 1 : `ui_liveries_routeLifecycleCallbacks` |
| `onLiveriesEnter` | *moteur* | 1 : `ui_liveries_routeLifecycleCallbacks` |
| `onLiveriesLeave` | *moteur* | 1 : `ui_liveries_routeLifecycleCallbacks` |
| `onLiveriesMount` | *moteur* | 1 : `ui_liveries_routeLifecycleCallbacks` |
| `onLiveriesPaintEnter` | *moteur* | 1 : `ui_liveries_routeLifecycleCallbacks` |
| `onLiveriesRootLeave` | *moteur* | 1 : `ui_liveries_routeLifecycleCallbacks` |
| `onLoadCustomPrefabs` | `scenario_scenarios` | 1 : `scenario_quickRace` |
| `onLoadingScreenFadeout` | `server/server` | 7 : `career_career`, `core_flowgraphManager`, `freeroam_freeroamConfigurator`, `gameplay_discover`, `gameplay_garageMode` … |
| `onLoadingScreenInactive` | `core_gamestate` | 1 : `render_playerCompassMarkers` |
| `onLocalParticipantsChanged` | `core_multiseat` | 4 : `core_vehicles`, `gameplay_seatOccupants`, `ui_multiseat_multiseatSettings`, `ui_pause_vehicleConfigurationOccupants` |
| `onLogbookGetEntries` | `career_modules_logbook` | 1 : `career_modules_playerAttributes` |
| `onMPSessionChanged` | *moteur* | 2 : `gameplay_crawl_general`, `gameplay_drift_general` |
| `onMcpToolCalled` | `mcp_server` | 1 : `telemetry_trackers_mcp` |
| `onMenuActionMapEnabled` | `core_input_bindings` | 1 : `core_nodegrabberGamepad` |
| `onMenuClosed` | *moteur* | 4 : `career_modules_computer`, `career_modules_insurance_insurance`, `career_modules_insurance_repairScreen`, `gameplay_drag_dragBridge` |
| `onMenuItemNavigation` | *moteur* | 1 : `freeroam_bigMapMode` |
| `onMenuToggled` | `ui_menuManager` | 1 : `core_hotlapping` |
| `onMilestonesRouteEnter` | *moteur* | 1 : `career_modules_milestones_milestones` |
| `onMilestonesRouteMount` | *moteur* | 1 : `career_modules_milestones_milestones` |
| `onMinimapRouteOverride` | `ui_apps_minimap_route` |  |
| `onMinimapSettingsChanged` | `core_settings_settings` | 1 : `ui_apps_minimap_minimap` |
| `onMissionAbandoned` | `gameplay_missions_missionManager` | 1 : `telemetry_trackers_gameplay_missions` |
| `onMissionAttemptAggregated` | `gameplay_missions_progress`, `telemetry_trackers_performanceSpatial` | 2 : `telemetry_trackers_gameplay_missions`, `util_richPresence` |
| `onMissionAvailabilityChanged` | `gameplay_markerInteraction` | 1 : `core_sounds` |
| `onMissionFinished` | `flowgraph_modules_missionModule` |  |
| `onMissionInfoChangedState` | `ui_missionInfo` | 1 : `core_sounds` |
| `onMissionLoaded` | *moteur* | 2 : `career_modules_missionWrapper`, `map` |
| `onMissionProgressChanged` | `gameplay_missions_missionTypes_flowMission` |  |
| `onMissionReconfigured` | `gameplay_missions_missionManager` | 1 : `telemetry_trackers_gameplay_missions` |
| `onMissionScreenButtonClicked` | *moteur* | 1 : `gameplay_multiseat_gamemodeManager` |
| `onMissionScreenReady` | `flowgraph_modules_uiModule`, `gameplay_multiseat_gamemodeManager` | 1 : `gameplay_missions_missionScreen` |
| `onMissionStartWithFade` | `gameplay_missions_missionManager` |  |
| `onMissionStopped` | `gameplay_missions_missionManager` |  |
| `onMissionUnlocked` | `gameplay_missions_progress` |  |
| `onModActivated` | `core_modmanager` | 4 : `ui_appSelector_general`, `ui_freeroamSelector_general`, `ui_gameplaySelector_general`, `ui_vehicleSelector_general` |
| `onModDeactivated` | `core_modmanager` | 4 : `ui_appSelector_general`, `ui_freeroamSelector_general`, `ui_gameplaySelector_general`, `ui_vehicleSelector_general` |
| `onModManagerModsMounted` | `core_modmanager` |  |
| `onModManagerReady` | `core_modmanager` | 10 : `core_hardwareinfo`, `core_loadMapCmd`, `core_repository`, `gameplay_sites_sitesManager`, `telemetry_trackers_mods` … |
| `onModManagerStateChanged` | `core_modmanager` | 3 : `ui_freeroamSelector_general`, `ui_gameplaySelector_general`, `ui_vehicleSelector_general` |
| `onModifiedWaypoint` | *moteur* | 1 : `map` |
| `onModifierChanged` | *moteur* | 1 : `ui_bindingsLegend` |
| `onMouseButton` | *moteur* | 1 : `freeroam_bigMapMode` |
| `onMouseInput` | *moteur* | 1 : `editor_cameraV2_orbit` |
| `onMouseLocked` | `main` | 2 : `core_camera`, `core_vehicleTriggers` |
| `onMouseWheel` | *moteur* | 1 : `editor_cameraV2_zoom` |
| `onMultiplayerGamemodeStarted` | *moteur* | 1 : `gameplay_drift_freeroam_driftSpots` |
| `onMultiplayerGamemodeStopped` | *moteur* | 1 : `gameplay_drift_freeroam_driftSpots` |
| `onMultiseatGameSettingAction` | `ui_multiseat_multiseatSettings` | 1 : `ui_multiseat_generalSettings` |
| `onMultiseatGameSettingChanged` | `ui_multiseat_multiseatSettings` | 1 : `ui_multiseat_generalSettings` |
| `onMultiseatGamemodeFinished` | `gameplay_multiseat_gamemodeManager` | 1 : `telemetry_trackers_splitscreen` |
| `onMultiseatGamemodeLaunched` | `gameplay_multiseat_gamemodeManager` | 1 : `telemetry_trackers_splitscreen` |
| `onMultiseatGamemodeStopped` | `gameplay_multiseat_gamemodeManager` | 1 : `telemetry_trackers_splitscreen` |
| `onMultiseatSettingsApplied` | `ui_multiseat_multiseatSettings` | 2 : `gameplay_multiseat_gamemodeManager`, `ui_multiseat_freeroam` |
| `onMultiseatSettingsClosed` | `ui_multiseat_multiseatSettings` | 1 : `ui_multiseat_freeroam` |
| `onNavgraphReloaded` | `map` | 3 : `core_trafficSignals`, `editor_aiViz`, `freeroam_bigMapMode` |
| `onNavigateToMission` | `freeroam_bigMapMode` | 1 : `gameplay_markerInteraction` |
| `onNearPoleAccomplished` | *moteur* | 1 : `gameplay_drift_scoring` |
| `onNearPoleScored` | `gameplay_drift_scoring` | 1 : `gameplay_drift_display` |
| `onNearStuntZoneFirst` | `gameplay_drift_stuntZones` |  |
| `onNewAttempt` | `scenario_scenarios` | 1 : `util_richPresence` |
| `onNewCrashTestStep` | *moteur* | 2 : `gameplay_crashTest_crashTestBoundaries`, `gameplay_crashTest_crashTestTaskList` |
| `onNewDriftTierReached` | `gameplay_drift_scoring`, `gameplay_drift_sounds` | 2 : `gameplay_drift_display`, `gameplay_drift_sounds` |
| `onNewImpactStarted` | `gameplay_util_crashDetection` |  |
| `onNodegrab` | `server/commands` | 1 : `core_nodegrabberGamepad` |
| `onNodegrabStart` | *moteur* | 1 : `server/commands` |
| `onNodegrabStop` | *moteur* | 1 : `server/commands` |
| `onObjectCollision` | `scenario_scenarios` |  |
| `onOnlineServiceProviderReady` | *moteur* | 1 : `gameplay_achievement` |
| `onOnlineStateChanged` | `telemetry_configManager` | 3 : `core_online`, `core_repository`, `telemetry_trackers_session` |
| `onOpenDynamicSlotConfigurator` | `core_quickAccess` |  |
| `onPaidRefuelling` | `career_modules_fuel` |  |
| `onParkingVehiclesActivated` | `gameplay_parking` | 1 : `gameplay_missions_missionManager` |
| `onParkingVehiclesDeactivated` | `gameplay_parking` |  |
| `onPartShoppingCancelled` | `career_modules_partShopping` | 1 : `util_richPresence` |
| `onPartShoppingPartInstalled` | `career_modules_partShopping` |  |
| `onPartShoppingStarted` | `career_modules_partShopping` | 2 : `career_modules_delivery_general`, `util_richPresence` |
| `onPartShoppingTransactionComplete` | `career_modules_partShopping` | 2 : `career_modules_partInventory`, `util_richPresence` |
| `onPartsTreeConfigChanged` | `core_vehicle_partmgmt` |  |
| `onPauseBigmapLeave` | *moteur* | 1 : `ui_pause_routeLifecycleCallbacks` |
| `onPauseEnter` | *moteur* | 1 : `ui_pause_routeLifecycleCallbacks` |
| `onPauseHomeRailBuildMultiseatActions` | `ui_pause_features_homeRail` | 2 : `gameplay_multiseat_gamemodeManager`, `ui_multiseat_freeroam` |
| `onPauseLeave` | *moteur* | 1 : `ui_pause_routeLifecycleCallbacks` |
| `onPauseMenuRightRailButtonPressed` | `ui_pause_features_homeRail`, `ui_pause_providers_routeData_vehicle` |  |
| `onPauseMount` | *moteur* | 1 : `ui_pause_routeLifecycleCallbacks` |
| `onPauseRouteLifecycle` | *moteur* | 1 : `ui_pause_providers_vehicleTabInteractions` |
| `onPerformanceHardwareWarning` | `core_hardwareinfo` | 1 : `telemetry_trackers_performanceWarnings` |
| `onPersonaSettingsChanged` | *moteur* | 1 : `core_vehicles` |
| `onPhaseTransition` | `gameplay_drag_phaseHandlers` |  |
| `onPhotomodeEnter` | *moteur* | 3 : `ui_garage_routeLifecycleCallbacks`, `ui_menuRouteLifecycleCallbacks`, `ui_pause_routeLifecycleCallbacks` |
| `onPhotomodeLeave` | *moteur* | 2 : `ui_garage_routeLifecycleCallbacks`, `ui_pause_routeLifecycleCallbacks` |
| `onPhotomodeMount` | *moteur* | 2 : `ui_garage_routeLifecycleCallbacks`, `ui_pause_routeLifecycleCallbacks` |
| `onPhotomodeRouteEnter` | *moteur* | 1 : `ui_photomode_session` |
| `onPhotomodeRouteLeave` | *moteur* | 1 : `ui_photomode_session` |
| `onPhysicsEngineEvent` | `main` |  |
| `onPhysicsPaused` | `main` | 3 : `core_audio`, `scenario_busdriver`, `scenario_scenarios` |
| `onPhysicsUnpaused` | `main` | 3 : `core_audio`, `scenario_busdriver`, `scenario_scenarios` |
| `onPlayMultiseatGameSettings` | `ui_multiseat_multiseatSettings` |  |
| `onPlaybookLogAfterStep` | `editor_missionPlaybook` | 3 : `editor_missionPlaybook_attributeViewer`, `editor_missionPlaybook_missionTreeViewer`, `editor_missionPlaybook_unlockedMissionsViewer` |
| `onPlayerAttributesChanged` | `career_modules_playerAttributes` | 3 : `career_modules_delivery_tutorial`, `career_modules_milestones_generalMilestones_branches`, `career_modules_milestones_generalMilestones_money` |
| `onPlayerCameraReady` | `server/server` | 1 : `freeroam_freeroam` |
| `onPlayerLeftDragArea` | *moteur* | 1 : `gameplay_drag_core` |
| `onPlayerOutOfBounds` | *moteur* | 1 : `gameplay_crashTest_scenarioManager` |
| `onPlayerVehicleCloned` | `core_vehicles` | 1 : `gameplay_statistic` |
| `onPlayerVehiclePresenceChanged` | `gameplay_seatOccupants` | 2 : `core_input_bindings`, `freeroam_vehicleSwitchNotification` |
| `onPoiDetailPromptOpening` | *moteur* | 3 : `career_modules_debug_vehicleSpawn`, `career_modules_testDrive`, `gameplay_missions_poiTest` |
| `onPoiSelectedFromBigmap` | `freeroam_bigMapMode` | 2 : `career_modules_tutorial_step07bigmap`, `freeroam_vueBigMap` |
| `onPopupClosed` | *moteur* | 1 : `core_recoveryPrompt` |
| `onPreExit` | `main`, `telemetry_trackers_performanceSpatial` | 1 : `editor_main` |
| `onPreRender` | `main` | 53 : `career_modules_tutorial`, `core_camera`, `core_cameraUpdate`, `core_celestial`, `core_checkpoints` … |
| `onPreVehicleSpawned` | `main` | 1 : `core_vehicles` |
| `onPreWindowClose` | `main` | 1 : `editor_main` |
| `onPurchaseMenuClosed` | *moteur* | 1 : `career_modules_inspectVehicle` |
| `onPursuitAction` | `gameplay_police`, `gameplay_pursuit_pursuit`, `gameplay_traffic_vehicle` | 3 : `career_modules_playerDriving`, `gameplay_pursuit_pursuit`, `ui_policeInfo` |
| `onPursuitGameplayEvent` | `gameplay_pursuit_pursuit` |  |
| `onPursuitGameplayFinished` | `gameplay_pursuit_pursuit` |  |
| `onPursuitGameplayStarted` | `gameplay_pursuit_pursuit` |  |
| `onPursuitModeUpdate` | `gameplay_police` |  |
| `onPursuitOffense` | `gameplay_traffic_vehicle` | 1 : `ui_policeInfo` |
| `onPursuitStatsEnded` | *moteur* | 1 : `ui_policeInfo` |
| `onQuickAccessClearRecentActions` | `core_quickAccess` |  |
| `onQuickAccessItemSelected` | `core_quickAccess` |  |
| `onQuickAccessLoaded` | `core_quickAccess` | 2 : `core_recoveryPrompt`, `gameplay_freeformDelivery_freeformDelivery` |
| `onQuickAccessOpened` | `core_quickAccess` |  |
| `onQuickAccessResetDynamicSlotSettings` | `core_quickAccess` |  |
| `onQuickAccessSetDynamicSlotConfiguration` | `core_quickAccess` |  |
| `onQuickAccessSetEmpty` | `core_quickAccess` |  |
| `onQuickAccessSetRecentActions` | `core_quickAccess` |  |
| `onQuickAccessSetUniqueAction` | `core_quickAccess` |  |
| `onQuickVehicleSelectorEnter` | *moteur* | 1 : `ui_multiseat_multiseatVehicles` |
| `onQuickVehicleSelectorLeave` | *moteur* | 1 : `ui_multiseat_multiseatVehicles` |
| `onQuickVehicleSelectorMount` | *moteur* | 1 : `ui_multiseat_multiseatVehicles` |
| `onRaceAborted` | `gameplay_race_race` |  |
| `onRaceBranchChosen` | `scenario_waypoints` | 1 : `util_richPresence` |
| `onRaceComplete` | `gameplay_race_race` |  |
| `onRaceGoalsInitilised` | `scenario_raceGoals` | 1 : `statistics_statistics` |
| `onRaceInit` | `scenario_scenarios` | 2 : `scenario_raceGoals`, `statistics_statistics` |
| `onRaceLap` | `scenario_waypoints` | 2 : `scenario_raceUI`, `util_richPresence` |
| `onRacePathnodeReached` | `gameplay_race_race` | 2 : `career_modules_tutorial_step04timeTrial`, `gameplay_rally` |
| `onRaceResult` | `scenario_scenarios` | 6 : `core_hotlapping`, `scenario_busdriver`, `scenario_quickRace`, `scenario_raceGoals`, `statistics_statistics` … |
| `onRaceStart` | `scenario_scenarios` | 5 : `core_hotlapping`, `core_lapTimes`, `scenario_busdriver`, `scenario_raceGoals`, `scenario_raceUI` |
| `onRaceStarted` | `gameplay_race_race` | 1 : `career_modules_tutorial_step04timeTrial` |
| `onRaceStop` | *moteur* | 1 : `core_lapTimes` |
| `onRaceTick` | `scenario_scenarios` | 2 : `scenario_raceGoals`, `statistics_statistics` |
| `onRaceWaypoint` | `scenario_waypoints` |  |
| `onRaceWaypointReached` | `scenario_waypoints` | 6 : `core_checkpoints`, `core_hotlapping`, `scenario_quickRace`, `scenario_raceGoals`, `scenario_raceUI` … |
| `onRacerPhaseTransition` | `gameplay_drag_phaseHandlers` | 2 : `career_modules_tutorial_step06dragStripBasics`, `gameplay_drag_dragBridge` |
| `onRallyDataUpdated` | `flowgraph_nodes_gameplay_rally_rallyStageCountdownSetup`, `flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown`, `flowgraph_nodes_gameplay_rally_rallySuperCountdown`, `flowgraph_nodes_gameplay_rally_stageRuntimeState`, `flowgraph_nodes_gameplay_rally_trackStageTime`, `flowgraph_nodes_gameplay_rally_trackVehicleDistanceToPos` … | 2 : `gameplay_rallyLoop`, `gameplay_rallyStartClock` |
| `onRallyRegisterRace` | `flowgraph_nodes_gameplay_rally_registerRace` | 1 : `gameplay_rally` |
| `onRallyRouteRecoveryComplete` | `flowgraph_nodes_gameplay_rally_recoverInPlace`, `gameplay_rally_rallyManager` | 1 : `gameplay_rallyLoop` |
| `onRallySessionEnd` | `flowgraph_nodes_gameplay_rally_sessionStart` | 1 : `gameplay_rallyStartClock` |
| `onRallySessionStart` | `flowgraph_nodes_gameplay_rally_sessionStart` |  |
| `onRallyStageComplete` | `flowgraph_nodes_gameplay_rally_stageComplete` |  |
| `onRallyStageFlyingFinish` | `flowgraph_nodes_gameplay_rally_finish` |  |
| `onRallyVehicleRecovery` | `flowgraph_nodes_gameplay_rally_trackRecovery` | 2 : `gameplay_rally`, `gameplay_rallyLoop` |
| `onReachedTargetPos` | `gameplay_markerInteraction` | 2 : `freeroam_bigMapMode`, `ui_apps_minimap_additionalInfo` |
| `onRecalculatedRoute` | `gameplay_route_raceRoute`, `gameplay_route_route` | 1 : `gameplay_rallyLoop` |
| `onRecentDevicesChanged` | *moteur* | 2 : `core_input_bindings`, `core_vehicleTriggers` |
| `onRecoveryPromptButtonPressed` | `core_recoveryPrompt`, `telemetry_trackers_performanceSpatial` | 2 : `gameplay_tutorial_damageTracker`, `telemetry_trackers_gameplay_missions` |
| `onRecoveryPromptRepairHereUsed` | `core_recoveryPrompt` | 1 : `gameplay_tutorial_damageTracker` |
| `onRedLightCamTriggered` | `gameplay_speedTraps` | 2 : `career_modules_speedTraps`, `freeroam_freeroam` |
| `onRefuelingEndTransaction` | `career_modules_fuel` |  |
| `onRefuelingStartTransaction` | `career_modules_fuel` |  |
| `onRefuelingStopFueling` | `career_modules_fuel` |  |
| `onRegisterQuickAccessMenus` | `core_quickAccess` | 1 : `gameplay_taxi` |
| `onRelativeInput` | *moteur* | 1 : `editor_cameraV2_controller` |
| `onReloadLocales` | `core_locales` | 2 : `core_celestial`, `core_vehicle_partmgmt` |
| `onRemoveWaypoint` | *moteur* | 1 : `map` |
| `onRepairInGarage` | `career_modules_insurance_insurance` | 1 : `career_modules_delivery_general` |
| `onReplayCoreEvent` | `core_replay` | 1 : `scenario_scenarios` |
| `onReplayStateChanged` | `core_replay` | 3 : `core_audio`, `core_camera`, `freeroam_crashCamMode` |
| `onRequestMissionScreenData` | *moteur* | 2 : `gameplay_missions_missionScreen`, `gameplay_multiseat_gamemodeManager` |
| `onResetGameplay` | `flowgraph_nodes_ui_updatedUI_endScreenBegin`, `flowgraph_nodes_ui_updatedUI_endScreenWhole`, `main` | 5 : `campaign_campaigns`, `core_recoveryPrompt`, `freeroam_freeroam`, `scenario_scenarios`, `util_richPresence` |
| `onResolveVehiclePresenceMode` | `gameplay_seatOccupants` |  |
| `onResumeCampaign` | *moteur* | 4 : `campaign_dealer`, `core_checkpoints`, `core_inventory`, `statistics_statistics` |
| `onRootRouteEnter` | *moteur* | 1 : `ui_vehicleSelector_general` |
| `onRootRouteLeave` | *moteur* | 1 : `ui_vehicleSelector_general` |
| `onRootRouteMount` | *moteur* | 1 : `ui_vehicleSelector_general` |
| `onRouteEnter` | *moteur* | 4 : `career_modules_partShopping`, `career_modules_vehicleShopping`, `trackbuilder_trackBuilder`, `ui_gridSelectorRouteLifecycleCallbacks` |
| `onRouteLeave` | *moteur* | 3 : `career_modules_playerAbstract`, `trackbuilder_trackBuilder`, `ui_gridSelectorRouteLifecycleCallbacks` |
| `onRouteMount` | *moteur* | 9 : `career_modules_painting`, `career_modules_partInventory`, `career_modules_partShopping`, `career_modules_playerAbstract`, `career_modules_vehiclePerformance` … |
| `onRouteTiming` | *moteur* | 1 : `telemetry_trackers_ui` |
| `onSaveCampaign` | `campaign_campaignsLoader` | 5 : `campaign_campaigns`, `campaign_dealer`, `core_checkpoints`, `core_inventory`, `statistics_statistics` |
| `onSaveCurrentProfile` | `career_saveSystem` | 23 : `career_branches`, `career_career`, `career_modules_delivery_general`, `career_modules_insurance_insurance`, `career_modules_inventory` … |
| `onSaveCurrentProfileAsyncStart` | `career_saveSystem` | 1 : `career_modules_inventory` |
| `onSaveFinished` | `career_saveSystem` | 2 : `career_modules_partInventory`, `ui_pause_actions` |
| `onScenarioChange` | `scenario_scenarios` | 9 : `campaign_campaigns`, `campaign_comics`, `core_camera`, `scenario_demolitionDerby`, `scenario_raceDebug` … |
| `onScenarioFinished` | `scenario_scenarios` | 2 : `gameplay_statistic`, `telemetry_trackers_level` |
| `onScenarioFlashMessage` | *moteur* | 1 : `ui_appContainers_topCenter` |
| `onScenarioFlashMessageClear` | *moteur* | 1 : `ui_appContainers_topCenter` |
| `onScenarioLoaded` | `scenario_scenarios` | 5 : `gameplay_statistic`, `scenario_busdriver`, `scenario_quickRace`, `telemetry_trackers_level`, `util_trackBuilder_quickraceSetup` |
| `onScenarioNotRunning` | *moteur* | 1 : `ui_appContainers_topCenter` |
| `onScenarioRestarted` | `scenario_scenarios` | 7 : `core_camera`, `core_checkpoints`, `gameplay_statistic`, `scenario_busdriver`, `scenario_waypoints` … |
| `onScenarioUIReady` | `scenario_scenarios` | 1 : `scenario_scenarios` |
| `onScenarioVehicleTrigger` | *moteur* | 1 : `scenario_waypoints` |
| `onSchemeCommand` | *moteur* | 1 : `core_commandhandler` |
| `onScreenFadeState` | `ui_fadeScreen` | 10 : `career_modules_inventory`, `career_modules_tutorial_step04timeTrial`, `core_hotlapping`, `core_recoveryPrompt`, `gameplay_lowPerformance` … |
| `onScreenFadeStateDelayed` | *moteur* | 1 : `ui_fadeScreen` |
| `onScreenKeyboardClosed` | `main` | 1 : `core_onScreenKeyboard` |
| `onScreenshotAllDone` | `screenshot` | 3 : `ui_pause_photomode`, `ui_photomode_capture`, `util_photomodeFlash` |
| `onScreenshotCreatorCollectFramingModes` | `util_screenshotCreator_framingManager` | 4 : `util_screenshotCreator_framing_configured`, `util_screenshotCreator_framing_isometric`, `util_screenshotCreator_framing_legacy`, `util_screenshotCreator_framing_procedural` |
| `onSeatOccupantEnter` | `gameplay_seatOccupants` | 2 : `gameplay_rally`, `ui_pause_vehicleConfigurationOccupants` |
| `onSeatOccupantExit` | `gameplay_seatOccupants` | 2 : `gameplay_rally`, `ui_pause_vehicleConfigurationOccupants` |
| `onSelectAll` | *moteur* | 1 : `editor_meshEditor` |
| `onSelectDetailPromptClicked` | *moteur* | 1 : `gameplay_markerInteraction` |
| `onSerialize` | *moteur* | 149 : `campaign_campaigns`, `campaign_dealer`, `career_career`, `career_saveSystem`, `core_audio` … |
| `onSetBigmapNavFocus` | `freeroam_bigMapMode` | 4 : `career_modules_delivery_general`, `career_modules_tutorial_step07bigmap`, `gameplay_taxi`, `ui_apps_minimap_additionalInfo` |
| `onSetClusterPosRelRot` | `main` |  |
| `onSetProfile` | `career_saveSystem` |  |
| `onSettingsChanged` | `core_settings_settings`, `util_docCreator` | 25 : `core_camera`, `core_groundMarkers`, `core_input_bindings`, `core_locales`, `core_multiseatCamera` … |
| `onSettingsEnter` | *moteur* | 1 : `ui_multiseat_multiseatSettings` |
| `onSettingsLeave` | *moteur* | 1 : `ui_multiseat_multiseatSettings` |
| `onShiftModeSelectedViaPopup` | *moteur* | 1 : `career_modules_tutorial_step01enterVehicle` |
| `onShoppingMenuClosed` | *moteur* | 1 : `career_modules_vehicleShopping` |
| `onSimTimePauseCalled` | `simTimeAuthority` |  |
| `onSkipCalled` | *moteur* | 1 : `gameplay_taxi` |
| `onSlowDownCalled` | *moteur* | 1 : `gameplay_taxi` |
| `onSnapshotCreate` | `core_snapshot` |  |
| `onSnapshotLoad` | `core_snapshot` |  |
| `onSnapshotSchemeCommand` | *moteur* | 1 : `core_snapshot` |
| `onSpawnCCallback` | `core_vehicle_manager` | 3 : `core_multiSpawn`, `gameplay_crawl_utils`, `gameplay_garageMode` |
| `onSpawnDefaultVehicle` | `core_vehicles` | 1 : `gameplay_statistic` |
| `onSpawnPointTileClick` | *moteur* | 1 : `freeroam_freeroamConfigurator` |
| `onSpawnPointUnlocked` | `career_modules_spawnPoints` |  |
| `onSpeedTrapTriggered` | `gameplay_speedTraps` | 3 : `career_modules_milestones_generalMilestones_speedTraps`, `career_modules_speedTraps`, `freeroam_freeroam` |
| `onSpineAnimationFinished` | *moteur* | 1 : `campaign_comics` |
| `onSplitScreenChanged` | `render_splitScreen` | 5 : `core_multiseatCamera`, `gameplay_crawl_utils`, `gameplay_seatOccupants`, `gameplay_walk`, `telemetry_trackers_splitscreen` |
| `onSplitScreenLayoutChanged` | `render_splitScreen` | 1 : `core_vehicleTriggers` |
| `onSplitScreenStartRequested` | `ui_multiseat_freeroam` | 1 : `telemetry_trackers_splitscreen` |
| `onStartScreenFinishedBuilding` | `flowgraph_nodes_ui_updatedUI_startScreenFinish`, `gameplay_multiseat_gamemodeManager` | 1 : `telemetry_trackers_gameplay_missions` |
| `onSteeringFilterChanged` | *moteur* | 1 : `telemetry_trackers_controls` |
| `onStopRecovering` | *moteur* | 1 : `telemetry_trackers_gameplay_firstDrive` |
| `onStopTaxiCalled` | *moteur* | 1 : `gameplay_taxi` |
| `onSupportReportSent` | *moteur* | 1 : `core_supportReport` |
| `onTaxiCalled` | `gameplay_taxi` | 1 : `telemetry_trackers_gameplay_other` |
| `onTaxiRideEnded` | `gameplay_taxi` | 1 : `telemetry_trackers_gameplay_other` |
| `onTaxiRideStarted` | `gameplay_taxi` | 1 : `telemetry_trackers_gameplay_other` |
| `onTaxiViewEnter` | *moteur* | 1 : `gameplay_taxi` |
| `onTelemetryEventAdded` | `telemetry_core` |  |
| `onTeleportedToGarage` | `freeroam_facilities` | 1 : `career_modules_delivery_general` |
| `onTestDriveAbandoned` | *moteur* | 1 : `career_modules_inspectVehicle` |
| `onTestDriveDamageDetected` | *moteur* | 1 : `career_modules_inspectVehicle` |
| `onTestDriveEndedAfterFade` | `career_modules_testDrive` | 1 : `career_modules_inspectVehicle` |
| `onTestDriveStarted` | `career_modules_testDrive` | 1 : `career_modules_inspectVehicle` |
| `onTexDrawPrimCompressDone` | `main` |  |
| `onThumbnailTriggered` | *moteur* | 1 : `gameplay_garageMode` |
| `onTightDriftScored` | `gameplay_drift_scoring` | 1 : `gameplay_drift_display` |
| `onTogglePause` | `simTimeAuthority` | 1 : `freeroam_crashCamMode` |
| `onToolbar_` | *moteur* | 1 : `editor_meshEditor` |
| `onTrackBuilderWindowToggled` | `trackbuilder_trackBuilder` | 1 : `telemetry_trackers_gameplay_other` |
| `onTrafficAction` | `gameplay_traffic_baseRole`, `gameplay_traffic_roles_standard`, `gameplay_traffic_vehicle` | 2 : `editor_trafficDebug`, `gameplay_police` |
| `onTrafficAmountChanged` | `gameplay_traffic` | 2 : `gameplay_pursuit_pursuit`, `telemetry_trackers_traffic` |
| `onTrafficOrParkingReady` | `gameplay_traffic` | 2 : `career_modules_playerDriving`, `freeroam_freeroam` |
| `onTrafficReservedVehiclesReady` | `gameplay_traffic` |  |
| `onTrafficSignalUpdate` | `core_trafficSignals` |  |
| `onTrafficSignalsReset` | `core_trafficSignals` |  |
| `onTrafficSpecialVehiclesProviders` | `gameplay_traffic` | 2 : `gameplay_police`, `gameplay_taxi` |
| `onTrafficStarted` | `gameplay_traffic` | 7 : `career_modules_playerDriving`, `gameplay_missions_missionManager`, `gameplay_police`, `gameplay_pursuit_pursuit`, `gameplay_taxi` … |
| `onTrafficStopped` | `gameplay_traffic` | 6 : `career_modules_playerDriving`, `gameplay_police`, `gameplay_pursuit_pursuit`, `gameplay_taxi`, `gameplay_traffic` … |
| `onTrafficVehicleAdded` | `gameplay_traffic` | 2 : `gameplay_police`, `gameplay_taxi` |
| `onTrafficVehicleCrashed` | `gameplay_traffic_vehicle` | 1 : `gameplay_taxi` |
| `onTrafficVehicleRemoved` | `gameplay_traffic` | 2 : `gameplay_police`, `gameplay_taxi` |
| `onTrailerAttached` | `core_trailerRespawn` | 2 : `career_modules_delivery_parcelManager`, `career_modules_delivery_vehicleTasks` |
| `onTrigger` | *moteur* | 1 : `core_camera` |
| `onUIContainerAppsHidden` | `ui_appContainers` |  |
| `onUIInitialised` | *moteur* | 3 : `core_gamestate`, `core_input_bindings`, `simTimeAuthority` |
| `onUIOnlineMessageHide` | *moteur* | 1 : `core_online` |
| `onUIOnlineMessageReady` | *moteur* | 1 : `core_online` |
| `onUIOpened` | *moteur* | 1 : `career_modules_painting` |
| `onUIPlayStateChanged` | *moteur* | 1 : `gameplay_markerInteraction` |
| `onUIStartButtonClicked` | `flowgraph_nodes_ui_updatedUI_startScreenBegin`, `gameplay_multiseat_gamemodeManager` | 2 : `gameplay_rallyLoop`, `telemetry_trackers_gameplay_missions` |
| `onUIStateTriggered` | *moteur* | 1 : `core_input_bindings` |
| `onUiActiveScopeChanged` | `ui_router` |  |
| `onUiChangedState` | `ui_router` | 7 : `career_modules_vehicleShopping`, `core_quickAccess`, `core_settings_graphic`, `core_sounds`, `scenario_quickRace` … |
| `onUiReady` | `main`, `ui_uiStateManager` | 6 : `core_commandhandler`, `core_modmanager`, `ui_multiseat_freeroam`, `ui_photomode_overlays`, `ui_tutorialHighlight` … |
| `onUiWaitingState` | *moteur* | 4 : `core_replay`, `gameplay_traffic`, `ui_multiseat_multiseatVehicles`, `ui_vehicleSelector_vehicleOperations` |
| `onUnlockFlagChanged` | `career_modules_unlockFlags` |  |
| `onUpdate` | `career_modules_debug_cargoContainerDebug`, `career_modules_debug_dealershipFilterDebug`, `career_modules_debug_psDuplicationChecker`, `career_modules_tether`, `career_modules_vehicleDeletionService`, `core_multiseatCamera` … | 186 : `career_modules_delivery_general`, `career_modules_delivery_generator`, `career_modules_delivery_parcelManager`, `career_modules_delivery_tasklist`, `career_modules_delivery_vehicleTasks` … |
| `onUpdate_` | *moteur* | 2 : `editor_api_dynamicDecals`, `editor_meshEditor` |
| `onValidateMultiseatGameSettings` | `ui_multiseat_multiseatSettings` | 1 : `ui_multiseat_generalSettings` |
| `onVehicleAIStateChanged` | `scenario_scenarios` | 1 : `scenario_waypoints` |
| `onVehicleActiveChanged` | `main` | 8 : `core_interAero`, `core_trailerRespawn`, `core_vehicleActivePooling`, `core_windowsConsole`, `freeroam_specialTriggers` … |
| `onVehicleAdded` | `career_modules_inventory` | 2 : `career_modules_loanerVehicles`, `career_modules_partInventory` |
| `onVehicleAddedToInventory` | `career_modules_vehicleShopping` | 4 : `career_career`, `career_modules_insurance_insurance`, `career_modules_tutorial_step09spmSignup`, `telemetry_trackers_career` |
| `onVehicleCollectionReset` | `core_vehicles` |  |
| `onVehicleColorChanged` | `core_vehicle_manager` | 1 : `gameplay_walk` |
| `onVehicleConfigTargetChanged` | `core_vehicle_configTarget` | 4 : `core_vehicle_partFocusCamera`, `core_vehicle_partmgmt`, `ui_pause_routeLifecycleCallbacks`, `ui_pause_vehicleConfigurationOccupants` |
| `onVehicleConfigurationLeave` | *moteur* | 1 : `ui_pause_routeLifecycleCallbacks` |
| `onVehicleCrashEnded` | `gameplay_util_crashDetection` | 2 : `gameplay_crashTest_scenarioManager`, `gameplay_tutorial_damageTracker` |
| `onVehicleCrashStarted` | `gameplay_util_crashDetection` | 2 : `gameplay_crashTest_scenarioManager`, `gameplay_drift_drift` |
| `onVehicleCycleSwitchPerformedByUser` | `core_input_vehicleSwitching` |  |
| `onVehicleDamaged` | *moteur* | 1 : `career_modules_vehiclePerformance` |
| `onVehicleDestroyed` | `main` | 39 : `career_modules_debug_cargoContainerDebug`, `career_modules_inspectVehicle`, `career_modules_vehicleDeletionService`, `core_camera`, `core_checkpoints` … |
| `onVehicleEditorRenderJBeams` | `editor_veMain` | 5 : `editor_vehicleEditor_liveEditor_veFlexbodyDebug`, `editor_vehicleEditor_liveEditor_veJBeamPicker`, `editor_vehicleEditor_liveEditor_veLightsDebug`, `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector`, `editor_vehicleEditor_liveEditor_vePropTransformer` |
| `onVehicleFlippedUpright` | `core_quickAccess`, `flowgraph_nodes_vehicle_flipUpright` | 1 : `gameplay_crawl_utils` |
| `onVehicleGroupRespawned` | `core_multiSpawn` |  |
| `onVehicleGroupSpawned` | `core_multiSpawn` | 5 : `editor_multiSpawnManager`, `gameplay_parking`, `gameplay_pursuit_pursuit`, `gameplay_traffic`, `util_stepHandler` |
| `onVehicleHoverEnd` | *moteur* | 1 : `ui_pause_providers_vehicleTabInteractions` |
| `onVehicleHoverStart` | *moteur* | 1 : `ui_pause_providers_vehicleTabInteractions` |
| `onVehicleMapmgrUpdate` | *moteur* | 1 : `gameplay_traffic` |
| `onVehicleMirrorsChanged` | `core_vehicleMirrors` | 1 : `core_vehicleMirrors` |
| `onVehiclePaintingUiOpened` | `career_modules_painting` |  |
| `onVehicleParkingStatus` | `gameplay_parking` | 1 : `career_modules_playerDriving` |
| `onVehiclePoolAdded` | `core_vehicleActivePooling` |  |
| `onVehiclePoolRemoved` | `core_vehicleActivePooling` |  |
| `onVehicleRPMledStateChanged` | *moteur* | 1 : `core_devices` |
| `onVehicleRemoved` | `career_modules_inventory` | 3 : `career_modules_insurance_insurance`, `career_modules_marketplace`, `career_modules_partInventory` |
| `onVehicleRepaired` | `career_modules_insurance_insurance` | 1 : `gameplay_tutorial_damageTracker` |
| `onVehicleRepairedByInsurance` | *moteur* | 1 : `career_modules_testDrive` |
| `onVehicleReplaced` | `core_vehicles` | 6 : `core_camera`, `core_vehicleBridge`, `editor_scriptAIEditor`, `gameplay_seatOccupants`, `gameplay_walk` … |
| `onVehicleReset` | *moteur* | 1 : `gameplay_crawl_utils` |
| `onVehicleResetted` | `main` | 29 : `career_modules_debug_cargoContainerDebug`, `core_camera`, `core_environment`, `core_hotlapping`, `core_nodegrabberGamepad` … |
| `onVehicleRouteEnter` | *moteur* | 1 : `ui_vehicleSelector_general` |
| `onVehicleRouteLeave` | *moteur* | 1 : `ui_vehicleSelector_general` |
| `onVehicleRouteMount` | *moteur* | 1 : `ui_vehicleSelector_general` |
| `onVehicleSaveFinished` | `career_modules_inventory` | 8 : `career_modules_insurance_insurance`, `career_modules_insurance_repairScreen`, `career_modules_missionWrapper`, `career_modules_painting`, `career_modules_partInventory` … |
| `onVehicleSelected` | *moteur* | 1 : `scenario_scenarios` |
| `onVehicleSelectorCloneCurrent` | `ui_vehicleSelector_vehicleOperations` |  |
| `onVehicleSelectorClosed` | `ui_vehicleSelector_general` |  |
| `onVehicleSelectorEnter` | *moteur* | 1 : `ui_multiseat_multiseatSettings` |
| `onVehicleSelectorGetTiles` | `ui_vehicleSelector_tiles` |  |
| `onVehicleSelectorLeave` | *moteur* | 2 : `ui_multiseat_multiseatSettings`, `ui_multiseat_multiseatVehicles` |
| `onVehicleSelectorLoadDefault` | `ui_vehicleSelector_vehicleOperations` |  |
| `onVehicleSelectorMount` | *moteur* | 1 : `ui_multiseat_multiseatSettings` |
| `onVehicleSelectorOpen` | `ui_vehicleSelector_general` |  |
| `onVehicleSelectorRemoveAll` | `ui_vehicleSelector_vehicleOperations` |  |
| `onVehicleSelectorRemoveCurrent` | `ui_vehicleSelector_vehicleOperations` |  |
| `onVehicleSelectorRemoveOthers` | `ui_vehicleSelector_vehicleOperations` |  |
| `onVehicleSelectorReplaceCurrent` | `ui_vehicleSelector_vehicleOperations` | 1 : `gameplay_statistic` |
| `onVehicleSelectorReplaceCurrentRequested` | `ui_vehicleSelector_vehicleOperations` |  |
| `onVehicleSelectorResetAll` | `ui_vehicleSelector_vehicleOperations` |  |
| `onVehicleSelectorSelectRandom` | `ui_vehicleSelector_vehicleOperations` |  |
| `onVehicleSelectorSetAsDefault` | `ui_vehicleSelector_vehicleOperations` |  |
| `onVehicleSelectorSpawnNew` | `ui_vehicleSelector_vehicleOperations` | 1 : `gameplay_statistic` |
| `onVehicleSelectorSpawnNewRequested` | `ui_vehicleSelector_vehicleOperations` |  |
| `onVehicleSelectorViewDetails` | `ui_vehicleSelector_vehicleSpecifications` |  |
| `onVehicleShoppingMenuClosed` | `career_modules_vehicleShopping` |  |
| `onVehicleShoppingMenuOpened` | `career_modules_vehicleShopping` | 1 : `career_modules_tutorial_step09spmSignup` |
| `onVehicleShoppingPurchaseMenuOpened` | `career_modules_vehicleShopping` | 1 : `career_modules_tutorial_step09spmSignup` |
| `onVehicleShoppingSelectedSellerIdChanged` | `career_modules_vehicleShopping` | 1 : `career_modules_tutorial_step09spmSignup` |
| `onVehicleShoppingVehicleShown` | `career_modules_vehicleShopping` |  |
| `onVehicleSpawnBlocked` | `ge_utils` |  |
| `onVehicleSpawnFinished` | *moteur* | 1 : `career_modules_vehicleShopping` |
| `onVehicleSpawned` | `main` | 34 : `core_camera`, `core_checkpoints`, `core_couplerCameraModifier`, `core_environment`, `core_input_bindings` … |
| `onVehicleStoppedMoving` | `scenario_scenarios` | 1 : `scenario_scenarios` |
| `onVehicleSubmitInfo` | *moteur* | 1 : `editor_scriptAIManager` |
| `onVehicleSubmitRecording` | *moteur* | 2 : `editor_scriptAIEditor`, `editor_scriptAIManager` |
| `onVehicleSwitchPerformendByUser` | `core_input_vehicleSwitching`, `ui_pause_providers_vehicleTabInteractions` | 1 : `ui_pause_providers_vehicleTabInteractions` |
| `onVehicleSwitched` | `main` | 57 : `career_modules_inspectVehicle`, `career_modules_insurance_insurance`, `career_modules_playerDriving`, `core_camera`, `core_couplerCameraModifier` … |
| `onVehicleTabInteractionRemoveAll` | `ui_pause_providers_vehicleTabInteractions` |  |
| `onVehicleTabInteractionRemoveVehicle` | `ui_pause_providers_vehicleTabInteractions` |  |
| `onVehicleTakenDamage` | `scenario_scenarios` |  |
| `onVehicleTasksFinished` | *moteur* | 1 : `career_modules_delivery_progress` |
| `onVehicleTeleportedToLastRoad` | `flowgraph_nodes_gameplay_rally_recoverInPlace`, `flowgraph_nodes_vehicle_teleportToLastRoad`, `gameplay_rally_loop_rallyLoopManager`, `gameplay_rally_rallyManager` |  |
| `onVehicleTileClick` | *moteur* | 1 : `freeroam_freeroamConfigurator` |
| `onVehicleTriggerActionLabel` | `core_vehicleTriggers` | 1 : `gameplay_seatOccupants` |
| `onVehicleTriggersExecuteLink` | `core_vehicleTriggers` | 1 : `gameplay_taxi` |
| `onWaypoint` | *moteur* | 1 : `map` |
| `onWebSocketHandlerMessage` | `util_nodeStream` |  |
| `onWindowGotFocus` | *moteur* | 4 : `editor_mapJsonEditor`, `editor_raceEditor`, `editor_rallyEditor`, `editor_trafficGatedRoadsEditor` |
| `onWindowMenuItem` | *moteur* | 8 : `editor_assetDeduplicator`, `editor_audioEventsList`, `editor_iesEditor`, `editor_multiSpawnManager`, `editor_resourceChecker` … |
| `onWindowResized` | `editor_api_gui` | 2 : `core_orthoCamera`, `trackbuilder_trackBuilder` |
| `onWinnerLightOn` | `gameplay_drag_phaseHandlers` | 1 : `gameplay_drag_display` |
| `onWizardLevelDetailRouteEnter` | *moteur* | 1 : `freeroam_freeroamConfigurator` |
| `onWizardLevelDetailRouteMount` | *moteur* | 1 : `freeroam_freeroamConfigurator` |
| `onWizardLevelsRouteEnter` | *moteur* | 1 : `freeroam_freeroamConfigurator` |
| `onWizardLevelsRouteMount` | *moteur* | 1 : `freeroam_freeroamConfigurator` |
| `onWizardRouteEnter` | *moteur* | 1 : `freeroam_freeroamConfigurator` |
| `onWizardVehicleDetailRouteEnter` | *moteur* | 1 : `freeroam_freeroamConfigurator` |
| `onWizardVehicleDetailRouteMount` | *moteur* | 1 : `freeroam_freeroamConfigurator` |
| `onWizardVehiclesRouteEnter` | *moteur* | 1 : `freeroam_freeroamConfigurator` |
| `onWizardVehiclesRouteMount` | *moteur* | 1 : `freeroam_freeroamConfigurator` |
| `onWorldReadyState` | `main`, `serverConnection` | 4 : `core_loadMapCmd`, `gameplay_statistic`, `telemetry_trackers_level`, `util_richPresence` |
| `onWritten` | *moteur* | 1 : `editor_toolUtilities_siteAssets` |
| `setDisqualifiedLights` | `gameplay_drag_phaseHandlers` |  |
| `showDisqualifiedMessage` | `gameplay_crawl_utils` |  |
| `showMissionMarkersToggled` | `core_settings_settings` |  |
| `simTimePauseCalled` | `simTimeAuthority` |  |
| `stageStarted` | `gameplay_drag_phaseHandlers` |  |
| `startDragCountdown` | `gameplay_drag_core`, `gameplay_drag_phaseHandlers` |  |
| `startFromWithinMissionInstant` | `gameplay_missions_missionManager` |  |
| `startRaceFromTree` | `gameplay_drag_display` |  |
| `stoppingVehicleDrag` | `gameplay_drag_phaseHandlers` |  |
| `taxiSettingChanged` | `core_settings_settings` |  |
| `teleportedFromBigmap` | `freeroam_bigMapMode` |  |
| `trackNewVeh` | `core_input_vehicleSwitching`, `core_quickAccess`, `ui_pause_providers_vehicleTabInteractions`, `ui_vehicleSelector_vehicleOperations` |  |
| `trackVehReset` | `core_quickAccess`, `flowgraph_nodes_vehicle_moveTo`, `ui_vehicleSelector_vehicleOperations` |  |

## Véhicule (32)

| Hook | Émis par | Écouté par |
|---|---|---|
| `onBeamBroke` | `main` |  |
| `onBeamDeformed` | `main` | 1 : `beamstate` |
| `onBeamstateActivateAutoCoupling` | *moteur* | 1 : `couplings` |
| `onBeamstateDetachCouplers` | *moteur* | 1 : `couplings` |
| `onBeamstateDisableAutoLatching` | *moteur* | 1 : `couplings` |
| `onCouplerAttached` | `main` | 10 : `advancedCouplerControl`, `beamstate`, `couplings/containerLockFollow`, `couplings/containerLockLead`, `couplings/fifthwheel` … |
| `onCouplerDetached` | `main` | 10 : `advancedCouplerControl`, `beamstate`, `couplings/containerLockFollow`, `couplings/containerLockLead`, `couplings/fifthwheel` … |
| `onCouplerFound` | `main` | 5 : `advancedCouplerControl`, `couplings/containerLockLead`, `couplings/fifthwheel`, `energyStorage`, `powertrain` |
| `onDebugDraw` | `main` | 3 : `scenario_annotate`, `scenario_shiftBooster`, `skeleton` |
| `onDebugDrawActive` | `main` |  |
| `onDebugModeChanged` | *moteur* | 1 : `aiDebugDraw` |
| `onDeserialize` | *moteur* | 5 : `bdebug`, `controller`, `energyStorage`, `vehicleController/shiftLogic/electricMotor`, `vehicleController/vehicleController` |
| `onDeserialized` | *moteur* | 3 : `ai`, `recovery`, `sounds` |
| `onExtensionLoaded` | *moteur* | 27 : `api`, `core_quickAccess`, `debug_advancedExternalDebug`, `gameplayInterface`, `gameplayInterfaceModules_interactAI` … |
| `onExtensionUnloaded` | *moteur* | 3 : `inputTests`, `mqttGrafanaDemo`, `scenario_functionFreezer` |
| `onFFBConfigChanged` | *moteur* | 1 : `hydros` |
| `onGameplayEvent` | *moteur* | 2 : `advancedCouplerControl`, `braking/transbrake` |
| `onInit` | `main` | 14 : `advancedwheeldebug`, `aeroDebug`, `core_quickAccess`, `debug_advancedExternalDebug`, `dynamicVehicleData` … |
| `onPhysicsStep` | *moteur* | 1 : `test_ffbCalibration` |
| `onPlayersChanged` | `main` | 3 : `bdebugImpl`, `protocols`, `simpleTripApp` |
| `onRecoveringBeginAllowed` | *moteur* | 1 : `recovery` |
| `onRecoveringBeginDenied` | *moteur* | 1 : `recovery` |
| `onReset` | `main` | 15 : `couplings`, `cruiseControl`, `debug_advancedExternalDebug`, `dynamicVehicleData`, `escCalibration` … |
| `onSerialize` | *moteur* | 5 : `bdebug`, `controller`, `energyStorage`, `vehicleController/shiftLogic/electricMotor`, `vehicleController/vehicleController` |
| `onSetClusterPosRelRot` | `main` |  |
| `onSettingsChanged` | `main` |  |
| `onSlidenodeDetached` | `main` |  |
| `onTireDeflated` | `beamstate` |  |
| `onTorsionbarBroken` | `main` |  |
| `onVehicleLoaded` | `main` | 1 : `api` |
| `onVehicleScenarioData` | *moteur* | 3 : `scenario_annotate`, `scenario_functionFreezer`, `scenario_shiftBooster` |
| `updateGFX` | `core_quickAccess`, `gameplayInterfaceModules_interactCargoContainers`, `gameplayStatistic`, `main`, `vehiclePerformanceData` |  |

## Commun (GE + véhicule) (57)

| Hook | Émis par | Écouté par |
|---|---|---|
| `onDeserialize` | `testFramework/MockGenerators` |  |
| `onDeserialized` | `testFramework/MockGenerators` |  |
| `onExtensionLoaded` | `testFramework/MockGenerators` | 3 : `jbeam/io`, `networking_editorToolchain`, `ui_imgui` |
| `onExtensionUnloaded` | `testFramework/MockGenerators` | 1 : `networking_editorToolchain` |
| `onFileChanged` | *moteur* | 2 : `jbeam/io`, `jbeam/loader` |
| `onImGuiReady` | *moteur* | 1 : `ui_imgui` |
| `onInit` | *moteur* | 1 : `networking_editorToolchain` |
| `onJbeamLoadingPhase1` | `jbeam/loader` | 1 : `jbeam_jbeamMod` |
| `onJbeamLoadingPhase2` | `jbeam/loader` | 1 : `jbeam_jbeamMod` |
| `onPhysicsStep` | `testFramework/MockGenerators` |  |
| `onPreRender` | *moteur* | 1 : `networking_editorToolchain` |
| `onSerialize` | `testFramework/MockGenerators` |  |
| `onUpdate` | `testFramework/MockGenerators` | 1 : `ui_improfiler` |
| `onVehicleActiveChanged` | `testFramework/MockGenerators` |  |
| `onVehicleAdded` | `testFramework/MockGenerators` |  |
| `onVehicleAddedToInventory` | `testFramework/MockGenerators` |  |
| `onVehicleBought` | `testFramework/MockGenerators` |  |
| `onVehicleCameraConfigChanged` | `testFramework/MockGenerators` |  |
| `onVehicleColorChanged` | `testFramework/MockGenerators` |  |
| `onVehicleConnectionReady` | `testFramework/MockGenerators` |  |
| `onVehicleDamaged` | `testFramework/MockGenerators` |  |
| `onVehicleDestroyed` | `testFramework/MockGenerators` |  |
| `onVehicleEditorRenderJBeams` | `testFramework/MockGenerators` |  |
| `onVehicleFlippedUpright` | `testFramework/MockGenerators` |  |
| `onVehicleGroupSpawned` | `testFramework/MockGenerators` |  |
| `onVehicleInfoReady` | `testFramework/MockGenerators` |  |
| `onVehicleLoaded` | `testFramework/MockGenerators` |  |
| `onVehicleMapmgrUpdate` | `testFramework/MockGenerators` |  |
| `onVehiclePaintingUiOpened` | `testFramework/MockGenerators` |  |
| `onVehicleParkingStatus` | `testFramework/MockGenerators` |  |
| `onVehiclePoolAdded` | `testFramework/MockGenerators` |  |
| `onVehiclePoolRemoved` | `testFramework/MockGenerators` |  |
| `onVehicleRemoved` | `testFramework/MockGenerators` |  |
| `onVehicleRemovedFromInventory` | `testFramework/MockGenerators` |  |
| `onVehicleReplaced` | `testFramework/MockGenerators` |  |
| `onVehicleReset` | `testFramework/MockGenerators` |  |
| `onVehicleResetted` | `testFramework/MockGenerators` |  |
| `onVehicleSaveFinished` | `testFramework/MockGenerators` |  |
| `onVehicleSelectorCloneCurrent` | `testFramework/MockGenerators` |  |
| `onVehicleSelectorLoadDefault` | `testFramework/MockGenerators` |  |
| `onVehicleSelectorRemoveAll` | `testFramework/MockGenerators` |  |
| `onVehicleSelectorRemoveCurrent` | `testFramework/MockGenerators` |  |
| `onVehicleSelectorRemoveOthers` | `testFramework/MockGenerators` |  |
| `onVehicleSelectorReplaceCurrent` | `testFramework/MockGenerators` |  |
| `onVehicleSelectorResetAll` | `testFramework/MockGenerators` |  |
| `onVehicleSelectorSelectRandom` | `testFramework/MockGenerators` |  |
| `onVehicleSelectorSetAsDefault` | `testFramework/MockGenerators` |  |
| `onVehicleSelectorSpawnNew` | `testFramework/MockGenerators` |  |
| `onVehicleShoppingMenuClosed` | `testFramework/MockGenerators` |  |
| `onVehicleShoppingMenuOpened` | `testFramework/MockGenerators` |  |
| `onVehicleShoppingPurchaseMenuOpened` | `testFramework/MockGenerators` |  |
| `onVehicleShoppingVehicleShown` | `testFramework/MockGenerators` |  |
| `onVehicleSpawnFinished` | `testFramework/MockGenerators` |  |
| `onVehicleSpawned` | `testFramework/MockGenerators` | 1 : `networking_editorToolchain` |
| `onVehicleSwitched` | `testFramework/MockGenerators` | 1 : `networking_editorToolchain` |
| `onVehicleTileClick` | `testFramework/MockGenerators` |  |
| `updateGFX` | `testFramework/MockGenerators` |  |

