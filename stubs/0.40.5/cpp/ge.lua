---@meta
-- tim19Atlas: C++ objects exposed to Lua (ge VM), BeamNG.drive 0.40.5 (buildbot 302427 on GitLab). Do not edit.
-- Collected from the running game by the tim19_atlas mod. Contributor: Tim0219800 (tim19Atlas). See LICENSE.

---@class ClusterShading_module
ClusterShading = {}

---@class CommercialVerifier_module
CommercialVerifier = {}
---@param ... any
---@return any
function CommercialVerifier.isCommercialLicense(...) end

---@class Device_module
Device = {}
---@param ... any
---@return any
function Device.resetRGB(...) end
---@param ... any
---@return any
function Device.setRGB(...) end

---@class Discord_module
Discord = {}
---@param ... any
---@return any
function Discord.clearActivity(...) end
---@param ... any
---@return any
function Discord.isWorking(...) end
---@param ... any
---@return any
function Discord.setActivity(...) end
---@param ... any
---@return any
function Discord.setEnabled(...) end
---@param ... any
---@return any
function Discord.updateActivity(...) end

---@class Engine_module
Engine = {}
---@param ... any
---@return any
function Engine.NodeGrabber_setFixedNodesVisible(...) end
---@param ... any
---@return any
function Engine.cancelShutdown(...) end
---@param ... any
---@return any
function Engine.castRay(...) end
---@param ... any
---@return any
function Engine.clearNeedCollisionRebuild(...) end
---@param ... any
---@return any
function Engine.generateUUID(...) end
---@param ... any
---@return any
function Engine.getCollisionDebugData(...) end
---@param ... any
---@return any
function Engine.getCurrentFpsLimitReason(...) end
---@param ... any
---@return any
function Engine.getEditorEnabled(...) end
---@param ... any
---@return any
function Engine.getFrameLog(...) end
---@param ... any
---@return any
function Engine.getGameSenseServer(...) end
---@param ... any
---@return any
function Engine.getImageData(...) end
---@param ... any
---@return any
function Engine.getNeedCollisionRebuild(...) end
---@param ... any
---@return any
function Engine.getStartingArgs(...) end
---@param ... any
---@return any
function Engine.getStartingCommandLine(...) end
---@param ... any
---@return any
function Engine.getStaticColDebugEnabled(...) end
---@param ... any
---@return any
function Engine.getStaticColDebugPosShrink(...) end
---@param ... any
---@return any
function Engine.getVulkanEnabled(...) end
---@param ... any
---@return any
function Engine.isProgramFocused(...) end
---@param ... any
---@return any
function Engine.requestShutdown(...) end
---@param ... any
---@return any
function Engine.sceneGetCameraFrustum(...) end
---@param ... any
---@return any
function Engine.setMcpPort(...) end
---@param ... any
---@return any
function Engine.setNeedCollisionRebuild(...) end
---@param ... any
---@return any
function Engine.setRenderMode(...) end
---@param ... any
---@return any
function Engine.setStaticColDebugEnabled(...) end
---@param ... any
---@return any
function Engine.setStaticColDebugPosShrink(...) end
---@param ... any
---@return any
function Engine.setVulkanEnabled(...) end
Engine.Audio = {}
---@param ... any
---@return any
function Engine.Audio.createDevice(...) end
---@param ... any
---@return any
function Engine.Audio.createSource(...) end
---@param ... any
---@return any
function Engine.Audio.deleteSource(...) end
---@param ... any
---@return any
function Engine.Audio.getActiveSources(...) end
---@param ... any
---@return any
function Engine.Audio.getAudioLengthMS(...) end
---@param ... any
---@return any
function Engine.Audio.getAudioStats(...) end
---@param ... any
---@return any
function Engine.Audio.getBanks(...) end
---@param ... any
---@return any
function Engine.Audio.getBuses(...) end
---@param ... any
---@return any
function Engine.Audio.getCanUseHardware(...) end
---@param ... any
---@return any
function Engine.Audio.getChannelVolume(...) end
---@param ... any
---@return any
function Engine.Audio.getEnvironmentRaycastCone(...) end
---@param ... any
---@return any
function Engine.Audio.getEnvironmentRaycastInfo(...) end
---@param ... any
---@return any
function Engine.Audio.getGlobalParams(...) end
---@param ... any
---@return any
function Engine.Audio.getInfo(...) end
---@param ... any
---@return any
function Engine.Audio.getSelectedDeviceInfo(...) end
---@param ... any
---@return any
function Engine.Audio.getSourceParams(...) end
---@param ... any
---@return any
function Engine.Audio.intercomPlayPacenote(...) end
---@param ... any
---@return any
function Engine.Audio.intercomStopPacenote(...) end
---@param ... any
---@return any
function Engine.Audio.playLoopKTimes(...) end
---@param ... any
---@return any
function Engine.Audio.playOnce(...) end
---@param ... any
---@return any
function Engine.Audio.resetChannelVolume(...) end
---@param ... any
---@return any
function Engine.Audio.setBusMute(...) end
---@param ... any
---@return any
function Engine.Audio.setChannelVolume(...) end
---@param ... any
---@return any
function Engine.Audio.setEnvironmentRaycastInfo(...) end
---@param ... any
---@return any
function Engine.Audio.setSourceParam(...) end
---@param ... any
---@return any
function Engine.Audio.setSourcePitch(...) end
---@param ... any
---@return any
function Engine.Audio.setSourceVolume(...) end
---@param ... any
---@return any
function Engine.Audio.stopSource(...) end
Engine.Debug = {}
---@param ... any
---@return any
function Engine.Debug.addLevelLogLua(...) end
---@param ... any
---@return any
function Engine.Debug.addLevelLogLuaNoObject(...) end
---@param ... any
---@return any
function Engine.Debug.clearLevelLogs(...) end
---@param ... any
---@return any
function Engine.Debug.dumpShapeMaterials(...) end
---@param ... any
---@return any
function Engine.Debug.dumpTransientTextures(...) end
---@param ... any
---@return any
function Engine.Debug.getFrameAllocatorStats(...) end
---@param ... any
---@return any
function Engine.Debug.getGfxResourceList(...) end
---@param ... any
---@return any
function Engine.Debug.getGpuTimings(...) end
---@param ... any
---@return any
function Engine.Debug.getLastPerformanceMetrics(...) end
---@param ... any
---@return any
function Engine.Debug.getLevelLogsLua(...) end
---@param ... any
---@return any
function Engine.Debug.setGpuTimingOverlayVisible(...) end
Engine.Online = {}
---@param ... any
---@return any
function Engine.Online.isAuthenticated(...) end
---@param ... any
---@return any
function Engine.Online.openSession(...) end
Engine.ParallaxInterior = {}
---@param ... any
---@return any
function Engine.ParallaxInterior.apply(...) end
---@param ... any
---@return any
function Engine.ParallaxInterior.getFilePath(...) end
---@param ... any
---@return any
function Engine.ParallaxInterior.getSetDefaults(...) end
---@param ... any
---@return any
function Engine.ParallaxInterior.getSets(...) end
---@param ... any
---@return any
function Engine.ParallaxInterior.getTuning(...) end
---@param ... any
---@return any
function Engine.ParallaxInterior.getTuningDefaults(...) end
---@param ... any
---@return any
function Engine.ParallaxInterior.load(...) end
---@param ... any
---@return any
function Engine.ParallaxInterior.packItemData(...) end
---@param ... any
---@return any
function Engine.ParallaxInterior.removeSet(...) end
---@param ... any
---@return any
function Engine.ParallaxInterior.save(...) end
---@param ... any
---@return any
function Engine.ParallaxInterior.setSet(...) end
---@param ... any
---@return any
function Engine.ParallaxInterior.setTuning(...) end
---@param ... any
---@return any
function Engine.ParallaxInterior.unpackItemData(...) end
Engine.Platform = {}
---@param ... any
---@return any
function Engine.Platform.bananaBenchFinished(...) end
---@param ... any
---@return any
function Engine.Platform.bananaBenchPoll(...) end
---@param ... any
---@return any
function Engine.Platform.bananaBenchRelease(...) end
---@param ... any
---@return any
function Engine.Platform.exploreFolder(...) end
---@param ... any
---@return any
function Engine.Platform.getCPUInfo(...) end
---@param ... any
---@return any
function Engine.Platform.getDiskFreeSpace(...) end
---@param ... any
---@return any
function Engine.Platform.getFSInfo(...) end
---@param ... any
---@return any
function Engine.Platform.getGFN(...) end
---@param ... any
---@return any
function Engine.Platform.getGPUAdaptersInfo(...) end
---@param ... any
---@return any
function Engine.Platform.getGPUInfo(...) end
---@param ... any
---@return any
function Engine.Platform.getKiosk(...) end
---@param ... any
---@return any
function Engine.Platform.getKioskDump(...) end
---@param ... any
---@return any
function Engine.Platform.getMemoryInfo(...) end
---@param ... any
---@return any
function Engine.Platform.getMonitorInfo(...) end
---@param ... any
---@return any
function Engine.Platform.getOSInfo(...) end
---@param ... any
---@return any
function Engine.Platform.getPlatform(...) end
---@param ... any
---@return any
function Engine.Platform.getPlatformPreset(...) end
---@param ... any
---@return any
function Engine.Platform.getPowerInfo(...) end
---@param ... any
---@return any
function Engine.Platform.getRuntime(...) end
---@param ... any
---@return any
function Engine.Platform.getSystemTimeMS(...) end
---@param ... any
---@return any
function Engine.Platform.isNetworkUnrestricted(...) end
---@param ... any
---@return any
function Engine.Platform.openFile(...) end
---@param ... any
---@return any
function Engine.Platform.runBananaBench(...) end
---@param ... any
---@return any
function Engine.Platform.runBananaBenchAsync(...) end
---@param ... any
---@return any
function Engine.Platform.runDiskUsage(...) end
---@param ... any
---@return any
function Engine.Platform.taskbarSetProgress(...) end
---@param ... any
---@return any
function Engine.Platform.taskbarSetProgressState(...) end
Engine.PlayerActionLog = {}
---@param ... any
---@return any
function Engine.PlayerActionLog.dump(...) end
---@param ... any
---@return any
function Engine.PlayerActionLog.record(...) end
Engine.Prefab = {}
---@param ... any
---@return any
function Engine.Prefab.findContainingPrefabInstance(...) end
Engine.Profiler = {}
---@param ... any
---@return any
function Engine.Profiler.popEvent(...) end
---@param ... any
---@return any
function Engine.Profiler.pushEvent(...) end
---@param ... any
---@return any
function Engine.Profiler.saveCapture(...) end
---@param ... any
---@return any
function Engine.Profiler.startCapture(...) end
---@param ... any
---@return any
function Engine.Profiler.stopCapture(...) end
Engine.Render = {}
---@param ... any
---@return any
function Engine.Render.calculateGfxMemory(...) end
---@param ... any
---@return any
function Engine.Render.compileShaderCheck(...) end
---@param ... any
---@return any
function Engine.Render.getAdapterType(...) end
---@param ... any
---@return any
function Engine.Render.getFrameId(...) end
---@param ... any
---@return any
function Engine.Render.getMemoryInfo(...) end
---@param ... any
---@return any
function Engine.Render.getShaderGenerationCount(...) end
---@param ... any
---@return any
function Engine.Render.getTextureStreamingStats(...) end
---@param ... any
---@return any
function Engine.Render.getVRAMUsage(...) end
---@param ... any
---@return any
function Engine.Render.requestImposterUpdate(...) end
---@param ... any
---@return any
function Engine.Render.setAsyncShaderCompilation(...) end
---@param ... any
---@return any
function Engine.Render.setCoconutWindowOpen(...) end
---@param ... any
---@return any
function Engine.Render.updateImposters(...) end
Engine.Render.DecalMgr = {}
---@param ... any
---@return any
function Engine.Render.DecalMgr.addDecal(...) end
---@param ... any
---@return any
function Engine.Render.DecalMgr.addDecalTangent(...) end
---@param ... any
---@return any
function Engine.Render.DecalMgr.addDecalTangentForceId(...) end
---@param ... any
---@return any
function Engine.Render.DecalMgr.getClosestDecal(...) end
---@param ... any
---@return any
function Engine.Render.DecalMgr.getDecalInstance(...) end
---@param ... any
---@return any
function Engine.Render.DecalMgr.getDecalInstanceByUid(...) end
---@param ... any
---@return any
function Engine.Render.DecalMgr.getDecalInstanceVecSize(...) end
---@param ... any
---@return any
function Engine.Render.DecalMgr.getSet(...) end
---@param ... any
---@return any
function Engine.Render.DecalMgr.notifyDecalModified(...) end
---@param ... any
---@return any
function Engine.Render.DecalMgr.offsetInstances(...) end
---@param ... any
---@return any
function Engine.Render.DecalMgr.removeDecal(...) end
---@param ... any
---@return any
function Engine.Render.DecalMgr.saveDecals(...) end
Engine.Render.DynamicDecalMgr = {}
---@param ... any
---@return any
function Engine.Render.DynamicDecalMgr.addDecal(...) end
---@param ... any
---@return any
function Engine.Render.DynamicDecalMgr.addDecals(...) end
Engine.Render.ParticleMgr = {}
---@param ... any
---@return any
function Engine.Render.ParticleMgr.setEnabled(...) end
Engine.SupportReport = {}
---@param ... any
---@return any
function Engine.SupportReport.send(...) end
Engine.UI = {}
---@param ... any
---@return any
function Engine.UI.getUIEngine(...) end
---@param ... any
---@return any
function Engine.UI.isSimpleMenu(...) end
---@param ... any
---@return any
function Engine.UI.safeAreaNormalized(...) end
---@param ... any
---@return any
function Engine.UI.setLocalSchemeVersion(...) end
Engine.fge = {}
---@param ... any
---@return any
function Engine.fge.AcceptCopy(...) end
---@param ... any
---@return any
function Engine.fge.AcceptCreateNode(...) end
---@param ... any
---@return any
function Engine.fge.AcceptCut(...) end
---@param ... any
---@return any
function Engine.fge.AcceptDeletedItem(...) end
---@param ... any
---@return any
function Engine.fge.AcceptDuplicate(...) end
---@param ... any
---@return any
function Engine.fge.AcceptNewItem1(...) end
---@param ... any
---@return any
function Engine.fge.AcceptNewItem2(...) end
---@param ... any
---@return any
function Engine.fge.AcceptPaste(...) end
---@param ... any
---@return any
function Engine.fge.AreShortcutsEnabled(...) end
---@param ... any
---@return any
function Engine.fge.Begin(...) end
---@param ... any
---@return any
function Engine.fge.BeginCreate(...) end
---@param ... any
---@return any
function Engine.fge.BeginDelete(...) end
---@param ... any
---@return any
function Engine.fge.BeginGroupHint(...) end
---@param ... any
---@return any
function Engine.fge.BeginNode(...) end
---@param ... any
---@return any
function Engine.fge.BeginPin(...) end
---@param ... any
---@return any
function Engine.fge.BeginShortcut(...) end
---@param ... any
---@return any
function Engine.fge.CanvasToScreen(...) end
---@param ... any
---@return any
function Engine.fge.CenterNodeOnScreen(...) end
---@param ... any
---@return any
function Engine.fge.ClearDirty(...) end
---@param ... any
---@return any
function Engine.fge.ClearSelection(...) end
---@param ... any
---@return any
function Engine.fge.CreateEditor(...) end
---@param ... any
---@return any
function Engine.fge.DeleteLink(...) end
---@param ... any
---@return any
function Engine.fge.DeleteNode(...) end
---@param ... any
---@return any
function Engine.fge.DeselectLink(...) end
---@param ... any
---@return any
function Engine.fge.DeselectNode(...) end
---@param ... any
---@return any
function Engine.fge.DestroyEditor(...) end
---@param ... any
---@return any
function Engine.fge.DrawIcon(...) end
---@param ... any
---@return any
function Engine.fge.EnableShortcuts(...) end
---@param ... any
---@return any
function Engine.fge.End(...) end
---@param ... any
---@return any
function Engine.fge.EndCreate(...) end
---@param ... any
---@return any
function Engine.fge.EndDelete(...) end
---@param ... any
---@return any
function Engine.fge.EndGroupHint(...) end
---@param ... any
---@return any
function Engine.fge.EndNode(...) end
---@param ... any
---@return any
function Engine.fge.EndPin(...) end
---@param ... any
---@return any
function Engine.fge.EndShortcut(...) end
---@param ... any
---@return any
function Engine.fge.FindLinkAt(...) end
---@param ... any
---@return any
function Engine.fge.Flow(...) end
---@param ... any
---@return any
function Engine.fge.GetActionContextLinkIds(...) end
---@param ... any
---@return any
function Engine.fge.GetActionContextNodeIds(...) end
---@param ... any
---@return any
function Engine.fge.GetActionContextSize(...) end
---@param ... any
---@return any
function Engine.fge.GetCurrentEditor(...) end
---@param ... any
---@return any
function Engine.fge.GetCurrentZoom(...) end
---@param ... any
---@return any
function Engine.fge.GetDirtyReason(...) end
---@param ... any
---@return any
function Engine.fge.GetDoubleClickedLink(...) end
---@param ... any
---@return any
function Engine.fge.GetDoubleClickedNode(...) end
---@param ... any
---@return any
function Engine.fge.GetDoubleClickedPin(...) end
---@param ... any
---@return any
function Engine.fge.GetGroupMax(...) end
---@param ... any
---@return any
function Engine.fge.GetGroupMin(...) end
---@param ... any
---@return any
function Engine.fge.GetHintBackgroundDrawList(...) end
---@param ... any
---@return any
function Engine.fge.GetHintForegroundDrawList(...) end
---@param ... any
---@return any
function Engine.fge.GetHotObjectId(...) end
---@param ... any
---@return any
function Engine.fge.GetNodeBackgroundDrawList(...) end
---@param ... any
---@return any
function Engine.fge.GetNodePosition(...) end
---@param ... any
---@return any
function Engine.fge.GetNodeSize(...) end
---@param ... any
---@return any
function Engine.fge.GetScreenSize(...) end
---@param ... any
---@return any
function Engine.fge.GetSelectedLinkIds(...) end
---@param ... any
---@return any
function Engine.fge.GetSelectedNodeIds(...) end
---@param ... any
---@return any
function Engine.fge.GetSelectedObjectCount(...) end
---@param ... any
---@return any
function Engine.fge.GetStyle(...) end
---@param ... any
---@return any
function Engine.fge.GetStyleColorName(...) end
---@param ... any
---@return any
function Engine.fge.Group(...) end
---@param ... any
---@return any
function Engine.fge.HasSelectionChanged(...) end
---@param ... any
---@return any
function Engine.fge.Icon(...) end
---@param ... any
---@return any
function Engine.fge.IsActive(...) end
---@param ... any
---@return any
function Engine.fge.IsBackgroundClicked(...) end
---@param ... any
---@return any
function Engine.fge.IsBackgroundDoubleClicked(...) end
---@param ... any
---@return any
function Engine.fge.IsSuspended(...) end
---@param ... any
---@return any
function Engine.fge.Link(...) end
---@param ... any
---@return any
function Engine.fge.NavigateToContent(...) end
---@param ... any
---@return any
function Engine.fge.NavigateToSelection(...) end
---@param ... any
---@return any
function Engine.fge.PinHadAnyLinks(...) end
---@param ... any
---@return any
function Engine.fge.PinPivotAlignment(...) end
---@param ... any
---@return any
function Engine.fge.PinPivotRect(...) end
---@param ... any
---@return any
function Engine.fge.PinPivotScale(...) end
---@param ... any
---@return any
function Engine.fge.PinPivotSize(...) end
---@param ... any
---@return any
function Engine.fge.PinRect(...) end
---@param ... any
---@return any
function Engine.fge.PopStyleColor(...) end
---@param ... any
---@return any
function Engine.fge.PopStyleVar(...) end
---@param ... any
---@return any
function Engine.fge.PushStyleColor(...) end
---@param ... any
---@return any
function Engine.fge.PushStyleVar1(...) end
---@param ... any
---@return any
function Engine.fge.PushStyleVar2(...) end
---@param ... any
---@return any
function Engine.fge.PushStyleVar4(...) end
---@param ... any
---@return any
function Engine.fge.QueryDeletedLink(...) end
---@param ... any
---@return any
function Engine.fge.QueryDeletedNode(...) end
---@param ... any
---@return any
function Engine.fge.QueryNewLink1(...) end
---@param ... any
---@return any
function Engine.fge.QueryNewLink2(...) end
---@param ... any
---@return any
function Engine.fge.QueryNewNode1(...) end
---@param ... any
---@return any
function Engine.fge.QueryNewNode2(...) end
---@param ... any
---@return any
function Engine.fge.RejectDeletedItem(...) end
---@param ... any
---@return any
function Engine.fge.RejectNewItem1(...) end
---@param ... any
---@return any
function Engine.fge.RejectNewItem2(...) end
---@param ... any
---@return any
function Engine.fge.RestoreNodeState(...) end
---@param ... any
---@return any
function Engine.fge.Resume(...) end
---@param ... any
---@return any
function Engine.fge.ScreenToCanvas(...) end
---@param ... any
---@return any
function Engine.fge.SelectLink(...) end
---@param ... any
---@return any
function Engine.fge.SelectNode(...) end
---@param ... any
---@return any
function Engine.fge.SetCurrentEditor(...) end
---@param ... any
---@return any
function Engine.fge.SetGroupingDisabled(...) end
---@param ... any
---@return any
function Engine.fge.SetNodePosition(...) end
---@param ... any
---@return any
function Engine.fge.ShowBackgroundContextMenu(...) end
---@param ... any
---@return any
function Engine.fge.ShowLinkContextMenu(...) end
---@param ... any
---@return any
function Engine.fge.ShowNodeContextMenu(...) end
---@param ... any
---@return any
function Engine.fge.ShowPinContextMenu(...) end
---@param ... any
---@return any
function Engine.fge.Suspend(...) end
---@param ... any
---@return any
function Engine.fge.getDebugEnabled(...) end
---@param ... any
---@return any
function Engine.fge.getViewState(...) end
---@param ... any
---@return any
function Engine.fge.getVisibleBounds(...) end
---@param ... any
---@return any
function Engine.fge.setDebugEnabled(...) end
---@param ... any
---@return any
function Engine.fge.setViewState(...) end
Engine.fge.EditorContext = {}
Engine.fge.LinkId = {}
Engine.fge.NodeId = {}
Engine.fge.PinId = {}
Engine.fge.Style = {}
Engine.fge.enum = {}
Engine.imgui = {}
---@param ... any
---@return any
function Engine.imgui.AcceptDragDropPayload(...) end
---@param ... any
---@return any
function Engine.imgui.AlignTextToFramePadding(...) end
---@param ... any
---@return any
function Engine.imgui.ArrowButton(...) end
---@param ... any
---@return any
function Engine.imgui.Begin(...) end
---@param ... any
---@return any
function Engine.imgui.BeginChild1(...) end
---@param ... any
---@return any
function Engine.imgui.BeginChild2(...) end
---@param ... any
---@return any
function Engine.imgui.BeginChildFrame(...) end
---@param ... any
---@return any
function Engine.imgui.BeginCombo(...) end
---@param ... any
---@return any
function Engine.imgui.BeginDisabled(...) end
---@param ... any
---@return any
function Engine.imgui.BeginDragDropSource(...) end
---@param ... any
---@return any
function Engine.imgui.BeginDragDropTarget(...) end
---@param ... any
---@return any
function Engine.imgui.BeginGroup(...) end
---@param ... any
---@return any
function Engine.imgui.BeginItemTooltip(...) end
---@param ... any
---@return any
function Engine.imgui.BeginListBox(...) end
---@param ... any
---@return any
function Engine.imgui.BeginMainMenuBar(...) end
---@param ... any
---@return any
function Engine.imgui.BeginMenu(...) end
---@param ... any
---@return any
function Engine.imgui.BeginMenuBar(...) end
---@param ... any
---@return any
function Engine.imgui.BeginPopup(...) end
---@param ... any
---@return any
function Engine.imgui.BeginPopupContextItem(...) end
---@param ... any
---@return any
function Engine.imgui.BeginPopupContextVoid(...) end
---@param ... any
---@return any
function Engine.imgui.BeginPopupContextWindow(...) end
---@param ... any
---@return any
function Engine.imgui.BeginPopupModal(...) end
---@param ... any
---@return any
function Engine.imgui.BeginTabBar(...) end
---@param ... any
---@return any
function Engine.imgui.BeginTabItem(...) end
---@param ... any
---@return any
function Engine.imgui.BeginTable(...) end
---@param ... any
---@return any
function Engine.imgui.BeginTooltip(...) end
---@param ... any
---@return any
function Engine.imgui.Bullet(...) end
---@param ... any
---@return any
function Engine.imgui.BulletText(...) end
---@param ... any
---@return any
function Engine.imgui.Button(...) end
---@param ... any
---@return any
function Engine.imgui.CalcItemWidth(...) end
---@param ... any
---@return any
function Engine.imgui.CalcTextSize(...) end
---@param ... any
---@return any
function Engine.imgui.Checkbox(...) end
---@param ... any
---@return any
function Engine.imgui.CheckboxFlags1(...) end
---@param ... any
---@return any
function Engine.imgui.CheckboxFlags2(...) end
---@param ... any
---@return any
function Engine.imgui.ClearActiveID(...) end
---@param ... any
---@return any
function Engine.imgui.CloseCurrentPopup(...) end
---@param ... any
---@return any
function Engine.imgui.CollapsingHeader1(...) end
---@param ... any
---@return any
function Engine.imgui.CollapsingHeader2(...) end
---@param ... any
---@return any
function Engine.imgui.ColorButton(...) end
---@param ... any
---@return any
function Engine.imgui.ColorConvertFloat4ToU32(...) end
---@param ... any
---@return any
function Engine.imgui.ColorConvertHSVtoRGB(...) end
---@param ... any
---@return any
function Engine.imgui.ColorConvertRGBtoHSV(...) end
---@param ... any
---@return any
function Engine.imgui.ColorConvertU32ToFloat4(...) end
---@param ... any
---@return any
function Engine.imgui.ColorEdit3(...) end
---@param ... any
---@return any
function Engine.imgui.ColorEdit4(...) end
---@param ... any
---@return any
function Engine.imgui.ColorPicker3(...) end
---@param ... any
---@return any
function Engine.imgui.ColorPicker4(...) end
---@param ... any
---@return any
function Engine.imgui.Columns(...) end
---@param ... any
---@return any
function Engine.imgui.Combo1(...) end
---@param ... any
---@return any
function Engine.imgui.Combo2(...) end
---@param ... any
---@return any
function Engine.imgui.Combo3(...) end
---@param ... any
---@return any
function Engine.imgui.DebugCheckVersionAndDataLayout(...) end
---@param ... any
---@return any
function Engine.imgui.DebugTextEncoding(...) end
---@param ... any
---@return any
function Engine.imgui.DestroyPlatformWindows(...) end
---@param ... any
---@return any
function Engine.imgui.DockBuilderAddNode2(...) end
---@param ... any
---@return any
function Engine.imgui.DockBuilderDockWindow(...) end
---@param ... any
---@return any
function Engine.imgui.DockBuilderFinish(...) end
---@param ... any
---@return any
function Engine.imgui.DockBuilderSplitNode(...) end
---@param ... any
---@return any
function Engine.imgui.DockSpace(...) end
---@param ... any
---@return any
function Engine.imgui.DockSpaceOverViewport(...) end
---@param ... any
---@return any
function Engine.imgui.DragFloat(...) end
---@param ... any
---@return any
function Engine.imgui.DragFloat2(...) end
---@param ... any
---@return any
function Engine.imgui.DragFloat3(...) end
---@param ... any
---@return any
function Engine.imgui.DragFloat4(...) end
---@param ... any
---@return any
function Engine.imgui.DragFloatRange2(...) end
---@param ... any
---@return any
function Engine.imgui.DragInt(...) end
---@param ... any
---@return any
function Engine.imgui.DragInt2(...) end
---@param ... any
---@return any
function Engine.imgui.DragInt3(...) end
---@param ... any
---@return any
function Engine.imgui.DragInt4(...) end
---@param ... any
---@return any
function Engine.imgui.DragIntRange2(...) end
---@param ... any
---@return any
function Engine.imgui.Dummy(...) end
---@param ... any
---@return any
function Engine.imgui.End(...) end
---@param ... any
---@return any
function Engine.imgui.EndChild(...) end
---@param ... any
---@return any
function Engine.imgui.EndChildFrame(...) end
---@param ... any
---@return any
function Engine.imgui.EndCombo(...) end
---@param ... any
---@return any
function Engine.imgui.EndDisabled(...) end
---@param ... any
---@return any
function Engine.imgui.EndDragDropSource(...) end
---@param ... any
---@return any
function Engine.imgui.EndDragDropTarget(...) end
---@param ... any
---@return any
function Engine.imgui.EndFrame(...) end
---@param ... any
---@return any
function Engine.imgui.EndGroup(...) end
---@param ... any
---@return any
function Engine.imgui.EndListBox(...) end
---@param ... any
---@return any
function Engine.imgui.EndMainMenuBar(...) end
---@param ... any
---@return any
function Engine.imgui.EndMenu(...) end
---@param ... any
---@return any
function Engine.imgui.EndMenuBar(...) end
---@param ... any
---@return any
function Engine.imgui.EndPopup(...) end
---@param ... any
---@return any
function Engine.imgui.EndTabBar(...) end
---@param ... any
---@return any
function Engine.imgui.EndTabItem(...) end
---@param ... any
---@return any
function Engine.imgui.EndTable(...) end
---@param ... any
---@return any
function Engine.imgui.EndTooltip(...) end
---@param ... any
---@return any
function Engine.imgui.FindViewportByID(...) end
---@param ... any
---@return any
function Engine.imgui.FindViewportByPlatformHandle(...) end
---@param ... any
---@return any
function Engine.imgui.GetBackgroundDrawList1(...) end
---@param ... any
---@return any
function Engine.imgui.GetBackgroundDrawList2(...) end
---@param ... any
---@return any
function Engine.imgui.GetClipboardText(...) end
---@param ... any
---@return any
function Engine.imgui.GetColorU321(...) end
---@param ... any
---@return any
function Engine.imgui.GetColorU322(...) end
---@param ... any
---@return any
function Engine.imgui.GetColorU323(...) end
---@param ... any
---@return any
function Engine.imgui.GetColumnIndex(...) end
---@param ... any
---@return any
function Engine.imgui.GetColumnOffset(...) end
---@param ... any
---@return any
function Engine.imgui.GetColumnWidth(...) end
---@param ... any
---@return any
function Engine.imgui.GetColumnsCount(...) end
---@param ... any
---@return any
function Engine.imgui.GetConfigFlagsViewportsEnable(...) end
---@param ... any
---@return any
function Engine.imgui.GetContentRegionAvail(...) end
---@param ... any
---@return any
function Engine.imgui.GetContentRegionAvailXY(...) end
---@param ... any
---@return any
function Engine.imgui.GetContentRegionMax(...) end
---@param ... any
---@return any
function Engine.imgui.GetCurrentContext(...) end
---@param ... any
---@return any
function Engine.imgui.GetCursorPos(...) end
---@param ... any
---@return any
function Engine.imgui.GetCursorPosX(...) end
---@param ... any
---@return any
function Engine.imgui.GetCursorPosY(...) end
---@param ... any
---@return any
function Engine.imgui.GetCursorScreenPos(...) end
---@param ... any
---@return any
function Engine.imgui.GetCursorStartPos(...) end
---@param ... any
---@return any
function Engine.imgui.GetDragDropPayload(...) end
---@param ... any
---@return any
function Engine.imgui.GetDrawListSharedData(...) end
---@param ... any
---@return any
function Engine.imgui.GetFont(...) end
---@param ... any
---@return any
function Engine.imgui.GetFontSize(...) end
---@param ... any
---@return any
function Engine.imgui.GetFontTexUvWhitePixel(...) end
---@param ... any
---@return any
function Engine.imgui.GetForegroundDrawList1(...) end
---@param ... any
---@return any
function Engine.imgui.GetForegroundDrawList2(...) end
---@param ... any
---@return any
function Engine.imgui.GetFrameCount(...) end
---@param ... any
---@return any
function Engine.imgui.GetFrameHeight(...) end
---@param ... any
---@return any
function Engine.imgui.GetFrameHeightWithSpacing(...) end
---@param ... any
---@return any
function Engine.imgui.GetID1(...) end
---@param ... any
---@return any
function Engine.imgui.GetID2(...) end
---@param ... any
---@return any
function Engine.imgui.GetID3(...) end
---@param ... any
---@return any
function Engine.imgui.GetIO(...) end
---@param ... any
---@return any
function Engine.imgui.GetItemID(...) end
---@param ... any
---@return any
function Engine.imgui.GetItemRectMax(...) end
---@param ... any
---@return any
function Engine.imgui.GetItemRectMin(...) end
---@param ... any
---@return any
function Engine.imgui.GetItemRectSize(...) end
---@param ... any
---@return any
function Engine.imgui.GetKeyIndex(...) end
---@param ... any
---@return any
function Engine.imgui.GetKeyName(...) end
---@param ... any
---@return any
function Engine.imgui.GetKeyPressedAmount(...) end
---@param ... any
---@return any
function Engine.imgui.GetMainContext(...) end
---@param ... any
---@return any
function Engine.imgui.GetMainViewport(...) end
---@param ... any
---@return any
function Engine.imgui.GetMouseClickedCount(...) end
---@param ... any
---@return any
function Engine.imgui.GetMouseCursor(...) end
---@param ... any
---@return any
function Engine.imgui.GetMouseDragDelta(...) end
---@param ... any
---@return any
function Engine.imgui.GetMousePos(...) end
---@param ... any
---@return any
function Engine.imgui.GetMousePosOnOpeningCurrentPopup(...) end
---@param ... any
---@return any
function Engine.imgui.GetPlatformIO(...) end
---@param ... any
---@return any
function Engine.imgui.GetScrollMaxX(...) end
---@param ... any
---@return any
function Engine.imgui.GetScrollMaxY(...) end
---@param ... any
---@return any
function Engine.imgui.GetScrollX(...) end
---@param ... any
---@return any
function Engine.imgui.GetScrollY(...) end
---@param ... any
---@return any
function Engine.imgui.GetStateStorage(...) end
---@param ... any
---@return any
function Engine.imgui.GetStyle(...) end
---@param ... any
---@return any
function Engine.imgui.GetStyleColorName(...) end
---@param ... any
---@return any
function Engine.imgui.GetStyleColorVec4(...) end
---@param ... any
---@return any
function Engine.imgui.GetTextLineHeight(...) end
---@param ... any
---@return any
function Engine.imgui.GetTextLineHeightWithSpacing(...) end
---@param ... any
---@return any
function Engine.imgui.GetTime(...) end
---@param ... any
---@return any
function Engine.imgui.GetTreeNodeToLabelSpacing(...) end
---@param ... any
---@return any
function Engine.imgui.GetVersion(...) end
---@param ... any
---@return any
function Engine.imgui.GetWindowContentRegionMax(...) end
---@param ... any
---@return any
function Engine.imgui.GetWindowContentRegionMin(...) end
---@param ... any
---@return any
function Engine.imgui.GetWindowDockID(...) end
---@param ... any
---@return any
function Engine.imgui.GetWindowDpiScale(...) end
---@param ... any
---@return any
function Engine.imgui.GetWindowDrawList(...) end
---@param ... any
---@return any
function Engine.imgui.GetWindowHeight(...) end
---@param ... any
---@return any
function Engine.imgui.GetWindowPos(...) end
---@param ... any
---@return any
function Engine.imgui.GetWindowPosXY(...) end
---@param ... any
---@return any
function Engine.imgui.GetWindowSize(...) end
---@param ... any
---@return any
function Engine.imgui.GetWindowViewport(...) end
---@param ... any
---@return any
function Engine.imgui.GetWindowWidth(...) end
---@param ... any
---@return any
function Engine.imgui.Image(...) end
---@param ... any
---@return any
function Engine.imgui.ImageButton(...) end
---@param ... any
---@return any
function Engine.imgui.Indent(...) end
---@param ... any
---@return any
function Engine.imgui.InputDouble(...) end
---@param ... any
---@return any
function Engine.imgui.InputFloat(...) end
---@param ... any
---@return any
function Engine.imgui.InputFloat2(...) end
---@param ... any
---@return any
function Engine.imgui.InputFloat3(...) end
---@param ... any
---@return any
function Engine.imgui.InputFloat4(...) end
---@param ... any
---@return any
function Engine.imgui.InputInt(...) end
---@param ... any
---@return any
function Engine.imgui.InputInt2(...) end
---@param ... any
---@return any
function Engine.imgui.InputInt3(...) end
---@param ... any
---@return any
function Engine.imgui.InputInt4(...) end
---@param ... any
---@return any
function Engine.imgui.InputText(...) end
---@param ... any
---@return any
function Engine.imgui.InputTextMultiline(...) end
---@param ... any
---@return any
function Engine.imgui.InputTextWithHint(...) end
---@param ... any
---@return any
function Engine.imgui.InvisibleButton(...) end
---@param ... any
---@return any
function Engine.imgui.IoFontsGetCount(...) end
---@param ... any
---@return any
function Engine.imgui.IoFontsGetName(...) end
---@param ... any
---@return any
function Engine.imgui.IsAnyItemActive(...) end
---@param ... any
---@return any
function Engine.imgui.IsAnyItemFocused(...) end
---@param ... any
---@return any
function Engine.imgui.IsAnyItemHovered(...) end
---@param ... any
---@return any
function Engine.imgui.IsAnyMouseDown(...) end
---@param ... any
---@return any
function Engine.imgui.IsItemActivated(...) end
---@param ... any
---@return any
function Engine.imgui.IsItemActive(...) end
---@param ... any
---@return any
function Engine.imgui.IsItemClicked(...) end
---@param ... any
---@return any
function Engine.imgui.IsItemDeactivated(...) end
---@param ... any
---@return any
function Engine.imgui.IsItemDeactivatedAfterEdit(...) end
---@param ... any
---@return any
function Engine.imgui.IsItemEdited(...) end
---@param ... any
---@return any
function Engine.imgui.IsItemFocused(...) end
---@param ... any
---@return any
function Engine.imgui.IsItemHovered(...) end
---@param ... any
---@return any
function Engine.imgui.IsItemToggledOpen(...) end
---@param ... any
---@return any
function Engine.imgui.IsItemVisible(...) end
---@param ... any
---@return any
function Engine.imgui.IsKeyDown(...) end
---@param ... any
---@return any
function Engine.imgui.IsKeyPressed(...) end
---@param ... any
---@return any
function Engine.imgui.IsKeyReleased(...) end
---@param ... any
---@return any
function Engine.imgui.IsMouseClicked(...) end
---@param ... any
---@return any
function Engine.imgui.IsMouseDoubleClicked(...) end
---@param ... any
---@return any
function Engine.imgui.IsMouseDown(...) end
---@param ... any
---@return any
function Engine.imgui.IsMouseDragging(...) end
---@param ... any
---@return any
function Engine.imgui.IsMouseHoveringRect(...) end
---@param ... any
---@return any
function Engine.imgui.IsMousePosValid(...) end
---@param ... any
---@return any
function Engine.imgui.IsMouseReleased(...) end
---@param ... any
---@return any
function Engine.imgui.IsPopupOpen(...) end
---@param ... any
---@return any
function Engine.imgui.IsRectVisible1(...) end
---@param ... any
---@return any
function Engine.imgui.IsRectVisible2(...) end
---@param ... any
---@return any
function Engine.imgui.IsWindowAppearing(...) end
---@param ... any
---@return any
function Engine.imgui.IsWindowCollapsed(...) end
---@param ... any
---@return any
function Engine.imgui.IsWindowDocked(...) end
---@param ... any
---@return any
function Engine.imgui.IsWindowFocused(...) end
---@param ... any
---@return any
function Engine.imgui.IsWindowHovered(...) end
---@param ... any
---@return any
function Engine.imgui.Knob(...) end
---@param ... any
---@return any
function Engine.imgui.KnobInt(...) end
---@param ... any
---@return any
function Engine.imgui.LabelText(...) end
---@param ... any
---@return any
function Engine.imgui.ListBox1(...) end
---@param ... any
---@return any
function Engine.imgui.ListBox2(...) end
---@param ... any
---@return any
function Engine.imgui.LoadIniSettingsFromDisk(...) end
---@param ... any
---@return any
function Engine.imgui.LogButtons(...) end
---@param ... any
---@return any
function Engine.imgui.LogFinish(...) end
---@param ... any
---@return any
function Engine.imgui.LogToClipboard(...) end
---@param ... any
---@return any
function Engine.imgui.LogToTTY(...) end
---@param ... any
---@return any
function Engine.imgui.MenuItem1(...) end
---@param ... any
---@return any
function Engine.imgui.MenuItem2(...) end
---@param ... any
---@return any
function Engine.imgui.NewFrame(...) end
---@param ... any
---@return any
function Engine.imgui.NewLine(...) end
---@param ... any
---@return any
function Engine.imgui.NextColumn(...) end
---@param ... any
---@return any
function Engine.imgui.OpenPopup1(...) end
---@param ... any
---@return any
function Engine.imgui.OpenPopup2(...) end
---@param ... any
---@return any
function Engine.imgui.OpenPopupOnItemClick(...) end
---@param ... any
---@return any
function Engine.imgui.PlotHistogram1(...) end
---@param ... any
---@return any
function Engine.imgui.PlotLines1(...) end
---@param ... any
---@return any
function Engine.imgui.PopButtonRepeat(...) end
---@param ... any
---@return any
function Engine.imgui.PopClipRect(...) end
---@param ... any
---@return any
function Engine.imgui.PopFont(...) end
---@param ... any
---@return any
function Engine.imgui.PopID(...) end
---@param ... any
---@return any
function Engine.imgui.PopItemWidth(...) end
---@param ... any
---@return any
function Engine.imgui.PopStyleColor(...) end
---@param ... any
---@return any
function Engine.imgui.PopStyleVar(...) end
---@param ... any
---@return any
function Engine.imgui.PopTabStop(...) end
---@param ... any
---@return any
function Engine.imgui.PopTextWrapPos(...) end
---@param ... any
---@return any
function Engine.imgui.ProgressBar(...) end
---@param ... any
---@return any
function Engine.imgui.PushButtonRepeat(...) end
---@param ... any
---@return any
function Engine.imgui.PushClipRect(...) end
---@param ... any
---@return any
function Engine.imgui.PushFont(...) end
---@param ... any
---@return any
function Engine.imgui.PushFont2(...) end
---@param ... any
---@return any
function Engine.imgui.PushFont3(...) end
---@param ... any
---@return any
function Engine.imgui.PushID1(...) end
---@param ... any
---@return any
function Engine.imgui.PushID2(...) end
---@param ... any
---@return any
function Engine.imgui.PushID3(...) end
---@param ... any
---@return any
function Engine.imgui.PushID4(...) end
---@param ... any
---@return any
function Engine.imgui.PushItemWidth(...) end
---@param ... any
---@return any
function Engine.imgui.PushStyleColor1(...) end
---@param ... any
---@return any
function Engine.imgui.PushStyleColor2(...) end
---@param ... any
---@return any
function Engine.imgui.PushStyleVar1(...) end
---@param ... any
---@return any
function Engine.imgui.PushStyleVar2(...) end
---@param ... any
---@return any
function Engine.imgui.PushTabStop(...) end
---@param ... any
---@return any
function Engine.imgui.PushTextWrapPos(...) end
---@param ... any
---@return any
function Engine.imgui.RadioButton1(...) end
---@param ... any
---@return any
function Engine.imgui.RadioButton2(...) end
---@param ... any
---@return any
function Engine.imgui.Render(...) end
---@param ... any
---@return any
function Engine.imgui.RenderPlatformWindowsDefault(...) end
---@param ... any
---@return any
function Engine.imgui.ResetMouseDragDelta(...) end
---@param ... any
---@return any
function Engine.imgui.SameLine(...) end
---@param ... any
---@return any
function Engine.imgui.SaveIniSettingsToDisk(...) end
---@param ... any
---@return any
function Engine.imgui.Selectable1(...) end
---@param ... any
---@return any
function Engine.imgui.Selectable2(...) end
---@param ... any
---@return any
function Engine.imgui.Separator(...) end
---@param ... any
---@return any
function Engine.imgui.SeparatorText(...) end
---@param ... any
---@return any
function Engine.imgui.SetClipboardText(...) end
---@param ... any
---@return any
function Engine.imgui.SetColorEditOptions(...) end
---@param ... any
---@return any
function Engine.imgui.SetColumnOffset(...) end
---@param ... any
---@return any
function Engine.imgui.SetColumnWidth(...) end
---@param ... any
---@return any
function Engine.imgui.SetCurrentContext(...) end
---@param ... any
---@return any
function Engine.imgui.SetCursorPos(...) end
---@param ... any
---@return any
function Engine.imgui.SetCursorPosX(...) end
---@param ... any
---@return any
function Engine.imgui.SetCursorPosY(...) end
---@param ... any
---@return any
function Engine.imgui.SetCursorScreenPos(...) end
---@param ... any
---@return any
function Engine.imgui.SetDefaultFont(...) end
---@param ... any
---@return any
function Engine.imgui.SetDragDropPayload(...) end
---@param ... any
---@return any
function Engine.imgui.SetItemAllowOverlap(...) end
---@param ... any
---@return any
function Engine.imgui.SetItemDefaultFocus(...) end
---@param ... any
---@return any
function Engine.imgui.SetItemTooltip(...) end
---@param ... any
---@return any
function Engine.imgui.SetKeyboardFocusHere(...) end
---@param ... any
---@return any
function Engine.imgui.SetMouseCursor(...) end
---@param ... any
---@return any
function Engine.imgui.SetNextFrameWantCaptureKeyboard(...) end
---@param ... any
---@return any
function Engine.imgui.SetNextFrameWantCaptureMouse(...) end
---@param ... any
---@return any
function Engine.imgui.SetNextItemAllowOverlap(...) end
---@param ... any
---@return any
function Engine.imgui.SetNextItemOpen(...) end
---@param ... any
---@return any
function Engine.imgui.SetNextItemWidth(...) end
---@param ... any
---@return any
function Engine.imgui.SetNextWindowBgAlpha(...) end
---@param ... any
---@return any
function Engine.imgui.SetNextWindowClass(...) end
---@param ... any
---@return any
function Engine.imgui.SetNextWindowCollapsed(...) end
---@param ... any
---@return any
function Engine.imgui.SetNextWindowContentSize(...) end
---@param ... any
---@return any
function Engine.imgui.SetNextWindowDockID(...) end
---@param ... any
---@return any
function Engine.imgui.SetNextWindowFocus(...) end
---@param ... any
---@return any
function Engine.imgui.SetNextWindowPos(...) end
---@param ... any
---@return any
function Engine.imgui.SetNextWindowScroll(...) end
---@param ... any
---@return any
function Engine.imgui.SetNextWindowSize(...) end
---@param ... any
---@return any
function Engine.imgui.SetNextWindowSizeConstraints(...) end
---@param ... any
---@return any
function Engine.imgui.SetNextWindowViewport(...) end
---@param ... any
---@return any
function Engine.imgui.SetScrollFromPosX(...) end
---@param ... any
---@return any
function Engine.imgui.SetScrollFromPosY(...) end
---@param ... any
---@return any
function Engine.imgui.SetScrollHereX(...) end
---@param ... any
---@return any
function Engine.imgui.SetScrollHereY(...) end
---@param ... any
---@return any
function Engine.imgui.SetScrollX(...) end
---@param ... any
---@return any
function Engine.imgui.SetScrollY(...) end
---@param ... any
---@return any
function Engine.imgui.SetStateStorage(...) end
---@param ... any
---@return any
function Engine.imgui.SetTabItemClosed(...) end
---@param ... any
---@return any
function Engine.imgui.SetTooltip(...) end
---@param ... any
---@return any
function Engine.imgui.SetWindowCollapsed1(...) end
---@param ... any
---@return any
function Engine.imgui.SetWindowCollapsed2(...) end
---@param ... any
---@return any
function Engine.imgui.SetWindowFocus1(...) end
---@param ... any
---@return any
function Engine.imgui.SetWindowFocus2(...) end
---@param ... any
---@return any
function Engine.imgui.SetWindowFontScale(...) end
---@param ... any
---@return any
function Engine.imgui.SetWindowPos1(...) end
---@param ... any
---@return any
function Engine.imgui.SetWindowPos2(...) end
---@param ... any
---@return any
function Engine.imgui.SetWindowSize1(...) end
---@param ... any
---@return any
function Engine.imgui.SetWindowSize2(...) end
---@param ... any
---@return any
function Engine.imgui.ShowAboutWindow(...) end
---@param ... any
---@return any
function Engine.imgui.ShowDebugLogWindow(...) end
---@param ... any
---@return any
function Engine.imgui.ShowDemoWindow(...) end
---@param ... any
---@return any
function Engine.imgui.ShowFontSelector(...) end
---@param ... any
---@return any
function Engine.imgui.ShowMetricsWindow(...) end
---@param ... any
---@return any
function Engine.imgui.ShowStackToolWindow(...) end
---@param ... any
---@return any
function Engine.imgui.ShowStyleEditor(...) end
---@param ... any
---@return any
function Engine.imgui.ShowStyleSelector(...) end
---@param ... any
---@return any
function Engine.imgui.ShowUserGuide(...) end
---@param ... any
---@return any
function Engine.imgui.SliderAngle(...) end
---@param ... any
---@return any
function Engine.imgui.SliderFloat(...) end
---@param ... any
---@return any
function Engine.imgui.SliderFloat2(...) end
---@param ... any
---@return any
function Engine.imgui.SliderFloat3(...) end
---@param ... any
---@return any
function Engine.imgui.SliderFloat4(...) end
---@param ... any
---@return any
function Engine.imgui.SliderInt(...) end
---@param ... any
---@return any
function Engine.imgui.SliderInt2(...) end
---@param ... any
---@return any
function Engine.imgui.SliderInt3(...) end
---@param ... any
---@return any
function Engine.imgui.SliderInt4(...) end
---@param ... any
---@return any
function Engine.imgui.SmallButton(...) end
---@param ... any
---@return any
function Engine.imgui.Spacing(...) end
---@param ... any
---@return any
function Engine.imgui.StyleColorsClassic(...) end
---@param ... any
---@return any
function Engine.imgui.StyleColorsDark(...) end
---@param ... any
---@return any
function Engine.imgui.StyleColorsLight(...) end
---@param ... any
---@return any
function Engine.imgui.TabItemButton(...) end
---@param ... any
---@return any
function Engine.imgui.TableGetColumnCount(...) end
---@param ... any
---@return any
function Engine.imgui.TableGetColumnFlags(...) end
---@param ... any
---@return any
function Engine.imgui.TableGetColumnIndex(...) end
---@param ... any
---@return any
function Engine.imgui.TableGetColumnName(...) end
---@param ... any
---@return any
function Engine.imgui.TableGetRowIndex(...) end
---@param ... any
---@return any
function Engine.imgui.TableGetSortSpecs(...) end
---@param ... any
---@return any
function Engine.imgui.TableHeader(...) end
---@param ... any
---@return any
function Engine.imgui.TableHeadersRow(...) end
---@param ... any
---@return any
function Engine.imgui.TableNextColumn(...) end
---@param ... any
---@return any
function Engine.imgui.TableNextRow(...) end
---@param ... any
---@return any
function Engine.imgui.TableSetBgColor(...) end
---@param ... any
---@return any
function Engine.imgui.TableSetColumnEnabled(...) end
---@param ... any
---@return any
function Engine.imgui.TableSetColumnIndex(...) end
---@param ... any
---@return any
function Engine.imgui.TableSetupColumn(...) end
---@param ... any
---@return any
function Engine.imgui.TableSetupScrollFreeze(...) end
---@param ... any
---@return any
function Engine.imgui.Text(...) end
---@param ... any
---@return any
function Engine.imgui.TextColored(...) end
---@param ... any
---@return any
function Engine.imgui.TextDisabled(...) end
---@param ... any
---@return any
function Engine.imgui.TextGlyph(...) end
---@param ... any
---@return any
function Engine.imgui.TextUnformatted(...) end
---@param ... any
---@return any
function Engine.imgui.TextWrapped(...) end
---@param ... any
---@return any
function Engine.imgui.TreeNode1(...) end
---@param ... any
---@return any
function Engine.imgui.TreeNode2(...) end
---@param ... any
---@return any
function Engine.imgui.TreeNode3(...) end
---@param ... any
---@return any
function Engine.imgui.TreeNodeEx1(...) end
---@param ... any
---@return any
function Engine.imgui.TreeNodeEx2(...) end
---@param ... any
---@return any
function Engine.imgui.TreeNodeEx3(...) end
---@param ... any
---@return any
function Engine.imgui.TreePop(...) end
---@param ... any
---@return any
function Engine.imgui.TreePush1(...) end
---@param ... any
---@return any
function Engine.imgui.TreePush2(...) end
---@param ... any
---@return any
function Engine.imgui.Unindent(...) end
---@param ... any
---@return any
function Engine.imgui.UpdatePlatformWindows(...) end
---@param ... any
---@return any
function Engine.imgui.VSliderFloat(...) end
---@param ... any
---@return any
function Engine.imgui.VSliderInt(...) end
---@param ... any
---@return any
function Engine.imgui.Value1(...) end
---@param ... any
---@return any
function Engine.imgui.Value2(...) end
---@param ... any
---@return any
function Engine.imgui.Value3(...) end
---@param ... any
---@return any
function Engine.imgui.Value4(...) end
---@param ... any
---@return any
function Engine.imgui.enableBeamNGStyle(...) end
---@param ... any
---@return any
function Engine.imgui.getCurrentMonitorSize(...) end
---@param ... any
---@return any
function Engine.imgui.getIOConfigFlags(...) end
---@param ... any
---@return any
function Engine.imgui.getMainViewPortId(...) end
---@param ... any
---@return any
function Engine.imgui.getMonitorIndex(...) end
---@param ... any
---@return any
function Engine.imgui.isEnabled(...) end
---@param ... any
---@return any
function Engine.imgui.setEnabled(...) end
---@param ... any
---@return any
function Engine.imgui.toggleEnabled(...) end
Engine.imgui.ImColor = {}
Engine.imgui.ImDrawList = {}
Engine.imgui.ImGuiContext = {}
Engine.imgui.ImGuiIO = {}
Engine.imgui.ImGuiKeyData = {}
Engine.imgui.ImGuiListClipper = {}
Engine.imgui.ImGuiPayload = {}
Engine.imgui.ImGuiPlatformIO = {}
Engine.imgui.ImGuiPlatformImeData = {}
Engine.imgui.ImGuiPlatformMonitor = {}
Engine.imgui.ImGuiSizeCallbackData = {}
Engine.imgui.ImGuiStorage = {}
Engine.imgui.ImGuiStyle = {}
Engine.imgui.ImGuiTableColumnSortSpecs = {}
Engine.imgui.ImGuiTableSortSpecs = {}
Engine.imgui.ImGuiTextFilter = {}
Engine.imgui.ImGuiViewport = {}
Engine.imgui.ImGuiWindowClass = {}
Engine.imgui.ImNewWrapper = {}
Engine.imgui.ImTextureHandler = {}
Engine.imgui.ImTextureID = {}
Engine.imgui.ImVec2 = {}
Engine.imgui.ImVec4 = {}
Engine.imgui.KnobFlags = {}
Engine.imgui.KnobVariant = {}
Engine.imgui.enum = {}
Engine.test = {}
---@param ... any
---@return any
function Engine.test.validateParseLevel(...) end
---@param ... any
---@return any
function Engine.test.validateParseLineObjects(...) end

---@class GFXHdr_module
GFXHdr = {}
---@param ... any
---@return any
function GFXHdr.applyRequested(...) end
---@param ... any
---@return any
function GFXHdr.getBestOutputMode(...) end
---@param ... any
---@return any
function GFXHdr.getBestOutputModeName(...) end
---@param ... any
---@return any
function GFXHdr.getOutputMode(...) end
---@param ... any
---@return any
function GFXHdr.getOutputModeName(...) end
---@param ... any
---@return any
function GFXHdr.getPaperWhiteNits(...) end
---@param ... any
---@return any
function GFXHdr.getPeakWhiteNits(...) end
---@param ... any
---@return any
function GFXHdr.getRequested(...) end
---@param ... any
---@return any
function GFXHdr.getSupported(...) end
---@param ... any
---@return any
function GFXHdr.getUiAlphaCurve(...) end
---@param ... any
---@return any
function GFXHdr.getUiMultiplier(...) end
---@param ... any
---@return any
function GFXHdr.setPaperWhiteNits(...) end
---@param ... any
---@return any
function GFXHdr.setPeakWhiteNits(...) end
---@param ... any
---@return any
function GFXHdr.setRequested(...) end
---@param ... any
---@return any
function GFXHdr.setUiAlphaCurve(...) end
---@param ... any
---@return any
function GFXHdr.setUiMultiplier(...) end

---@class GFXInit_module
GFXInit = {}
---@param ... any
---@return any
function GFXInit.getAdapterCount(...) end
---@param ... any
---@return any
function GFXInit.getAdapterName(...) end
---@param ... any
---@return any
function GFXInit.getAdapters(...) end

---@class GPUMesh_module
GPUMesh = {}
---@param ... any
---@return any
function GPUMesh.bng_getGPUMesh(...) end
GPUMesh.gpuFlexMesh = {}
GPUMesh.gpuMesh = {}
GPUMesh.gpuPropMesh = {}

---@class Input_module
Input = {}
---@param ... any
---@return any
function Input.getControllersInfo(...) end
---@param ... any
---@return any
function Input.getControllersInfoJson(...) end
---@param ... any
---@return any
function Input.getPlayerNumber(...) end
---@param ... any
---@return any
function Input.getProductGUID(...) end
---@param ... any
---@return any
function Input.getProductName(...) end
---@param ... any
---@return any
function Input.getRegisteredDevices(...) end
---@param ... any
---@return any
function Input.getVendorIDProductID(...) end
---@param ... any
---@return any
function Input.injectChar(...) end
---@param ... any
---@return any
function Input.injectControl(...) end
---@param ... any
---@return any
function Input.injectKey(...) end
---@param ... any
---@return any
function Input.injectMouseMove(...) end
---@param ... any
---@return any
function Input.injectMouseWheel(...) end
---@param ... any
---@return any
function Input.setForwardFilteredEvents(...) end
---@param ... any
---@return any
function Input.setForwardRawEvents(...) end
---@param ... any
---@return any
function Input.updateFFBBindingParameters(...) end

---@class OpenXR_module
OpenXR = {}
---@param ... any
---@return any
function OpenXR.centerContinuous(...) end
---@param ... any
---@return any
function OpenXR.centerNow(...) end
---@param ... any
---@return any
function OpenXR.generateUiCurvature(...) end
---@param ... any
---@return any
function OpenXR.getCameraPosRotPredictedXYZXYZW(...) end
---@param ... any
---@return any
function OpenXR.getEnable(...) end
---@param ... any
---@return any
function OpenXR.getUseQuadComposition(...) end
---@param ... any
---@return any
function OpenXR.requestState(...) end
---@param ... any
---@return any
function OpenXR.setEnable(...) end
---@param ... any
---@return any
function OpenXR.setGeluaCameraPosRot(...) end
---@param ... any
---@return any
function OpenXR.setUseQuadComposition(...) end

---@class ResearchVerifier_module
ResearchVerifier = {}
---@param ... any
---@return any
function ResearchVerifier.getTechLicenseState(...) end
---@param ... any
---@return any
function ResearchVerifier.isTechLicenseVerified(...) end

---@class SFXSystem_module
SFXSystem = {}
---@param ... any
---@return any
function SFXSystem.getForwardXYZ(...) end
---@param ... any
---@return any
function SFXSystem.getGlobalParameter(...) end
---@param ... any
---@return any
function SFXSystem.getListener(...) end
---@param ... any
---@return any
function SFXSystem.getListenerTranformAndVelocity(...) end
---@param ... any
---@return any
function SFXSystem.getPositionXYZ(...) end
---@param ... any
---@return any
function SFXSystem.getRightXYZ(...) end
---@param ... any
---@return any
function SFXSystem.getSFXSources(...) end
---@param ... any
---@return any
function SFXSystem.setGlobalParameter(...) end
---@param ... any
---@return any
function SFXSystem.setOutputMix(...) end

---@class SecureComm_module
SecureComm = {}
---@param ... any
---@return any
function SecureComm.apiCall(...) end
---@param ... any
---@return any
function SecureComm.getRandomBytesHexSlow(...) end
---@param ... any
---@return any
function SecureComm.getServerTime(...) end
---@param ... any
---@return any
function SecureComm.getServerTimeOffsetSeconds(...) end

---@class Sim_module
Sim = {}
---@param ... any
---@return any
function Sim.clearSimObjectCache(...) end
---@param ... any
---@return any
function Sim.decalRoadContainsPoint(...) end
---@param ... any
---@return any
function Sim.deserializeLineObjects(...) end
---@param ... any
---@return any
function Sim.deserializeObjectFromFile(...) end
---@param ... any
---@return any
function Sim.deserializeObjectFromText(...) end
---@param ... any
---@return any
function Sim.deserializeObjectsFromFile(...) end
---@param ... any
---@return any
function Sim.deserializeObjectsFromText(...) end
---@param ... any
---@return any
function Sim.findObject(...) end
---@param ... any
---@return any
function Sim.findObjectById(...) end
---@param ... any
---@return any
function Sim.findObjectByIdNoUpcast(...) end
---@param ... any
---@return any
function Sim.findObjectByPersistID(...) end
---@param ... any
---@return any
function Sim.findObjectsByNameMask(...) end
---@param ... any
---@return any
function Sim.getDataBlockSet(...) end
---@param ... any
---@return any
function Sim.getDecalRoadData(...) end
---@param ... any
---@return any
function Sim.getMaterialSet(...) end
---@param ... any
---@return any
function Sim.getRootGroup(...) end
---@param ... any
---@return any
function Sim.getSFXAmbienceSet(...) end
---@param ... any
---@return any
function Sim.getSFXDescriptionSet(...) end
---@param ... any
---@return any
function Sim.getSFXEnvironmentSet(...) end
---@param ... any
---@return any
function Sim.getSFXParameterGroup(...) end
---@param ... any
---@return any
function Sim.getSFXStateSet(...) end
---@param ... any
---@return any
function Sim.getSFXTrackSet(...) end
---@param ... any
---@return any
function Sim.getSimObjectDerivedClassNames(...) end
---@param ... any
---@return any
function Sim.getUniqueName(...) end
---@param ... any
---@return any
function Sim.getVerticesOfDecalRoad(...) end
---@param ... any
---@return any
function Sim.objectExists(...) end
---@param ... any
---@return any
function Sim.objectExistsById(...) end
---@param ... any
---@return any
function Sim.serializeObjectToDirectories(...) end
---@param ... any
---@return any
function Sim.serializeToLineObjectsFile(...) end
---@param ... any
---@return any
function Sim.upcast(...) end

---@class TorqueScript_module
TorqueScript = {}
---@param ... any
---@return any
function TorqueScript.convertCsAssetToJson(...) end
---@param ... any
---@return any
function TorqueScript.eval(...) end
---@param ... any
---@return any
function TorqueScript.exec(...) end

---@class TrackIR_module
TrackIR = {}
---@param ... any
---@return any
function TrackIR.available(...) end
---@param ... any
---@return any
function TrackIR.getData(...) end
---@param ... any
---@return any
function TrackIR.init(...) end
---@param ... any
---@return any
function TrackIR.recording(...) end
---@param ... any
---@return any
function TrackIR.start(...) end
---@param ... any
---@return any
function TrackIR.stop(...) end

---@class VariableRegistry_module
VariableRegistry = {}
---@param ... any
---@return any
function VariableRegistry.clear(...) end
---@param ... any
---@return any
function VariableRegistry.erase(...) end
---@param ... any
---@return any
function VariableRegistry.exportToFile(...) end
---@param ... any
---@return any
function VariableRegistry.exportToTable(...) end
---@param ... any
---@return any
function VariableRegistry.get(...) end
---@param ... any
---@return any
function VariableRegistry.getString(...) end
---@param ... any
---@return any
function VariableRegistry.has(...) end
---@param ... any
---@return any
function VariableRegistry.loadFromFile(...) end
---@param ... any
---@return any
function VariableRegistry.set(...) end

---@class WinInput_module
WinInput = {}
---@param ... any
---@return any
function WinInput.getControllersInfo(...) end
---@param ... any
---@return any
function WinInput.getControllersInfoJson(...) end
---@param ... any
---@return any
function WinInput.getPlayerNumber(...) end
---@param ... any
---@return any
function WinInput.getProductGUID(...) end
---@param ... any
---@return any
function WinInput.getProductName(...) end
---@param ... any
---@return any
function WinInput.getRegisteredDevices(...) end
---@param ... any
---@return any
function WinInput.getVendorIDProductID(...) end
---@param ... any
---@return any
function WinInput.injectChar(...) end
---@param ... any
---@return any
function WinInput.injectControl(...) end
---@param ... any
---@return any
function WinInput.injectKey(...) end
---@param ... any
---@return any
function WinInput.injectMouseMove(...) end
---@param ... any
---@return any
function WinInput.injectMouseWheel(...) end
---@param ... any
---@return any
function WinInput.setForwardFilteredEvents(...) end
---@param ... any
---@return any
function WinInput.setForwardRawEvents(...) end
---@param ... any
---@return any
function WinInput.updateFFBBindingParameters(...) end

---@class worldEditorCppApi_module
worldEditorCppApi = {}
---@param ... any
---@return any
function worldEditorCppApi.checkObjectIconHit(...) end
---@param ... any
---@return any
function worldEditorCppApi.clearSceneDirtyFlag(...) end
---@param ... any
---@return any
function worldEditorCppApi.colladaExportSelection(...) end
---@param ... any
---@return any
function worldEditorCppApi.collideAxisGizmo(...) end
---@param ... any
---@return any
function worldEditorCppApi.createObject(...) end
---@param ... any
---@return any
function worldEditorCppApi.disableSimSetAndSimObjectSignals(...) end
---@param ... any
---@return any
function worldEditorCppApi.drawClosestObjectIcons(...) end
---@param ... any
---@return any
function worldEditorCppApi.enableEditor(...) end
---@param ... any
---@return any
function worldEditorCppApi.enableSimSetAndSimObjectSignals(...) end
---@param ... any
---@return any
function worldEditorCppApi.findDerivedDatablockClassname(...) end
---@param ... any
---@return any
function worldEditorCppApi.getAxisGizmoAlignment(...) end
---@param ... any
---@return any
function worldEditorCppApi.getAxisGizmoHideDisabledRotateAxes(...) end
---@param ... any
---@return any
function worldEditorCppApi.getAxisGizmoHideDisabledScaleAxes(...) end
---@param ... any
---@return any
function worldEditorCppApi.getAxisGizmoHideDisabledTranslateAxes(...) end
---@param ... any
---@return any
function worldEditorCppApi.getAxisGizmoHighlightSelectedMeshes(...) end
---@param ... any
---@return any
function worldEditorCppApi.getAxisGizmoMode(...) end
---@param ... any
---@return any
function worldEditorCppApi.getAxisGizmoRenderMoveGrid(...) end
---@param ... any
---@return any
function worldEditorCppApi.getAxisGizmoRenderPlane(...) end
---@param ... any
---@return any
function worldEditorCppApi.getAxisGizmoRenderPlaneHashes(...) end
---@param ... any
---@return any
function worldEditorCppApi.getAxisGizmoRotateOffset(...) end
---@param ... any
---@return any
function worldEditorCppApi.getAxisGizmoRotateProfile(...) end
---@param ... any
---@return any
function worldEditorCppApi.getAxisGizmoRotateProfileFlags(...) end
---@param ... any
---@return any
function worldEditorCppApi.getAxisGizmoScale(...) end
---@param ... any
---@return any
function worldEditorCppApi.getAxisGizmoScaleOffset(...) end
---@param ... any
---@return any
function worldEditorCppApi.getAxisGizmoScaleProfile(...) end
---@param ... any
---@return any
function worldEditorCppApi.getAxisGizmoScaleProfileFlags(...) end
---@param ... any
---@return any
function worldEditorCppApi.getAxisGizmoSelectedElement(...) end
---@param ... any
---@return any
function worldEditorCppApi.getAxisGizmoTotalRotateOffset(...) end
---@param ... any
---@return any
function worldEditorCppApi.getAxisGizmoTransform(...) end
---@param ... any
---@return any
function worldEditorCppApi.getAxisGizmoTranslateOffset(...) end
---@param ... any
---@return any
function worldEditorCppApi.getAxisGizmoTranslateProfile(...) end
---@param ... any
---@return any
function worldEditorCppApi.getAxisGizmoTranslateProfileFlags(...) end
---@param ... any
---@return any
function worldEditorCppApi.getClassIsRenderable(...) end
---@param ... any
---@return any
function worldEditorCppApi.getClassIsSelectable(...) end
---@param ... any
---@return any
function worldEditorCppApi.getEaseCurveSamples(...) end
---@param ... any
---@return any
function worldEditorCppApi.getGridSize(...) end
---@param ... any
---@return any
function worldEditorCppApi.getObjectClassIcons(...) end
---@param ... any
---@return any
function worldEditorCppApi.getObjectClassNames(...) end
---@param ... any
---@return any
function worldEditorCppApi.getRenderableObjectClassNames(...) end
---@param ... any
---@return any
function worldEditorCppApi.getRotateSnapAngle(...) end
---@param ... any
---@return any
function worldEditorCppApi.getScaleSnapSize(...) end
---@param ... any
---@return any
function worldEditorCppApi.hideIconForObject(...) end
---@param ... any
---@return any
function worldEditorCppApi.isGridSnapEnabled(...) end
---@param ... any
---@return any
function worldEditorCppApi.isRotateSnapEnabled(...) end
---@param ... any
---@return any
function worldEditorCppApi.isScaleSnapEnabled(...) end
---@param ... any
---@return any
function worldEditorCppApi.isSelectMultipleFilesAvailable(...) end
---@param ... any
---@return any
function worldEditorCppApi.mustOpenEditorOnStart(...) end
---@param ... any
---@return any
function worldEditorCppApi.onAxisGizmoMouseDown(...) end
---@param ... any
---@return any
function worldEditorCppApi.onAxisGizmoMouseDragged(...) end
---@param ... any
---@return any
function worldEditorCppApi.onAxisGizmoMouseMove(...) end
---@param ... any
---@return any
function worldEditorCppApi.onAxisGizmoMouseUp(...) end
---@param ... any
---@return any
function worldEditorCppApi.rebuildForestManagerInstanceData(...) end
---@param ... any
---@return any
function worldEditorCppApi.rebuildShapeManagerInstanceData(...) end
---@param ... any
---@return any
function worldEditorCppApi.renderForestBBs(...) end
---@param ... any
---@return any
function worldEditorCppApi.setAxisGizmoAlignment(...) end
---@param ... any
---@return any
function worldEditorCppApi.setAxisGizmoHideDisabledRotateAxes(...) end
---@param ... any
---@return any
function worldEditorCppApi.setAxisGizmoHideDisabledScaleAxes(...) end
---@param ... any
---@return any
function worldEditorCppApi.setAxisGizmoHideDisabledTranslateAxes(...) end
---@param ... any
---@return any
function worldEditorCppApi.setAxisGizmoHighlightSelectedMeshes(...) end
---@param ... any
---@return any
function worldEditorCppApi.setAxisGizmoMode(...) end
---@param ... any
---@return any
function worldEditorCppApi.setAxisGizmoRenderMoveGrid(...) end
---@param ... any
---@return any
function worldEditorCppApi.setAxisGizmoRenderPlane(...) end
---@param ... any
---@return any
function worldEditorCppApi.setAxisGizmoRenderPlaneHashes(...) end
---@param ... any
---@return any
function worldEditorCppApi.setAxisGizmoRotateLock(...) end
---@param ... any
---@return any
function worldEditorCppApi.setAxisGizmoRotateProfileFlags(...) end
---@param ... any
---@return any
function worldEditorCppApi.setAxisGizmoScaleLock(...) end
---@param ... any
---@return any
function worldEditorCppApi.setAxisGizmoScaleProfileFlags(...) end
---@param ... any
---@return any
function worldEditorCppApi.setAxisGizmoSelectedElement(...) end
---@param ... any
---@return any
function worldEditorCppApi.setAxisGizmoTransform(...) end
---@param ... any
---@return any
function worldEditorCppApi.setAxisGizmoTranslateLock(...) end
---@param ... any
---@return any
function worldEditorCppApi.setAxisGizmoTranslateProfileFlags(...) end
---@param ... any
---@return any
function worldEditorCppApi.setClassIsRenderable(...) end
---@param ... any
---@return any
function worldEditorCppApi.setClassIsSelectable(...) end
---@param ... any
---@return any
function worldEditorCppApi.setConstantSizeIconScale(...) end
---@param ... any
---@return any
function worldEditorCppApi.setConstantSizeIcons(...) end
---@param ... any
---@return any
function worldEditorCppApi.setDrawIconShadow(...) end
---@param ... any
---@return any
function worldEditorCppApi.setDrawObjectIcons(...) end
---@param ... any
---@return any
function worldEditorCppApi.setDrawObjectsText(...) end
---@param ... any
---@return any
function worldEditorCppApi.setEventControlModifiers(...) end
---@param ... any
---@return any
function worldEditorCppApi.setFadeIcons(...) end
---@param ... any
---@return any
function worldEditorCppApi.setFadeIconsDistance(...) end
---@param ... any
---@return any
function worldEditorCppApi.setFineMoveScalar(...) end
---@param ... any
---@return any
function worldEditorCppApi.setFineRotationScalar(...) end
---@param ... any
---@return any
function worldEditorCppApi.setFineScaleScalar(...) end
---@param ... any
---@return any
function worldEditorCppApi.setGizmoLineThicknessScale(...) end
---@param ... any
---@return any
function worldEditorCppApi.setGizmoPlaneColor(...) end
---@param ... any
---@return any
function worldEditorCppApi.setGizmoPlaneGridLineColor(...) end
---@param ... any
---@return any
function worldEditorCppApi.setGizmoPlaneSize(...) end
---@param ... any
---@return any
function worldEditorCppApi.setGridSnap(...) end
---@param ... any
---@return any
function worldEditorCppApi.setHideIconClass(...) end
---@param ... any
---@return any
function worldEditorCppApi.setHovered(...) end
---@param ... any
---@return any
function worldEditorCppApi.setHoveredObjectId(...) end
---@param ... any
---@return any
function worldEditorCppApi.setIconBackgroundColor(...) end
---@param ... any
---@return any
function worldEditorCppApi.setIconBackgroundScale(...) end
---@param ... any
---@return any
function worldEditorCppApi.setIconBackgroundType(...) end
---@param ... any
---@return any
function worldEditorCppApi.setIconShadowColor(...) end
---@param ... any
---@return any
function worldEditorCppApi.setIconShadowOffset(...) end
---@param ... any
---@return any
function worldEditorCppApi.setIconWorldScale(...) end
---@param ... any
---@return any
function worldEditorCppApi.setMaterialFocus(...) end
---@param ... any
---@return any
function worldEditorCppApi.setMaterialFocusHighlight(...) end
---@param ... any
---@return any
function worldEditorCppApi.setMaterialFocusIsolate(...) end
---@param ... any
---@return any
function worldEditorCppApi.setMonoIconColor(...) end
---@param ... any
---@return any
function worldEditorCppApi.setObjectTextBackgroundColor(...) end
---@param ... any
---@return any
function worldEditorCppApi.setObjectTextColor(...) end
---@param ... any
---@return any
function worldEditorCppApi.setOpenEditorOnStart(...) end
---@param ... any
---@return any
function worldEditorCppApi.setRandomIconColorSeed(...) end
---@param ... any
---@return any
function worldEditorCppApi.setRotateSnap(...) end
---@param ... any
---@return any
function worldEditorCppApi.setScaleSnap(...) end
---@param ... any
---@return any
function worldEditorCppApi.setSelectedIconBgColor(...) end
---@param ... any
---@return any
function worldEditorCppApi.setSelectedIconColor(...) end
---@param ... any
---@return any
function worldEditorCppApi.setUpdateDecalRoadsOnStaticMeshTransform(...) end
---@param ... any
---@return any
function worldEditorCppApi.setUseIconColor(...) end
---@param ... any
---@return any
function worldEditorCppApi.setUseObjectsBoxCenter(...) end
---@param ... any
---@return any
function worldEditorCppApi.showIconForObject(...) end
---@param ... any
---@return any
function worldEditorCppApi.snapPositionToGrid(...) end

---@class ActionMap : SimObject
---@field className any
---@field enabled any modifiable
---@field playerMask any modifiable
---@field trapHandledEvents any modifiable
local ActionMap = {}
---@param ... any
---@return any
function ActionMap:assignFieldsFromObject(...) end
---@param ... any
---@return any
function ActionMap:bind(...) end
---@param ... any
---@return any
function ActionMap:clear(...) end
---@param ... any
---@return any
function ActionMap:clone(...) end
---@param ... any
---@return any
function ActionMap:decRefCount(...) end
---@param ... any
---@return any
function ActionMap:delete(...) end
---@param ... any
---@return any
function ActionMap:deleteObject(...) end
---@param ... any
---@return any
function ActionMap:deletePersistentId(...) end
---@param ... any
---@return any
function ActionMap:dump(...) end
---@param ... any
---@return any
function ActionMap:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function ActionMap:generatePersistentId(...) end
---@param ... any
---@return any
function ActionMap:getClassDocString(...) end
---@param ... any
---@return any
function ActionMap:getClassName(...) end
---@param ... any
---@return any
function ActionMap:getDeclarationLine(...) end
---@param ... any
---@return any
function ActionMap:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function ActionMap:getDynamicFields(...) end
---@param ... any
---@return any
function ActionMap:getField(...) end
---@param ... any
---@return any
function ActionMap:getFieldInfo(...) end
---@param ... any
---@return any
function ActionMap:getFieldList(...) end
---@param ... any
---@return any
function ActionMap:getFields(...) end
---@param ... any
---@return any
function ActionMap:getFieldsForEditor(...) end
---@param ... any
---@return any
function ActionMap:getFileName(...) end
---@param ... any
---@return any
function ActionMap:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function ActionMap:getGroup(...) end
---@param ... any
---@return any
function ActionMap:getID(...) end
---@param ... any
---@return any
function ActionMap:getId(...) end
---@param ... any
---@return any
function ActionMap:getIdString(...) end
---@param ... any
---@return any
function ActionMap:getInternalName(...) end
---@param ... any
---@return any
function ActionMap:getName(...) end
---@param ... any
---@return any
function ActionMap:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function ActionMap:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function ActionMap:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function ActionMap:incRefCount(...) end
---@param ... any
---@return any
function ActionMap:inheritParentFields(...) end
---@param ... any
---@return any
function ActionMap:inspectUpdate(...) end
---@param ... any
---@return any
function ActionMap:isChildOfGroup(...) end
---@param ... any
---@return any
function ActionMap:isEditorDirty(...) end
---@param ... any
---@return any
function ActionMap:isHidden(...) end
---@param ... any
---@return any
function ActionMap:isLocked(...) end
---@param ... any
---@return any
function ActionMap:isNameChangeAllowed(...) end
---@param ... any
---@return any
function ActionMap:isSelected(...) end
---@param ... any
---@return any
function ActionMap:isSubClassOf(...) end
---@param ... any
---@return any
function ActionMap:onEditorDisable(...) end
---@param ... any
---@return any
function ActionMap:onEditorEnable(...) end
---@param ... any
---@return any
function ActionMap:pop(...) end
---@param ... any
---@return any
function ActionMap:postApply(...) end
---@param ... any
---@return any
function ActionMap:preApply(...) end
---@param ... any
---@return any
function ActionMap:push(...) end
---@param ... any
---@return any
function ActionMap:pushFirst(...) end
---@param ... any
---@return any
function ActionMap:registerObject(...) end
---@param ... any
---@return any
function ActionMap:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function ActionMap:save(...) end
---@param ... any
---@return any
function ActionMap:serialize(...) end
---@param ... any
---@return any
function ActionMap:serializeForEditor(...) end
---@param ... any
---@return any
function ActionMap:serializeToDirectories(...) end
---@param ... any
---@return any
function ActionMap:serializeToNameDictFile(...) end
---@param ... any
---@return any
function ActionMap:setCanSave(...) end
---@param ... any
---@return any
function ActionMap:setDeclarationLine(...) end
---@param ... any
---@return any
function ActionMap:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function ActionMap:setEditorDirty(...) end
---@param ... any
---@return any
function ActionMap:setEditorOnly(...) end
---@param ... any
---@return any
function ActionMap:setEnabled(...) end
---@param ... any
---@return any
function ActionMap:setField(...) end
---@param ... any
---@return any
function ActionMap:setFileName(...) end
---@param ... any
---@return any
function ActionMap:setHidden(...) end
---@param ... any
---@return any
function ActionMap:setInternalName(...) end
---@param ... any
---@return any
function ActionMap:setIsSelected(...) end
---@param ... any
---@return any
function ActionMap:setLocked(...) end
---@param ... any
---@return any
function ActionMap:setName(...) end
---@param ... any
---@return any
function ActionMap:setNameChangeAllowed(...) end
---@param ... any
---@return any
function ActionMap:setSelected(...) end
---@param ... any
---@return any
function ActionMap:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function ActionMap:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function ActionMap:unregisterObject(...) end

---@class BNGBase_FS_IFileSystem
---@field MAX_LEVELS any modifiable
local BNGBase_FS_IFileSystem = {}
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:closeDirectory(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:convertLinkFileToTargetCopy(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:copyFile(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:deleteAssetFileForLinkFile(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:directoryCreate(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:directoryExists(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:directoryList(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:directoryRemove(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:dumpVfs(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:expandFilename(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:fileExists(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:fileSize(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:findFiles(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:findFilesByPattern(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:findFilesByRootPattern(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:findHighestNumberedFolder(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:findLinkFiles(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:findOverrides(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:folderCleanup(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:getArchiveMetadata(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:getFileOriginInfo(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:getFileRealPath(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:getGamePath(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:getHashFileAlgorithmId(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:getLastError(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:getOriginArchivePathRelative(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:getUserPath(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:hashFile(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:hashFileSHA1(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:isGamePathCaseSensitive(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:isLinkFile(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:isMounted(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:isPathInCaseSensitiveMount(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:isUserPathCaseSensitive(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:mount(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:mountList(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:native2Virtual(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:openDirectory(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:openFile(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:remove(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:removeFile(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:renameFile(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:stat(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:triggerFilesChanged(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:unmount(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:unmountList(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:updateDirectoryWatchers(...) end
---@param ... any
---@return any
function BNGBase_FS_IFileSystem:virtual2Native(...) end

---@class BaseMaterial : SimObject
---@field className any
local BaseMaterial = {}
---@param ... any
---@return any
function BaseMaterial:assignFieldsFromObject(...) end
---@param ... any
---@return any
function BaseMaterial:clone(...) end
---@param ... any
---@return any
function BaseMaterial:decRefCount(...) end
---@param ... any
---@return any
function BaseMaterial:delete(...) end
---@param ... any
---@return any
function BaseMaterial:deleteObject(...) end
---@param ... any
---@return any
function BaseMaterial:deletePersistentId(...) end
---@param ... any
---@return any
function BaseMaterial:dump(...) end
---@param ... any
---@return any
function BaseMaterial:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function BaseMaterial:generatePersistentId(...) end
---@param ... any
---@return any
function BaseMaterial:getClassDocString(...) end
---@param ... any
---@return any
function BaseMaterial:getClassName(...) end
---@param ... any
---@return any
function BaseMaterial:getDeclarationLine(...) end
---@param ... any
---@return any
function BaseMaterial:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function BaseMaterial:getDynamicFields(...) end
---@param ... any
---@return any
function BaseMaterial:getField(...) end
---@param ... any
---@return any
function BaseMaterial:getFieldInfo(...) end
---@param ... any
---@return any
function BaseMaterial:getFieldList(...) end
---@param ... any
---@return any
function BaseMaterial:getFields(...) end
---@param ... any
---@return any
function BaseMaterial:getFieldsForEditor(...) end
---@param ... any
---@return any
function BaseMaterial:getFileName(...) end
---@param ... any
---@return any
function BaseMaterial:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function BaseMaterial:getGroup(...) end
---@param ... any
---@return any
function BaseMaterial:getID(...) end
---@param ... any
---@return any
function BaseMaterial:getId(...) end
---@param ... any
---@return any
function BaseMaterial:getIdString(...) end
---@param ... any
---@return any
function BaseMaterial:getInternalName(...) end
---@param ... any
---@return any
function BaseMaterial:getName(...) end
---@param ... any
---@return any
function BaseMaterial:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function BaseMaterial:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function BaseMaterial:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function BaseMaterial:incRefCount(...) end
---@param ... any
---@return any
function BaseMaterial:inheritParentFields(...) end
---@param ... any
---@return any
function BaseMaterial:inspectUpdate(...) end
---@param ... any
---@return any
function BaseMaterial:isChildOfGroup(...) end
---@param ... any
---@return any
function BaseMaterial:isEditorDirty(...) end
---@param ... any
---@return any
function BaseMaterial:isHidden(...) end
---@param ... any
---@return any
function BaseMaterial:isLocked(...) end
---@param ... any
---@return any
function BaseMaterial:isNameChangeAllowed(...) end
---@param ... any
---@return any
function BaseMaterial:isSelected(...) end
---@param ... any
---@return any
function BaseMaterial:isSubClassOf(...) end
---@param ... any
---@return any
function BaseMaterial:onEditorDisable(...) end
---@param ... any
---@return any
function BaseMaterial:onEditorEnable(...) end
---@param ... any
---@return any
function BaseMaterial:postApply(...) end
---@param ... any
---@return any
function BaseMaterial:preApply(...) end
---@param ... any
---@return any
function BaseMaterial:registerObject(...) end
---@param ... any
---@return any
function BaseMaterial:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function BaseMaterial:save(...) end
---@param ... any
---@return any
function BaseMaterial:serialize(...) end
---@param ... any
---@return any
function BaseMaterial:serializeForEditor(...) end
---@param ... any
---@return any
function BaseMaterial:serializeToDirectories(...) end
---@param ... any
---@return any
function BaseMaterial:serializeToNameDictFile(...) end
---@param ... any
---@return any
function BaseMaterial:setCanSave(...) end
---@param ... any
---@return any
function BaseMaterial:setDeclarationLine(...) end
---@param ... any
---@return any
function BaseMaterial:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function BaseMaterial:setEditorDirty(...) end
---@param ... any
---@return any
function BaseMaterial:setEditorOnly(...) end
---@param ... any
---@return any
function BaseMaterial:setField(...) end
---@param ... any
---@return any
function BaseMaterial:setFileName(...) end
---@param ... any
---@return any
function BaseMaterial:setHidden(...) end
---@param ... any
---@return any
function BaseMaterial:setInternalName(...) end
---@param ... any
---@return any
function BaseMaterial:setIsSelected(...) end
---@param ... any
---@return any
function BaseMaterial:setLocked(...) end
---@param ... any
---@return any
function BaseMaterial:setName(...) end
---@param ... any
---@return any
function BaseMaterial:setNameChangeAllowed(...) end
---@param ... any
---@return any
function BaseMaterial:setSelected(...) end
---@param ... any
---@return any
function BaseMaterial:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function BaseMaterial:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function BaseMaterial:unregisterObject(...) end

---@class BeamEngine
---@field nodeGrabber any modifiable
---@field persistenceLuaData any modifiable
local BeamEngine = {}
---@param ... any
---@return any
function BeamEngine:addFirewallException(...) end
---@param ... any
---@return any
function BeamEngine:addObject(...) end
---@param ... any
---@return any
function BeamEngine:castRay(...) end
---@param ... any
---@return any
function BeamEngine:decalManagerLoad(...) end
---@param ... any
---@return any
function BeamEngine:deleteDataBlocks(...) end
---@param ... any
---@return any
function BeamEngine:enterNextVehicle(...) end
---@param ... any
---@return any
function BeamEngine:enterVehicle(...) end
---@param ... any
---@return any
function BeamEngine:executeJS(...) end
---@param ... any
---@return any
function BeamEngine:exitVehicle(...) end
---@param ... any
---@return any
function BeamEngine:getCameraRay(...) end
---@param ... any
---@return any
function BeamEngine:getEnabled(...) end
---@param ... any
---@return any
function BeamEngine:getEngineStream(...) end
---@param ... any
---@return any
function BeamEngine:getEnterableObjectCount(...) end
---@param ... any
---@return any
function BeamEngine:getFFBConfig(...) end
---@param ... any
---@return any
function BeamEngine:getFileStream(...) end
---@param ... any
---@return any
function BeamEngine:getGroundModel(...) end
---@param ... any
---@return any
function BeamEngine:getGroundModelByID(...) end
---@param ... any
---@return any
function BeamEngine:getGroundModelCount(...) end
---@param ... any
---@return any
function BeamEngine:getGroundModelIDByName(...) end
---@param ... any
---@return any
function BeamEngine:getObject(...) end
---@param ... any
---@return any
function BeamEngine:getObjectActive(...) end
---@param ... any
---@return any
function BeamEngine:getObjectByID(...) end
---@param ... any
---@return any
function BeamEngine:getObjectCount(...) end
---@param ... any
---@return any
function BeamEngine:getObjectOOBBAxisNormalizedXYZ(...) end
---@param ... any
---@return any
function BeamEngine:getObjectOOBBCenterXYZ(...) end
---@param ... any
---@return any
function BeamEngine:getObjectOOBBHalfAxisXYZ(...) end
---@param ... any
---@return any
function BeamEngine:getObjectOOBBHalfExtentsXYZ(...) end
---@param ... any
---@return any
function BeamEngine:getObjectOOBBIsInitialized(...) end
---@param ... any
---@return any
function BeamEngine:getObjectPositionXYZ(...) end
---@param ... any
---@return any
function BeamEngine:getObjectVelocityXYZ(...) end
---@param ... any
---@return any
function BeamEngine:getPhysicsDeterministic(...) end
---@param ... any
---@return any
function BeamEngine:getPhysicsFrequency(...) end
---@param ... any
---@return any
function BeamEngine:getPhysicsRunning(...) end
---@param ... any
---@return any
function BeamEngine:getPhysicsSpeedFactor(...) end
---@param ... any
---@return any
function BeamEngine:getPlayerVehicle(...) end
---@param ... any
---@return any
function BeamEngine:getPlayerVehicleID(...) end
---@param ... any
---@return any
function BeamEngine:getSimulationTimeScale(...) end
---@param ... any
---@return any
function BeamEngine:getSimulationTimeScaleAchieved(...) end
---@param ... any
---@return any
function BeamEngine:getSurfaceHeightBelow(...) end
---@param ... any
---@return any
function BeamEngine:getTerrainDrivability(...) end
---@param ... any
---@return any
function BeamEngine:getUpdateUIflag(...) end
---@param ... any
---@return any
function BeamEngine:isBlockedByFirewall(...) end
---@param ... any
---@return any
function BeamEngine:loadTireMarks(...) end
---@param ... any
---@return any
function BeamEngine:makeRelativePath(...) end
---@param ... any
---@return any
function BeamEngine:physicsDestroyWorld(...) end
---@param ... any
---@return any
function BeamEngine:physicsInitWorld(...) end
---@param ... any
---@return any
function BeamEngine:physicsStartSimulation(...) end
---@param ... any
---@return any
function BeamEngine:physicsStep(...) end
---@param ... any
---@return any
function BeamEngine:physicsStopSimulation(...) end
---@param ... any
---@return any
function BeamEngine:queueAllObjectLua(...) end
---@param ... any
---@return any
function BeamEngine:queueAllObjectLuaExcept(...) end
---@param ... any
---@return any
function BeamEngine:queueHookJS(...) end
---@param ... any
---@return any
function BeamEngine:queueJS(...) end
---@param ... any
---@return any
function BeamEngine:queueObjectFastLua(...) end
---@param ... any
---@return any
function BeamEngine:queueObjectLua(...) end
---@param ... any
---@return any
function BeamEngine:queueStreamDataJS(...) end
---@param ... any
---@return any
function BeamEngine:reloadAllVehicles(...) end
---@param ... any
---@return any
function BeamEngine:reloadCollision(...) end
---@param ... any
---@return any
function BeamEngine:reloadStaticCollision(...) end
---@param ... any
---@return any
function BeamEngine:reloadVehicle(...) end
---@param ... any
---@return any
function BeamEngine:resetGroundModels(...) end
---@param ... any
---@return any
function BeamEngine:resetTireMarks(...) end
---@param ... any
---@return any
function BeamEngine:resetVehicle(...) end
---@param ... any
---@return any
function BeamEngine:saveTireMarks(...) end
---@param ... any
---@return any
function BeamEngine:sendHIDPacket(...) end
---@param ... any
---@return any
function BeamEngine:sendToMailbox(...) end
---@param ... any
---@return any
function BeamEngine:setDynamicCollisionEnabled(...) end
---@param ... any
---@return any
function BeamEngine:setEnabled(...) end
---@param ... any
---@return any
function BeamEngine:setGroundModel(...) end
---@param ... any
---@return any
function BeamEngine:setGroundWind(...) end
---@param ... any
---@return any
function BeamEngine:setPhysicsDeterministic(...) end
---@param ... any
---@return any
function BeamEngine:setPhysicsRunning(...) end
---@param ... any
---@return any
function BeamEngine:setPhysicsSpeedFactor(...) end
---@param ... any
---@return any
function BeamEngine:setSeaLevelTemperatureK(...) end
---@param ... any
---@return any
function BeamEngine:setSimulationTimeScale(...) end
---@param ... any
---@return any
function BeamEngine:setThreadingLayout(...) end
---@param ... any
---@return any
function BeamEngine:sfxGetAvailableDevices(...) end
---@param ... any
---@return any
function BeamEngine:toggleEnabled(...) end
---@param ... any
---@return any
function BeamEngine:triggerRaycastClosest(...) end
---@param ... any
---@return any
function BeamEngine:triggerRaycastClosestRay(...) end

---@class BeamNGGameplayArea : SceneObject
---@field className any
local BeamNGGameplayArea = {}
---@param ... any
---@return any
function BeamNGGameplayArea:assignFieldsFromObject(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:canFloatAboveGround(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:clone(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:decRefCount(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:delete(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:deleteObject(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:deletePersistentId(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:disableCollision(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:dump(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:enableCollision(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:generatePersistentId(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getAnchorNames(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getClassDocString(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getClassName(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getDeclarationLine(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getDynamicFields(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getEulerRotation(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getField(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getFieldInfo(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getFieldList(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getFields(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getFieldsForEditor(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getFileName(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getFirstMaterialName(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getForwardVector(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getGroup(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getID(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getId(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getIdString(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getInternalName(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getMaterialNames(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getMeshMaterialNames(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getName(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getObjBox(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getObjectBox(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getPosition(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getPositionXYZ(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getRotation(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getScale(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getTransform(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getTransformF(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getType(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getWorldBox(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getWorldBoxCenter(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:getWorldTransform(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:hideInRenderView(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:incRefCount(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:inheritParentFields(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:inspectUpdate(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:isChildOfGroup(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:isEditorDirty(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:isGlobalBounds(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:isHidden(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:isLocked(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:isNameChangeAllowed(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:isRenderEnabled(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:isSelected(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:isSelectionEnabled(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:isSubClassOf(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:onEditorDisable(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:onEditorEnable(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:postApply(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:preApply(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:registerObject(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:renderViewMaskClear(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:save(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:serialize(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:serializeForEditor(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:serializeToDirectories(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:serializeToNameDictFile(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:setCanFloatAboveGround(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:setCanSave(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:setDeclarationLine(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:setEditorDirty(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:setEditorOnly(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:setField(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:setFileName(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:setHidden(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:setInternalName(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:setIsSelected(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:setLocked(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:setName(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:setNameChangeAllowed(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:setPosRot(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:setPosition(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:setPositionXYZ(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:setRenderEnabled(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:setScale(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:setScaleXYZ(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:setSelected(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:setSelectionEnabled(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:setTransform(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:setTransformF(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:showOnlyInRenderView(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:unhideInRenderView(...) end
---@param ... any
---@return any
function BeamNGGameplayArea:unregisterObject(...) end

---@class BeamNGPointOfInterest : SceneObject
---@field className any
local BeamNGPointOfInterest = {}
---@param ... any
---@return any
function BeamNGPointOfInterest:assignFieldsFromObject(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:canFloatAboveGround(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:clone(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:decRefCount(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:delete(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:deleteObject(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:deletePersistentId(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:disableCollision(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:dump(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:enableCollision(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:generatePersistentId(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getAnchorNames(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getClassDocString(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getClassName(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getDeclarationLine(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getDynamicFields(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getEulerRotation(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getField(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getFieldInfo(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getFieldList(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getFields(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getFieldsForEditor(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getFileName(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getFirstMaterialName(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getForwardVector(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getGroup(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getID(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getId(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getIdString(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getInternalName(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getMaterialNames(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getMeshMaterialNames(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getName(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getObjBox(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getObjectBox(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getPosition(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getPositionXYZ(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getRotation(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getScale(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getTransform(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getTransformF(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getType(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getWorldBox(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getWorldBoxCenter(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:getWorldTransform(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:hideInRenderView(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:incRefCount(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:inheritParentFields(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:inspectUpdate(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:isChildOfGroup(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:isEditorDirty(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:isGlobalBounds(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:isHidden(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:isLocked(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:isNameChangeAllowed(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:isRenderEnabled(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:isSelected(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:isSelectionEnabled(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:isSubClassOf(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:onEditorDisable(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:onEditorEnable(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:postApply(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:preApply(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:registerObject(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:renderViewMaskClear(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:save(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:serialize(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:serializeForEditor(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:serializeToDirectories(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:serializeToNameDictFile(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:setCanFloatAboveGround(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:setCanSave(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:setDeclarationLine(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:setEditorDirty(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:setEditorOnly(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:setField(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:setFileName(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:setHidden(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:setInternalName(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:setIsSelected(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:setLocked(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:setName(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:setNameChangeAllowed(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:setPosRot(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:setPosition(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:setPositionXYZ(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:setRenderEnabled(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:setScale(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:setScaleXYZ(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:setSelected(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:setSelectionEnabled(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:setTransform(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:setTransformF(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:showOnlyInRenderView(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:unhideInRenderView(...) end
---@param ... any
---@return any
function BeamNGPointOfInterest:unregisterObject(...) end

---@class BeamNGTrigger : GameBase
---@field className any
---@field color any modifiable
---@field debug any modifiable
local BeamNGTrigger = {}
---@param ... any
---@return any
function BeamNGTrigger:assignFieldsFromObject(...) end
---@param ... any
---@return any
function BeamNGTrigger:canFloatAboveGround(...) end
---@param ... any
---@return any
function BeamNGTrigger:clearAllObjects(...) end
---@param ... any
---@return any
function BeamNGTrigger:clone(...) end
---@param ... any
---@return any
function BeamNGTrigger:decRefCount(...) end
---@param ... any
---@return any
function BeamNGTrigger:delete(...) end
---@param ... any
---@return any
function BeamNGTrigger:deleteObject(...) end
---@param ... any
---@return any
function BeamNGTrigger:deletePersistentId(...) end
---@param ... any
---@return any
function BeamNGTrigger:disableCollision(...) end
---@param ... any
---@return any
function BeamNGTrigger:dump(...) end
---@param ... any
---@return any
function BeamNGTrigger:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function BeamNGTrigger:enableCollision(...) end
---@param ... any
---@return any
function BeamNGTrigger:generatePersistentId(...) end
---@param ... any
---@return any
function BeamNGTrigger:getAnchorNames(...) end
---@param ... any
---@return any
function BeamNGTrigger:getClassDocString(...) end
---@param ... any
---@return any
function BeamNGTrigger:getClassName(...) end
---@param ... any
---@return any
function BeamNGTrigger:getDataBlock(...) end
---@param ... any
---@return any
function BeamNGTrigger:getDeclarationLine(...) end
---@param ... any
---@return any
function BeamNGTrigger:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function BeamNGTrigger:getDynamicFields(...) end
---@param ... any
---@return any
function BeamNGTrigger:getEulerRotation(...) end
---@param ... any
---@return any
function BeamNGTrigger:getField(...) end
---@param ... any
---@return any
function BeamNGTrigger:getFieldInfo(...) end
---@param ... any
---@return any
function BeamNGTrigger:getFieldList(...) end
---@param ... any
---@return any
function BeamNGTrigger:getFields(...) end
---@param ... any
---@return any
function BeamNGTrigger:getFieldsForEditor(...) end
---@param ... any
---@return any
function BeamNGTrigger:getFileName(...) end
---@param ... any
---@return any
function BeamNGTrigger:getFirstMaterialName(...) end
---@param ... any
---@return any
function BeamNGTrigger:getForwardVector(...) end
---@param ... any
---@return any
function BeamNGTrigger:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function BeamNGTrigger:getGroup(...) end
---@param ... any
---@return any
function BeamNGTrigger:getID(...) end
---@param ... any
---@return any
function BeamNGTrigger:getId(...) end
---@param ... any
---@return any
function BeamNGTrigger:getIdString(...) end
---@param ... any
---@return any
function BeamNGTrigger:getInternalName(...) end
---@param ... any
---@return any
function BeamNGTrigger:getMaterialNames(...) end
---@param ... any
---@return any
function BeamNGTrigger:getMeshMaterialNames(...) end
---@param ... any
---@return any
function BeamNGTrigger:getName(...) end
---@param ... any
---@return any
function BeamNGTrigger:getObjBox(...) end
---@param ... any
---@return any
function BeamNGTrigger:getObjectBox(...) end
---@param ... any
---@return any
function BeamNGTrigger:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function BeamNGTrigger:getPosition(...) end
---@param ... any
---@return any
function BeamNGTrigger:getPositionXYZ(...) end
---@param ... any
---@return any
function BeamNGTrigger:getRotation(...) end
---@param ... any
---@return any
function BeamNGTrigger:getScale(...) end
---@param ... any
---@return any
function BeamNGTrigger:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function BeamNGTrigger:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function BeamNGTrigger:getTransform(...) end
---@param ... any
---@return any
function BeamNGTrigger:getTransformF(...) end
---@param ... any
---@return any
function BeamNGTrigger:getType(...) end
---@param ... any
---@return any
function BeamNGTrigger:getWorldBox(...) end
---@param ... any
---@return any
function BeamNGTrigger:getWorldBoxCenter(...) end
---@param ... any
---@return any
function BeamNGTrigger:getWorldTransform(...) end
---@param ... any
---@return any
function BeamNGTrigger:hideInRenderView(...) end
---@param ... any
---@return any
function BeamNGTrigger:incRefCount(...) end
---@param ... any
---@return any
function BeamNGTrigger:inheritParentFields(...) end
---@param ... any
---@return any
function BeamNGTrigger:inspectUpdate(...) end
---@param ... any
---@return any
function BeamNGTrigger:isChildOfGroup(...) end
---@param ... any
---@return any
function BeamNGTrigger:isEditorDirty(...) end
---@param ... any
---@return any
function BeamNGTrigger:isGlobalBounds(...) end
---@param ... any
---@return any
function BeamNGTrigger:isHidden(...) end
---@param ... any
---@return any
function BeamNGTrigger:isLocked(...) end
---@param ... any
---@return any
function BeamNGTrigger:isNameChangeAllowed(...) end
---@param ... any
---@return any
function BeamNGTrigger:isPointContained(...) end
---@param ... any
---@return any
function BeamNGTrigger:isRenderEnabled(...) end
---@param ... any
---@return any
function BeamNGTrigger:isSelected(...) end
---@param ... any
---@return any
function BeamNGTrigger:isSelectionEnabled(...) end
---@param ... any
---@return any
function BeamNGTrigger:isSubClassOf(...) end
---@param ... any
---@return any
function BeamNGTrigger:onEditorDisable(...) end
---@param ... any
---@return any
function BeamNGTrigger:onEditorEnable(...) end
---@param ... any
---@return any
function BeamNGTrigger:postApply(...) end
---@param ... any
---@return any
function BeamNGTrigger:preApply(...) end
---@param ... any
---@return any
function BeamNGTrigger:registerObject(...) end
---@param ... any
---@return any
function BeamNGTrigger:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function BeamNGTrigger:renderViewMaskClear(...) end
---@param ... any
---@return any
function BeamNGTrigger:save(...) end
---@param ... any
---@return any
function BeamNGTrigger:serialize(...) end
---@param ... any
---@return any
function BeamNGTrigger:serializeForEditor(...) end
---@param ... any
---@return any
function BeamNGTrigger:serializeToDirectories(...) end
---@param ... any
---@return any
function BeamNGTrigger:serializeToNameDictFile(...) end
---@param ... any
---@return any
function BeamNGTrigger:setCanFloatAboveGround(...) end
---@param ... any
---@return any
function BeamNGTrigger:setCanSave(...) end
---@param ... any
---@return any
function BeamNGTrigger:setDataBlock(...) end
---@param ... any
---@return any
function BeamNGTrigger:setDeclarationLine(...) end
---@param ... any
---@return any
function BeamNGTrigger:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function BeamNGTrigger:setEditorDirty(...) end
---@param ... any
---@return any
function BeamNGTrigger:setEditorOnly(...) end
---@param ... any
---@return any
function BeamNGTrigger:setField(...) end
---@param ... any
---@return any
function BeamNGTrigger:setFileName(...) end
---@param ... any
---@return any
function BeamNGTrigger:setHidden(...) end
---@param ... any
---@return any
function BeamNGTrigger:setInternalName(...) end
---@param ... any
---@return any
function BeamNGTrigger:setIsSelected(...) end
---@param ... any
---@return any
function BeamNGTrigger:setLocked(...) end
---@param ... any
---@return any
function BeamNGTrigger:setName(...) end
---@param ... any
---@return any
function BeamNGTrigger:setNameChangeAllowed(...) end
---@param ... any
---@return any
function BeamNGTrigger:setPosRot(...) end
---@param ... any
---@return any
function BeamNGTrigger:setPosition(...) end
---@param ... any
---@return any
function BeamNGTrigger:setPositionXYZ(...) end
---@param ... any
---@return any
function BeamNGTrigger:setRenderEnabled(...) end
---@param ... any
---@return any
function BeamNGTrigger:setScale(...) end
---@param ... any
---@return any
function BeamNGTrigger:setScaleXYZ(...) end
---@param ... any
---@return any
function BeamNGTrigger:setSelected(...) end
---@param ... any
---@return any
function BeamNGTrigger:setSelectionEnabled(...) end
---@param ... any
---@return any
function BeamNGTrigger:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function BeamNGTrigger:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function BeamNGTrigger:setTransform(...) end
---@param ... any
---@return any
function BeamNGTrigger:setTransformF(...) end
---@param ... any
---@return any
function BeamNGTrigger:showOnlyInRenderView(...) end
---@param ... any
---@return any
function BeamNGTrigger:unhideInRenderView(...) end
---@param ... any
---@return any
function BeamNGTrigger:unregisterObject(...) end

---@class BeamNGVehicle : ShapeBase
---@field bouncePhase any modifiable
---@field canBeNodeGrabbed any modifiable
---@field className any
---@field initialCollidableNodePosBB any modifiable
---@field initialNodePosBB any modifiable
---@field playerUsable any modifiable
---@field ropeIds any modifiable
local BeamNGVehicle = {}
---@param ... any
---@return any
function BeamNGVehicle:addFlexmesh(...) end
---@param ... any
---@return any
function BeamNGVehicle:addMirror(...) end
---@param ... any
---@return any
function BeamNGVehicle:addPhysicsTriangle(...) end
---@param ... any
---@return any
function BeamNGVehicle:addProp(...) end
---@param ... any
---@return any
function BeamNGVehicle:addResourceSearchPath(...) end
---@param ... any
---@return any
function BeamNGVehicle:addTrigger(...) end
---@param ... any
---@return any
function BeamNGVehicle:applyClusterVelocityScaleAdd(...) end
---@param ... any
---@return any
function BeamNGVehicle:applyExternalSpring(...) end
---@param ... any
---@return any
function BeamNGVehicle:applyForceTorque(...) end
---@param ... any
---@return any
function BeamNGVehicle:applyForceTorqueStaticPoint(...) end
---@param ... any
---@return any
function BeamNGVehicle:assignFieldsFromObject(...) end
---@param ... any
---@return any
function BeamNGVehicle:autoplace(...) end
---@param ... any
---@return any
function BeamNGVehicle:canFloatAboveGround(...) end
---@param ... any
---@return any
function BeamNGVehicle:changeMaterial(...) end
---@param ... any
---@return any
function BeamNGVehicle:clearMirrorsForced(...) end
---@param ... any
---@return any
function BeamNGVehicle:clearRenderPass(...) end
---@param ... any
---@return any
function BeamNGVehicle:clearRenderPasses(...) end
---@param ... any
---@return any
function BeamNGVehicle:clearResourceSearchPath(...) end
---@param ... any
---@return any
function BeamNGVehicle:clone(...) end
---@param ... any
---@return any
function BeamNGVehicle:coupleNodeWith(...) end
---@param ... any
---@return any
function BeamNGVehicle:createUITexture(...) end
---@param ... any
---@return any
function BeamNGVehicle:decRefCount(...) end
---@param ... any
---@return any
function BeamNGVehicle:delete(...) end
---@param ... any
---@return any
function BeamNGVehicle:deleteObject(...) end
---@param ... any
---@return any
function BeamNGVehicle:deletePersistentId(...) end
---@param ... any
---@return any
function BeamNGVehicle:destroyUITexture(...) end
---@param ... any
---@return any
function BeamNGVehicle:disableCollision(...) end
---@param ... any
---@return any
function BeamNGVehicle:dump(...) end
---@param ... any
---@return any
function BeamNGVehicle:dumpCEFTexture(...) end
---@param ... any
---@return any
function BeamNGVehicle:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function BeamNGVehicle:dumpMeshVisibility(...) end
---@param ... any
---@return any
function BeamNGVehicle:enableCollision(...) end
---@param ... any
---@return any
function BeamNGVehicle:engineSoundInit(...) end
---@param ... any
---@return any
function BeamNGVehicle:engineSoundNodes(...) end
---@param ... any
---@return any
function BeamNGVehicle:engineSoundParameter(...) end
---@param ... any
---@return any
function BeamNGVehicle:engineSoundParameterList(...) end
---@param ... any
---@return any
function BeamNGVehicle:engineSoundUpdate(...) end
---@param ... any
---@return any
function BeamNGVehicle:exportColladaMesh(...) end
---@param ... any
---@return any
function BeamNGVehicle:finishConstructionGESide(...) end
---@param ... any
---@return any
function BeamNGVehicle:generatePersistentId(...) end
---@param ... any
---@return any
function BeamNGVehicle:getActive(...) end
---@param ... any
---@return any
function BeamNGVehicle:getActiveUITextureDebugInfo(...) end
---@param ... any
---@return any
function BeamNGVehicle:getActiveUITextureTagNames(...) end
---@param ... any
---@return any
function BeamNGVehicle:getAnchorNames(...) end
---@param ... any
---@return any
function BeamNGVehicle:getBBCenter(...) end
---@param ... any
---@return any
function BeamNGVehicle:getBSphereCenter(...) end
---@param ... any
---@return any
function BeamNGVehicle:getBSphereRadius(...) end
---@param ... any
---@return any
function BeamNGVehicle:getClassDocString(...) end
---@param ... any
---@return any
function BeamNGVehicle:getClassName(...) end
---@param ... any
---@return any
function BeamNGVehicle:getClusterRotationSlow(...) end
---@param ... any
---@return any
function BeamNGVehicle:getClusterRotationSlowXYZW(...) end
---@param ... any
---@return any
function BeamNGVehicle:getColorFTable(...) end
---@param ... any
---@return any
function BeamNGVehicle:getConsoleOpenUITexture(...) end
---@param ... any
---@return any
function BeamNGVehicle:getCornerPosition(...) end
---@param ... any
---@return any
function BeamNGVehicle:getDataBlock(...) end
---@param ... any
---@return any
function BeamNGVehicle:getDecalProjectionShape(...) end
---@param ... any
---@return any
function BeamNGVehicle:getDeclarationLine(...) end
---@param ... any
---@return any
function BeamNGVehicle:getDirectionVector(...) end
---@param ... any
---@return any
function BeamNGVehicle:getDirectionVectorUp(...) end
---@param ... any
---@return any
function BeamNGVehicle:getDirectionVectorUpXYZ(...) end
---@param ... any
---@return any
function BeamNGVehicle:getDirectionVectorXYZ(...) end
---@param ... any
---@return any
function BeamNGVehicle:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function BeamNGVehicle:getDynamicFields(...) end
---@param ... any
---@return any
function BeamNGVehicle:getEulerRotation(...) end
---@param ... any
---@return any
function BeamNGVehicle:getFFBID(...) end
---@param ... any
---@return any
function BeamNGVehicle:getField(...) end
---@param ... any
---@return any
function BeamNGVehicle:getFieldInfo(...) end
---@param ... any
---@return any
function BeamNGVehicle:getFieldList(...) end
---@param ... any
---@return any
function BeamNGVehicle:getFields(...) end
---@param ... any
---@return any
function BeamNGVehicle:getFieldsForEditor(...) end
---@param ... any
---@return any
function BeamNGVehicle:getFileName(...) end
---@param ... any
---@return any
function BeamNGVehicle:getFirstMaterialName(...) end
---@param ... any
---@return any
function BeamNGVehicle:getFlexmesh(...) end
---@param ... any
---@return any
function BeamNGVehicle:getFlexmeshCount(...) end
---@param ... any
---@return any
function BeamNGVehicle:getFlexmeshMaterial(...) end
---@param ... any
---@return any
function BeamNGVehicle:getForwardVector(...) end
---@param ... any
---@return any
function BeamNGVehicle:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function BeamNGVehicle:getGroup(...) end
---@param ... any
---@return any
function BeamNGVehicle:getHIDDeviceName(...) end
---@param ... any
---@return any
function BeamNGVehicle:getID(...) end
---@param ... any
---@return any
function BeamNGVehicle:getId(...) end
---@param ... any
---@return any
function BeamNGVehicle:getIdString(...) end
---@param ... any
---@return any
function BeamNGVehicle:getInitialHeight(...) end
---@param ... any
---@return any
function BeamNGVehicle:getInitialLength(...) end
---@param ... any
---@return any
function BeamNGVehicle:getInitialNodeCollision(...) end
---@param ... any
---@return any
function BeamNGVehicle:getInitialNodePosition(...) end
---@param ... any
---@return any
function BeamNGVehicle:getInitialWidth(...) end
---@param ... any
---@return any
function BeamNGVehicle:getInternalName(...) end
---@param ... any
---@return any
function BeamNGVehicle:getJBeamFilename(...) end
---@param ... any
---@return any
function BeamNGVehicle:getMaterialIndexByName(...) end
---@param ... any
---@return any
function BeamNGVehicle:getMaterialMapping(...) end
---@param ... any
---@return any
function BeamNGVehicle:getMaterialNames(...) end
---@param ... any
---@return any
function BeamNGVehicle:getMaterialUsageInfo(...) end
---@param ... any
---@return any
function BeamNGVehicle:getMeshAlpha(...) end
---@param ... any
---@return any
function BeamNGVehicle:getMeshCacheRebuildSummary(...) end
---@param ... any
---@return any
function BeamNGVehicle:getMeshColor(...) end
---@param ... any
---@return any
function BeamNGVehicle:getMeshMaterialNames(...) end
---@param ... any
---@return any
function BeamNGVehicle:getMeshMaterials(...) end
---@param ... any
---@return any
function BeamNGVehicle:getMeshNames(...) end
---@param ... any
---@return any
function BeamNGVehicle:getMeshPaintData(...) end
---@param ... any
---@return any
function BeamNGVehicle:getMeshesContainingMaterial(...) end
---@param ... any
---@return any
function BeamNGVehicle:getMeshsMaterialsTbl(...) end
---@param ... any
---@return any
function BeamNGVehicle:getMetallicPaintData(...) end
---@param ... any
---@return any
function BeamNGVehicle:getMirror(...) end
---@param ... any
---@return any
function BeamNGVehicle:getModelFile(...) end
---@param ... any
---@return any
function BeamNGVehicle:getName(...) end
---@param ... any
---@return any
function BeamNGVehicle:getNodeAbsPosition(...) end
---@param ... any
---@return any
function BeamNGVehicle:getNodeAbsPositionXYZ(...) end
---@param ... any
---@return any
function BeamNGVehicle:getNodeClusterGeneration(...) end
---@param ... any
---@return any
function BeamNGVehicle:getNodeClusterId(...) end
---@param ... any
---@return any
function BeamNGVehicle:getNodeClusters(...) end
---@param ... any
---@return any
function BeamNGVehicle:getNodeCount(...) end
---@param ... any
---@return any
function BeamNGVehicle:getNodePosition(...) end
---@param ... any
---@return any
function BeamNGVehicle:getNodePositionXYZ(...) end
---@param ... any
---@return any
function BeamNGVehicle:getNodeVelocity(...) end
---@param ... any
---@return any
function BeamNGVehicle:getNodeVelocityXYZ(...) end
---@param ... any
---@return any
function BeamNGVehicle:getNodeWheelId(...) end
---@param ... any
---@return any
function BeamNGVehicle:getObjBox(...) end
---@param ... any
---@return any
function BeamNGVehicle:getObjectBox(...) end
---@param ... any
---@return any
function BeamNGVehicle:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function BeamNGVehicle:getOriginalPosition(...) end
---@param ... any
---@return any
function BeamNGVehicle:getOriginalRotation(...) end
---@param ... any
---@return any
function BeamNGVehicle:getPath(...) end
---@param ... any
---@return any
function BeamNGVehicle:getPhysicsEnabled(...) end
---@param ... any
---@return any
function BeamNGVehicle:getPosition(...) end
---@param ... any
---@return any
function BeamNGVehicle:getPositionXYZ(...) end
---@param ... any
---@return any
function BeamNGVehicle:getProp(...) end
---@param ... any
---@return any
function BeamNGVehicle:getPropCount(...) end
---@param ... any
---@return any
function BeamNGVehicle:getPropMaterial(...) end
---@param ... any
---@return any
function BeamNGVehicle:getRefNodeAbsPosition(...) end
---@param ... any
---@return any
function BeamNGVehicle:getRefNodeAbsPositionXYZ(...) end
---@param ... any
---@return any
function BeamNGVehicle:getRefNodeId(...) end
---@param ... any
---@return any
function BeamNGVehicle:getRefNodeMatrix(...) end
---@param ... any
---@return any
function BeamNGVehicle:getRefNodeRotation(...) end
---@param ... any
---@return any
function BeamNGVehicle:getRefNodeRotationXYZW(...) end
---@param ... any
---@return any
function BeamNGVehicle:getRootNodeFlexmesh(...) end
---@param ... any
---@return any
function BeamNGVehicle:getRotation(...) end
---@param ... any
---@return any
function BeamNGVehicle:getScale(...) end
---@param ... any
---@return any
function BeamNGVehicle:getSectionBeamDamage(...) end
---@param ... any
---@return any
function BeamNGVehicle:getSectionCollisionDamage(...) end
---@param ... any
---@return any
function BeamNGVehicle:getSectionDamageSum(...) end
---@param ... any
---@return any
function BeamNGVehicle:getSpawnAABBRadius(...) end
---@param ... any
---@return any
function BeamNGVehicle:getSpawnLocalAABB(...) end
---@param ... any
---@return any
function BeamNGVehicle:getSpawnWorldOOBB(...) end
---@param ... any
---@return any
function BeamNGVehicle:getSpawnWorldOOBBCenterXYZ(...) end
---@param ... any
---@return any
function BeamNGVehicle:getSpawnWorldOOBBFrontPoint(...) end
---@param ... any
---@return any
function BeamNGVehicle:getSpawnWorldOOBBFrontPointXYZ(...) end
---@param ... any
---@return any
function BeamNGVehicle:getSpawnWorldOOBBRearPoint(...) end
---@param ... any
---@return any
function BeamNGVehicle:getSpawnWorldOOBBRearPointXYZ(...) end
---@param ... any
---@return any
function BeamNGVehicle:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function BeamNGVehicle:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function BeamNGVehicle:getSwitchableMaterial(...) end
---@param ... any
---@return any
function BeamNGVehicle:getTargetCount(...) end
---@param ... any
---@return any
function BeamNGVehicle:getTargetName(...) end
---@param ... any
---@return any
function BeamNGVehicle:getTransform(...) end
---@param ... any
---@return any
function BeamNGVehicle:getTransformF(...) end
---@param ... any
---@return any
function BeamNGVehicle:getTrigger(...) end
---@param ... any
---@return any
function BeamNGVehicle:getType(...) end
---@param ... any
---@return any
function BeamNGVehicle:getVelocity(...) end
---@param ... any
---@return any
function BeamNGVehicle:getVelocityXYZ(...) end
---@param ... any
---@return any
function BeamNGVehicle:getViewportFillingCameraDistance(...) end
---@param ... any
---@return any
function BeamNGVehicle:getWheelAxisNodes(...) end
---@param ... any
---@return any
function BeamNGVehicle:getWheelCount(...) end
---@param ... any
---@return any
function BeamNGVehicle:getWorldBox(...) end
---@param ... any
---@return any
function BeamNGVehicle:getWorldBoxCenter(...) end
---@param ... any
---@return any
function BeamNGVehicle:getWorldTransform(...) end
---@param ... any
---@return any
function BeamNGVehicle:hideInRenderView(...) end
---@param ... any
---@return any
function BeamNGVehicle:incRefCount(...) end
---@param ... any
---@return any
function BeamNGVehicle:inheritParentFields(...) end
---@param ... any
---@return any
function BeamNGVehicle:initialNodePositionsDone(...) end
---@param ... any
---@return any
function BeamNGVehicle:inspectUpdate(...) end
---@param ... any
---@return any
function BeamNGVehicle:isChildOfGroup(...) end
---@param ... any
---@return any
function BeamNGVehicle:isEditorDirty(...) end
---@param ... any
---@return any
function BeamNGVehicle:isGlobalBounds(...) end
---@param ... any
---@return any
function BeamNGVehicle:isHidden(...) end
---@param ... any
---@return any
function BeamNGVehicle:isLocked(...) end
---@param ... any
---@return any
function BeamNGVehicle:isMateriaDiffuse(...) end
---@param ... any
---@return any
function BeamNGVehicle:isNameChangeAllowed(...) end
---@param ... any
---@return any
function BeamNGVehicle:isPlayerControlled(...) end
---@param ... any
---@return any
function BeamNGVehicle:isReady(...) end
---@param ... any
---@return any
function BeamNGVehicle:isRenderEnabled(...) end
---@param ... any
---@return any
function BeamNGVehicle:isRenderMaterialsReady(...) end
---@param ... any
---@return any
function BeamNGVehicle:isSelected(...) end
---@param ... any
---@return any
function BeamNGVehicle:isSelectionEnabled(...) end
---@param ... any
---@return any
function BeamNGVehicle:isSubClassOf(...) end
---@param ... any
---@return any
function BeamNGVehicle:isUITexture(...) end
---@param ... any
---@return any
function BeamNGVehicle:lua(...) end
---@param ... any
---@return any
function BeamNGVehicle:meshCommit(...) end
---@param ... any
---@return any
function BeamNGVehicle:onEditorDisable(...) end
---@param ... any
---@return any
function BeamNGVehicle:onEditorEnable(...) end
---@param ... any
---@return any
function BeamNGVehicle:openConsoleUITexture(...) end
---@param ... any
---@return any
function BeamNGVehicle:pauseThread(...) end
---@param ... any
---@return any
function BeamNGVehicle:playAudio(...) end
---@param ... any
---@return any
function BeamNGVehicle:playThread(...) end
---@param ... any
---@return any
function BeamNGVehicle:postApply(...) end
---@param ... any
---@return any
function BeamNGVehicle:preApply(...) end
---@param ... any
---@return any
function BeamNGVehicle:prepareTranslucentPermutations(...) end
---@param ... any
---@return any
function BeamNGVehicle:queueJSUITexture(...) end
---@param ... any
---@return any
function BeamNGVehicle:queueLuaCommand(...) end
---@param ... any
---@return any
function BeamNGVehicle:queueParticleWorld(...) end
---@param ... any
---@return any
function BeamNGVehicle:registerObject(...) end
---@param ... any
---@return any
function BeamNGVehicle:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function BeamNGVehicle:reload(...) end
---@param ... any
---@return any
function BeamNGVehicle:reloadAP(...) end
---@param ... any
---@return any
function BeamNGVehicle:renderCameraToMaterial(...) end
---@param ... any
---@return any
function BeamNGVehicle:renderLicensePlateSkia(...) end
---@param ... any
---@return any
function BeamNGVehicle:renderViewMaskClear(...) end
---@param ... any
---@return any
function BeamNGVehicle:requestMesh(...) end
---@param ... any
---@return any
function BeamNGVehicle:requestMeshBegin(...) end
---@param ... any
---@return any
function BeamNGVehicle:requestMeshCommit(...) end
---@param ... any
---@return any
function BeamNGVehicle:requestReload(...) end
---@param ... any
---@return any
function BeamNGVehicle:requestReset(...) end
---@param ... any
---@return any
function BeamNGVehicle:reset(...) end
---@param ... any
---@return any
function BeamNGVehicle:resetBrokenFlexMesh(...) end
---@param ... any
---@return any
function BeamNGVehicle:resetMaterials(...) end
---@param ... any
---@return any
function BeamNGVehicle:respawn(...) end
---@param ... any
---@return any
function BeamNGVehicle:save(...) end
---@param ... any
---@return any
function BeamNGVehicle:serialize(...) end
---@param ... any
---@return any
function BeamNGVehicle:serializeForEditor(...) end
---@param ... any
---@return any
function BeamNGVehicle:serializeToDirectories(...) end
---@param ... any
---@return any
function BeamNGVehicle:serializeToNameDictFile(...) end
---@param ... any
---@return any
function BeamNGVehicle:setActive(...) end
---@param ... any
---@return any
function BeamNGVehicle:setAllMeshesHidden(...) end
---@param ... any
---@return any
function BeamNGVehicle:setAllMirrorsEnabled(...) end
---@param ... any
---@return any
function BeamNGVehicle:setCanFloatAboveGround(...) end
---@param ... any
---@return any
function BeamNGVehicle:setCanSave(...) end
---@param ... any
---@return any
function BeamNGVehicle:setClusterPosRelRot(...) end
---@param ... any
---@return any
function BeamNGVehicle:setColor(...) end
---@param ... any
---@return any
function BeamNGVehicle:setDataBlock(...) end
---@param ... any
---@return any
function BeamNGVehicle:setDeclarationLine(...) end
---@param ... any
---@return any
function BeamNGVehicle:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function BeamNGVehicle:setEditorDirty(...) end
---@param ... any
---@return any
function BeamNGVehicle:setEditorOnly(...) end
---@param ... any
---@return any
function BeamNGVehicle:setField(...) end
---@param ... any
---@return any
function BeamNGVehicle:setFileName(...) end
---@param ... any
---@return any
function BeamNGVehicle:setFlexmeshDebugMode(...) end
---@param ... any
---@return any
function BeamNGVehicle:setFlexmeshMaterial(...) end
---@param ... any
---@return any
function BeamNGVehicle:setFlexmeshMaterialByIndex(...) end
---@param ... any
---@return any
function BeamNGVehicle:setHidden(...) end
---@param ... any
---@return any
function BeamNGVehicle:setInitialNodeCollision(...) end
---@param ... any
---@return any
function BeamNGVehicle:setInitialNodePosition(...) end
---@param ... any
---@return any
function BeamNGVehicle:setInitialNodePositionCount(...) end
---@param ... any
---@return any
function BeamNGVehicle:setInternalName(...) end
---@param ... any
---@return any
function BeamNGVehicle:setIsSelected(...) end
---@param ... any
---@return any
function BeamNGVehicle:setLocked(...) end
---@param ... any
---@return any
function BeamNGVehicle:setMaterialEmissiveFactor(...) end
---@param ... any
---@return any
function BeamNGVehicle:setMeshAlpha(...) end
---@param ... any
---@return any
function BeamNGVehicle:setMeshAnnotationColor(...) end
---@param ... any
---@return any
function BeamNGVehicle:setMeshColor(...) end
---@param ... any
---@return any
function BeamNGVehicle:setMeshDetailFactor(...) end
---@param ... any
---@return any
function BeamNGVehicle:setMeshHidden(...) end
---@param ... any
---@return any
function BeamNGVehicle:setMeshHiddenInRenderView(...) end
---@param ... any
---@return any
function BeamNGVehicle:setMeshPaintData(...) end
---@param ... any
---@return any
function BeamNGVehicle:setMetallicPaintData(...) end
---@param ... any
---@return any
function BeamNGVehicle:setName(...) end
---@param ... any
---@return any
function BeamNGVehicle:setNameChangeAllowed(...) end
---@param ... any
---@return any
function BeamNGVehicle:setOriginalTransform(...) end
---@param ... any
---@return any
function BeamNGVehicle:setPosRot(...) end
---@param ... any
---@return any
function BeamNGVehicle:setPosition(...) end
---@param ... any
---@return any
function BeamNGVehicle:setPositionNoPhysicsReset(...) end
---@param ... any
---@return any
function BeamNGVehicle:setPositionRotation(...) end
---@param ... any
---@return any
function BeamNGVehicle:setPositionXYZ(...) end
---@param ... any
---@return any
function BeamNGVehicle:setPropMaterial(...) end
---@param ... any
---@return any
function BeamNGVehicle:setPropMaterialByIndex(...) end
---@param ... any
---@return any
function BeamNGVehicle:setRefNodes(...) end
---@param ... any
---@return any
function BeamNGVehicle:setRenderEnabled(...) end
---@param ... any
---@return any
function BeamNGVehicle:setRenderPass(...) end
---@param ... any
---@return any
function BeamNGVehicle:setScale(...) end
---@param ... any
---@return any
function BeamNGVehicle:setScaleXYZ(...) end
---@param ... any
---@return any
function BeamNGVehicle:setSelected(...) end
---@param ... any
---@return any
function BeamNGVehicle:setSelectionEnabled(...) end
---@param ... any
---@return any
function BeamNGVehicle:setShapeName(...) end
---@param ... any
---@return any
function BeamNGVehicle:setSkin(...) end
---@param ... any
---@return any
function BeamNGVehicle:setSkinName(...) end
---@param ... any
---@return any
function BeamNGVehicle:setSpawnLocalAABB(...) end
---@param ... any
---@return any
function BeamNGVehicle:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function BeamNGVehicle:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function BeamNGVehicle:setTaggedTexture(...) end
---@param ... any
---@return any
function BeamNGVehicle:setTextureSet(...) end
---@param ... any
---@return any
function BeamNGVehicle:setThreadDir(...) end
---@param ... any
---@return any
function BeamNGVehicle:setThreadPosition(...) end
---@param ... any
---@return any
function BeamNGVehicle:setThreadTimeScale(...) end
---@param ... any
---@return any
function BeamNGVehicle:setTransform(...) end
---@param ... any
---@return any
function BeamNGVehicle:setTransformF(...) end
---@param ... any
---@return any
function BeamNGVehicle:setVehicleTransform(...) end
---@param ... any
---@return any
function BeamNGVehicle:setVelocity(...) end
---@param ... any
---@return any
function BeamNGVehicle:setWindAero(...) end
---@param ... any
---@return any
function BeamNGVehicle:showEngineDirection(...) end
---@param ... any
---@return any
function BeamNGVehicle:showOnlyInRenderView(...) end
---@param ... any
---@return any
function BeamNGVehicle:spawnObject(...) end
---@param ... any
---@return any
function BeamNGVehicle:spawnObjectWithPosRot(...) end
---@param ... any
---@return any
function BeamNGVehicle:spawnObjectWithTransform(...) end
---@param ... any
---@return any
function BeamNGVehicle:spawnPhysics(...) end
---@param ... any
---@return any
function BeamNGVehicle:stopAudio(...) end
---@param ... any
---@return any
function BeamNGVehicle:stopThread(...) end
---@param ... any
---@return any
function BeamNGVehicle:switchMaterial(...) end
---@param ... any
---@return any
function BeamNGVehicle:toggleEditMode(...) end
---@param ... any
---@return any
function BeamNGVehicle:unhideInRenderView(...) end
---@param ... any
---@return any
function BeamNGVehicle:unregisterObject(...) end
---@param ... any
---@return any
function BeamNGVehicle:why(...) end

---@class BeamNGWaypoint : SceneObject
---@field className any
---@field excludeFromMap any modifiable
local BeamNGWaypoint = {}
---@param ... any
---@return any
function BeamNGWaypoint:assignFieldsFromObject(...) end
---@param ... any
---@return any
function BeamNGWaypoint:canFloatAboveGround(...) end
---@param ... any
---@return any
function BeamNGWaypoint:clone(...) end
---@param ... any
---@return any
function BeamNGWaypoint:decRefCount(...) end
---@param ... any
---@return any
function BeamNGWaypoint:delete(...) end
---@param ... any
---@return any
function BeamNGWaypoint:deleteObject(...) end
---@param ... any
---@return any
function BeamNGWaypoint:deletePersistentId(...) end
---@param ... any
---@return any
function BeamNGWaypoint:disableCollision(...) end
---@param ... any
---@return any
function BeamNGWaypoint:dump(...) end
---@param ... any
---@return any
function BeamNGWaypoint:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function BeamNGWaypoint:enableCollision(...) end
---@param ... any
---@return any
function BeamNGWaypoint:generatePersistentId(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getAnchorNames(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getClassDocString(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getClassName(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getDeclarationLine(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getDynamicFields(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getEulerRotation(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getField(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getFieldInfo(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getFieldList(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getFields(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getFieldsForEditor(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getFileName(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getFirstMaterialName(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getForwardVector(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getGroup(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getID(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getId(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getIdString(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getInternalName(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getMaterialNames(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getMeshMaterialNames(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getName(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getObjBox(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getObjectBox(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getPosition(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getPositionXYZ(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getRotation(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getScale(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getTransform(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getTransformF(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getType(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getWorldBox(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getWorldBoxCenter(...) end
---@param ... any
---@return any
function BeamNGWaypoint:getWorldTransform(...) end
---@param ... any
---@return any
function BeamNGWaypoint:hideInRenderView(...) end
---@param ... any
---@return any
function BeamNGWaypoint:incRefCount(...) end
---@param ... any
---@return any
function BeamNGWaypoint:inheritParentFields(...) end
---@param ... any
---@return any
function BeamNGWaypoint:inspectUpdate(...) end
---@param ... any
---@return any
function BeamNGWaypoint:isChildOfGroup(...) end
---@param ... any
---@return any
function BeamNGWaypoint:isEditorDirty(...) end
---@param ... any
---@return any
function BeamNGWaypoint:isGlobalBounds(...) end
---@param ... any
---@return any
function BeamNGWaypoint:isHidden(...) end
---@param ... any
---@return any
function BeamNGWaypoint:isLocked(...) end
---@param ... any
---@return any
function BeamNGWaypoint:isNameChangeAllowed(...) end
---@param ... any
---@return any
function BeamNGWaypoint:isRenderEnabled(...) end
---@param ... any
---@return any
function BeamNGWaypoint:isSelected(...) end
---@param ... any
---@return any
function BeamNGWaypoint:isSelectionEnabled(...) end
---@param ... any
---@return any
function BeamNGWaypoint:isSubClassOf(...) end
---@param ... any
---@return any
function BeamNGWaypoint:onEditorDisable(...) end
---@param ... any
---@return any
function BeamNGWaypoint:onEditorEnable(...) end
---@param ... any
---@return any
function BeamNGWaypoint:postApply(...) end
---@param ... any
---@return any
function BeamNGWaypoint:preApply(...) end
---@param ... any
---@return any
function BeamNGWaypoint:registerObject(...) end
---@param ... any
---@return any
function BeamNGWaypoint:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function BeamNGWaypoint:renderViewMaskClear(...) end
---@param ... any
---@return any
function BeamNGWaypoint:save(...) end
---@param ... any
---@return any
function BeamNGWaypoint:serialize(...) end
---@param ... any
---@return any
function BeamNGWaypoint:serializeForEditor(...) end
---@param ... any
---@return any
function BeamNGWaypoint:serializeToDirectories(...) end
---@param ... any
---@return any
function BeamNGWaypoint:serializeToNameDictFile(...) end
---@param ... any
---@return any
function BeamNGWaypoint:setCanFloatAboveGround(...) end
---@param ... any
---@return any
function BeamNGWaypoint:setCanSave(...) end
---@param ... any
---@return any
function BeamNGWaypoint:setDeclarationLine(...) end
---@param ... any
---@return any
function BeamNGWaypoint:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function BeamNGWaypoint:setEditorDirty(...) end
---@param ... any
---@return any
function BeamNGWaypoint:setEditorOnly(...) end
---@param ... any
---@return any
function BeamNGWaypoint:setField(...) end
---@param ... any
---@return any
function BeamNGWaypoint:setFileName(...) end
---@param ... any
---@return any
function BeamNGWaypoint:setHidden(...) end
---@param ... any
---@return any
function BeamNGWaypoint:setInternalName(...) end
---@param ... any
---@return any
function BeamNGWaypoint:setIsSelected(...) end
---@param ... any
---@return any
function BeamNGWaypoint:setLocked(...) end
---@param ... any
---@return any
function BeamNGWaypoint:setName(...) end
---@param ... any
---@return any
function BeamNGWaypoint:setNameChangeAllowed(...) end
---@param ... any
---@return any
function BeamNGWaypoint:setPosRot(...) end
---@param ... any
---@return any
function BeamNGWaypoint:setPosition(...) end
---@param ... any
---@return any
function BeamNGWaypoint:setPositionXYZ(...) end
---@param ... any
---@return any
function BeamNGWaypoint:setRenderEnabled(...) end
---@param ... any
---@return any
function BeamNGWaypoint:setScale(...) end
---@param ... any
---@return any
function BeamNGWaypoint:setScaleXYZ(...) end
---@param ... any
---@return any
function BeamNGWaypoint:setSelected(...) end
---@param ... any
---@return any
function BeamNGWaypoint:setSelectionEnabled(...) end
---@param ... any
---@return any
function BeamNGWaypoint:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function BeamNGWaypoint:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function BeamNGWaypoint:setTransform(...) end
---@param ... any
---@return any
function BeamNGWaypoint:setTransformF(...) end
---@param ... any
---@return any
function BeamNGWaypoint:showOnlyInRenderView(...) end
---@param ... any
---@return any
function BeamNGWaypoint:unhideInRenderView(...) end
---@param ... any
---@return any
function BeamNGWaypoint:unregisterObject(...) end

---@class BeamNGWorldIconsRenderer : SceneObject
---@field className any
---@field mConstantSizeIcons any modifiable
---@field mDrawIconBackground any modifiable
---@field mFadeIcons any modifiable
---@field mFadeIconsDist any modifiable
---@field mUseIconColor any modifiable
---@field maxIconScale any modifiable
local BeamNGWorldIconsRenderer = {}
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:addIcon(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:assignFieldsFromObject(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:canFloatAboveGround(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:clone(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:decRefCount(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:delete(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:deleteObject(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:deletePersistentId(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:disableCollision(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:dump(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:enableCollision(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:generatePersistentId(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getAnchorNames(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getClassDocString(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getClassName(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getDeclarationLine(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getDynamicFields(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getEulerRotation(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getField(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getFieldInfo(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getFieldList(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getFields(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getFieldsForEditor(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getFileName(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getFirstMaterialName(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getForwardVector(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getGroup(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getID(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getIconById(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getIconByName(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getId(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getIdString(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getInternalName(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getMaterialNames(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getMeshMaterialNames(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getName(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getObjBox(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getObjectBox(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getPosition(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getPositionXYZ(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getRotation(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getScale(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getTransform(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getTransformF(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getType(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getWorldBox(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getWorldBoxCenter(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:getWorldTransform(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:hideInRenderView(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:incRefCount(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:inheritParentFields(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:inspectUpdate(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:isChildOfGroup(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:isEditorDirty(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:isGlobalBounds(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:isHidden(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:isLocked(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:isNameChangeAllowed(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:isRenderEnabled(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:isSelected(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:isSelectionEnabled(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:isSubClassOf(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:loadIconAtlas(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:onEditorDisable(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:onEditorEnable(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:postApply(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:preApply(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:registerObject(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:removeAllIcons(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:removeIconById(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:removeIconByName(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:renderViewMaskClear(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:save(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:serialize(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:serializeForEditor(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:serializeToDirectories(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:serializeToNameDictFile(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:setBackgroundIcon(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:setCanFloatAboveGround(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:setCanSave(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:setDeclarationLine(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:setEditorDirty(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:setEditorOnly(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:setField(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:setFileName(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:setHidden(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:setInternalName(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:setIsSelected(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:setLocked(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:setName(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:setNameChangeAllowed(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:setPosRot(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:setPosition(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:setPositionXYZ(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:setRenderEnabled(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:setScale(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:setScaleXYZ(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:setSelected(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:setSelectionEnabled(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:setTransform(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:setTransformF(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:showOnlyInRenderView(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:unhideInRenderView(...) end
---@param ... any
---@return any
function BeamNGWorldIconsRenderer:unregisterObject(...) end

---@class Camera : ShapeBase
---@field className any
local Camera = {}
---@param ... any
---@return any
function Camera:assignFieldsFromObject(...) end
---@param ... any
---@return any
function Camera:canFloatAboveGround(...) end
---@param ... any
---@return any
function Camera:changeMaterial(...) end
---@param ... any
---@return any
function Camera:clone(...) end
---@param ... any
---@return any
function Camera:decRefCount(...) end
---@param ... any
---@return any
function Camera:delete(...) end
---@param ... any
---@return any
function Camera:deleteObject(...) end
---@param ... any
---@return any
function Camera:deletePersistentId(...) end
---@param ... any
---@return any
function Camera:disableCollision(...) end
---@param ... any
---@return any
function Camera:dump(...) end
---@param ... any
---@return any
function Camera:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function Camera:dumpMeshVisibility(...) end
---@param ... any
---@return any
function Camera:enableCollision(...) end
---@param ... any
---@return any
function Camera:generatePersistentId(...) end
---@param ... any
---@return any
function Camera:getAnchorNames(...) end
---@param ... any
---@return any
function Camera:getCameraDepthUnderwater(...) end
---@param ... any
---@return any
function Camera:getClassDocString(...) end
---@param ... any
---@return any
function Camera:getClassName(...) end
---@param ... any
---@return any
function Camera:getDataBlock(...) end
---@param ... any
---@return any
function Camera:getDeclarationLine(...) end
---@param ... any
---@return any
function Camera:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function Camera:getDynamicFields(...) end
---@param ... any
---@return any
function Camera:getEulerRotation(...) end
---@param ... any
---@return any
function Camera:getField(...) end
---@param ... any
---@return any
function Camera:getFieldInfo(...) end
---@param ... any
---@return any
function Camera:getFieldList(...) end
---@param ... any
---@return any
function Camera:getFields(...) end
---@param ... any
---@return any
function Camera:getFieldsForEditor(...) end
---@param ... any
---@return any
function Camera:getFileName(...) end
---@param ... any
---@return any
function Camera:getFirstMaterialName(...) end
---@param ... any
---@return any
function Camera:getForwardVector(...) end
---@param ... any
---@return any
function Camera:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function Camera:getGroup(...) end
---@param ... any
---@return any
function Camera:getID(...) end
---@param ... any
---@return any
function Camera:getId(...) end
---@param ... any
---@return any
function Camera:getIdString(...) end
---@param ... any
---@return any
function Camera:getInternalName(...) end
---@param ... any
---@return any
function Camera:getMaterialNames(...) end
---@param ... any
---@return any
function Camera:getMeshMaterialNames(...) end
---@param ... any
---@return any
function Camera:getModelFile(...) end
---@param ... any
---@return any
function Camera:getName(...) end
---@param ... any
---@return any
function Camera:getObjBox(...) end
---@param ... any
---@return any
function Camera:getObjectBox(...) end
---@param ... any
---@return any
function Camera:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function Camera:getPosition(...) end
---@param ... any
---@return any
function Camera:getPositionXYZ(...) end
---@param ... any
---@return any
function Camera:getRotation(...) end
---@param ... any
---@return any
function Camera:getScale(...) end
---@param ... any
---@return any
function Camera:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function Camera:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function Camera:getTargetCount(...) end
---@param ... any
---@return any
function Camera:getTargetName(...) end
---@param ... any
---@return any
function Camera:getTransform(...) end
---@param ... any
---@return any
function Camera:getTransformF(...) end
---@param ... any
---@return any
function Camera:getType(...) end
---@param ... any
---@return any
function Camera:getVelocity(...) end
---@param ... any
---@return any
function Camera:getWorldBox(...) end
---@param ... any
---@return any
function Camera:getWorldBoxCenter(...) end
---@param ... any
---@return any
function Camera:getWorldTransform(...) end
---@param ... any
---@return any
function Camera:hideInRenderView(...) end
---@param ... any
---@return any
function Camera:incRefCount(...) end
---@param ... any
---@return any
function Camera:inheritParentFields(...) end
---@param ... any
---@return any
function Camera:inspectUpdate(...) end
---@param ... any
---@return any
function Camera:isCameraUnderwater(...) end
---@param ... any
---@return any
function Camera:isChildOfGroup(...) end
---@param ... any
---@return any
function Camera:isEditorDirty(...) end
---@param ... any
---@return any
function Camera:isGlobalBounds(...) end
---@param ... any
---@return any
function Camera:isHidden(...) end
---@param ... any
---@return any
function Camera:isLocked(...) end
---@param ... any
---@return any
function Camera:isNameChangeAllowed(...) end
---@param ... any
---@return any
function Camera:isRenderEnabled(...) end
---@param ... any
---@return any
function Camera:isSelected(...) end
---@param ... any
---@return any
function Camera:isSelectionEnabled(...) end
---@param ... any
---@return any
function Camera:isSubClassOf(...) end
---@param ... any
---@return any
function Camera:onEditorDisable(...) end
---@param ... any
---@return any
function Camera:onEditorEnable(...) end
---@param ... any
---@return any
function Camera:pauseThread(...) end
---@param ... any
---@return any
function Camera:playAudio(...) end
---@param ... any
---@return any
function Camera:playThread(...) end
---@param ... any
---@return any
function Camera:postApply(...) end
---@param ... any
---@return any
function Camera:preApply(...) end
---@param ... any
---@return any
function Camera:registerObject(...) end
---@param ... any
---@return any
function Camera:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function Camera:renderViewMaskClear(...) end
---@param ... any
---@return any
function Camera:save(...) end
---@param ... any
---@return any
function Camera:serialize(...) end
---@param ... any
---@return any
function Camera:serializeForEditor(...) end
---@param ... any
---@return any
function Camera:serializeToDirectories(...) end
---@param ... any
---@return any
function Camera:serializeToNameDictFile(...) end
---@param ... any
---@return any
function Camera:setAllMeshesHidden(...) end
---@param ... any
---@return any
function Camera:setCanFloatAboveGround(...) end
---@param ... any
---@return any
function Camera:setCanSave(...) end
---@param ... any
---@return any
function Camera:setDataBlock(...) end
---@param ... any
---@return any
function Camera:setDeclarationLine(...) end
---@param ... any
---@return any
function Camera:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function Camera:setEditorDirty(...) end
---@param ... any
---@return any
function Camera:setEditorOnly(...) end
---@param ... any
---@return any
function Camera:setField(...) end
---@param ... any
---@return any
function Camera:setFileName(...) end
---@param ... any
---@return any
function Camera:setHidden(...) end
---@param ... any
---@return any
function Camera:setInternalName(...) end
---@param ... any
---@return any
function Camera:setIsSelected(...) end
---@param ... any
---@return any
function Camera:setLocked(...) end
---@param ... any
---@return any
function Camera:setMeshHidden(...) end
---@param ... any
---@return any
function Camera:setName(...) end
---@param ... any
---@return any
function Camera:setNameChangeAllowed(...) end
---@param ... any
---@return any
function Camera:setPosRot(...) end
---@param ... any
---@return any
function Camera:setPosition(...) end
---@param ... any
---@return any
function Camera:setPositionXYZ(...) end
---@param ... any
---@return any
function Camera:setRenderEnabled(...) end
---@param ... any
---@return any
function Camera:setScale(...) end
---@param ... any
---@return any
function Camera:setScaleXYZ(...) end
---@param ... any
---@return any
function Camera:setSelected(...) end
---@param ... any
---@return any
function Camera:setSelectionEnabled(...) end
---@param ... any
---@return any
function Camera:setShapeName(...) end
---@param ... any
---@return any
function Camera:setSkinName(...) end
---@param ... any
---@return any
function Camera:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function Camera:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function Camera:setThreadDir(...) end
---@param ... any
---@return any
function Camera:setThreadPosition(...) end
---@param ... any
---@return any
function Camera:setThreadTimeScale(...) end
---@param ... any
---@return any
function Camera:setTransform(...) end
---@param ... any
---@return any
function Camera:setTransformF(...) end
---@param ... any
---@return any
function Camera:setVelocity(...) end
---@param ... any
---@return any
function Camera:showOnlyInRenderView(...) end
---@param ... any
---@return any
function Camera:stopAudio(...) end
---@param ... any
---@return any
function Camera:stopThread(...) end
---@param ... any
---@return any
function Camera:unhideInRenderView(...) end
---@param ... any
---@return any
function Camera:unregisterObject(...) end

---@class CameraBookmark : MissionMarker
---@field className any
---@field observer any modifiable
local CameraBookmark = {}
---@param ... any
---@return any
function CameraBookmark:assignFieldsFromObject(...) end
---@param ... any
---@return any
function CameraBookmark:canFloatAboveGround(...) end
---@param ... any
---@return any
function CameraBookmark:changeMaterial(...) end
---@param ... any
---@return any
function CameraBookmark:clone(...) end
---@param ... any
---@return any
function CameraBookmark:decRefCount(...) end
---@param ... any
---@return any
function CameraBookmark:delete(...) end
---@param ... any
---@return any
function CameraBookmark:deleteObject(...) end
---@param ... any
---@return any
function CameraBookmark:deletePersistentId(...) end
---@param ... any
---@return any
function CameraBookmark:disableCollision(...) end
---@param ... any
---@return any
function CameraBookmark:dump(...) end
---@param ... any
---@return any
function CameraBookmark:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function CameraBookmark:dumpMeshVisibility(...) end
---@param ... any
---@return any
function CameraBookmark:enableCollision(...) end
---@param ... any
---@return any
function CameraBookmark:generatePersistentId(...) end
---@param ... any
---@return any
function CameraBookmark:getAnchorNames(...) end
---@param ... any
---@return any
function CameraBookmark:getClassDocString(...) end
---@param ... any
---@return any
function CameraBookmark:getClassName(...) end
---@param ... any
---@return any
function CameraBookmark:getDataBlock(...) end
---@param ... any
---@return any
function CameraBookmark:getDeclarationLine(...) end
---@param ... any
---@return any
function CameraBookmark:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function CameraBookmark:getDynamicFields(...) end
---@param ... any
---@return any
function CameraBookmark:getEulerRotation(...) end
---@param ... any
---@return any
function CameraBookmark:getField(...) end
---@param ... any
---@return any
function CameraBookmark:getFieldInfo(...) end
---@param ... any
---@return any
function CameraBookmark:getFieldList(...) end
---@param ... any
---@return any
function CameraBookmark:getFields(...) end
---@param ... any
---@return any
function CameraBookmark:getFieldsForEditor(...) end
---@param ... any
---@return any
function CameraBookmark:getFileName(...) end
---@param ... any
---@return any
function CameraBookmark:getFirstMaterialName(...) end
---@param ... any
---@return any
function CameraBookmark:getForwardVector(...) end
---@param ... any
---@return any
function CameraBookmark:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function CameraBookmark:getGroup(...) end
---@param ... any
---@return any
function CameraBookmark:getID(...) end
---@param ... any
---@return any
function CameraBookmark:getId(...) end
---@param ... any
---@return any
function CameraBookmark:getIdString(...) end
---@param ... any
---@return any
function CameraBookmark:getInternalName(...) end
---@param ... any
---@return any
function CameraBookmark:getMaterialNames(...) end
---@param ... any
---@return any
function CameraBookmark:getMeshMaterialNames(...) end
---@param ... any
---@return any
function CameraBookmark:getModelFile(...) end
---@param ... any
---@return any
function CameraBookmark:getName(...) end
---@param ... any
---@return any
function CameraBookmark:getObjBox(...) end
---@param ... any
---@return any
function CameraBookmark:getObjectBox(...) end
---@param ... any
---@return any
function CameraBookmark:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function CameraBookmark:getPosition(...) end
---@param ... any
---@return any
function CameraBookmark:getPositionXYZ(...) end
---@param ... any
---@return any
function CameraBookmark:getRotation(...) end
---@param ... any
---@return any
function CameraBookmark:getScale(...) end
---@param ... any
---@return any
function CameraBookmark:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function CameraBookmark:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function CameraBookmark:getTargetCount(...) end
---@param ... any
---@return any
function CameraBookmark:getTargetName(...) end
---@param ... any
---@return any
function CameraBookmark:getTransform(...) end
---@param ... any
---@return any
function CameraBookmark:getTransformF(...) end
---@param ... any
---@return any
function CameraBookmark:getType(...) end
---@param ... any
---@return any
function CameraBookmark:getVelocity(...) end
---@param ... any
---@return any
function CameraBookmark:getWorldBox(...) end
---@param ... any
---@return any
function CameraBookmark:getWorldBoxCenter(...) end
---@param ... any
---@return any
function CameraBookmark:getWorldTransform(...) end
---@param ... any
---@return any
function CameraBookmark:hideInRenderView(...) end
---@param ... any
---@return any
function CameraBookmark:incRefCount(...) end
---@param ... any
---@return any
function CameraBookmark:inheritParentFields(...) end
---@param ... any
---@return any
function CameraBookmark:inspectUpdate(...) end
---@param ... any
---@return any
function CameraBookmark:isChildOfGroup(...) end
---@param ... any
---@return any
function CameraBookmark:isEditorDirty(...) end
---@param ... any
---@return any
function CameraBookmark:isGlobalBounds(...) end
---@param ... any
---@return any
function CameraBookmark:isHidden(...) end
---@param ... any
---@return any
function CameraBookmark:isLocked(...) end
---@param ... any
---@return any
function CameraBookmark:isNameChangeAllowed(...) end
---@param ... any
---@return any
function CameraBookmark:isRenderEnabled(...) end
---@param ... any
---@return any
function CameraBookmark:isSelected(...) end
---@param ... any
---@return any
function CameraBookmark:isSelectionEnabled(...) end
---@param ... any
---@return any
function CameraBookmark:isSubClassOf(...) end
---@param ... any
---@return any
function CameraBookmark:onEditorDisable(...) end
---@param ... any
---@return any
function CameraBookmark:onEditorEnable(...) end
---@param ... any
---@return any
function CameraBookmark:pauseThread(...) end
---@param ... any
---@return any
function CameraBookmark:playAudio(...) end
---@param ... any
---@return any
function CameraBookmark:playThread(...) end
---@param ... any
---@return any
function CameraBookmark:postApply(...) end
---@param ... any
---@return any
function CameraBookmark:preApply(...) end
---@param ... any
---@return any
function CameraBookmark:registerObject(...) end
---@param ... any
---@return any
function CameraBookmark:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function CameraBookmark:renderViewMaskClear(...) end
---@param ... any
---@return any
function CameraBookmark:save(...) end
---@param ... any
---@return any
function CameraBookmark:serialize(...) end
---@param ... any
---@return any
function CameraBookmark:serializeForEditor(...) end
---@param ... any
---@return any
function CameraBookmark:serializeToDirectories(...) end
---@param ... any
---@return any
function CameraBookmark:serializeToNameDictFile(...) end
---@param ... any
---@return any
function CameraBookmark:setAllMeshesHidden(...) end
---@param ... any
---@return any
function CameraBookmark:setCanFloatAboveGround(...) end
---@param ... any
---@return any
function CameraBookmark:setCanSave(...) end
---@param ... any
---@return any
function CameraBookmark:setDataBlock(...) end
---@param ... any
---@return any
function CameraBookmark:setDeclarationLine(...) end
---@param ... any
---@return any
function CameraBookmark:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function CameraBookmark:setEditorDirty(...) end
---@param ... any
---@return any
function CameraBookmark:setEditorOnly(...) end
---@param ... any
---@return any
function CameraBookmark:setField(...) end
---@param ... any
---@return any
function CameraBookmark:setFileName(...) end
---@param ... any
---@return any
function CameraBookmark:setHidden(...) end
---@param ... any
---@return any
function CameraBookmark:setInternalName(...) end
---@param ... any
---@return any
function CameraBookmark:setIsSelected(...) end
---@param ... any
---@return any
function CameraBookmark:setLocked(...) end
---@param ... any
---@return any
function CameraBookmark:setMeshHidden(...) end
---@param ... any
---@return any
function CameraBookmark:setName(...) end
---@param ... any
---@return any
function CameraBookmark:setNameChangeAllowed(...) end
---@param ... any
---@return any
function CameraBookmark:setPosRot(...) end
---@param ... any
---@return any
function CameraBookmark:setPosition(...) end
---@param ... any
---@return any
function CameraBookmark:setPositionXYZ(...) end
---@param ... any
---@return any
function CameraBookmark:setRenderEnabled(...) end
---@param ... any
---@return any
function CameraBookmark:setScale(...) end
---@param ... any
---@return any
function CameraBookmark:setScaleXYZ(...) end
---@param ... any
---@return any
function CameraBookmark:setSelected(...) end
---@param ... any
---@return any
function CameraBookmark:setSelectionEnabled(...) end
---@param ... any
---@return any
function CameraBookmark:setShapeName(...) end
---@param ... any
---@return any
function CameraBookmark:setSkinName(...) end
---@param ... any
---@return any
function CameraBookmark:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function CameraBookmark:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function CameraBookmark:setThreadDir(...) end
---@param ... any
---@return any
function CameraBookmark:setThreadPosition(...) end
---@param ... any
---@return any
function CameraBookmark:setThreadTimeScale(...) end
---@param ... any
---@return any
function CameraBookmark:setTransform(...) end
---@param ... any
---@return any
function CameraBookmark:setTransformF(...) end
---@param ... any
---@return any
function CameraBookmark:setVelocity(...) end
---@param ... any
---@return any
function CameraBookmark:showOnlyInRenderView(...) end
---@param ... any
---@return any
function CameraBookmark:stopAudio(...) end
---@param ... any
---@return any
function CameraBookmark:stopThread(...) end
---@param ... any
---@return any
function CameraBookmark:unhideInRenderView(...) end
---@param ... any
---@return any
function CameraBookmark:unregisterObject(...) end

---@class CameraData : ShapeBaseData
---@field className any
local CameraData = {}
---@param ... any
---@return any
function CameraData:assignFieldsFromObject(...) end
---@param ... any
---@return any
function CameraData:clone(...) end
---@param ... any
---@return any
function CameraData:decRefCount(...) end
---@param ... any
---@return any
function CameraData:delete(...) end
---@param ... any
---@return any
function CameraData:deleteObject(...) end
---@param ... any
---@return any
function CameraData:deletePersistentId(...) end
---@param ... any
---@return any
function CameraData:dump(...) end
---@param ... any
---@return any
function CameraData:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function CameraData:generatePersistentId(...) end
---@param ... any
---@return any
function CameraData:getClassDocString(...) end
---@param ... any
---@return any
function CameraData:getClassName(...) end
---@param ... any
---@return any
function CameraData:getDeclarationLine(...) end
---@param ... any
---@return any
function CameraData:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function CameraData:getDynamicFields(...) end
---@param ... any
---@return any
function CameraData:getField(...) end
---@param ... any
---@return any
function CameraData:getFieldInfo(...) end
---@param ... any
---@return any
function CameraData:getFieldList(...) end
---@param ... any
---@return any
function CameraData:getFields(...) end
---@param ... any
---@return any
function CameraData:getFieldsForEditor(...) end
---@param ... any
---@return any
function CameraData:getFileName(...) end
---@param ... any
---@return any
function CameraData:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function CameraData:getGroup(...) end
---@param ... any
---@return any
function CameraData:getID(...) end
---@param ... any
---@return any
function CameraData:getId(...) end
---@param ... any
---@return any
function CameraData:getIdString(...) end
---@param ... any
---@return any
function CameraData:getInternalName(...) end
---@param ... any
---@return any
function CameraData:getName(...) end
---@param ... any
---@return any
function CameraData:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function CameraData:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function CameraData:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function CameraData:incRefCount(...) end
---@param ... any
---@return any
function CameraData:inheritParentFields(...) end
---@param ... any
---@return any
function CameraData:inspectUpdate(...) end
---@param ... any
---@return any
function CameraData:isChildOfGroup(...) end
---@param ... any
---@return any
function CameraData:isEditorDirty(...) end
---@param ... any
---@return any
function CameraData:isHidden(...) end
---@param ... any
---@return any
function CameraData:isLocked(...) end
---@param ... any
---@return any
function CameraData:isNameChangeAllowed(...) end
---@param ... any
---@return any
function CameraData:isSelected(...) end
---@param ... any
---@return any
function CameraData:isSubClassOf(...) end
---@param ... any
---@return any
function CameraData:onEditorDisable(...) end
---@param ... any
---@return any
function CameraData:onEditorEnable(...) end
---@param ... any
---@return any
function CameraData:postApply(...) end
---@param ... any
---@return any
function CameraData:preApply(...) end
---@param ... any
---@return any
function CameraData:registerObject(...) end
---@param ... any
---@return any
function CameraData:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function CameraData:save(...) end
---@param ... any
---@return any
function CameraData:serialize(...) end
---@param ... any
---@return any
function CameraData:serializeForEditor(...) end
---@param ... any
---@return any
function CameraData:serializeToDirectories(...) end
---@param ... any
---@return any
function CameraData:serializeToNameDictFile(...) end
---@param ... any
---@return any
function CameraData:setCanSave(...) end
---@param ... any
---@return any
function CameraData:setDeclarationLine(...) end
---@param ... any
---@return any
function CameraData:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function CameraData:setEditorDirty(...) end
---@param ... any
---@return any
function CameraData:setEditorOnly(...) end
---@param ... any
---@return any
function CameraData:setField(...) end
---@param ... any
---@return any
function CameraData:setFileName(...) end
---@param ... any
---@return any
function CameraData:setHidden(...) end
---@param ... any
---@return any
function CameraData:setInternalName(...) end
---@param ... any
---@return any
function CameraData:setIsSelected(...) end
---@param ... any
---@return any
function CameraData:setLocked(...) end
---@param ... any
---@return any
function CameraData:setName(...) end
---@param ... any
---@return any
function CameraData:setNameChangeAllowed(...) end
---@param ... any
---@return any
function CameraData:setSelected(...) end
---@param ... any
---@return any
function CameraData:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function CameraData:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function CameraData:unregisterObject(...) end

---@class CefGui : GuiContainer
---@field className any
local CefGui = {}
---@param ... any
---@return any
function CefGui:add(...) end
---@param ... any
---@return any
function CefGui:addGuiControl(...) end
---@param ... any
---@return any
function CefGui:addObject(...) end
---@param ... any
---@return any
function CefGui:addWithName(...) end
---@param ... any
---@return any
function CefGui:assignFieldsFromObject(...) end
---@param ... any
---@return any
function CefGui:at(...) end
---@param ... any
---@return any
function CefGui:awaken(...) end
---@param ... any
---@return any
function CefGui:bringObjectToFront(...) end
---@param ... any
---@return any
function CefGui:bringToFront(...) end
---@param ... any
---@return any
function CefGui:clear(...) end
---@param ... any
---@return any
function CefGui:clearFirstResponder(...) end
---@param ... any
---@return any
function CefGui:clone(...) end
---@param ... any
---@return any
function CefGui:controlIsChild(...) end
---@param ... any
---@return any
function CefGui:decRefCount(...) end
---@param ... any
---@return any
function CefGui:delete(...) end
---@param ... any
---@return any
function CefGui:deleteAllObjects(...) end
---@param ... any
---@return any
function CefGui:deleteObject(...) end
---@param ... any
---@return any
function CefGui:deletePersistentId(...) end
---@param ... any
---@return any
function CefGui:dump(...) end
---@param ... any
---@return any
function CefGui:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function CefGui:findObject(...) end
---@param ... any
---@return any
function CefGui:findObjectById(...) end
---@param ... any
---@return any
function CefGui:findObjectByInternalName(...) end
---@param ... any
---@return any
function CefGui:findObjectIdAfter(...) end
---@param ... any
---@return any
function CefGui:generatePersistentId(...) end
---@param ... any
---@return any
function CefGui:getBounds(...) end
---@param ... any
---@return any
function CefGui:getCenter(...) end
---@param ... any
---@return any
function CefGui:getClassDocString(...) end
---@param ... any
---@return any
function CefGui:getClassName(...) end
---@param ... any
---@return any
function CefGui:getCount(...) end
---@param ... any
---@return any
function CefGui:getDeclarationLine(...) end
---@param ... any
---@return any
function CefGui:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function CefGui:getDynamicFields(...) end
---@param ... any
---@return any
function CefGui:getExtent(...) end
---@param ... any
---@return any
function CefGui:getField(...) end
---@param ... any
---@return any
function CefGui:getFieldInfo(...) end
---@param ... any
---@return any
function CefGui:getFieldList(...) end
---@param ... any
---@return any
function CefGui:getFields(...) end
---@param ... any
---@return any
function CefGui:getFieldsForEditor(...) end
---@param ... any
---@return any
function CefGui:getFileName(...) end
---@param ... any
---@return any
function CefGui:getFirstResponder(...) end
---@param ... any
---@return any
function CefGui:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function CefGui:getGlobalBounds(...) end
---@param ... any
---@return any
function CefGui:getGlobalPosition(...) end
---@param ... any
---@return any
function CefGui:getGroup(...) end
---@param ... any
---@return any
function CefGui:getID(...) end
---@param ... any
---@return any
function CefGui:getId(...) end
---@param ... any
---@return any
function CefGui:getIdString(...) end
---@param ... any
---@return any
function CefGui:getInternalName(...) end
---@param ... any
---@return any
function CefGui:getMaxFPSLimit(...) end
---@param ... any
---@return any
function CefGui:getName(...) end
---@param ... any
---@return any
function CefGui:getObject(...) end
---@param ... any
---@return any
function CefGui:getObjectIndex(...) end
---@param ... any
---@return any
function CefGui:getObjects(...) end
---@param ... any
---@return any
function CefGui:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function CefGui:getParent(...) end
---@param ... any
---@return any
function CefGui:getPosition(...) end
---@param ... any
---@return any
function CefGui:getRandom(...) end
---@param ... any
---@return any
function CefGui:getRoot(...) end
---@param ... any
---@return any
function CefGui:getScenetreeData(...) end
---@param ... any
---@return any
function CefGui:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function CefGui:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function CefGui:idAt(...) end
---@param ... any
---@return any
function CefGui:incRefCount(...) end
---@param ... any
---@return any
function CefGui:inheritParentFields(...) end
---@param ... any
---@return any
function CefGui:inspectUpdate(...) end
---@param ... any
---@return any
function CefGui:isActive(...) end
---@param ... any
---@return any
function CefGui:isAwake(...) end
---@param ... any
---@return any
function CefGui:isChildOfGroup(...) end
---@param ... any
---@return any
function CefGui:isEditorDirty(...) end
---@param ... any
---@return any
function CefGui:isFirstResponder(...) end
---@param ... any
---@return any
function CefGui:isHidden(...) end
---@param ... any
---@return any
function CefGui:isLocked(...) end
---@param ... any
---@return any
function CefGui:isMember(...) end
---@param ... any
---@return any
function CefGui:isNameChangeAllowed(...) end
---@param ... any
---@return any
function CefGui:isSelected(...) end
---@param ... any
---@return any
function CefGui:isSubClassOf(...) end
---@param ... any
---@return any
function CefGui:isVisible(...) end
---@param ... any
---@return any
function CefGui:listObjects(...) end
---@param ... any
---@return any
function CefGui:loadURL(...) end
---@param ... any
---@return any
function CefGui:onEditorDisable(...) end
---@param ... any
---@return any
function CefGui:onEditorEnable(...) end
---@param ... any
---@return any
function CefGui:postApply(...) end
---@param ... any
---@return any
function CefGui:preApply(...) end
---@param ... any
---@return any
function CefGui:preRender(...) end
---@param ... any
---@return any
function CefGui:pushObjectToBack(...) end
---@param ... any
---@return any
function CefGui:pushToBack(...) end
---@param ... any
---@return any
function CefGui:registerObject(...) end
---@param ... any
---@return any
function CefGui:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function CefGui:remove(...) end
---@param ... any
---@return any
function CefGui:removeObject(...) end
---@param ... any
---@return any
function CefGui:reorderChild(...) end
---@param ... any
---@return any
function CefGui:resize(...) end
---@param ... any
---@return any
function CefGui:save(...) end
---@param ... any
---@return any
function CefGui:serialize(...) end
---@param ... any
---@return any
function CefGui:serializeForEditor(...) end
---@param ... any
---@return any
function CefGui:serializeToDirectories(...) end
---@param ... any
---@return any
function CefGui:serializeToNameDictFile(...) end
---@param ... any
---@return any
function CefGui:setActive(...) end
---@param ... any
---@return any
function CefGui:setCanHit(...) end
---@param ... any
---@return any
function CefGui:setCanSave(...) end
---@param ... any
---@return any
function CefGui:setCenter(...) end
---@param ... any
---@return any
function CefGui:setControlProfile(...) end
---@param ... any
---@return any
function CefGui:setDeclarationLine(...) end
---@param ... any
---@return any
function CefGui:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function CefGui:setEditorDirty(...) end
---@param ... any
---@return any
function CefGui:setEditorOnly(...) end
---@param ... any
---@return any
function CefGui:setField(...) end
---@param ... any
---@return any
function CefGui:setFileName(...) end
---@param ... any
---@return any
function CefGui:setFirstResponder(...) end
---@param ... any
---@return any
function CefGui:setHidden(...) end
---@param ... any
---@return any
function CefGui:setInternalName(...) end
---@param ... any
---@return any
function CefGui:setIsSelected(...) end
---@param ... any
---@return any
function CefGui:setLocked(...) end
---@param ... any
---@return any
function CefGui:setMaxFPSLimit(...) end
---@param ... any
---@return any
function CefGui:setName(...) end
---@param ... any
---@return any
function CefGui:setNameChangeAllowed(...) end
---@param ... any
---@return any
function CefGui:setPosition(...) end
---@param ... any
---@return any
function CefGui:setPositionGlobal(...) end
---@param ... any
---@return any
function CefGui:setProfile(...) end
---@param ... any
---@return any
function CefGui:setSelected(...) end
---@param ... any
---@return any
function CefGui:setSizing(...) end
---@param ... any
---@return any
function CefGui:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function CefGui:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function CefGui:setTooltipProfile(...) end
---@param ... any
---@return any
function CefGui:setUpdate(...) end
---@param ... any
---@return any
function CefGui:setValue(...) end
---@param ... any
---@return any
function CefGui:setVisible(...) end
---@param ... any
---@return any
function CefGui:size(...) end
---@param ... any
---@return any
function CefGui:sleep(...) end
---@param ... any
---@return any
function CefGui:sortByName(...) end
---@param ... any
---@return any
function CefGui:unregisterObject(...) end

---@class ConsoleObject
---@field __gc any
---@field __index any
local ConsoleObject = {}
---@param ... any
---@return any
function ConsoleObject:getFieldInfo(...) end
---@param ... any
---@return any
function ConsoleObject:getFieldList(...) end
---@param ... any
---@return any
function ConsoleObject:getFields(...) end
---@param ... any
---@return any
function ConsoleObject:getFieldsForEditor(...) end

---@class CubemapData : SimObject
---@field className any
local CubemapData = {}
---@param ... any
---@return any
function CubemapData:assignFieldsFromObject(...) end
---@param ... any
---@return any
function CubemapData:clone(...) end
---@param ... any
---@return any
function CubemapData:decRefCount(...) end
---@param ... any
---@return any
function CubemapData:delete(...) end
---@param ... any
---@return any
function CubemapData:deleteObject(...) end
---@param ... any
---@return any
function CubemapData:deletePersistentId(...) end
---@param ... any
---@return any
function CubemapData:dump(...) end
---@param ... any
---@return any
function CubemapData:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function CubemapData:generatePersistentId(...) end
---@param ... any
---@return any
function CubemapData:getClassDocString(...) end
---@param ... any
---@return any
function CubemapData:getClassName(...) end
---@param ... any
---@return any
function CubemapData:getDeclarationLine(...) end
---@param ... any
---@return any
function CubemapData:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function CubemapData:getDynamicFields(...) end
---@param ... any
---@return any
function CubemapData:getField(...) end
---@param ... any
---@return any
function CubemapData:getFieldInfo(...) end
---@param ... any
---@return any
function CubemapData:getFieldList(...) end
---@param ... any
---@return any
function CubemapData:getFields(...) end
---@param ... any
---@return any
function CubemapData:getFieldsForEditor(...) end
---@param ... any
---@return any
function CubemapData:getFileName(...) end
---@param ... any
---@return any
function CubemapData:getFilename(...) end
---@param ... any
---@return any
function CubemapData:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function CubemapData:getGroup(...) end
---@param ... any
---@return any
function CubemapData:getID(...) end
---@param ... any
---@return any
function CubemapData:getId(...) end
---@param ... any
---@return any
function CubemapData:getIdString(...) end
---@param ... any
---@return any
function CubemapData:getInternalName(...) end
---@param ... any
---@return any
function CubemapData:getName(...) end
---@param ... any
---@return any
function CubemapData:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function CubemapData:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function CubemapData:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function CubemapData:incRefCount(...) end
---@param ... any
---@return any
function CubemapData:inheritParentFields(...) end
---@param ... any
---@return any
function CubemapData:inspectUpdate(...) end
---@param ... any
---@return any
function CubemapData:isChildOfGroup(...) end
---@param ... any
---@return any
function CubemapData:isEditorDirty(...) end
---@param ... any
---@return any
function CubemapData:isHidden(...) end
---@param ... any
---@return any
function CubemapData:isLocked(...) end
---@param ... any
---@return any
function CubemapData:isNameChangeAllowed(...) end
---@param ... any
---@return any
function CubemapData:isSelected(...) end
---@param ... any
---@return any
function CubemapData:isSubClassOf(...) end
---@param ... any
---@return any
function CubemapData:onEditorDisable(...) end
---@param ... any
---@return any
function CubemapData:onEditorEnable(...) end
---@param ... any
---@return any
function CubemapData:postApply(...) end
---@param ... any
---@return any
function CubemapData:preApply(...) end
---@param ... any
---@return any
function CubemapData:registerObject(...) end
---@param ... any
---@return any
function CubemapData:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function CubemapData:save(...) end
---@param ... any
---@return any
function CubemapData:serialize(...) end
---@param ... any
---@return any
function CubemapData:serializeForEditor(...) end
---@param ... any
---@return any
function CubemapData:serializeToDirectories(...) end
---@param ... any
---@return any
function CubemapData:serializeToNameDictFile(...) end
---@param ... any
---@return any
function CubemapData:setCanSave(...) end
---@param ... any
---@return any
function CubemapData:setDeclarationLine(...) end
---@param ... any
---@return any
function CubemapData:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function CubemapData:setEditorDirty(...) end
---@param ... any
---@return any
function CubemapData:setEditorOnly(...) end
---@param ... any
---@return any
function CubemapData:setField(...) end
---@param ... any
---@return any
function CubemapData:setFileName(...) end
---@param ... any
---@return any
function CubemapData:setHidden(...) end
---@param ... any
---@return any
function CubemapData:setInternalName(...) end
---@param ... any
---@return any
function CubemapData:setIsSelected(...) end
---@param ... any
---@return any
function CubemapData:setLocked(...) end
---@param ... any
---@return any
function CubemapData:setName(...) end
---@param ... any
---@return any
function CubemapData:setNameChangeAllowed(...) end
---@param ... any
---@return any
function CubemapData:setSelected(...) end
---@param ... any
---@return any
function CubemapData:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function CubemapData:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function CubemapData:unregisterObject(...) end
---@param ... any
---@return any
function CubemapData:updateFaces(...) end

---@class CustomMaterial : Material
---@field className any
local CustomMaterial = {}
---@param ... any
---@return any
function CustomMaterial:assignFieldsFromObject(...) end
---@param ... any
---@return any
function CustomMaterial:clone(...) end
---@param ... any
---@return any
function CustomMaterial:decRefCount(...) end
---@param ... any
---@return any
function CustomMaterial:delete(...) end
---@param ... any
---@return any
function CustomMaterial:deleteObject(...) end
---@param ... any
---@return any
function CustomMaterial:deletePersistentId(...) end
---@param ... any
---@return any
function CustomMaterial:dump(...) end
---@param ... any
---@return any
function CustomMaterial:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function CustomMaterial:dumpInstances(...) end
---@param ... any
---@return any
function CustomMaterial:flush(...) end
---@param ... any
---@return any
function CustomMaterial:generatePersistentId(...) end
---@param ... any
---@return any
function CustomMaterial:getAnimFlags(...) end
---@param ... any
---@return any
function CustomMaterial:getClassDocString(...) end
---@param ... any
---@return any
function CustomMaterial:getClassName(...) end
---@param ... any
---@return any
function CustomMaterial:getDeclarationLine(...) end
---@param ... any
---@return any
function CustomMaterial:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function CustomMaterial:getDynamicFields(...) end
---@param ... any
---@return any
function CustomMaterial:getField(...) end
---@param ... any
---@return any
function CustomMaterial:getFieldInfo(...) end
---@param ... any
---@return any
function CustomMaterial:getFieldList(...) end
---@param ... any
---@return any
function CustomMaterial:getFields(...) end
---@param ... any
---@return any
function CustomMaterial:getFieldsForEditor(...) end
---@param ... any
---@return any
function CustomMaterial:getFileName(...) end
---@param ... any
---@return any
function CustomMaterial:getFilename(...) end
---@param ... any
---@return any
function CustomMaterial:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function CustomMaterial:getGroup(...) end
---@param ... any
---@return any
function CustomMaterial:getID(...) end
---@param ... any
---@return any
function CustomMaterial:getId(...) end
---@param ... any
---@return any
function CustomMaterial:getIdString(...) end
---@param ... any
---@return any
function CustomMaterial:getInternalName(...) end
---@param ... any
---@return any
function CustomMaterial:getName(...) end
---@param ... any
---@return any
function CustomMaterial:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function CustomMaterial:getPath(...) end
---@param ... any
---@return any
function CustomMaterial:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function CustomMaterial:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function CustomMaterial:incRefCount(...) end
---@param ... any
---@return any
function CustomMaterial:inheritParentFields(...) end
---@param ... any
---@return any
function CustomMaterial:inspectUpdate(...) end
---@param ... any
---@return any
function CustomMaterial:isAutoGenerated(...) end
---@param ... any
---@return any
function CustomMaterial:isChildOfGroup(...) end
---@param ... any
---@return any
function CustomMaterial:isEditorDirty(...) end
---@param ... any
---@return any
function CustomMaterial:isHidden(...) end
---@param ... any
---@return any
function CustomMaterial:isLocked(...) end
---@param ... any
---@return any
function CustomMaterial:isNameChangeAllowed(...) end
---@param ... any
---@return any
function CustomMaterial:isSelected(...) end
---@param ... any
---@return any
function CustomMaterial:isSubClassOf(...) end
---@param ... any
---@return any
function CustomMaterial:onEditorDisable(...) end
---@param ... any
---@return any
function CustomMaterial:onEditorEnable(...) end
---@param ... any
---@return any
function CustomMaterial:postApply(...) end
---@param ... any
---@return any
function CustomMaterial:preApply(...) end
---@param ... any
---@return any
function CustomMaterial:registerObject(...) end
---@param ... any
---@return any
function CustomMaterial:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function CustomMaterial:reload(...) end
---@param ... any
---@return any
function CustomMaterial:save(...) end
---@param ... any
---@return any
function CustomMaterial:serialize(...) end
---@param ... any
---@return any
function CustomMaterial:serializeForEditor(...) end
---@param ... any
---@return any
function CustomMaterial:serializeToDirectories(...) end
---@param ... any
---@return any
function CustomMaterial:serializeToNameDictFile(...) end
---@param ... any
---@return any
function CustomMaterial:setAutoGenerated(...) end
---@param ... any
---@return any
function CustomMaterial:setCanSave(...) end
---@param ... any
---@return any
function CustomMaterial:setDeclarationLine(...) end
---@param ... any
---@return any
function CustomMaterial:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function CustomMaterial:setEditorDirty(...) end
---@param ... any
---@return any
function CustomMaterial:setEditorOnly(...) end
---@param ... any
---@return any
function CustomMaterial:setField(...) end
---@param ... any
---@return any
function CustomMaterial:setFileName(...) end
---@param ... any
---@return any
function CustomMaterial:setFilename(...) end
---@param ... any
---@return any
function CustomMaterial:setHidden(...) end
---@param ... any
---@return any
function CustomMaterial:setInternalName(...) end
---@param ... any
---@return any
function CustomMaterial:setIsSelected(...) end
---@param ... any
---@return any
function CustomMaterial:setLocked(...) end
---@param ... any
---@return any
function CustomMaterial:setName(...) end
---@param ... any
---@return any
function CustomMaterial:setNameChangeAllowed(...) end
---@param ... any
---@return any
function CustomMaterial:setSelected(...) end
---@param ... any
---@return any
function CustomMaterial:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function CustomMaterial:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function CustomMaterial:unregisterObject(...) end

---@class DebugDrawer : SimObject
---@field className any
local DebugDrawer = {}
---@param ... any
---@return any
function DebugDrawer:assignFieldsFromObject(...) end
---@param ... any
---@return any
function DebugDrawer:clone(...) end
---@param ... any
---@return any
function DebugDrawer:currentRenderViewMaskAdd(...) end
---@param ... any
---@return any
function DebugDrawer:currentRenderViewMaskClear(...) end
---@param ... any
---@return any
function DebugDrawer:currentRenderViewMaskRemove(...) end
---@param ... any
---@return any
function DebugDrawer:currentRenderViewMaskSet(...) end
---@param ... any
---@return any
function DebugDrawer:decRefCount(...) end
---@param ... any
---@return any
function DebugDrawer:delete(...) end
---@param ... any
---@return any
function DebugDrawer:deleteObject(...) end
---@param ... any
---@return any
function DebugDrawer:deletePersistentId(...) end
---@param ... any
---@return any
function DebugDrawer:drawArrow(...) end
---@param ... any
---@return any
function DebugDrawer:drawAxisGizmo(...) end
---@param ... any
---@return any
function DebugDrawer:drawBox(...) end
---@param ... any
---@return any
function DebugDrawer:drawCircle(...) end
---@param ... any
---@return any
function DebugDrawer:drawCylinder(...) end
---@param ... any
---@return any
function DebugDrawer:drawDot(...) end
---@param ... any
---@return any
function DebugDrawer:drawFrustum(...) end
---@param ... any
---@return any
function DebugDrawer:drawLine(...) end
---@param ... any
---@return any
function DebugDrawer:drawLineInstance(...) end
---@param ... any
---@return any
function DebugDrawer:drawQuadSolid(...) end
---@param ... any
---@return any
function DebugDrawer:drawSphere(...) end
---@param ... any
---@return any
function DebugDrawer:drawSphereOcclusionQuery(...) end
---@param ... any
---@return any
function DebugDrawer:drawSquarePrism(...) end
---@param ... any
---@return any
function DebugDrawer:drawText(...) end
---@param ... any
---@return any
function DebugDrawer:drawTextAdvanced(...) end
---@param ... any
---@return any
function DebugDrawer:drawTri(...) end
---@param ... any
---@return any
function DebugDrawer:drawTriSolid(...) end
---@param ... any
---@return any
function DebugDrawer:dump(...) end
---@param ... any
---@return any
function DebugDrawer:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function DebugDrawer:generatePersistentId(...) end
---@param ... any
---@return any
function DebugDrawer:getClassDocString(...) end
---@param ... any
---@return any
function DebugDrawer:getClassName(...) end
---@param ... any
---@return any
function DebugDrawer:getDeclarationLine(...) end
---@param ... any
---@return any
function DebugDrawer:getDrawingEnabled(...) end
---@param ... any
---@return any
function DebugDrawer:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function DebugDrawer:getDynamicFields(...) end
---@param ... any
---@return any
function DebugDrawer:getField(...) end
---@param ... any
---@return any
function DebugDrawer:getFieldInfo(...) end
---@param ... any
---@return any
function DebugDrawer:getFieldList(...) end
---@param ... any
---@return any
function DebugDrawer:getFields(...) end
---@param ... any
---@return any
function DebugDrawer:getFieldsForEditor(...) end
---@param ... any
---@return any
function DebugDrawer:getFileName(...) end
---@param ... any
---@return any
function DebugDrawer:getFreezingEnabled(...) end
---@param ... any
---@return any
function DebugDrawer:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function DebugDrawer:getGroup(...) end
---@param ... any
---@return any
function DebugDrawer:getID(...) end
---@param ... any
---@return any
function DebugDrawer:getId(...) end
---@param ... any
---@return any
function DebugDrawer:getIdString(...) end
---@param ... any
---@return any
function DebugDrawer:getInternalName(...) end
---@param ... any
---@return any
function DebugDrawer:getName(...) end
---@param ... any
---@return any
function DebugDrawer:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function DebugDrawer:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function DebugDrawer:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function DebugDrawer:incRefCount(...) end
---@param ... any
---@return any
function DebugDrawer:inheritParentFields(...) end
---@param ... any
---@return any
function DebugDrawer:inspectUpdate(...) end
---@param ... any
---@return any
function DebugDrawer:isChildOfGroup(...) end
---@param ... any
---@return any
function DebugDrawer:isEditorDirty(...) end
---@param ... any
---@return any
function DebugDrawer:isHidden(...) end
---@param ... any
---@return any
function DebugDrawer:isLocked(...) end
---@param ... any
---@return any
function DebugDrawer:isNameChangeAllowed(...) end
---@param ... any
---@return any
function DebugDrawer:isSelected(...) end
---@param ... any
---@return any
function DebugDrawer:isSubClassOf(...) end
---@param ... any
---@return any
function DebugDrawer:onEditorDisable(...) end
---@param ... any
---@return any
function DebugDrawer:onEditorEnable(...) end
---@param ... any
---@return any
function DebugDrawer:postApply(...) end
---@param ... any
---@return any
function DebugDrawer:preApply(...) end
---@param ... any
---@return any
function DebugDrawer:registerObject(...) end
---@param ... any
---@return any
function DebugDrawer:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function DebugDrawer:renderGroundModelDebug(...) end
---@param ... any
---@return any
function DebugDrawer:renderStaticColCounter(...) end
---@param ... any
---@return any
function DebugDrawer:renderStaticColDebug(...) end
---@param ... any
---@return any
function DebugDrawer:save(...) end
---@param ... any
---@return any
function DebugDrawer:serialize(...) end
---@param ... any
---@return any
function DebugDrawer:serializeForEditor(...) end
---@param ... any
---@return any
function DebugDrawer:serializeToDirectories(...) end
---@param ... any
---@return any
function DebugDrawer:serializeToNameDictFile(...) end
---@param ... any
---@return any
function DebugDrawer:setCanSave(...) end
---@param ... any
---@return any
function DebugDrawer:setDeclarationLine(...) end
---@param ... any
---@return any
function DebugDrawer:setDrawingEnabled(...) end
---@param ... any
---@return any
function DebugDrawer:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function DebugDrawer:setEditorDirty(...) end
---@param ... any
---@return any
function DebugDrawer:setEditorOnly(...) end
---@param ... any
---@return any
function DebugDrawer:setField(...) end
---@param ... any
---@return any
function DebugDrawer:setFileName(...) end
---@param ... any
---@return any
function DebugDrawer:setFreezingEnabled(...) end
---@param ... any
---@return any
function DebugDrawer:setHidden(...) end
---@param ... any
---@return any
function DebugDrawer:setInternalName(...) end
---@param ... any
---@return any
function DebugDrawer:setIsSelected(...) end
---@param ... any
---@return any
function DebugDrawer:setLastTTL(...) end
---@param ... any
---@return any
function DebugDrawer:setLastZTest(...) end
---@param ... any
---@return any
function DebugDrawer:setLocked(...) end
---@param ... any
---@return any
function DebugDrawer:setName(...) end
---@param ... any
---@return any
function DebugDrawer:setNameChangeAllowed(...) end
---@param ... any
---@return any
function DebugDrawer:setSelected(...) end
---@param ... any
---@return any
function DebugDrawer:setSolidTriCulling(...) end
---@param ... any
---@return any
function DebugDrawer:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function DebugDrawer:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function DebugDrawer:toggleDrawing(...) end
---@param ... any
---@return any
function DebugDrawer:toggleFreeze(...) end
---@param ... any
---@return any
function DebugDrawer:unregisterObject(...) end

---@class DecalData : SimDataBlock
---@field className any
local DecalData = {}
---@param ... any
---@return any
function DecalData:assignFieldsFromObject(...) end
---@param ... any
---@return any
function DecalData:clone(...) end
---@param ... any
---@return any
function DecalData:decRefCount(...) end
---@param ... any
---@return any
function DecalData:delete(...) end
---@param ... any
---@return any
function DecalData:deleteObject(...) end
---@param ... any
---@return any
function DecalData:deletePersistentId(...) end
---@param ... any
---@return any
function DecalData:dump(...) end
---@param ... any
---@return any
function DecalData:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function DecalData:generatePersistentId(...) end
---@param ... any
---@return any
function DecalData:getClassDocString(...) end
---@param ... any
---@return any
function DecalData:getClassName(...) end
---@param ... any
---@return any
function DecalData:getDeclarationLine(...) end
---@param ... any
---@return any
function DecalData:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function DecalData:getDynamicFields(...) end
---@param ... any
---@return any
function DecalData:getField(...) end
---@param ... any
---@return any
function DecalData:getFieldInfo(...) end
---@param ... any
---@return any
function DecalData:getFieldList(...) end
---@param ... any
---@return any
function DecalData:getFields(...) end
---@param ... any
---@return any
function DecalData:getFieldsForEditor(...) end
---@param ... any
---@return any
function DecalData:getFileName(...) end
---@param ... any
---@return any
function DecalData:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function DecalData:getGroup(...) end
---@param ... any
---@return any
function DecalData:getID(...) end
---@param ... any
---@return any
function DecalData:getId(...) end
---@param ... any
---@return any
function DecalData:getIdString(...) end
---@param ... any
---@return any
function DecalData:getInternalName(...) end
---@param ... any
---@return any
function DecalData:getName(...) end
---@param ... any
---@return any
function DecalData:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function DecalData:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function DecalData:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function DecalData:incRefCount(...) end
---@param ... any
---@return any
function DecalData:inheritParentFields(...) end
---@param ... any
---@return any
function DecalData:inspectUpdate(...) end
---@param ... any
---@return any
function DecalData:isChildOfGroup(...) end
---@param ... any
---@return any
function DecalData:isEditorDirty(...) end
---@param ... any
---@return any
function DecalData:isHidden(...) end
---@param ... any
---@return any
function DecalData:isLocked(...) end
---@param ... any
---@return any
function DecalData:isNameChangeAllowed(...) end
---@param ... any
---@return any
function DecalData:isSelected(...) end
---@param ... any
---@return any
function DecalData:isSubClassOf(...) end
---@param ... any
---@return any
function DecalData:onEditorDisable(...) end
---@param ... any
---@return any
function DecalData:onEditorEnable(...) end
---@param ... any
---@return any
function DecalData:postApply(...) end
---@param ... any
---@return any
function DecalData:preApply(...) end
---@param ... any
---@return any
function DecalData:registerObject(...) end
---@param ... any
---@return any
function DecalData:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function DecalData:save(...) end
---@param ... any
---@return any
function DecalData:serialize(...) end
---@param ... any
---@return any
function DecalData:serializeForEditor(...) end
---@param ... any
---@return any
function DecalData:serializeToDirectories(...) end
---@param ... any
---@return any
function DecalData:serializeToNameDictFile(...) end
---@param ... any
---@return any
function DecalData:setCanSave(...) end
---@param ... any
---@return any
function DecalData:setDeclarationLine(...) end
---@param ... any
---@return any
function DecalData:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function DecalData:setEditorDirty(...) end
---@param ... any
---@return any
function DecalData:setEditorOnly(...) end
---@param ... any
---@return any
function DecalData:setField(...) end
---@param ... any
---@return any
function DecalData:setFileName(...) end
---@param ... any
---@return any
function DecalData:setHidden(...) end
---@param ... any
---@return any
function DecalData:setInternalName(...) end
---@param ... any
---@return any
function DecalData:setIsSelected(...) end
---@param ... any
---@return any
function DecalData:setLocked(...) end
---@param ... any
---@return any
function DecalData:setName(...) end
---@param ... any
---@return any
function DecalData:setNameChangeAllowed(...) end
---@param ... any
---@return any
function DecalData:setSelected(...) end
---@param ... any
---@return any
function DecalData:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function DecalData:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function DecalData:unregisterObject(...) end

---@class DecalRoad : SceneObject
---@field className any
local DecalRoad = {}
---@param ... any
---@return any
function DecalRoad:assignFieldsFromObject(...) end
---@param ... any
---@return any
function DecalRoad:canFloatAboveGround(...) end
---@param ... any
---@return any
function DecalRoad:clone(...) end
---@param ... any
---@return any
function DecalRoad:containsPoint(...) end
---@param ... any
---@return any
function DecalRoad:decRefCount(...) end
---@param ... any
---@return any
function DecalRoad:delete(...) end
---@param ... any
---@return any
function DecalRoad:deleteNode(...) end
---@param ... any
---@return any
function DecalRoad:deleteNodeNoRegen(...) end
---@param ... any
---@return any
function DecalRoad:deleteObject(...) end
---@param ... any
---@return any
function DecalRoad:deletePersistentId(...) end
---@param ... any
---@return any
function DecalRoad:disableCollision(...) end
---@param ... any
---@return any
function DecalRoad:dump(...) end
---@param ... any
---@return any
function DecalRoad:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function DecalRoad:enableCollision(...) end
---@param ... any
---@return any
function DecalRoad:generatePersistentId(...) end
---@param ... any
---@return any
function DecalRoad:getAnchorNames(...) end
---@param ... any
---@return any
function DecalRoad:getClassDocString(...) end
---@param ... any
---@return any
function DecalRoad:getClassName(...) end
---@param ... any
---@return any
function DecalRoad:getDeclarationLine(...) end
---@param ... any
---@return any
function DecalRoad:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function DecalRoad:getDynamicFields(...) end
---@param ... any
---@return any
function DecalRoad:getEdgeCount(...) end
---@param ... any
---@return any
function DecalRoad:getEdgesTable(...) end
---@param ... any
---@return any
function DecalRoad:getEulerRotation(...) end
---@param ... any
---@return any
function DecalRoad:getField(...) end
---@param ... any
---@return any
function DecalRoad:getFieldInfo(...) end
---@param ... any
---@return any
function DecalRoad:getFieldList(...) end
---@param ... any
---@return any
function DecalRoad:getFields(...) end
---@param ... any
---@return any
function DecalRoad:getFieldsForEditor(...) end
---@param ... any
---@return any
function DecalRoad:getFileName(...) end
---@param ... any
---@return any
function DecalRoad:getFirstMaterialName(...) end
---@param ... any
---@return any
function DecalRoad:getForwardVector(...) end
---@param ... any
---@return any
function DecalRoad:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function DecalRoad:getGroup(...) end
---@param ... any
---@return any
function DecalRoad:getID(...) end
---@param ... any
---@return any
function DecalRoad:getId(...) end
---@param ... any
---@return any
function DecalRoad:getIdString(...) end
---@param ... any
---@return any
function DecalRoad:getInternalName(...) end
---@param ... any
---@return any
function DecalRoad:getLeftEdgePosition(...) end
---@param ... any
---@return any
function DecalRoad:getMaterialNames(...) end
---@param ... any
---@return any
function DecalRoad:getMeshMaterialNames(...) end
---@param ... any
---@return any
function DecalRoad:getMiddleEdgePosition(...) end
---@param ... any
---@return any
function DecalRoad:getName(...) end
---@param ... any
---@return any
function DecalRoad:getNodeCount(...) end
---@param ... any
---@return any
function DecalRoad:getNodePosition(...) end
---@param ... any
---@return any
function DecalRoad:getNodeWidth(...) end
---@param ... any
---@return any
function DecalRoad:getNodesFrustum(...) end
---@param ... any
---@return any
function DecalRoad:getNodesTable(...) end
---@param ... any
---@return any
function DecalRoad:getObjBox(...) end
---@param ... any
---@return any
function DecalRoad:getObjectBox(...) end
---@param ... any
---@return any
function DecalRoad:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function DecalRoad:getPosition(...) end
---@param ... any
---@return any
function DecalRoad:getPositionXYZ(...) end
---@param ... any
---@return any
function DecalRoad:getRightEdgePosition(...) end
---@param ... any
---@return any
function DecalRoad:getRotation(...) end
---@param ... any
---@return any
function DecalRoad:getScale(...) end
---@param ... any
---@return any
function DecalRoad:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function DecalRoad:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function DecalRoad:getTransform(...) end
---@param ... any
---@return any
function DecalRoad:getTransformF(...) end
---@param ... any
---@return any
function DecalRoad:getType(...) end
---@param ... any
---@return any
function DecalRoad:getWorldBox(...) end
---@param ... any
---@return any
function DecalRoad:getWorldBoxCenter(...) end
---@param ... any
---@return any
function DecalRoad:getWorldTransform(...) end
---@param ... any
---@return any
function DecalRoad:hideInRenderView(...) end
---@param ... any
---@return any
function DecalRoad:incRefCount(...) end
---@param ... any
---@return any
function DecalRoad:inheritParentFields(...) end
---@param ... any
---@return any
function DecalRoad:insertNode(...) end
---@param ... any
---@return any
function DecalRoad:insertNodeNoRegen(...) end
---@param ... any
---@return any
function DecalRoad:inspectUpdate(...) end
---@param ... any
---@return any
function DecalRoad:isChildOfGroup(...) end
---@param ... any
---@return any
function DecalRoad:isEditorDirty(...) end
---@param ... any
---@return any
function DecalRoad:isGlobalBounds(...) end
---@param ... any
---@return any
function DecalRoad:isHidden(...) end
---@param ... any
---@return any
function DecalRoad:isLocked(...) end
---@param ... any
---@return any
function DecalRoad:isNameChangeAllowed(...) end
---@param ... any
---@return any
function DecalRoad:isRenderEnabled(...) end
---@param ... any
---@return any
function DecalRoad:isSelected(...) end
---@param ... any
---@return any
function DecalRoad:isSelectionEnabled(...) end
---@param ... any
---@return any
function DecalRoad:isSubClassOf(...) end
---@param ... any
---@return any
function DecalRoad:onEditorDisable(...) end
---@param ... any
---@return any
function DecalRoad:onEditorEnable(...) end
---@param ... any
---@return any
function DecalRoad:postApply(...) end
---@param ... any
---@return any
function DecalRoad:preApply(...) end
---@param ... any
---@return any
function DecalRoad:regenerate(...) end
---@param ... any
---@return any
function DecalRoad:registerObject(...) end
---@param ... any
---@return any
function DecalRoad:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function DecalRoad:renderViewMaskClear(...) end
---@param ... any
---@return any
function DecalRoad:save(...) end
---@param ... any
---@return any
function DecalRoad:serialize(...) end
---@param ... any
---@return any
function DecalRoad:serializeForEditor(...) end
---@param ... any
---@return any
function DecalRoad:serializeToDirectories(...) end
---@param ... any
---@return any
function DecalRoad:serializeToNameDictFile(...) end
---@param ... any
---@return any
function DecalRoad:setCanFloatAboveGround(...) end
---@param ... any
---@return any
function DecalRoad:setCanSave(...) end
---@param ... any
---@return any
function DecalRoad:setDeclarationLine(...) end
---@param ... any
---@return any
function DecalRoad:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function DecalRoad:setEditorDirty(...) end
---@param ... any
---@return any
function DecalRoad:setEditorOnly(...) end
---@param ... any
---@return any
function DecalRoad:setField(...) end
---@param ... any
---@return any
function DecalRoad:setFileName(...) end
---@param ... any
---@return any
function DecalRoad:setHidden(...) end
---@param ... any
---@return any
function DecalRoad:setInternalName(...) end
---@param ... any
---@return any
function DecalRoad:setIsSelected(...) end
---@param ... any
---@return any
function DecalRoad:setLocked(...) end
---@param ... any
---@return any
function DecalRoad:setName(...) end
---@param ... any
---@return any
function DecalRoad:setNameChangeAllowed(...) end
---@param ... any
---@return any
function DecalRoad:setNodePosition(...) end
---@param ... any
---@return any
function DecalRoad:setNodeWidth(...) end
---@param ... any
---@return any
function DecalRoad:setPosRot(...) end
---@param ... any
---@return any
function DecalRoad:setPosition(...) end
---@param ... any
---@return any
function DecalRoad:setPositionXYZ(...) end
---@param ... any
---@return any
function DecalRoad:setRenderEnabled(...) end
---@param ... any
---@return any
function DecalRoad:setScale(...) end
---@param ... any
---@return any
function DecalRoad:setScaleXYZ(...) end
---@param ... any
---@return any
function DecalRoad:setSelected(...) end
---@param ... any
---@return any
function DecalRoad:setSelectionEnabled(...) end
---@param ... any
---@return any
function DecalRoad:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function DecalRoad:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function DecalRoad:setTransform(...) end
---@param ... any
---@return any
function DecalRoad:setTransformF(...) end
---@param ... any
---@return any
function DecalRoad:showOnlyInRenderView(...) end
---@param ... any
---@return any
function DecalRoad:unhideInRenderView(...) end
---@param ... any
---@return any
function DecalRoad:unregisterObject(...) end

---@class EventManager : SimObject
---@field className any
local EventManager = {}
---@param ... any
---@return any
function EventManager:assignFieldsFromObject(...) end
---@param ... any
---@return any
function EventManager:clone(...) end
---@param ... any
---@return any
function EventManager:decRefCount(...) end
---@param ... any
---@return any
function EventManager:delete(...) end
---@param ... any
---@return any
function EventManager:deleteObject(...) end
---@param ... any
---@return any
function EventManager:deletePersistentId(...) end
---@param ... any
---@return any
function EventManager:dump(...) end
---@param ... any
---@return any
function EventManager:dumpEvents(...) end
---@param ... any
---@return any
function EventManager:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function EventManager:generatePersistentId(...) end
---@param ... any
---@return any
function EventManager:getClassDocString(...) end
---@param ... any
---@return any
function EventManager:getClassName(...) end
---@param ... any
---@return any
function EventManager:getDeclarationLine(...) end
---@param ... any
---@return any
function EventManager:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function EventManager:getDynamicFields(...) end
---@param ... any
---@return any
function EventManager:getField(...) end
---@param ... any
---@return any
function EventManager:getFieldInfo(...) end
---@param ... any
---@return any
function EventManager:getFieldList(...) end
---@param ... any
---@return any
function EventManager:getFields(...) end
---@param ... any
---@return any
function EventManager:getFieldsForEditor(...) end
---@param ... any
---@return any
function EventManager:getFileName(...) end
---@param ... any
---@return any
function EventManager:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function EventManager:getGroup(...) end
---@param ... any
---@return any
function EventManager:getID(...) end
---@param ... any
---@return any
function EventManager:getId(...) end
---@param ... any
---@return any
function EventManager:getIdString(...) end
---@param ... any
---@return any
function EventManager:getInternalName(...) end
---@param ... any
---@return any
function EventManager:getName(...) end
---@param ... any
---@return any
function EventManager:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function EventManager:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function EventManager:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function EventManager:incRefCount(...) end
---@param ... any
---@return any
function EventManager:inheritParentFields(...) end
---@param ... any
---@return any
function EventManager:inspectUpdate(...) end
---@param ... any
---@return any
function EventManager:isChildOfGroup(...) end
---@param ... any
---@return any
function EventManager:isEditorDirty(...) end
---@param ... any
---@return any
function EventManager:isHidden(...) end
---@param ... any
---@return any
function EventManager:isLocked(...) end
---@param ... any
---@return any
function EventManager:isNameChangeAllowed(...) end
---@param ... any
---@return any
function EventManager:isSelected(...) end
---@param ... any
---@return any
function EventManager:isSubClassOf(...) end
---@param ... any
---@return any
function EventManager:onEditorDisable(...) end
---@param ... any
---@return any
function EventManager:onEditorEnable(...) end
---@param ... any
---@return any
function EventManager:postApply(...) end
---@param ... any
---@return any
function EventManager:postEvent(...) end
---@param ... any
---@return any
function EventManager:preApply(...) end
---@param ... any
---@return any
function EventManager:registerEvent(...) end
---@param ... any
---@return any
function EventManager:registerObject(...) end
---@param ... any
---@return any
function EventManager:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function EventManager:remove(...) end
---@param ... any
---@return any
function EventManager:removeAll(...) end
---@param ... any
---@return any
function EventManager:save(...) end
---@param ... any
---@return any
function EventManager:serialize(...) end
---@param ... any
---@return any
function EventManager:serializeForEditor(...) end
---@param ... any
---@return any
function EventManager:serializeToDirectories(...) end
---@param ... any
---@return any
function EventManager:serializeToNameDictFile(...) end
---@param ... any
---@return any
function EventManager:setCanSave(...) end
---@param ... any
---@return any
function EventManager:setDeclarationLine(...) end
---@param ... any
---@return any
function EventManager:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function EventManager:setEditorDirty(...) end
---@param ... any
---@return any
function EventManager:setEditorOnly(...) end
---@param ... any
---@return any
function EventManager:setField(...) end
---@param ... any
---@return any
function EventManager:setFileName(...) end
---@param ... any
---@return any
function EventManager:setHidden(...) end
---@param ... any
---@return any
function EventManager:setInternalName(...) end
---@param ... any
---@return any
function EventManager:setIsSelected(...) end
---@param ... any
---@return any
function EventManager:setLocked(...) end
---@param ... any
---@return any
function EventManager:setName(...) end
---@param ... any
---@return any
function EventManager:setNameChangeAllowed(...) end
---@param ... any
---@return any
function EventManager:setSelected(...) end
---@param ... any
---@return any
function EventManager:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function EventManager:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function EventManager:subscribe(...) end
---@param ... any
---@return any
function EventManager:unregisterEvent(...) end
---@param ... any
---@return any
function EventManager:unregisterObject(...) end

---@class Forest : SceneObject
---@field className any
local Forest = {}
---@param ... any
---@return any
function Forest:assignFieldsFromObject(...) end
---@param ... any
---@return any
function Forest:canFloatAboveGround(...) end
---@param ... any
---@return any
function Forest:castRayRendered(...) end
---@param ... any
---@return any
function Forest:clone(...) end
---@param ... any
---@return any
function Forest:decRefCount(...) end
---@param ... any
---@return any
function Forest:delete(...) end
---@param ... any
---@return any
function Forest:deleteObject(...) end
---@param ... any
---@return any
function Forest:deletePersistentId(...) end
---@param ... any
---@return any
function Forest:disableCollision(...) end
---@param ... any
---@return any
function Forest:dump(...) end
---@param ... any
---@return any
function Forest:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function Forest:enableCollision(...) end
---@param ... any
---@return any
function Forest:generatePersistentId(...) end
---@param ... any
---@return any
function Forest:getAnchorNames(...) end
---@param ... any
---@return any
function Forest:getClassDocString(...) end
---@param ... any
---@return any
function Forest:getClassName(...) end
---@param ... any
---@return any
function Forest:getData(...) end
---@param ... any
---@return any
function Forest:getDeclarationLine(...) end
---@param ... any
---@return any
function Forest:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function Forest:getDynamicFields(...) end
---@param ... any
---@return any
function Forest:getEulerRotation(...) end
---@param ... any
---@return any
function Forest:getField(...) end
---@param ... any
---@return any
function Forest:getFieldInfo(...) end
---@param ... any
---@return any
function Forest:getFieldList(...) end
---@param ... any
---@return any
function Forest:getFields(...) end
---@param ... any
---@return any
function Forest:getFieldsForEditor(...) end
---@param ... any
---@return any
function Forest:getFileName(...) end
---@param ... any
---@return any
function Forest:getFirstMaterialName(...) end
---@param ... any
---@return any
function Forest:getForwardVector(...) end
---@param ... any
---@return any
function Forest:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function Forest:getGroup(...) end
---@param ... any
---@return any
function Forest:getID(...) end
---@param ... any
---@return any
function Forest:getId(...) end
---@param ... any
---@return any
function Forest:getIdString(...) end
---@param ... any
---@return any
function Forest:getInternalName(...) end
---@param ... any
---@return any
function Forest:getMaterialNames(...) end
---@param ... any
---@return any
function Forest:getMeshMaterialNames(...) end
---@param ... any
---@return any
function Forest:getName(...) end
---@param ... any
---@return any
function Forest:getObjBox(...) end
---@param ... any
---@return any
function Forest:getObjectBox(...) end
---@param ... any
---@return any
function Forest:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function Forest:getPosition(...) end
---@param ... any
---@return any
function Forest:getPositionXYZ(...) end
---@param ... any
---@return any
function Forest:getRotation(...) end
---@param ... any
---@return any
function Forest:getScale(...) end
---@param ... any
---@return any
function Forest:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function Forest:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function Forest:getTransform(...) end
---@param ... any
---@return any
function Forest:getTransformF(...) end
---@param ... any
---@return any
function Forest:getType(...) end
---@param ... any
---@return any
function Forest:getWorldBox(...) end
---@param ... any
---@return any
function Forest:getWorldBoxCenter(...) end
---@param ... any
---@return any
function Forest:getWorldTransform(...) end
---@param ... any
---@return any
function Forest:hideInRenderView(...) end
---@param ... any
---@return any
function Forest:incRefCount(...) end
---@param ... any
---@return any
function Forest:inheritParentFields(...) end
---@param ... any
---@return any
function Forest:inspectUpdate(...) end
---@param ... any
---@return any
function Forest:isChildOfGroup(...) end
---@param ... any
---@return any
function Forest:isEditorDirty(...) end
---@param ... any
---@return any
function Forest:isGlobalBounds(...) end
---@param ... any
---@return any
function Forest:isHidden(...) end
---@param ... any
---@return any
function Forest:isLocked(...) end
---@param ... any
---@return any
function Forest:isNameChangeAllowed(...) end
---@param ... any
---@return any
function Forest:isRenderEnabled(...) end
---@param ... any
---@return any
function Forest:isSelected(...) end
---@param ... any
---@return any
function Forest:isSelectionEnabled(...) end
---@param ... any
---@return any
function Forest:isSubClassOf(...) end
---@param ... any
---@return any
function Forest:onEditorDisable(...) end
---@param ... any
---@return any
function Forest:onEditorEnable(...) end
---@param ... any
---@return any
function Forest:postApply(...) end
---@param ... any
---@return any
function Forest:preApply(...) end
---@param ... any
---@return any
function Forest:registerObject(...) end
---@param ... any
---@return any
function Forest:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function Forest:renderViewMaskClear(...) end
---@param ... any
---@return any
function Forest:save(...) end
---@param ... any
---@return any
function Forest:saveForest(...) end
---@param ... any
---@return any
function Forest:serialize(...) end
---@param ... any
---@return any
function Forest:serializeForEditor(...) end
---@param ... any
---@return any
function Forest:serializeToDirectories(...) end
---@param ... any
---@return any
function Forest:serializeToNameDictFile(...) end
---@param ... any
---@return any
function Forest:setCanFloatAboveGround(...) end
---@param ... any
---@return any
function Forest:setCanSave(...) end
---@param ... any
---@return any
function Forest:setDeclarationLine(...) end
---@param ... any
---@return any
function Forest:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function Forest:setEditorDirty(...) end
---@param ... any
---@return any
function Forest:setEditorOnly(...) end
---@param ... any
---@return any
function Forest:setField(...) end
---@param ... any
---@return any
function Forest:setFileName(...) end
---@param ... any
---@return any
function Forest:setHidden(...) end
---@param ... any
---@return any
function Forest:setInternalName(...) end
---@param ... any
---@return any
function Forest:setIsSelected(...) end
---@param ... any
---@return any
function Forest:setLocked(...) end
---@param ... any
---@return any
function Forest:setName(...) end
---@param ... any
---@return any
function Forest:setNameChangeAllowed(...) end
---@param ... any
---@return any
function Forest:setPosRot(...) end
---@param ... any
---@return any
function Forest:setPosition(...) end
---@param ... any
---@return any
function Forest:setPositionXYZ(...) end
---@param ... any
---@return any
function Forest:setRenderEnabled(...) end
---@param ... any
---@return any
function Forest:setScale(...) end
---@param ... any
---@return any
function Forest:setScaleXYZ(...) end
---@param ... any
---@return any
function Forest:setSelected(...) end
---@param ... any
---@return any
function Forest:setSelectionEnabled(...) end
---@param ... any
---@return any
function Forest:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function Forest:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function Forest:setTransform(...) end
---@param ... any
---@return any
function Forest:setTransformF(...) end
---@param ... any
---@return any
function Forest:showOnlyInRenderView(...) end
---@param ... any
---@return any
function Forest:unhideInRenderView(...) end
---@param ... any
---@return any
function Forest:unregisterObject(...) end

---@class ForestItemData : SimDataBlock
---@field className any
local ForestItemData = {}
---@param ... any
---@return any
function ForestItemData:assignFieldsFromObject(...) end
---@param ... any
---@return any
function ForestItemData:clone(...) end
---@param ... any
---@return any
function ForestItemData:decRefCount(...) end
---@param ... any
---@return any
function ForestItemData:delete(...) end
---@param ... any
---@return any
function ForestItemData:deleteObject(...) end
---@param ... any
---@return any
function ForestItemData:deletePersistentId(...) end
---@param ... any
---@return any
function ForestItemData:dump(...) end
---@param ... any
---@return any
function ForestItemData:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function ForestItemData:generatePersistentId(...) end
---@param ... any
---@return any
function ForestItemData:getClassDocString(...) end
---@param ... any
---@return any
function ForestItemData:getClassName(...) end
---@param ... any
---@return any
function ForestItemData:getDeclarationLine(...) end
---@param ... any
---@return any
function ForestItemData:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function ForestItemData:getDynamicFields(...) end
---@param ... any
---@return any
function ForestItemData:getField(...) end
---@param ... any
---@return any
function ForestItemData:getFieldInfo(...) end
---@param ... any
---@return any
function ForestItemData:getFieldList(...) end
---@param ... any
---@return any
function ForestItemData:getFields(...) end
---@param ... any
---@return any
function ForestItemData:getFieldsForEditor(...) end
---@param ... any
---@return any
function ForestItemData:getFileName(...) end
---@param ... any
---@return any
function ForestItemData:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function ForestItemData:getGroup(...) end
---@param ... any
---@return any
function ForestItemData:getID(...) end
---@param ... any
---@return any
function ForestItemData:getId(...) end
---@param ... any
---@return any
function ForestItemData:getIdString(...) end
---@param ... any
---@return any
function ForestItemData:getInternalName(...) end
---@param ... any
---@return any
function ForestItemData:getName(...) end
---@param ... any
---@return any
function ForestItemData:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function ForestItemData:getShapeFile(...) end
---@param ... any
---@return any
function ForestItemData:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function ForestItemData:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function ForestItemData:incRefCount(...) end
---@param ... any
---@return any
function ForestItemData:inheritParentFields(...) end
---@param ... any
---@return any
function ForestItemData:inspectUpdate(...) end
---@param ... any
---@return any
function ForestItemData:isChildOfGroup(...) end
---@param ... any
---@return any
function ForestItemData:isEditorDirty(...) end
---@param ... any
---@return any
function ForestItemData:isHidden(...) end
---@param ... any
---@return any
function ForestItemData:isLocked(...) end
---@param ... any
---@return any
function ForestItemData:isNameChangeAllowed(...) end
---@param ... any
---@return any
function ForestItemData:isSelected(...) end
---@param ... any
---@return any
function ForestItemData:isSubClassOf(...) end
---@param ... any
---@return any
function ForestItemData:onEditorDisable(...) end
---@param ... any
---@return any
function ForestItemData:onEditorEnable(...) end
---@param ... any
---@return any
function ForestItemData:postApply(...) end
---@param ... any
---@return any
function ForestItemData:preApply(...) end
---@param ... any
---@return any
function ForestItemData:registerObject(...) end
---@param ... any
---@return any
function ForestItemData:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function ForestItemData:save(...) end
---@param ... any
---@return any
function ForestItemData:serialize(...) end
---@param ... any
---@return any
function ForestItemData:serializeForEditor(...) end
---@param ... any
---@return any
function ForestItemData:serializeToDirectories(...) end
---@param ... any
---@return any
function ForestItemData:serializeToNameDictFile(...) end
---@param ... any
---@return any
function ForestItemData:setCanSave(...) end
---@param ... any
---@return any
function ForestItemData:setDeclarationLine(...) end
---@param ... any
---@return any
function ForestItemData:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function ForestItemData:setEditorDirty(...) end
---@param ... any
---@return any
function ForestItemData:setEditorOnly(...) end
---@param ... any
---@return any
function ForestItemData:setField(...) end
---@param ... any
---@return any
function ForestItemData:setFileName(...) end
---@param ... any
---@return any
function ForestItemData:setHidden(...) end
---@param ... any
---@return any
function ForestItemData:setInternalName(...) end
---@param ... any
---@return any
function ForestItemData:setIsSelected(...) end
---@param ... any
---@return any
function ForestItemData:setLocked(...) end
---@param ... any
---@return any
function ForestItemData:setName(...) end
---@param ... any
---@return any
function ForestItemData:setNameChangeAllowed(...) end
---@param ... any
---@return any
function ForestItemData:setSelected(...) end
---@param ... any
---@return any
function ForestItemData:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function ForestItemData:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function ForestItemData:unregisterObject(...) end

---@class GFXSamplerStateData : SimObject
---@field className any
local GFXSamplerStateData = {}
---@param ... any
---@return any
function GFXSamplerStateData:assignFieldsFromObject(...) end
---@param ... any
---@return any
function GFXSamplerStateData:clone(...) end
---@param ... any
---@return any
function GFXSamplerStateData:decRefCount(...) end
---@param ... any
---@return any
function GFXSamplerStateData:delete(...) end
---@param ... any
---@return any
function GFXSamplerStateData:deleteObject(...) end
---@param ... any
---@return any
function GFXSamplerStateData:deletePersistentId(...) end
---@param ... any
---@return any
function GFXSamplerStateData:dump(...) end
---@param ... any
---@return any
function GFXSamplerStateData:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function GFXSamplerStateData:generatePersistentId(...) end
---@param ... any
---@return any
function GFXSamplerStateData:getClassDocString(...) end
---@param ... any
---@return any
function GFXSamplerStateData:getClassName(...) end
---@param ... any
---@return any
function GFXSamplerStateData:getDeclarationLine(...) end
---@param ... any
---@return any
function GFXSamplerStateData:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function GFXSamplerStateData:getDynamicFields(...) end
---@param ... any
---@return any
function GFXSamplerStateData:getField(...) end
---@param ... any
---@return any
function GFXSamplerStateData:getFieldInfo(...) end
---@param ... any
---@return any
function GFXSamplerStateData:getFieldList(...) end
---@param ... any
---@return any
function GFXSamplerStateData:getFields(...) end
---@param ... any
---@return any
function GFXSamplerStateData:getFieldsForEditor(...) end
---@param ... any
---@return any
function GFXSamplerStateData:getFileName(...) end
---@param ... any
---@return any
function GFXSamplerStateData:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function GFXSamplerStateData:getGroup(...) end
---@param ... any
---@return any
function GFXSamplerStateData:getID(...) end
---@param ... any
---@return any
function GFXSamplerStateData:getId(...) end
---@param ... any
---@return any
function GFXSamplerStateData:getIdString(...) end
---@param ... any
---@return any
function GFXSamplerStateData:getInternalName(...) end
---@param ... any
---@return any
function GFXSamplerStateData:getName(...) end
---@param ... any
---@return any
function GFXSamplerStateData:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function GFXSamplerStateData:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function GFXSamplerStateData:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function GFXSamplerStateData:incRefCount(...) end
---@param ... any
---@return any
function GFXSamplerStateData:inheritParentFields(...) end
---@param ... any
---@return any
function GFXSamplerStateData:inspectUpdate(...) end
---@param ... any
---@return any
function GFXSamplerStateData:isChildOfGroup(...) end
---@param ... any
---@return any
function GFXSamplerStateData:isEditorDirty(...) end
---@param ... any
---@return any
function GFXSamplerStateData:isHidden(...) end
---@param ... any
---@return any
function GFXSamplerStateData:isLocked(...) end
---@param ... any
---@return any
function GFXSamplerStateData:isNameChangeAllowed(...) end
---@param ... any
---@return any
function GFXSamplerStateData:isSelected(...) end
---@param ... any
---@return any
function GFXSamplerStateData:isSubClassOf(...) end
---@param ... any
---@return any
function GFXSamplerStateData:onEditorDisable(...) end
---@param ... any
---@return any
function GFXSamplerStateData:onEditorEnable(...) end
---@param ... any
---@return any
function GFXSamplerStateData:postApply(...) end
---@param ... any
---@return any
function GFXSamplerStateData:preApply(...) end
---@param ... any
---@return any
function GFXSamplerStateData:registerObject(...) end
---@param ... any
---@return any
function GFXSamplerStateData:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function GFXSamplerStateData:save(...) end
---@param ... any
---@return any
function GFXSamplerStateData:serialize(...) end
---@param ... any
---@return any
function GFXSamplerStateData:serializeForEditor(...) end
---@param ... any
---@return any
function GFXSamplerStateData:serializeToDirectories(...) end
---@param ... any
---@return any
function GFXSamplerStateData:serializeToNameDictFile(...) end
---@param ... any
---@return any
function GFXSamplerStateData:setCanSave(...) end
---@param ... any
---@return any
function GFXSamplerStateData:setDeclarationLine(...) end
---@param ... any
---@return any
function GFXSamplerStateData:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function GFXSamplerStateData:setEditorDirty(...) end
---@param ... any
---@return any
function GFXSamplerStateData:setEditorOnly(...) end
---@param ... any
---@return any
function GFXSamplerStateData:setField(...) end
---@param ... any
---@return any
function GFXSamplerStateData:setFileName(...) end
---@param ... any
---@return any
function GFXSamplerStateData:setHidden(...) end
---@param ... any
---@return any
function GFXSamplerStateData:setInternalName(...) end
---@param ... any
---@return any
function GFXSamplerStateData:setIsSelected(...) end
---@param ... any
---@return any
function GFXSamplerStateData:setLocked(...) end
---@param ... any
---@return any
function GFXSamplerStateData:setName(...) end
---@param ... any
---@return any
function GFXSamplerStateData:setNameChangeAllowed(...) end
---@param ... any
---@return any
function GFXSamplerStateData:setSelected(...) end
---@param ... any
---@return any
function GFXSamplerStateData:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function GFXSamplerStateData:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function GFXSamplerStateData:unregisterObject(...) end

---@class GFXStateBlockData : SimObject
---@field className any
local GFXStateBlockData = {}
---@param ... any
---@return any
function GFXStateBlockData:assignFieldsFromObject(...) end
---@param ... any
---@return any
function GFXStateBlockData:clone(...) end
---@param ... any
---@return any
function GFXStateBlockData:decRefCount(...) end
---@param ... any
---@return any
function GFXStateBlockData:delete(...) end
---@param ... any
---@return any
function GFXStateBlockData:deleteObject(...) end
---@param ... any
---@return any
function GFXStateBlockData:deletePersistentId(...) end
---@param ... any
---@return any
function GFXStateBlockData:dump(...) end
---@param ... any
---@return any
function GFXStateBlockData:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function GFXStateBlockData:generatePersistentId(...) end
---@param ... any
---@return any
function GFXStateBlockData:getClassDocString(...) end
---@param ... any
---@return any
function GFXStateBlockData:getClassName(...) end
---@param ... any
---@return any
function GFXStateBlockData:getDeclarationLine(...) end
---@param ... any
---@return any
function GFXStateBlockData:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function GFXStateBlockData:getDynamicFields(...) end
---@param ... any
---@return any
function GFXStateBlockData:getField(...) end
---@param ... any
---@return any
function GFXStateBlockData:getFieldInfo(...) end
---@param ... any
---@return any
function GFXStateBlockData:getFieldList(...) end
---@param ... any
---@return any
function GFXStateBlockData:getFields(...) end
---@param ... any
---@return any
function GFXStateBlockData:getFieldsForEditor(...) end
---@param ... any
---@return any
function GFXStateBlockData:getFileName(...) end
---@param ... any
---@return any
function GFXStateBlockData:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function GFXStateBlockData:getGroup(...) end
---@param ... any
---@return any
function GFXStateBlockData:getID(...) end
---@param ... any
---@return any
function GFXStateBlockData:getId(...) end
---@param ... any
---@return any
function GFXStateBlockData:getIdString(...) end
---@param ... any
---@return any
function GFXStateBlockData:getInternalName(...) end
---@param ... any
---@return any
function GFXStateBlockData:getName(...) end
---@param ... any
---@return any
function GFXStateBlockData:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function GFXStateBlockData:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function GFXStateBlockData:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function GFXStateBlockData:incRefCount(...) end
---@param ... any
---@return any
function GFXStateBlockData:inheritParentFields(...) end
---@param ... any
---@return any
function GFXStateBlockData:inspectUpdate(...) end
---@param ... any
---@return any
function GFXStateBlockData:isChildOfGroup(...) end
---@param ... any
---@return any
function GFXStateBlockData:isEditorDirty(...) end
---@param ... any
---@return any
function GFXStateBlockData:isHidden(...) end
---@param ... any
---@return any
function GFXStateBlockData:isLocked(...) end
---@param ... any
---@return any
function GFXStateBlockData:isNameChangeAllowed(...) end
---@param ... any
---@return any
function GFXStateBlockData:isSelected(...) end
---@param ... any
---@return any
function GFXStateBlockData:isSubClassOf(...) end
---@param ... any
---@return any
function GFXStateBlockData:onEditorDisable(...) end
---@param ... any
---@return any
function GFXStateBlockData:onEditorEnable(...) end
---@param ... any
---@return any
function GFXStateBlockData:postApply(...) end
---@param ... any
---@return any
function GFXStateBlockData:preApply(...) end
---@param ... any
---@return any
function GFXStateBlockData:registerObject(...) end
---@param ... any
---@return any
function GFXStateBlockData:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function GFXStateBlockData:save(...) end
---@param ... any
---@return any
function GFXStateBlockData:serialize(...) end
---@param ... any
---@return any
function GFXStateBlockData:serializeForEditor(...) end
---@param ... any
---@return any
function GFXStateBlockData:serializeToDirectories(...) end
---@param ... any
---@return any
function GFXStateBlockData:serializeToNameDictFile(...) end
---@param ... any
---@return any
function GFXStateBlockData:setCanSave(...) end
---@param ... any
---@return any
function GFXStateBlockData:setDeclarationLine(...) end
---@param ... any
---@return any
function GFXStateBlockData:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function GFXStateBlockData:setEditorDirty(...) end
---@param ... any
---@return any
function GFXStateBlockData:setEditorOnly(...) end
---@param ... any
---@return any
function GFXStateBlockData:setField(...) end
---@param ... any
---@return any
function GFXStateBlockData:setFileName(...) end
---@param ... any
---@return any
function GFXStateBlockData:setHidden(...) end
---@param ... any
---@return any
function GFXStateBlockData:setInternalName(...) end
---@param ... any
---@return any
function GFXStateBlockData:setIsSelected(...) end
---@param ... any
---@return any
function GFXStateBlockData:setLocked(...) end
---@param ... any
---@return any
function GFXStateBlockData:setName(...) end
---@param ... any
---@return any
function GFXStateBlockData:setNameChangeAllowed(...) end
---@param ... any
---@return any
function GFXStateBlockData:setSelected(...) end
---@param ... any
---@return any
function GFXStateBlockData:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function GFXStateBlockData:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function GFXStateBlockData:unregisterObject(...) end

---@class GameBase : SceneObject
---@field className any
local GameBase = {}
---@param ... any
---@return any
function GameBase:assignFieldsFromObject(...) end
---@param ... any
---@return any
function GameBase:canFloatAboveGround(...) end
---@param ... any
---@return any
function GameBase:clone(...) end
---@param ... any
---@return any
function GameBase:decRefCount(...) end
---@param ... any
---@return any
function GameBase:delete(...) end
---@param ... any
---@return any
function GameBase:deleteObject(...) end
---@param ... any
---@return any
function GameBase:deletePersistentId(...) end
---@param ... any
---@return any
function GameBase:disableCollision(...) end
---@param ... any
---@return any
function GameBase:dump(...) end
---@param ... any
---@return any
function GameBase:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function GameBase:enableCollision(...) end
---@param ... any
---@return any
function GameBase:generatePersistentId(...) end
---@param ... any
---@return any
function GameBase:getAnchorNames(...) end
---@param ... any
---@return any
function GameBase:getClassDocString(...) end
---@param ... any
---@return any
function GameBase:getClassName(...) end
---@param ... any
---@return any
function GameBase:getDataBlock(...) end
---@param ... any
---@return any
function GameBase:getDeclarationLine(...) end
---@param ... any
---@return any
function GameBase:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function GameBase:getDynamicFields(...) end
---@param ... any
---@return any
function GameBase:getEulerRotation(...) end
---@param ... any
---@return any
function GameBase:getField(...) end
---@param ... any
---@return any
function GameBase:getFieldInfo(...) end
---@param ... any
---@return any
function GameBase:getFieldList(...) end
---@param ... any
---@return any
function GameBase:getFields(...) end
---@param ... any
---@return any
function GameBase:getFieldsForEditor(...) end
---@param ... any
---@return any
function GameBase:getFileName(...) end
---@param ... any
---@return any
function GameBase:getFirstMaterialName(...) end
---@param ... any
---@return any
function GameBase:getForwardVector(...) end
---@param ... any
---@return any
function GameBase:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function GameBase:getGroup(...) end
---@param ... any
---@return any
function GameBase:getID(...) end
---@param ... any
---@return any
function GameBase:getId(...) end
---@param ... any
---@return any
function GameBase:getIdString(...) end
---@param ... any
---@return any
function GameBase:getInternalName(...) end
---@param ... any
---@return any
function GameBase:getMaterialNames(...) end
---@param ... any
---@return any
function GameBase:getMeshMaterialNames(...) end
---@param ... any
---@return any
function GameBase:getName(...) end
---@param ... any
---@return any
function GameBase:getObjBox(...) end
---@param ... any
---@return any
function GameBase:getObjectBox(...) end
---@param ... any
---@return any
function GameBase:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function GameBase:getPosition(...) end
---@param ... any
---@return any
function GameBase:getPositionXYZ(...) end
---@param ... any
---@return any
function GameBase:getRotation(...) end
---@param ... any
---@return any
function GameBase:getScale(...) end
---@param ... any
---@return any
function GameBase:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function GameBase:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function GameBase:getTransform(...) end
---@param ... any
---@return any
function GameBase:getTransformF(...) end
---@param ... any
---@return any
function GameBase:getType(...) end
---@param ... any
---@return any
function GameBase:getWorldBox(...) end
---@param ... any
---@return any
function GameBase:getWorldBoxCenter(...) end
---@param ... any
---@return any
function GameBase:getWorldTransform(...) end
---@param ... any
---@return any
function GameBase:hideInRenderView(...) end
---@param ... any
---@return any
function GameBase:incRefCount(...) end
---@param ... any
---@return any
function GameBase:inheritParentFields(...) end
---@param ... any
---@return any
function GameBase:inspectUpdate(...) end
---@param ... any
---@return any
function GameBase:isChildOfGroup(...) end
---@param ... any
---@return any
function GameBase:isEditorDirty(...) end
---@param ... any
---@return any
function GameBase:isGlobalBounds(...) end
---@param ... any
---@return any
function GameBase:isHidden(...) end
---@param ... any
---@return any
function GameBase:isLocked(...) end
---@param ... any
---@return any
function GameBase:isNameChangeAllowed(...) end
---@param ... any
---@return any
function GameBase:isRenderEnabled(...) end
---@param ... any
---@return any
function GameBase:isSelected(...) end
---@param ... any
---@return any
function GameBase:isSelectionEnabled(...) end
---@param ... any
---@return any
function GameBase:isSubClassOf(...) end
---@param ... any
---@return any
function GameBase:onEditorDisable(...) end
---@param ... any
---@return any
function GameBase:onEditorEnable(...) end
---@param ... any
---@return any
function GameBase:postApply(...) end
---@param ... any
---@return any
function GameBase:preApply(...) end
---@param ... any
---@return any
function GameBase:registerObject(...) end
---@param ... any
---@return any
function GameBase:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function GameBase:renderViewMaskClear(...) end
---@param ... any
---@return any
function GameBase:save(...) end
---@param ... any
---@return any
function GameBase:serialize(...) end
---@param ... any
---@return any
function GameBase:serializeForEditor(...) end
---@param ... any
---@return any
function GameBase:serializeToDirectories(...) end
---@param ... any
---@return any
function GameBase:serializeToNameDictFile(...) end
---@param ... any
---@return any
function GameBase:setCanFloatAboveGround(...) end
---@param ... any
---@return any
function GameBase:setCanSave(...) end
---@param ... any
---@return any
function GameBase:setDataBlock(...) end
---@param ... any
---@return any
function GameBase:setDeclarationLine(...) end
---@param ... any
---@return any
function GameBase:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function GameBase:setEditorDirty(...) end
---@param ... any
---@return any
function GameBase:setEditorOnly(...) end
---@param ... any
---@return any
function GameBase:setField(...) end
---@param ... any
---@return any
function GameBase:setFileName(...) end
---@param ... any
---@return any
function GameBase:setHidden(...) end
---@param ... any
---@return any
function GameBase:setInternalName(...) end
---@param ... any
---@return any
function GameBase:setIsSelected(...) end
---@param ... any
---@return any
function GameBase:setLocked(...) end
---@param ... any
---@return any
function GameBase:setName(...) end
---@param ... any
---@return any
function GameBase:setNameChangeAllowed(...) end
---@param ... any
---@return any
function GameBase:setPosRot(...) end
---@param ... any
---@return any
function GameBase:setPosition(...) end
---@param ... any
---@return any
function GameBase:setPositionXYZ(...) end
---@param ... any
---@return any
function GameBase:setRenderEnabled(...) end
---@param ... any
---@return any
function GameBase:setScale(...) end
---@param ... any
---@return any
function GameBase:setScaleXYZ(...) end
---@param ... any
---@return any
function GameBase:setSelected(...) end
---@param ... any
---@return any
function GameBase:setSelectionEnabled(...) end
---@param ... any
---@return any
function GameBase:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function GameBase:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function GameBase:setTransform(...) end
---@param ... any
---@return any
function GameBase:setTransformF(...) end
---@param ... any
---@return any
function GameBase:showOnlyInRenderView(...) end
---@param ... any
---@return any
function GameBase:unhideInRenderView(...) end
---@param ... any
---@return any
function GameBase:unregisterObject(...) end

---@class GameBaseData : SimDataBlock
---@field className any
local GameBaseData = {}
---@param ... any
---@return any
function GameBaseData:assignFieldsFromObject(...) end
---@param ... any
---@return any
function GameBaseData:clone(...) end
---@param ... any
---@return any
function GameBaseData:decRefCount(...) end
---@param ... any
---@return any
function GameBaseData:delete(...) end
---@param ... any
---@return any
function GameBaseData:deleteObject(...) end
---@param ... any
---@return any
function GameBaseData:deletePersistentId(...) end
---@param ... any
---@return any
function GameBaseData:dump(...) end
---@param ... any
---@return any
function GameBaseData:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function GameBaseData:generatePersistentId(...) end
---@param ... any
---@return any
function GameBaseData:getClassDocString(...) end
---@param ... any
---@return any
function GameBaseData:getClassName(...) end
---@param ... any
---@return any
function GameBaseData:getDeclarationLine(...) end
---@param ... any
---@return any
function GameBaseData:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function GameBaseData:getDynamicFields(...) end
---@param ... any
---@return any
function GameBaseData:getField(...) end
---@param ... any
---@return any
function GameBaseData:getFieldInfo(...) end
---@param ... any
---@return any
function GameBaseData:getFieldList(...) end
---@param ... any
---@return any
function GameBaseData:getFields(...) end
---@param ... any
---@return any
function GameBaseData:getFieldsForEditor(...) end
---@param ... any
---@return any
function GameBaseData:getFileName(...) end
---@param ... any
---@return any
function GameBaseData:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function GameBaseData:getGroup(...) end
---@param ... any
---@return any
function GameBaseData:getID(...) end
---@param ... any
---@return any
function GameBaseData:getId(...) end
---@param ... any
---@return any
function GameBaseData:getIdString(...) end
---@param ... any
---@return any
function GameBaseData:getInternalName(...) end
---@param ... any
---@return any
function GameBaseData:getName(...) end
---@param ... any
---@return any
function GameBaseData:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function GameBaseData:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function GameBaseData:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function GameBaseData:incRefCount(...) end
---@param ... any
---@return any
function GameBaseData:inheritParentFields(...) end
---@param ... any
---@return any
function GameBaseData:inspectUpdate(...) end
---@param ... any
---@return any
function GameBaseData:isChildOfGroup(...) end
---@param ... any
---@return any
function GameBaseData:isEditorDirty(...) end
---@param ... any
---@return any
function GameBaseData:isHidden(...) end
---@param ... any
---@return any
function GameBaseData:isLocked(...) end
---@param ... any
---@return any
function GameBaseData:isNameChangeAllowed(...) end
---@param ... any
---@return any
function GameBaseData:isSelected(...) end
---@param ... any
---@return any
function GameBaseData:isSubClassOf(...) end
---@param ... any
---@return any
function GameBaseData:onEditorDisable(...) end
---@param ... any
---@return any
function GameBaseData:onEditorEnable(...) end
---@param ... any
---@return any
function GameBaseData:postApply(...) end
---@param ... any
---@return any
function GameBaseData:preApply(...) end
---@param ... any
---@return any
function GameBaseData:registerObject(...) end
---@param ... any
---@return any
function GameBaseData:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function GameBaseData:save(...) end
---@param ... any
---@return any
function GameBaseData:serialize(...) end
---@param ... any
---@return any
function GameBaseData:serializeForEditor(...) end
---@param ... any
---@return any
function GameBaseData:serializeToDirectories(...) end
---@param ... any
---@return any
function GameBaseData:serializeToNameDictFile(...) end
---@param ... any
---@return any
function GameBaseData:setCanSave(...) end
---@param ... any
---@return any
function GameBaseData:setDeclarationLine(...) end
---@param ... any
---@return any
function GameBaseData:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function GameBaseData:setEditorDirty(...) end
---@param ... any
---@return any
function GameBaseData:setEditorOnly(...) end
---@param ... any
---@return any
function GameBaseData:setField(...) end
---@param ... any
---@return any
function GameBaseData:setFileName(...) end
---@param ... any
---@return any
function GameBaseData:setHidden(...) end
---@param ... any
---@return any
function GameBaseData:setInternalName(...) end
---@param ... any
---@return any
function GameBaseData:setIsSelected(...) end
---@param ... any
---@return any
function GameBaseData:setLocked(...) end
---@param ... any
---@return any
function GameBaseData:setName(...) end
---@param ... any
---@return any
function GameBaseData:setNameChangeAllowed(...) end
---@param ... any
---@return any
function GameBaseData:setSelected(...) end
---@param ... any
---@return any
function GameBaseData:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function GameBaseData:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function GameBaseData:unregisterObject(...) end

---@class GameViewportCtrl : GuiViewportCtrl
---@field className any
local GameViewportCtrl = {}
---@param ... any
---@return any
function GameViewportCtrl:add(...) end
---@param ... any
---@return any
function GameViewportCtrl:addGuiControl(...) end
---@param ... any
---@return any
function GameViewportCtrl:addObject(...) end
---@param ... any
---@return any
function GameViewportCtrl:addWithName(...) end
---@param ... any
---@return any
function GameViewportCtrl:assignFieldsFromObject(...) end
---@param ... any
---@return any
function GameViewportCtrl:at(...) end
---@param ... any
---@return any
function GameViewportCtrl:awaken(...) end
---@param ... any
---@return any
function GameViewportCtrl:bringObjectToFront(...) end
---@param ... any
---@return any
function GameViewportCtrl:bringToFront(...) end
---@param ... any
---@return any
function GameViewportCtrl:clear(...) end
---@param ... any
---@return any
function GameViewportCtrl:clearFirstResponder(...) end
---@param ... any
---@return any
function GameViewportCtrl:clone(...) end
---@param ... any
---@return any
function GameViewportCtrl:controlIsChild(...) end
---@param ... any
---@return any
function GameViewportCtrl:decRefCount(...) end
---@param ... any
---@return any
function GameViewportCtrl:delete(...) end
---@param ... any
---@return any
function GameViewportCtrl:deleteAllObjects(...) end
---@param ... any
---@return any
function GameViewportCtrl:deleteObject(...) end
---@param ... any
---@return any
function GameViewportCtrl:deletePersistentId(...) end
---@param ... any
---@return any
function GameViewportCtrl:dump(...) end
---@param ... any
---@return any
function GameViewportCtrl:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function GameViewportCtrl:findObject(...) end
---@param ... any
---@return any
function GameViewportCtrl:findObjectById(...) end
---@param ... any
---@return any
function GameViewportCtrl:findObjectByInternalName(...) end
---@param ... any
---@return any
function GameViewportCtrl:findObjectIdAfter(...) end
---@param ... any
---@return any
function GameViewportCtrl:generatePersistentId(...) end
---@param ... any
---@return any
function GameViewportCtrl:getBounds(...) end
---@param ... any
---@return any
function GameViewportCtrl:getCenter(...) end
---@param ... any
---@return any
function GameViewportCtrl:getClassDocString(...) end
---@param ... any
---@return any
function GameViewportCtrl:getClassName(...) end
---@param ... any
---@return any
function GameViewportCtrl:getCount(...) end
---@param ... any
---@return any
function GameViewportCtrl:getDeclarationLine(...) end
---@param ... any
---@return any
function GameViewportCtrl:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function GameViewportCtrl:getDynamicFields(...) end
---@param ... any
---@return any
function GameViewportCtrl:getExtent(...) end
---@param ... any
---@return any
function GameViewportCtrl:getField(...) end
---@param ... any
---@return any
function GameViewportCtrl:getFieldInfo(...) end
---@param ... any
---@return any
function GameViewportCtrl:getFieldList(...) end
---@param ... any
---@return any
function GameViewportCtrl:getFields(...) end
---@param ... any
---@return any
function GameViewportCtrl:getFieldsForEditor(...) end
---@param ... any
---@return any
function GameViewportCtrl:getFileName(...) end
---@param ... any
---@return any
function GameViewportCtrl:getFirstResponder(...) end
---@param ... any
---@return any
function GameViewportCtrl:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function GameViewportCtrl:getGlobalBounds(...) end
---@param ... any
---@return any
function GameViewportCtrl:getGlobalPosition(...) end
---@param ... any
---@return any
function GameViewportCtrl:getGroup(...) end
---@param ... any
---@return any
function GameViewportCtrl:getID(...) end
---@param ... any
---@return any
function GameViewportCtrl:getId(...) end
---@param ... any
---@return any
function GameViewportCtrl:getIdString(...) end
---@param ... any
---@return any
function GameViewportCtrl:getInternalName(...) end
---@param ... any
---@return any
function GameViewportCtrl:getName(...) end
---@param ... any
---@return any
function GameViewportCtrl:getObject(...) end
---@param ... any
---@return any
function GameViewportCtrl:getObjectIndex(...) end
---@param ... any
---@return any
function GameViewportCtrl:getObjects(...) end
---@param ... any
---@return any
function GameViewportCtrl:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function GameViewportCtrl:getParent(...) end
---@param ... any
---@return any
function GameViewportCtrl:getPosition(...) end
---@param ... any
---@return any
function GameViewportCtrl:getRandom(...) end
---@param ... any
---@return any
function GameViewportCtrl:getRoot(...) end
---@param ... any
---@return any
function GameViewportCtrl:getScenetreeData(...) end
---@param ... any
---@return any
function GameViewportCtrl:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function GameViewportCtrl:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function GameViewportCtrl:idAt(...) end
---@param ... any
---@return any
function GameViewportCtrl:incRefCount(...) end
---@param ... any
---@return any
function GameViewportCtrl:inheritParentFields(...) end
---@param ... any
---@return any
function GameViewportCtrl:inspectUpdate(...) end
---@param ... any
---@return any
function GameViewportCtrl:isActive(...) end
---@param ... any
---@return any
function GameViewportCtrl:isAwake(...) end
---@param ... any
---@return any
function GameViewportCtrl:isChildOfGroup(...) end
---@param ... any
---@return any
function GameViewportCtrl:isEditorDirty(...) end
---@param ... any
---@return any
function GameViewportCtrl:isFirstResponder(...) end
---@param ... any
---@return any
function GameViewportCtrl:isHidden(...) end
---@param ... any
---@return any
function GameViewportCtrl:isLocked(...) end
---@param ... any
---@return any
function GameViewportCtrl:isMember(...) end
---@param ... any
---@return any
function GameViewportCtrl:isNameChangeAllowed(...) end
---@param ... any
---@return any
function GameViewportCtrl:isSelected(...) end
---@param ... any
---@return any
function GameViewportCtrl:isSubClassOf(...) end
---@param ... any
---@return any
function GameViewportCtrl:isVisible(...) end
---@param ... any
---@return any
function GameViewportCtrl:listObjects(...) end
---@param ... any
---@return any
function GameViewportCtrl:onEditorDisable(...) end
---@param ... any
---@return any
function GameViewportCtrl:onEditorEnable(...) end
---@param ... any
---@return any
function GameViewportCtrl:postApply(...) end
---@param ... any
---@return any
function GameViewportCtrl:preApply(...) end
---@param ... any
---@return any
function GameViewportCtrl:preRender(...) end
---@param ... any
---@return any
function GameViewportCtrl:project(...) end
---@param ... any
---@return any
function GameViewportCtrl:pushObjectToBack(...) end
---@param ... any
---@return any
function GameViewportCtrl:pushToBack(...) end
---@param ... any
---@return any
function GameViewportCtrl:registerObject(...) end
---@param ... any
---@return any
function GameViewportCtrl:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function GameViewportCtrl:remove(...) end
---@param ... any
---@return any
function GameViewportCtrl:removeObject(...) end
---@param ... any
---@return any
function GameViewportCtrl:reorderChild(...) end
---@param ... any
---@return any
function GameViewportCtrl:resize(...) end
---@param ... any
---@return any
function GameViewportCtrl:save(...) end
---@param ... any
---@return any
function GameViewportCtrl:serialize(...) end
---@param ... any
---@return any
function GameViewportCtrl:serializeForEditor(...) end
---@param ... any
---@return any
function GameViewportCtrl:serializeToDirectories(...) end
---@param ... any
---@return any
function GameViewportCtrl:serializeToNameDictFile(...) end
---@param ... any
---@return any
function GameViewportCtrl:setActive(...) end
---@param ... any
---@return any
function GameViewportCtrl:setCanHit(...) end
---@param ... any
---@return any
function GameViewportCtrl:setCanSave(...) end
---@param ... any
---@return any
function GameViewportCtrl:setCenter(...) end
---@param ... any
---@return any
function GameViewportCtrl:setControlProfile(...) end
---@param ... any
---@return any
function GameViewportCtrl:setDeclarationLine(...) end
---@param ... any
---@return any
function GameViewportCtrl:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function GameViewportCtrl:setEditorDirty(...) end
---@param ... any
---@return any
function GameViewportCtrl:setEditorOnly(...) end
---@param ... any
---@return any
function GameViewportCtrl:setEnabledControl(...) end
---@param ... any
---@return any
function GameViewportCtrl:setField(...) end
---@param ... any
---@return any
function GameViewportCtrl:setFileName(...) end
---@param ... any
---@return any
function GameViewportCtrl:setFirstResponder(...) end
---@param ... any
---@return any
function GameViewportCtrl:setFrustumCameraCenterOffset(...) end
---@param ... any
---@return any
function GameViewportCtrl:setHidden(...) end
---@param ... any
---@return any
function GameViewportCtrl:setInternalName(...) end
---@param ... any
---@return any
function GameViewportCtrl:setIsSelected(...) end
---@param ... any
---@return any
function GameViewportCtrl:setLocked(...) end
---@param ... any
---@return any
function GameViewportCtrl:setName(...) end
---@param ... any
---@return any
function GameViewportCtrl:setNameChangeAllowed(...) end
---@param ... any
---@return any
function GameViewportCtrl:setOrthoMainView(...) end
---@param ... any
---@return any
function GameViewportCtrl:setPosition(...) end
---@param ... any
---@return any
function GameViewportCtrl:setPositionGlobal(...) end
---@param ... any
---@return any
function GameViewportCtrl:setProfile(...) end
---@param ... any
---@return any
function GameViewportCtrl:setSelected(...) end
---@param ... any
---@return any
function GameViewportCtrl:setSizing(...) end
---@param ... any
---@return any
function GameViewportCtrl:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function GameViewportCtrl:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function GameViewportCtrl:setTooltipProfile(...) end
---@param ... any
---@return any
function GameViewportCtrl:setUpdate(...) end
---@param ... any
---@return any
function GameViewportCtrl:setValue(...) end
---@param ... any
---@return any
function GameViewportCtrl:setVisible(...) end
---@param ... any
---@return any
function GameViewportCtrl:size(...) end
---@param ... any
---@return any
function GameViewportCtrl:sleep(...) end
---@param ... any
---@return any
function GameViewportCtrl:sortByName(...) end
---@param ... any
---@return any
function GameViewportCtrl:unproject(...) end
---@param ... any
---@return any
function GameViewportCtrl:unproject2(...) end
---@param ... any
---@return any
function GameViewportCtrl:unregisterObject(...) end

---@class GroundCover : SceneObject
---@field className any
local GroundCover = {}
---@param ... any
---@return any
function GroundCover:assignFieldsFromObject(...) end
---@param ... any
---@return any
function GroundCover:canFloatAboveGround(...) end
---@param ... any
---@return any
function GroundCover:clone(...) end
---@param ... any
---@return any
function GroundCover:decRefCount(...) end
---@param ... any
---@return any
function GroundCover:delete(...) end
---@param ... any
---@return any
function GroundCover:deleteObject(...) end
---@param ... any
---@return any
function GroundCover:deletePersistentId(...) end
---@param ... any
---@return any
function GroundCover:disableCollision(...) end
---@param ... any
---@return any
function GroundCover:dump(...) end
---@param ... any
---@return any
function GroundCover:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function GroundCover:enableCollision(...) end
---@param ... any
---@return any
function GroundCover:generatePersistentId(...) end
---@param ... any
---@return any
function GroundCover:getAnchorNames(...) end
---@param ... any
---@return any
function GroundCover:getClassDocString(...) end
---@param ... any
---@return any
function GroundCover:getClassName(...) end
---@param ... any
---@return any
function GroundCover:getDeclarationLine(...) end
---@param ... any
---@return any
function GroundCover:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function GroundCover:getDynamicFields(...) end
---@param ... any
---@return any
function GroundCover:getEulerRotation(...) end
---@param ... any
---@return any
function GroundCover:getField(...) end
---@param ... any
---@return any
function GroundCover:getFieldInfo(...) end
---@param ... any
---@return any
function GroundCover:getFieldList(...) end
---@param ... any
---@return any
function GroundCover:getFields(...) end
---@param ... any
---@return any
function GroundCover:getFieldsForEditor(...) end
---@param ... any
---@return any
function GroundCover:getFileName(...) end
---@param ... any
---@return any
function GroundCover:getFirstMaterialName(...) end
---@param ... any
---@return any
function GroundCover:getForwardVector(...) end
---@param ... any
---@return any
function GroundCover:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function GroundCover:getGroup(...) end
---@param ... any
---@return any
function GroundCover:getID(...) end
---@param ... any
---@return any
function GroundCover:getId(...) end
---@param ... any
---@return any
function GroundCover:getIdString(...) end
---@param ... any
---@return any
function GroundCover:getInternalName(...) end
---@param ... any
---@return any
function GroundCover:getMaterialNames(...) end
---@param ... any
---@return any
function GroundCover:getMeshMaterialNames(...) end
---@param ... any
---@return any
function GroundCover:getName(...) end
---@param ... any
---@return any
function GroundCover:getObjBox(...) end
---@param ... any
---@return any
function GroundCover:getObjectBox(...) end
---@param ... any
---@return any
function GroundCover:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function GroundCover:getPosition(...) end
---@param ... any
---@return any
function GroundCover:getPositionXYZ(...) end
---@param ... any
---@return any
function GroundCover:getRotation(...) end
---@param ... any
---@return any
function GroundCover:getScale(...) end
---@param ... any
---@return any
function GroundCover:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function GroundCover:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function GroundCover:getTransform(...) end
---@param ... any
---@return any
function GroundCover:getTransformF(...) end
---@param ... any
---@return any
function GroundCover:getType(...) end
---@param ... any
---@return any
function GroundCover:getWorldBox(...) end
---@param ... any
---@return any
function GroundCover:getWorldBoxCenter(...) end
---@param ... any
---@return any
function GroundCover:getWorldTransform(...) end
---@param ... any
---@return any
function GroundCover:hideInRenderView(...) end
---@param ... any
---@return any
function GroundCover:incRefCount(...) end
---@param ... any
---@return any
function GroundCover:inheritParentFields(...) end
---@param ... any
---@return any
function GroundCover:inspectUpdate(...) end
---@param ... any
---@return any
function GroundCover:isChildOfGroup(...) end
---@param ... any
---@return any
function GroundCover:isEditorDirty(...) end
---@param ... any
---@return any
function GroundCover:isGlobalBounds(...) end
---@param ... any
---@return any
function GroundCover:isHidden(...) end
---@param ... any
---@return any
function GroundCover:isLocked(...) end
---@param ... any
---@return any
function GroundCover:isNameChangeAllowed(...) end
---@param ... any
---@return any
function GroundCover:isRenderEnabled(...) end
---@param ... any
---@return any
function GroundCover:isSelected(...) end
---@param ... any
---@return any
function GroundCover:isSelectionEnabled(...) end
---@param ... any
---@return any
function GroundCover:isSubClassOf(...) end
---@param ... any
---@return any
function GroundCover:onEditorDisable(...) end
---@param ... any
---@return any
function GroundCover:onEditorEnable(...) end
---@param ... any
---@return any
function GroundCover:postApply(...) end
---@param ... any
---@return any
function GroundCover:preApply(...) end
---@param ... any
---@return any
function GroundCover:registerObject(...) end
---@param ... any
---@return any
function GroundCover:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function GroundCover:renderViewMaskClear(...) end
---@param ... any
---@return any
function GroundCover:save(...) end
---@param ... any
---@return any
function GroundCover:serialize(...) end
---@param ... any
---@return any
function GroundCover:serializeForEditor(...) end
---@param ... any
---@return any
function GroundCover:serializeToDirectories(...) end
---@param ... any
---@return any
function GroundCover:serializeToNameDictFile(...) end
---@param ... any
---@return any
function GroundCover:setCanFloatAboveGround(...) end
---@param ... any
---@return any
function GroundCover:setCanSave(...) end
---@param ... any
---@return any
function GroundCover:setDeclarationLine(...) end
---@param ... any
---@return any
function GroundCover:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function GroundCover:setEditorDirty(...) end
---@param ... any
---@return any
function GroundCover:setEditorOnly(...) end
---@param ... any
---@return any
function GroundCover:setField(...) end
---@param ... any
---@return any
function GroundCover:setFileName(...) end
---@param ... any
---@return any
function GroundCover:setHidden(...) end
---@param ... any
---@return any
function GroundCover:setInternalName(...) end
---@param ... any
---@return any
function GroundCover:setIsSelected(...) end
---@param ... any
---@return any
function GroundCover:setLocked(...) end
---@param ... any
---@return any
function GroundCover:setName(...) end
---@param ... any
---@return any
function GroundCover:setNameChangeAllowed(...) end
---@param ... any
---@return any
function GroundCover:setPosRot(...) end
---@param ... any
---@return any
function GroundCover:setPosition(...) end
---@param ... any
---@return any
function GroundCover:setPositionXYZ(...) end
---@param ... any
---@return any
function GroundCover:setRenderEnabled(...) end
---@param ... any
---@return any
function GroundCover:setScale(...) end
---@param ... any
---@return any
function GroundCover:setScaleXYZ(...) end
---@param ... any
---@return any
function GroundCover:setSelected(...) end
---@param ... any
---@return any
function GroundCover:setSelectionEnabled(...) end
---@param ... any
---@return any
function GroundCover:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function GroundCover:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function GroundCover:setTransform(...) end
---@param ... any
---@return any
function GroundCover:setTransformF(...) end
---@param ... any
---@return any
function GroundCover:showOnlyInRenderView(...) end
---@param ... any
---@return any
function GroundCover:unhideInRenderView(...) end
---@param ... any
---@return any
function GroundCover:unregisterObject(...) end

---@class GuiCanvas : GuiControl
---@field className any
local GuiCanvas = {}
---@param ... any
---@return any
function GuiCanvas:add(...) end
---@param ... any
---@return any
function GuiCanvas:addGuiControl(...) end
---@param ... any
---@return any
function GuiCanvas:addObject(...) end
---@param ... any
---@return any
function GuiCanvas:addWithName(...) end
---@param ... any
---@return any
function GuiCanvas:assignFieldsFromObject(...) end
---@param ... any
---@return any
function GuiCanvas:at(...) end
---@param ... any
---@return any
function GuiCanvas:awaken(...) end
---@param ... any
---@return any
function GuiCanvas:bringObjectToFront(...) end
---@param ... any
---@return any
function GuiCanvas:bringToFront(...) end
---@param ... any
---@return any
function GuiCanvas:clear(...) end
---@param ... any
---@return any
function GuiCanvas:clearFirstResponder(...) end
---@param ... any
---@return any
function GuiCanvas:clientToScreen(...) end
---@param ... any
---@return any
function GuiCanvas:clientToScreenXY(...) end
---@param ... any
---@return any
function GuiCanvas:clone(...) end
---@param ... any
---@return any
function GuiCanvas:controlIsChild(...) end
---@param ... any
---@return any
function GuiCanvas:decRefCount(...) end
---@param ... any
---@return any
function GuiCanvas:delete(...) end
---@param ... any
---@return any
function GuiCanvas:deleteAllObjects(...) end
---@param ... any
---@return any
function GuiCanvas:deleteObject(...) end
---@param ... any
---@return any
function GuiCanvas:deletePersistentId(...) end
---@param ... any
---@return any
function GuiCanvas:dump(...) end
---@param ... any
---@return any
function GuiCanvas:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function GuiCanvas:enableCursorHideIfMouseInactive(...) end
---@param ... any
---@return any
function GuiCanvas:findObject(...) end
---@param ... any
---@return any
function GuiCanvas:findObjectById(...) end
---@param ... any
---@return any
function GuiCanvas:findObjectByInternalName(...) end
---@param ... any
---@return any
function GuiCanvas:findObjectIdAfter(...) end
---@param ... any
---@return any
function GuiCanvas:generatePersistentId(...) end
---@param ... any
---@return any
function GuiCanvas:getBounds(...) end
---@param ... any
---@return any
function GuiCanvas:getCenter(...) end
---@param ... any
---@return any
function GuiCanvas:getClassDocString(...) end
---@param ... any
---@return any
function GuiCanvas:getClassName(...) end
---@param ... any
---@return any
function GuiCanvas:getContent(...) end
---@param ... any
---@return any
function GuiCanvas:getCount(...) end
---@param ... any
---@return any
function GuiCanvas:getCursorPos(...) end
---@param ... any
---@return any
function GuiCanvas:getCursorPosXY(...) end
---@param ... any
---@return any
function GuiCanvas:getCursorVisible(...) end
---@param ... any
---@return any
function GuiCanvas:getDeclarationLine(...) end
---@param ... any
---@return any
function GuiCanvas:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function GuiCanvas:getDynamicFields(...) end
---@param ... any
---@return any
function GuiCanvas:getExtent(...) end
---@param ... any
---@return any
function GuiCanvas:getField(...) end
---@param ... any
---@return any
function GuiCanvas:getFieldInfo(...) end
---@param ... any
---@return any
function GuiCanvas:getFieldList(...) end
---@param ... any
---@return any
function GuiCanvas:getFields(...) end
---@param ... any
---@return any
function GuiCanvas:getFieldsForEditor(...) end
---@param ... any
---@return any
function GuiCanvas:getFileName(...) end
---@param ... any
---@return any
function GuiCanvas:getFirstResponder(...) end
---@param ... any
---@return any
function GuiCanvas:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function GuiCanvas:getGlobalBounds(...) end
---@param ... any
---@return any
function GuiCanvas:getGlobalPosition(...) end
---@param ... any
---@return any
function GuiCanvas:getGroup(...) end
---@param ... any
---@return any
function GuiCanvas:getID(...) end
---@param ... any
---@return any
function GuiCanvas:getId(...) end
---@param ... any
---@return any
function GuiCanvas:getIdString(...) end
---@param ... any
---@return any
function GuiCanvas:getInternalName(...) end
---@param ... any
---@return any
function GuiCanvas:getMode(...) end
---@param ... any
---@return any
function GuiCanvas:getModeCount(...) end
---@param ... any
---@return any
function GuiCanvas:getName(...) end
---@param ... any
---@return any
function GuiCanvas:getObject(...) end
---@param ... any
---@return any
function GuiCanvas:getObjectIndex(...) end
---@param ... any
---@return any
function GuiCanvas:getObjects(...) end
---@param ... any
---@return any
function GuiCanvas:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function GuiCanvas:getParent(...) end
---@param ... any
---@return any
function GuiCanvas:getPlacement(...) end
---@param ... any
---@return any
function GuiCanvas:getPosition(...) end
---@param ... any
---@return any
function GuiCanvas:getRandom(...) end
---@param ... any
---@return any
function GuiCanvas:getRoot(...) end
---@param ... any
---@return any
function GuiCanvas:getScenetreeData(...) end
---@param ... any
---@return any
function GuiCanvas:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function GuiCanvas:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function GuiCanvas:getVideoModeStr(...) end
---@param ... any
---@return any
function GuiCanvas:getWindowBounds(...) end
---@param ... any
---@return any
function GuiCanvas:getWindowClientSize(...) end
---@param ... any
---@return any
function GuiCanvas:getWindowClientSizeXY(...) end
---@param ... any
---@return any
function GuiCanvas:hideAndLockCursor(...) end
---@param ... any
---@return any
function GuiCanvas:hideCursor(...) end
---@param ... any
---@return any
function GuiCanvas:idAt(...) end
---@param ... any
---@return any
function GuiCanvas:incRefCount(...) end
---@param ... any
---@return any
function GuiCanvas:inheritParentFields(...) end
---@param ... any
---@return any
function GuiCanvas:inspectUpdate(...) end
---@param ... any
---@return any
function GuiCanvas:isActive(...) end
---@param ... any
---@return any
function GuiCanvas:isAwake(...) end
---@param ... any
---@return any
function GuiCanvas:isChildOfGroup(...) end
---@param ... any
---@return any
function GuiCanvas:isEditorDirty(...) end
---@param ... any
---@return any
function GuiCanvas:isFirstResponder(...) end
---@param ... any
---@return any
function GuiCanvas:isHidden(...) end
---@param ... any
---@return any
function GuiCanvas:isLocked(...) end
---@param ... any
---@return any
function GuiCanvas:isMember(...) end
---@param ... any
---@return any
function GuiCanvas:isNameChangeAllowed(...) end
---@param ... any
---@return any
function GuiCanvas:isSelected(...) end
---@param ... any
---@return any
function GuiCanvas:isSubClassOf(...) end
---@param ... any
---@return any
function GuiCanvas:isVisible(...) end
---@param ... any
---@return any
function GuiCanvas:isWindowHovered(...) end
---@param ... any
---@return any
function GuiCanvas:listObjects(...) end
---@param ... any
---@return any
function GuiCanvas:onEditorDisable(...) end
---@param ... any
---@return any
function GuiCanvas:onEditorEnable(...) end
---@param ... any
---@return any
function GuiCanvas:postApply(...) end
---@param ... any
---@return any
function GuiCanvas:preApply(...) end
---@param ... any
---@return any
function GuiCanvas:preRender(...) end
---@param ... any
---@return any
function GuiCanvas:pushObjectToBack(...) end
---@param ... any
---@return any
function GuiCanvas:pushToBack(...) end
---@param ... any
---@return any
function GuiCanvas:registerObject(...) end
---@param ... any
---@return any
function GuiCanvas:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function GuiCanvas:remove(...) end
---@param ... any
---@return any
function GuiCanvas:removeObject(...) end
---@param ... any
---@return any
function GuiCanvas:renderFront(...) end
---@param ... any
---@return any
function GuiCanvas:reorderChild(...) end
---@param ... any
---@return any
function GuiCanvas:repaintUIThrottled(...) end
---@param ... any
---@return any
function GuiCanvas:reset(...) end
---@param ... any
---@return any
function GuiCanvas:resize(...) end
---@param ... any
---@return any
function GuiCanvas:restorePlacement(...) end
---@param ... any
---@return any
function GuiCanvas:save(...) end
---@param ... any
---@return any
function GuiCanvas:screenToClient(...) end
---@param ... any
---@return any
function GuiCanvas:serialize(...) end
---@param ... any
---@return any
function GuiCanvas:serializeForEditor(...) end
---@param ... any
---@return any
function GuiCanvas:serializeToDirectories(...) end
---@param ... any
---@return any
function GuiCanvas:serializeToNameDictFile(...) end
---@param ... any
---@return any
function GuiCanvas:setActive(...) end
---@param ... any
---@return any
function GuiCanvas:setCanHit(...) end
---@param ... any
---@return any
function GuiCanvas:setCanSave(...) end
---@param ... any
---@return any
function GuiCanvas:setCenter(...) end
---@param ... any
---@return any
function GuiCanvas:setContent(...) end
---@param ... any
---@return any
function GuiCanvas:setControlProfile(...) end
---@param ... any
---@return any
function GuiCanvas:setCursor(...) end
---@param ... any
---@return any
function GuiCanvas:setCursorPos(...) end
---@param ... any
---@return any
function GuiCanvas:setCursorVisible(...) end
---@param ... any
---@return any
function GuiCanvas:setDeclarationLine(...) end
---@param ... any
---@return any
function GuiCanvas:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function GuiCanvas:setEditorDirty(...) end
---@param ... any
---@return any
function GuiCanvas:setEditorOnly(...) end
---@param ... any
---@return any
function GuiCanvas:setField(...) end
---@param ... any
---@return any
function GuiCanvas:setFileName(...) end
---@param ... any
---@return any
function GuiCanvas:setFirstResponder(...) end
---@param ... any
---@return any
function GuiCanvas:setHidden(...) end
---@param ... any
---@return any
function GuiCanvas:setInternalName(...) end
---@param ... any
---@return any
function GuiCanvas:setIsSelected(...) end
---@param ... any
---@return any
function GuiCanvas:setLocked(...) end
---@param ... any
---@return any
function GuiCanvas:setMinExtent(...) end
---@param ... any
---@return any
function GuiCanvas:setName(...) end
---@param ... any
---@return any
function GuiCanvas:setNameChangeAllowed(...) end
---@param ... any
---@return any
function GuiCanvas:setPosition(...) end
---@param ... any
---@return any
function GuiCanvas:setPositionGlobal(...) end
---@param ... any
---@return any
function GuiCanvas:setProfile(...) end
---@param ... any
---@return any
function GuiCanvas:setSelected(...) end
---@param ... any
---@return any
function GuiCanvas:setSizing(...) end
---@param ... any
---@return any
function GuiCanvas:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function GuiCanvas:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function GuiCanvas:setTooltipProfile(...) end
---@param ... any
---@return any
function GuiCanvas:setUpdate(...) end
---@param ... any
---@return any
function GuiCanvas:setValue(...) end
---@param ... any
---@return any
function GuiCanvas:setVisible(...) end
---@param ... any
---@return any
function GuiCanvas:setWindowPosition(...) end
---@param ... any
---@return any
function GuiCanvas:showAndUnlockCursor(...) end
---@param ... any
---@return any
function GuiCanvas:showCursor(...) end
---@param ... any
---@return any
function GuiCanvas:showWindow(...) end
---@param ... any
---@return any
function GuiCanvas:size(...) end
---@param ... any
---@return any
function GuiCanvas:sleep(...) end
---@param ... any
---@return any
function GuiCanvas:sortByName(...) end
---@param ... any
---@return any
function GuiCanvas:toggleFullscreen(...) end
---@param ... any
---@return any
function GuiCanvas:unregisterObject(...) end
---@param ... any
---@return any
function GuiCanvas:wasUserMovingMouse(...) end

---@class GuiContainer : GuiControl
---@field className any
local GuiContainer = {}
---@param ... any
---@return any
function GuiContainer:add(...) end
---@param ... any
---@return any
function GuiContainer:addGuiControl(...) end
---@param ... any
---@return any
function GuiContainer:addObject(...) end
---@param ... any
---@return any
function GuiContainer:addWithName(...) end
---@param ... any
---@return any
function GuiContainer:assignFieldsFromObject(...) end
---@param ... any
---@return any
function GuiContainer:at(...) end
---@param ... any
---@return any
function GuiContainer:awaken(...) end
---@param ... any
---@return any
function GuiContainer:bringObjectToFront(...) end
---@param ... any
---@return any
function GuiContainer:bringToFront(...) end
---@param ... any
---@return any
function GuiContainer:clear(...) end
---@param ... any
---@return any
function GuiContainer:clearFirstResponder(...) end
---@param ... any
---@return any
function GuiContainer:clone(...) end
---@param ... any
---@return any
function GuiContainer:controlIsChild(...) end
---@param ... any
---@return any
function GuiContainer:decRefCount(...) end
---@param ... any
---@return any
function GuiContainer:delete(...) end
---@param ... any
---@return any
function GuiContainer:deleteAllObjects(...) end
---@param ... any
---@return any
function GuiContainer:deleteObject(...) end
---@param ... any
---@return any
function GuiContainer:deletePersistentId(...) end
---@param ... any
---@return any
function GuiContainer:dump(...) end
---@param ... any
---@return any
function GuiContainer:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function GuiContainer:findObject(...) end
---@param ... any
---@return any
function GuiContainer:findObjectById(...) end
---@param ... any
---@return any
function GuiContainer:findObjectByInternalName(...) end
---@param ... any
---@return any
function GuiContainer:findObjectIdAfter(...) end
---@param ... any
---@return any
function GuiContainer:generatePersistentId(...) end
---@param ... any
---@return any
function GuiContainer:getBounds(...) end
---@param ... any
---@return any
function GuiContainer:getCenter(...) end
---@param ... any
---@return any
function GuiContainer:getClassDocString(...) end
---@param ... any
---@return any
function GuiContainer:getClassName(...) end
---@param ... any
---@return any
function GuiContainer:getCount(...) end
---@param ... any
---@return any
function GuiContainer:getDeclarationLine(...) end
---@param ... any
---@return any
function GuiContainer:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function GuiContainer:getDynamicFields(...) end
---@param ... any
---@return any
function GuiContainer:getExtent(...) end
---@param ... any
---@return any
function GuiContainer:getField(...) end
---@param ... any
---@return any
function GuiContainer:getFieldInfo(...) end
---@param ... any
---@return any
function GuiContainer:getFieldList(...) end
---@param ... any
---@return any
function GuiContainer:getFields(...) end
---@param ... any
---@return any
function GuiContainer:getFieldsForEditor(...) end
---@param ... any
---@return any
function GuiContainer:getFileName(...) end
---@param ... any
---@return any
function GuiContainer:getFirstResponder(...) end
---@param ... any
---@return any
function GuiContainer:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function GuiContainer:getGlobalBounds(...) end
---@param ... any
---@return any
function GuiContainer:getGlobalPosition(...) end
---@param ... any
---@return any
function GuiContainer:getGroup(...) end
---@param ... any
---@return any
function GuiContainer:getID(...) end
---@param ... any
---@return any
function GuiContainer:getId(...) end
---@param ... any
---@return any
function GuiContainer:getIdString(...) end
---@param ... any
---@return any
function GuiContainer:getInternalName(...) end
---@param ... any
---@return any
function GuiContainer:getName(...) end
---@param ... any
---@return any
function GuiContainer:getObject(...) end
---@param ... any
---@return any
function GuiContainer:getObjectIndex(...) end
---@param ... any
---@return any
function GuiContainer:getObjects(...) end
---@param ... any
---@return any
function GuiContainer:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function GuiContainer:getParent(...) end
---@param ... any
---@return any
function GuiContainer:getPosition(...) end
---@param ... any
---@return any
function GuiContainer:getRandom(...) end
---@param ... any
---@return any
function GuiContainer:getRoot(...) end
---@param ... any
---@return any
function GuiContainer:getScenetreeData(...) end
---@param ... any
---@return any
function GuiContainer:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function GuiContainer:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function GuiContainer:idAt(...) end
---@param ... any
---@return any
function GuiContainer:incRefCount(...) end
---@param ... any
---@return any
function GuiContainer:inheritParentFields(...) end
---@param ... any
---@return any
function GuiContainer:inspectUpdate(...) end
---@param ... any
---@return any
function GuiContainer:isActive(...) end
---@param ... any
---@return any
function GuiContainer:isAwake(...) end
---@param ... any
---@return any
function GuiContainer:isChildOfGroup(...) end
---@param ... any
---@return any
function GuiContainer:isEditorDirty(...) end
---@param ... any
---@return any
function GuiContainer:isFirstResponder(...) end
---@param ... any
---@return any
function GuiContainer:isHidden(...) end
---@param ... any
---@return any
function GuiContainer:isLocked(...) end
---@param ... any
---@return any
function GuiContainer:isMember(...) end
---@param ... any
---@return any
function GuiContainer:isNameChangeAllowed(...) end
---@param ... any
---@return any
function GuiContainer:isSelected(...) end
---@param ... any
---@return any
function GuiContainer:isSubClassOf(...) end
---@param ... any
---@return any
function GuiContainer:isVisible(...) end
---@param ... any
---@return any
function GuiContainer:listObjects(...) end
---@param ... any
---@return any
function GuiContainer:onEditorDisable(...) end
---@param ... any
---@return any
function GuiContainer:onEditorEnable(...) end
---@param ... any
---@return any
function GuiContainer:postApply(...) end
---@param ... any
---@return any
function GuiContainer:preApply(...) end
---@param ... any
---@return any
function GuiContainer:preRender(...) end
---@param ... any
---@return any
function GuiContainer:pushObjectToBack(...) end
---@param ... any
---@return any
function GuiContainer:pushToBack(...) end
---@param ... any
---@return any
function GuiContainer:registerObject(...) end
---@param ... any
---@return any
function GuiContainer:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function GuiContainer:remove(...) end
---@param ... any
---@return any
function GuiContainer:removeObject(...) end
---@param ... any
---@return any
function GuiContainer:reorderChild(...) end
---@param ... any
---@return any
function GuiContainer:resize(...) end
---@param ... any
---@return any
function GuiContainer:save(...) end
---@param ... any
---@return any
function GuiContainer:serialize(...) end
---@param ... any
---@return any
function GuiContainer:serializeForEditor(...) end
---@param ... any
---@return any
function GuiContainer:serializeToDirectories(...) end
---@param ... any
---@return any
function GuiContainer:serializeToNameDictFile(...) end
---@param ... any
---@return any
function GuiContainer:setActive(...) end
---@param ... any
---@return any
function GuiContainer:setCanHit(...) end
---@param ... any
---@return any
function GuiContainer:setCanSave(...) end
---@param ... any
---@return any
function GuiContainer:setCenter(...) end
---@param ... any
---@return any
function GuiContainer:setControlProfile(...) end
---@param ... any
---@return any
function GuiContainer:setDeclarationLine(...) end
---@param ... any
---@return any
function GuiContainer:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function GuiContainer:setEditorDirty(...) end
---@param ... any
---@return any
function GuiContainer:setEditorOnly(...) end
---@param ... any
---@return any
function GuiContainer:setField(...) end
---@param ... any
---@return any
function GuiContainer:setFileName(...) end
---@param ... any
---@return any
function GuiContainer:setFirstResponder(...) end
---@param ... any
---@return any
function GuiContainer:setHidden(...) end
---@param ... any
---@return any
function GuiContainer:setInternalName(...) end
---@param ... any
---@return any
function GuiContainer:setIsSelected(...) end
---@param ... any
---@return any
function GuiContainer:setLocked(...) end
---@param ... any
---@return any
function GuiContainer:setName(...) end
---@param ... any
---@return any
function GuiContainer:setNameChangeAllowed(...) end
---@param ... any
---@return any
function GuiContainer:setPosition(...) end
---@param ... any
---@return any
function GuiContainer:setPositionGlobal(...) end
---@param ... any
---@return any
function GuiContainer:setProfile(...) end
---@param ... any
---@return any
function GuiContainer:setSelected(...) end
---@param ... any
---@return any
function GuiContainer:setSizing(...) end
---@param ... any
---@return any
function GuiContainer:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function GuiContainer:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function GuiContainer:setTooltipProfile(...) end
---@param ... any
---@return any
function GuiContainer:setUpdate(...) end
---@param ... any
---@return any
function GuiContainer:setValue(...) end
---@param ... any
---@return any
function GuiContainer:setVisible(...) end
---@param ... any
---@return any
function GuiContainer:size(...) end
---@param ... any
---@return any
function GuiContainer:sleep(...) end
---@param ... any
---@return any
function GuiContainer:sortByName(...) end
---@param ... any
---@return any
function GuiContainer:unregisterObject(...) end

---@class GuiControl : SimGroup
---@field className any
local GuiControl = {}
---@param ... any
---@return any
function GuiControl:add(...) end
---@param ... any
---@return any
function GuiControl:addGuiControl(...) end
---@param ... any
---@return any
function GuiControl:addObject(...) end
---@param ... any
---@return any
function GuiControl:addWithName(...) end
---@param ... any
---@return any
function GuiControl:assignFieldsFromObject(...) end
---@param ... any
---@return any
function GuiControl:at(...) end
---@param ... any
---@return any
function GuiControl:awaken(...) end
---@param ... any
---@return any
function GuiControl:bringObjectToFront(...) end
---@param ... any
---@return any
function GuiControl:bringToFront(...) end
---@param ... any
---@return any
function GuiControl:clear(...) end
---@param ... any
---@return any
function GuiControl:clearFirstResponder(...) end
---@param ... any
---@return any
function GuiControl:clone(...) end
---@param ... any
---@return any
function GuiControl:controlIsChild(...) end
---@param ... any
---@return any
function GuiControl:decRefCount(...) end
---@param ... any
---@return any
function GuiControl:delete(...) end
---@param ... any
---@return any
function GuiControl:deleteAllObjects(...) end
---@param ... any
---@return any
function GuiControl:deleteObject(...) end
---@param ... any
---@return any
function GuiControl:deletePersistentId(...) end
---@param ... any
---@return any
function GuiControl:dump(...) end
---@param ... any
---@return any
function GuiControl:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function GuiControl:findObject(...) end
---@param ... any
---@return any
function GuiControl:findObjectById(...) end
---@param ... any
---@return any
function GuiControl:findObjectByInternalName(...) end
---@param ... any
---@return any
function GuiControl:findObjectIdAfter(...) end
---@param ... any
---@return any
function GuiControl:generatePersistentId(...) end
---@param ... any
---@return any
function GuiControl:getBounds(...) end
---@param ... any
---@return any
function GuiControl:getCenter(...) end
---@param ... any
---@return any
function GuiControl:getClassDocString(...) end
---@param ... any
---@return any
function GuiControl:getClassName(...) end
---@param ... any
---@return any
function GuiControl:getCount(...) end
---@param ... any
---@return any
function GuiControl:getDeclarationLine(...) end
---@param ... any
---@return any
function GuiControl:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function GuiControl:getDynamicFields(...) end
---@param ... any
---@return any
function GuiControl:getExtent(...) end
---@param ... any
---@return any
function GuiControl:getField(...) end
---@param ... any
---@return any
function GuiControl:getFieldInfo(...) end
---@param ... any
---@return any
function GuiControl:getFieldList(...) end
---@param ... any
---@return any
function GuiControl:getFields(...) end
---@param ... any
---@return any
function GuiControl:getFieldsForEditor(...) end
---@param ... any
---@return any
function GuiControl:getFileName(...) end
---@param ... any
---@return any
function GuiControl:getFirstResponder(...) end
---@param ... any
---@return any
function GuiControl:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function GuiControl:getGlobalBounds(...) end
---@param ... any
---@return any
function GuiControl:getGlobalPosition(...) end
---@param ... any
---@return any
function GuiControl:getGroup(...) end
---@param ... any
---@return any
function GuiControl:getID(...) end
---@param ... any
---@return any
function GuiControl:getId(...) end
---@param ... any
---@return any
function GuiControl:getIdString(...) end
---@param ... any
---@return any
function GuiControl:getInternalName(...) end
---@param ... any
---@return any
function GuiControl:getName(...) end
---@param ... any
---@return any
function GuiControl:getObject(...) end
---@param ... any
---@return any
function GuiControl:getObjectIndex(...) end
---@param ... any
---@return any
function GuiControl:getObjects(...) end
---@param ... any
---@return any
function GuiControl:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function GuiControl:getParent(...) end
---@param ... any
---@return any
function GuiControl:getPosition(...) end
---@param ... any
---@return any
function GuiControl:getRandom(...) end
---@param ... any
---@return any
function GuiControl:getRoot(...) end
---@param ... any
---@return any
function GuiControl:getScenetreeData(...) end
---@param ... any
---@return any
function GuiControl:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function GuiControl:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function GuiControl:idAt(...) end
---@param ... any
---@return any
function GuiControl:incRefCount(...) end
---@param ... any
---@return any
function GuiControl:inheritParentFields(...) end
---@param ... any
---@return any
function GuiControl:inspectUpdate(...) end
---@param ... any
---@return any
function GuiControl:isActive(...) end
---@param ... any
---@return any
function GuiControl:isAwake(...) end
---@param ... any
---@return any
function GuiControl:isChildOfGroup(...) end
---@param ... any
---@return any
function GuiControl:isEditorDirty(...) end
---@param ... any
---@return any
function GuiControl:isFirstResponder(...) end
---@param ... any
---@return any
function GuiControl:isHidden(...) end
---@param ... any
---@return any
function GuiControl:isLocked(...) end
---@param ... any
---@return any
function GuiControl:isMember(...) end
---@param ... any
---@return any
function GuiControl:isNameChangeAllowed(...) end
---@param ... any
---@return any
function GuiControl:isSelected(...) end
---@param ... any
---@return any
function GuiControl:isSubClassOf(...) end
---@param ... any
---@return any
function GuiControl:isVisible(...) end
---@param ... any
---@return any
function GuiControl:listObjects(...) end
---@param ... any
---@return any
function GuiControl:onEditorDisable(...) end
---@param ... any
---@return any
function GuiControl:onEditorEnable(...) end
---@param ... any
---@return any
function GuiControl:postApply(...) end
---@param ... any
---@return any
function GuiControl:preApply(...) end
---@param ... any
---@return any
function GuiControl:preRender(...) end
---@param ... any
---@return any
function GuiControl:pushObjectToBack(...) end
---@param ... any
---@return any
function GuiControl:pushToBack(...) end
---@param ... any
---@return any
function GuiControl:registerObject(...) end
---@param ... any
---@return any
function GuiControl:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function GuiControl:remove(...) end
---@param ... any
---@return any
function GuiControl:removeObject(...) end
---@param ... any
---@return any
function GuiControl:reorderChild(...) end
---@param ... any
---@return any
function GuiControl:resize(...) end
---@param ... any
---@return any
function GuiControl:save(...) end
---@param ... any
---@return any
function GuiControl:serialize(...) end
---@param ... any
---@return any
function GuiControl:serializeForEditor(...) end
---@param ... any
---@return any
function GuiControl:serializeToDirectories(...) end
---@param ... any
---@return any
function GuiControl:serializeToNameDictFile(...) end
---@param ... any
---@return any
function GuiControl:setActive(...) end
---@param ... any
---@return any
function GuiControl:setCanHit(...) end
---@param ... any
---@return any
function GuiControl:setCanSave(...) end
---@param ... any
---@return any
function GuiControl:setCenter(...) end
---@param ... any
---@return any
function GuiControl:setControlProfile(...) end
---@param ... any
---@return any
function GuiControl:setDeclarationLine(...) end
---@param ... any
---@return any
function GuiControl:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function GuiControl:setEditorDirty(...) end
---@param ... any
---@return any
function GuiControl:setEditorOnly(...) end
---@param ... any
---@return any
function GuiControl:setField(...) end
---@param ... any
---@return any
function GuiControl:setFileName(...) end
---@param ... any
---@return any
function GuiControl:setFirstResponder(...) end
---@param ... any
---@return any
function GuiControl:setHidden(...) end
---@param ... any
---@return any
function GuiControl:setInternalName(...) end
---@param ... any
---@return any
function GuiControl:setIsSelected(...) end
---@param ... any
---@return any
function GuiControl:setLocked(...) end
---@param ... any
---@return any
function GuiControl:setName(...) end
---@param ... any
---@return any
function GuiControl:setNameChangeAllowed(...) end
---@param ... any
---@return any
function GuiControl:setPosition(...) end
---@param ... any
---@return any
function GuiControl:setPositionGlobal(...) end
---@param ... any
---@return any
function GuiControl:setProfile(...) end
---@param ... any
---@return any
function GuiControl:setSelected(...) end
---@param ... any
---@return any
function GuiControl:setSizing(...) end
---@param ... any
---@return any
function GuiControl:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function GuiControl:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function GuiControl:setTooltipProfile(...) end
---@param ... any
---@return any
function GuiControl:setUpdate(...) end
---@param ... any
---@return any
function GuiControl:setValue(...) end
---@param ... any
---@return any
function GuiControl:setVisible(...) end
---@param ... any
---@return any
function GuiControl:size(...) end
---@param ... any
---@return any
function GuiControl:sleep(...) end
---@param ... any
---@return any
function GuiControl:sortByName(...) end
---@param ... any
---@return any
function GuiControl:unregisterObject(...) end

---@class GuiControlProfile : SimObject
---@field className any
local GuiControlProfile = {}
---@param ... any
---@return any
function GuiControlProfile:assignFieldsFromObject(...) end
---@param ... any
---@return any
function GuiControlProfile:clone(...) end
---@param ... any
---@return any
function GuiControlProfile:decRefCount(...) end
---@param ... any
---@return any
function GuiControlProfile:delete(...) end
---@param ... any
---@return any
function GuiControlProfile:deleteObject(...) end
---@param ... any
---@return any
function GuiControlProfile:deletePersistentId(...) end
---@param ... any
---@return any
function GuiControlProfile:dump(...) end
---@param ... any
---@return any
function GuiControlProfile:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function GuiControlProfile:generatePersistentId(...) end
---@param ... any
---@return any
function GuiControlProfile:getClassDocString(...) end
---@param ... any
---@return any
function GuiControlProfile:getClassName(...) end
---@param ... any
---@return any
function GuiControlProfile:getDeclarationLine(...) end
---@param ... any
---@return any
function GuiControlProfile:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function GuiControlProfile:getDynamicFields(...) end
---@param ... any
---@return any
function GuiControlProfile:getField(...) end
---@param ... any
---@return any
function GuiControlProfile:getFieldInfo(...) end
---@param ... any
---@return any
function GuiControlProfile:getFieldList(...) end
---@param ... any
---@return any
function GuiControlProfile:getFields(...) end
---@param ... any
---@return any
function GuiControlProfile:getFieldsForEditor(...) end
---@param ... any
---@return any
function GuiControlProfile:getFileName(...) end
---@param ... any
---@return any
function GuiControlProfile:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function GuiControlProfile:getGroup(...) end
---@param ... any
---@return any
function GuiControlProfile:getID(...) end
---@param ... any
---@return any
function GuiControlProfile:getId(...) end
---@param ... any
---@return any
function GuiControlProfile:getIdString(...) end
---@param ... any
---@return any
function GuiControlProfile:getInternalName(...) end
---@param ... any
---@return any
function GuiControlProfile:getName(...) end
---@param ... any
---@return any
function GuiControlProfile:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function GuiControlProfile:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function GuiControlProfile:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function GuiControlProfile:incRefCount(...) end
---@param ... any
---@return any
function GuiControlProfile:inheritParentFields(...) end
---@param ... any
---@return any
function GuiControlProfile:inspectUpdate(...) end
---@param ... any
---@return any
function GuiControlProfile:isChildOfGroup(...) end
---@param ... any
---@return any
function GuiControlProfile:isEditorDirty(...) end
---@param ... any
---@return any
function GuiControlProfile:isHidden(...) end
---@param ... any
---@return any
function GuiControlProfile:isLocked(...) end
---@param ... any
---@return any
function GuiControlProfile:isNameChangeAllowed(...) end
---@param ... any
---@return any
function GuiControlProfile:isSelected(...) end
---@param ... any
---@return any
function GuiControlProfile:isSubClassOf(...) end
---@param ... any
---@return any
function GuiControlProfile:onEditorDisable(...) end
---@param ... any
---@return any
function GuiControlProfile:onEditorEnable(...) end
---@param ... any
---@return any
function GuiControlProfile:postApply(...) end
---@param ... any
---@return any
function GuiControlProfile:preApply(...) end
---@param ... any
---@return any
function GuiControlProfile:registerObject(...) end
---@param ... any
---@return any
function GuiControlProfile:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function GuiControlProfile:save(...) end
---@param ... any
---@return any
function GuiControlProfile:serialize(...) end
---@param ... any
---@return any
function GuiControlProfile:serializeForEditor(...) end
---@param ... any
---@return any
function GuiControlProfile:serializeToDirectories(...) end
---@param ... any
---@return any
function GuiControlProfile:serializeToNameDictFile(...) end
---@param ... any
---@return any
function GuiControlProfile:setCanSave(...) end
---@param ... any
---@return any
function GuiControlProfile:setDeclarationLine(...) end
---@param ... any
---@return any
function GuiControlProfile:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function GuiControlProfile:setEditorDirty(...) end
---@param ... any
---@return any
function GuiControlProfile:setEditorOnly(...) end
---@param ... any
---@return any
function GuiControlProfile:setField(...) end
---@param ... any
---@return any
function GuiControlProfile:setFileName(...) end
---@param ... any
---@return any
function GuiControlProfile:setHidden(...) end
---@param ... any
---@return any
function GuiControlProfile:setInternalName(...) end
---@param ... any
---@return any
function GuiControlProfile:setIsSelected(...) end
---@param ... any
---@return any
function GuiControlProfile:setLocked(...) end
---@param ... any
---@return any
function GuiControlProfile:setName(...) end
---@param ... any
---@return any
function GuiControlProfile:setNameChangeAllowed(...) end
---@param ... any
---@return any
function GuiControlProfile:setSelected(...) end
---@param ... any
---@return any
function GuiControlProfile:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function GuiControlProfile:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function GuiControlProfile:unregisterObject(...) end

---@class GuiCursor : SimObject
---@field className any
local GuiCursor = {}
---@param ... any
---@return any
function GuiCursor:assignFieldsFromObject(...) end
---@param ... any
---@return any
function GuiCursor:clone(...) end
---@param ... any
---@return any
function GuiCursor:decRefCount(...) end
---@param ... any
---@return any
function GuiCursor:delete(...) end
---@param ... any
---@return any
function GuiCursor:deleteObject(...) end
---@param ... any
---@return any
function GuiCursor:deletePersistentId(...) end
---@param ... any
---@return any
function GuiCursor:dump(...) end
---@param ... any
---@return any
function GuiCursor:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function GuiCursor:generatePersistentId(...) end
---@param ... any
---@return any
function GuiCursor:getClassDocString(...) end
---@param ... any
---@return any
function GuiCursor:getClassName(...) end
---@param ... any
---@return any
function GuiCursor:getDeclarationLine(...) end
---@param ... any
---@return any
function GuiCursor:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function GuiCursor:getDynamicFields(...) end
---@param ... any
---@return any
function GuiCursor:getField(...) end
---@param ... any
---@return any
function GuiCursor:getFieldInfo(...) end
---@param ... any
---@return any
function GuiCursor:getFieldList(...) end
---@param ... any
---@return any
function GuiCursor:getFields(...) end
---@param ... any
---@return any
function GuiCursor:getFieldsForEditor(...) end
---@param ... any
---@return any
function GuiCursor:getFileName(...) end
---@param ... any
---@return any
function GuiCursor:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function GuiCursor:getGroup(...) end
---@param ... any
---@return any
function GuiCursor:getID(...) end
---@param ... any
---@return any
function GuiCursor:getId(...) end
---@param ... any
---@return any
function GuiCursor:getIdString(...) end
---@param ... any
---@return any
function GuiCursor:getInternalName(...) end
---@param ... any
---@return any
function GuiCursor:getName(...) end
---@param ... any
---@return any
function GuiCursor:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function GuiCursor:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function GuiCursor:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function GuiCursor:incRefCount(...) end
---@param ... any
---@return any
function GuiCursor:inheritParentFields(...) end
---@param ... any
---@return any
function GuiCursor:inspectUpdate(...) end
---@param ... any
---@return any
function GuiCursor:isChildOfGroup(...) end
---@param ... any
---@return any
function GuiCursor:isEditorDirty(...) end
---@param ... any
---@return any
function GuiCursor:isHidden(...) end
---@param ... any
---@return any
function GuiCursor:isLocked(...) end
---@param ... any
---@return any
function GuiCursor:isNameChangeAllowed(...) end
---@param ... any
---@return any
function GuiCursor:isSelected(...) end
---@param ... any
---@return any
function GuiCursor:isSubClassOf(...) end
---@param ... any
---@return any
function GuiCursor:onEditorDisable(...) end
---@param ... any
---@return any
function GuiCursor:onEditorEnable(...) end
---@param ... any
---@return any
function GuiCursor:postApply(...) end
---@param ... any
---@return any
function GuiCursor:preApply(...) end
---@param ... any
---@return any
function GuiCursor:registerObject(...) end
---@param ... any
---@return any
function GuiCursor:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function GuiCursor:save(...) end
---@param ... any
---@return any
function GuiCursor:serialize(...) end
---@param ... any
---@return any
function GuiCursor:serializeForEditor(...) end
---@param ... any
---@return any
function GuiCursor:serializeToDirectories(...) end
---@param ... any
---@return any
function GuiCursor:serializeToNameDictFile(...) end
---@param ... any
---@return any
function GuiCursor:setCanSave(...) end
---@param ... any
---@return any
function GuiCursor:setDeclarationLine(...) end
---@param ... any
---@return any
function GuiCursor:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function GuiCursor:setEditorDirty(...) end
---@param ... any
---@return any
function GuiCursor:setEditorOnly(...) end
---@param ... any
---@return any
function GuiCursor:setField(...) end
---@param ... any
---@return any
function GuiCursor:setFileName(...) end
---@param ... any
---@return any
function GuiCursor:setHidden(...) end
---@param ... any
---@return any
function GuiCursor:setInternalName(...) end
---@param ... any
---@return any
function GuiCursor:setIsSelected(...) end
---@param ... any
---@return any
function GuiCursor:setLocked(...) end
---@param ... any
---@return any
function GuiCursor:setName(...) end
---@param ... any
---@return any
function GuiCursor:setNameChangeAllowed(...) end
---@param ... any
---@return any
function GuiCursor:setSelected(...) end
---@param ... any
---@return any
function GuiCursor:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function GuiCursor:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function GuiCursor:unregisterObject(...) end

---@class GuiViewportCtrl : GuiContainer
---@field className any
local GuiViewportCtrl = {}
---@param ... any
---@return any
function GuiViewportCtrl:add(...) end
---@param ... any
---@return any
function GuiViewportCtrl:addGuiControl(...) end
---@param ... any
---@return any
function GuiViewportCtrl:addObject(...) end
---@param ... any
---@return any
function GuiViewportCtrl:addWithName(...) end
---@param ... any
---@return any
function GuiViewportCtrl:assignFieldsFromObject(...) end
---@param ... any
---@return any
function GuiViewportCtrl:at(...) end
---@param ... any
---@return any
function GuiViewportCtrl:awaken(...) end
---@param ... any
---@return any
function GuiViewportCtrl:bringObjectToFront(...) end
---@param ... any
---@return any
function GuiViewportCtrl:bringToFront(...) end
---@param ... any
---@return any
function GuiViewportCtrl:clear(...) end
---@param ... any
---@return any
function GuiViewportCtrl:clearFirstResponder(...) end
---@param ... any
---@return any
function GuiViewportCtrl:clone(...) end
---@param ... any
---@return any
function GuiViewportCtrl:controlIsChild(...) end
---@param ... any
---@return any
function GuiViewportCtrl:decRefCount(...) end
---@param ... any
---@return any
function GuiViewportCtrl:delete(...) end
---@param ... any
---@return any
function GuiViewportCtrl:deleteAllObjects(...) end
---@param ... any
---@return any
function GuiViewportCtrl:deleteObject(...) end
---@param ... any
---@return any
function GuiViewportCtrl:deletePersistentId(...) end
---@param ... any
---@return any
function GuiViewportCtrl:dump(...) end
---@param ... any
---@return any
function GuiViewportCtrl:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function GuiViewportCtrl:findObject(...) end
---@param ... any
---@return any
function GuiViewportCtrl:findObjectById(...) end
---@param ... any
---@return any
function GuiViewportCtrl:findObjectByInternalName(...) end
---@param ... any
---@return any
function GuiViewportCtrl:findObjectIdAfter(...) end
---@param ... any
---@return any
function GuiViewportCtrl:generatePersistentId(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getBounds(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getCenter(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getClassDocString(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getClassName(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getCount(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getDeclarationLine(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getDynamicFields(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getExtent(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getField(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getFieldInfo(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getFieldList(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getFields(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getFieldsForEditor(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getFileName(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getFirstResponder(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getGlobalBounds(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getGlobalPosition(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getGroup(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getID(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getId(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getIdString(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getInternalName(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getName(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getObject(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getObjectIndex(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getObjects(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getParent(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getPosition(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getRandom(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getRoot(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getScenetreeData(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function GuiViewportCtrl:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function GuiViewportCtrl:idAt(...) end
---@param ... any
---@return any
function GuiViewportCtrl:incRefCount(...) end
---@param ... any
---@return any
function GuiViewportCtrl:inheritParentFields(...) end
---@param ... any
---@return any
function GuiViewportCtrl:inspectUpdate(...) end
---@param ... any
---@return any
function GuiViewportCtrl:isActive(...) end
---@param ... any
---@return any
function GuiViewportCtrl:isAwake(...) end
---@param ... any
---@return any
function GuiViewportCtrl:isChildOfGroup(...) end
---@param ... any
---@return any
function GuiViewportCtrl:isEditorDirty(...) end
---@param ... any
---@return any
function GuiViewportCtrl:isFirstResponder(...) end
---@param ... any
---@return any
function GuiViewportCtrl:isHidden(...) end
---@param ... any
---@return any
function GuiViewportCtrl:isLocked(...) end
---@param ... any
---@return any
function GuiViewportCtrl:isMember(...) end
---@param ... any
---@return any
function GuiViewportCtrl:isNameChangeAllowed(...) end
---@param ... any
---@return any
function GuiViewportCtrl:isSelected(...) end
---@param ... any
---@return any
function GuiViewportCtrl:isSubClassOf(...) end
---@param ... any
---@return any
function GuiViewportCtrl:isVisible(...) end
---@param ... any
---@return any
function GuiViewportCtrl:listObjects(...) end
---@param ... any
---@return any
function GuiViewportCtrl:onEditorDisable(...) end
---@param ... any
---@return any
function GuiViewportCtrl:onEditorEnable(...) end
---@param ... any
---@return any
function GuiViewportCtrl:postApply(...) end
---@param ... any
---@return any
function GuiViewportCtrl:preApply(...) end
---@param ... any
---@return any
function GuiViewportCtrl:preRender(...) end
---@param ... any
---@return any
function GuiViewportCtrl:project(...) end
---@param ... any
---@return any
function GuiViewportCtrl:pushObjectToBack(...) end
---@param ... any
---@return any
function GuiViewportCtrl:pushToBack(...) end
---@param ... any
---@return any
function GuiViewportCtrl:registerObject(...) end
---@param ... any
---@return any
function GuiViewportCtrl:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function GuiViewportCtrl:remove(...) end
---@param ... any
---@return any
function GuiViewportCtrl:removeObject(...) end
---@param ... any
---@return any
function GuiViewportCtrl:reorderChild(...) end
---@param ... any
---@return any
function GuiViewportCtrl:resize(...) end
---@param ... any
---@return any
function GuiViewportCtrl:save(...) end
---@param ... any
---@return any
function GuiViewportCtrl:serialize(...) end
---@param ... any
---@return any
function GuiViewportCtrl:serializeForEditor(...) end
---@param ... any
---@return any
function GuiViewportCtrl:serializeToDirectories(...) end
---@param ... any
---@return any
function GuiViewportCtrl:serializeToNameDictFile(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setActive(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setCanHit(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setCanSave(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setCenter(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setControlProfile(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setDeclarationLine(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setEditorDirty(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setEditorOnly(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setField(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setFileName(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setFirstResponder(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setFrustumCameraCenterOffset(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setHidden(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setInternalName(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setIsSelected(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setLocked(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setName(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setNameChangeAllowed(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setOrthoMainView(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setPosition(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setPositionGlobal(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setProfile(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setSelected(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setSizing(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setTooltipProfile(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setUpdate(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setValue(...) end
---@param ... any
---@return any
function GuiViewportCtrl:setVisible(...) end
---@param ... any
---@return any
function GuiViewportCtrl:size(...) end
---@param ... any
---@return any
function GuiViewportCtrl:sleep(...) end
---@param ... any
---@return any
function GuiViewportCtrl:sortByName(...) end
---@param ... any
---@return any
function GuiViewportCtrl:unproject(...) end
---@param ... any
---@return any
function GuiViewportCtrl:unproject2(...) end
---@param ... any
---@return any
function GuiViewportCtrl:unregisterObject(...) end

---@class LightAnimData : SimDataBlock
---@field className any
local LightAnimData = {}
---@param ... any
---@return any
function LightAnimData:assignFieldsFromObject(...) end
---@param ... any
---@return any
function LightAnimData:clone(...) end
---@param ... any
---@return any
function LightAnimData:decRefCount(...) end
---@param ... any
---@return any
function LightAnimData:delete(...) end
---@param ... any
---@return any
function LightAnimData:deleteObject(...) end
---@param ... any
---@return any
function LightAnimData:deletePersistentId(...) end
---@param ... any
---@return any
function LightAnimData:dump(...) end
---@param ... any
---@return any
function LightAnimData:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function LightAnimData:generatePersistentId(...) end
---@param ... any
---@return any
function LightAnimData:getClassDocString(...) end
---@param ... any
---@return any
function LightAnimData:getClassName(...) end
---@param ... any
---@return any
function LightAnimData:getDeclarationLine(...) end
---@param ... any
---@return any
function LightAnimData:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function LightAnimData:getDynamicFields(...) end
---@param ... any
---@return any
function LightAnimData:getField(...) end
---@param ... any
---@return any
function LightAnimData:getFieldInfo(...) end
---@param ... any
---@return any
function LightAnimData:getFieldList(...) end
---@param ... any
---@return any
function LightAnimData:getFields(...) end
---@param ... any
---@return any
function LightAnimData:getFieldsForEditor(...) end
---@param ... any
---@return any
function LightAnimData:getFileName(...) end
---@param ... any
---@return any
function LightAnimData:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function LightAnimData:getGroup(...) end
---@param ... any
---@return any
function LightAnimData:getID(...) end
---@param ... any
---@return any
function LightAnimData:getId(...) end
---@param ... any
---@return any
function LightAnimData:getIdString(...) end
---@param ... any
---@return any
function LightAnimData:getInternalName(...) end
---@param ... any
---@return any
function LightAnimData:getName(...) end
---@param ... any
---@return any
function LightAnimData:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function LightAnimData:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function LightAnimData:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function LightAnimData:incRefCount(...) end
---@param ... any
---@return any
function LightAnimData:inheritParentFields(...) end
---@param ... any
---@return any
function LightAnimData:inspectUpdate(...) end
---@param ... any
---@return any
function LightAnimData:isChildOfGroup(...) end
---@param ... any
---@return any
function LightAnimData:isEditorDirty(...) end
---@param ... any
---@return any
function LightAnimData:isHidden(...) end
---@param ... any
---@return any
function LightAnimData:isLocked(...) end
---@param ... any
---@return any
function LightAnimData:isNameChangeAllowed(...) end
---@param ... any
---@return any
function LightAnimData:isSelected(...) end
---@param ... any
---@return any
function LightAnimData:isSubClassOf(...) end
---@param ... any
---@return any
function LightAnimData:onEditorDisable(...) end
---@param ... any
---@return any
function LightAnimData:onEditorEnable(...) end
---@param ... any
---@return any
function LightAnimData:postApply(...) end
---@param ... any
---@return any
function LightAnimData:preApply(...) end
---@param ... any
---@return any
function LightAnimData:registerObject(...) end
---@param ... any
---@return any
function LightAnimData:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function LightAnimData:save(...) end
---@param ... any
---@return any
function LightAnimData:serialize(...) end
---@param ... any
---@return any
function LightAnimData:serializeForEditor(...) end
---@param ... any
---@return any
function LightAnimData:serializeToDirectories(...) end
---@param ... any
---@return any
function LightAnimData:serializeToNameDictFile(...) end
---@param ... any
---@return any
function LightAnimData:setCanSave(...) end
---@param ... any
---@return any
function LightAnimData:setDeclarationLine(...) end
---@param ... any
---@return any
function LightAnimData:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function LightAnimData:setEditorDirty(...) end
---@param ... any
---@return any
function LightAnimData:setEditorOnly(...) end
---@param ... any
---@return any
function LightAnimData:setField(...) end
---@param ... any
---@return any
function LightAnimData:setFileName(...) end
---@param ... any
---@return any
function LightAnimData:setHidden(...) end
---@param ... any
---@return any
function LightAnimData:setInternalName(...) end
---@param ... any
---@return any
function LightAnimData:setIsSelected(...) end
---@param ... any
---@return any
function LightAnimData:setLocked(...) end
---@param ... any
---@return any
function LightAnimData:setName(...) end
---@param ... any
---@return any
function LightAnimData:setNameChangeAllowed(...) end
---@param ... any
---@return any
function LightAnimData:setSelected(...) end
---@param ... any
---@return any
function LightAnimData:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function LightAnimData:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function LightAnimData:unregisterObject(...) end

---@class LightBase : SceneObject
---@field className any
local LightBase = {}
---@param ... any
---@return any
function LightBase:assignFieldsFromObject(...) end
---@param ... any
---@return any
function LightBase:canFloatAboveGround(...) end
---@param ... any
---@return any
function LightBase:clone(...) end
---@param ... any
---@return any
function LightBase:decRefCount(...) end
---@param ... any
---@return any
function LightBase:delete(...) end
---@param ... any
---@return any
function LightBase:deleteObject(...) end
---@param ... any
---@return any
function LightBase:deletePersistentId(...) end
---@param ... any
---@return any
function LightBase:disableCollision(...) end
---@param ... any
---@return any
function LightBase:dump(...) end
---@param ... any
---@return any
function LightBase:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function LightBase:enableCollision(...) end
---@param ... any
---@return any
function LightBase:generatePersistentId(...) end
---@param ... any
---@return any
function LightBase:getAnchorNames(...) end
---@param ... any
---@return any
function LightBase:getClassDocString(...) end
---@param ... any
---@return any
function LightBase:getClassName(...) end
---@param ... any
---@return any
function LightBase:getDeclarationLine(...) end
---@param ... any
---@return any
function LightBase:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function LightBase:getDynamicFields(...) end
---@param ... any
---@return any
function LightBase:getEulerRotation(...) end
---@param ... any
---@return any
function LightBase:getField(...) end
---@param ... any
---@return any
function LightBase:getFieldInfo(...) end
---@param ... any
---@return any
function LightBase:getFieldList(...) end
---@param ... any
---@return any
function LightBase:getFields(...) end
---@param ... any
---@return any
function LightBase:getFieldsForEditor(...) end
---@param ... any
---@return any
function LightBase:getFileName(...) end
---@param ... any
---@return any
function LightBase:getFirstMaterialName(...) end
---@param ... any
---@return any
function LightBase:getForwardVector(...) end
---@param ... any
---@return any
function LightBase:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function LightBase:getGroup(...) end
---@param ... any
---@return any
function LightBase:getID(...) end
---@param ... any
---@return any
function LightBase:getId(...) end
---@param ... any
---@return any
function LightBase:getIdString(...) end
---@param ... any
---@return any
function LightBase:getInternalName(...) end
---@param ... any
---@return any
function LightBase:getLightEnabled(...) end
---@param ... any
---@return any
function LightBase:getMaterialNames(...) end
---@param ... any
---@return any
function LightBase:getMeshMaterialNames(...) end
---@param ... any
---@return any
function LightBase:getName(...) end
---@param ... any
---@return any
function LightBase:getObjBox(...) end
---@param ... any
---@return any
function LightBase:getObjectBox(...) end
---@param ... any
---@return any
function LightBase:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function LightBase:getPosition(...) end
---@param ... any
---@return any
function LightBase:getPositionXYZ(...) end
---@param ... any
---@return any
function LightBase:getRotation(...) end
---@param ... any
---@return any
function LightBase:getScale(...) end
---@param ... any
---@return any
function LightBase:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function LightBase:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function LightBase:getTransform(...) end
---@param ... any
---@return any
function LightBase:getTransformF(...) end
---@param ... any
---@return any
function LightBase:getType(...) end
---@param ... any
---@return any
function LightBase:getWorldBox(...) end
---@param ... any
---@return any
function LightBase:getWorldBoxCenter(...) end
---@param ... any
---@return any
function LightBase:getWorldTransform(...) end
---@param ... any
---@return any
function LightBase:hideInRenderView(...) end
---@param ... any
---@return any
function LightBase:incRefCount(...) end
---@param ... any
---@return any
function LightBase:inheritParentFields(...) end
---@param ... any
---@return any
function LightBase:inspectUpdate(...) end
---@param ... any
---@return any
function LightBase:isChildOfGroup(...) end
---@param ... any
---@return any
function LightBase:isEditorDirty(...) end
---@param ... any
---@return any
function LightBase:isGlobalBounds(...) end
---@param ... any
---@return any
function LightBase:isHidden(...) end
---@param ... any
---@return any
function LightBase:isLocked(...) end
---@param ... any
---@return any
function LightBase:isNameChangeAllowed(...) end
---@param ... any
---@return any
function LightBase:isRenderEnabled(...) end
---@param ... any
---@return any
function LightBase:isSelected(...) end
---@param ... any
---@return any
function LightBase:isSelectionEnabled(...) end
---@param ... any
---@return any
function LightBase:isSubClassOf(...) end
---@param ... any
---@return any
function LightBase:onEditorDisable(...) end
---@param ... any
---@return any
function LightBase:onEditorEnable(...) end
---@param ... any
---@return any
function LightBase:postApply(...) end
---@param ... any
---@return any
function LightBase:preApply(...) end
---@param ... any
---@return any
function LightBase:registerObject(...) end
---@param ... any
---@return any
function LightBase:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function LightBase:renderViewMaskClear(...) end
---@param ... any
---@return any
function LightBase:save(...) end
---@param ... any
---@return any
function LightBase:serialize(...) end
---@param ... any
---@return any
function LightBase:serializeForEditor(...) end
---@param ... any
---@return any
function LightBase:serializeToDirectories(...) end
---@param ... any
---@return any
function LightBase:serializeToNameDictFile(...) end
---@param ... any
---@return any
function LightBase:setCanFloatAboveGround(...) end
---@param ... any
---@return any
function LightBase:setCanSave(...) end
---@param ... any
---@return any
function LightBase:setDeclarationLine(...) end
---@param ... any
---@return any
function LightBase:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function LightBase:setEditorDirty(...) end
---@param ... any
---@return any
function LightBase:setEditorOnly(...) end
---@param ... any
---@return any
function LightBase:setField(...) end
---@param ... any
---@return any
function LightBase:setFileName(...) end
---@param ... any
---@return any
function LightBase:setHidden(...) end
---@param ... any
---@return any
function LightBase:setInternalName(...) end
---@param ... any
---@return any
function LightBase:setIsSelected(...) end
---@param ... any
---@return any
function LightBase:setLightEnabled(...) end
---@param ... any
---@return any
function LightBase:setLocked(...) end
---@param ... any
---@return any
function LightBase:setName(...) end
---@param ... any
---@return any
function LightBase:setNameChangeAllowed(...) end
---@param ... any
---@return any
function LightBase:setPosRot(...) end
---@param ... any
---@return any
function LightBase:setPosition(...) end
---@param ... any
---@return any
function LightBase:setPositionXYZ(...) end
---@param ... any
---@return any
function LightBase:setRenderEnabled(...) end
---@param ... any
---@return any
function LightBase:setScale(...) end
---@param ... any
---@return any
function LightBase:setScaleXYZ(...) end
---@param ... any
---@return any
function LightBase:setSelected(...) end
---@param ... any
---@return any
function LightBase:setSelectionEnabled(...) end
---@param ... any
---@return any
function LightBase:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function LightBase:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function LightBase:setTransform(...) end
---@param ... any
---@return any
function LightBase:setTransformF(...) end
---@param ... any
---@return any
function LightBase:showOnlyInRenderView(...) end
---@param ... any
---@return any
function LightBase:unhideInRenderView(...) end
---@param ... any
---@return any
function LightBase:unregisterObject(...) end

---@class LightFlareData : SimDataBlock
---@field className any
local LightFlareData = {}
---@param ... any
---@return any
function LightFlareData:apply(...) end
---@param ... any
---@return any
function LightFlareData:assignFieldsFromObject(...) end
---@param ... any
---@return any
function LightFlareData:clone(...) end
---@param ... any
---@return any
function LightFlareData:decRefCount(...) end
---@param ... any
---@return any
function LightFlareData:delete(...) end
---@param ... any
---@return any
function LightFlareData:deleteObject(...) end
---@param ... any
---@return any
function LightFlareData:deletePersistentId(...) end
---@param ... any
---@return any
function LightFlareData:dump(...) end
---@param ... any
---@return any
function LightFlareData:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function LightFlareData:generatePersistentId(...) end
---@param ... any
---@return any
function LightFlareData:getClassDocString(...) end
---@param ... any
---@return any
function LightFlareData:getClassName(...) end
---@param ... any
---@return any
function LightFlareData:getDeclarationLine(...) end
---@param ... any
---@return any
function LightFlareData:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function LightFlareData:getDynamicFields(...) end
---@param ... any
---@return any
function LightFlareData:getField(...) end
---@param ... any
---@return any
function LightFlareData:getFieldInfo(...) end
---@param ... any
---@return any
function LightFlareData:getFieldList(...) end
---@param ... any
---@return any
function LightFlareData:getFields(...) end
---@param ... any
---@return any
function LightFlareData:getFieldsForEditor(...) end
---@param ... any
---@return any
function LightFlareData:getFileName(...) end
---@param ... any
---@return any
function LightFlareData:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function LightFlareData:getGroup(...) end
---@param ... any
---@return any
function LightFlareData:getID(...) end
---@param ... any
---@return any
function LightFlareData:getId(...) end
---@param ... any
---@return any
function LightFlareData:getIdString(...) end
---@param ... any
---@return any
function LightFlareData:getInternalName(...) end
---@param ... any
---@return any
function LightFlareData:getName(...) end
---@param ... any
---@return any
function LightFlareData:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function LightFlareData:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function LightFlareData:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function LightFlareData:incRefCount(...) end
---@param ... any
---@return any
function LightFlareData:inheritParentFields(...) end
---@param ... any
---@return any
function LightFlareData:inspectUpdate(...) end
---@param ... any
---@return any
function LightFlareData:isChildOfGroup(...) end
---@param ... any
---@return any
function LightFlareData:isEditorDirty(...) end
---@param ... any
---@return any
function LightFlareData:isHidden(...) end
---@param ... any
---@return any
function LightFlareData:isLocked(...) end
---@param ... any
---@return any
function LightFlareData:isNameChangeAllowed(...) end
---@param ... any
---@return any
function LightFlareData:isSelected(...) end
---@param ... any
---@return any
function LightFlareData:isSubClassOf(...) end
---@param ... any
---@return any
function LightFlareData:onEditorDisable(...) end
---@param ... any
---@return any
function LightFlareData:onEditorEnable(...) end
---@param ... any
---@return any
function LightFlareData:postApply(...) end
---@param ... any
---@return any
function LightFlareData:preApply(...) end
---@param ... any
---@return any
function LightFlareData:registerObject(...) end
---@param ... any
---@return any
function LightFlareData:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function LightFlareData:save(...) end
---@param ... any
---@return any
function LightFlareData:serialize(...) end
---@param ... any
---@return any
function LightFlareData:serializeForEditor(...) end
---@param ... any
---@return any
function LightFlareData:serializeToDirectories(...) end
---@param ... any
---@return any
function LightFlareData:serializeToNameDictFile(...) end
---@param ... any
---@return any
function LightFlareData:setCanSave(...) end
---@param ... any
---@return any
function LightFlareData:setDeclarationLine(...) end
---@param ... any
---@return any
function LightFlareData:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function LightFlareData:setEditorDirty(...) end
---@param ... any
---@return any
function LightFlareData:setEditorOnly(...) end
---@param ... any
---@return any
function LightFlareData:setField(...) end
---@param ... any
---@return any
function LightFlareData:setFileName(...) end
---@param ... any
---@return any
function LightFlareData:setHidden(...) end
---@param ... any
---@return any
function LightFlareData:setInternalName(...) end
---@param ... any
---@return any
function LightFlareData:setIsSelected(...) end
---@param ... any
---@return any
function LightFlareData:setLocked(...) end
---@param ... any
---@return any
function LightFlareData:setName(...) end
---@param ... any
---@return any
function LightFlareData:setNameChangeAllowed(...) end
---@param ... any
---@return any
function LightFlareData:setSelected(...) end
---@param ... any
---@return any
function LightFlareData:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function LightFlareData:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function LightFlareData:unregisterObject(...) end

---@class LoadingManagerClass
---@field __gc any
---@field __index any
local LoadingManagerClass = {}
---@param ... any
---@return any
function LoadingManagerClass:_triggerSignalLevelLoaded(...) end
---@param ... any
---@return any
function LoadingManagerClass:_triggerSignalLoadingScreenInactive(...) end
---@param ... any
---@return any
function LoadingManagerClass:_triggerSignalLevelLoaded(...) end
---@param ... any
---@return any
function LoadingManagerClass:_triggerSignalLoadingScreenInactive(...) end
---@param ... any
---@return any
function LoadingManagerClass:isLoadingInProgress(...) end
---@param ... any
---@return any
function LoadingManagerClass:loadLevelJsonObjects(...) end
---@param ... any
---@return any
function LoadingManagerClass:loadLevelTile(...) end
---@param ... any
---@return any
function LoadingManagerClass:pop(...) end
---@param ... any
---@return any
function LoadingManagerClass:push(...) end
---@param ... any
---@return any
function LoadingManagerClass:setLoadingScreenEnabled(...) end
---@param ... any
---@return any
function LoadingManagerClass:triggerUpdate(...) end

---@class Lua
---@field lastDebugFocusPos any modifiable
---@field userLanguage any modifiable
local Lua = {}
---@param ... any
---@return any
function Lua:dumpStack(...) end
---@param ... any
---@return any
function Lua:exec(...) end
---@param ... any
---@return any
function Lua:findObjectByIdAsTable(...) end
---@param ... any
---@return any
function Lua:findObjectByNameAsTable(...) end
---@param ... any
---@return any
function Lua:findObjectsByClassAsTable(...) end
---@param ... any
---@return any
function Lua:findObjectsBySubClassAsTable(...) end
---@param ... any
---@return any
function Lua:getAllObjects(...) end
---@param ... any
---@return any
function Lua:getFunctionOpcode(...) end
---@param ... any
---@return any
function Lua:getOSLanguage(...) end
---@param ... any
---@return any
function Lua:getSelectedLanguage(...) end
---@param ... any
---@return any
function Lua:getSteamLanguage(...) end
---@param ... any
---@return any
function Lua:log(...) end
---@param ... any
---@return any
function Lua:queueLuaCommand(...) end
---@param ... any
---@return any
function Lua:reloadLanguages(...) end
---@param ... any
---@return any
function Lua:requestReload(...) end
---@param ... any
---@return any
function Lua:saveFunctionOpcode(...) end

---@class Material : BaseMaterial
---@field className any
local Material = {}
---@param ... any
---@return any
function Material:assignFieldsFromObject(...) end
---@param ... any
---@return any
function Material:clone(...) end
---@param ... any
---@return any
function Material:decRefCount(...) end
---@param ... any
---@return any
function Material:delete(...) end
---@param ... any
---@return any
function Material:deleteObject(...) end
---@param ... any
---@return any
function Material:deletePersistentId(...) end
---@param ... any
---@return any
function Material:dump(...) end
---@param ... any
---@return any
function Material:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function Material:dumpInstances(...) end
---@param ... any
---@return any
function Material:flush(...) end
---@param ... any
---@return any
function Material:generatePersistentId(...) end
---@param ... any
---@return any
function Material:getAnimFlags(...) end
---@param ... any
---@return any
function Material:getClassDocString(...) end
---@param ... any
---@return any
function Material:getClassName(...) end
---@param ... any
---@return any
function Material:getDeclarationLine(...) end
---@param ... any
---@return any
function Material:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function Material:getDynamicFields(...) end
---@param ... any
---@return any
function Material:getField(...) end
---@param ... any
---@return any
function Material:getFieldInfo(...) end
---@param ... any
---@return any
function Material:getFieldList(...) end
---@param ... any
---@return any
function Material:getFields(...) end
---@param ... any
---@return any
function Material:getFieldsForEditor(...) end
---@param ... any
---@return any
function Material:getFileName(...) end
---@param ... any
---@return any
function Material:getFilename(...) end
---@param ... any
---@return any
function Material:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function Material:getGroup(...) end
---@param ... any
---@return any
function Material:getID(...) end
---@param ... any
---@return any
function Material:getId(...) end
---@param ... any
---@return any
function Material:getIdString(...) end
---@param ... any
---@return any
function Material:getInternalName(...) end
---@param ... any
---@return any
function Material:getName(...) end
---@param ... any
---@return any
function Material:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function Material:getPath(...) end
---@param ... any
---@return any
function Material:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function Material:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function Material:incRefCount(...) end
---@param ... any
---@return any
function Material:inheritParentFields(...) end
---@param ... any
---@return any
function Material:inspectUpdate(...) end
---@param ... any
---@return any
function Material:isAutoGenerated(...) end
---@param ... any
---@return any
function Material:isChildOfGroup(...) end
---@param ... any
---@return any
function Material:isEditorDirty(...) end
---@param ... any
---@return any
function Material:isHidden(...) end
---@param ... any
---@return any
function Material:isLocked(...) end
---@param ... any
---@return any
function Material:isNameChangeAllowed(...) end
---@param ... any
---@return any
function Material:isSelected(...) end
---@param ... any
---@return any
function Material:isSubClassOf(...) end
---@param ... any
---@return any
function Material:onEditorDisable(...) end
---@param ... any
---@return any
function Material:onEditorEnable(...) end
---@param ... any
---@return any
function Material:postApply(...) end
---@param ... any
---@return any
function Material:preApply(...) end
---@param ... any
---@return any
function Material:registerObject(...) end
---@param ... any
---@return any
function Material:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function Material:reload(...) end
---@param ... any
---@return any
function Material:save(...) end
---@param ... any
---@return any
function Material:serialize(...) end
---@param ... any
---@return any
function Material:serializeForEditor(...) end
---@param ... any
---@return any
function Material:serializeToDirectories(...) end
---@param ... any
---@return any
function Material:serializeToNameDictFile(...) end
---@param ... any
---@return any
function Material:setAutoGenerated(...) end
---@param ... any
---@return any
function Material:setCanSave(...) end
---@param ... any
---@return any
function Material:setDeclarationLine(...) end
---@param ... any
---@return any
function Material:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function Material:setEditorDirty(...) end
---@param ... any
---@return any
function Material:setEditorOnly(...) end
---@param ... any
---@return any
function Material:setField(...) end
---@param ... any
---@return any
function Material:setFileName(...) end
---@param ... any
---@return any
function Material:setFilename(...) end
---@param ... any
---@return any
function Material:setHidden(...) end
---@param ... any
---@return any
function Material:setInternalName(...) end
---@param ... any
---@return any
function Material:setIsSelected(...) end
---@param ... any
---@return any
function Material:setLocked(...) end
---@param ... any
---@return any
function Material:setName(...) end
---@param ... any
---@return any
function Material:setNameChangeAllowed(...) end
---@param ... any
---@return any
function Material:setSelected(...) end
---@param ... any
---@return any
function Material:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function Material:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function Material:unregisterObject(...) end

---@class MissionMarker : ShapeBase
---@field className any
local MissionMarker = {}
---@param ... any
---@return any
function MissionMarker:assignFieldsFromObject(...) end
---@param ... any
---@return any
function MissionMarker:canFloatAboveGround(...) end
---@param ... any
---@return any
function MissionMarker:changeMaterial(...) end
---@param ... any
---@return any
function MissionMarker:clone(...) end
---@param ... any
---@return any
function MissionMarker:decRefCount(...) end
---@param ... any
---@return any
function MissionMarker:delete(...) end
---@param ... any
---@return any
function MissionMarker:deleteObject(...) end
---@param ... any
---@return any
function MissionMarker:deletePersistentId(...) end
---@param ... any
---@return any
function MissionMarker:disableCollision(...) end
---@param ... any
---@return any
function MissionMarker:dump(...) end
---@param ... any
---@return any
function MissionMarker:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function MissionMarker:dumpMeshVisibility(...) end
---@param ... any
---@return any
function MissionMarker:enableCollision(...) end
---@param ... any
---@return any
function MissionMarker:generatePersistentId(...) end
---@param ... any
---@return any
function MissionMarker:getAnchorNames(...) end
---@param ... any
---@return any
function MissionMarker:getClassDocString(...) end
---@param ... any
---@return any
function MissionMarker:getClassName(...) end
---@param ... any
---@return any
function MissionMarker:getDataBlock(...) end
---@param ... any
---@return any
function MissionMarker:getDeclarationLine(...) end
---@param ... any
---@return any
function MissionMarker:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function MissionMarker:getDynamicFields(...) end
---@param ... any
---@return any
function MissionMarker:getEulerRotation(...) end
---@param ... any
---@return any
function MissionMarker:getField(...) end
---@param ... any
---@return any
function MissionMarker:getFieldInfo(...) end
---@param ... any
---@return any
function MissionMarker:getFieldList(...) end
---@param ... any
---@return any
function MissionMarker:getFields(...) end
---@param ... any
---@return any
function MissionMarker:getFieldsForEditor(...) end
---@param ... any
---@return any
function MissionMarker:getFileName(...) end
---@param ... any
---@return any
function MissionMarker:getFirstMaterialName(...) end
---@param ... any
---@return any
function MissionMarker:getForwardVector(...) end
---@param ... any
---@return any
function MissionMarker:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function MissionMarker:getGroup(...) end
---@param ... any
---@return any
function MissionMarker:getID(...) end
---@param ... any
---@return any
function MissionMarker:getId(...) end
---@param ... any
---@return any
function MissionMarker:getIdString(...) end
---@param ... any
---@return any
function MissionMarker:getInternalName(...) end
---@param ... any
---@return any
function MissionMarker:getMaterialNames(...) end
---@param ... any
---@return any
function MissionMarker:getMeshMaterialNames(...) end
---@param ... any
---@return any
function MissionMarker:getModelFile(...) end
---@param ... any
---@return any
function MissionMarker:getName(...) end
---@param ... any
---@return any
function MissionMarker:getObjBox(...) end
---@param ... any
---@return any
function MissionMarker:getObjectBox(...) end
---@param ... any
---@return any
function MissionMarker:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function MissionMarker:getPosition(...) end
---@param ... any
---@return any
function MissionMarker:getPositionXYZ(...) end
---@param ... any
---@return any
function MissionMarker:getRotation(...) end
---@param ... any
---@return any
function MissionMarker:getScale(...) end
---@param ... any
---@return any
function MissionMarker:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function MissionMarker:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function MissionMarker:getTargetCount(...) end
---@param ... any
---@return any
function MissionMarker:getTargetName(...) end
---@param ... any
---@return any
function MissionMarker:getTransform(...) end
---@param ... any
---@return any
function MissionMarker:getTransformF(...) end
---@param ... any
---@return any
function MissionMarker:getType(...) end
---@param ... any
---@return any
function MissionMarker:getVelocity(...) end
---@param ... any
---@return any
function MissionMarker:getWorldBox(...) end
---@param ... any
---@return any
function MissionMarker:getWorldBoxCenter(...) end
---@param ... any
---@return any
function MissionMarker:getWorldTransform(...) end
---@param ... any
---@return any
function MissionMarker:hideInRenderView(...) end
---@param ... any
---@return any
function MissionMarker:incRefCount(...) end
---@param ... any
---@return any
function MissionMarker:inheritParentFields(...) end
---@param ... any
---@return any
function MissionMarker:inspectUpdate(...) end
---@param ... any
---@return any
function MissionMarker:isChildOfGroup(...) end
---@param ... any
---@return any
function MissionMarker:isEditorDirty(...) end
---@param ... any
---@return any
function MissionMarker:isGlobalBounds(...) end
---@param ... any
---@return any
function MissionMarker:isHidden(...) end
---@param ... any
---@return any
function MissionMarker:isLocked(...) end
---@param ... any
---@return any
function MissionMarker:isNameChangeAllowed(...) end
---@param ... any
---@return any
function MissionMarker:isRenderEnabled(...) end
---@param ... any
---@return any
function MissionMarker:isSelected(...) end
---@param ... any
---@return any
function MissionMarker:isSelectionEnabled(...) end
---@param ... any
---@return any
function MissionMarker:isSubClassOf(...) end
---@param ... any
---@return any
function MissionMarker:onEditorDisable(...) end
---@param ... any
---@return any
function MissionMarker:onEditorEnable(...) end
---@param ... any
---@return any
function MissionMarker:pauseThread(...) end
---@param ... any
---@return any
function MissionMarker:playAudio(...) end
---@param ... any
---@return any
function MissionMarker:playThread(...) end
---@param ... any
---@return any
function MissionMarker:postApply(...) end
---@param ... any
---@return any
function MissionMarker:preApply(...) end
---@param ... any
---@return any
function MissionMarker:registerObject(...) end
---@param ... any
---@return any
function MissionMarker:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function MissionMarker:renderViewMaskClear(...) end
---@param ... any
---@return any
function MissionMarker:save(...) end
---@param ... any
---@return any
function MissionMarker:serialize(...) end
---@param ... any
---@return any
function MissionMarker:serializeForEditor(...) end
---@param ... any
---@return any
function MissionMarker:serializeToDirectories(...) end
---@param ... any
---@return any
function MissionMarker:serializeToNameDictFile(...) end
---@param ... any
---@return any
function MissionMarker:setAllMeshesHidden(...) end
---@param ... any
---@return any
function MissionMarker:setCanFloatAboveGround(...) end
---@param ... any
---@return any
function MissionMarker:setCanSave(...) end
---@param ... any
---@return any
function MissionMarker:setDataBlock(...) end
---@param ... any
---@return any
function MissionMarker:setDeclarationLine(...) end
---@param ... any
---@return any
function MissionMarker:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function MissionMarker:setEditorDirty(...) end
---@param ... any
---@return any
function MissionMarker:setEditorOnly(...) end
---@param ... any
---@return any
function MissionMarker:setField(...) end
---@param ... any
---@return any
function MissionMarker:setFileName(...) end
---@param ... any
---@return any
function MissionMarker:setHidden(...) end
---@param ... any
---@return any
function MissionMarker:setInternalName(...) end
---@param ... any
---@return any
function MissionMarker:setIsSelected(...) end
---@param ... any
---@return any
function MissionMarker:setLocked(...) end
---@param ... any
---@return any
function MissionMarker:setMeshHidden(...) end
---@param ... any
---@return any
function MissionMarker:setName(...) end
---@param ... any
---@return any
function MissionMarker:setNameChangeAllowed(...) end
---@param ... any
---@return any
function MissionMarker:setPosRot(...) end
---@param ... any
---@return any
function MissionMarker:setPosition(...) end
---@param ... any
---@return any
function MissionMarker:setPositionXYZ(...) end
---@param ... any
---@return any
function MissionMarker:setRenderEnabled(...) end
---@param ... any
---@return any
function MissionMarker:setScale(...) end
---@param ... any
---@return any
function MissionMarker:setScaleXYZ(...) end
---@param ... any
---@return any
function MissionMarker:setSelected(...) end
---@param ... any
---@return any
function MissionMarker:setSelectionEnabled(...) end
---@param ... any
---@return any
function MissionMarker:setShapeName(...) end
---@param ... any
---@return any
function MissionMarker:setSkinName(...) end
---@param ... any
---@return any
function MissionMarker:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function MissionMarker:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function MissionMarker:setThreadDir(...) end
---@param ... any
---@return any
function MissionMarker:setThreadPosition(...) end
---@param ... any
---@return any
function MissionMarker:setThreadTimeScale(...) end
---@param ... any
---@return any
function MissionMarker:setTransform(...) end
---@param ... any
---@return any
function MissionMarker:setTransformF(...) end
---@param ... any
---@return any
function MissionMarker:setVelocity(...) end
---@param ... any
---@return any
function MissionMarker:showOnlyInRenderView(...) end
---@param ... any
---@return any
function MissionMarker:stopAudio(...) end
---@param ... any
---@return any
function MissionMarker:stopThread(...) end
---@param ... any
---@return any
function MissionMarker:unhideInRenderView(...) end
---@param ... any
---@return any
function MissionMarker:unregisterObject(...) end

---@class MissionMarkerData : ShapeBaseData
---@field className any
local MissionMarkerData = {}
---@param ... any
---@return any
function MissionMarkerData:assignFieldsFromObject(...) end
---@param ... any
---@return any
function MissionMarkerData:clone(...) end
---@param ... any
---@return any
function MissionMarkerData:decRefCount(...) end
---@param ... any
---@return any
function MissionMarkerData:delete(...) end
---@param ... any
---@return any
function MissionMarkerData:deleteObject(...) end
---@param ... any
---@return any
function MissionMarkerData:deletePersistentId(...) end
---@param ... any
---@return any
function MissionMarkerData:dump(...) end
---@param ... any
---@return any
function MissionMarkerData:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function MissionMarkerData:generatePersistentId(...) end
---@param ... any
---@return any
function MissionMarkerData:getClassDocString(...) end
---@param ... any
---@return any
function MissionMarkerData:getClassName(...) end
---@param ... any
---@return any
function MissionMarkerData:getDeclarationLine(...) end
---@param ... any
---@return any
function MissionMarkerData:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function MissionMarkerData:getDynamicFields(...) end
---@param ... any
---@return any
function MissionMarkerData:getField(...) end
---@param ... any
---@return any
function MissionMarkerData:getFieldInfo(...) end
---@param ... any
---@return any
function MissionMarkerData:getFieldList(...) end
---@param ... any
---@return any
function MissionMarkerData:getFields(...) end
---@param ... any
---@return any
function MissionMarkerData:getFieldsForEditor(...) end
---@param ... any
---@return any
function MissionMarkerData:getFileName(...) end
---@param ... any
---@return any
function MissionMarkerData:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function MissionMarkerData:getGroup(...) end
---@param ... any
---@return any
function MissionMarkerData:getID(...) end
---@param ... any
---@return any
function MissionMarkerData:getId(...) end
---@param ... any
---@return any
function MissionMarkerData:getIdString(...) end
---@param ... any
---@return any
function MissionMarkerData:getInternalName(...) end
---@param ... any
---@return any
function MissionMarkerData:getName(...) end
---@param ... any
---@return any
function MissionMarkerData:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function MissionMarkerData:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function MissionMarkerData:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function MissionMarkerData:incRefCount(...) end
---@param ... any
---@return any
function MissionMarkerData:inheritParentFields(...) end
---@param ... any
---@return any
function MissionMarkerData:inspectUpdate(...) end
---@param ... any
---@return any
function MissionMarkerData:isChildOfGroup(...) end
---@param ... any
---@return any
function MissionMarkerData:isEditorDirty(...) end
---@param ... any
---@return any
function MissionMarkerData:isHidden(...) end
---@param ... any
---@return any
function MissionMarkerData:isLocked(...) end
---@param ... any
---@return any
function MissionMarkerData:isNameChangeAllowed(...) end
---@param ... any
---@return any
function MissionMarkerData:isSelected(...) end
---@param ... any
---@return any
function MissionMarkerData:isSubClassOf(...) end
---@param ... any
---@return any
function MissionMarkerData:onEditorDisable(...) end
---@param ... any
---@return any
function MissionMarkerData:onEditorEnable(...) end
---@param ... any
---@return any
function MissionMarkerData:postApply(...) end
---@param ... any
---@return any
function MissionMarkerData:preApply(...) end
---@param ... any
---@return any
function MissionMarkerData:registerObject(...) end
---@param ... any
---@return any
function MissionMarkerData:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function MissionMarkerData:save(...) end
---@param ... any
---@return any
function MissionMarkerData:serialize(...) end
---@param ... any
---@return any
function MissionMarkerData:serializeForEditor(...) end
---@param ... any
---@return any
function MissionMarkerData:serializeToDirectories(...) end
---@param ... any
---@return any
function MissionMarkerData:serializeToNameDictFile(...) end
---@param ... any
---@return any
function MissionMarkerData:setCanSave(...) end
---@param ... any
---@return any
function MissionMarkerData:setDeclarationLine(...) end
---@param ... any
---@return any
function MissionMarkerData:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function MissionMarkerData:setEditorDirty(...) end
---@param ... any
---@return any
function MissionMarkerData:setEditorOnly(...) end
---@param ... any
---@return any
function MissionMarkerData:setField(...) end
---@param ... any
---@return any
function MissionMarkerData:setFileName(...) end
---@param ... any
---@return any
function MissionMarkerData:setHidden(...) end
---@param ... any
---@return any
function MissionMarkerData:setInternalName(...) end
---@param ... any
---@return any
function MissionMarkerData:setIsSelected(...) end
---@param ... any
---@return any
function MissionMarkerData:setLocked(...) end
---@param ... any
---@return any
function MissionMarkerData:setName(...) end
---@param ... any
---@return any
function MissionMarkerData:setNameChangeAllowed(...) end
---@param ... any
---@return any
function MissionMarkerData:setSelected(...) end
---@param ... any
---@return any
function MissionMarkerData:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function MissionMarkerData:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function MissionMarkerData:unregisterObject(...) end

---@class ParticleData : SimDataBlock
---@field className any
local ParticleData = {}
---@param ... any
---@return any
function ParticleData:assignFieldsFromObject(...) end
---@param ... any
---@return any
function ParticleData:clone(...) end
---@param ... any
---@return any
function ParticleData:decRefCount(...) end
---@param ... any
---@return any
function ParticleData:delete(...) end
---@param ... any
---@return any
function ParticleData:deleteObject(...) end
---@param ... any
---@return any
function ParticleData:deletePersistentId(...) end
---@param ... any
---@return any
function ParticleData:dump(...) end
---@param ... any
---@return any
function ParticleData:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function ParticleData:generatePersistentId(...) end
---@param ... any
---@return any
function ParticleData:getClassDocString(...) end
---@param ... any
---@return any
function ParticleData:getClassName(...) end
---@param ... any
---@return any
function ParticleData:getDeclarationLine(...) end
---@param ... any
---@return any
function ParticleData:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function ParticleData:getDynamicFields(...) end
---@param ... any
---@return any
function ParticleData:getField(...) end
---@param ... any
---@return any
function ParticleData:getFieldInfo(...) end
---@param ... any
---@return any
function ParticleData:getFieldList(...) end
---@param ... any
---@return any
function ParticleData:getFields(...) end
---@param ... any
---@return any
function ParticleData:getFieldsForEditor(...) end
---@param ... any
---@return any
function ParticleData:getFileName(...) end
---@param ... any
---@return any
function ParticleData:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function ParticleData:getGroup(...) end
---@param ... any
---@return any
function ParticleData:getID(...) end
---@param ... any
---@return any
function ParticleData:getId(...) end
---@param ... any
---@return any
function ParticleData:getIdString(...) end
---@param ... any
---@return any
function ParticleData:getInternalName(...) end
---@param ... any
---@return any
function ParticleData:getName(...) end
---@param ... any
---@return any
function ParticleData:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function ParticleData:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function ParticleData:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function ParticleData:incRefCount(...) end
---@param ... any
---@return any
function ParticleData:inheritParentFields(...) end
---@param ... any
---@return any
function ParticleData:inspectUpdate(...) end
---@param ... any
---@return any
function ParticleData:isChildOfGroup(...) end
---@param ... any
---@return any
function ParticleData:isEditorDirty(...) end
---@param ... any
---@return any
function ParticleData:isHidden(...) end
---@param ... any
---@return any
function ParticleData:isLocked(...) end
---@param ... any
---@return any
function ParticleData:isNameChangeAllowed(...) end
---@param ... any
---@return any
function ParticleData:isSelected(...) end
---@param ... any
---@return any
function ParticleData:isSubClassOf(...) end
---@param ... any
---@return any
function ParticleData:onEditorDisable(...) end
---@param ... any
---@return any
function ParticleData:onEditorEnable(...) end
---@param ... any
---@return any
function ParticleData:postApply(...) end
---@param ... any
---@return any
function ParticleData:preApply(...) end
---@param ... any
---@return any
function ParticleData:registerObject(...) end
---@param ... any
---@return any
function ParticleData:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function ParticleData:reload(...) end
---@param ... any
---@return any
function ParticleData:save(...) end
---@param ... any
---@return any
function ParticleData:serialize(...) end
---@param ... any
---@return any
function ParticleData:serializeForEditor(...) end
---@param ... any
---@return any
function ParticleData:serializeToDirectories(...) end
---@param ... any
---@return any
function ParticleData:serializeToNameDictFile(...) end
---@param ... any
---@return any
function ParticleData:setCanSave(...) end
---@param ... any
---@return any
function ParticleData:setDeclarationLine(...) end
---@param ... any
---@return any
function ParticleData:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function ParticleData:setEditorDirty(...) end
---@param ... any
---@return any
function ParticleData:setEditorOnly(...) end
---@param ... any
---@return any
function ParticleData:setField(...) end
---@param ... any
---@return any
function ParticleData:setFileName(...) end
---@param ... any
---@return any
function ParticleData:setHidden(...) end
---@param ... any
---@return any
function ParticleData:setInternalName(...) end
---@param ... any
---@return any
function ParticleData:setIsSelected(...) end
---@param ... any
---@return any
function ParticleData:setLocked(...) end
---@param ... any
---@return any
function ParticleData:setName(...) end
---@param ... any
---@return any
function ParticleData:setNameChangeAllowed(...) end
---@param ... any
---@return any
function ParticleData:setSelected(...) end
---@param ... any
---@return any
function ParticleData:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function ParticleData:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function ParticleData:unregisterObject(...) end

---@class ParticleEmitterData : GameBaseData
---@field className any
local ParticleEmitterData = {}
---@param ... any
---@return any
function ParticleEmitterData:assignFieldsFromObject(...) end
---@param ... any
---@return any
function ParticleEmitterData:clone(...) end
---@param ... any
---@return any
function ParticleEmitterData:decRefCount(...) end
---@param ... any
---@return any
function ParticleEmitterData:delete(...) end
---@param ... any
---@return any
function ParticleEmitterData:deleteObject(...) end
---@param ... any
---@return any
function ParticleEmitterData:deletePersistentId(...) end
---@param ... any
---@return any
function ParticleEmitterData:dump(...) end
---@param ... any
---@return any
function ParticleEmitterData:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function ParticleEmitterData:generatePersistentId(...) end
---@param ... any
---@return any
function ParticleEmitterData:getClassDocString(...) end
---@param ... any
---@return any
function ParticleEmitterData:getClassName(...) end
---@param ... any
---@return any
function ParticleEmitterData:getDeclarationLine(...) end
---@param ... any
---@return any
function ParticleEmitterData:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function ParticleEmitterData:getDynamicFields(...) end
---@param ... any
---@return any
function ParticleEmitterData:getField(...) end
---@param ... any
---@return any
function ParticleEmitterData:getFieldInfo(...) end
---@param ... any
---@return any
function ParticleEmitterData:getFieldList(...) end
---@param ... any
---@return any
function ParticleEmitterData:getFields(...) end
---@param ... any
---@return any
function ParticleEmitterData:getFieldsForEditor(...) end
---@param ... any
---@return any
function ParticleEmitterData:getFileName(...) end
---@param ... any
---@return any
function ParticleEmitterData:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function ParticleEmitterData:getGroup(...) end
---@param ... any
---@return any
function ParticleEmitterData:getID(...) end
---@param ... any
---@return any
function ParticleEmitterData:getId(...) end
---@param ... any
---@return any
function ParticleEmitterData:getIdString(...) end
---@param ... any
---@return any
function ParticleEmitterData:getInternalName(...) end
---@param ... any
---@return any
function ParticleEmitterData:getName(...) end
---@param ... any
---@return any
function ParticleEmitterData:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function ParticleEmitterData:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function ParticleEmitterData:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function ParticleEmitterData:incRefCount(...) end
---@param ... any
---@return any
function ParticleEmitterData:inheritParentFields(...) end
---@param ... any
---@return any
function ParticleEmitterData:inspectUpdate(...) end
---@param ... any
---@return any
function ParticleEmitterData:isChildOfGroup(...) end
---@param ... any
---@return any
function ParticleEmitterData:isEditorDirty(...) end
---@param ... any
---@return any
function ParticleEmitterData:isHidden(...) end
---@param ... any
---@return any
function ParticleEmitterData:isLocked(...) end
---@param ... any
---@return any
function ParticleEmitterData:isNameChangeAllowed(...) end
---@param ... any
---@return any
function ParticleEmitterData:isSelected(...) end
---@param ... any
---@return any
function ParticleEmitterData:isSubClassOf(...) end
---@param ... any
---@return any
function ParticleEmitterData:onEditorDisable(...) end
---@param ... any
---@return any
function ParticleEmitterData:onEditorEnable(...) end
---@param ... any
---@return any
function ParticleEmitterData:postApply(...) end
---@param ... any
---@return any
function ParticleEmitterData:preApply(...) end
---@param ... any
---@return any
function ParticleEmitterData:registerObject(...) end
---@param ... any
---@return any
function ParticleEmitterData:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function ParticleEmitterData:reload(...) end
---@param ... any
---@return any
function ParticleEmitterData:save(...) end
---@param ... any
---@return any
function ParticleEmitterData:serialize(...) end
---@param ... any
---@return any
function ParticleEmitterData:serializeForEditor(...) end
---@param ... any
---@return any
function ParticleEmitterData:serializeToDirectories(...) end
---@param ... any
---@return any
function ParticleEmitterData:serializeToNameDictFile(...) end
---@param ... any
---@return any
function ParticleEmitterData:setCanSave(...) end
---@param ... any
---@return any
function ParticleEmitterData:setDeclarationLine(...) end
---@param ... any
---@return any
function ParticleEmitterData:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function ParticleEmitterData:setEditorDirty(...) end
---@param ... any
---@return any
function ParticleEmitterData:setEditorOnly(...) end
---@param ... any
---@return any
function ParticleEmitterData:setField(...) end
---@param ... any
---@return any
function ParticleEmitterData:setFileName(...) end
---@param ... any
---@return any
function ParticleEmitterData:setHidden(...) end
---@param ... any
---@return any
function ParticleEmitterData:setInternalName(...) end
---@param ... any
---@return any
function ParticleEmitterData:setIsSelected(...) end
---@param ... any
---@return any
function ParticleEmitterData:setLocked(...) end
---@param ... any
---@return any
function ParticleEmitterData:setName(...) end
---@param ... any
---@return any
function ParticleEmitterData:setNameChangeAllowed(...) end
---@param ... any
---@return any
function ParticleEmitterData:setSelected(...) end
---@param ... any
---@return any
function ParticleEmitterData:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function ParticleEmitterData:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function ParticleEmitterData:unregisterObject(...) end

---@class ParticleEmitterNode : GameBase
---@field className any
local ParticleEmitterNode = {}
---@param ... any
---@return any
function ParticleEmitterNode:assignFieldsFromObject(...) end
---@param ... any
---@return any
function ParticleEmitterNode:canFloatAboveGround(...) end
---@param ... any
---@return any
function ParticleEmitterNode:clone(...) end
---@param ... any
---@return any
function ParticleEmitterNode:decRefCount(...) end
---@param ... any
---@return any
function ParticleEmitterNode:delete(...) end
---@param ... any
---@return any
function ParticleEmitterNode:deleteObject(...) end
---@param ... any
---@return any
function ParticleEmitterNode:deletePersistentId(...) end
---@param ... any
---@return any
function ParticleEmitterNode:disableCollision(...) end
---@param ... any
---@return any
function ParticleEmitterNode:dump(...) end
---@param ... any
---@return any
function ParticleEmitterNode:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function ParticleEmitterNode:enableCollision(...) end
---@param ... any
---@return any
function ParticleEmitterNode:generatePersistentId(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getAnchorNames(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getClassDocString(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getClassName(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getDataBlock(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getDeclarationLine(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getDynamicFields(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getEulerRotation(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getField(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getFieldInfo(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getFieldList(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getFields(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getFieldsForEditor(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getFileName(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getFirstMaterialName(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getForwardVector(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getGroup(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getID(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getId(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getIdString(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getInternalName(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getMaterialNames(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getMeshMaterialNames(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getName(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getObjBox(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getObjectBox(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getParticleEmitterId(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getPosition(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getPositionXYZ(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getRotation(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getScale(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getTransform(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getTransformF(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getType(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getWorldBox(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getWorldBoxCenter(...) end
---@param ... any
---@return any
function ParticleEmitterNode:getWorldTransform(...) end
---@param ... any
---@return any
function ParticleEmitterNode:hideInRenderView(...) end
---@param ... any
---@return any
function ParticleEmitterNode:incRefCount(...) end
---@param ... any
---@return any
function ParticleEmitterNode:inheritParentFields(...) end
---@param ... any
---@return any
function ParticleEmitterNode:inspectUpdate(...) end
---@param ... any
---@return any
function ParticleEmitterNode:isChildOfGroup(...) end
---@param ... any
---@return any
function ParticleEmitterNode:isEditorDirty(...) end
---@param ... any
---@return any
function ParticleEmitterNode:isGlobalBounds(...) end
---@param ... any
---@return any
function ParticleEmitterNode:isHidden(...) end
---@param ... any
---@return any
function ParticleEmitterNode:isLocked(...) end
---@param ... any
---@return any
function ParticleEmitterNode:isNameChangeAllowed(...) end
---@param ... any
---@return any
function ParticleEmitterNode:isRenderEnabled(...) end
---@param ... any
---@return any
function ParticleEmitterNode:isSelected(...) end
---@param ... any
---@return any
function ParticleEmitterNode:isSelectionEnabled(...) end
---@param ... any
---@return any
function ParticleEmitterNode:isSubClassOf(...) end
---@param ... any
---@return any
function ParticleEmitterNode:onEditorDisable(...) end
---@param ... any
---@return any
function ParticleEmitterNode:onEditorEnable(...) end
---@param ... any
---@return any
function ParticleEmitterNode:postApply(...) end
---@param ... any
---@return any
function ParticleEmitterNode:preApply(...) end
---@param ... any
---@return any
function ParticleEmitterNode:registerObject(...) end
---@param ... any
---@return any
function ParticleEmitterNode:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function ParticleEmitterNode:renderViewMaskClear(...) end
---@param ... any
---@return any
function ParticleEmitterNode:save(...) end
---@param ... any
---@return any
function ParticleEmitterNode:serialize(...) end
---@param ... any
---@return any
function ParticleEmitterNode:serializeForEditor(...) end
---@param ... any
---@return any
function ParticleEmitterNode:serializeToDirectories(...) end
---@param ... any
---@return any
function ParticleEmitterNode:serializeToNameDictFile(...) end
---@param ... any
---@return any
function ParticleEmitterNode:setActive(...) end
---@param ... any
---@return any
function ParticleEmitterNode:setCanFloatAboveGround(...) end
---@param ... any
---@return any
function ParticleEmitterNode:setCanSave(...) end
---@param ... any
---@return any
function ParticleEmitterNode:setDataBlock(...) end
---@param ... any
---@return any
function ParticleEmitterNode:setDeclarationLine(...) end
---@param ... any
---@return any
function ParticleEmitterNode:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function ParticleEmitterNode:setEditorDirty(...) end
---@param ... any
---@return any
function ParticleEmitterNode:setEditorOnly(...) end
---@param ... any
---@return any
function ParticleEmitterNode:setEmitterDataBlock(...) end
---@param ... any
---@return any
function ParticleEmitterNode:setField(...) end
---@param ... any
---@return any
function ParticleEmitterNode:setFileName(...) end
---@param ... any
---@return any
function ParticleEmitterNode:setHidden(...) end
---@param ... any
---@return any
function ParticleEmitterNode:setInternalName(...) end
---@param ... any
---@return any
function ParticleEmitterNode:setIsSelected(...) end
---@param ... any
---@return any
function ParticleEmitterNode:setLocked(...) end
---@param ... any
---@return any
function ParticleEmitterNode:setName(...) end
---@param ... any
---@return any
function ParticleEmitterNode:setNameChangeAllowed(...) end
---@param ... any
---@return any
function ParticleEmitterNode:setPosRot(...) end
---@param ... any
---@return any
function ParticleEmitterNode:setPosition(...) end
---@param ... any
---@return any
function ParticleEmitterNode:setPositionXYZ(...) end
---@param ... any
---@return any
function ParticleEmitterNode:setRenderEnabled(...) end
---@param ... any
---@return any
function ParticleEmitterNode:setScale(...) end
---@param ... any
---@return any
function ParticleEmitterNode:setScaleXYZ(...) end
---@param ... any
---@return any
function ParticleEmitterNode:setSelected(...) end
---@param ... any
---@return any
function ParticleEmitterNode:setSelectionEnabled(...) end
---@param ... any
---@return any
function ParticleEmitterNode:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function ParticleEmitterNode:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function ParticleEmitterNode:setTransform(...) end
---@param ... any
---@return any
function ParticleEmitterNode:setTransformF(...) end
---@param ... any
---@return any
function ParticleEmitterNode:showOnlyInRenderView(...) end
---@param ... any
---@return any
function ParticleEmitterNode:unhideInRenderView(...) end
---@param ... any
---@return any
function ParticleEmitterNode:unregisterObject(...) end

---@class ParticleEmitterNodeData : GameBaseData
---@field className any
local ParticleEmitterNodeData = {}
---@param ... any
---@return any
function ParticleEmitterNodeData:assignFieldsFromObject(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:clone(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:decRefCount(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:delete(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:deleteObject(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:deletePersistentId(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:dump(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:generatePersistentId(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:getClassDocString(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:getClassName(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:getDeclarationLine(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:getDynamicFields(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:getField(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:getFieldInfo(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:getFieldList(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:getFields(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:getFieldsForEditor(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:getFileName(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:getGroup(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:getID(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:getId(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:getIdString(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:getInternalName(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:getName(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:incRefCount(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:inheritParentFields(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:inspectUpdate(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:isChildOfGroup(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:isEditorDirty(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:isHidden(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:isLocked(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:isNameChangeAllowed(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:isSelected(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:isSubClassOf(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:onEditorDisable(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:onEditorEnable(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:postApply(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:preApply(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:registerObject(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:save(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:serialize(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:serializeForEditor(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:serializeToDirectories(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:serializeToNameDictFile(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:setCanSave(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:setDeclarationLine(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:setEditorDirty(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:setEditorOnly(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:setField(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:setFileName(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:setHidden(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:setInternalName(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:setIsSelected(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:setLocked(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:setName(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:setNameChangeAllowed(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:setSelected(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function ParticleEmitterNodeData:unregisterObject(...) end

---@class PlatformSwitches
---@field audioFolderName any modifiable
---@field priority any modifiable
---@field settingsJsonPath any modifiable
---@field useEditor any modifiable
---@field useJit any modifiable
local PlatformSwitches = {}

---@class PlayerData : ShapeBaseData
---@field className any
local PlayerData = {}
---@param ... any
---@return any
function PlayerData:assignFieldsFromObject(...) end
---@param ... any
---@return any
function PlayerData:clone(...) end
---@param ... any
---@return any
function PlayerData:decRefCount(...) end
---@param ... any
---@return any
function PlayerData:delete(...) end
---@param ... any
---@return any
function PlayerData:deleteObject(...) end
---@param ... any
---@return any
function PlayerData:deletePersistentId(...) end
---@param ... any
---@return any
function PlayerData:dump(...) end
---@param ... any
---@return any
function PlayerData:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function PlayerData:generatePersistentId(...) end
---@param ... any
---@return any
function PlayerData:getClassDocString(...) end
---@param ... any
---@return any
function PlayerData:getClassName(...) end
---@param ... any
---@return any
function PlayerData:getDeclarationLine(...) end
---@param ... any
---@return any
function PlayerData:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function PlayerData:getDynamicFields(...) end
---@param ... any
---@return any
function PlayerData:getField(...) end
---@param ... any
---@return any
function PlayerData:getFieldInfo(...) end
---@param ... any
---@return any
function PlayerData:getFieldList(...) end
---@param ... any
---@return any
function PlayerData:getFields(...) end
---@param ... any
---@return any
function PlayerData:getFieldsForEditor(...) end
---@param ... any
---@return any
function PlayerData:getFileName(...) end
---@param ... any
---@return any
function PlayerData:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function PlayerData:getGroup(...) end
---@param ... any
---@return any
function PlayerData:getID(...) end
---@param ... any
---@return any
function PlayerData:getId(...) end
---@param ... any
---@return any
function PlayerData:getIdString(...) end
---@param ... any
---@return any
function PlayerData:getInternalName(...) end
---@param ... any
---@return any
function PlayerData:getName(...) end
---@param ... any
---@return any
function PlayerData:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function PlayerData:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PlayerData:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PlayerData:incRefCount(...) end
---@param ... any
---@return any
function PlayerData:inheritParentFields(...) end
---@param ... any
---@return any
function PlayerData:inspectUpdate(...) end
---@param ... any
---@return any
function PlayerData:isChildOfGroup(...) end
---@param ... any
---@return any
function PlayerData:isEditorDirty(...) end
---@param ... any
---@return any
function PlayerData:isHidden(...) end
---@param ... any
---@return any
function PlayerData:isLocked(...) end
---@param ... any
---@return any
function PlayerData:isNameChangeAllowed(...) end
---@param ... any
---@return any
function PlayerData:isSelected(...) end
---@param ... any
---@return any
function PlayerData:isSubClassOf(...) end
---@param ... any
---@return any
function PlayerData:onEditorDisable(...) end
---@param ... any
---@return any
function PlayerData:onEditorEnable(...) end
---@param ... any
---@return any
function PlayerData:postApply(...) end
---@param ... any
---@return any
function PlayerData:preApply(...) end
---@param ... any
---@return any
function PlayerData:registerObject(...) end
---@param ... any
---@return any
function PlayerData:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function PlayerData:save(...) end
---@param ... any
---@return any
function PlayerData:serialize(...) end
---@param ... any
---@return any
function PlayerData:serializeForEditor(...) end
---@param ... any
---@return any
function PlayerData:serializeToDirectories(...) end
---@param ... any
---@return any
function PlayerData:serializeToNameDictFile(...) end
---@param ... any
---@return any
function PlayerData:setCanSave(...) end
---@param ... any
---@return any
function PlayerData:setDeclarationLine(...) end
---@param ... any
---@return any
function PlayerData:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function PlayerData:setEditorDirty(...) end
---@param ... any
---@return any
function PlayerData:setEditorOnly(...) end
---@param ... any
---@return any
function PlayerData:setField(...) end
---@param ... any
---@return any
function PlayerData:setFileName(...) end
---@param ... any
---@return any
function PlayerData:setHidden(...) end
---@param ... any
---@return any
function PlayerData:setInternalName(...) end
---@param ... any
---@return any
function PlayerData:setIsSelected(...) end
---@param ... any
---@return any
function PlayerData:setLocked(...) end
---@param ... any
---@return any
function PlayerData:setName(...) end
---@param ... any
---@return any
function PlayerData:setNameChangeAllowed(...) end
---@param ... any
---@return any
function PlayerData:setSelected(...) end
---@param ... any
---@return any
function PlayerData:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PlayerData:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PlayerData:unregisterObject(...) end

---@class PointLight : LightBase
---@field className any
local PointLight = {}
---@param ... any
---@return any
function PointLight:assignFieldsFromObject(...) end
---@param ... any
---@return any
function PointLight:canFloatAboveGround(...) end
---@param ... any
---@return any
function PointLight:clone(...) end
---@param ... any
---@return any
function PointLight:decRefCount(...) end
---@param ... any
---@return any
function PointLight:delete(...) end
---@param ... any
---@return any
function PointLight:deleteObject(...) end
---@param ... any
---@return any
function PointLight:deletePersistentId(...) end
---@param ... any
---@return any
function PointLight:disableCollision(...) end
---@param ... any
---@return any
function PointLight:dump(...) end
---@param ... any
---@return any
function PointLight:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function PointLight:enableCollision(...) end
---@param ... any
---@return any
function PointLight:generatePersistentId(...) end
---@param ... any
---@return any
function PointLight:getAnchorNames(...) end
---@param ... any
---@return any
function PointLight:getClassDocString(...) end
---@param ... any
---@return any
function PointLight:getClassName(...) end
---@param ... any
---@return any
function PointLight:getDeclarationLine(...) end
---@param ... any
---@return any
function PointLight:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function PointLight:getDynamicFields(...) end
---@param ... any
---@return any
function PointLight:getEulerRotation(...) end
---@param ... any
---@return any
function PointLight:getField(...) end
---@param ... any
---@return any
function PointLight:getFieldInfo(...) end
---@param ... any
---@return any
function PointLight:getFieldList(...) end
---@param ... any
---@return any
function PointLight:getFields(...) end
---@param ... any
---@return any
function PointLight:getFieldsForEditor(...) end
---@param ... any
---@return any
function PointLight:getFileName(...) end
---@param ... any
---@return any
function PointLight:getFirstMaterialName(...) end
---@param ... any
---@return any
function PointLight:getForwardVector(...) end
---@param ... any
---@return any
function PointLight:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function PointLight:getGroup(...) end
---@param ... any
---@return any
function PointLight:getID(...) end
---@param ... any
---@return any
function PointLight:getId(...) end
---@param ... any
---@return any
function PointLight:getIdString(...) end
---@param ... any
---@return any
function PointLight:getInternalName(...) end
---@param ... any
---@return any
function PointLight:getLightEnabled(...) end
---@param ... any
---@return any
function PointLight:getMaterialNames(...) end
---@param ... any
---@return any
function PointLight:getMeshMaterialNames(...) end
---@param ... any
---@return any
function PointLight:getName(...) end
---@param ... any
---@return any
function PointLight:getObjBox(...) end
---@param ... any
---@return any
function PointLight:getObjectBox(...) end
---@param ... any
---@return any
function PointLight:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function PointLight:getPosition(...) end
---@param ... any
---@return any
function PointLight:getPositionXYZ(...) end
---@param ... any
---@return any
function PointLight:getRotation(...) end
---@param ... any
---@return any
function PointLight:getScale(...) end
---@param ... any
---@return any
function PointLight:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PointLight:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PointLight:getTransform(...) end
---@param ... any
---@return any
function PointLight:getTransformF(...) end
---@param ... any
---@return any
function PointLight:getType(...) end
---@param ... any
---@return any
function PointLight:getWorldBox(...) end
---@param ... any
---@return any
function PointLight:getWorldBoxCenter(...) end
---@param ... any
---@return any
function PointLight:getWorldTransform(...) end
---@param ... any
---@return any
function PointLight:hideInRenderView(...) end
---@param ... any
---@return any
function PointLight:incRefCount(...) end
---@param ... any
---@return any
function PointLight:inheritParentFields(...) end
---@param ... any
---@return any
function PointLight:inspectUpdate(...) end
---@param ... any
---@return any
function PointLight:isChildOfGroup(...) end
---@param ... any
---@return any
function PointLight:isEditorDirty(...) end
---@param ... any
---@return any
function PointLight:isGlobalBounds(...) end
---@param ... any
---@return any
function PointLight:isHidden(...) end
---@param ... any
---@return any
function PointLight:isLocked(...) end
---@param ... any
---@return any
function PointLight:isNameChangeAllowed(...) end
---@param ... any
---@return any
function PointLight:isRenderEnabled(...) end
---@param ... any
---@return any
function PointLight:isSelected(...) end
---@param ... any
---@return any
function PointLight:isSelectionEnabled(...) end
---@param ... any
---@return any
function PointLight:isSubClassOf(...) end
---@param ... any
---@return any
function PointLight:onEditorDisable(...) end
---@param ... any
---@return any
function PointLight:onEditorEnable(...) end
---@param ... any
---@return any
function PointLight:postApply(...) end
---@param ... any
---@return any
function PointLight:preApply(...) end
---@param ... any
---@return any
function PointLight:registerObject(...) end
---@param ... any
---@return any
function PointLight:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function PointLight:renderViewMaskClear(...) end
---@param ... any
---@return any
function PointLight:save(...) end
---@param ... any
---@return any
function PointLight:serialize(...) end
---@param ... any
---@return any
function PointLight:serializeForEditor(...) end
---@param ... any
---@return any
function PointLight:serializeToDirectories(...) end
---@param ... any
---@return any
function PointLight:serializeToNameDictFile(...) end
---@param ... any
---@return any
function PointLight:setCanFloatAboveGround(...) end
---@param ... any
---@return any
function PointLight:setCanSave(...) end
---@param ... any
---@return any
function PointLight:setDeclarationLine(...) end
---@param ... any
---@return any
function PointLight:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function PointLight:setEditorDirty(...) end
---@param ... any
---@return any
function PointLight:setEditorOnly(...) end
---@param ... any
---@return any
function PointLight:setField(...) end
---@param ... any
---@return any
function PointLight:setFileName(...) end
---@param ... any
---@return any
function PointLight:setHidden(...) end
---@param ... any
---@return any
function PointLight:setInternalName(...) end
---@param ... any
---@return any
function PointLight:setIsSelected(...) end
---@param ... any
---@return any
function PointLight:setLightEnabled(...) end
---@param ... any
---@return any
function PointLight:setLocked(...) end
---@param ... any
---@return any
function PointLight:setName(...) end
---@param ... any
---@return any
function PointLight:setNameChangeAllowed(...) end
---@param ... any
---@return any
function PointLight:setPosRot(...) end
---@param ... any
---@return any
function PointLight:setPosition(...) end
---@param ... any
---@return any
function PointLight:setPositionXYZ(...) end
---@param ... any
---@return any
function PointLight:setRenderEnabled(...) end
---@param ... any
---@return any
function PointLight:setScale(...) end
---@param ... any
---@return any
function PointLight:setScaleXYZ(...) end
---@param ... any
---@return any
function PointLight:setSelected(...) end
---@param ... any
---@return any
function PointLight:setSelectionEnabled(...) end
---@param ... any
---@return any
function PointLight:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PointLight:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PointLight:setTransform(...) end
---@param ... any
---@return any
function PointLight:setTransformF(...) end
---@param ... any
---@return any
function PointLight:showOnlyInRenderView(...) end
---@param ... any
---@return any
function PointLight:unhideInRenderView(...) end
---@param ... any
---@return any
function PointLight:unregisterObject(...) end

---@class PostEffect : SimGroup
---@field className any
local PostEffect = {}
---@param ... any
---@return any
function PostEffect:add(...) end
---@param ... any
---@return any
function PostEffect:addObject(...) end
---@param ... any
---@return any
function PostEffect:addWithName(...) end
---@param ... any
---@return any
function PostEffect:assignFieldsFromObject(...) end
---@param ... any
---@return any
function PostEffect:at(...) end
---@param ... any
---@return any
function PostEffect:bringObjectToFront(...) end
---@param ... any
---@return any
function PostEffect:bringToFront(...) end
---@param ... any
---@return any
function PostEffect:clear(...) end
---@param ... any
---@return any
function PostEffect:clearShaderMacros(...) end
---@param ... any
---@return any
function PostEffect:clone(...) end
---@param ... any
---@return any
function PostEffect:decRefCount(...) end
---@param ... any
---@return any
function PostEffect:delete(...) end
---@param ... any
---@return any
function PostEffect:deleteAllObjects(...) end
---@param ... any
---@return any
function PostEffect:deleteObject(...) end
---@param ... any
---@return any
function PostEffect:deletePersistentId(...) end
---@param ... any
---@return any
function PostEffect:disable(...) end
---@param ... any
---@return any
function PostEffect:dump(...) end
---@param ... any
---@return any
function PostEffect:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function PostEffect:dumpShaderDisassembly(...) end
---@param ... any
---@return any
function PostEffect:enable(...) end
---@param ... any
---@return any
function PostEffect:findObject(...) end
---@param ... any
---@return any
function PostEffect:findObjectById(...) end
---@param ... any
---@return any
function PostEffect:findObjectByInternalName(...) end
---@param ... any
---@return any
function PostEffect:findObjectIdAfter(...) end
---@param ... any
---@return any
function PostEffect:generatePersistentId(...) end
---@param ... any
---@return any
function PostEffect:getAspectRatio(...) end
---@param ... any
---@return any
function PostEffect:getClassDocString(...) end
---@param ... any
---@return any
function PostEffect:getClassName(...) end
---@param ... any
---@return any
function PostEffect:getCount(...) end
---@param ... any
---@return any
function PostEffect:getDeclarationLine(...) end
---@param ... any
---@return any
function PostEffect:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffect:getDynamicFields(...) end
---@param ... any
---@return any
function PostEffect:getField(...) end
---@param ... any
---@return any
function PostEffect:getFieldInfo(...) end
---@param ... any
---@return any
function PostEffect:getFieldList(...) end
---@param ... any
---@return any
function PostEffect:getFields(...) end
---@param ... any
---@return any
function PostEffect:getFieldsForEditor(...) end
---@param ... any
---@return any
function PostEffect:getFileName(...) end
---@param ... any
---@return any
function PostEffect:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function PostEffect:getGroup(...) end
---@param ... any
---@return any
function PostEffect:getID(...) end
---@param ... any
---@return any
function PostEffect:getId(...) end
---@param ... any
---@return any
function PostEffect:getIdString(...) end
---@param ... any
---@return any
function PostEffect:getInternalName(...) end
---@param ... any
---@return any
function PostEffect:getName(...) end
---@param ... any
---@return any
function PostEffect:getObject(...) end
---@param ... any
---@return any
function PostEffect:getObjectIndex(...) end
---@param ... any
---@return any
function PostEffect:getObjects(...) end
---@param ... any
---@return any
function PostEffect:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function PostEffect:getRandom(...) end
---@param ... any
---@return any
function PostEffect:getRenderTargetSize(...) end
---@param ... any
---@return any
function PostEffect:getScenetreeData(...) end
---@param ... any
---@return any
function PostEffect:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PostEffect:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffect:idAt(...) end
---@param ... any
---@return any
function PostEffect:incRefCount(...) end
---@param ... any
---@return any
function PostEffect:inheritParentFields(...) end
---@param ... any
---@return any
function PostEffect:inspectUpdate(...) end
---@param ... any
---@return any
function PostEffect:isChildOfGroup(...) end
---@param ... any
---@return any
function PostEffect:isEditorDirty(...) end
---@param ... any
---@return any
function PostEffect:isEnabled(...) end
---@param ... any
---@return any
function PostEffect:isHidden(...) end
---@param ... any
---@return any
function PostEffect:isLocked(...) end
---@param ... any
---@return any
function PostEffect:isMember(...) end
---@param ... any
---@return any
function PostEffect:isNameChangeAllowed(...) end
---@param ... any
---@return any
function PostEffect:isSelected(...) end
---@param ... any
---@return any
function PostEffect:isSubClassOf(...) end
---@param ... any
---@return any
function PostEffect:listObjects(...) end
---@param ... any
---@return any
function PostEffect:onEditorDisable(...) end
---@param ... any
---@return any
function PostEffect:onEditorEnable(...) end
---@param ... any
---@return any
function PostEffect:postApply(...) end
---@param ... any
---@return any
function PostEffect:preApply(...) end
---@param ... any
---@return any
function PostEffect:pushObjectToBack(...) end
---@param ... any
---@return any
function PostEffect:pushToBack(...) end
---@param ... any
---@return any
function PostEffect:registerObject(...) end
---@param ... any
---@return any
function PostEffect:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function PostEffect:reload(...) end
---@param ... any
---@return any
function PostEffect:remove(...) end
---@param ... any
---@return any
function PostEffect:removeObject(...) end
---@param ... any
---@return any
function PostEffect:removeShaderMacro(...) end
---@param ... any
---@return any
function PostEffect:reorderChild(...) end
---@param ... any
---@return any
function PostEffect:save(...) end
---@param ... any
---@return any
function PostEffect:serialize(...) end
---@param ... any
---@return any
function PostEffect:serializeForEditor(...) end
---@param ... any
---@return any
function PostEffect:serializeToDirectories(...) end
---@param ... any
---@return any
function PostEffect:serializeToNameDictFile(...) end
---@param ... any
---@return any
function PostEffect:setCanSave(...) end
---@param ... any
---@return any
function PostEffect:setDeclarationLine(...) end
---@param ... any
---@return any
function PostEffect:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffect:setEditorDirty(...) end
---@param ... any
---@return any
function PostEffect:setEditorOnly(...) end
---@param ... any
---@return any
function PostEffect:setField(...) end
---@param ... any
---@return any
function PostEffect:setFileName(...) end
---@param ... any
---@return any
function PostEffect:setHidden(...) end
---@param ... any
---@return any
function PostEffect:setInternalName(...) end
---@param ... any
---@return any
function PostEffect:setIsSelected(...) end
---@param ... any
---@return any
function PostEffect:setLocked(...) end
---@param ... any
---@return any
function PostEffect:setName(...) end
---@param ... any
---@return any
function PostEffect:setNameChangeAllowed(...) end
---@param ... any
---@return any
function PostEffect:setSelected(...) end
---@param ... any
---@return any
function PostEffect:setShaderConst(...) end
---@param ... any
---@return any
function PostEffect:setShaderMacro(...) end
---@param ... any
---@return any
function PostEffect:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PostEffect:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffect:setTexture(...) end
---@param ... any
---@return any
function PostEffect:size(...) end
---@param ... any
---@return any
function PostEffect:sortByName(...) end
---@param ... any
---@return any
function PostEffect:toggle(...) end
---@param ... any
---@return any
function PostEffect:toggleDebug(...) end
---@param ... any
---@return any
function PostEffect:unregisterObject(...) end

---@class PostEffectBase : PostEffect
---@field className any
local PostEffectBase = {}
---@param ... any
---@return any
function PostEffectBase:add(...) end
---@param ... any
---@return any
function PostEffectBase:addObject(...) end
---@param ... any
---@return any
function PostEffectBase:addWithName(...) end
---@param ... any
---@return any
function PostEffectBase:assignFieldsFromObject(...) end
---@param ... any
---@return any
function PostEffectBase:at(...) end
---@param ... any
---@return any
function PostEffectBase:bringObjectToFront(...) end
---@param ... any
---@return any
function PostEffectBase:bringToFront(...) end
---@param ... any
---@return any
function PostEffectBase:clear(...) end
---@param ... any
---@return any
function PostEffectBase:clearShaderMacros(...) end
---@param ... any
---@return any
function PostEffectBase:clone(...) end
---@param ... any
---@return any
function PostEffectBase:decRefCount(...) end
---@param ... any
---@return any
function PostEffectBase:delete(...) end
---@param ... any
---@return any
function PostEffectBase:deleteAllObjects(...) end
---@param ... any
---@return any
function PostEffectBase:deleteObject(...) end
---@param ... any
---@return any
function PostEffectBase:deletePersistentId(...) end
---@param ... any
---@return any
function PostEffectBase:disable(...) end
---@param ... any
---@return any
function PostEffectBase:dump(...) end
---@param ... any
---@return any
function PostEffectBase:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function PostEffectBase:dumpShaderDisassembly(...) end
---@param ... any
---@return any
function PostEffectBase:enable(...) end
---@param ... any
---@return any
function PostEffectBase:findObject(...) end
---@param ... any
---@return any
function PostEffectBase:findObjectById(...) end
---@param ... any
---@return any
function PostEffectBase:findObjectByInternalName(...) end
---@param ... any
---@return any
function PostEffectBase:findObjectIdAfter(...) end
---@param ... any
---@return any
function PostEffectBase:generatePersistentId(...) end
---@param ... any
---@return any
function PostEffectBase:getAspectRatio(...) end
---@param ... any
---@return any
function PostEffectBase:getClassDocString(...) end
---@param ... any
---@return any
function PostEffectBase:getClassName(...) end
---@param ... any
---@return any
function PostEffectBase:getCount(...) end
---@param ... any
---@return any
function PostEffectBase:getDeclarationLine(...) end
---@param ... any
---@return any
function PostEffectBase:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectBase:getDynamicFields(...) end
---@param ... any
---@return any
function PostEffectBase:getField(...) end
---@param ... any
---@return any
function PostEffectBase:getFieldInfo(...) end
---@param ... any
---@return any
function PostEffectBase:getFieldList(...) end
---@param ... any
---@return any
function PostEffectBase:getFields(...) end
---@param ... any
---@return any
function PostEffectBase:getFieldsForEditor(...) end
---@param ... any
---@return any
function PostEffectBase:getFileName(...) end
---@param ... any
---@return any
function PostEffectBase:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function PostEffectBase:getGroup(...) end
---@param ... any
---@return any
function PostEffectBase:getID(...) end
---@param ... any
---@return any
function PostEffectBase:getId(...) end
---@param ... any
---@return any
function PostEffectBase:getIdString(...) end
---@param ... any
---@return any
function PostEffectBase:getInternalName(...) end
---@param ... any
---@return any
function PostEffectBase:getName(...) end
---@param ... any
---@return any
function PostEffectBase:getObject(...) end
---@param ... any
---@return any
function PostEffectBase:getObjectIndex(...) end
---@param ... any
---@return any
function PostEffectBase:getObjects(...) end
---@param ... any
---@return any
function PostEffectBase:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function PostEffectBase:getRandom(...) end
---@param ... any
---@return any
function PostEffectBase:getRenderTargetSize(...) end
---@param ... any
---@return any
function PostEffectBase:getScenetreeData(...) end
---@param ... any
---@return any
function PostEffectBase:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PostEffectBase:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectBase:idAt(...) end
---@param ... any
---@return any
function PostEffectBase:incRefCount(...) end
---@param ... any
---@return any
function PostEffectBase:inheritParentFields(...) end
---@param ... any
---@return any
function PostEffectBase:inspectUpdate(...) end
---@param ... any
---@return any
function PostEffectBase:isChildOfGroup(...) end
---@param ... any
---@return any
function PostEffectBase:isEditorDirty(...) end
---@param ... any
---@return any
function PostEffectBase:isEnabled(...) end
---@param ... any
---@return any
function PostEffectBase:isHidden(...) end
---@param ... any
---@return any
function PostEffectBase:isLocked(...) end
---@param ... any
---@return any
function PostEffectBase:isMember(...) end
---@param ... any
---@return any
function PostEffectBase:isNameChangeAllowed(...) end
---@param ... any
---@return any
function PostEffectBase:isSelected(...) end
---@param ... any
---@return any
function PostEffectBase:isSubClassOf(...) end
---@param ... any
---@return any
function PostEffectBase:listObjects(...) end
---@param ... any
---@return any
function PostEffectBase:onEditorDisable(...) end
---@param ... any
---@return any
function PostEffectBase:onEditorEnable(...) end
---@param ... any
---@return any
function PostEffectBase:postApply(...) end
---@param ... any
---@return any
function PostEffectBase:preApply(...) end
---@param ... any
---@return any
function PostEffectBase:pushObjectToBack(...) end
---@param ... any
---@return any
function PostEffectBase:pushToBack(...) end
---@param ... any
---@return any
function PostEffectBase:registerObject(...) end
---@param ... any
---@return any
function PostEffectBase:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function PostEffectBase:reload(...) end
---@param ... any
---@return any
function PostEffectBase:remove(...) end
---@param ... any
---@return any
function PostEffectBase:removeObject(...) end
---@param ... any
---@return any
function PostEffectBase:removeShaderMacro(...) end
---@param ... any
---@return any
function PostEffectBase:reorderChild(...) end
---@param ... any
---@return any
function PostEffectBase:save(...) end
---@param ... any
---@return any
function PostEffectBase:serialize(...) end
---@param ... any
---@return any
function PostEffectBase:serializeForEditor(...) end
---@param ... any
---@return any
function PostEffectBase:serializeToDirectories(...) end
---@param ... any
---@return any
function PostEffectBase:serializeToNameDictFile(...) end
---@param ... any
---@return any
function PostEffectBase:setCanSave(...) end
---@param ... any
---@return any
function PostEffectBase:setDeclarationLine(...) end
---@param ... any
---@return any
function PostEffectBase:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectBase:setEditorDirty(...) end
---@param ... any
---@return any
function PostEffectBase:setEditorOnly(...) end
---@param ... any
---@return any
function PostEffectBase:setField(...) end
---@param ... any
---@return any
function PostEffectBase:setFileName(...) end
---@param ... any
---@return any
function PostEffectBase:setHidden(...) end
---@param ... any
---@return any
function PostEffectBase:setInternalName(...) end
---@param ... any
---@return any
function PostEffectBase:setIsSelected(...) end
---@param ... any
---@return any
function PostEffectBase:setLocked(...) end
---@param ... any
---@return any
function PostEffectBase:setName(...) end
---@param ... any
---@return any
function PostEffectBase:setNameChangeAllowed(...) end
---@param ... any
---@return any
function PostEffectBase:setSelected(...) end
---@param ... any
---@return any
function PostEffectBase:setShaderConst(...) end
---@param ... any
---@return any
function PostEffectBase:setShaderMacro(...) end
---@param ... any
---@return any
function PostEffectBase:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PostEffectBase:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectBase:setTexture(...) end
---@param ... any
---@return any
function PostEffectBase:size(...) end
---@param ... any
---@return any
function PostEffectBase:sortByName(...) end
---@param ... any
---@return any
function PostEffectBase:toggle(...) end
---@param ... any
---@return any
function PostEffectBase:toggleDebug(...) end
---@param ... any
---@return any
function PostEffectBase:unregisterObject(...) end

---@class PostEffectBloomClass : PostEffectBase
---@field className any
local PostEffectBloomClass = {}
---@param ... any
---@return any
function PostEffectBloomClass:add(...) end
---@param ... any
---@return any
function PostEffectBloomClass:addObject(...) end
---@param ... any
---@return any
function PostEffectBloomClass:addWithName(...) end
---@param ... any
---@return any
function PostEffectBloomClass:assignFieldsFromObject(...) end
---@param ... any
---@return any
function PostEffectBloomClass:at(...) end
---@param ... any
---@return any
function PostEffectBloomClass:bringObjectToFront(...) end
---@param ... any
---@return any
function PostEffectBloomClass:bringToFront(...) end
---@param ... any
---@return any
function PostEffectBloomClass:clear(...) end
---@param ... any
---@return any
function PostEffectBloomClass:clearShaderMacros(...) end
---@param ... any
---@return any
function PostEffectBloomClass:clone(...) end
---@param ... any
---@return any
function PostEffectBloomClass:decRefCount(...) end
---@param ... any
---@return any
function PostEffectBloomClass:delete(...) end
---@param ... any
---@return any
function PostEffectBloomClass:deleteAllObjects(...) end
---@param ... any
---@return any
function PostEffectBloomClass:deleteObject(...) end
---@param ... any
---@return any
function PostEffectBloomClass:deletePersistentId(...) end
---@param ... any
---@return any
function PostEffectBloomClass:disable(...) end
---@param ... any
---@return any
function PostEffectBloomClass:dump(...) end
---@param ... any
---@return any
function PostEffectBloomClass:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function PostEffectBloomClass:dumpShaderDisassembly(...) end
---@param ... any
---@return any
function PostEffectBloomClass:enable(...) end
---@param ... any
---@return any
function PostEffectBloomClass:findObject(...) end
---@param ... any
---@return any
function PostEffectBloomClass:findObjectById(...) end
---@param ... any
---@return any
function PostEffectBloomClass:findObjectByInternalName(...) end
---@param ... any
---@return any
function PostEffectBloomClass:findObjectIdAfter(...) end
---@param ... any
---@return any
function PostEffectBloomClass:generatePersistentId(...) end
---@param ... any
---@return any
function PostEffectBloomClass:getAspectRatio(...) end
---@param ... any
---@return any
function PostEffectBloomClass:getClassDocString(...) end
---@param ... any
---@return any
function PostEffectBloomClass:getClassName(...) end
---@param ... any
---@return any
function PostEffectBloomClass:getCount(...) end
---@param ... any
---@return any
function PostEffectBloomClass:getDeclarationLine(...) end
---@param ... any
---@return any
function PostEffectBloomClass:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectBloomClass:getDynamicFields(...) end
---@param ... any
---@return any
function PostEffectBloomClass:getField(...) end
---@param ... any
---@return any
function PostEffectBloomClass:getFieldInfo(...) end
---@param ... any
---@return any
function PostEffectBloomClass:getFieldList(...) end
---@param ... any
---@return any
function PostEffectBloomClass:getFields(...) end
---@param ... any
---@return any
function PostEffectBloomClass:getFieldsForEditor(...) end
---@param ... any
---@return any
function PostEffectBloomClass:getFileName(...) end
---@param ... any
---@return any
function PostEffectBloomClass:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function PostEffectBloomClass:getGroup(...) end
---@param ... any
---@return any
function PostEffectBloomClass:getID(...) end
---@param ... any
---@return any
function PostEffectBloomClass:getId(...) end
---@param ... any
---@return any
function PostEffectBloomClass:getIdString(...) end
---@param ... any
---@return any
function PostEffectBloomClass:getInternalName(...) end
---@param ... any
---@return any
function PostEffectBloomClass:getName(...) end
---@param ... any
---@return any
function PostEffectBloomClass:getObject(...) end
---@param ... any
---@return any
function PostEffectBloomClass:getObjectIndex(...) end
---@param ... any
---@return any
function PostEffectBloomClass:getObjects(...) end
---@param ... any
---@return any
function PostEffectBloomClass:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function PostEffectBloomClass:getRandom(...) end
---@param ... any
---@return any
function PostEffectBloomClass:getRenderTargetSize(...) end
---@param ... any
---@return any
function PostEffectBloomClass:getScenetreeData(...) end
---@param ... any
---@return any
function PostEffectBloomClass:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PostEffectBloomClass:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectBloomClass:idAt(...) end
---@param ... any
---@return any
function PostEffectBloomClass:incRefCount(...) end
---@param ... any
---@return any
function PostEffectBloomClass:inheritParentFields(...) end
---@param ... any
---@return any
function PostEffectBloomClass:inspectUpdate(...) end
---@param ... any
---@return any
function PostEffectBloomClass:isChildOfGroup(...) end
---@param ... any
---@return any
function PostEffectBloomClass:isEditorDirty(...) end
---@param ... any
---@return any
function PostEffectBloomClass:isEnabled(...) end
---@param ... any
---@return any
function PostEffectBloomClass:isHidden(...) end
---@param ... any
---@return any
function PostEffectBloomClass:isLocked(...) end
---@param ... any
---@return any
function PostEffectBloomClass:isMember(...) end
---@param ... any
---@return any
function PostEffectBloomClass:isNameChangeAllowed(...) end
---@param ... any
---@return any
function PostEffectBloomClass:isSelected(...) end
---@param ... any
---@return any
function PostEffectBloomClass:isSubClassOf(...) end
---@param ... any
---@return any
function PostEffectBloomClass:listObjects(...) end
---@param ... any
---@return any
function PostEffectBloomClass:onEditorDisable(...) end
---@param ... any
---@return any
function PostEffectBloomClass:onEditorEnable(...) end
---@param ... any
---@return any
function PostEffectBloomClass:postApply(...) end
---@param ... any
---@return any
function PostEffectBloomClass:preApply(...) end
---@param ... any
---@return any
function PostEffectBloomClass:pushObjectToBack(...) end
---@param ... any
---@return any
function PostEffectBloomClass:pushToBack(...) end
---@param ... any
---@return any
function PostEffectBloomClass:registerObject(...) end
---@param ... any
---@return any
function PostEffectBloomClass:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function PostEffectBloomClass:reload(...) end
---@param ... any
---@return any
function PostEffectBloomClass:remove(...) end
---@param ... any
---@return any
function PostEffectBloomClass:removeObject(...) end
---@param ... any
---@return any
function PostEffectBloomClass:removeShaderMacro(...) end
---@param ... any
---@return any
function PostEffectBloomClass:reorderChild(...) end
---@param ... any
---@return any
function PostEffectBloomClass:save(...) end
---@param ... any
---@return any
function PostEffectBloomClass:serialize(...) end
---@param ... any
---@return any
function PostEffectBloomClass:serializeForEditor(...) end
---@param ... any
---@return any
function PostEffectBloomClass:serializeToDirectories(...) end
---@param ... any
---@return any
function PostEffectBloomClass:serializeToNameDictFile(...) end
---@param ... any
---@return any
function PostEffectBloomClass:setCanSave(...) end
---@param ... any
---@return any
function PostEffectBloomClass:setDeclarationLine(...) end
---@param ... any
---@return any
function PostEffectBloomClass:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectBloomClass:setEditorDirty(...) end
---@param ... any
---@return any
function PostEffectBloomClass:setEditorOnly(...) end
---@param ... any
---@return any
function PostEffectBloomClass:setField(...) end
---@param ... any
---@return any
function PostEffectBloomClass:setFileName(...) end
---@param ... any
---@return any
function PostEffectBloomClass:setHidden(...) end
---@param ... any
---@return any
function PostEffectBloomClass:setInternalName(...) end
---@param ... any
---@return any
function PostEffectBloomClass:setIsSelected(...) end
---@param ... any
---@return any
function PostEffectBloomClass:setLocked(...) end
---@param ... any
---@return any
function PostEffectBloomClass:setName(...) end
---@param ... any
---@return any
function PostEffectBloomClass:setNameChangeAllowed(...) end
---@param ... any
---@return any
function PostEffectBloomClass:setSelected(...) end
---@param ... any
---@return any
function PostEffectBloomClass:setShaderConst(...) end
---@param ... any
---@return any
function PostEffectBloomClass:setShaderMacro(...) end
---@param ... any
---@return any
function PostEffectBloomClass:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PostEffectBloomClass:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectBloomClass:setTexture(...) end
---@param ... any
---@return any
function PostEffectBloomClass:size(...) end
---@param ... any
---@return any
function PostEffectBloomClass:sortByName(...) end
---@param ... any
---@return any
function PostEffectBloomClass:toggle(...) end
---@param ... any
---@return any
function PostEffectBloomClass:toggleDebug(...) end
---@param ... any
---@return any
function PostEffectBloomClass:unregisterObject(...) end

---@class PostEffectBrightPass : PostEffectBase
---@field className any
local PostEffectBrightPass = {}
---@param ... any
---@return any
function PostEffectBrightPass:add(...) end
---@param ... any
---@return any
function PostEffectBrightPass:addObject(...) end
---@param ... any
---@return any
function PostEffectBrightPass:addWithName(...) end
---@param ... any
---@return any
function PostEffectBrightPass:assignFieldsFromObject(...) end
---@param ... any
---@return any
function PostEffectBrightPass:at(...) end
---@param ... any
---@return any
function PostEffectBrightPass:bringObjectToFront(...) end
---@param ... any
---@return any
function PostEffectBrightPass:bringToFront(...) end
---@param ... any
---@return any
function PostEffectBrightPass:clear(...) end
---@param ... any
---@return any
function PostEffectBrightPass:clearShaderMacros(...) end
---@param ... any
---@return any
function PostEffectBrightPass:clone(...) end
---@param ... any
---@return any
function PostEffectBrightPass:decRefCount(...) end
---@param ... any
---@return any
function PostEffectBrightPass:delete(...) end
---@param ... any
---@return any
function PostEffectBrightPass:deleteAllObjects(...) end
---@param ... any
---@return any
function PostEffectBrightPass:deleteObject(...) end
---@param ... any
---@return any
function PostEffectBrightPass:deletePersistentId(...) end
---@param ... any
---@return any
function PostEffectBrightPass:disable(...) end
---@param ... any
---@return any
function PostEffectBrightPass:dump(...) end
---@param ... any
---@return any
function PostEffectBrightPass:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function PostEffectBrightPass:dumpShaderDisassembly(...) end
---@param ... any
---@return any
function PostEffectBrightPass:enable(...) end
---@param ... any
---@return any
function PostEffectBrightPass:findObject(...) end
---@param ... any
---@return any
function PostEffectBrightPass:findObjectById(...) end
---@param ... any
---@return any
function PostEffectBrightPass:findObjectByInternalName(...) end
---@param ... any
---@return any
function PostEffectBrightPass:findObjectIdAfter(...) end
---@param ... any
---@return any
function PostEffectBrightPass:generatePersistentId(...) end
---@param ... any
---@return any
function PostEffectBrightPass:getAspectRatio(...) end
---@param ... any
---@return any
function PostEffectBrightPass:getClassDocString(...) end
---@param ... any
---@return any
function PostEffectBrightPass:getClassName(...) end
---@param ... any
---@return any
function PostEffectBrightPass:getCount(...) end
---@param ... any
---@return any
function PostEffectBrightPass:getDeclarationLine(...) end
---@param ... any
---@return any
function PostEffectBrightPass:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectBrightPass:getDynamicFields(...) end
---@param ... any
---@return any
function PostEffectBrightPass:getField(...) end
---@param ... any
---@return any
function PostEffectBrightPass:getFieldInfo(...) end
---@param ... any
---@return any
function PostEffectBrightPass:getFieldList(...) end
---@param ... any
---@return any
function PostEffectBrightPass:getFields(...) end
---@param ... any
---@return any
function PostEffectBrightPass:getFieldsForEditor(...) end
---@param ... any
---@return any
function PostEffectBrightPass:getFileName(...) end
---@param ... any
---@return any
function PostEffectBrightPass:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function PostEffectBrightPass:getGroup(...) end
---@param ... any
---@return any
function PostEffectBrightPass:getID(...) end
---@param ... any
---@return any
function PostEffectBrightPass:getId(...) end
---@param ... any
---@return any
function PostEffectBrightPass:getIdString(...) end
---@param ... any
---@return any
function PostEffectBrightPass:getInternalName(...) end
---@param ... any
---@return any
function PostEffectBrightPass:getName(...) end
---@param ... any
---@return any
function PostEffectBrightPass:getObject(...) end
---@param ... any
---@return any
function PostEffectBrightPass:getObjectIndex(...) end
---@param ... any
---@return any
function PostEffectBrightPass:getObjects(...) end
---@param ... any
---@return any
function PostEffectBrightPass:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function PostEffectBrightPass:getRandom(...) end
---@param ... any
---@return any
function PostEffectBrightPass:getRenderTargetSize(...) end
---@param ... any
---@return any
function PostEffectBrightPass:getScenetreeData(...) end
---@param ... any
---@return any
function PostEffectBrightPass:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PostEffectBrightPass:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectBrightPass:idAt(...) end
---@param ... any
---@return any
function PostEffectBrightPass:incRefCount(...) end
---@param ... any
---@return any
function PostEffectBrightPass:inheritParentFields(...) end
---@param ... any
---@return any
function PostEffectBrightPass:inspectUpdate(...) end
---@param ... any
---@return any
function PostEffectBrightPass:isChildOfGroup(...) end
---@param ... any
---@return any
function PostEffectBrightPass:isEditorDirty(...) end
---@param ... any
---@return any
function PostEffectBrightPass:isEnabled(...) end
---@param ... any
---@return any
function PostEffectBrightPass:isHidden(...) end
---@param ... any
---@return any
function PostEffectBrightPass:isLocked(...) end
---@param ... any
---@return any
function PostEffectBrightPass:isMember(...) end
---@param ... any
---@return any
function PostEffectBrightPass:isNameChangeAllowed(...) end
---@param ... any
---@return any
function PostEffectBrightPass:isSelected(...) end
---@param ... any
---@return any
function PostEffectBrightPass:isSubClassOf(...) end
---@param ... any
---@return any
function PostEffectBrightPass:listObjects(...) end
---@param ... any
---@return any
function PostEffectBrightPass:onEditorDisable(...) end
---@param ... any
---@return any
function PostEffectBrightPass:onEditorEnable(...) end
---@param ... any
---@return any
function PostEffectBrightPass:postApply(...) end
---@param ... any
---@return any
function PostEffectBrightPass:preApply(...) end
---@param ... any
---@return any
function PostEffectBrightPass:pushObjectToBack(...) end
---@param ... any
---@return any
function PostEffectBrightPass:pushToBack(...) end
---@param ... any
---@return any
function PostEffectBrightPass:registerObject(...) end
---@param ... any
---@return any
function PostEffectBrightPass:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function PostEffectBrightPass:reload(...) end
---@param ... any
---@return any
function PostEffectBrightPass:remove(...) end
---@param ... any
---@return any
function PostEffectBrightPass:removeObject(...) end
---@param ... any
---@return any
function PostEffectBrightPass:removeShaderMacro(...) end
---@param ... any
---@return any
function PostEffectBrightPass:reorderChild(...) end
---@param ... any
---@return any
function PostEffectBrightPass:save(...) end
---@param ... any
---@return any
function PostEffectBrightPass:serialize(...) end
---@param ... any
---@return any
function PostEffectBrightPass:serializeForEditor(...) end
---@param ... any
---@return any
function PostEffectBrightPass:serializeToDirectories(...) end
---@param ... any
---@return any
function PostEffectBrightPass:serializeToNameDictFile(...) end
---@param ... any
---@return any
function PostEffectBrightPass:setCanSave(...) end
---@param ... any
---@return any
function PostEffectBrightPass:setDeclarationLine(...) end
---@param ... any
---@return any
function PostEffectBrightPass:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectBrightPass:setEditorDirty(...) end
---@param ... any
---@return any
function PostEffectBrightPass:setEditorOnly(...) end
---@param ... any
---@return any
function PostEffectBrightPass:setField(...) end
---@param ... any
---@return any
function PostEffectBrightPass:setFileName(...) end
---@param ... any
---@return any
function PostEffectBrightPass:setHidden(...) end
---@param ... any
---@return any
function PostEffectBrightPass:setInternalName(...) end
---@param ... any
---@return any
function PostEffectBrightPass:setIsSelected(...) end
---@param ... any
---@return any
function PostEffectBrightPass:setLocked(...) end
---@param ... any
---@return any
function PostEffectBrightPass:setName(...) end
---@param ... any
---@return any
function PostEffectBrightPass:setNameChangeAllowed(...) end
---@param ... any
---@return any
function PostEffectBrightPass:setSelected(...) end
---@param ... any
---@return any
function PostEffectBrightPass:setShaderConst(...) end
---@param ... any
---@return any
function PostEffectBrightPass:setShaderMacro(...) end
---@param ... any
---@return any
function PostEffectBrightPass:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PostEffectBrightPass:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectBrightPass:setTexture(...) end
---@param ... any
---@return any
function PostEffectBrightPass:size(...) end
---@param ... any
---@return any
function PostEffectBrightPass:sortByName(...) end
---@param ... any
---@return any
function PostEffectBrightPass:toggle(...) end
---@param ... any
---@return any
function PostEffectBrightPass:toggleDebug(...) end
---@param ... any
---@return any
function PostEffectBrightPass:unregisterObject(...) end

---@class PostEffectCombinePass : PostEffectBase
---@field className any
local PostEffectCombinePass = {}
---@param ... any
---@return any
function PostEffectCombinePass:add(...) end
---@param ... any
---@return any
function PostEffectCombinePass:addObject(...) end
---@param ... any
---@return any
function PostEffectCombinePass:addWithName(...) end
---@param ... any
---@return any
function PostEffectCombinePass:assignFieldsFromObject(...) end
---@param ... any
---@return any
function PostEffectCombinePass:at(...) end
---@param ... any
---@return any
function PostEffectCombinePass:bringObjectToFront(...) end
---@param ... any
---@return any
function PostEffectCombinePass:bringToFront(...) end
---@param ... any
---@return any
function PostEffectCombinePass:clear(...) end
---@param ... any
---@return any
function PostEffectCombinePass:clearShaderMacros(...) end
---@param ... any
---@return any
function PostEffectCombinePass:clone(...) end
---@param ... any
---@return any
function PostEffectCombinePass:decRefCount(...) end
---@param ... any
---@return any
function PostEffectCombinePass:delete(...) end
---@param ... any
---@return any
function PostEffectCombinePass:deleteAllObjects(...) end
---@param ... any
---@return any
function PostEffectCombinePass:deleteObject(...) end
---@param ... any
---@return any
function PostEffectCombinePass:deletePersistentId(...) end
---@param ... any
---@return any
function PostEffectCombinePass:disable(...) end
---@param ... any
---@return any
function PostEffectCombinePass:dump(...) end
---@param ... any
---@return any
function PostEffectCombinePass:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function PostEffectCombinePass:dumpShaderDisassembly(...) end
---@param ... any
---@return any
function PostEffectCombinePass:enable(...) end
---@param ... any
---@return any
function PostEffectCombinePass:findObject(...) end
---@param ... any
---@return any
function PostEffectCombinePass:findObjectById(...) end
---@param ... any
---@return any
function PostEffectCombinePass:findObjectByInternalName(...) end
---@param ... any
---@return any
function PostEffectCombinePass:findObjectIdAfter(...) end
---@param ... any
---@return any
function PostEffectCombinePass:generatePersistentId(...) end
---@param ... any
---@return any
function PostEffectCombinePass:getAspectRatio(...) end
---@param ... any
---@return any
function PostEffectCombinePass:getClassDocString(...) end
---@param ... any
---@return any
function PostEffectCombinePass:getClassName(...) end
---@param ... any
---@return any
function PostEffectCombinePass:getCount(...) end
---@param ... any
---@return any
function PostEffectCombinePass:getDeclarationLine(...) end
---@param ... any
---@return any
function PostEffectCombinePass:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectCombinePass:getDynamicFields(...) end
---@param ... any
---@return any
function PostEffectCombinePass:getField(...) end
---@param ... any
---@return any
function PostEffectCombinePass:getFieldInfo(...) end
---@param ... any
---@return any
function PostEffectCombinePass:getFieldList(...) end
---@param ... any
---@return any
function PostEffectCombinePass:getFields(...) end
---@param ... any
---@return any
function PostEffectCombinePass:getFieldsForEditor(...) end
---@param ... any
---@return any
function PostEffectCombinePass:getFileName(...) end
---@param ... any
---@return any
function PostEffectCombinePass:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function PostEffectCombinePass:getGroup(...) end
---@param ... any
---@return any
function PostEffectCombinePass:getID(...) end
---@param ... any
---@return any
function PostEffectCombinePass:getId(...) end
---@param ... any
---@return any
function PostEffectCombinePass:getIdString(...) end
---@param ... any
---@return any
function PostEffectCombinePass:getInternalName(...) end
---@param ... any
---@return any
function PostEffectCombinePass:getName(...) end
---@param ... any
---@return any
function PostEffectCombinePass:getObject(...) end
---@param ... any
---@return any
function PostEffectCombinePass:getObjectIndex(...) end
---@param ... any
---@return any
function PostEffectCombinePass:getObjects(...) end
---@param ... any
---@return any
function PostEffectCombinePass:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function PostEffectCombinePass:getRandom(...) end
---@param ... any
---@return any
function PostEffectCombinePass:getRenderTargetSize(...) end
---@param ... any
---@return any
function PostEffectCombinePass:getScenetreeData(...) end
---@param ... any
---@return any
function PostEffectCombinePass:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PostEffectCombinePass:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectCombinePass:idAt(...) end
---@param ... any
---@return any
function PostEffectCombinePass:incRefCount(...) end
---@param ... any
---@return any
function PostEffectCombinePass:inheritParentFields(...) end
---@param ... any
---@return any
function PostEffectCombinePass:inspectUpdate(...) end
---@param ... any
---@return any
function PostEffectCombinePass:isChildOfGroup(...) end
---@param ... any
---@return any
function PostEffectCombinePass:isEditorDirty(...) end
---@param ... any
---@return any
function PostEffectCombinePass:isEnabled(...) end
---@param ... any
---@return any
function PostEffectCombinePass:isHidden(...) end
---@param ... any
---@return any
function PostEffectCombinePass:isLocked(...) end
---@param ... any
---@return any
function PostEffectCombinePass:isMember(...) end
---@param ... any
---@return any
function PostEffectCombinePass:isNameChangeAllowed(...) end
---@param ... any
---@return any
function PostEffectCombinePass:isSelected(...) end
---@param ... any
---@return any
function PostEffectCombinePass:isSubClassOf(...) end
---@param ... any
---@return any
function PostEffectCombinePass:listObjects(...) end
---@param ... any
---@return any
function PostEffectCombinePass:onEditorDisable(...) end
---@param ... any
---@return any
function PostEffectCombinePass:onEditorEnable(...) end
---@param ... any
---@return any
function PostEffectCombinePass:postApply(...) end
---@param ... any
---@return any
function PostEffectCombinePass:preApply(...) end
---@param ... any
---@return any
function PostEffectCombinePass:pushObjectToBack(...) end
---@param ... any
---@return any
function PostEffectCombinePass:pushToBack(...) end
---@param ... any
---@return any
function PostEffectCombinePass:registerObject(...) end
---@param ... any
---@return any
function PostEffectCombinePass:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function PostEffectCombinePass:reload(...) end
---@param ... any
---@return any
function PostEffectCombinePass:remove(...) end
---@param ... any
---@return any
function PostEffectCombinePass:removeObject(...) end
---@param ... any
---@return any
function PostEffectCombinePass:removeShaderMacro(...) end
---@param ... any
---@return any
function PostEffectCombinePass:reorderChild(...) end
---@param ... any
---@return any
function PostEffectCombinePass:save(...) end
---@param ... any
---@return any
function PostEffectCombinePass:serialize(...) end
---@param ... any
---@return any
function PostEffectCombinePass:serializeForEditor(...) end
---@param ... any
---@return any
function PostEffectCombinePass:serializeToDirectories(...) end
---@param ... any
---@return any
function PostEffectCombinePass:serializeToNameDictFile(...) end
---@param ... any
---@return any
function PostEffectCombinePass:setCanSave(...) end
---@param ... any
---@return any
function PostEffectCombinePass:setDeclarationLine(...) end
---@param ... any
---@return any
function PostEffectCombinePass:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectCombinePass:setEditorDirty(...) end
---@param ... any
---@return any
function PostEffectCombinePass:setEditorOnly(...) end
---@param ... any
---@return any
function PostEffectCombinePass:setField(...) end
---@param ... any
---@return any
function PostEffectCombinePass:setFileName(...) end
---@param ... any
---@return any
function PostEffectCombinePass:setHidden(...) end
---@param ... any
---@return any
function PostEffectCombinePass:setInternalName(...) end
---@param ... any
---@return any
function PostEffectCombinePass:setIsSelected(...) end
---@param ... any
---@return any
function PostEffectCombinePass:setLocked(...) end
---@param ... any
---@return any
function PostEffectCombinePass:setName(...) end
---@param ... any
---@return any
function PostEffectCombinePass:setNameChangeAllowed(...) end
---@param ... any
---@return any
function PostEffectCombinePass:setSelected(...) end
---@param ... any
---@return any
function PostEffectCombinePass:setShaderConst(...) end
---@param ... any
---@return any
function PostEffectCombinePass:setShaderMacro(...) end
---@param ... any
---@return any
function PostEffectCombinePass:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PostEffectCombinePass:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectCombinePass:setTexture(...) end
---@param ... any
---@return any
function PostEffectCombinePass:size(...) end
---@param ... any
---@return any
function PostEffectCombinePass:sortByName(...) end
---@param ... any
---@return any
function PostEffectCombinePass:toggle(...) end
---@param ... any
---@return any
function PostEffectCombinePass:toggleDebug(...) end
---@param ... any
---@return any
function PostEffectCombinePass:unregisterObject(...) end

---@class PostEffectDownScale : PostEffectBase
---@field className any
local PostEffectDownScale = {}
---@param ... any
---@return any
function PostEffectDownScale:add(...) end
---@param ... any
---@return any
function PostEffectDownScale:addObject(...) end
---@param ... any
---@return any
function PostEffectDownScale:addWithName(...) end
---@param ... any
---@return any
function PostEffectDownScale:assignFieldsFromObject(...) end
---@param ... any
---@return any
function PostEffectDownScale:at(...) end
---@param ... any
---@return any
function PostEffectDownScale:bringObjectToFront(...) end
---@param ... any
---@return any
function PostEffectDownScale:bringToFront(...) end
---@param ... any
---@return any
function PostEffectDownScale:clear(...) end
---@param ... any
---@return any
function PostEffectDownScale:clearShaderMacros(...) end
---@param ... any
---@return any
function PostEffectDownScale:clone(...) end
---@param ... any
---@return any
function PostEffectDownScale:decRefCount(...) end
---@param ... any
---@return any
function PostEffectDownScale:delete(...) end
---@param ... any
---@return any
function PostEffectDownScale:deleteAllObjects(...) end
---@param ... any
---@return any
function PostEffectDownScale:deleteObject(...) end
---@param ... any
---@return any
function PostEffectDownScale:deletePersistentId(...) end
---@param ... any
---@return any
function PostEffectDownScale:disable(...) end
---@param ... any
---@return any
function PostEffectDownScale:dump(...) end
---@param ... any
---@return any
function PostEffectDownScale:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function PostEffectDownScale:dumpShaderDisassembly(...) end
---@param ... any
---@return any
function PostEffectDownScale:enable(...) end
---@param ... any
---@return any
function PostEffectDownScale:findObject(...) end
---@param ... any
---@return any
function PostEffectDownScale:findObjectById(...) end
---@param ... any
---@return any
function PostEffectDownScale:findObjectByInternalName(...) end
---@param ... any
---@return any
function PostEffectDownScale:findObjectIdAfter(...) end
---@param ... any
---@return any
function PostEffectDownScale:generatePersistentId(...) end
---@param ... any
---@return any
function PostEffectDownScale:getAspectRatio(...) end
---@param ... any
---@return any
function PostEffectDownScale:getClassDocString(...) end
---@param ... any
---@return any
function PostEffectDownScale:getClassName(...) end
---@param ... any
---@return any
function PostEffectDownScale:getCount(...) end
---@param ... any
---@return any
function PostEffectDownScale:getDeclarationLine(...) end
---@param ... any
---@return any
function PostEffectDownScale:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectDownScale:getDynamicFields(...) end
---@param ... any
---@return any
function PostEffectDownScale:getField(...) end
---@param ... any
---@return any
function PostEffectDownScale:getFieldInfo(...) end
---@param ... any
---@return any
function PostEffectDownScale:getFieldList(...) end
---@param ... any
---@return any
function PostEffectDownScale:getFields(...) end
---@param ... any
---@return any
function PostEffectDownScale:getFieldsForEditor(...) end
---@param ... any
---@return any
function PostEffectDownScale:getFileName(...) end
---@param ... any
---@return any
function PostEffectDownScale:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function PostEffectDownScale:getGroup(...) end
---@param ... any
---@return any
function PostEffectDownScale:getID(...) end
---@param ... any
---@return any
function PostEffectDownScale:getId(...) end
---@param ... any
---@return any
function PostEffectDownScale:getIdString(...) end
---@param ... any
---@return any
function PostEffectDownScale:getInternalName(...) end
---@param ... any
---@return any
function PostEffectDownScale:getName(...) end
---@param ... any
---@return any
function PostEffectDownScale:getObject(...) end
---@param ... any
---@return any
function PostEffectDownScale:getObjectIndex(...) end
---@param ... any
---@return any
function PostEffectDownScale:getObjects(...) end
---@param ... any
---@return any
function PostEffectDownScale:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function PostEffectDownScale:getRandom(...) end
---@param ... any
---@return any
function PostEffectDownScale:getRenderTargetSize(...) end
---@param ... any
---@return any
function PostEffectDownScale:getScenetreeData(...) end
---@param ... any
---@return any
function PostEffectDownScale:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PostEffectDownScale:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectDownScale:idAt(...) end
---@param ... any
---@return any
function PostEffectDownScale:incRefCount(...) end
---@param ... any
---@return any
function PostEffectDownScale:inheritParentFields(...) end
---@param ... any
---@return any
function PostEffectDownScale:inspectUpdate(...) end
---@param ... any
---@return any
function PostEffectDownScale:isChildOfGroup(...) end
---@param ... any
---@return any
function PostEffectDownScale:isEditorDirty(...) end
---@param ... any
---@return any
function PostEffectDownScale:isEnabled(...) end
---@param ... any
---@return any
function PostEffectDownScale:isHidden(...) end
---@param ... any
---@return any
function PostEffectDownScale:isLocked(...) end
---@param ... any
---@return any
function PostEffectDownScale:isMember(...) end
---@param ... any
---@return any
function PostEffectDownScale:isNameChangeAllowed(...) end
---@param ... any
---@return any
function PostEffectDownScale:isSelected(...) end
---@param ... any
---@return any
function PostEffectDownScale:isSubClassOf(...) end
---@param ... any
---@return any
function PostEffectDownScale:listObjects(...) end
---@param ... any
---@return any
function PostEffectDownScale:onEditorDisable(...) end
---@param ... any
---@return any
function PostEffectDownScale:onEditorEnable(...) end
---@param ... any
---@return any
function PostEffectDownScale:postApply(...) end
---@param ... any
---@return any
function PostEffectDownScale:preApply(...) end
---@param ... any
---@return any
function PostEffectDownScale:pushObjectToBack(...) end
---@param ... any
---@return any
function PostEffectDownScale:pushToBack(...) end
---@param ... any
---@return any
function PostEffectDownScale:registerObject(...) end
---@param ... any
---@return any
function PostEffectDownScale:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function PostEffectDownScale:reload(...) end
---@param ... any
---@return any
function PostEffectDownScale:remove(...) end
---@param ... any
---@return any
function PostEffectDownScale:removeObject(...) end
---@param ... any
---@return any
function PostEffectDownScale:removeShaderMacro(...) end
---@param ... any
---@return any
function PostEffectDownScale:reorderChild(...) end
---@param ... any
---@return any
function PostEffectDownScale:save(...) end
---@param ... any
---@return any
function PostEffectDownScale:serialize(...) end
---@param ... any
---@return any
function PostEffectDownScale:serializeForEditor(...) end
---@param ... any
---@return any
function PostEffectDownScale:serializeToDirectories(...) end
---@param ... any
---@return any
function PostEffectDownScale:serializeToNameDictFile(...) end
---@param ... any
---@return any
function PostEffectDownScale:setCanSave(...) end
---@param ... any
---@return any
function PostEffectDownScale:setDeclarationLine(...) end
---@param ... any
---@return any
function PostEffectDownScale:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectDownScale:setEditorDirty(...) end
---@param ... any
---@return any
function PostEffectDownScale:setEditorOnly(...) end
---@param ... any
---@return any
function PostEffectDownScale:setField(...) end
---@param ... any
---@return any
function PostEffectDownScale:setFileName(...) end
---@param ... any
---@return any
function PostEffectDownScale:setHidden(...) end
---@param ... any
---@return any
function PostEffectDownScale:setInternalName(...) end
---@param ... any
---@return any
function PostEffectDownScale:setIsSelected(...) end
---@param ... any
---@return any
function PostEffectDownScale:setLocked(...) end
---@param ... any
---@return any
function PostEffectDownScale:setName(...) end
---@param ... any
---@return any
function PostEffectDownScale:setNameChangeAllowed(...) end
---@param ... any
---@return any
function PostEffectDownScale:setSelected(...) end
---@param ... any
---@return any
function PostEffectDownScale:setShaderConst(...) end
---@param ... any
---@return any
function PostEffectDownScale:setShaderMacro(...) end
---@param ... any
---@return any
function PostEffectDownScale:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PostEffectDownScale:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectDownScale:setTexture(...) end
---@param ... any
---@return any
function PostEffectDownScale:size(...) end
---@param ... any
---@return any
function PostEffectDownScale:sortByName(...) end
---@param ... any
---@return any
function PostEffectDownScale:toggle(...) end
---@param ... any
---@return any
function PostEffectDownScale:toggleDebug(...) end
---@param ... any
---@return any
function PostEffectDownScale:unregisterObject(...) end

---@class PostEffectLocalExposure : PostEffectBase
---@field autoExposure any modifiable
---@field autoTargetLuminance any modifiable
---@field className any
---@field exposureBiasEV any modifiable
---@field manualEV any modifiable
---@field targetLuminance any modifiable
local PostEffectLocalExposure = {}
---@param ... any
---@return any
function PostEffectLocalExposure:add(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:addObject(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:addWithName(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:assignFieldsFromObject(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:at(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:bringObjectToFront(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:bringToFront(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:clear(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:clearShaderMacros(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:clone(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:decRefCount(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:delete(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:deleteAllObjects(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:deleteObject(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:deletePersistentId(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:disable(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:dump(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:dumpShaderDisassembly(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:enable(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:findObject(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:findObjectById(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:findObjectByInternalName(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:findObjectIdAfter(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:generatePersistentId(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:getAspectRatio(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:getClassDocString(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:getClassName(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:getCount(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:getDeclarationLine(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:getDynamicFields(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:getField(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:getFieldInfo(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:getFieldList(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:getFields(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:getFieldsForEditor(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:getFileName(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:getGroup(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:getID(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:getId(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:getIdString(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:getInternalName(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:getName(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:getObject(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:getObjectIndex(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:getObjects(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:getRandom(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:getRenderTargetSize(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:getScenetreeData(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:idAt(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:incRefCount(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:inheritParentFields(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:inspectUpdate(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:isChildOfGroup(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:isEditorDirty(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:isEnabled(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:isHidden(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:isLocked(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:isMember(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:isNameChangeAllowed(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:isSelected(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:isSubClassOf(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:listObjects(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:onEditorDisable(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:onEditorEnable(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:postApply(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:preApply(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:pushObjectToBack(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:pushToBack(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:registerObject(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:reload(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:remove(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:removeObject(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:removeShaderMacro(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:reorderChild(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:resetAutoexposure(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:save(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:serialize(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:serializeForEditor(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:serializeToDirectories(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:serializeToNameDictFile(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:setCanSave(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:setDeclarationLine(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:setEditorDirty(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:setEditorOnly(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:setField(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:setFileName(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:setHidden(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:setInternalName(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:setIsSelected(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:setLocked(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:setName(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:setNameChangeAllowed(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:setSelected(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:setShaderConst(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:setShaderMacro(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:setTexture(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:size(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:sortByName(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:toggle(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:toggleDebug(...) end
---@param ... any
---@return any
function PostEffectLocalExposure:unregisterObject(...) end

---@class PostEffectLuminance : PostEffectBase
---@field className any
local PostEffectLuminance = {}
---@param ... any
---@return any
function PostEffectLuminance:add(...) end
---@param ... any
---@return any
function PostEffectLuminance:addObject(...) end
---@param ... any
---@return any
function PostEffectLuminance:addWithName(...) end
---@param ... any
---@return any
function PostEffectLuminance:assignFieldsFromObject(...) end
---@param ... any
---@return any
function PostEffectLuminance:at(...) end
---@param ... any
---@return any
function PostEffectLuminance:bringObjectToFront(...) end
---@param ... any
---@return any
function PostEffectLuminance:bringToFront(...) end
---@param ... any
---@return any
function PostEffectLuminance:clear(...) end
---@param ... any
---@return any
function PostEffectLuminance:clearShaderMacros(...) end
---@param ... any
---@return any
function PostEffectLuminance:clone(...) end
---@param ... any
---@return any
function PostEffectLuminance:decRefCount(...) end
---@param ... any
---@return any
function PostEffectLuminance:delete(...) end
---@param ... any
---@return any
function PostEffectLuminance:deleteAllObjects(...) end
---@param ... any
---@return any
function PostEffectLuminance:deleteObject(...) end
---@param ... any
---@return any
function PostEffectLuminance:deletePersistentId(...) end
---@param ... any
---@return any
function PostEffectLuminance:disable(...) end
---@param ... any
---@return any
function PostEffectLuminance:dump(...) end
---@param ... any
---@return any
function PostEffectLuminance:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function PostEffectLuminance:dumpShaderDisassembly(...) end
---@param ... any
---@return any
function PostEffectLuminance:enable(...) end
---@param ... any
---@return any
function PostEffectLuminance:findObject(...) end
---@param ... any
---@return any
function PostEffectLuminance:findObjectById(...) end
---@param ... any
---@return any
function PostEffectLuminance:findObjectByInternalName(...) end
---@param ... any
---@return any
function PostEffectLuminance:findObjectIdAfter(...) end
---@param ... any
---@return any
function PostEffectLuminance:generatePersistentId(...) end
---@param ... any
---@return any
function PostEffectLuminance:getAspectRatio(...) end
---@param ... any
---@return any
function PostEffectLuminance:getClassDocString(...) end
---@param ... any
---@return any
function PostEffectLuminance:getClassName(...) end
---@param ... any
---@return any
function PostEffectLuminance:getCount(...) end
---@param ... any
---@return any
function PostEffectLuminance:getDeclarationLine(...) end
---@param ... any
---@return any
function PostEffectLuminance:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectLuminance:getDynamicFields(...) end
---@param ... any
---@return any
function PostEffectLuminance:getField(...) end
---@param ... any
---@return any
function PostEffectLuminance:getFieldInfo(...) end
---@param ... any
---@return any
function PostEffectLuminance:getFieldList(...) end
---@param ... any
---@return any
function PostEffectLuminance:getFields(...) end
---@param ... any
---@return any
function PostEffectLuminance:getFieldsForEditor(...) end
---@param ... any
---@return any
function PostEffectLuminance:getFileName(...) end
---@param ... any
---@return any
function PostEffectLuminance:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function PostEffectLuminance:getGroup(...) end
---@param ... any
---@return any
function PostEffectLuminance:getID(...) end
---@param ... any
---@return any
function PostEffectLuminance:getId(...) end
---@param ... any
---@return any
function PostEffectLuminance:getIdString(...) end
---@param ... any
---@return any
function PostEffectLuminance:getInternalName(...) end
---@param ... any
---@return any
function PostEffectLuminance:getName(...) end
---@param ... any
---@return any
function PostEffectLuminance:getObject(...) end
---@param ... any
---@return any
function PostEffectLuminance:getObjectIndex(...) end
---@param ... any
---@return any
function PostEffectLuminance:getObjects(...) end
---@param ... any
---@return any
function PostEffectLuminance:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function PostEffectLuminance:getRandom(...) end
---@param ... any
---@return any
function PostEffectLuminance:getRenderTargetSize(...) end
---@param ... any
---@return any
function PostEffectLuminance:getScenetreeData(...) end
---@param ... any
---@return any
function PostEffectLuminance:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PostEffectLuminance:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectLuminance:idAt(...) end
---@param ... any
---@return any
function PostEffectLuminance:incRefCount(...) end
---@param ... any
---@return any
function PostEffectLuminance:inheritParentFields(...) end
---@param ... any
---@return any
function PostEffectLuminance:inspectUpdate(...) end
---@param ... any
---@return any
function PostEffectLuminance:isChildOfGroup(...) end
---@param ... any
---@return any
function PostEffectLuminance:isEditorDirty(...) end
---@param ... any
---@return any
function PostEffectLuminance:isEnabled(...) end
---@param ... any
---@return any
function PostEffectLuminance:isHidden(...) end
---@param ... any
---@return any
function PostEffectLuminance:isLocked(...) end
---@param ... any
---@return any
function PostEffectLuminance:isMember(...) end
---@param ... any
---@return any
function PostEffectLuminance:isNameChangeAllowed(...) end
---@param ... any
---@return any
function PostEffectLuminance:isSelected(...) end
---@param ... any
---@return any
function PostEffectLuminance:isSubClassOf(...) end
---@param ... any
---@return any
function PostEffectLuminance:listObjects(...) end
---@param ... any
---@return any
function PostEffectLuminance:onEditorDisable(...) end
---@param ... any
---@return any
function PostEffectLuminance:onEditorEnable(...) end
---@param ... any
---@return any
function PostEffectLuminance:postApply(...) end
---@param ... any
---@return any
function PostEffectLuminance:preApply(...) end
---@param ... any
---@return any
function PostEffectLuminance:pushObjectToBack(...) end
---@param ... any
---@return any
function PostEffectLuminance:pushToBack(...) end
---@param ... any
---@return any
function PostEffectLuminance:registerObject(...) end
---@param ... any
---@return any
function PostEffectLuminance:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function PostEffectLuminance:reload(...) end
---@param ... any
---@return any
function PostEffectLuminance:remove(...) end
---@param ... any
---@return any
function PostEffectLuminance:removeObject(...) end
---@param ... any
---@return any
function PostEffectLuminance:removeShaderMacro(...) end
---@param ... any
---@return any
function PostEffectLuminance:reorderChild(...) end
---@param ... any
---@return any
function PostEffectLuminance:save(...) end
---@param ... any
---@return any
function PostEffectLuminance:serialize(...) end
---@param ... any
---@return any
function PostEffectLuminance:serializeForEditor(...) end
---@param ... any
---@return any
function PostEffectLuminance:serializeToDirectories(...) end
---@param ... any
---@return any
function PostEffectLuminance:serializeToNameDictFile(...) end
---@param ... any
---@return any
function PostEffectLuminance:setCanSave(...) end
---@param ... any
---@return any
function PostEffectLuminance:setDeclarationLine(...) end
---@param ... any
---@return any
function PostEffectLuminance:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectLuminance:setEditorDirty(...) end
---@param ... any
---@return any
function PostEffectLuminance:setEditorOnly(...) end
---@param ... any
---@return any
function PostEffectLuminance:setField(...) end
---@param ... any
---@return any
function PostEffectLuminance:setFileName(...) end
---@param ... any
---@return any
function PostEffectLuminance:setHidden(...) end
---@param ... any
---@return any
function PostEffectLuminance:setInternalName(...) end
---@param ... any
---@return any
function PostEffectLuminance:setIsSelected(...) end
---@param ... any
---@return any
function PostEffectLuminance:setLocked(...) end
---@param ... any
---@return any
function PostEffectLuminance:setName(...) end
---@param ... any
---@return any
function PostEffectLuminance:setNameChangeAllowed(...) end
---@param ... any
---@return any
function PostEffectLuminance:setSelected(...) end
---@param ... any
---@return any
function PostEffectLuminance:setShaderConst(...) end
---@param ... any
---@return any
function PostEffectLuminance:setShaderMacro(...) end
---@param ... any
---@return any
function PostEffectLuminance:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PostEffectLuminance:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectLuminance:setTexture(...) end
---@param ... any
---@return any
function PostEffectLuminance:size(...) end
---@param ... any
---@return any
function PostEffectLuminance:sortByName(...) end
---@param ... any
---@return any
function PostEffectLuminance:toggle(...) end
---@param ... any
---@return any
function PostEffectLuminance:toggleDebug(...) end
---@param ... any
---@return any
function PostEffectLuminance:unregisterObject(...) end

---@class PostEffectMaskedBlur : PostEffect
---@field className any
local PostEffectMaskedBlur = {}
---@param ... any
---@return any
function PostEffectMaskedBlur:add(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:addFrameBlurRect(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:addObject(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:addWithName(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:assignFieldsFromObject(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:at(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:bringObjectToFront(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:bringToFront(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:clear(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:clearShaderMacros(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:clone(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:decRefCount(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:delete(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:deleteAllObjects(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:deleteObject(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:deletePersistentId(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:disable(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:dump(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:dumpShaderDisassembly(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:enable(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:findObject(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:findObjectById(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:findObjectByInternalName(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:findObjectIdAfter(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:generatePersistentId(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:getAspectRatio(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:getClassDocString(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:getClassName(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:getCount(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:getDeclarationLine(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:getDynamicFields(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:getField(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:getFieldInfo(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:getFieldList(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:getFields(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:getFieldsForEditor(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:getFileName(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:getGroup(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:getID(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:getId(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:getIdString(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:getInternalName(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:getName(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:getObject(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:getObjectIndex(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:getObjects(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:getRandom(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:getRenderTargetSize(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:getScenetreeData(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:idAt(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:incRefCount(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:inheritParentFields(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:inspectUpdate(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:isChildOfGroup(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:isEditorDirty(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:isEnabled(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:isHidden(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:isLocked(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:isMember(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:isNameChangeAllowed(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:isSelected(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:isSubClassOf(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:listObjects(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:onEditorDisable(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:onEditorEnable(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:postApply(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:preApply(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:pushObjectToBack(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:pushToBack(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:registerObject(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:reload(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:remove(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:removeObject(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:removeShaderMacro(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:reorderChild(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:save(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:serialize(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:serializeForEditor(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:serializeToDirectories(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:serializeToNameDictFile(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:setCanSave(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:setDeclarationLine(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:setEditorDirty(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:setEditorOnly(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:setField(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:setFileName(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:setHidden(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:setInternalName(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:setIsSelected(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:setLocked(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:setName(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:setNameChangeAllowed(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:setSelected(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:setShaderConst(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:setShaderMacro(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:setTexture(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:size(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:sortByName(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:toggle(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:toggleDebug(...) end
---@param ... any
---@return any
function PostEffectMaskedBlur:unregisterObject(...) end

---@class PostEffectMotionBlur : PostEffectBase
---@field className any
local PostEffectMotionBlur = {}
---@param ... any
---@return any
function PostEffectMotionBlur:add(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:addObject(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:addWithName(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:assignFieldsFromObject(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:at(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:bringObjectToFront(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:bringToFront(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:clear(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:clearShaderMacros(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:clone(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:decRefCount(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:delete(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:deleteAllObjects(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:deleteObject(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:deletePersistentId(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:disable(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:dump(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:dumpShaderDisassembly(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:enable(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:findObject(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:findObjectById(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:findObjectByInternalName(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:findObjectIdAfter(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:generatePersistentId(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:getAspectRatio(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:getClassDocString(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:getClassName(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:getCount(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:getDeclarationLine(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:getDynamicFields(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:getField(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:getFieldInfo(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:getFieldList(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:getFields(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:getFieldsForEditor(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:getFileName(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:getGroup(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:getID(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:getId(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:getIdString(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:getInternalName(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:getName(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:getObject(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:getObjectIndex(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:getObjects(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:getRandom(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:getRenderTargetSize(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:getScenetreeData(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:idAt(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:incRefCount(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:inheritParentFields(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:inspectUpdate(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:isChildOfGroup(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:isEditorDirty(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:isEnabled(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:isHidden(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:isLocked(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:isMember(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:isNameChangeAllowed(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:isSelected(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:isSubClassOf(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:listObjects(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:onEditorDisable(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:onEditorEnable(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:postApply(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:preApply(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:pushObjectToBack(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:pushToBack(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:registerObject(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:reload(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:remove(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:removeObject(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:removeShaderMacro(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:reorderChild(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:save(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:serialize(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:serializeForEditor(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:serializeToDirectories(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:serializeToNameDictFile(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:setCanSave(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:setDeclarationLine(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:setEditorDirty(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:setEditorOnly(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:setField(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:setFileName(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:setHidden(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:setInternalName(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:setIsSelected(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:setLocked(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:setName(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:setNameChangeAllowed(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:setSelected(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:setShaderConst(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:setShaderMacro(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:setTexture(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:size(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:sortByName(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:toggle(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:toggleDebug(...) end
---@param ... any
---@return any
function PostEffectMotionBlur:unregisterObject(...) end

---@class PostEffectSSAO : PostEffect
---@field bentNormals any modifiable
---@field className any
local PostEffectSSAO = {}
---@param ... any
---@return any
function PostEffectSSAO:add(...) end
---@param ... any
---@return any
function PostEffectSSAO:addObject(...) end
---@param ... any
---@return any
function PostEffectSSAO:addWithName(...) end
---@param ... any
---@return any
function PostEffectSSAO:assignFieldsFromObject(...) end
---@param ... any
---@return any
function PostEffectSSAO:at(...) end
---@param ... any
---@return any
function PostEffectSSAO:bringObjectToFront(...) end
---@param ... any
---@return any
function PostEffectSSAO:bringToFront(...) end
---@param ... any
---@return any
function PostEffectSSAO:clear(...) end
---@param ... any
---@return any
function PostEffectSSAO:clearShaderMacros(...) end
---@param ... any
---@return any
function PostEffectSSAO:clone(...) end
---@param ... any
---@return any
function PostEffectSSAO:decRefCount(...) end
---@param ... any
---@return any
function PostEffectSSAO:delete(...) end
---@param ... any
---@return any
function PostEffectSSAO:deleteAllObjects(...) end
---@param ... any
---@return any
function PostEffectSSAO:deleteObject(...) end
---@param ... any
---@return any
function PostEffectSSAO:deletePersistentId(...) end
---@param ... any
---@return any
function PostEffectSSAO:disable(...) end
---@param ... any
---@return any
function PostEffectSSAO:dump(...) end
---@param ... any
---@return any
function PostEffectSSAO:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function PostEffectSSAO:dumpShaderDisassembly(...) end
---@param ... any
---@return any
function PostEffectSSAO:enable(...) end
---@param ... any
---@return any
function PostEffectSSAO:findObject(...) end
---@param ... any
---@return any
function PostEffectSSAO:findObjectById(...) end
---@param ... any
---@return any
function PostEffectSSAO:findObjectByInternalName(...) end
---@param ... any
---@return any
function PostEffectSSAO:findObjectIdAfter(...) end
---@param ... any
---@return any
function PostEffectSSAO:generatePersistentId(...) end
---@param ... any
---@return any
function PostEffectSSAO:getAspectRatio(...) end
---@param ... any
---@return any
function PostEffectSSAO:getClassDocString(...) end
---@param ... any
---@return any
function PostEffectSSAO:getClassName(...) end
---@param ... any
---@return any
function PostEffectSSAO:getCount(...) end
---@param ... any
---@return any
function PostEffectSSAO:getDeclarationLine(...) end
---@param ... any
---@return any
function PostEffectSSAO:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectSSAO:getDynamicFields(...) end
---@param ... any
---@return any
function PostEffectSSAO:getField(...) end
---@param ... any
---@return any
function PostEffectSSAO:getFieldInfo(...) end
---@param ... any
---@return any
function PostEffectSSAO:getFieldList(...) end
---@param ... any
---@return any
function PostEffectSSAO:getFields(...) end
---@param ... any
---@return any
function PostEffectSSAO:getFieldsForEditor(...) end
---@param ... any
---@return any
function PostEffectSSAO:getFileName(...) end
---@param ... any
---@return any
function PostEffectSSAO:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function PostEffectSSAO:getGroup(...) end
---@param ... any
---@return any
function PostEffectSSAO:getID(...) end
---@param ... any
---@return any
function PostEffectSSAO:getId(...) end
---@param ... any
---@return any
function PostEffectSSAO:getIdString(...) end
---@param ... any
---@return any
function PostEffectSSAO:getInternalName(...) end
---@param ... any
---@return any
function PostEffectSSAO:getName(...) end
---@param ... any
---@return any
function PostEffectSSAO:getObject(...) end
---@param ... any
---@return any
function PostEffectSSAO:getObjectIndex(...) end
---@param ... any
---@return any
function PostEffectSSAO:getObjects(...) end
---@param ... any
---@return any
function PostEffectSSAO:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function PostEffectSSAO:getRandom(...) end
---@param ... any
---@return any
function PostEffectSSAO:getRenderTargetSize(...) end
---@param ... any
---@return any
function PostEffectSSAO:getScenetreeData(...) end
---@param ... any
---@return any
function PostEffectSSAO:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PostEffectSSAO:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectSSAO:idAt(...) end
---@param ... any
---@return any
function PostEffectSSAO:incRefCount(...) end
---@param ... any
---@return any
function PostEffectSSAO:inheritParentFields(...) end
---@param ... any
---@return any
function PostEffectSSAO:inspectUpdate(...) end
---@param ... any
---@return any
function PostEffectSSAO:isChildOfGroup(...) end
---@param ... any
---@return any
function PostEffectSSAO:isEditorDirty(...) end
---@param ... any
---@return any
function PostEffectSSAO:isEnabled(...) end
---@param ... any
---@return any
function PostEffectSSAO:isHidden(...) end
---@param ... any
---@return any
function PostEffectSSAO:isLocked(...) end
---@param ... any
---@return any
function PostEffectSSAO:isMember(...) end
---@param ... any
---@return any
function PostEffectSSAO:isNameChangeAllowed(...) end
---@param ... any
---@return any
function PostEffectSSAO:isSelected(...) end
---@param ... any
---@return any
function PostEffectSSAO:isSubClassOf(...) end
---@param ... any
---@return any
function PostEffectSSAO:listObjects(...) end
---@param ... any
---@return any
function PostEffectSSAO:onEditorDisable(...) end
---@param ... any
---@return any
function PostEffectSSAO:onEditorEnable(...) end
---@param ... any
---@return any
function PostEffectSSAO:postApply(...) end
---@param ... any
---@return any
function PostEffectSSAO:preApply(...) end
---@param ... any
---@return any
function PostEffectSSAO:pushObjectToBack(...) end
---@param ... any
---@return any
function PostEffectSSAO:pushToBack(...) end
---@param ... any
---@return any
function PostEffectSSAO:registerObject(...) end
---@param ... any
---@return any
function PostEffectSSAO:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function PostEffectSSAO:reload(...) end
---@param ... any
---@return any
function PostEffectSSAO:remove(...) end
---@param ... any
---@return any
function PostEffectSSAO:removeObject(...) end
---@param ... any
---@return any
function PostEffectSSAO:removeShaderMacro(...) end
---@param ... any
---@return any
function PostEffectSSAO:reorderChild(...) end
---@param ... any
---@return any
function PostEffectSSAO:save(...) end
---@param ... any
---@return any
function PostEffectSSAO:serialize(...) end
---@param ... any
---@return any
function PostEffectSSAO:serializeForEditor(...) end
---@param ... any
---@return any
function PostEffectSSAO:serializeToDirectories(...) end
---@param ... any
---@return any
function PostEffectSSAO:serializeToNameDictFile(...) end
---@param ... any
---@return any
function PostEffectSSAO:setCanSave(...) end
---@param ... any
---@return any
function PostEffectSSAO:setContrast(...) end
---@param ... any
---@return any
function PostEffectSSAO:setDeclarationLine(...) end
---@param ... any
---@return any
function PostEffectSSAO:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectSSAO:setEditorDirty(...) end
---@param ... any
---@return any
function PostEffectSSAO:setEditorOnly(...) end
---@param ... any
---@return any
function PostEffectSSAO:setField(...) end
---@param ... any
---@return any
function PostEffectSSAO:setFileName(...) end
---@param ... any
---@return any
function PostEffectSSAO:setHidden(...) end
---@param ... any
---@return any
function PostEffectSSAO:setInternalName(...) end
---@param ... any
---@return any
function PostEffectSSAO:setIsSelected(...) end
---@param ... any
---@return any
function PostEffectSSAO:setLocked(...) end
---@param ... any
---@return any
function PostEffectSSAO:setName(...) end
---@param ... any
---@return any
function PostEffectSSAO:setNameChangeAllowed(...) end
---@param ... any
---@return any
function PostEffectSSAO:setRadius(...) end
---@param ... any
---@return any
function PostEffectSSAO:setRadiusTarget(...) end
---@param ... any
---@return any
function PostEffectSSAO:setSamples(...) end
---@param ... any
---@return any
function PostEffectSSAO:setSelected(...) end
---@param ... any
---@return any
function PostEffectSSAO:setShaderConst(...) end
---@param ... any
---@return any
function PostEffectSSAO:setShaderMacro(...) end
---@param ... any
---@return any
function PostEffectSSAO:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PostEffectSSAO:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PostEffectSSAO:setTexture(...) end
---@param ... any
---@return any
function PostEffectSSAO:size(...) end
---@param ... any
---@return any
function PostEffectSSAO:sortByName(...) end
---@param ... any
---@return any
function PostEffectSSAO:toggle(...) end
---@param ... any
---@return any
function PostEffectSSAO:toggleDebug(...) end
---@param ... any
---@return any
function PostEffectSSAO:unregisterObject(...) end

---@class PostFxSMAAT2xResolve : PostEffectBase
---@field className any
local PostFxSMAAT2xResolve = {}
---@param ... any
---@return any
function PostFxSMAAT2xResolve:add(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:addObject(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:addWithName(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:assignFieldsFromObject(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:at(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:bringObjectToFront(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:bringToFront(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:clear(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:clearShaderMacros(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:clone(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:decRefCount(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:delete(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:deleteAllObjects(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:deleteObject(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:deletePersistentId(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:disable(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:dump(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:dumpShaderDisassembly(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:enable(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:findObject(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:findObjectById(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:findObjectByInternalName(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:findObjectIdAfter(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:generatePersistentId(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:getAspectRatio(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:getClassDocString(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:getClassName(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:getCount(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:getDeclarationLine(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:getDynamicFields(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:getField(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:getFieldInfo(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:getFieldList(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:getFields(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:getFieldsForEditor(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:getFileName(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:getGroup(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:getID(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:getId(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:getIdString(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:getInternalName(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:getName(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:getObject(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:getObjectIndex(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:getObjects(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:getRandom(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:getRenderTargetSize(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:getScenetreeData(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:idAt(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:incRefCount(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:inheritParentFields(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:inspectUpdate(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:isChildOfGroup(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:isEditorDirty(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:isEnabled(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:isHidden(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:isLocked(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:isMember(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:isNameChangeAllowed(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:isSelected(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:isSubClassOf(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:listObjects(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:onEditorDisable(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:onEditorEnable(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:postApply(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:preApply(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:pushObjectToBack(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:pushToBack(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:registerObject(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:reload(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:remove(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:removeObject(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:removeShaderMacro(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:reorderChild(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:save(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:serialize(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:serializeForEditor(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:serializeToDirectories(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:serializeToNameDictFile(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:setCanSave(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:setDeclarationLine(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:setEditorDirty(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:setEditorOnly(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:setField(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:setFileName(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:setHidden(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:setInternalName(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:setIsSelected(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:setLocked(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:setName(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:setNameChangeAllowed(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:setSelected(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:setShaderConst(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:setShaderMacro(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:setTexture(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:size(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:sortByName(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:toggle(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:toggleDebug(...) end
---@param ... any
---@return any
function PostFxSMAAT2xResolve:unregisterObject(...) end

---@class PostFxSSSR : PostEffectBase
---@field className any
---@field collectStatistics any modifiable
---@field debugView any modifiable
---@field denoiserEnabled any modifiable
---@field depthThickness any modifiable
---@field halfResolution any modifiable
---@field maxIntersections any modifiable
---@field minOccupancy any modifiable
---@field mostDetailedMip any modifiable
---@field resolutionDivisor any modifiable
---@field roughnessThreshold any modifiable
---@field samplesPerQuad any modifiable
---@field temporalStability any modifiable
---@field transparentReflections any modifiable
---@field varianceGuidedTracing any modifiable
---@field varianceThreshold any modifiable
local PostFxSSSR = {}
---@param ... any
---@return any
function PostFxSSSR:add(...) end
---@param ... any
---@return any
function PostFxSSSR:addObject(...) end
---@param ... any
---@return any
function PostFxSSSR:addWithName(...) end
---@param ... any
---@return any
function PostFxSSSR:assignFieldsFromObject(...) end
---@param ... any
---@return any
function PostFxSSSR:at(...) end
---@param ... any
---@return any
function PostFxSSSR:bringObjectToFront(...) end
---@param ... any
---@return any
function PostFxSSSR:bringToFront(...) end
---@param ... any
---@return any
function PostFxSSSR:clear(...) end
---@param ... any
---@return any
function PostFxSSSR:clearShaderMacros(...) end
---@param ... any
---@return any
function PostFxSSSR:clone(...) end
---@param ... any
---@return any
function PostFxSSSR:decRefCount(...) end
---@param ... any
---@return any
function PostFxSSSR:delete(...) end
---@param ... any
---@return any
function PostFxSSSR:deleteAllObjects(...) end
---@param ... any
---@return any
function PostFxSSSR:deleteObject(...) end
---@param ... any
---@return any
function PostFxSSSR:deletePersistentId(...) end
---@param ... any
---@return any
function PostFxSSSR:disable(...) end
---@param ... any
---@return any
function PostFxSSSR:dump(...) end
---@param ... any
---@return any
function PostFxSSSR:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function PostFxSSSR:dumpShaderDisassembly(...) end
---@param ... any
---@return any
function PostFxSSSR:enable(...) end
---@param ... any
---@return any
function PostFxSSSR:findObject(...) end
---@param ... any
---@return any
function PostFxSSSR:findObjectById(...) end
---@param ... any
---@return any
function PostFxSSSR:findObjectByInternalName(...) end
---@param ... any
---@return any
function PostFxSSSR:findObjectIdAfter(...) end
---@param ... any
---@return any
function PostFxSSSR:generatePersistentId(...) end
---@param ... any
---@return any
function PostFxSSSR:getAspectRatio(...) end
---@param ... any
---@return any
function PostFxSSSR:getClassDocString(...) end
---@param ... any
---@return any
function PostFxSSSR:getClassName(...) end
---@param ... any
---@return any
function PostFxSSSR:getCount(...) end
---@param ... any
---@return any
function PostFxSSSR:getDeclarationLine(...) end
---@param ... any
---@return any
function PostFxSSSR:getDenoiserStatus(...) end
---@param ... any
---@return any
function PostFxSSSR:getDenoiserTileCount(...) end
---@param ... any
---@return any
function PostFxSSSR:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function PostFxSSSR:getDynamicFields(...) end
---@param ... any
---@return any
function PostFxSSSR:getField(...) end
---@param ... any
---@return any
function PostFxSSSR:getFieldInfo(...) end
---@param ... any
---@return any
function PostFxSSSR:getFieldList(...) end
---@param ... any
---@return any
function PostFxSSSR:getFields(...) end
---@param ... any
---@return any
function PostFxSSSR:getFieldsForEditor(...) end
---@param ... any
---@return any
function PostFxSSSR:getFileName(...) end
---@param ... any
---@return any
function PostFxSSSR:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function PostFxSSSR:getGroup(...) end
---@param ... any
---@return any
function PostFxSSSR:getID(...) end
---@param ... any
---@return any
function PostFxSSSR:getId(...) end
---@param ... any
---@return any
function PostFxSSSR:getIdString(...) end
---@param ... any
---@return any
function PostFxSSSR:getInternalName(...) end
---@param ... any
---@return any
function PostFxSSSR:getName(...) end
---@param ... any
---@return any
function PostFxSSSR:getObject(...) end
---@param ... any
---@return any
function PostFxSSSR:getObjectIndex(...) end
---@param ... any
---@return any
function PostFxSSSR:getObjects(...) end
---@param ... any
---@return any
function PostFxSSSR:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function PostFxSSSR:getRandom(...) end
---@param ... any
---@return any
function PostFxSSSR:getRayCount(...) end
---@param ... any
---@return any
function PostFxSSSR:getRenderTargetSize(...) end
---@param ... any
---@return any
function PostFxSSSR:getScenetreeData(...) end
---@param ... any
---@return any
function PostFxSSSR:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PostFxSSSR:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PostFxSSSR:getStatus(...) end
---@param ... any
---@return any
function PostFxSSSR:getSurfaceStatus(...) end
---@param ... any
---@return any
function PostFxSSSR:idAt(...) end
---@param ... any
---@return any
function PostFxSSSR:incRefCount(...) end
---@param ... any
---@return any
function PostFxSSSR:inheritParentFields(...) end
---@param ... any
---@return any
function PostFxSSSR:inspectUpdate(...) end
---@param ... any
---@return any
function PostFxSSSR:isChildOfGroup(...) end
---@param ... any
---@return any
function PostFxSSSR:isEditorDirty(...) end
---@param ... any
---@return any
function PostFxSSSR:isEnabled(...) end
---@param ... any
---@return any
function PostFxSSSR:isHidden(...) end
---@param ... any
---@return any
function PostFxSSSR:isLocked(...) end
---@param ... any
---@return any
function PostFxSSSR:isMember(...) end
---@param ... any
---@return any
function PostFxSSSR:isNameChangeAllowed(...) end
---@param ... any
---@return any
function PostFxSSSR:isSelected(...) end
---@param ... any
---@return any
function PostFxSSSR:isSubClassOf(...) end
---@param ... any
---@return any
function PostFxSSSR:listObjects(...) end
---@param ... any
---@return any
function PostFxSSSR:onEditorDisable(...) end
---@param ... any
---@return any
function PostFxSSSR:onEditorEnable(...) end
---@param ... any
---@return any
function PostFxSSSR:postApply(...) end
---@param ... any
---@return any
function PostFxSSSR:preApply(...) end
---@param ... any
---@return any
function PostFxSSSR:pushObjectToBack(...) end
---@param ... any
---@return any
function PostFxSSSR:pushToBack(...) end
---@param ... any
---@return any
function PostFxSSSR:registerObject(...) end
---@param ... any
---@return any
function PostFxSSSR:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function PostFxSSSR:reload(...) end
---@param ... any
---@return any
function PostFxSSSR:remove(...) end
---@param ... any
---@return any
function PostFxSSSR:removeObject(...) end
---@param ... any
---@return any
function PostFxSSSR:removeShaderMacro(...) end
---@param ... any
---@return any
function PostFxSSSR:reorderChild(...) end
---@param ... any
---@return any
function PostFxSSSR:save(...) end
---@param ... any
---@return any
function PostFxSSSR:serialize(...) end
---@param ... any
---@return any
function PostFxSSSR:serializeForEditor(...) end
---@param ... any
---@return any
function PostFxSSSR:serializeToDirectories(...) end
---@param ... any
---@return any
function PostFxSSSR:serializeToNameDictFile(...) end
---@param ... any
---@return any
function PostFxSSSR:setCanSave(...) end
---@param ... any
---@return any
function PostFxSSSR:setDeclarationLine(...) end
---@param ... any
---@return any
function PostFxSSSR:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function PostFxSSSR:setEditorDirty(...) end
---@param ... any
---@return any
function PostFxSSSR:setEditorOnly(...) end
---@param ... any
---@return any
function PostFxSSSR:setField(...) end
---@param ... any
---@return any
function PostFxSSSR:setFileName(...) end
---@param ... any
---@return any
function PostFxSSSR:setHidden(...) end
---@param ... any
---@return any
function PostFxSSSR:setInternalName(...) end
---@param ... any
---@return any
function PostFxSSSR:setIsSelected(...) end
---@param ... any
---@return any
function PostFxSSSR:setLocked(...) end
---@param ... any
---@return any
function PostFxSSSR:setName(...) end
---@param ... any
---@return any
function PostFxSSSR:setNameChangeAllowed(...) end
---@param ... any
---@return any
function PostFxSSSR:setSelected(...) end
---@param ... any
---@return any
function PostFxSSSR:setShaderConst(...) end
---@param ... any
---@return any
function PostFxSSSR:setShaderMacro(...) end
---@param ... any
---@return any
function PostFxSSSR:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PostFxSSSR:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PostFxSSSR:setTexture(...) end
---@param ... any
---@return any
function PostFxSSSR:size(...) end
---@param ... any
---@return any
function PostFxSSSR:sortByName(...) end
---@param ... any
---@return any
function PostFxSSSR:toggle(...) end
---@param ... any
---@return any
function PostFxSSSR:toggleDebug(...) end
---@param ... any
---@return any
function PostFxSSSR:unregisterObject(...) end

---@class PostFxScreenSpaceShadows : PostEffectBase
---@field className any
local PostFxScreenSpaceShadows = {}
---@param ... any
---@return any
function PostFxScreenSpaceShadows:add(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:addObject(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:addWithName(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:assignFieldsFromObject(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:at(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:bringObjectToFront(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:bringToFront(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:clear(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:clearShaderMacros(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:clone(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:decRefCount(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:delete(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:deleteAllObjects(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:deleteObject(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:deletePersistentId(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:disable(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:dump(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:dumpShaderDisassembly(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:enable(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:findObject(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:findObjectById(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:findObjectByInternalName(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:findObjectIdAfter(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:generatePersistentId(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:getAspectRatio(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:getClassDocString(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:getClassName(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:getCount(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:getDeclarationLine(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:getDynamicFields(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:getField(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:getFieldInfo(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:getFieldList(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:getFields(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:getFieldsForEditor(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:getFileName(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:getGroup(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:getID(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:getId(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:getIdString(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:getInternalName(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:getName(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:getObject(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:getObjectIndex(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:getObjects(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:getRandom(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:getRenderTargetSize(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:getScenetreeData(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:idAt(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:incRefCount(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:inheritParentFields(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:inspectUpdate(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:isChildOfGroup(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:isEditorDirty(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:isEnabled(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:isHidden(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:isLocked(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:isMember(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:isNameChangeAllowed(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:isSelected(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:isSubClassOf(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:listObjects(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:onEditorDisable(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:onEditorEnable(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:postApply(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:preApply(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:pushObjectToBack(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:pushToBack(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:registerObject(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:reload(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:remove(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:removeObject(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:removeShaderMacro(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:reorderChild(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:save(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:serialize(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:serializeForEditor(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:serializeToDirectories(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:serializeToNameDictFile(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:setCanSave(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:setDeclarationLine(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:setEditorDirty(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:setEditorOnly(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:setField(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:setFileName(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:setHidden(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:setInternalName(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:setIsSelected(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:setLocked(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:setName(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:setNameChangeAllowed(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:setSelected(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:setShaderConst(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:setShaderMacro(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:setTexture(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:size(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:sortByName(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:toggle(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:toggleDebug(...) end
---@param ... any
---@return any
function PostFxScreenSpaceShadows:unregisterObject(...) end

---@class PrecipitationData : GameBaseData
---@field className any
local PrecipitationData = {}
---@param ... any
---@return any
function PrecipitationData:assignFieldsFromObject(...) end
---@param ... any
---@return any
function PrecipitationData:clone(...) end
---@param ... any
---@return any
function PrecipitationData:decRefCount(...) end
---@param ... any
---@return any
function PrecipitationData:delete(...) end
---@param ... any
---@return any
function PrecipitationData:deleteObject(...) end
---@param ... any
---@return any
function PrecipitationData:deletePersistentId(...) end
---@param ... any
---@return any
function PrecipitationData:dump(...) end
---@param ... any
---@return any
function PrecipitationData:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function PrecipitationData:generatePersistentId(...) end
---@param ... any
---@return any
function PrecipitationData:getClassDocString(...) end
---@param ... any
---@return any
function PrecipitationData:getClassName(...) end
---@param ... any
---@return any
function PrecipitationData:getDeclarationLine(...) end
---@param ... any
---@return any
function PrecipitationData:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function PrecipitationData:getDynamicFields(...) end
---@param ... any
---@return any
function PrecipitationData:getField(...) end
---@param ... any
---@return any
function PrecipitationData:getFieldInfo(...) end
---@param ... any
---@return any
function PrecipitationData:getFieldList(...) end
---@param ... any
---@return any
function PrecipitationData:getFields(...) end
---@param ... any
---@return any
function PrecipitationData:getFieldsForEditor(...) end
---@param ... any
---@return any
function PrecipitationData:getFileName(...) end
---@param ... any
---@return any
function PrecipitationData:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function PrecipitationData:getGroup(...) end
---@param ... any
---@return any
function PrecipitationData:getID(...) end
---@param ... any
---@return any
function PrecipitationData:getId(...) end
---@param ... any
---@return any
function PrecipitationData:getIdString(...) end
---@param ... any
---@return any
function PrecipitationData:getInternalName(...) end
---@param ... any
---@return any
function PrecipitationData:getName(...) end
---@param ... any
---@return any
function PrecipitationData:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function PrecipitationData:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PrecipitationData:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PrecipitationData:incRefCount(...) end
---@param ... any
---@return any
function PrecipitationData:inheritParentFields(...) end
---@param ... any
---@return any
function PrecipitationData:inspectUpdate(...) end
---@param ... any
---@return any
function PrecipitationData:isChildOfGroup(...) end
---@param ... any
---@return any
function PrecipitationData:isEditorDirty(...) end
---@param ... any
---@return any
function PrecipitationData:isHidden(...) end
---@param ... any
---@return any
function PrecipitationData:isLocked(...) end
---@param ... any
---@return any
function PrecipitationData:isNameChangeAllowed(...) end
---@param ... any
---@return any
function PrecipitationData:isSelected(...) end
---@param ... any
---@return any
function PrecipitationData:isSubClassOf(...) end
---@param ... any
---@return any
function PrecipitationData:onEditorDisable(...) end
---@param ... any
---@return any
function PrecipitationData:onEditorEnable(...) end
---@param ... any
---@return any
function PrecipitationData:postApply(...) end
---@param ... any
---@return any
function PrecipitationData:preApply(...) end
---@param ... any
---@return any
function PrecipitationData:registerObject(...) end
---@param ... any
---@return any
function PrecipitationData:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function PrecipitationData:save(...) end
---@param ... any
---@return any
function PrecipitationData:serialize(...) end
---@param ... any
---@return any
function PrecipitationData:serializeForEditor(...) end
---@param ... any
---@return any
function PrecipitationData:serializeToDirectories(...) end
---@param ... any
---@return any
function PrecipitationData:serializeToNameDictFile(...) end
---@param ... any
---@return any
function PrecipitationData:setCanSave(...) end
---@param ... any
---@return any
function PrecipitationData:setDeclarationLine(...) end
---@param ... any
---@return any
function PrecipitationData:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function PrecipitationData:setEditorDirty(...) end
---@param ... any
---@return any
function PrecipitationData:setEditorOnly(...) end
---@param ... any
---@return any
function PrecipitationData:setField(...) end
---@param ... any
---@return any
function PrecipitationData:setFileName(...) end
---@param ... any
---@return any
function PrecipitationData:setHidden(...) end
---@param ... any
---@return any
function PrecipitationData:setInternalName(...) end
---@param ... any
---@return any
function PrecipitationData:setIsSelected(...) end
---@param ... any
---@return any
function PrecipitationData:setLocked(...) end
---@param ... any
---@return any
function PrecipitationData:setName(...) end
---@param ... any
---@return any
function PrecipitationData:setNameChangeAllowed(...) end
---@param ... any
---@return any
function PrecipitationData:setSelected(...) end
---@param ... any
---@return any
function PrecipitationData:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function PrecipitationData:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function PrecipitationData:unregisterObject(...) end

---@class Prefab : SceneObject
---@field className any
local Prefab = {}
---@param ... any
---@return any
function Prefab:assignFieldsFromObject(...) end
---@param ... any
---@return any
function Prefab:at(...) end
---@param ... any
---@return any
function Prefab:canFloatAboveGround(...) end
---@param ... any
---@return any
function Prefab:clone(...) end
---@param ... any
---@return any
function Prefab:convertToV2(...) end
---@param ... any
---@return any
function Prefab:decRefCount(...) end
---@param ... any
---@return any
function Prefab:delete(...) end
---@param ... any
---@return any
function Prefab:deleteObject(...) end
---@param ... any
---@return any
function Prefab:deletePersistentId(...) end
---@param ... any
---@return any
function Prefab:disableCollision(...) end
---@param ... any
---@return any
function Prefab:dump(...) end
---@param ... any
---@return any
function Prefab:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function Prefab:enableCollision(...) end
---@param ... any
---@return any
function Prefab:explode(...) end
---@param ... any
---@return any
function Prefab:generatePersistentId(...) end
---@param ... any
---@return any
function Prefab:getAnchorNames(...) end
---@param ... any
---@return any
function Prefab:getChildGroup(...) end
---@param ... any
---@return any
function Prefab:getChildrenObjectIds(...) end
---@param ... any
---@return any
function Prefab:getClassDocString(...) end
---@param ... any
---@return any
function Prefab:getClassName(...) end
---@param ... any
---@return any
function Prefab:getDeclarationLine(...) end
---@param ... any
---@return any
function Prefab:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function Prefab:getDynamicFields(...) end
---@param ... any
---@return any
function Prefab:getEulerRotation(...) end
---@param ... any
---@return any
function Prefab:getField(...) end
---@param ... any
---@return any
function Prefab:getFieldInfo(...) end
---@param ... any
---@return any
function Prefab:getFieldList(...) end
---@param ... any
---@return any
function Prefab:getFields(...) end
---@param ... any
---@return any
function Prefab:getFieldsForEditor(...) end
---@param ... any
---@return any
function Prefab:getFileName(...) end
---@param ... any
---@return any
function Prefab:getFirstMaterialName(...) end
---@param ... any
---@return any
function Prefab:getForwardVector(...) end
---@param ... any
---@return any
function Prefab:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function Prefab:getGroup(...) end
---@param ... any
---@return any
function Prefab:getID(...) end
---@param ... any
---@return any
function Prefab:getId(...) end
---@param ... any
---@return any
function Prefab:getIdString(...) end
---@param ... any
---@return any
function Prefab:getInternalName(...) end
---@param ... any
---@return any
function Prefab:getMaterialNames(...) end
---@param ... any
---@return any
function Prefab:getMeshMaterialNames(...) end
---@param ... any
---@return any
function Prefab:getName(...) end
---@param ... any
---@return any
function Prefab:getObjBox(...) end
---@param ... any
---@return any
function Prefab:getObjectBox(...) end
---@param ... any
---@return any
function Prefab:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function Prefab:getPosition(...) end
---@param ... any
---@return any
function Prefab:getPositionXYZ(...) end
---@param ... any
---@return any
function Prefab:getRotation(...) end
---@param ... any
---@return any
function Prefab:getScale(...) end
---@param ... any
---@return any
function Prefab:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function Prefab:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function Prefab:getTransform(...) end
---@param ... any
---@return any
function Prefab:getTransformF(...) end
---@param ... any
---@return any
function Prefab:getType(...) end
---@param ... any
---@return any
function Prefab:getWorldBox(...) end
---@param ... any
---@return any
function Prefab:getWorldBoxCenter(...) end
---@param ... any
---@return any
function Prefab:getWorldTransform(...) end
---@param ... any
---@return any
function Prefab:hideInRenderView(...) end
---@param ... any
---@return any
function Prefab:incRefCount(...) end
---@param ... any
---@return any
function Prefab:inheritParentFields(...) end
---@param ... any
---@return any
function Prefab:inspectUpdate(...) end
---@param ... any
---@return any
function Prefab:isChildOfGroup(...) end
---@param ... any
---@return any
function Prefab:isEditorDirty(...) end
---@param ... any
---@return any
function Prefab:isGlobalBounds(...) end
---@param ... any
---@return any
function Prefab:isHidden(...) end
---@param ... any
---@return any
function Prefab:isLoaded(...) end
---@param ... any
---@return any
function Prefab:isLocked(...) end
---@param ... any
---@return any
function Prefab:isNameChangeAllowed(...) end
---@param ... any
---@return any
function Prefab:isRenderEnabled(...) end
---@param ... any
---@return any
function Prefab:isSelected(...) end
---@param ... any
---@return any
function Prefab:isSelectionEnabled(...) end
---@param ... any
---@return any
function Prefab:isSubClassOf(...) end
---@param ... any
---@return any
function Prefab:load(...) end
---@param ... any
---@return any
function Prefab:onEditorDisable(...) end
---@param ... any
---@return any
function Prefab:onEditorEnable(...) end
---@param ... any
---@return any
function Prefab:postApply(...) end
---@param ... any
---@return any
function Prefab:preApply(...) end
---@param ... any
---@return any
function Prefab:registerObject(...) end
---@param ... any
---@return any
function Prefab:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function Prefab:renderViewMaskClear(...) end
---@param ... any
---@return any
function Prefab:save(...) end
---@param ... any
---@return any
function Prefab:serialize(...) end
---@param ... any
---@return any
function Prefab:serializeForEditor(...) end
---@param ... any
---@return any
function Prefab:serializeToDirectories(...) end
---@param ... any
---@return any
function Prefab:serializeToNameDictFile(...) end
---@param ... any
---@return any
function Prefab:setCanFloatAboveGround(...) end
---@param ... any
---@return any
function Prefab:setCanSave(...) end
---@param ... any
---@return any
function Prefab:setChildGroup(...) end
---@param ... any
---@return any
function Prefab:setDeclarationLine(...) end
---@param ... any
---@return any
function Prefab:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function Prefab:setEditorDirty(...) end
---@param ... any
---@return any
function Prefab:setEditorOnly(...) end
---@param ... any
---@return any
function Prefab:setField(...) end
---@param ... any
---@return any
function Prefab:setFile(...) end
---@param ... any
---@return any
function Prefab:setFileName(...) end
---@param ... any
---@return any
function Prefab:setHidden(...) end
---@param ... any
---@return any
function Prefab:setInternalName(...) end
---@param ... any
---@return any
function Prefab:setIsSelected(...) end
---@param ... any
---@return any
function Prefab:setLoadMode(...) end
---@param ... any
---@return any
function Prefab:setLocked(...) end
---@param ... any
---@return any
function Prefab:setName(...) end
---@param ... any
---@return any
function Prefab:setNameChangeAllowed(...) end
---@param ... any
---@return any
function Prefab:setPosRot(...) end
---@param ... any
---@return any
function Prefab:setPosition(...) end
---@param ... any
---@return any
function Prefab:setPositionXYZ(...) end
---@param ... any
---@return any
function Prefab:setRenderEnabled(...) end
---@param ... any
---@return any
function Prefab:setScale(...) end
---@param ... any
---@return any
function Prefab:setScaleXYZ(...) end
---@param ... any
---@return any
function Prefab:setSelected(...) end
---@param ... any
---@return any
function Prefab:setSelectionEnabled(...) end
---@param ... any
---@return any
function Prefab:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function Prefab:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function Prefab:setTransform(...) end
---@param ... any
---@return any
function Prefab:setTransformF(...) end
---@param ... any
---@return any
function Prefab:showOnlyInRenderView(...) end
---@param ... any
---@return any
function Prefab:size(...) end
---@param ... any
---@return any
function Prefab:unhideInRenderView(...) end
---@param ... any
---@return any
function Prefab:unload(...) end
---@param ... any
---@return any
function Prefab:unregisterObject(...) end

---@class ReflectorDesc : SimDataBlock
---@field className any
local ReflectorDesc = {}
---@param ... any
---@return any
function ReflectorDesc:assignFieldsFromObject(...) end
---@param ... any
---@return any
function ReflectorDesc:clone(...) end
---@param ... any
---@return any
function ReflectorDesc:decRefCount(...) end
---@param ... any
---@return any
function ReflectorDesc:delete(...) end
---@param ... any
---@return any
function ReflectorDesc:deleteObject(...) end
---@param ... any
---@return any
function ReflectorDesc:deletePersistentId(...) end
---@param ... any
---@return any
function ReflectorDesc:dump(...) end
---@param ... any
---@return any
function ReflectorDesc:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function ReflectorDesc:generatePersistentId(...) end
---@param ... any
---@return any
function ReflectorDesc:getClassDocString(...) end
---@param ... any
---@return any
function ReflectorDesc:getClassName(...) end
---@param ... any
---@return any
function ReflectorDesc:getDeclarationLine(...) end
---@param ... any
---@return any
function ReflectorDesc:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function ReflectorDesc:getDynamicFields(...) end
---@param ... any
---@return any
function ReflectorDesc:getField(...) end
---@param ... any
---@return any
function ReflectorDesc:getFieldInfo(...) end
---@param ... any
---@return any
function ReflectorDesc:getFieldList(...) end
---@param ... any
---@return any
function ReflectorDesc:getFields(...) end
---@param ... any
---@return any
function ReflectorDesc:getFieldsForEditor(...) end
---@param ... any
---@return any
function ReflectorDesc:getFileName(...) end
---@param ... any
---@return any
function ReflectorDesc:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function ReflectorDesc:getGroup(...) end
---@param ... any
---@return any
function ReflectorDesc:getID(...) end
---@param ... any
---@return any
function ReflectorDesc:getId(...) end
---@param ... any
---@return any
function ReflectorDesc:getIdString(...) end
---@param ... any
---@return any
function ReflectorDesc:getInternalName(...) end
---@param ... any
---@return any
function ReflectorDesc:getName(...) end
---@param ... any
---@return any
function ReflectorDesc:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function ReflectorDesc:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function ReflectorDesc:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function ReflectorDesc:incRefCount(...) end
---@param ... any
---@return any
function ReflectorDesc:inheritParentFields(...) end
---@param ... any
---@return any
function ReflectorDesc:inspectUpdate(...) end
---@param ... any
---@return any
function ReflectorDesc:isChildOfGroup(...) end
---@param ... any
---@return any
function ReflectorDesc:isEditorDirty(...) end
---@param ... any
---@return any
function ReflectorDesc:isHidden(...) end
---@param ... any
---@return any
function ReflectorDesc:isLocked(...) end
---@param ... any
---@return any
function ReflectorDesc:isNameChangeAllowed(...) end
---@param ... any
---@return any
function ReflectorDesc:isSelected(...) end
---@param ... any
---@return any
function ReflectorDesc:isSubClassOf(...) end
---@param ... any
---@return any
function ReflectorDesc:onEditorDisable(...) end
---@param ... any
---@return any
function ReflectorDesc:onEditorEnable(...) end
---@param ... any
---@return any
function ReflectorDesc:postApply(...) end
---@param ... any
---@return any
function ReflectorDesc:preApply(...) end
---@param ... any
---@return any
function ReflectorDesc:registerObject(...) end
---@param ... any
---@return any
function ReflectorDesc:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function ReflectorDesc:save(...) end
---@param ... any
---@return any
function ReflectorDesc:serialize(...) end
---@param ... any
---@return any
function ReflectorDesc:serializeForEditor(...) end
---@param ... any
---@return any
function ReflectorDesc:serializeToDirectories(...) end
---@param ... any
---@return any
function ReflectorDesc:serializeToNameDictFile(...) end
---@param ... any
---@return any
function ReflectorDesc:setCanSave(...) end
---@param ... any
---@return any
function ReflectorDesc:setDeclarationLine(...) end
---@param ... any
---@return any
function ReflectorDesc:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function ReflectorDesc:setEditorDirty(...) end
---@param ... any
---@return any
function ReflectorDesc:setEditorOnly(...) end
---@param ... any
---@return any
function ReflectorDesc:setField(...) end
---@param ... any
---@return any
function ReflectorDesc:setFileName(...) end
---@param ... any
---@return any
function ReflectorDesc:setHidden(...) end
---@param ... any
---@return any
function ReflectorDesc:setInternalName(...) end
---@param ... any
---@return any
function ReflectorDesc:setIsSelected(...) end
---@param ... any
---@return any
function ReflectorDesc:setLocked(...) end
---@param ... any
---@return any
function ReflectorDesc:setName(...) end
---@param ... any
---@return any
function ReflectorDesc:setNameChangeAllowed(...) end
---@param ... any
---@return any
function ReflectorDesc:setSelected(...) end
---@param ... any
---@return any
function ReflectorDesc:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function ReflectorDesc:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function ReflectorDesc:unregisterObject(...) end

---@class RenderFormatToken : RenderPassStateToken
---@field className any
local RenderFormatToken = {}
---@param ... any
---@return any
function RenderFormatToken:assignFieldsFromObject(...) end
---@param ... any
---@return any
function RenderFormatToken:clone(...) end
---@param ... any
---@return any
function RenderFormatToken:decRefCount(...) end
---@param ... any
---@return any
function RenderFormatToken:delete(...) end
---@param ... any
---@return any
function RenderFormatToken:deleteObject(...) end
---@param ... any
---@return any
function RenderFormatToken:deletePersistentId(...) end
---@param ... any
---@return any
function RenderFormatToken:disable(...) end
---@param ... any
---@return any
function RenderFormatToken:dump(...) end
---@param ... any
---@return any
function RenderFormatToken:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function RenderFormatToken:enable(...) end
---@param ... any
---@return any
function RenderFormatToken:generatePersistentId(...) end
---@param ... any
---@return any
function RenderFormatToken:getClassDocString(...) end
---@param ... any
---@return any
function RenderFormatToken:getClassName(...) end
---@param ... any
---@return any
function RenderFormatToken:getDeclarationLine(...) end
---@param ... any
---@return any
function RenderFormatToken:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function RenderFormatToken:getDynamicFields(...) end
---@param ... any
---@return any
function RenderFormatToken:getField(...) end
---@param ... any
---@return any
function RenderFormatToken:getFieldInfo(...) end
---@param ... any
---@return any
function RenderFormatToken:getFieldList(...) end
---@param ... any
---@return any
function RenderFormatToken:getFields(...) end
---@param ... any
---@return any
function RenderFormatToken:getFieldsForEditor(...) end
---@param ... any
---@return any
function RenderFormatToken:getFileName(...) end
---@param ... any
---@return any
function RenderFormatToken:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function RenderFormatToken:getGroup(...) end
---@param ... any
---@return any
function RenderFormatToken:getID(...) end
---@param ... any
---@return any
function RenderFormatToken:getId(...) end
---@param ... any
---@return any
function RenderFormatToken:getIdString(...) end
---@param ... any
---@return any
function RenderFormatToken:getInternalName(...) end
---@param ... any
---@return any
function RenderFormatToken:getName(...) end
---@param ... any
---@return any
function RenderFormatToken:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function RenderFormatToken:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function RenderFormatToken:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function RenderFormatToken:incRefCount(...) end
---@param ... any
---@return any
function RenderFormatToken:inheritParentFields(...) end
---@param ... any
---@return any
function RenderFormatToken:inspectUpdate(...) end
---@param ... any
---@return any
function RenderFormatToken:isChildOfGroup(...) end
---@param ... any
---@return any
function RenderFormatToken:isEditorDirty(...) end
---@param ... any
---@return any
function RenderFormatToken:isHidden(...) end
---@param ... any
---@return any
function RenderFormatToken:isLocked(...) end
---@param ... any
---@return any
function RenderFormatToken:isNameChangeAllowed(...) end
---@param ... any
---@return any
function RenderFormatToken:isSelected(...) end
---@param ... any
---@return any
function RenderFormatToken:isSubClassOf(...) end
---@param ... any
---@return any
function RenderFormatToken:onEditorDisable(...) end
---@param ... any
---@return any
function RenderFormatToken:onEditorEnable(...) end
---@param ... any
---@return any
function RenderFormatToken:postApply(...) end
---@param ... any
---@return any
function RenderFormatToken:preApply(...) end
---@param ... any
---@return any
function RenderFormatToken:registerObject(...) end
---@param ... any
---@return any
function RenderFormatToken:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function RenderFormatToken:save(...) end
---@param ... any
---@return any
function RenderFormatToken:serialize(...) end
---@param ... any
---@return any
function RenderFormatToken:serializeForEditor(...) end
---@param ... any
---@return any
function RenderFormatToken:serializeToDirectories(...) end
---@param ... any
---@return any
function RenderFormatToken:serializeToNameDictFile(...) end
---@param ... any
---@return any
function RenderFormatToken:setCanSave(...) end
---@param ... any
---@return any
function RenderFormatToken:setDeclarationLine(...) end
---@param ... any
---@return any
function RenderFormatToken:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function RenderFormatToken:setEditorDirty(...) end
---@param ... any
---@return any
function RenderFormatToken:setEditorOnly(...) end
---@param ... any
---@return any
function RenderFormatToken:setField(...) end
---@param ... any
---@return any
function RenderFormatToken:setFileName(...) end
---@param ... any
---@return any
function RenderFormatToken:setHidden(...) end
---@param ... any
---@return any
function RenderFormatToken:setInternalName(...) end
---@param ... any
---@return any
function RenderFormatToken:setIsSelected(...) end
---@param ... any
---@return any
function RenderFormatToken:setLocked(...) end
---@param ... any
---@return any
function RenderFormatToken:setName(...) end
---@param ... any
---@return any
function RenderFormatToken:setNameChangeAllowed(...) end
---@param ... any
---@return any
function RenderFormatToken:setSelected(...) end
---@param ... any
---@return any
function RenderFormatToken:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function RenderFormatToken:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function RenderFormatToken:toggle(...) end
---@param ... any
---@return any
function RenderFormatToken:unregisterObject(...) end

---@class RenderPassManager : SimObject
---@field className any
local RenderPassManager = {}
---@param ... any
---@return any
function RenderPassManager:addManager(...) end
---@param ... any
---@return any
function RenderPassManager:assignFieldsFromObject(...) end
---@param ... any
---@return any
function RenderPassManager:clone(...) end
---@param ... any
---@return any
function RenderPassManager:decRefCount(...) end
---@param ... any
---@return any
function RenderPassManager:delete(...) end
---@param ... any
---@return any
function RenderPassManager:deleteObject(...) end
---@param ... any
---@return any
function RenderPassManager:deletePersistentId(...) end
---@param ... any
---@return any
function RenderPassManager:dump(...) end
---@param ... any
---@return any
function RenderPassManager:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function RenderPassManager:generatePersistentId(...) end
---@param ... any
---@return any
function RenderPassManager:getClassDocString(...) end
---@param ... any
---@return any
function RenderPassManager:getClassName(...) end
---@param ... any
---@return any
function RenderPassManager:getDeclarationLine(...) end
---@param ... any
---@return any
function RenderPassManager:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function RenderPassManager:getDynamicFields(...) end
---@param ... any
---@return any
function RenderPassManager:getField(...) end
---@param ... any
---@return any
function RenderPassManager:getFieldInfo(...) end
---@param ... any
---@return any
function RenderPassManager:getFieldList(...) end
---@param ... any
---@return any
function RenderPassManager:getFields(...) end
---@param ... any
---@return any
function RenderPassManager:getFieldsForEditor(...) end
---@param ... any
---@return any
function RenderPassManager:getFileName(...) end
---@param ... any
---@return any
function RenderPassManager:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function RenderPassManager:getGroup(...) end
---@param ... any
---@return any
function RenderPassManager:getID(...) end
---@param ... any
---@return any
function RenderPassManager:getId(...) end
---@param ... any
---@return any
function RenderPassManager:getIdString(...) end
---@param ... any
---@return any
function RenderPassManager:getInternalName(...) end
---@param ... any
---@return any
function RenderPassManager:getManager(...) end
---@param ... any
---@return any
function RenderPassManager:getManagerCount(...) end
---@param ... any
---@return any
function RenderPassManager:getName(...) end
---@param ... any
---@return any
function RenderPassManager:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function RenderPassManager:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function RenderPassManager:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function RenderPassManager:incRefCount(...) end
---@param ... any
---@return any
function RenderPassManager:inheritParentFields(...) end
---@param ... any
---@return any
function RenderPassManager:inspectUpdate(...) end
---@param ... any
---@return any
function RenderPassManager:isChildOfGroup(...) end
---@param ... any
---@return any
function RenderPassManager:isEditorDirty(...) end
---@param ... any
---@return any
function RenderPassManager:isHidden(...) end
---@param ... any
---@return any
function RenderPassManager:isLocked(...) end
---@param ... any
---@return any
function RenderPassManager:isNameChangeAllowed(...) end
---@param ... any
---@return any
function RenderPassManager:isSelected(...) end
---@param ... any
---@return any
function RenderPassManager:isSubClassOf(...) end
---@param ... any
---@return any
function RenderPassManager:onEditorDisable(...) end
---@param ... any
---@return any
function RenderPassManager:onEditorEnable(...) end
---@param ... any
---@return any
function RenderPassManager:postApply(...) end
---@param ... any
---@return any
function RenderPassManager:preApply(...) end
---@param ... any
---@return any
function RenderPassManager:registerObject(...) end
---@param ... any
---@return any
function RenderPassManager:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function RenderPassManager:removeManager(...) end
---@param ... any
---@return any
function RenderPassManager:save(...) end
---@param ... any
---@return any
function RenderPassManager:serialize(...) end
---@param ... any
---@return any
function RenderPassManager:serializeForEditor(...) end
---@param ... any
---@return any
function RenderPassManager:serializeToDirectories(...) end
---@param ... any
---@return any
function RenderPassManager:serializeToNameDictFile(...) end
---@param ... any
---@return any
function RenderPassManager:setCanSave(...) end
---@param ... any
---@return any
function RenderPassManager:setDeclarationLine(...) end
---@param ... any
---@return any
function RenderPassManager:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function RenderPassManager:setEditorDirty(...) end
---@param ... any
---@return any
function RenderPassManager:setEditorOnly(...) end
---@param ... any
---@return any
function RenderPassManager:setField(...) end
---@param ... any
---@return any
function RenderPassManager:setFileName(...) end
---@param ... any
---@return any
function RenderPassManager:setHidden(...) end
---@param ... any
---@return any
function RenderPassManager:setInternalName(...) end
---@param ... any
---@return any
function RenderPassManager:setIsSelected(...) end
---@param ... any
---@return any
function RenderPassManager:setLocked(...) end
---@param ... any
---@return any
function RenderPassManager:setName(...) end
---@param ... any
---@return any
function RenderPassManager:setNameChangeAllowed(...) end
---@param ... any
---@return any
function RenderPassManager:setSelected(...) end
---@param ... any
---@return any
function RenderPassManager:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function RenderPassManager:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function RenderPassManager:unregisterObject(...) end

---@class RenderPassStateToken : SimObject
---@field className any
local RenderPassStateToken = {}
---@param ... any
---@return any
function RenderPassStateToken:assignFieldsFromObject(...) end
---@param ... any
---@return any
function RenderPassStateToken:clone(...) end
---@param ... any
---@return any
function RenderPassStateToken:decRefCount(...) end
---@param ... any
---@return any
function RenderPassStateToken:delete(...) end
---@param ... any
---@return any
function RenderPassStateToken:deleteObject(...) end
---@param ... any
---@return any
function RenderPassStateToken:deletePersistentId(...) end
---@param ... any
---@return any
function RenderPassStateToken:disable(...) end
---@param ... any
---@return any
function RenderPassStateToken:dump(...) end
---@param ... any
---@return any
function RenderPassStateToken:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function RenderPassStateToken:enable(...) end
---@param ... any
---@return any
function RenderPassStateToken:generatePersistentId(...) end
---@param ... any
---@return any
function RenderPassStateToken:getClassDocString(...) end
---@param ... any
---@return any
function RenderPassStateToken:getClassName(...) end
---@param ... any
---@return any
function RenderPassStateToken:getDeclarationLine(...) end
---@param ... any
---@return any
function RenderPassStateToken:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function RenderPassStateToken:getDynamicFields(...) end
---@param ... any
---@return any
function RenderPassStateToken:getField(...) end
---@param ... any
---@return any
function RenderPassStateToken:getFieldInfo(...) end
---@param ... any
---@return any
function RenderPassStateToken:getFieldList(...) end
---@param ... any
---@return any
function RenderPassStateToken:getFields(...) end
---@param ... any
---@return any
function RenderPassStateToken:getFieldsForEditor(...) end
---@param ... any
---@return any
function RenderPassStateToken:getFileName(...) end
---@param ... any
---@return any
function RenderPassStateToken:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function RenderPassStateToken:getGroup(...) end
---@param ... any
---@return any
function RenderPassStateToken:getID(...) end
---@param ... any
---@return any
function RenderPassStateToken:getId(...) end
---@param ... any
---@return any
function RenderPassStateToken:getIdString(...) end
---@param ... any
---@return any
function RenderPassStateToken:getInternalName(...) end
---@param ... any
---@return any
function RenderPassStateToken:getName(...) end
---@param ... any
---@return any
function RenderPassStateToken:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function RenderPassStateToken:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function RenderPassStateToken:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function RenderPassStateToken:incRefCount(...) end
---@param ... any
---@return any
function RenderPassStateToken:inheritParentFields(...) end
---@param ... any
---@return any
function RenderPassStateToken:inspectUpdate(...) end
---@param ... any
---@return any
function RenderPassStateToken:isChildOfGroup(...) end
---@param ... any
---@return any
function RenderPassStateToken:isEditorDirty(...) end
---@param ... any
---@return any
function RenderPassStateToken:isHidden(...) end
---@param ... any
---@return any
function RenderPassStateToken:isLocked(...) end
---@param ... any
---@return any
function RenderPassStateToken:isNameChangeAllowed(...) end
---@param ... any
---@return any
function RenderPassStateToken:isSelected(...) end
---@param ... any
---@return any
function RenderPassStateToken:isSubClassOf(...) end
---@param ... any
---@return any
function RenderPassStateToken:onEditorDisable(...) end
---@param ... any
---@return any
function RenderPassStateToken:onEditorEnable(...) end
---@param ... any
---@return any
function RenderPassStateToken:postApply(...) end
---@param ... any
---@return any
function RenderPassStateToken:preApply(...) end
---@param ... any
---@return any
function RenderPassStateToken:registerObject(...) end
---@param ... any
---@return any
function RenderPassStateToken:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function RenderPassStateToken:save(...) end
---@param ... any
---@return any
function RenderPassStateToken:serialize(...) end
---@param ... any
---@return any
function RenderPassStateToken:serializeForEditor(...) end
---@param ... any
---@return any
function RenderPassStateToken:serializeToDirectories(...) end
---@param ... any
---@return any
function RenderPassStateToken:serializeToNameDictFile(...) end
---@param ... any
---@return any
function RenderPassStateToken:setCanSave(...) end
---@param ... any
---@return any
function RenderPassStateToken:setDeclarationLine(...) end
---@param ... any
---@return any
function RenderPassStateToken:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function RenderPassStateToken:setEditorDirty(...) end
---@param ... any
---@return any
function RenderPassStateToken:setEditorOnly(...) end
---@param ... any
---@return any
function RenderPassStateToken:setField(...) end
---@param ... any
---@return any
function RenderPassStateToken:setFileName(...) end
---@param ... any
---@return any
function RenderPassStateToken:setHidden(...) end
---@param ... any
---@return any
function RenderPassStateToken:setInternalName(...) end
---@param ... any
---@return any
function RenderPassStateToken:setIsSelected(...) end
---@param ... any
---@return any
function RenderPassStateToken:setLocked(...) end
---@param ... any
---@return any
function RenderPassStateToken:setName(...) end
---@param ... any
---@return any
function RenderPassStateToken:setNameChangeAllowed(...) end
---@param ... any
---@return any
function RenderPassStateToken:setSelected(...) end
---@param ... any
---@return any
function RenderPassStateToken:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function RenderPassStateToken:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function RenderPassStateToken:toggle(...) end
---@param ... any
---@return any
function RenderPassStateToken:unregisterObject(...) end

---@class RenderUpscaleOverlayToken : RenderPassStateToken
---@field className any
local RenderUpscaleOverlayToken = {}
---@param ... any
---@return any
function RenderUpscaleOverlayToken:assignFieldsFromObject(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:clone(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:decRefCount(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:delete(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:deleteObject(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:deletePersistentId(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:disable(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:dump(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:enable(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:generatePersistentId(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:getClassDocString(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:getClassName(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:getDeclarationLine(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:getDynamicFields(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:getField(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:getFieldInfo(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:getFieldList(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:getFields(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:getFieldsForEditor(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:getFileName(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:getGroup(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:getID(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:getId(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:getIdString(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:getInternalName(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:getName(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:incRefCount(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:inheritParentFields(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:inspectUpdate(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:isChildOfGroup(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:isEditorDirty(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:isHidden(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:isLocked(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:isNameChangeAllowed(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:isSelected(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:isSubClassOf(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:onEditorDisable(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:onEditorEnable(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:postApply(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:preApply(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:registerObject(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:save(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:serialize(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:serializeForEditor(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:serializeToDirectories(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:serializeToNameDictFile(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:setCanSave(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:setDeclarationLine(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:setEditorDirty(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:setEditorOnly(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:setField(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:setFileName(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:setHidden(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:setInternalName(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:setIsSelected(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:setLocked(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:setName(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:setNameChangeAllowed(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:setSelected(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:toggle(...) end
---@param ... any
---@return any
function RenderUpscaleOverlayToken:unregisterObject(...) end

---@class RenderUpscaleToken : RenderPassStateToken
---@field className any
local RenderUpscaleToken = {}
---@param ... any
---@return any
function RenderUpscaleToken:assignFieldsFromObject(...) end
---@param ... any
---@return any
function RenderUpscaleToken:clone(...) end
---@param ... any
---@return any
function RenderUpscaleToken:decRefCount(...) end
---@param ... any
---@return any
function RenderUpscaleToken:delete(...) end
---@param ... any
---@return any
function RenderUpscaleToken:deleteObject(...) end
---@param ... any
---@return any
function RenderUpscaleToken:deletePersistentId(...) end
---@param ... any
---@return any
function RenderUpscaleToken:disable(...) end
---@param ... any
---@return any
function RenderUpscaleToken:dump(...) end
---@param ... any
---@return any
function RenderUpscaleToken:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function RenderUpscaleToken:enable(...) end
---@param ... any
---@return any
function RenderUpscaleToken:generatePersistentId(...) end
---@param ... any
---@return any
function RenderUpscaleToken:getClassDocString(...) end
---@param ... any
---@return any
function RenderUpscaleToken:getClassName(...) end
---@param ... any
---@return any
function RenderUpscaleToken:getDeclarationLine(...) end
---@param ... any
---@return any
function RenderUpscaleToken:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function RenderUpscaleToken:getDynamicFields(...) end
---@param ... any
---@return any
function RenderUpscaleToken:getField(...) end
---@param ... any
---@return any
function RenderUpscaleToken:getFieldInfo(...) end
---@param ... any
---@return any
function RenderUpscaleToken:getFieldList(...) end
---@param ... any
---@return any
function RenderUpscaleToken:getFields(...) end
---@param ... any
---@return any
function RenderUpscaleToken:getFieldsForEditor(...) end
---@param ... any
---@return any
function RenderUpscaleToken:getFileName(...) end
---@param ... any
---@return any
function RenderUpscaleToken:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function RenderUpscaleToken:getGroup(...) end
---@param ... any
---@return any
function RenderUpscaleToken:getID(...) end
---@param ... any
---@return any
function RenderUpscaleToken:getId(...) end
---@param ... any
---@return any
function RenderUpscaleToken:getIdString(...) end
---@param ... any
---@return any
function RenderUpscaleToken:getInternalName(...) end
---@param ... any
---@return any
function RenderUpscaleToken:getName(...) end
---@param ... any
---@return any
function RenderUpscaleToken:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function RenderUpscaleToken:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function RenderUpscaleToken:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function RenderUpscaleToken:incRefCount(...) end
---@param ... any
---@return any
function RenderUpscaleToken:inheritParentFields(...) end
---@param ... any
---@return any
function RenderUpscaleToken:inspectUpdate(...) end
---@param ... any
---@return any
function RenderUpscaleToken:isChildOfGroup(...) end
---@param ... any
---@return any
function RenderUpscaleToken:isEditorDirty(...) end
---@param ... any
---@return any
function RenderUpscaleToken:isHidden(...) end
---@param ... any
---@return any
function RenderUpscaleToken:isLocked(...) end
---@param ... any
---@return any
function RenderUpscaleToken:isNameChangeAllowed(...) end
---@param ... any
---@return any
function RenderUpscaleToken:isSelected(...) end
---@param ... any
---@return any
function RenderUpscaleToken:isSubClassOf(...) end
---@param ... any
---@return any
function RenderUpscaleToken:onEditorDisable(...) end
---@param ... any
---@return any
function RenderUpscaleToken:onEditorEnable(...) end
---@param ... any
---@return any
function RenderUpscaleToken:postApply(...) end
---@param ... any
---@return any
function RenderUpscaleToken:preApply(...) end
---@param ... any
---@return any
function RenderUpscaleToken:registerObject(...) end
---@param ... any
---@return any
function RenderUpscaleToken:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function RenderUpscaleToken:save(...) end
---@param ... any
---@return any
function RenderUpscaleToken:serialize(...) end
---@param ... any
---@return any
function RenderUpscaleToken:serializeForEditor(...) end
---@param ... any
---@return any
function RenderUpscaleToken:serializeToDirectories(...) end
---@param ... any
---@return any
function RenderUpscaleToken:serializeToNameDictFile(...) end
---@param ... any
---@return any
function RenderUpscaleToken:setCanSave(...) end
---@param ... any
---@return any
function RenderUpscaleToken:setDeclarationLine(...) end
---@param ... any
---@return any
function RenderUpscaleToken:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function RenderUpscaleToken:setEditorDirty(...) end
---@param ... any
---@return any
function RenderUpscaleToken:setEditorOnly(...) end
---@param ... any
---@return any
function RenderUpscaleToken:setField(...) end
---@param ... any
---@return any
function RenderUpscaleToken:setFileName(...) end
---@param ... any
---@return any
function RenderUpscaleToken:setHidden(...) end
---@param ... any
---@return any
function RenderUpscaleToken:setInternalName(...) end
---@param ... any
---@return any
function RenderUpscaleToken:setIsSelected(...) end
---@param ... any
---@return any
function RenderUpscaleToken:setLocked(...) end
---@param ... any
---@return any
function RenderUpscaleToken:setName(...) end
---@param ... any
---@return any
function RenderUpscaleToken:setNameChangeAllowed(...) end
---@param ... any
---@return any
function RenderUpscaleToken:setSelected(...) end
---@param ... any
---@return any
function RenderUpscaleToken:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function RenderUpscaleToken:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function RenderUpscaleToken:toggle(...) end
---@param ... any
---@return any
function RenderUpscaleToken:unregisterObject(...) end

---@class RenderViewManager
---@field __gc any
---@field __index any
local RenderViewManager = {}
---@param ... any
---@return any
function RenderViewManager:cameraNameEquals(...) end
---@param ... any
---@return any
function RenderViewManager:destroyView(...) end
---@param ... any
---@return any
function RenderViewManager:getOrCreateView(...) end
---@param ... any
---@return any
function RenderViewManager:getView(...) end
---@param ... any
---@return any
function RenderViewManager:getViewNames(...) end
---@param ... any
---@return any
function RenderViewManager:updateViewCamera(...) end

---@class River : WaterObject
---@field className any
local River = {}
---@param ... any
---@return any
function River:assignFieldsFromObject(...) end
---@param ... any
---@return any
function River:canFloatAboveGround(...) end
---@param ... any
---@return any
function River:clone(...) end
---@param ... any
---@return any
function River:collideRay(...) end
---@param ... any
---@return any
function River:containsPoint(...) end
---@param ... any
---@return any
function River:decRefCount(...) end
---@param ... any
---@return any
function River:delete(...) end
---@param ... any
---@return any
function River:deleteNode(...) end
---@param ... any
---@return any
function River:deleteNodeNoRegen(...) end
---@param ... any
---@return any
function River:deleteObject(...) end
---@param ... any
---@return any
function River:deletePersistentId(...) end
---@param ... any
---@return any
function River:disableCollision(...) end
---@param ... any
---@return any
function River:dump(...) end
---@param ... any
---@return any
function River:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function River:enableCollision(...) end
---@param ... any
---@return any
function River:generatePersistentId(...) end
---@param ... any
---@return any
function River:getAnchorNames(...) end
---@param ... any
---@return any
function River:getBottomLeftEdgePosition(...) end
---@param ... any
---@return any
function River:getBottomRightEdgePosition(...) end
---@param ... any
---@return any
function River:getClassDocString(...) end
---@param ... any
---@return any
function River:getClassName(...) end
---@param ... any
---@return any
function River:getDeclarationLine(...) end
---@param ... any
---@return any
function River:getDepthAtPoint(...) end
---@param ... any
---@return any
function River:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function River:getDynamicFields(...) end
---@param ... any
---@return any
function River:getEdgeCount(...) end
---@param ... any
---@return any
function River:getEulerRotation(...) end
---@param ... any
---@return any
function River:getField(...) end
---@param ... any
---@return any
function River:getFieldInfo(...) end
---@param ... any
---@return any
function River:getFieldList(...) end
---@param ... any
---@return any
function River:getFields(...) end
---@param ... any
---@return any
function River:getFieldsForEditor(...) end
---@param ... any
---@return any
function River:getFileName(...) end
---@param ... any
---@return any
function River:getFirstMaterialName(...) end
---@param ... any
---@return any
function River:getFlowAtPoint(...) end
---@param ... any
---@return any
function River:getForwardVector(...) end
---@param ... any
---@return any
function River:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function River:getGroup(...) end
---@param ... any
---@return any
function River:getID(...) end
---@param ... any
---@return any
function River:getId(...) end
---@param ... any
---@return any
function River:getIdString(...) end
---@param ... any
---@return any
function River:getInternalName(...) end
---@param ... any
---@return any
function River:getLinkedSegmentsCenterPoints(...) end
---@param ... any
---@return any
function River:getLinkedSegmentsCorners(...) end
---@param ... any
---@return any
function River:getMaterialNames(...) end
---@param ... any
---@return any
function River:getMeshMaterialNames(...) end
---@param ... any
---@return any
function River:getName(...) end
---@param ... any
---@return any
function River:getNode(...) end
---@param ... any
---@return any
function River:getNodeCount(...) end
---@param ... any
---@return any
function River:getNodeDepth(...) end
---@param ... any
---@return any
function River:getNodeNormal(...) end
---@param ... any
---@return any
function River:getNodePosition(...) end
---@param ... any
---@return any
function River:getNodeTransform(...) end
---@param ... any
---@return any
function River:getNodeWidth(...) end
---@param ... any
---@return any
function River:getObjBox(...) end
---@param ... any
---@return any
function River:getObjectBox(...) end
---@param ... any
---@return any
function River:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function River:getPosition(...) end
---@param ... any
---@return any
function River:getPositionXYZ(...) end
---@param ... any
---@return any
function River:getRotation(...) end
---@param ... any
---@return any
function River:getScale(...) end
---@param ... any
---@return any
function River:getSegmentCenter(...) end
---@param ... any
---@return any
function River:getSegmentCenterPoints(...) end
---@param ... any
---@return any
function River:getSegmentCount(...) end
---@param ... any
---@return any
function River:getSegmentDepth(...) end
---@param ... any
---@return any
function River:getSegmentSurfaceCorners(...) end
---@param ... any
---@return any
function River:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function River:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function River:getSurfaceHeightAtPoint(...) end
---@param ... any
---@return any
function River:getTopLeftEdgePosition(...) end
---@param ... any
---@return any
function River:getTopMiddleEdgePosition(...) end
---@param ... any
---@return any
function River:getTopRightEdgePosition(...) end
---@param ... any
---@return any
function River:getTransform(...) end
---@param ... any
---@return any
function River:getTransformF(...) end
---@param ... any
---@return any
function River:getType(...) end
---@param ... any
---@return any
function River:getWorldBox(...) end
---@param ... any
---@return any
function River:getWorldBoxCenter(...) end
---@param ... any
---@return any
function River:getWorldTransform(...) end
---@param ... any
---@return any
function River:hideInRenderView(...) end
---@param ... any
---@return any
function River:incRefCount(...) end
---@param ... any
---@return any
function River:inheritParentFields(...) end
---@param ... any
---@return any
function River:insertNode(...) end
---@param ... any
---@return any
function River:insertNodeNoRegen(...) end
---@param ... any
---@return any
function River:inspectUpdate(...) end
---@param ... any
---@return any
function River:isChildOfGroup(...) end
---@param ... any
---@return any
function River:isEditorDirty(...) end
---@param ... any
---@return any
function River:isGlobalBounds(...) end
---@param ... any
---@return any
function River:isHidden(...) end
---@param ... any
---@return any
function River:isLocked(...) end
---@param ... any
---@return any
function River:isNameChangeAllowed(...) end
---@param ... any
---@return any
function River:isRenderEnabled(...) end
---@param ... any
---@return any
function River:isSelected(...) end
---@param ... any
---@return any
function River:isSelectionEnabled(...) end
---@param ... any
---@return any
function River:isSubClassOf(...) end
---@param ... any
---@return any
function River:onEditorDisable(...) end
---@param ... any
---@return any
function River:onEditorEnable(...) end
---@param ... any
---@return any
function River:postApply(...) end
---@param ... any
---@return any
function River:preApply(...) end
---@param ... any
---@return any
function River:regenerate(...) end
---@param ... any
---@return any
function River:registerObject(...) end
---@param ... any
---@return any
function River:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function River:reloadTextures(...) end
---@param ... any
---@return any
function River:renderViewMaskClear(...) end
---@param ... any
---@return any
function River:save(...) end
---@param ... any
---@return any
function River:serialize(...) end
---@param ... any
---@return any
function River:serializeForEditor(...) end
---@param ... any
---@return any
function River:serializeToDirectories(...) end
---@param ... any
---@return any
function River:serializeToNameDictFile(...) end
---@param ... any
---@return any
function River:setBatchSize(...) end
---@param ... any
---@return any
function River:setCanFloatAboveGround(...) end
---@param ... any
---@return any
function River:setCanSave(...) end
---@param ... any
---@return any
function River:setDeclarationLine(...) end
---@param ... any
---@return any
function River:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function River:setEditorDirty(...) end
---@param ... any
---@return any
function River:setEditorOnly(...) end
---@param ... any
---@return any
function River:setField(...) end
---@param ... any
---@return any
function River:setFileName(...) end
---@param ... any
---@return any
function River:setHidden(...) end
---@param ... any
---@return any
function River:setInternalName(...) end
---@param ... any
---@return any
function River:setIsSelected(...) end
---@param ... any
---@return any
function River:setLocked(...) end
---@param ... any
---@return any
function River:setMaxDivisionSize(...) end
---@param ... any
---@return any
function River:setMetersPerSegment(...) end
---@param ... any
---@return any
function River:setName(...) end
---@param ... any
---@return any
function River:setNameChangeAllowed(...) end
---@param ... any
---@return any
function River:setNodeDepth(...) end
---@param ... any
---@return any
function River:setNodeNormal(...) end
---@param ... any
---@return any
function River:setNodePosition(...) end
---@param ... any
---@return any
function River:setNodeWidth(...) end
---@param ... any
---@return any
function River:setPosRot(...) end
---@param ... any
---@return any
function River:setPosition(...) end
---@param ... any
---@return any
function River:setPositionXYZ(...) end
---@param ... any
---@return any
function River:setRenderEnabled(...) end
---@param ... any
---@return any
function River:setScale(...) end
---@param ... any
---@return any
function River:setScaleXYZ(...) end
---@param ... any
---@return any
function River:setSelected(...) end
---@param ... any
---@return any
function River:setSelectionEnabled(...) end
---@param ... any
---@return any
function River:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function River:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function River:setTransform(...) end
---@param ... any
---@return any
function River:setTransformF(...) end
---@param ... any
---@return any
function River:showOnlyInRenderView(...) end
---@param ... any
---@return any
function River:unhideInRenderView(...) end
---@param ... any
---@return any
function River:unregisterObject(...) end

---@class SFXAmbience : SimDataBlock
---@field className any
local SFXAmbience = {}
---@param ... any
---@return any
function SFXAmbience:assignFieldsFromObject(...) end
---@param ... any
---@return any
function SFXAmbience:clone(...) end
---@param ... any
---@return any
function SFXAmbience:decRefCount(...) end
---@param ... any
---@return any
function SFXAmbience:delete(...) end
---@param ... any
---@return any
function SFXAmbience:deleteObject(...) end
---@param ... any
---@return any
function SFXAmbience:deletePersistentId(...) end
---@param ... any
---@return any
function SFXAmbience:dump(...) end
---@param ... any
---@return any
function SFXAmbience:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function SFXAmbience:generatePersistentId(...) end
---@param ... any
---@return any
function SFXAmbience:getClassDocString(...) end
---@param ... any
---@return any
function SFXAmbience:getClassName(...) end
---@param ... any
---@return any
function SFXAmbience:getDeclarationLine(...) end
---@param ... any
---@return any
function SFXAmbience:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function SFXAmbience:getDynamicFields(...) end
---@param ... any
---@return any
function SFXAmbience:getField(...) end
---@param ... any
---@return any
function SFXAmbience:getFieldInfo(...) end
---@param ... any
---@return any
function SFXAmbience:getFieldList(...) end
---@param ... any
---@return any
function SFXAmbience:getFields(...) end
---@param ... any
---@return any
function SFXAmbience:getFieldsForEditor(...) end
---@param ... any
---@return any
function SFXAmbience:getFileName(...) end
---@param ... any
---@return any
function SFXAmbience:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function SFXAmbience:getGroup(...) end
---@param ... any
---@return any
function SFXAmbience:getID(...) end
---@param ... any
---@return any
function SFXAmbience:getId(...) end
---@param ... any
---@return any
function SFXAmbience:getIdString(...) end
---@param ... any
---@return any
function SFXAmbience:getInternalName(...) end
---@param ... any
---@return any
function SFXAmbience:getName(...) end
---@param ... any
---@return any
function SFXAmbience:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function SFXAmbience:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SFXAmbience:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SFXAmbience:incRefCount(...) end
---@param ... any
---@return any
function SFXAmbience:inheritParentFields(...) end
---@param ... any
---@return any
function SFXAmbience:inspectUpdate(...) end
---@param ... any
---@return any
function SFXAmbience:isChildOfGroup(...) end
---@param ... any
---@return any
function SFXAmbience:isEditorDirty(...) end
---@param ... any
---@return any
function SFXAmbience:isHidden(...) end
---@param ... any
---@return any
function SFXAmbience:isLocked(...) end
---@param ... any
---@return any
function SFXAmbience:isNameChangeAllowed(...) end
---@param ... any
---@return any
function SFXAmbience:isSelected(...) end
---@param ... any
---@return any
function SFXAmbience:isSubClassOf(...) end
---@param ... any
---@return any
function SFXAmbience:onEditorDisable(...) end
---@param ... any
---@return any
function SFXAmbience:onEditorEnable(...) end
---@param ... any
---@return any
function SFXAmbience:postApply(...) end
---@param ... any
---@return any
function SFXAmbience:preApply(...) end
---@param ... any
---@return any
function SFXAmbience:registerObject(...) end
---@param ... any
---@return any
function SFXAmbience:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function SFXAmbience:save(...) end
---@param ... any
---@return any
function SFXAmbience:serialize(...) end
---@param ... any
---@return any
function SFXAmbience:serializeForEditor(...) end
---@param ... any
---@return any
function SFXAmbience:serializeToDirectories(...) end
---@param ... any
---@return any
function SFXAmbience:serializeToNameDictFile(...) end
---@param ... any
---@return any
function SFXAmbience:setCanSave(...) end
---@param ... any
---@return any
function SFXAmbience:setDeclarationLine(...) end
---@param ... any
---@return any
function SFXAmbience:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function SFXAmbience:setEditorDirty(...) end
---@param ... any
---@return any
function SFXAmbience:setEditorOnly(...) end
---@param ... any
---@return any
function SFXAmbience:setField(...) end
---@param ... any
---@return any
function SFXAmbience:setFileName(...) end
---@param ... any
---@return any
function SFXAmbience:setHidden(...) end
---@param ... any
---@return any
function SFXAmbience:setInternalName(...) end
---@param ... any
---@return any
function SFXAmbience:setIsSelected(...) end
---@param ... any
---@return any
function SFXAmbience:setLocked(...) end
---@param ... any
---@return any
function SFXAmbience:setName(...) end
---@param ... any
---@return any
function SFXAmbience:setNameChangeAllowed(...) end
---@param ... any
---@return any
function SFXAmbience:setSelected(...) end
---@param ... any
---@return any
function SFXAmbience:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SFXAmbience:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SFXAmbience:unregisterObject(...) end

---@class SFXDescription : SimDataBlock
---@field className any
local SFXDescription = {}
---@param ... any
---@return any
function SFXDescription:assignFieldsFromObject(...) end
---@param ... any
---@return any
function SFXDescription:clone(...) end
---@param ... any
---@return any
function SFXDescription:decRefCount(...) end
---@param ... any
---@return any
function SFXDescription:delete(...) end
---@param ... any
---@return any
function SFXDescription:deleteObject(...) end
---@param ... any
---@return any
function SFXDescription:deletePersistentId(...) end
---@param ... any
---@return any
function SFXDescription:dump(...) end
---@param ... any
---@return any
function SFXDescription:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function SFXDescription:generatePersistentId(...) end
---@param ... any
---@return any
function SFXDescription:getClassDocString(...) end
---@param ... any
---@return any
function SFXDescription:getClassName(...) end
---@param ... any
---@return any
function SFXDescription:getDeclarationLine(...) end
---@param ... any
---@return any
function SFXDescription:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function SFXDescription:getDynamicFields(...) end
---@param ... any
---@return any
function SFXDescription:getField(...) end
---@param ... any
---@return any
function SFXDescription:getFieldInfo(...) end
---@param ... any
---@return any
function SFXDescription:getFieldList(...) end
---@param ... any
---@return any
function SFXDescription:getFields(...) end
---@param ... any
---@return any
function SFXDescription:getFieldsForEditor(...) end
---@param ... any
---@return any
function SFXDescription:getFileName(...) end
---@param ... any
---@return any
function SFXDescription:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function SFXDescription:getGroup(...) end
---@param ... any
---@return any
function SFXDescription:getID(...) end
---@param ... any
---@return any
function SFXDescription:getId(...) end
---@param ... any
---@return any
function SFXDescription:getIdString(...) end
---@param ... any
---@return any
function SFXDescription:getInternalName(...) end
---@param ... any
---@return any
function SFXDescription:getName(...) end
---@param ... any
---@return any
function SFXDescription:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function SFXDescription:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SFXDescription:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SFXDescription:incRefCount(...) end
---@param ... any
---@return any
function SFXDescription:inheritParentFields(...) end
---@param ... any
---@return any
function SFXDescription:inspectUpdate(...) end
---@param ... any
---@return any
function SFXDescription:isChildOfGroup(...) end
---@param ... any
---@return any
function SFXDescription:isEditorDirty(...) end
---@param ... any
---@return any
function SFXDescription:isHidden(...) end
---@param ... any
---@return any
function SFXDescription:isLocked(...) end
---@param ... any
---@return any
function SFXDescription:isNameChangeAllowed(...) end
---@param ... any
---@return any
function SFXDescription:isSelected(...) end
---@param ... any
---@return any
function SFXDescription:isSubClassOf(...) end
---@param ... any
---@return any
function SFXDescription:onEditorDisable(...) end
---@param ... any
---@return any
function SFXDescription:onEditorEnable(...) end
---@param ... any
---@return any
function SFXDescription:postApply(...) end
---@param ... any
---@return any
function SFXDescription:preApply(...) end
---@param ... any
---@return any
function SFXDescription:registerObject(...) end
---@param ... any
---@return any
function SFXDescription:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function SFXDescription:save(...) end
---@param ... any
---@return any
function SFXDescription:serialize(...) end
---@param ... any
---@return any
function SFXDescription:serializeForEditor(...) end
---@param ... any
---@return any
function SFXDescription:serializeToDirectories(...) end
---@param ... any
---@return any
function SFXDescription:serializeToNameDictFile(...) end
---@param ... any
---@return any
function SFXDescription:setCanSave(...) end
---@param ... any
---@return any
function SFXDescription:setDeclarationLine(...) end
---@param ... any
---@return any
function SFXDescription:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function SFXDescription:setEditorDirty(...) end
---@param ... any
---@return any
function SFXDescription:setEditorOnly(...) end
---@param ... any
---@return any
function SFXDescription:setField(...) end
---@param ... any
---@return any
function SFXDescription:setFileName(...) end
---@param ... any
---@return any
function SFXDescription:setHidden(...) end
---@param ... any
---@return any
function SFXDescription:setInternalName(...) end
---@param ... any
---@return any
function SFXDescription:setIsSelected(...) end
---@param ... any
---@return any
function SFXDescription:setLocked(...) end
---@param ... any
---@return any
function SFXDescription:setName(...) end
---@param ... any
---@return any
function SFXDescription:setNameChangeAllowed(...) end
---@param ... any
---@return any
function SFXDescription:setSelected(...) end
---@param ... any
---@return any
function SFXDescription:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SFXDescription:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SFXDescription:unregisterObject(...) end

---@class SFXEmitter : SceneObject
---@field className any
local SFXEmitter = {}
---@param ... any
---@return any
function SFXEmitter:assignFieldsFromObject(...) end
---@param ... any
---@return any
function SFXEmitter:canFloatAboveGround(...) end
---@param ... any
---@return any
function SFXEmitter:clone(...) end
---@param ... any
---@return any
function SFXEmitter:decRefCount(...) end
---@param ... any
---@return any
function SFXEmitter:delete(...) end
---@param ... any
---@return any
function SFXEmitter:deleteObject(...) end
---@param ... any
---@return any
function SFXEmitter:deletePersistentId(...) end
---@param ... any
---@return any
function SFXEmitter:disableCollision(...) end
---@param ... any
---@return any
function SFXEmitter:dump(...) end
---@param ... any
---@return any
function SFXEmitter:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function SFXEmitter:enableCollision(...) end
---@param ... any
---@return any
function SFXEmitter:generatePersistentId(...) end
---@param ... any
---@return any
function SFXEmitter:getAnchorNames(...) end
---@param ... any
---@return any
function SFXEmitter:getClassDocString(...) end
---@param ... any
---@return any
function SFXEmitter:getClassName(...) end
---@param ... any
---@return any
function SFXEmitter:getDeclarationLine(...) end
---@param ... any
---@return any
function SFXEmitter:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function SFXEmitter:getDynamicFields(...) end
---@param ... any
---@return any
function SFXEmitter:getEulerRotation(...) end
---@param ... any
---@return any
function SFXEmitter:getField(...) end
---@param ... any
---@return any
function SFXEmitter:getFieldInfo(...) end
---@param ... any
---@return any
function SFXEmitter:getFieldList(...) end
---@param ... any
---@return any
function SFXEmitter:getFields(...) end
---@param ... any
---@return any
function SFXEmitter:getFieldsForEditor(...) end
---@param ... any
---@return any
function SFXEmitter:getFileName(...) end
---@param ... any
---@return any
function SFXEmitter:getFirstMaterialName(...) end
---@param ... any
---@return any
function SFXEmitter:getForwardVector(...) end
---@param ... any
---@return any
function SFXEmitter:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function SFXEmitter:getGroup(...) end
---@param ... any
---@return any
function SFXEmitter:getID(...) end
---@param ... any
---@return any
function SFXEmitter:getId(...) end
---@param ... any
---@return any
function SFXEmitter:getIdString(...) end
---@param ... any
---@return any
function SFXEmitter:getInternalName(...) end
---@param ... any
---@return any
function SFXEmitter:getMaterialNames(...) end
---@param ... any
---@return any
function SFXEmitter:getMeshMaterialNames(...) end
---@param ... any
---@return any
function SFXEmitter:getName(...) end
---@param ... any
---@return any
function SFXEmitter:getObjBox(...) end
---@param ... any
---@return any
function SFXEmitter:getObjectBox(...) end
---@param ... any
---@return any
function SFXEmitter:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function SFXEmitter:getPosition(...) end
---@param ... any
---@return any
function SFXEmitter:getPositionXYZ(...) end
---@param ... any
---@return any
function SFXEmitter:getRotation(...) end
---@param ... any
---@return any
function SFXEmitter:getScale(...) end
---@param ... any
---@return any
function SFXEmitter:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SFXEmitter:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SFXEmitter:getTransform(...) end
---@param ... any
---@return any
function SFXEmitter:getTransformF(...) end
---@param ... any
---@return any
function SFXEmitter:getType(...) end
---@param ... any
---@return any
function SFXEmitter:getWorldBox(...) end
---@param ... any
---@return any
function SFXEmitter:getWorldBoxCenter(...) end
---@param ... any
---@return any
function SFXEmitter:getWorldTransform(...) end
---@param ... any
---@return any
function SFXEmitter:hideInRenderView(...) end
---@param ... any
---@return any
function SFXEmitter:incRefCount(...) end
---@param ... any
---@return any
function SFXEmitter:inheritParentFields(...) end
---@param ... any
---@return any
function SFXEmitter:inspectUpdate(...) end
---@param ... any
---@return any
function SFXEmitter:isChildOfGroup(...) end
---@param ... any
---@return any
function SFXEmitter:isEditorDirty(...) end
---@param ... any
---@return any
function SFXEmitter:isGlobalBounds(...) end
---@param ... any
---@return any
function SFXEmitter:isHidden(...) end
---@param ... any
---@return any
function SFXEmitter:isLocked(...) end
---@param ... any
---@return any
function SFXEmitter:isNameChangeAllowed(...) end
---@param ... any
---@return any
function SFXEmitter:isRenderEnabled(...) end
---@param ... any
---@return any
function SFXEmitter:isSelected(...) end
---@param ... any
---@return any
function SFXEmitter:isSelectionEnabled(...) end
---@param ... any
---@return any
function SFXEmitter:isSubClassOf(...) end
---@param ... any
---@return any
function SFXEmitter:onEditorDisable(...) end
---@param ... any
---@return any
function SFXEmitter:onEditorEnable(...) end
---@param ... any
---@return any
function SFXEmitter:play(...) end
---@param ... any
---@return any
function SFXEmitter:postApply(...) end
---@param ... any
---@return any
function SFXEmitter:preApply(...) end
---@param ... any
---@return any
function SFXEmitter:registerObject(...) end
---@param ... any
---@return any
function SFXEmitter:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function SFXEmitter:renderViewMaskClear(...) end
---@param ... any
---@return any
function SFXEmitter:save(...) end
---@param ... any
---@return any
function SFXEmitter:serialize(...) end
---@param ... any
---@return any
function SFXEmitter:serializeForEditor(...) end
---@param ... any
---@return any
function SFXEmitter:serializeToDirectories(...) end
---@param ... any
---@return any
function SFXEmitter:serializeToNameDictFile(...) end
---@param ... any
---@return any
function SFXEmitter:setCanFloatAboveGround(...) end
---@param ... any
---@return any
function SFXEmitter:setCanSave(...) end
---@param ... any
---@return any
function SFXEmitter:setDeclarationLine(...) end
---@param ... any
---@return any
function SFXEmitter:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function SFXEmitter:setEditorDirty(...) end
---@param ... any
---@return any
function SFXEmitter:setEditorOnly(...) end
---@param ... any
---@return any
function SFXEmitter:setField(...) end
---@param ... any
---@return any
function SFXEmitter:setFileName(...) end
---@param ... any
---@return any
function SFXEmitter:setHidden(...) end
---@param ... any
---@return any
function SFXEmitter:setInternalName(...) end
---@param ... any
---@return any
function SFXEmitter:setIsSelected(...) end
---@param ... any
---@return any
function SFXEmitter:setLocked(...) end
---@param ... any
---@return any
function SFXEmitter:setName(...) end
---@param ... any
---@return any
function SFXEmitter:setNameChangeAllowed(...) end
---@param ... any
---@return any
function SFXEmitter:setPosRot(...) end
---@param ... any
---@return any
function SFXEmitter:setPosition(...) end
---@param ... any
---@return any
function SFXEmitter:setPositionXYZ(...) end
---@param ... any
---@return any
function SFXEmitter:setRenderEnabled(...) end
---@param ... any
---@return any
function SFXEmitter:setScale(...) end
---@param ... any
---@return any
function SFXEmitter:setScaleXYZ(...) end
---@param ... any
---@return any
function SFXEmitter:setSelected(...) end
---@param ... any
---@return any
function SFXEmitter:setSelectionEnabled(...) end
---@param ... any
---@return any
function SFXEmitter:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SFXEmitter:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SFXEmitter:setTransform(...) end
---@param ... any
---@return any
function SFXEmitter:setTransformF(...) end
---@param ... any
---@return any
function SFXEmitter:setVelocity(...) end
---@param ... any
---@return any
function SFXEmitter:setVolumePitchCT(...) end
---@param ... any
---@return any
function SFXEmitter:showOnlyInRenderView(...) end
---@param ... any
---@return any
function SFXEmitter:stop(...) end
---@param ... any
---@return any
function SFXEmitter:unhideInRenderView(...) end
---@param ... any
---@return any
function SFXEmitter:unregisterObject(...) end

---@class SFXFMODProject : SimDataBlock
---@field className any
local SFXFMODProject = {}
---@param ... any
---@return any
function SFXFMODProject:assignFieldsFromObject(...) end
---@param ... any
---@return any
function SFXFMODProject:clone(...) end
---@param ... any
---@return any
function SFXFMODProject:decRefCount(...) end
---@param ... any
---@return any
function SFXFMODProject:delete(...) end
---@param ... any
---@return any
function SFXFMODProject:deleteObject(...) end
---@param ... any
---@return any
function SFXFMODProject:deletePersistentId(...) end
---@param ... any
---@return any
function SFXFMODProject:dump(...) end
---@param ... any
---@return any
function SFXFMODProject:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function SFXFMODProject:generatePersistentId(...) end
---@param ... any
---@return any
function SFXFMODProject:getClassDocString(...) end
---@param ... any
---@return any
function SFXFMODProject:getClassName(...) end
---@param ... any
---@return any
function SFXFMODProject:getDeclarationLine(...) end
---@param ... any
---@return any
function SFXFMODProject:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function SFXFMODProject:getDynamicFields(...) end
---@param ... any
---@return any
function SFXFMODProject:getField(...) end
---@param ... any
---@return any
function SFXFMODProject:getFieldInfo(...) end
---@param ... any
---@return any
function SFXFMODProject:getFieldList(...) end
---@param ... any
---@return any
function SFXFMODProject:getFields(...) end
---@param ... any
---@return any
function SFXFMODProject:getFieldsForEditor(...) end
---@param ... any
---@return any
function SFXFMODProject:getFileName(...) end
---@param ... any
---@return any
function SFXFMODProject:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function SFXFMODProject:getGroup(...) end
---@param ... any
---@return any
function SFXFMODProject:getID(...) end
---@param ... any
---@return any
function SFXFMODProject:getId(...) end
---@param ... any
---@return any
function SFXFMODProject:getIdString(...) end
---@param ... any
---@return any
function SFXFMODProject:getInternalName(...) end
---@param ... any
---@return any
function SFXFMODProject:getName(...) end
---@param ... any
---@return any
function SFXFMODProject:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function SFXFMODProject:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SFXFMODProject:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SFXFMODProject:incRefCount(...) end
---@param ... any
---@return any
function SFXFMODProject:inheritParentFields(...) end
---@param ... any
---@return any
function SFXFMODProject:inspectUpdate(...) end
---@param ... any
---@return any
function SFXFMODProject:isChildOfGroup(...) end
---@param ... any
---@return any
function SFXFMODProject:isEditorDirty(...) end
---@param ... any
---@return any
function SFXFMODProject:isHidden(...) end
---@param ... any
---@return any
function SFXFMODProject:isLocked(...) end
---@param ... any
---@return any
function SFXFMODProject:isNameChangeAllowed(...) end
---@param ... any
---@return any
function SFXFMODProject:isSelected(...) end
---@param ... any
---@return any
function SFXFMODProject:isSubClassOf(...) end
---@param ... any
---@return any
function SFXFMODProject:loadBankSet(...) end
---@param ... any
---@return any
function SFXFMODProject:onEditorDisable(...) end
---@param ... any
---@return any
function SFXFMODProject:onEditorEnable(...) end
---@param ... any
---@return any
function SFXFMODProject:postApply(...) end
---@param ... any
---@return any
function SFXFMODProject:preApply(...) end
---@param ... any
---@return any
function SFXFMODProject:registerObject(...) end
---@param ... any
---@return any
function SFXFMODProject:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function SFXFMODProject:save(...) end
---@param ... any
---@return any
function SFXFMODProject:serialize(...) end
---@param ... any
---@return any
function SFXFMODProject:serializeForEditor(...) end
---@param ... any
---@return any
function SFXFMODProject:serializeToDirectories(...) end
---@param ... any
---@return any
function SFXFMODProject:serializeToNameDictFile(...) end
---@param ... any
---@return any
function SFXFMODProject:setCanSave(...) end
---@param ... any
---@return any
function SFXFMODProject:setDeclarationLine(...) end
---@param ... any
---@return any
function SFXFMODProject:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function SFXFMODProject:setEditorDirty(...) end
---@param ... any
---@return any
function SFXFMODProject:setEditorOnly(...) end
---@param ... any
---@return any
function SFXFMODProject:setField(...) end
---@param ... any
---@return any
function SFXFMODProject:setFileName(...) end
---@param ... any
---@return any
function SFXFMODProject:setHidden(...) end
---@param ... any
---@return any
function SFXFMODProject:setInternalName(...) end
---@param ... any
---@return any
function SFXFMODProject:setIsSelected(...) end
---@param ... any
---@return any
function SFXFMODProject:setLocked(...) end
---@param ... any
---@return any
function SFXFMODProject:setName(...) end
---@param ... any
---@return any
function SFXFMODProject:setNameChangeAllowed(...) end
---@param ... any
---@return any
function SFXFMODProject:setSelected(...) end
---@param ... any
---@return any
function SFXFMODProject:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SFXFMODProject:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SFXFMODProject:unregisterObject(...) end

---@class SFXProfile : SFXTrack
---@field className any
local SFXProfile = {}
---@param ... any
---@return any
function SFXProfile:assignFieldsFromObject(...) end
---@param ... any
---@return any
function SFXProfile:clone(...) end
---@param ... any
---@return any
function SFXProfile:decRefCount(...) end
---@param ... any
---@return any
function SFXProfile:delete(...) end
---@param ... any
---@return any
function SFXProfile:deleteObject(...) end
---@param ... any
---@return any
function SFXProfile:deletePersistentId(...) end
---@param ... any
---@return any
function SFXProfile:dump(...) end
---@param ... any
---@return any
function SFXProfile:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function SFXProfile:generatePersistentId(...) end
---@param ... any
---@return any
function SFXProfile:getClassDocString(...) end
---@param ... any
---@return any
function SFXProfile:getClassName(...) end
---@param ... any
---@return any
function SFXProfile:getDeclarationLine(...) end
---@param ... any
---@return any
function SFXProfile:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function SFXProfile:getDynamicFields(...) end
---@param ... any
---@return any
function SFXProfile:getField(...) end
---@param ... any
---@return any
function SFXProfile:getFieldInfo(...) end
---@param ... any
---@return any
function SFXProfile:getFieldList(...) end
---@param ... any
---@return any
function SFXProfile:getFields(...) end
---@param ... any
---@return any
function SFXProfile:getFieldsForEditor(...) end
---@param ... any
---@return any
function SFXProfile:getFileName(...) end
---@param ... any
---@return any
function SFXProfile:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function SFXProfile:getGroup(...) end
---@param ... any
---@return any
function SFXProfile:getID(...) end
---@param ... any
---@return any
function SFXProfile:getId(...) end
---@param ... any
---@return any
function SFXProfile:getIdString(...) end
---@param ... any
---@return any
function SFXProfile:getInternalName(...) end
---@param ... any
---@return any
function SFXProfile:getName(...) end
---@param ... any
---@return any
function SFXProfile:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function SFXProfile:getSoundFilename(...) end
---@param ... any
---@return any
function SFXProfile:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SFXProfile:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SFXProfile:incRefCount(...) end
---@param ... any
---@return any
function SFXProfile:inheritParentFields(...) end
---@param ... any
---@return any
function SFXProfile:inspectUpdate(...) end
---@param ... any
---@return any
function SFXProfile:isChildOfGroup(...) end
---@param ... any
---@return any
function SFXProfile:isEditorDirty(...) end
---@param ... any
---@return any
function SFXProfile:isHidden(...) end
---@param ... any
---@return any
function SFXProfile:isLocked(...) end
---@param ... any
---@return any
function SFXProfile:isNameChangeAllowed(...) end
---@param ... any
---@return any
function SFXProfile:isSelected(...) end
---@param ... any
---@return any
function SFXProfile:isSubClassOf(...) end
---@param ... any
---@return any
function SFXProfile:onEditorDisable(...) end
---@param ... any
---@return any
function SFXProfile:onEditorEnable(...) end
---@param ... any
---@return any
function SFXProfile:postApply(...) end
---@param ... any
---@return any
function SFXProfile:preApply(...) end
---@param ... any
---@return any
function SFXProfile:registerObject(...) end
---@param ... any
---@return any
function SFXProfile:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function SFXProfile:save(...) end
---@param ... any
---@return any
function SFXProfile:serialize(...) end
---@param ... any
---@return any
function SFXProfile:serializeForEditor(...) end
---@param ... any
---@return any
function SFXProfile:serializeToDirectories(...) end
---@param ... any
---@return any
function SFXProfile:serializeToNameDictFile(...) end
---@param ... any
---@return any
function SFXProfile:setCanSave(...) end
---@param ... any
---@return any
function SFXProfile:setDeclarationLine(...) end
---@param ... any
---@return any
function SFXProfile:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function SFXProfile:setEditorDirty(...) end
---@param ... any
---@return any
function SFXProfile:setEditorOnly(...) end
---@param ... any
---@return any
function SFXProfile:setField(...) end
---@param ... any
---@return any
function SFXProfile:setFileName(...) end
---@param ... any
---@return any
function SFXProfile:setHidden(...) end
---@param ... any
---@return any
function SFXProfile:setInternalName(...) end
---@param ... any
---@return any
function SFXProfile:setIsSelected(...) end
---@param ... any
---@return any
function SFXProfile:setLocked(...) end
---@param ... any
---@return any
function SFXProfile:setName(...) end
---@param ... any
---@return any
function SFXProfile:setNameChangeAllowed(...) end
---@param ... any
---@return any
function SFXProfile:setSelected(...) end
---@param ... any
---@return any
function SFXProfile:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SFXProfile:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SFXProfile:unregisterObject(...) end

---@class SFXSource : SimObject
---@field className any
local SFXSource = {}
---@param ... any
---@return any
function SFXSource:assignFieldsFromObject(...) end
---@param ... any
---@return any
function SFXSource:clone(...) end
---@param ... any
---@return any
function SFXSource:decRefCount(...) end
---@param ... any
---@return any
function SFXSource:delete(...) end
---@param ... any
---@return any
function SFXSource:deleteObject(...) end
---@param ... any
---@return any
function SFXSource:deletePersistentId(...) end
---@param ... any
---@return any
function SFXSource:dump(...) end
---@param ... any
---@return any
function SFXSource:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function SFXSource:generatePersistentId(...) end
---@param ... any
---@return any
function SFXSource:getClassDocString(...) end
---@param ... any
---@return any
function SFXSource:getClassName(...) end
---@param ... any
---@return any
function SFXSource:getDeclarationLine(...) end
---@param ... any
---@return any
function SFXSource:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function SFXSource:getDynamicFields(...) end
---@param ... any
---@return any
function SFXSource:getField(...) end
---@param ... any
---@return any
function SFXSource:getFieldInfo(...) end
---@param ... any
---@return any
function SFXSource:getFieldList(...) end
---@param ... any
---@return any
function SFXSource:getFields(...) end
---@param ... any
---@return any
function SFXSource:getFieldsForEditor(...) end
---@param ... any
---@return any
function SFXSource:getFileName(...) end
---@param ... any
---@return any
function SFXSource:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function SFXSource:getGroup(...) end
---@param ... any
---@return any
function SFXSource:getID(...) end
---@param ... any
---@return any
function SFXSource:getId(...) end
---@param ... any
---@return any
function SFXSource:getIdString(...) end
---@param ... any
---@return any
function SFXSource:getInternalName(...) end
---@param ... any
---@return any
function SFXSource:getName(...) end
---@param ... any
---@return any
function SFXSource:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function SFXSource:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SFXSource:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SFXSource:getTotalPlayTime(...) end
---@param ... any
---@return any
function SFXSource:getVolume(...) end
---@param ... any
---@return any
function SFXSource:incRefCount(...) end
---@param ... any
---@return any
function SFXSource:inheritParentFields(...) end
---@param ... any
---@return any
function SFXSource:inspectUpdate(...) end
---@param ... any
---@return any
function SFXSource:isChildOfGroup(...) end
---@param ... any
---@return any
function SFXSource:isEditorDirty(...) end
---@param ... any
---@return any
function SFXSource:isHidden(...) end
---@param ... any
---@return any
function SFXSource:isLocked(...) end
---@param ... any
---@return any
function SFXSource:isNameChangeAllowed(...) end
---@param ... any
---@return any
function SFXSource:isPaused(...) end
---@param ... any
---@return any
function SFXSource:isPlaying(...) end
---@param ... any
---@return any
function SFXSource:isSelected(...) end
---@param ... any
---@return any
function SFXSource:isStopped(...) end
---@param ... any
---@return any
function SFXSource:isSubClassOf(...) end
---@param ... any
---@return any
function SFXSource:onEditorDisable(...) end
---@param ... any
---@return any
function SFXSource:onEditorEnable(...) end
---@param ... any
---@return any
function SFXSource:play(...) end
---@param ... any
---@return any
function SFXSource:postApply(...) end
---@param ... any
---@return any
function SFXSource:preApply(...) end
---@param ... any
---@return any
function SFXSource:registerObject(...) end
---@param ... any
---@return any
function SFXSource:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function SFXSource:save(...) end
---@param ... any
---@return any
function SFXSource:serialize(...) end
---@param ... any
---@return any
function SFXSource:serializeForEditor(...) end
---@param ... any
---@return any
function SFXSource:serializeToDirectories(...) end
---@param ... any
---@return any
function SFXSource:serializeToNameDictFile(...) end
---@param ... any
---@return any
function SFXSource:setCanSave(...) end
---@param ... any
---@return any
function SFXSource:setDeclarationLine(...) end
---@param ... any
---@return any
function SFXSource:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function SFXSource:setEditorDirty(...) end
---@param ... any
---@return any
function SFXSource:setEditorOnly(...) end
---@param ... any
---@return any
function SFXSource:setField(...) end
---@param ... any
---@return any
function SFXSource:setFileName(...) end
---@param ... any
---@return any
function SFXSource:setHidden(...) end
---@param ... any
---@return any
function SFXSource:setInternalName(...) end
---@param ... any
---@return any
function SFXSource:setIsSelected(...) end
---@param ... any
---@return any
function SFXSource:setLocked(...) end
---@param ... any
---@return any
function SFXSource:setName(...) end
---@param ... any
---@return any
function SFXSource:setNameChangeAllowed(...) end
---@param ... any
---@return any
function SFXSource:setParameter(...) end
---@param ... any
---@return any
function SFXSource:setSelected(...) end
---@param ... any
---@return any
function SFXSource:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SFXSource:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SFXSource:setTransform(...) end
---@param ... any
---@return any
function SFXSource:setVolume(...) end
---@param ... any
---@return any
function SFXSource:stop(...) end
---@param ... any
---@return any
function SFXSource:unregisterObject(...) end

---@class SFXSourceChannel : SFXSource
---@field className any
local SFXSourceChannel = {}
---@param ... any
---@return any
function SFXSourceChannel:assignFieldsFromObject(...) end
---@param ... any
---@return any
function SFXSourceChannel:clone(...) end
---@param ... any
---@return any
function SFXSourceChannel:decRefCount(...) end
---@param ... any
---@return any
function SFXSourceChannel:delete(...) end
---@param ... any
---@return any
function SFXSourceChannel:deleteObject(...) end
---@param ... any
---@return any
function SFXSourceChannel:deletePersistentId(...) end
---@param ... any
---@return any
function SFXSourceChannel:dump(...) end
---@param ... any
---@return any
function SFXSourceChannel:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function SFXSourceChannel:generatePersistentId(...) end
---@param ... any
---@return any
function SFXSourceChannel:getClassDocString(...) end
---@param ... any
---@return any
function SFXSourceChannel:getClassName(...) end
---@param ... any
---@return any
function SFXSourceChannel:getDeclarationLine(...) end
---@param ... any
---@return any
function SFXSourceChannel:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function SFXSourceChannel:getDynamicFields(...) end
---@param ... any
---@return any
function SFXSourceChannel:getField(...) end
---@param ... any
---@return any
function SFXSourceChannel:getFieldInfo(...) end
---@param ... any
---@return any
function SFXSourceChannel:getFieldList(...) end
---@param ... any
---@return any
function SFXSourceChannel:getFields(...) end
---@param ... any
---@return any
function SFXSourceChannel:getFieldsForEditor(...) end
---@param ... any
---@return any
function SFXSourceChannel:getFileName(...) end
---@param ... any
---@return any
function SFXSourceChannel:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function SFXSourceChannel:getGroup(...) end
---@param ... any
---@return any
function SFXSourceChannel:getID(...) end
---@param ... any
---@return any
function SFXSourceChannel:getId(...) end
---@param ... any
---@return any
function SFXSourceChannel:getIdString(...) end
---@param ... any
---@return any
function SFXSourceChannel:getInternalName(...) end
---@param ... any
---@return any
function SFXSourceChannel:getName(...) end
---@param ... any
---@return any
function SFXSourceChannel:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function SFXSourceChannel:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SFXSourceChannel:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SFXSourceChannel:getTotalPlayTime(...) end
---@param ... any
---@return any
function SFXSourceChannel:getVolume(...) end
---@param ... any
---@return any
function SFXSourceChannel:incRefCount(...) end
---@param ... any
---@return any
function SFXSourceChannel:inheritParentFields(...) end
---@param ... any
---@return any
function SFXSourceChannel:inspectUpdate(...) end
---@param ... any
---@return any
function SFXSourceChannel:isChildOfGroup(...) end
---@param ... any
---@return any
function SFXSourceChannel:isEditorDirty(...) end
---@param ... any
---@return any
function SFXSourceChannel:isHidden(...) end
---@param ... any
---@return any
function SFXSourceChannel:isLocked(...) end
---@param ... any
---@return any
function SFXSourceChannel:isNameChangeAllowed(...) end
---@param ... any
---@return any
function SFXSourceChannel:isPaused(...) end
---@param ... any
---@return any
function SFXSourceChannel:isPlaying(...) end
---@param ... any
---@return any
function SFXSourceChannel:isSelected(...) end
---@param ... any
---@return any
function SFXSourceChannel:isStopped(...) end
---@param ... any
---@return any
function SFXSourceChannel:isSubClassOf(...) end
---@param ... any
---@return any
function SFXSourceChannel:onEditorDisable(...) end
---@param ... any
---@return any
function SFXSourceChannel:onEditorEnable(...) end
---@param ... any
---@return any
function SFXSourceChannel:play(...) end
---@param ... any
---@return any
function SFXSourceChannel:postApply(...) end
---@param ... any
---@return any
function SFXSourceChannel:preApply(...) end
---@param ... any
---@return any
function SFXSourceChannel:registerObject(...) end
---@param ... any
---@return any
function SFXSourceChannel:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function SFXSourceChannel:save(...) end
---@param ... any
---@return any
function SFXSourceChannel:serialize(...) end
---@param ... any
---@return any
function SFXSourceChannel:serializeForEditor(...) end
---@param ... any
---@return any
function SFXSourceChannel:serializeToDirectories(...) end
---@param ... any
---@return any
function SFXSourceChannel:serializeToNameDictFile(...) end
---@param ... any
---@return any
function SFXSourceChannel:setCanSave(...) end
---@param ... any
---@return any
function SFXSourceChannel:setDeclarationLine(...) end
---@param ... any
---@return any
function SFXSourceChannel:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function SFXSourceChannel:setEditorDirty(...) end
---@param ... any
---@return any
function SFXSourceChannel:setEditorOnly(...) end
---@param ... any
---@return any
function SFXSourceChannel:setField(...) end
---@param ... any
---@return any
function SFXSourceChannel:setFileName(...) end
---@param ... any
---@return any
function SFXSourceChannel:setHidden(...) end
---@param ... any
---@return any
function SFXSourceChannel:setInternalName(...) end
---@param ... any
---@return any
function SFXSourceChannel:setIsSelected(...) end
---@param ... any
---@return any
function SFXSourceChannel:setLocked(...) end
---@param ... any
---@return any
function SFXSourceChannel:setName(...) end
---@param ... any
---@return any
function SFXSourceChannel:setNameChangeAllowed(...) end
---@param ... any
---@return any
function SFXSourceChannel:setParameter(...) end
---@param ... any
---@return any
function SFXSourceChannel:setSelected(...) end
---@param ... any
---@return any
function SFXSourceChannel:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SFXSourceChannel:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SFXSourceChannel:setTransform(...) end
---@param ... any
---@return any
function SFXSourceChannel:setVolume(...) end
---@param ... any
---@return any
function SFXSourceChannel:stop(...) end
---@param ... any
---@return any
function SFXSourceChannel:unregisterObject(...) end

---@class SFXSpace : SceneObject
---@field className any
local SFXSpace = {}
---@param ... any
---@return any
function SFXSpace:assignFieldsFromObject(...) end
---@param ... any
---@return any
function SFXSpace:canFloatAboveGround(...) end
---@param ... any
---@return any
function SFXSpace:clone(...) end
---@param ... any
---@return any
function SFXSpace:decRefCount(...) end
---@param ... any
---@return any
function SFXSpace:delete(...) end
---@param ... any
---@return any
function SFXSpace:deleteObject(...) end
---@param ... any
---@return any
function SFXSpace:deletePersistentId(...) end
---@param ... any
---@return any
function SFXSpace:disableCollision(...) end
---@param ... any
---@return any
function SFXSpace:dump(...) end
---@param ... any
---@return any
function SFXSpace:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function SFXSpace:enableCollision(...) end
---@param ... any
---@return any
function SFXSpace:generatePersistentId(...) end
---@param ... any
---@return any
function SFXSpace:getAnchorNames(...) end
---@param ... any
---@return any
function SFXSpace:getClassDocString(...) end
---@param ... any
---@return any
function SFXSpace:getClassName(...) end
---@param ... any
---@return any
function SFXSpace:getDeclarationLine(...) end
---@param ... any
---@return any
function SFXSpace:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function SFXSpace:getDynamicFields(...) end
---@param ... any
---@return any
function SFXSpace:getEulerRotation(...) end
---@param ... any
---@return any
function SFXSpace:getField(...) end
---@param ... any
---@return any
function SFXSpace:getFieldInfo(...) end
---@param ... any
---@return any
function SFXSpace:getFieldList(...) end
---@param ... any
---@return any
function SFXSpace:getFields(...) end
---@param ... any
---@return any
function SFXSpace:getFieldsForEditor(...) end
---@param ... any
---@return any
function SFXSpace:getFileName(...) end
---@param ... any
---@return any
function SFXSpace:getFirstMaterialName(...) end
---@param ... any
---@return any
function SFXSpace:getForwardVector(...) end
---@param ... any
---@return any
function SFXSpace:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function SFXSpace:getGroup(...) end
---@param ... any
---@return any
function SFXSpace:getID(...) end
---@param ... any
---@return any
function SFXSpace:getId(...) end
---@param ... any
---@return any
function SFXSpace:getIdString(...) end
---@param ... any
---@return any
function SFXSpace:getInternalName(...) end
---@param ... any
---@return any
function SFXSpace:getMaterialNames(...) end
---@param ... any
---@return any
function SFXSpace:getMeshMaterialNames(...) end
---@param ... any
---@return any
function SFXSpace:getName(...) end
---@param ... any
---@return any
function SFXSpace:getObjBox(...) end
---@param ... any
---@return any
function SFXSpace:getObjectBox(...) end
---@param ... any
---@return any
function SFXSpace:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function SFXSpace:getPosition(...) end
---@param ... any
---@return any
function SFXSpace:getPositionXYZ(...) end
---@param ... any
---@return any
function SFXSpace:getRotation(...) end
---@param ... any
---@return any
function SFXSpace:getScale(...) end
---@param ... any
---@return any
function SFXSpace:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SFXSpace:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SFXSpace:getTransform(...) end
---@param ... any
---@return any
function SFXSpace:getTransformF(...) end
---@param ... any
---@return any
function SFXSpace:getType(...) end
---@param ... any
---@return any
function SFXSpace:getWorldBox(...) end
---@param ... any
---@return any
function SFXSpace:getWorldBoxCenter(...) end
---@param ... any
---@return any
function SFXSpace:getWorldTransform(...) end
---@param ... any
---@return any
function SFXSpace:hideInRenderView(...) end
---@param ... any
---@return any
function SFXSpace:incRefCount(...) end
---@param ... any
---@return any
function SFXSpace:inheritParentFields(...) end
---@param ... any
---@return any
function SFXSpace:inspectUpdate(...) end
---@param ... any
---@return any
function SFXSpace:isChildOfGroup(...) end
---@param ... any
---@return any
function SFXSpace:isEditorDirty(...) end
---@param ... any
---@return any
function SFXSpace:isGlobalBounds(...) end
---@param ... any
---@return any
function SFXSpace:isHidden(...) end
---@param ... any
---@return any
function SFXSpace:isLocked(...) end
---@param ... any
---@return any
function SFXSpace:isNameChangeAllowed(...) end
---@param ... any
---@return any
function SFXSpace:isRenderEnabled(...) end
---@param ... any
---@return any
function SFXSpace:isSelected(...) end
---@param ... any
---@return any
function SFXSpace:isSelectionEnabled(...) end
---@param ... any
---@return any
function SFXSpace:isSubClassOf(...) end
---@param ... any
---@return any
function SFXSpace:onEditorDisable(...) end
---@param ... any
---@return any
function SFXSpace:onEditorEnable(...) end
---@param ... any
---@return any
function SFXSpace:postApply(...) end
---@param ... any
---@return any
function SFXSpace:preApply(...) end
---@param ... any
---@return any
function SFXSpace:registerObject(...) end
---@param ... any
---@return any
function SFXSpace:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function SFXSpace:renderViewMaskClear(...) end
---@param ... any
---@return any
function SFXSpace:save(...) end
---@param ... any
---@return any
function SFXSpace:serialize(...) end
---@param ... any
---@return any
function SFXSpace:serializeForEditor(...) end
---@param ... any
---@return any
function SFXSpace:serializeToDirectories(...) end
---@param ... any
---@return any
function SFXSpace:serializeToNameDictFile(...) end
---@param ... any
---@return any
function SFXSpace:setCanFloatAboveGround(...) end
---@param ... any
---@return any
function SFXSpace:setCanSave(...) end
---@param ... any
---@return any
function SFXSpace:setDeclarationLine(...) end
---@param ... any
---@return any
function SFXSpace:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function SFXSpace:setEditorDirty(...) end
---@param ... any
---@return any
function SFXSpace:setEditorOnly(...) end
---@param ... any
---@return any
function SFXSpace:setField(...) end
---@param ... any
---@return any
function SFXSpace:setFileName(...) end
---@param ... any
---@return any
function SFXSpace:setHidden(...) end
---@param ... any
---@return any
function SFXSpace:setInternalName(...) end
---@param ... any
---@return any
function SFXSpace:setIsSelected(...) end
---@param ... any
---@return any
function SFXSpace:setLocked(...) end
---@param ... any
---@return any
function SFXSpace:setName(...) end
---@param ... any
---@return any
function SFXSpace:setNameChangeAllowed(...) end
---@param ... any
---@return any
function SFXSpace:setPosRot(...) end
---@param ... any
---@return any
function SFXSpace:setPosition(...) end
---@param ... any
---@return any
function SFXSpace:setPositionXYZ(...) end
---@param ... any
---@return any
function SFXSpace:setRenderEnabled(...) end
---@param ... any
---@return any
function SFXSpace:setScale(...) end
---@param ... any
---@return any
function SFXSpace:setScaleXYZ(...) end
---@param ... any
---@return any
function SFXSpace:setSelected(...) end
---@param ... any
---@return any
function SFXSpace:setSelectionEnabled(...) end
---@param ... any
---@return any
function SFXSpace:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SFXSpace:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SFXSpace:setTransform(...) end
---@param ... any
---@return any
function SFXSpace:setTransformF(...) end
---@param ... any
---@return any
function SFXSpace:showOnlyInRenderView(...) end
---@param ... any
---@return any
function SFXSpace:unhideInRenderView(...) end
---@param ... any
---@return any
function SFXSpace:unregisterObject(...) end

---@class SFXTrack : SimDataBlock
---@field className any
local SFXTrack = {}
---@param ... any
---@return any
function SFXTrack:assignFieldsFromObject(...) end
---@param ... any
---@return any
function SFXTrack:clone(...) end
---@param ... any
---@return any
function SFXTrack:decRefCount(...) end
---@param ... any
---@return any
function SFXTrack:delete(...) end
---@param ... any
---@return any
function SFXTrack:deleteObject(...) end
---@param ... any
---@return any
function SFXTrack:deletePersistentId(...) end
---@param ... any
---@return any
function SFXTrack:dump(...) end
---@param ... any
---@return any
function SFXTrack:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function SFXTrack:generatePersistentId(...) end
---@param ... any
---@return any
function SFXTrack:getClassDocString(...) end
---@param ... any
---@return any
function SFXTrack:getClassName(...) end
---@param ... any
---@return any
function SFXTrack:getDeclarationLine(...) end
---@param ... any
---@return any
function SFXTrack:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function SFXTrack:getDynamicFields(...) end
---@param ... any
---@return any
function SFXTrack:getField(...) end
---@param ... any
---@return any
function SFXTrack:getFieldInfo(...) end
---@param ... any
---@return any
function SFXTrack:getFieldList(...) end
---@param ... any
---@return any
function SFXTrack:getFields(...) end
---@param ... any
---@return any
function SFXTrack:getFieldsForEditor(...) end
---@param ... any
---@return any
function SFXTrack:getFileName(...) end
---@param ... any
---@return any
function SFXTrack:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function SFXTrack:getGroup(...) end
---@param ... any
---@return any
function SFXTrack:getID(...) end
---@param ... any
---@return any
function SFXTrack:getId(...) end
---@param ... any
---@return any
function SFXTrack:getIdString(...) end
---@param ... any
---@return any
function SFXTrack:getInternalName(...) end
---@param ... any
---@return any
function SFXTrack:getName(...) end
---@param ... any
---@return any
function SFXTrack:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function SFXTrack:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SFXTrack:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SFXTrack:incRefCount(...) end
---@param ... any
---@return any
function SFXTrack:inheritParentFields(...) end
---@param ... any
---@return any
function SFXTrack:inspectUpdate(...) end
---@param ... any
---@return any
function SFXTrack:isChildOfGroup(...) end
---@param ... any
---@return any
function SFXTrack:isEditorDirty(...) end
---@param ... any
---@return any
function SFXTrack:isHidden(...) end
---@param ... any
---@return any
function SFXTrack:isLocked(...) end
---@param ... any
---@return any
function SFXTrack:isNameChangeAllowed(...) end
---@param ... any
---@return any
function SFXTrack:isSelected(...) end
---@param ... any
---@return any
function SFXTrack:isSubClassOf(...) end
---@param ... any
---@return any
function SFXTrack:onEditorDisable(...) end
---@param ... any
---@return any
function SFXTrack:onEditorEnable(...) end
---@param ... any
---@return any
function SFXTrack:postApply(...) end
---@param ... any
---@return any
function SFXTrack:preApply(...) end
---@param ... any
---@return any
function SFXTrack:registerObject(...) end
---@param ... any
---@return any
function SFXTrack:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function SFXTrack:save(...) end
---@param ... any
---@return any
function SFXTrack:serialize(...) end
---@param ... any
---@return any
function SFXTrack:serializeForEditor(...) end
---@param ... any
---@return any
function SFXTrack:serializeToDirectories(...) end
---@param ... any
---@return any
function SFXTrack:serializeToNameDictFile(...) end
---@param ... any
---@return any
function SFXTrack:setCanSave(...) end
---@param ... any
---@return any
function SFXTrack:setDeclarationLine(...) end
---@param ... any
---@return any
function SFXTrack:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function SFXTrack:setEditorDirty(...) end
---@param ... any
---@return any
function SFXTrack:setEditorOnly(...) end
---@param ... any
---@return any
function SFXTrack:setField(...) end
---@param ... any
---@return any
function SFXTrack:setFileName(...) end
---@param ... any
---@return any
function SFXTrack:setHidden(...) end
---@param ... any
---@return any
function SFXTrack:setInternalName(...) end
---@param ... any
---@return any
function SFXTrack:setIsSelected(...) end
---@param ... any
---@return any
function SFXTrack:setLocked(...) end
---@param ... any
---@return any
function SFXTrack:setName(...) end
---@param ... any
---@return any
function SFXTrack:setNameChangeAllowed(...) end
---@param ... any
---@return any
function SFXTrack:setSelected(...) end
---@param ... any
---@return any
function SFXTrack:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SFXTrack:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SFXTrack:unregisterObject(...) end

---@class SceneObject : SimObject
---@field className any
local SceneObject = {}
---@param ... any
---@return any
function SceneObject:assignFieldsFromObject(...) end
---@param ... any
---@return any
function SceneObject:canFloatAboveGround(...) end
---@param ... any
---@return any
function SceneObject:clone(...) end
---@param ... any
---@return any
function SceneObject:decRefCount(...) end
---@param ... any
---@return any
function SceneObject:delete(...) end
---@param ... any
---@return any
function SceneObject:deleteObject(...) end
---@param ... any
---@return any
function SceneObject:deletePersistentId(...) end
---@param ... any
---@return any
function SceneObject:disableCollision(...) end
---@param ... any
---@return any
function SceneObject:dump(...) end
---@param ... any
---@return any
function SceneObject:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function SceneObject:enableCollision(...) end
---@param ... any
---@return any
function SceneObject:generatePersistentId(...) end
---@param ... any
---@return any
function SceneObject:getAnchorNames(...) end
---@param ... any
---@return any
function SceneObject:getClassDocString(...) end
---@param ... any
---@return any
function SceneObject:getClassName(...) end
---@param ... any
---@return any
function SceneObject:getDeclarationLine(...) end
---@param ... any
---@return any
function SceneObject:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function SceneObject:getDynamicFields(...) end
---@param ... any
---@return any
function SceneObject:getEulerRotation(...) end
---@param ... any
---@return any
function SceneObject:getField(...) end
---@param ... any
---@return any
function SceneObject:getFieldInfo(...) end
---@param ... any
---@return any
function SceneObject:getFieldList(...) end
---@param ... any
---@return any
function SceneObject:getFields(...) end
---@param ... any
---@return any
function SceneObject:getFieldsForEditor(...) end
---@param ... any
---@return any
function SceneObject:getFileName(...) end
---@param ... any
---@return any
function SceneObject:getFirstMaterialName(...) end
---@param ... any
---@return any
function SceneObject:getForwardVector(...) end
---@param ... any
---@return any
function SceneObject:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function SceneObject:getGroup(...) end
---@param ... any
---@return any
function SceneObject:getID(...) end
---@param ... any
---@return any
function SceneObject:getId(...) end
---@param ... any
---@return any
function SceneObject:getIdString(...) end
---@param ... any
---@return any
function SceneObject:getInternalName(...) end
---@param ... any
---@return any
function SceneObject:getMaterialNames(...) end
---@param ... any
---@return any
function SceneObject:getMeshMaterialNames(...) end
---@param ... any
---@return any
function SceneObject:getName(...) end
---@param ... any
---@return any
function SceneObject:getObjBox(...) end
---@param ... any
---@return any
function SceneObject:getObjectBox(...) end
---@param ... any
---@return any
function SceneObject:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function SceneObject:getPosition(...) end
---@param ... any
---@return any
function SceneObject:getPositionXYZ(...) end
---@param ... any
---@return any
function SceneObject:getRotation(...) end
---@param ... any
---@return any
function SceneObject:getScale(...) end
---@param ... any
---@return any
function SceneObject:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SceneObject:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SceneObject:getTransform(...) end
---@param ... any
---@return any
function SceneObject:getTransformF(...) end
---@param ... any
---@return any
function SceneObject:getType(...) end
---@param ... any
---@return any
function SceneObject:getWorldBox(...) end
---@param ... any
---@return any
function SceneObject:getWorldBoxCenter(...) end
---@param ... any
---@return any
function SceneObject:getWorldTransform(...) end
---@param ... any
---@return any
function SceneObject:hideInRenderView(...) end
---@param ... any
---@return any
function SceneObject:incRefCount(...) end
---@param ... any
---@return any
function SceneObject:inheritParentFields(...) end
---@param ... any
---@return any
function SceneObject:inspectUpdate(...) end
---@param ... any
---@return any
function SceneObject:isChildOfGroup(...) end
---@param ... any
---@return any
function SceneObject:isEditorDirty(...) end
---@param ... any
---@return any
function SceneObject:isGlobalBounds(...) end
---@param ... any
---@return any
function SceneObject:isHidden(...) end
---@param ... any
---@return any
function SceneObject:isLocked(...) end
---@param ... any
---@return any
function SceneObject:isNameChangeAllowed(...) end
---@param ... any
---@return any
function SceneObject:isRenderEnabled(...) end
---@param ... any
---@return any
function SceneObject:isSelected(...) end
---@param ... any
---@return any
function SceneObject:isSelectionEnabled(...) end
---@param ... any
---@return any
function SceneObject:isSubClassOf(...) end
---@param ... any
---@return any
function SceneObject:onEditorDisable(...) end
---@param ... any
---@return any
function SceneObject:onEditorEnable(...) end
---@param ... any
---@return any
function SceneObject:postApply(...) end
---@param ... any
---@return any
function SceneObject:preApply(...) end
---@param ... any
---@return any
function SceneObject:registerObject(...) end
---@param ... any
---@return any
function SceneObject:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function SceneObject:renderViewMaskClear(...) end
---@param ... any
---@return any
function SceneObject:save(...) end
---@param ... any
---@return any
function SceneObject:serialize(...) end
---@param ... any
---@return any
function SceneObject:serializeForEditor(...) end
---@param ... any
---@return any
function SceneObject:serializeToDirectories(...) end
---@param ... any
---@return any
function SceneObject:serializeToNameDictFile(...) end
---@param ... any
---@return any
function SceneObject:setCanFloatAboveGround(...) end
---@param ... any
---@return any
function SceneObject:setCanSave(...) end
---@param ... any
---@return any
function SceneObject:setDeclarationLine(...) end
---@param ... any
---@return any
function SceneObject:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function SceneObject:setEditorDirty(...) end
---@param ... any
---@return any
function SceneObject:setEditorOnly(...) end
---@param ... any
---@return any
function SceneObject:setField(...) end
---@param ... any
---@return any
function SceneObject:setFileName(...) end
---@param ... any
---@return any
function SceneObject:setHidden(...) end
---@param ... any
---@return any
function SceneObject:setInternalName(...) end
---@param ... any
---@return any
function SceneObject:setIsSelected(...) end
---@param ... any
---@return any
function SceneObject:setLocked(...) end
---@param ... any
---@return any
function SceneObject:setName(...) end
---@param ... any
---@return any
function SceneObject:setNameChangeAllowed(...) end
---@param ... any
---@return any
function SceneObject:setPosRot(...) end
---@param ... any
---@return any
function SceneObject:setPosition(...) end
---@param ... any
---@return any
function SceneObject:setPositionXYZ(...) end
---@param ... any
---@return any
function SceneObject:setRenderEnabled(...) end
---@param ... any
---@return any
function SceneObject:setScale(...) end
---@param ... any
---@return any
function SceneObject:setScaleXYZ(...) end
---@param ... any
---@return any
function SceneObject:setSelected(...) end
---@param ... any
---@return any
function SceneObject:setSelectionEnabled(...) end
---@param ... any
---@return any
function SceneObject:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SceneObject:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SceneObject:setTransform(...) end
---@param ... any
---@return any
function SceneObject:setTransformF(...) end
---@param ... any
---@return any
function SceneObject:showOnlyInRenderView(...) end
---@param ... any
---@return any
function SceneObject:unhideInRenderView(...) end
---@param ... any
---@return any
function SceneObject:unregisterObject(...) end

---@class Settings
---@field AudioFmodDebugLogs any modifiable
---@field AudioFmodDebugMemory any modifiable
---@field AudioFmodEnableDebugLogging any modifiable
---@field AudioFmodLiveUpdate any modifiable
---@field AudioMaxSoftwareBuffers any modifiable
---@field AudioMuteOnWindowLoseFocus any modifiable
---@field AudioUseHardware any modifiable
---@field BeamNGWaypointDrawDebug any modifiable
---@field DebugDrawDrawAdvancedText any modifiable
---@field FPSLimiterRandomness any modifiable
---@field GraphicGamma any modifiable
---@field GraphicPlatformPreset any modifiable
---@field GraphicPlatformPresetStaticResHeight any modifiable
---@field GraphicPlatformPresetStaticResWidth any modifiable
---@field IngameConsoleLogBlacklist any modifiable
---@field IngameConsoleLogRotationLines any modifiable
---@field IngameConsoleLogWhitelist any modifiable
---@field WinConsoleLogBlacklist any modifiable
---@field WinConsoleLogWhitelist any modifiable
---@field colladaUpdateMaterials any modifiable
---@field fpsLimit any modifiable
---@field fpsLimitBackground any modifiable
---@field fpsLimitBackgroundEnabled any modifiable
---@field fpsLimitEnabled any modifiable
---@field imguiWindowParenting any modifiable
---@field lastError any modifiable
---@field lowFovDetailEnabled any modifiable
---@field multiseat any modifiable
---@field openXRapidumpEnabled any modifiable
---@field openXRdebugEnabled any modifiable
---@field openXRfreeCenter any modifiable
---@field openXRhandPoseDirectionDegrees any modifiable
---@field openXRhandPoseMultiplier any modifiable
---@field openXRquadCompositionEnabled any modifiable
---@field openXRresolutionScale any modifiable
---@field openXRuiCurve any modifiable
---@field openXRuiDepth any modifiable
---@field openXRuiEnabled any modifiable
---@field openXRuiHeight any modifiable
---@field openXRuiMode any modifiable
---@field openXRuiWidth any modifiable
---@field openXRuseControllers any modifiable
---@field openXRwindowViewMode any modifiable
---@field replayClouds any modifiable
---@field replayTod any modifiable
---@field sceneLightingCacheLighting any modifiable
---@field sceneLightingCacheSize any modifiable
---@field sceneLightingPurgeMethod any modifiable
---@field shaderGenCachePath any modifiable
---@field unfocusedInput any modifiable
---@field videoDefaultFenceCount any modifiable
---@field windEffectRadius any modifiable
local Settings = {}

---@class ShaderData : SimObject
---@field className any
local ShaderData = {}
---@param ... any
---@return any
function ShaderData:assignFieldsFromObject(...) end
---@param ... any
---@return any
function ShaderData:clone(...) end
---@param ... any
---@return any
function ShaderData:decRefCount(...) end
---@param ... any
---@return any
function ShaderData:delete(...) end
---@param ... any
---@return any
function ShaderData:deleteObject(...) end
---@param ... any
---@return any
function ShaderData:deletePersistentId(...) end
---@param ... any
---@return any
function ShaderData:dump(...) end
---@param ... any
---@return any
function ShaderData:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function ShaderData:generatePersistentId(...) end
---@param ... any
---@return any
function ShaderData:getClassDocString(...) end
---@param ... any
---@return any
function ShaderData:getClassName(...) end
---@param ... any
---@return any
function ShaderData:getDeclarationLine(...) end
---@param ... any
---@return any
function ShaderData:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function ShaderData:getDynamicFields(...) end
---@param ... any
---@return any
function ShaderData:getField(...) end
---@param ... any
---@return any
function ShaderData:getFieldInfo(...) end
---@param ... any
---@return any
function ShaderData:getFieldList(...) end
---@param ... any
---@return any
function ShaderData:getFields(...) end
---@param ... any
---@return any
function ShaderData:getFieldsForEditor(...) end
---@param ... any
---@return any
function ShaderData:getFileName(...) end
---@param ... any
---@return any
function ShaderData:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function ShaderData:getGroup(...) end
---@param ... any
---@return any
function ShaderData:getID(...) end
---@param ... any
---@return any
function ShaderData:getId(...) end
---@param ... any
---@return any
function ShaderData:getIdString(...) end
---@param ... any
---@return any
function ShaderData:getInternalName(...) end
---@param ... any
---@return any
function ShaderData:getName(...) end
---@param ... any
---@return any
function ShaderData:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function ShaderData:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function ShaderData:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function ShaderData:incRefCount(...) end
---@param ... any
---@return any
function ShaderData:inheritParentFields(...) end
---@param ... any
---@return any
function ShaderData:inspectUpdate(...) end
---@param ... any
---@return any
function ShaderData:isChildOfGroup(...) end
---@param ... any
---@return any
function ShaderData:isEditorDirty(...) end
---@param ... any
---@return any
function ShaderData:isHidden(...) end
---@param ... any
---@return any
function ShaderData:isLocked(...) end
---@param ... any
---@return any
function ShaderData:isNameChangeAllowed(...) end
---@param ... any
---@return any
function ShaderData:isSelected(...) end
---@param ... any
---@return any
function ShaderData:isSubClassOf(...) end
---@param ... any
---@return any
function ShaderData:onEditorDisable(...) end
---@param ... any
---@return any
function ShaderData:onEditorEnable(...) end
---@param ... any
---@return any
function ShaderData:postApply(...) end
---@param ... any
---@return any
function ShaderData:preApply(...) end
---@param ... any
---@return any
function ShaderData:registerObject(...) end
---@param ... any
---@return any
function ShaderData:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function ShaderData:reload(...) end
---@param ... any
---@return any
function ShaderData:save(...) end
---@param ... any
---@return any
function ShaderData:serialize(...) end
---@param ... any
---@return any
function ShaderData:serializeForEditor(...) end
---@param ... any
---@return any
function ShaderData:serializeToDirectories(...) end
---@param ... any
---@return any
function ShaderData:serializeToNameDictFile(...) end
---@param ... any
---@return any
function ShaderData:setCanSave(...) end
---@param ... any
---@return any
function ShaderData:setDeclarationLine(...) end
---@param ... any
---@return any
function ShaderData:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function ShaderData:setEditorDirty(...) end
---@param ... any
---@return any
function ShaderData:setEditorOnly(...) end
---@param ... any
---@return any
function ShaderData:setField(...) end
---@param ... any
---@return any
function ShaderData:setFileName(...) end
---@param ... any
---@return any
function ShaderData:setHidden(...) end
---@param ... any
---@return any
function ShaderData:setInternalName(...) end
---@param ... any
---@return any
function ShaderData:setIsSelected(...) end
---@param ... any
---@return any
function ShaderData:setLocked(...) end
---@param ... any
---@return any
function ShaderData:setName(...) end
---@param ... any
---@return any
function ShaderData:setNameChangeAllowed(...) end
---@param ... any
---@return any
function ShaderData:setSelected(...) end
---@param ... any
---@return any
function ShaderData:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function ShaderData:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function ShaderData:unregisterObject(...) end

---@class ShapeBase : GameBase
---@field className any
local ShapeBase = {}
---@param ... any
---@return any
function ShapeBase:assignFieldsFromObject(...) end
---@param ... any
---@return any
function ShapeBase:canFloatAboveGround(...) end
---@param ... any
---@return any
function ShapeBase:changeMaterial(...) end
---@param ... any
---@return any
function ShapeBase:clone(...) end
---@param ... any
---@return any
function ShapeBase:decRefCount(...) end
---@param ... any
---@return any
function ShapeBase:delete(...) end
---@param ... any
---@return any
function ShapeBase:deleteObject(...) end
---@param ... any
---@return any
function ShapeBase:deletePersistentId(...) end
---@param ... any
---@return any
function ShapeBase:disableCollision(...) end
---@param ... any
---@return any
function ShapeBase:dump(...) end
---@param ... any
---@return any
function ShapeBase:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function ShapeBase:dumpMeshVisibility(...) end
---@param ... any
---@return any
function ShapeBase:enableCollision(...) end
---@param ... any
---@return any
function ShapeBase:generatePersistentId(...) end
---@param ... any
---@return any
function ShapeBase:getAnchorNames(...) end
---@param ... any
---@return any
function ShapeBase:getClassDocString(...) end
---@param ... any
---@return any
function ShapeBase:getClassName(...) end
---@param ... any
---@return any
function ShapeBase:getDataBlock(...) end
---@param ... any
---@return any
function ShapeBase:getDeclarationLine(...) end
---@param ... any
---@return any
function ShapeBase:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function ShapeBase:getDynamicFields(...) end
---@param ... any
---@return any
function ShapeBase:getEulerRotation(...) end
---@param ... any
---@return any
function ShapeBase:getField(...) end
---@param ... any
---@return any
function ShapeBase:getFieldInfo(...) end
---@param ... any
---@return any
function ShapeBase:getFieldList(...) end
---@param ... any
---@return any
function ShapeBase:getFields(...) end
---@param ... any
---@return any
function ShapeBase:getFieldsForEditor(...) end
---@param ... any
---@return any
function ShapeBase:getFileName(...) end
---@param ... any
---@return any
function ShapeBase:getFirstMaterialName(...) end
---@param ... any
---@return any
function ShapeBase:getForwardVector(...) end
---@param ... any
---@return any
function ShapeBase:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function ShapeBase:getGroup(...) end
---@param ... any
---@return any
function ShapeBase:getID(...) end
---@param ... any
---@return any
function ShapeBase:getId(...) end
---@param ... any
---@return any
function ShapeBase:getIdString(...) end
---@param ... any
---@return any
function ShapeBase:getInternalName(...) end
---@param ... any
---@return any
function ShapeBase:getMaterialNames(...) end
---@param ... any
---@return any
function ShapeBase:getMeshMaterialNames(...) end
---@param ... any
---@return any
function ShapeBase:getModelFile(...) end
---@param ... any
---@return any
function ShapeBase:getName(...) end
---@param ... any
---@return any
function ShapeBase:getObjBox(...) end
---@param ... any
---@return any
function ShapeBase:getObjectBox(...) end
---@param ... any
---@return any
function ShapeBase:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function ShapeBase:getPosition(...) end
---@param ... any
---@return any
function ShapeBase:getPositionXYZ(...) end
---@param ... any
---@return any
function ShapeBase:getRotation(...) end
---@param ... any
---@return any
function ShapeBase:getScale(...) end
---@param ... any
---@return any
function ShapeBase:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function ShapeBase:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function ShapeBase:getTargetCount(...) end
---@param ... any
---@return any
function ShapeBase:getTargetName(...) end
---@param ... any
---@return any
function ShapeBase:getTransform(...) end
---@param ... any
---@return any
function ShapeBase:getTransformF(...) end
---@param ... any
---@return any
function ShapeBase:getType(...) end
---@param ... any
---@return any
function ShapeBase:getVelocity(...) end
---@param ... any
---@return any
function ShapeBase:getWorldBox(...) end
---@param ... any
---@return any
function ShapeBase:getWorldBoxCenter(...) end
---@param ... any
---@return any
function ShapeBase:getWorldTransform(...) end
---@param ... any
---@return any
function ShapeBase:hideInRenderView(...) end
---@param ... any
---@return any
function ShapeBase:incRefCount(...) end
---@param ... any
---@return any
function ShapeBase:inheritParentFields(...) end
---@param ... any
---@return any
function ShapeBase:inspectUpdate(...) end
---@param ... any
---@return any
function ShapeBase:isChildOfGroup(...) end
---@param ... any
---@return any
function ShapeBase:isEditorDirty(...) end
---@param ... any
---@return any
function ShapeBase:isGlobalBounds(...) end
---@param ... any
---@return any
function ShapeBase:isHidden(...) end
---@param ... any
---@return any
function ShapeBase:isLocked(...) end
---@param ... any
---@return any
function ShapeBase:isNameChangeAllowed(...) end
---@param ... any
---@return any
function ShapeBase:isRenderEnabled(...) end
---@param ... any
---@return any
function ShapeBase:isSelected(...) end
---@param ... any
---@return any
function ShapeBase:isSelectionEnabled(...) end
---@param ... any
---@return any
function ShapeBase:isSubClassOf(...) end
---@param ... any
---@return any
function ShapeBase:onEditorDisable(...) end
---@param ... any
---@return any
function ShapeBase:onEditorEnable(...) end
---@param ... any
---@return any
function ShapeBase:pauseThread(...) end
---@param ... any
---@return any
function ShapeBase:playAudio(...) end
---@param ... any
---@return any
function ShapeBase:playThread(...) end
---@param ... any
---@return any
function ShapeBase:postApply(...) end
---@param ... any
---@return any
function ShapeBase:preApply(...) end
---@param ... any
---@return any
function ShapeBase:registerObject(...) end
---@param ... any
---@return any
function ShapeBase:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function ShapeBase:renderViewMaskClear(...) end
---@param ... any
---@return any
function ShapeBase:save(...) end
---@param ... any
---@return any
function ShapeBase:serialize(...) end
---@param ... any
---@return any
function ShapeBase:serializeForEditor(...) end
---@param ... any
---@return any
function ShapeBase:serializeToDirectories(...) end
---@param ... any
---@return any
function ShapeBase:serializeToNameDictFile(...) end
---@param ... any
---@return any
function ShapeBase:setAllMeshesHidden(...) end
---@param ... any
---@return any
function ShapeBase:setCanFloatAboveGround(...) end
---@param ... any
---@return any
function ShapeBase:setCanSave(...) end
---@param ... any
---@return any
function ShapeBase:setDataBlock(...) end
---@param ... any
---@return any
function ShapeBase:setDeclarationLine(...) end
---@param ... any
---@return any
function ShapeBase:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function ShapeBase:setEditorDirty(...) end
---@param ... any
---@return any
function ShapeBase:setEditorOnly(...) end
---@param ... any
---@return any
function ShapeBase:setField(...) end
---@param ... any
---@return any
function ShapeBase:setFileName(...) end
---@param ... any
---@return any
function ShapeBase:setHidden(...) end
---@param ... any
---@return any
function ShapeBase:setInternalName(...) end
---@param ... any
---@return any
function ShapeBase:setIsSelected(...) end
---@param ... any
---@return any
function ShapeBase:setLocked(...) end
---@param ... any
---@return any
function ShapeBase:setMeshHidden(...) end
---@param ... any
---@return any
function ShapeBase:setName(...) end
---@param ... any
---@return any
function ShapeBase:setNameChangeAllowed(...) end
---@param ... any
---@return any
function ShapeBase:setPosRot(...) end
---@param ... any
---@return any
function ShapeBase:setPosition(...) end
---@param ... any
---@return any
function ShapeBase:setPositionXYZ(...) end
---@param ... any
---@return any
function ShapeBase:setRenderEnabled(...) end
---@param ... any
---@return any
function ShapeBase:setScale(...) end
---@param ... any
---@return any
function ShapeBase:setScaleXYZ(...) end
---@param ... any
---@return any
function ShapeBase:setSelected(...) end
---@param ... any
---@return any
function ShapeBase:setSelectionEnabled(...) end
---@param ... any
---@return any
function ShapeBase:setShapeName(...) end
---@param ... any
---@return any
function ShapeBase:setSkinName(...) end
---@param ... any
---@return any
function ShapeBase:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function ShapeBase:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function ShapeBase:setThreadDir(...) end
---@param ... any
---@return any
function ShapeBase:setThreadPosition(...) end
---@param ... any
---@return any
function ShapeBase:setThreadTimeScale(...) end
---@param ... any
---@return any
function ShapeBase:setTransform(...) end
---@param ... any
---@return any
function ShapeBase:setTransformF(...) end
---@param ... any
---@return any
function ShapeBase:setVelocity(...) end
---@param ... any
---@return any
function ShapeBase:showOnlyInRenderView(...) end
---@param ... any
---@return any
function ShapeBase:stopAudio(...) end
---@param ... any
---@return any
function ShapeBase:stopThread(...) end
---@param ... any
---@return any
function ShapeBase:unhideInRenderView(...) end
---@param ... any
---@return any
function ShapeBase:unregisterObject(...) end

---@class ShapeBaseData : GameBaseData
---@field className any
local ShapeBaseData = {}
---@param ... any
---@return any
function ShapeBaseData:assignFieldsFromObject(...) end
---@param ... any
---@return any
function ShapeBaseData:clone(...) end
---@param ... any
---@return any
function ShapeBaseData:decRefCount(...) end
---@param ... any
---@return any
function ShapeBaseData:delete(...) end
---@param ... any
---@return any
function ShapeBaseData:deleteObject(...) end
---@param ... any
---@return any
function ShapeBaseData:deletePersistentId(...) end
---@param ... any
---@return any
function ShapeBaseData:dump(...) end
---@param ... any
---@return any
function ShapeBaseData:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function ShapeBaseData:generatePersistentId(...) end
---@param ... any
---@return any
function ShapeBaseData:getClassDocString(...) end
---@param ... any
---@return any
function ShapeBaseData:getClassName(...) end
---@param ... any
---@return any
function ShapeBaseData:getDeclarationLine(...) end
---@param ... any
---@return any
function ShapeBaseData:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function ShapeBaseData:getDynamicFields(...) end
---@param ... any
---@return any
function ShapeBaseData:getField(...) end
---@param ... any
---@return any
function ShapeBaseData:getFieldInfo(...) end
---@param ... any
---@return any
function ShapeBaseData:getFieldList(...) end
---@param ... any
---@return any
function ShapeBaseData:getFields(...) end
---@param ... any
---@return any
function ShapeBaseData:getFieldsForEditor(...) end
---@param ... any
---@return any
function ShapeBaseData:getFileName(...) end
---@param ... any
---@return any
function ShapeBaseData:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function ShapeBaseData:getGroup(...) end
---@param ... any
---@return any
function ShapeBaseData:getID(...) end
---@param ... any
---@return any
function ShapeBaseData:getId(...) end
---@param ... any
---@return any
function ShapeBaseData:getIdString(...) end
---@param ... any
---@return any
function ShapeBaseData:getInternalName(...) end
---@param ... any
---@return any
function ShapeBaseData:getName(...) end
---@param ... any
---@return any
function ShapeBaseData:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function ShapeBaseData:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function ShapeBaseData:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function ShapeBaseData:incRefCount(...) end
---@param ... any
---@return any
function ShapeBaseData:inheritParentFields(...) end
---@param ... any
---@return any
function ShapeBaseData:inspectUpdate(...) end
---@param ... any
---@return any
function ShapeBaseData:isChildOfGroup(...) end
---@param ... any
---@return any
function ShapeBaseData:isEditorDirty(...) end
---@param ... any
---@return any
function ShapeBaseData:isHidden(...) end
---@param ... any
---@return any
function ShapeBaseData:isLocked(...) end
---@param ... any
---@return any
function ShapeBaseData:isNameChangeAllowed(...) end
---@param ... any
---@return any
function ShapeBaseData:isSelected(...) end
---@param ... any
---@return any
function ShapeBaseData:isSubClassOf(...) end
---@param ... any
---@return any
function ShapeBaseData:onEditorDisable(...) end
---@param ... any
---@return any
function ShapeBaseData:onEditorEnable(...) end
---@param ... any
---@return any
function ShapeBaseData:postApply(...) end
---@param ... any
---@return any
function ShapeBaseData:preApply(...) end
---@param ... any
---@return any
function ShapeBaseData:registerObject(...) end
---@param ... any
---@return any
function ShapeBaseData:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function ShapeBaseData:save(...) end
---@param ... any
---@return any
function ShapeBaseData:serialize(...) end
---@param ... any
---@return any
function ShapeBaseData:serializeForEditor(...) end
---@param ... any
---@return any
function ShapeBaseData:serializeToDirectories(...) end
---@param ... any
---@return any
function ShapeBaseData:serializeToNameDictFile(...) end
---@param ... any
---@return any
function ShapeBaseData:setCanSave(...) end
---@param ... any
---@return any
function ShapeBaseData:setDeclarationLine(...) end
---@param ... any
---@return any
function ShapeBaseData:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function ShapeBaseData:setEditorDirty(...) end
---@param ... any
---@return any
function ShapeBaseData:setEditorOnly(...) end
---@param ... any
---@return any
function ShapeBaseData:setField(...) end
---@param ... any
---@return any
function ShapeBaseData:setFileName(...) end
---@param ... any
---@return any
function ShapeBaseData:setHidden(...) end
---@param ... any
---@return any
function ShapeBaseData:setInternalName(...) end
---@param ... any
---@return any
function ShapeBaseData:setIsSelected(...) end
---@param ... any
---@return any
function ShapeBaseData:setLocked(...) end
---@param ... any
---@return any
function ShapeBaseData:setName(...) end
---@param ... any
---@return any
function ShapeBaseData:setNameChangeAllowed(...) end
---@param ... any
---@return any
function ShapeBaseData:setSelected(...) end
---@param ... any
---@return any
function ShapeBaseData:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function ShapeBaseData:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function ShapeBaseData:unregisterObject(...) end

---@class SimDataBlock : SimObject
---@field className any
local SimDataBlock = {}
---@param ... any
---@return any
function SimDataBlock:assignFieldsFromObject(...) end
---@param ... any
---@return any
function SimDataBlock:clone(...) end
---@param ... any
---@return any
function SimDataBlock:decRefCount(...) end
---@param ... any
---@return any
function SimDataBlock:delete(...) end
---@param ... any
---@return any
function SimDataBlock:deleteObject(...) end
---@param ... any
---@return any
function SimDataBlock:deletePersistentId(...) end
---@param ... any
---@return any
function SimDataBlock:dump(...) end
---@param ... any
---@return any
function SimDataBlock:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function SimDataBlock:generatePersistentId(...) end
---@param ... any
---@return any
function SimDataBlock:getClassDocString(...) end
---@param ... any
---@return any
function SimDataBlock:getClassName(...) end
---@param ... any
---@return any
function SimDataBlock:getDeclarationLine(...) end
---@param ... any
---@return any
function SimDataBlock:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function SimDataBlock:getDynamicFields(...) end
---@param ... any
---@return any
function SimDataBlock:getField(...) end
---@param ... any
---@return any
function SimDataBlock:getFieldInfo(...) end
---@param ... any
---@return any
function SimDataBlock:getFieldList(...) end
---@param ... any
---@return any
function SimDataBlock:getFields(...) end
---@param ... any
---@return any
function SimDataBlock:getFieldsForEditor(...) end
---@param ... any
---@return any
function SimDataBlock:getFileName(...) end
---@param ... any
---@return any
function SimDataBlock:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function SimDataBlock:getGroup(...) end
---@param ... any
---@return any
function SimDataBlock:getID(...) end
---@param ... any
---@return any
function SimDataBlock:getId(...) end
---@param ... any
---@return any
function SimDataBlock:getIdString(...) end
---@param ... any
---@return any
function SimDataBlock:getInternalName(...) end
---@param ... any
---@return any
function SimDataBlock:getName(...) end
---@param ... any
---@return any
function SimDataBlock:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function SimDataBlock:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SimDataBlock:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SimDataBlock:incRefCount(...) end
---@param ... any
---@return any
function SimDataBlock:inheritParentFields(...) end
---@param ... any
---@return any
function SimDataBlock:inspectUpdate(...) end
---@param ... any
---@return any
function SimDataBlock:isChildOfGroup(...) end
---@param ... any
---@return any
function SimDataBlock:isEditorDirty(...) end
---@param ... any
---@return any
function SimDataBlock:isHidden(...) end
---@param ... any
---@return any
function SimDataBlock:isLocked(...) end
---@param ... any
---@return any
function SimDataBlock:isNameChangeAllowed(...) end
---@param ... any
---@return any
function SimDataBlock:isSelected(...) end
---@param ... any
---@return any
function SimDataBlock:isSubClassOf(...) end
---@param ... any
---@return any
function SimDataBlock:onEditorDisable(...) end
---@param ... any
---@return any
function SimDataBlock:onEditorEnable(...) end
---@param ... any
---@return any
function SimDataBlock:postApply(...) end
---@param ... any
---@return any
function SimDataBlock:preApply(...) end
---@param ... any
---@return any
function SimDataBlock:registerObject(...) end
---@param ... any
---@return any
function SimDataBlock:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function SimDataBlock:save(...) end
---@param ... any
---@return any
function SimDataBlock:serialize(...) end
---@param ... any
---@return any
function SimDataBlock:serializeForEditor(...) end
---@param ... any
---@return any
function SimDataBlock:serializeToDirectories(...) end
---@param ... any
---@return any
function SimDataBlock:serializeToNameDictFile(...) end
---@param ... any
---@return any
function SimDataBlock:setCanSave(...) end
---@param ... any
---@return any
function SimDataBlock:setDeclarationLine(...) end
---@param ... any
---@return any
function SimDataBlock:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function SimDataBlock:setEditorDirty(...) end
---@param ... any
---@return any
function SimDataBlock:setEditorOnly(...) end
---@param ... any
---@return any
function SimDataBlock:setField(...) end
---@param ... any
---@return any
function SimDataBlock:setFileName(...) end
---@param ... any
---@return any
function SimDataBlock:setHidden(...) end
---@param ... any
---@return any
function SimDataBlock:setInternalName(...) end
---@param ... any
---@return any
function SimDataBlock:setIsSelected(...) end
---@param ... any
---@return any
function SimDataBlock:setLocked(...) end
---@param ... any
---@return any
function SimDataBlock:setName(...) end
---@param ... any
---@return any
function SimDataBlock:setNameChangeAllowed(...) end
---@param ... any
---@return any
function SimDataBlock:setSelected(...) end
---@param ... any
---@return any
function SimDataBlock:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SimDataBlock:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SimDataBlock:unregisterObject(...) end

---@class SimGroup : SimSet
---@field className any
local SimGroup = {}
---@param ... any
---@return any
function SimGroup:add(...) end
---@param ... any
---@return any
function SimGroup:addObject(...) end
---@param ... any
---@return any
function SimGroup:addWithName(...) end
---@param ... any
---@return any
function SimGroup:assignFieldsFromObject(...) end
---@param ... any
---@return any
function SimGroup:at(...) end
---@param ... any
---@return any
function SimGroup:bringObjectToFront(...) end
---@param ... any
---@return any
function SimGroup:bringToFront(...) end
---@param ... any
---@return any
function SimGroup:clear(...) end
---@param ... any
---@return any
function SimGroup:clone(...) end
---@param ... any
---@return any
function SimGroup:decRefCount(...) end
---@param ... any
---@return any
function SimGroup:delete(...) end
---@param ... any
---@return any
function SimGroup:deleteAllObjects(...) end
---@param ... any
---@return any
function SimGroup:deleteObject(...) end
---@param ... any
---@return any
function SimGroup:deletePersistentId(...) end
---@param ... any
---@return any
function SimGroup:dump(...) end
---@param ... any
---@return any
function SimGroup:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function SimGroup:findObject(...) end
---@param ... any
---@return any
function SimGroup:findObjectById(...) end
---@param ... any
---@return any
function SimGroup:findObjectByInternalName(...) end
---@param ... any
---@return any
function SimGroup:findObjectIdAfter(...) end
---@param ... any
---@return any
function SimGroup:generatePersistentId(...) end
---@param ... any
---@return any
function SimGroup:getClassDocString(...) end
---@param ... any
---@return any
function SimGroup:getClassName(...) end
---@param ... any
---@return any
function SimGroup:getCount(...) end
---@param ... any
---@return any
function SimGroup:getDeclarationLine(...) end
---@param ... any
---@return any
function SimGroup:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function SimGroup:getDynamicFields(...) end
---@param ... any
---@return any
function SimGroup:getField(...) end
---@param ... any
---@return any
function SimGroup:getFieldInfo(...) end
---@param ... any
---@return any
function SimGroup:getFieldList(...) end
---@param ... any
---@return any
function SimGroup:getFields(...) end
---@param ... any
---@return any
function SimGroup:getFieldsForEditor(...) end
---@param ... any
---@return any
function SimGroup:getFileName(...) end
---@param ... any
---@return any
function SimGroup:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function SimGroup:getGroup(...) end
---@param ... any
---@return any
function SimGroup:getID(...) end
---@param ... any
---@return any
function SimGroup:getId(...) end
---@param ... any
---@return any
function SimGroup:getIdString(...) end
---@param ... any
---@return any
function SimGroup:getInternalName(...) end
---@param ... any
---@return any
function SimGroup:getName(...) end
---@param ... any
---@return any
function SimGroup:getObject(...) end
---@param ... any
---@return any
function SimGroup:getObjectIndex(...) end
---@param ... any
---@return any
function SimGroup:getObjects(...) end
---@param ... any
---@return any
function SimGroup:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function SimGroup:getRandom(...) end
---@param ... any
---@return any
function SimGroup:getScenetreeData(...) end
---@param ... any
---@return any
function SimGroup:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SimGroup:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SimGroup:idAt(...) end
---@param ... any
---@return any
function SimGroup:incRefCount(...) end
---@param ... any
---@return any
function SimGroup:inheritParentFields(...) end
---@param ... any
---@return any
function SimGroup:inspectUpdate(...) end
---@param ... any
---@return any
function SimGroup:isChildOfGroup(...) end
---@param ... any
---@return any
function SimGroup:isEditorDirty(...) end
---@param ... any
---@return any
function SimGroup:isHidden(...) end
---@param ... any
---@return any
function SimGroup:isLocked(...) end
---@param ... any
---@return any
function SimGroup:isMember(...) end
---@param ... any
---@return any
function SimGroup:isNameChangeAllowed(...) end
---@param ... any
---@return any
function SimGroup:isSelected(...) end
---@param ... any
---@return any
function SimGroup:isSubClassOf(...) end
---@param ... any
---@return any
function SimGroup:listObjects(...) end
---@param ... any
---@return any
function SimGroup:onEditorDisable(...) end
---@param ... any
---@return any
function SimGroup:onEditorEnable(...) end
---@param ... any
---@return any
function SimGroup:postApply(...) end
---@param ... any
---@return any
function SimGroup:preApply(...) end
---@param ... any
---@return any
function SimGroup:pushObjectToBack(...) end
---@param ... any
---@return any
function SimGroup:pushToBack(...) end
---@param ... any
---@return any
function SimGroup:registerObject(...) end
---@param ... any
---@return any
function SimGroup:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function SimGroup:remove(...) end
---@param ... any
---@return any
function SimGroup:removeObject(...) end
---@param ... any
---@return any
function SimGroup:reorderChild(...) end
---@param ... any
---@return any
function SimGroup:save(...) end
---@param ... any
---@return any
function SimGroup:serialize(...) end
---@param ... any
---@return any
function SimGroup:serializeForEditor(...) end
---@param ... any
---@return any
function SimGroup:serializeToDirectories(...) end
---@param ... any
---@return any
function SimGroup:serializeToNameDictFile(...) end
---@param ... any
---@return any
function SimGroup:setCanSave(...) end
---@param ... any
---@return any
function SimGroup:setDeclarationLine(...) end
---@param ... any
---@return any
function SimGroup:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function SimGroup:setEditorDirty(...) end
---@param ... any
---@return any
function SimGroup:setEditorOnly(...) end
---@param ... any
---@return any
function SimGroup:setField(...) end
---@param ... any
---@return any
function SimGroup:setFileName(...) end
---@param ... any
---@return any
function SimGroup:setHidden(...) end
---@param ... any
---@return any
function SimGroup:setInternalName(...) end
---@param ... any
---@return any
function SimGroup:setIsSelected(...) end
---@param ... any
---@return any
function SimGroup:setLocked(...) end
---@param ... any
---@return any
function SimGroup:setName(...) end
---@param ... any
---@return any
function SimGroup:setNameChangeAllowed(...) end
---@param ... any
---@return any
function SimGroup:setSelected(...) end
---@param ... any
---@return any
function SimGroup:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SimGroup:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SimGroup:size(...) end
---@param ... any
---@return any
function SimGroup:sortByName(...) end
---@param ... any
---@return any
function SimGroup:unregisterObject(...) end

---@class SimObject : ConsoleObject
---@field className any
local SimObject = {}
---@param ... any
---@return any
function SimObject:assignFieldsFromObject(...) end
---@param ... any
---@return any
function SimObject:clone(...) end
---@param ... any
---@return any
function SimObject:decRefCount(...) end
---@param ... any
---@return any
function SimObject:delete(...) end
---@param ... any
---@return any
function SimObject:deleteObject(...) end
---@param ... any
---@return any
function SimObject:deletePersistentId(...) end
---@param ... any
---@return any
function SimObject:dump(...) end
---@param ... any
---@return any
function SimObject:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function SimObject:generatePersistentId(...) end
---@param ... any
---@return any
function SimObject:getClassDocString(...) end
---@param ... any
---@return any
function SimObject:getClassName(...) end
---@param ... any
---@return any
function SimObject:getDeclarationLine(...) end
---@param ... any
---@return any
function SimObject:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function SimObject:getDynamicFields(...) end
---@param ... any
---@return any
function SimObject:getField(...) end
---@param ... any
---@return any
function SimObject:getFieldInfo(...) end
---@param ... any
---@return any
function SimObject:getFieldList(...) end
---@param ... any
---@return any
function SimObject:getFields(...) end
---@param ... any
---@return any
function SimObject:getFieldsForEditor(...) end
---@param ... any
---@return any
function SimObject:getFileName(...) end
---@param ... any
---@return any
function SimObject:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function SimObject:getGroup(...) end
---@param ... any
---@return any
function SimObject:getID(...) end
---@param ... any
---@return any
function SimObject:getId(...) end
---@param ... any
---@return any
function SimObject:getIdString(...) end
---@param ... any
---@return any
function SimObject:getInternalName(...) end
---@param ... any
---@return any
function SimObject:getName(...) end
---@param ... any
---@return any
function SimObject:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function SimObject:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SimObject:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SimObject:incRefCount(...) end
---@param ... any
---@return any
function SimObject:inheritParentFields(...) end
---@param ... any
---@return any
function SimObject:inspectUpdate(...) end
---@param ... any
---@return any
function SimObject:isChildOfGroup(...) end
---@param ... any
---@return any
function SimObject:isEditorDirty(...) end
---@param ... any
---@return any
function SimObject:isHidden(...) end
---@param ... any
---@return any
function SimObject:isLocked(...) end
---@param ... any
---@return any
function SimObject:isNameChangeAllowed(...) end
---@param ... any
---@return any
function SimObject:isSelected(...) end
---@param ... any
---@return any
function SimObject:isSubClassOf(...) end
---@param ... any
---@return any
function SimObject:onEditorDisable(...) end
---@param ... any
---@return any
function SimObject:onEditorEnable(...) end
---@param ... any
---@return any
function SimObject:postApply(...) end
---@param ... any
---@return any
function SimObject:preApply(...) end
---@param ... any
---@return any
function SimObject:registerObject(...) end
---@param ... any
---@return any
function SimObject:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function SimObject:save(...) end
---@param ... any
---@return any
function SimObject:serialize(...) end
---@param ... any
---@return any
function SimObject:serializeForEditor(...) end
---@param ... any
---@return any
function SimObject:serializeToDirectories(...) end
---@param ... any
---@return any
function SimObject:serializeToNameDictFile(...) end
---@param ... any
---@return any
function SimObject:setCanSave(...) end
---@param ... any
---@return any
function SimObject:setDeclarationLine(...) end
---@param ... any
---@return any
function SimObject:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function SimObject:setEditorDirty(...) end
---@param ... any
---@return any
function SimObject:setEditorOnly(...) end
---@param ... any
---@return any
function SimObject:setField(...) end
---@param ... any
---@return any
function SimObject:setFileName(...) end
---@param ... any
---@return any
function SimObject:setHidden(...) end
---@param ... any
---@return any
function SimObject:setInternalName(...) end
---@param ... any
---@return any
function SimObject:setIsSelected(...) end
---@param ... any
---@return any
function SimObject:setLocked(...) end
---@param ... any
---@return any
function SimObject:setName(...) end
---@param ... any
---@return any
function SimObject:setNameChangeAllowed(...) end
---@param ... any
---@return any
function SimObject:setSelected(...) end
---@param ... any
---@return any
function SimObject:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SimObject:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SimObject:unregisterObject(...) end

---@class SimSet : SimObject
---@field className any
local SimSet = {}
---@param ... any
---@return any
function SimSet:addObject(...) end
---@param ... any
---@return any
function SimSet:assignFieldsFromObject(...) end
---@param ... any
---@return any
function SimSet:at(...) end
---@param ... any
---@return any
function SimSet:bringObjectToFront(...) end
---@param ... any
---@return any
function SimSet:bringToFront(...) end
---@param ... any
---@return any
function SimSet:clear(...) end
---@param ... any
---@return any
function SimSet:clone(...) end
---@param ... any
---@return any
function SimSet:decRefCount(...) end
---@param ... any
---@return any
function SimSet:delete(...) end
---@param ... any
---@return any
function SimSet:deleteAllObjects(...) end
---@param ... any
---@return any
function SimSet:deleteObject(...) end
---@param ... any
---@return any
function SimSet:deletePersistentId(...) end
---@param ... any
---@return any
function SimSet:dump(...) end
---@param ... any
---@return any
function SimSet:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function SimSet:findObjectById(...) end
---@param ... any
---@return any
function SimSet:findObjectByInternalName(...) end
---@param ... any
---@return any
function SimSet:findObjectIdAfter(...) end
---@param ... any
---@return any
function SimSet:generatePersistentId(...) end
---@param ... any
---@return any
function SimSet:getClassDocString(...) end
---@param ... any
---@return any
function SimSet:getClassName(...) end
---@param ... any
---@return any
function SimSet:getCount(...) end
---@param ... any
---@return any
function SimSet:getDeclarationLine(...) end
---@param ... any
---@return any
function SimSet:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function SimSet:getDynamicFields(...) end
---@param ... any
---@return any
function SimSet:getField(...) end
---@param ... any
---@return any
function SimSet:getFieldInfo(...) end
---@param ... any
---@return any
function SimSet:getFieldList(...) end
---@param ... any
---@return any
function SimSet:getFields(...) end
---@param ... any
---@return any
function SimSet:getFieldsForEditor(...) end
---@param ... any
---@return any
function SimSet:getFileName(...) end
---@param ... any
---@return any
function SimSet:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function SimSet:getGroup(...) end
---@param ... any
---@return any
function SimSet:getID(...) end
---@param ... any
---@return any
function SimSet:getId(...) end
---@param ... any
---@return any
function SimSet:getIdString(...) end
---@param ... any
---@return any
function SimSet:getInternalName(...) end
---@param ... any
---@return any
function SimSet:getName(...) end
---@param ... any
---@return any
function SimSet:getObject(...) end
---@param ... any
---@return any
function SimSet:getObjectIndex(...) end
---@param ... any
---@return any
function SimSet:getObjects(...) end
---@param ... any
---@return any
function SimSet:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function SimSet:getRandom(...) end
---@param ... any
---@return any
function SimSet:getScenetreeData(...) end
---@param ... any
---@return any
function SimSet:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SimSet:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SimSet:idAt(...) end
---@param ... any
---@return any
function SimSet:incRefCount(...) end
---@param ... any
---@return any
function SimSet:inheritParentFields(...) end
---@param ... any
---@return any
function SimSet:inspectUpdate(...) end
---@param ... any
---@return any
function SimSet:isChildOfGroup(...) end
---@param ... any
---@return any
function SimSet:isEditorDirty(...) end
---@param ... any
---@return any
function SimSet:isHidden(...) end
---@param ... any
---@return any
function SimSet:isLocked(...) end
---@param ... any
---@return any
function SimSet:isMember(...) end
---@param ... any
---@return any
function SimSet:isNameChangeAllowed(...) end
---@param ... any
---@return any
function SimSet:isSelected(...) end
---@param ... any
---@return any
function SimSet:isSubClassOf(...) end
---@param ... any
---@return any
function SimSet:listObjects(...) end
---@param ... any
---@return any
function SimSet:onEditorDisable(...) end
---@param ... any
---@return any
function SimSet:onEditorEnable(...) end
---@param ... any
---@return any
function SimSet:postApply(...) end
---@param ... any
---@return any
function SimSet:preApply(...) end
---@param ... any
---@return any
function SimSet:pushObjectToBack(...) end
---@param ... any
---@return any
function SimSet:pushToBack(...) end
---@param ... any
---@return any
function SimSet:registerObject(...) end
---@param ... any
---@return any
function SimSet:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function SimSet:removeObject(...) end
---@param ... any
---@return any
function SimSet:reorderChild(...) end
---@param ... any
---@return any
function SimSet:save(...) end
---@param ... any
---@return any
function SimSet:serialize(...) end
---@param ... any
---@return any
function SimSet:serializeForEditor(...) end
---@param ... any
---@return any
function SimSet:serializeToDirectories(...) end
---@param ... any
---@return any
function SimSet:serializeToNameDictFile(...) end
---@param ... any
---@return any
function SimSet:setCanSave(...) end
---@param ... any
---@return any
function SimSet:setDeclarationLine(...) end
---@param ... any
---@return any
function SimSet:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function SimSet:setEditorDirty(...) end
---@param ... any
---@return any
function SimSet:setEditorOnly(...) end
---@param ... any
---@return any
function SimSet:setField(...) end
---@param ... any
---@return any
function SimSet:setFileName(...) end
---@param ... any
---@return any
function SimSet:setHidden(...) end
---@param ... any
---@return any
function SimSet:setInternalName(...) end
---@param ... any
---@return any
function SimSet:setIsSelected(...) end
---@param ... any
---@return any
function SimSet:setLocked(...) end
---@param ... any
---@return any
function SimSet:setName(...) end
---@param ... any
---@return any
function SimSet:setNameChangeAllowed(...) end
---@param ... any
---@return any
function SimSet:setSelected(...) end
---@param ... any
---@return any
function SimSet:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SimSet:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SimSet:size(...) end
---@param ... any
---@return any
function SimSet:sortByName(...) end
---@param ... any
---@return any
function SimSet:unregisterObject(...) end

---@class SpawnSphere : MissionMarker
---@field className any
local SpawnSphere = {}
---@param ... any
---@return any
function SpawnSphere:assignFieldsFromObject(...) end
---@param ... any
---@return any
function SpawnSphere:canFloatAboveGround(...) end
---@param ... any
---@return any
function SpawnSphere:changeMaterial(...) end
---@param ... any
---@return any
function SpawnSphere:clone(...) end
---@param ... any
---@return any
function SpawnSphere:decRefCount(...) end
---@param ... any
---@return any
function SpawnSphere:delete(...) end
---@param ... any
---@return any
function SpawnSphere:deleteObject(...) end
---@param ... any
---@return any
function SpawnSphere:deletePersistentId(...) end
---@param ... any
---@return any
function SpawnSphere:disableCollision(...) end
---@param ... any
---@return any
function SpawnSphere:dump(...) end
---@param ... any
---@return any
function SpawnSphere:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function SpawnSphere:dumpMeshVisibility(...) end
---@param ... any
---@return any
function SpawnSphere:enableCollision(...) end
---@param ... any
---@return any
function SpawnSphere:generatePersistentId(...) end
---@param ... any
---@return any
function SpawnSphere:getAnchorNames(...) end
---@param ... any
---@return any
function SpawnSphere:getClassDocString(...) end
---@param ... any
---@return any
function SpawnSphere:getClassName(...) end
---@param ... any
---@return any
function SpawnSphere:getDataBlock(...) end
---@param ... any
---@return any
function SpawnSphere:getDeclarationLine(...) end
---@param ... any
---@return any
function SpawnSphere:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function SpawnSphere:getDynamicFields(...) end
---@param ... any
---@return any
function SpawnSphere:getEulerRotation(...) end
---@param ... any
---@return any
function SpawnSphere:getField(...) end
---@param ... any
---@return any
function SpawnSphere:getFieldInfo(...) end
---@param ... any
---@return any
function SpawnSphere:getFieldList(...) end
---@param ... any
---@return any
function SpawnSphere:getFields(...) end
---@param ... any
---@return any
function SpawnSphere:getFieldsForEditor(...) end
---@param ... any
---@return any
function SpawnSphere:getFileName(...) end
---@param ... any
---@return any
function SpawnSphere:getFirstMaterialName(...) end
---@param ... any
---@return any
function SpawnSphere:getForwardVector(...) end
---@param ... any
---@return any
function SpawnSphere:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function SpawnSphere:getGroup(...) end
---@param ... any
---@return any
function SpawnSphere:getID(...) end
---@param ... any
---@return any
function SpawnSphere:getId(...) end
---@param ... any
---@return any
function SpawnSphere:getIdString(...) end
---@param ... any
---@return any
function SpawnSphere:getInternalName(...) end
---@param ... any
---@return any
function SpawnSphere:getMaterialNames(...) end
---@param ... any
---@return any
function SpawnSphere:getMeshMaterialNames(...) end
---@param ... any
---@return any
function SpawnSphere:getModelFile(...) end
---@param ... any
---@return any
function SpawnSphere:getName(...) end
---@param ... any
---@return any
function SpawnSphere:getObjBox(...) end
---@param ... any
---@return any
function SpawnSphere:getObjectBox(...) end
---@param ... any
---@return any
function SpawnSphere:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function SpawnSphere:getPosition(...) end
---@param ... any
---@return any
function SpawnSphere:getPositionXYZ(...) end
---@param ... any
---@return any
function SpawnSphere:getRotation(...) end
---@param ... any
---@return any
function SpawnSphere:getScale(...) end
---@param ... any
---@return any
function SpawnSphere:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SpawnSphere:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SpawnSphere:getTargetCount(...) end
---@param ... any
---@return any
function SpawnSphere:getTargetName(...) end
---@param ... any
---@return any
function SpawnSphere:getTransform(...) end
---@param ... any
---@return any
function SpawnSphere:getTransformF(...) end
---@param ... any
---@return any
function SpawnSphere:getType(...) end
---@param ... any
---@return any
function SpawnSphere:getVelocity(...) end
---@param ... any
---@return any
function SpawnSphere:getWorldBox(...) end
---@param ... any
---@return any
function SpawnSphere:getWorldBoxCenter(...) end
---@param ... any
---@return any
function SpawnSphere:getWorldTransform(...) end
---@param ... any
---@return any
function SpawnSphere:hideInRenderView(...) end
---@param ... any
---@return any
function SpawnSphere:incRefCount(...) end
---@param ... any
---@return any
function SpawnSphere:inheritParentFields(...) end
---@param ... any
---@return any
function SpawnSphere:inspectUpdate(...) end
---@param ... any
---@return any
function SpawnSphere:isChildOfGroup(...) end
---@param ... any
---@return any
function SpawnSphere:isEditorDirty(...) end
---@param ... any
---@return any
function SpawnSphere:isGlobalBounds(...) end
---@param ... any
---@return any
function SpawnSphere:isHidden(...) end
---@param ... any
---@return any
function SpawnSphere:isLocked(...) end
---@param ... any
---@return any
function SpawnSphere:isNameChangeAllowed(...) end
---@param ... any
---@return any
function SpawnSphere:isRenderEnabled(...) end
---@param ... any
---@return any
function SpawnSphere:isSelected(...) end
---@param ... any
---@return any
function SpawnSphere:isSelectionEnabled(...) end
---@param ... any
---@return any
function SpawnSphere:isSubClassOf(...) end
---@param ... any
---@return any
function SpawnSphere:onEditorDisable(...) end
---@param ... any
---@return any
function SpawnSphere:onEditorEnable(...) end
---@param ... any
---@return any
function SpawnSphere:pauseThread(...) end
---@param ... any
---@return any
function SpawnSphere:playAudio(...) end
---@param ... any
---@return any
function SpawnSphere:playThread(...) end
---@param ... any
---@return any
function SpawnSphere:postApply(...) end
---@param ... any
---@return any
function SpawnSphere:preApply(...) end
---@param ... any
---@return any
function SpawnSphere:registerObject(...) end
---@param ... any
---@return any
function SpawnSphere:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function SpawnSphere:renderViewMaskClear(...) end
---@param ... any
---@return any
function SpawnSphere:save(...) end
---@param ... any
---@return any
function SpawnSphere:serialize(...) end
---@param ... any
---@return any
function SpawnSphere:serializeForEditor(...) end
---@param ... any
---@return any
function SpawnSphere:serializeToDirectories(...) end
---@param ... any
---@return any
function SpawnSphere:serializeToNameDictFile(...) end
---@param ... any
---@return any
function SpawnSphere:setAllMeshesHidden(...) end
---@param ... any
---@return any
function SpawnSphere:setCanFloatAboveGround(...) end
---@param ... any
---@return any
function SpawnSphere:setCanSave(...) end
---@param ... any
---@return any
function SpawnSphere:setDataBlock(...) end
---@param ... any
---@return any
function SpawnSphere:setDeclarationLine(...) end
---@param ... any
---@return any
function SpawnSphere:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function SpawnSphere:setEditorDirty(...) end
---@param ... any
---@return any
function SpawnSphere:setEditorOnly(...) end
---@param ... any
---@return any
function SpawnSphere:setField(...) end
---@param ... any
---@return any
function SpawnSphere:setFileName(...) end
---@param ... any
---@return any
function SpawnSphere:setHidden(...) end
---@param ... any
---@return any
function SpawnSphere:setInternalName(...) end
---@param ... any
---@return any
function SpawnSphere:setIsSelected(...) end
---@param ... any
---@return any
function SpawnSphere:setLocked(...) end
---@param ... any
---@return any
function SpawnSphere:setMeshHidden(...) end
---@param ... any
---@return any
function SpawnSphere:setName(...) end
---@param ... any
---@return any
function SpawnSphere:setNameChangeAllowed(...) end
---@param ... any
---@return any
function SpawnSphere:setPosRot(...) end
---@param ... any
---@return any
function SpawnSphere:setPosition(...) end
---@param ... any
---@return any
function SpawnSphere:setPositionXYZ(...) end
---@param ... any
---@return any
function SpawnSphere:setRenderEnabled(...) end
---@param ... any
---@return any
function SpawnSphere:setScale(...) end
---@param ... any
---@return any
function SpawnSphere:setScaleXYZ(...) end
---@param ... any
---@return any
function SpawnSphere:setSelected(...) end
---@param ... any
---@return any
function SpawnSphere:setSelectionEnabled(...) end
---@param ... any
---@return any
function SpawnSphere:setShapeName(...) end
---@param ... any
---@return any
function SpawnSphere:setSkinName(...) end
---@param ... any
---@return any
function SpawnSphere:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SpawnSphere:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SpawnSphere:setThreadDir(...) end
---@param ... any
---@return any
function SpawnSphere:setThreadPosition(...) end
---@param ... any
---@return any
function SpawnSphere:setThreadTimeScale(...) end
---@param ... any
---@return any
function SpawnSphere:setTransform(...) end
---@param ... any
---@return any
function SpawnSphere:setTransformF(...) end
---@param ... any
---@return any
function SpawnSphere:setVelocity(...) end
---@param ... any
---@return any
function SpawnSphere:showOnlyInRenderView(...) end
---@param ... any
---@return any
function SpawnSphere:stopAudio(...) end
---@param ... any
---@return any
function SpawnSphere:stopThread(...) end
---@param ... any
---@return any
function SpawnSphere:unhideInRenderView(...) end
---@param ... any
---@return any
function SpawnSphere:unregisterObject(...) end

---@class SpotLight : LightBase
---@field className any
local SpotLight = {}
---@param ... any
---@return any
function SpotLight:assignFieldsFromObject(...) end
---@param ... any
---@return any
function SpotLight:canFloatAboveGround(...) end
---@param ... any
---@return any
function SpotLight:clone(...) end
---@param ... any
---@return any
function SpotLight:decRefCount(...) end
---@param ... any
---@return any
function SpotLight:delete(...) end
---@param ... any
---@return any
function SpotLight:deleteObject(...) end
---@param ... any
---@return any
function SpotLight:deletePersistentId(...) end
---@param ... any
---@return any
function SpotLight:disableCollision(...) end
---@param ... any
---@return any
function SpotLight:dump(...) end
---@param ... any
---@return any
function SpotLight:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function SpotLight:enableCollision(...) end
---@param ... any
---@return any
function SpotLight:generatePersistentId(...) end
---@param ... any
---@return any
function SpotLight:getAnchorNames(...) end
---@param ... any
---@return any
function SpotLight:getClassDocString(...) end
---@param ... any
---@return any
function SpotLight:getClassName(...) end
---@param ... any
---@return any
function SpotLight:getDeclarationLine(...) end
---@param ... any
---@return any
function SpotLight:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function SpotLight:getDynamicFields(...) end
---@param ... any
---@return any
function SpotLight:getEulerRotation(...) end
---@param ... any
---@return any
function SpotLight:getField(...) end
---@param ... any
---@return any
function SpotLight:getFieldInfo(...) end
---@param ... any
---@return any
function SpotLight:getFieldList(...) end
---@param ... any
---@return any
function SpotLight:getFields(...) end
---@param ... any
---@return any
function SpotLight:getFieldsForEditor(...) end
---@param ... any
---@return any
function SpotLight:getFileName(...) end
---@param ... any
---@return any
function SpotLight:getFirstMaterialName(...) end
---@param ... any
---@return any
function SpotLight:getForwardVector(...) end
---@param ... any
---@return any
function SpotLight:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function SpotLight:getGroup(...) end
---@param ... any
---@return any
function SpotLight:getID(...) end
---@param ... any
---@return any
function SpotLight:getId(...) end
---@param ... any
---@return any
function SpotLight:getIdString(...) end
---@param ... any
---@return any
function SpotLight:getInternalName(...) end
---@param ... any
---@return any
function SpotLight:getLightEnabled(...) end
---@param ... any
---@return any
function SpotLight:getMaterialNames(...) end
---@param ... any
---@return any
function SpotLight:getMeshMaterialNames(...) end
---@param ... any
---@return any
function SpotLight:getName(...) end
---@param ... any
---@return any
function SpotLight:getObjBox(...) end
---@param ... any
---@return any
function SpotLight:getObjectBox(...) end
---@param ... any
---@return any
function SpotLight:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function SpotLight:getPosition(...) end
---@param ... any
---@return any
function SpotLight:getPositionXYZ(...) end
---@param ... any
---@return any
function SpotLight:getRotation(...) end
---@param ... any
---@return any
function SpotLight:getScale(...) end
---@param ... any
---@return any
function SpotLight:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SpotLight:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SpotLight:getTransform(...) end
---@param ... any
---@return any
function SpotLight:getTransformF(...) end
---@param ... any
---@return any
function SpotLight:getType(...) end
---@param ... any
---@return any
function SpotLight:getWorldBox(...) end
---@param ... any
---@return any
function SpotLight:getWorldBoxCenter(...) end
---@param ... any
---@return any
function SpotLight:getWorldTransform(...) end
---@param ... any
---@return any
function SpotLight:hideInRenderView(...) end
---@param ... any
---@return any
function SpotLight:incRefCount(...) end
---@param ... any
---@return any
function SpotLight:inheritParentFields(...) end
---@param ... any
---@return any
function SpotLight:inspectUpdate(...) end
---@param ... any
---@return any
function SpotLight:isChildOfGroup(...) end
---@param ... any
---@return any
function SpotLight:isEditorDirty(...) end
---@param ... any
---@return any
function SpotLight:isGlobalBounds(...) end
---@param ... any
---@return any
function SpotLight:isHidden(...) end
---@param ... any
---@return any
function SpotLight:isLocked(...) end
---@param ... any
---@return any
function SpotLight:isNameChangeAllowed(...) end
---@param ... any
---@return any
function SpotLight:isRenderEnabled(...) end
---@param ... any
---@return any
function SpotLight:isSelected(...) end
---@param ... any
---@return any
function SpotLight:isSelectionEnabled(...) end
---@param ... any
---@return any
function SpotLight:isSubClassOf(...) end
---@param ... any
---@return any
function SpotLight:onEditorDisable(...) end
---@param ... any
---@return any
function SpotLight:onEditorEnable(...) end
---@param ... any
---@return any
function SpotLight:postApply(...) end
---@param ... any
---@return any
function SpotLight:preApply(...) end
---@param ... any
---@return any
function SpotLight:registerObject(...) end
---@param ... any
---@return any
function SpotLight:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function SpotLight:renderViewMaskClear(...) end
---@param ... any
---@return any
function SpotLight:save(...) end
---@param ... any
---@return any
function SpotLight:serialize(...) end
---@param ... any
---@return any
function SpotLight:serializeForEditor(...) end
---@param ... any
---@return any
function SpotLight:serializeToDirectories(...) end
---@param ... any
---@return any
function SpotLight:serializeToNameDictFile(...) end
---@param ... any
---@return any
function SpotLight:setCanFloatAboveGround(...) end
---@param ... any
---@return any
function SpotLight:setCanSave(...) end
---@param ... any
---@return any
function SpotLight:setDeclarationLine(...) end
---@param ... any
---@return any
function SpotLight:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function SpotLight:setEditorDirty(...) end
---@param ... any
---@return any
function SpotLight:setEditorOnly(...) end
---@param ... any
---@return any
function SpotLight:setField(...) end
---@param ... any
---@return any
function SpotLight:setFileName(...) end
---@param ... any
---@return any
function SpotLight:setHidden(...) end
---@param ... any
---@return any
function SpotLight:setInternalName(...) end
---@param ... any
---@return any
function SpotLight:setIsSelected(...) end
---@param ... any
---@return any
function SpotLight:setLightEnabled(...) end
---@param ... any
---@return any
function SpotLight:setLocked(...) end
---@param ... any
---@return any
function SpotLight:setName(...) end
---@param ... any
---@return any
function SpotLight:setNameChangeAllowed(...) end
---@param ... any
---@return any
function SpotLight:setPosRot(...) end
---@param ... any
---@return any
function SpotLight:setPosition(...) end
---@param ... any
---@return any
function SpotLight:setPositionXYZ(...) end
---@param ... any
---@return any
function SpotLight:setRenderEnabled(...) end
---@param ... any
---@return any
function SpotLight:setScale(...) end
---@param ... any
---@return any
function SpotLight:setScaleXYZ(...) end
---@param ... any
---@return any
function SpotLight:setSelected(...) end
---@param ... any
---@return any
function SpotLight:setSelectionEnabled(...) end
---@param ... any
---@return any
function SpotLight:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function SpotLight:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function SpotLight:setTransform(...) end
---@param ... any
---@return any
function SpotLight:setTransformF(...) end
---@param ... any
---@return any
function SpotLight:showOnlyInRenderView(...) end
---@param ... any
---@return any
function SpotLight:unhideInRenderView(...) end
---@param ... any
---@return any
function SpotLight:unregisterObject(...) end

---@class SurfaceMaskClipmap
---@field __gc any
---@field __index any
local SurfaceMaskClipmap = {}
---@param ... any
---@return any
function SurfaceMaskClipmap:clear(...) end
---@param ... any
---@return any
function SurfaceMaskClipmap:getDebugState(...) end
---@param ... any
---@return any
function SurfaceMaskClipmap:imGuiDrawInflightSaves(...) end
---@param ... any
---@return any
function SurfaceMaskClipmap:imGuiDrawPageMap(...) end
---@param ... any
---@return any
function SurfaceMaskClipmap:init(...) end
---@param ... any
---@return any
function SurfaceMaskClipmap:maskCircleWorld(...) end
---@param ... any
---@return any
function SurfaceMaskClipmap:maskLineWorld(...) end
---@param ... any
---@return any
function SurfaceMaskClipmap:setCenter(...) end
---@param ... any
---@return any
function SurfaceMaskClipmap:setDebugEnabled(...) end

---@class TSShapeConstructor : SimObject
---@field className any
local TSShapeConstructor = {}
---@param ... any
---@return any
function TSShapeConstructor:addCollisionDetail(...) end
---@param ... any
---@return any
function TSShapeConstructor:addImposter(...) end
---@param ... any
---@return any
function TSShapeConstructor:addMesh(...) end
---@param ... any
---@return any
function TSShapeConstructor:addNode(...) end
---@param ... any
---@return any
function TSShapeConstructor:addPrimitive(...) end
---@param ... any
---@return any
function TSShapeConstructor:addSequence(...) end
---@param ... any
---@return any
function TSShapeConstructor:addTrigger(...) end
---@param ... any
---@return any
function TSShapeConstructor:assignFieldsFromObject(...) end
---@param ... any
---@return any
function TSShapeConstructor:clone(...) end
---@param ... any
---@return any
function TSShapeConstructor:createMeshLOD(...) end
---@param ... any
---@return any
function TSShapeConstructor:decRefCount(...) end
---@param ... any
---@return any
function TSShapeConstructor:delete(...) end
---@param ... any
---@return any
function TSShapeConstructor:deleteObject(...) end
---@param ... any
---@return any
function TSShapeConstructor:deletePersistentId(...) end
---@param ... any
---@return any
function TSShapeConstructor:dump(...) end
---@param ... any
---@return any
function TSShapeConstructor:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function TSShapeConstructor:dumpShape(...) end
---@param ... any
---@return any
function TSShapeConstructor:generatePersistentId(...) end
---@param ... any
---@return any
function TSShapeConstructor:getBounds(...) end
---@param ... any
---@return any
function TSShapeConstructor:getClassDocString(...) end
---@param ... any
---@return any
function TSShapeConstructor:getClassName(...) end
---@param ... any
---@return any
function TSShapeConstructor:getDeclarationLine(...) end
---@param ... any
---@return any
function TSShapeConstructor:getDetailLevelCount(...) end
---@param ... any
---@return any
function TSShapeConstructor:getDetailLevelIndex(...) end
---@param ... any
---@return any
function TSShapeConstructor:getDetailLevelName(...) end
---@param ... any
---@return any
function TSShapeConstructor:getDetailLevelSize(...) end
---@param ... any
---@return any
function TSShapeConstructor:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function TSShapeConstructor:getDynamicFields(...) end
---@param ... any
---@return any
function TSShapeConstructor:getField(...) end
---@param ... any
---@return any
function TSShapeConstructor:getFieldInfo(...) end
---@param ... any
---@return any
function TSShapeConstructor:getFieldList(...) end
---@param ... any
---@return any
function TSShapeConstructor:getFields(...) end
---@param ... any
---@return any
function TSShapeConstructor:getFieldsForEditor(...) end
---@param ... any
---@return any
function TSShapeConstructor:getFileName(...) end
---@param ... any
---@return any
function TSShapeConstructor:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function TSShapeConstructor:getGroup(...) end
---@param ... any
---@return any
function TSShapeConstructor:getID(...) end
---@param ... any
---@return any
function TSShapeConstructor:getId(...) end
---@param ... any
---@return any
function TSShapeConstructor:getIdString(...) end
---@param ... any
---@return any
function TSShapeConstructor:getImposterDetailLevel(...) end
---@param ... any
---@return any
function TSShapeConstructor:getImposterSettings(...) end
---@param ... any
---@return any
function TSShapeConstructor:getInternalName(...) end
---@param ... any
---@return any
function TSShapeConstructor:getMeshCount(...) end
---@param ... any
---@return any
function TSShapeConstructor:getMeshMaterial(...) end
---@param ... any
---@return any
function TSShapeConstructor:getMeshName(...) end
---@param ... any
---@return any
function TSShapeConstructor:getMeshSize(...) end
---@param ... any
---@return any
function TSShapeConstructor:getMeshType(...) end
---@param ... any
---@return any
function TSShapeConstructor:getName(...) end
---@param ... any
---@return any
function TSShapeConstructor:getNodeChildCount(...) end
---@param ... any
---@return any
function TSShapeConstructor:getNodeChildName(...) end
---@param ... any
---@return any
function TSShapeConstructor:getNodeCount(...) end
---@param ... any
---@return any
function TSShapeConstructor:getNodeIndex(...) end
---@param ... any
---@return any
function TSShapeConstructor:getNodeName(...) end
---@param ... any
---@return any
function TSShapeConstructor:getNodeObjectCount(...) end
---@param ... any
---@return any
function TSShapeConstructor:getNodeObjectName(...) end
---@param ... any
---@return any
function TSShapeConstructor:getNodeParentName(...) end
---@param ... any
---@return any
function TSShapeConstructor:getNodeTransform(...) end
---@param ... any
---@return any
function TSShapeConstructor:getObjectCount(...) end
---@param ... any
---@return any
function TSShapeConstructor:getObjectIndex(...) end
---@param ... any
---@return any
function TSShapeConstructor:getObjectName(...) end
---@param ... any
---@return any
function TSShapeConstructor:getObjectNode(...) end
---@param ... any
---@return any
function TSShapeConstructor:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function TSShapeConstructor:getSequenceBlend(...) end
---@param ... any
---@return any
function TSShapeConstructor:getSequenceCount(...) end
---@param ... any
---@return any
function TSShapeConstructor:getSequenceCyclic(...) end
---@param ... any
---@return any
function TSShapeConstructor:getSequenceFrameCount(...) end
---@param ... any
---@return any
function TSShapeConstructor:getSequenceGroundSpeed(...) end
---@param ... any
---@return any
function TSShapeConstructor:getSequenceIndex(...) end
---@param ... any
---@return any
function TSShapeConstructor:getSequenceName(...) end
---@param ... any
---@return any
function TSShapeConstructor:getSequencePriority(...) end
---@param ... any
---@return any
function TSShapeConstructor:getSequenceSource(...) end
---@param ... any
---@return any
function TSShapeConstructor:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function TSShapeConstructor:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function TSShapeConstructor:getTargetCount(...) end
---@param ... any
---@return any
function TSShapeConstructor:getTargetName(...) end
---@param ... any
---@return any
function TSShapeConstructor:getTrigger(...) end
---@param ... any
---@return any
function TSShapeConstructor:getTriggerCount(...) end
---@param ... any
---@return any
function TSShapeConstructor:incRefCount(...) end
---@param ... any
---@return any
function TSShapeConstructor:inheritParentFields(...) end
---@param ... any
---@return any
function TSShapeConstructor:inspectUpdate(...) end
---@param ... any
---@return any
function TSShapeConstructor:isChildOfGroup(...) end
---@param ... any
---@return any
function TSShapeConstructor:isEditorDirty(...) end
---@param ... any
---@return any
function TSShapeConstructor:isHidden(...) end
---@param ... any
---@return any
function TSShapeConstructor:isLocked(...) end
---@param ... any
---@return any
function TSShapeConstructor:isNameChangeAllowed(...) end
---@param ... any
---@return any
function TSShapeConstructor:isSelected(...) end
---@param ... any
---@return any
function TSShapeConstructor:isSubClassOf(...) end
---@param ... any
---@return any
function TSShapeConstructor:notifyShapeChanged(...) end
---@param ... any
---@return any
function TSShapeConstructor:onEditorDisable(...) end
---@param ... any
---@return any
function TSShapeConstructor:onEditorEnable(...) end
---@param ... any
---@return any
function TSShapeConstructor:postApply(...) end
---@param ... any
---@return any
function TSShapeConstructor:preApply(...) end
---@param ... any
---@return any
function TSShapeConstructor:registerObject(...) end
---@param ... any
---@return any
function TSShapeConstructor:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function TSShapeConstructor:removeDetailLevel(...) end
---@param ... any
---@return any
function TSShapeConstructor:removeImposter(...) end
---@param ... any
---@return any
function TSShapeConstructor:removeMesh(...) end
---@param ... any
---@return any
function TSShapeConstructor:removeNode(...) end
---@param ... any
---@return any
function TSShapeConstructor:removeObject(...) end
---@param ... any
---@return any
function TSShapeConstructor:removeSequence(...) end
---@param ... any
---@return any
function TSShapeConstructor:removeTrigger(...) end
---@param ... any
---@return any
function TSShapeConstructor:renameDetailLevel(...) end
---@param ... any
---@return any
function TSShapeConstructor:renameNode(...) end
---@param ... any
---@return any
function TSShapeConstructor:renameObject(...) end
---@param ... any
---@return any
function TSShapeConstructor:renameSequence(...) end
---@param ... any
---@return any
function TSShapeConstructor:save(...) end
---@param ... any
---@return any
function TSShapeConstructor:saveShape(...) end
---@param ... any
---@return any
function TSShapeConstructor:serialize(...) end
---@param ... any
---@return any
function TSShapeConstructor:serializeForEditor(...) end
---@param ... any
---@return any
function TSShapeConstructor:serializeToDirectories(...) end
---@param ... any
---@return any
function TSShapeConstructor:serializeToNameDictFile(...) end
---@param ... any
---@return any
function TSShapeConstructor:setBounds(...) end
---@param ... any
---@return any
function TSShapeConstructor:setCanSave(...) end
---@param ... any
---@return any
function TSShapeConstructor:setDeclarationLine(...) end
---@param ... any
---@return any
function TSShapeConstructor:setDetailLevelSize(...) end
---@param ... any
---@return any
function TSShapeConstructor:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function TSShapeConstructor:setEditorDirty(...) end
---@param ... any
---@return any
function TSShapeConstructor:setEditorOnly(...) end
---@param ... any
---@return any
function TSShapeConstructor:setField(...) end
---@param ... any
---@return any
function TSShapeConstructor:setFileName(...) end
---@param ... any
---@return any
function TSShapeConstructor:setHidden(...) end
---@param ... any
---@return any
function TSShapeConstructor:setInternalName(...) end
---@param ... any
---@return any
function TSShapeConstructor:setIsSelected(...) end
---@param ... any
---@return any
function TSShapeConstructor:setLocked(...) end
---@param ... any
---@return any
function TSShapeConstructor:setMeshMaterial(...) end
---@param ... any
---@return any
function TSShapeConstructor:setMeshSize(...) end
---@param ... any
---@return any
function TSShapeConstructor:setMeshType(...) end
---@param ... any
---@return any
function TSShapeConstructor:setName(...) end
---@param ... any
---@return any
function TSShapeConstructor:setNameChangeAllowed(...) end
---@param ... any
---@return any
function TSShapeConstructor:setNodeParent(...) end
---@param ... any
---@return any
function TSShapeConstructor:setNodeTransform(...) end
---@param ... any
---@return any
function TSShapeConstructor:setObjectNode(...) end
---@param ... any
---@return any
function TSShapeConstructor:setSelected(...) end
---@param ... any
---@return any
function TSShapeConstructor:setSequenceBlend(...) end
---@param ... any
---@return any
function TSShapeConstructor:setSequenceCyclic(...) end
---@param ... any
---@return any
function TSShapeConstructor:setSequenceGroundSpeed(...) end
---@param ... any
---@return any
function TSShapeConstructor:setSequencePriority(...) end
---@param ... any
---@return any
function TSShapeConstructor:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function TSShapeConstructor:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function TSShapeConstructor:unregisterObject(...) end
---@param ... any
---@return any
function TSShapeConstructor:writeChangeSet(...) end

---@class TSStatic : SceneObject
---@field className any
local TSStatic = {}
---@param ... any
---@return any
function TSStatic:assignFieldsFromObject(...) end
---@param ... any
---@return any
function TSStatic:canFloatAboveGround(...) end
---@param ... any
---@return any
function TSStatic:changeMaterial(...) end
---@param ... any
---@return any
function TSStatic:clearTaggedTexture(...) end
---@param ... any
---@return any
function TSStatic:clone(...) end
---@param ... any
---@return any
function TSStatic:decRefCount(...) end
---@param ... any
---@return any
function TSStatic:delete(...) end
---@param ... any
---@return any
function TSStatic:deleteObject(...) end
---@param ... any
---@return any
function TSStatic:deletePersistentId(...) end
---@param ... any
---@return any
function TSStatic:disableCollision(...) end
---@param ... any
---@return any
function TSStatic:dump(...) end
---@param ... any
---@return any
function TSStatic:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function TSStatic:enableCollision(...) end
---@param ... any
---@return any
function TSStatic:generatePersistentId(...) end
---@param ... any
---@return any
function TSStatic:getAnchorNames(...) end
---@param ... any
---@return any
function TSStatic:getAnim(...) end
---@param ... any
---@return any
function TSStatic:getClassDocString(...) end
---@param ... any
---@return any
function TSStatic:getClassName(...) end
---@param ... any
---@return any
function TSStatic:getDeclarationLine(...) end
---@param ... any
---@return any
function TSStatic:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function TSStatic:getDynamicFields(...) end
---@param ... any
---@return any
function TSStatic:getEulerRotation(...) end
---@param ... any
---@return any
function TSStatic:getField(...) end
---@param ... any
---@return any
function TSStatic:getFieldInfo(...) end
---@param ... any
---@return any
function TSStatic:getFieldList(...) end
---@param ... any
---@return any
function TSStatic:getFields(...) end
---@param ... any
---@return any
function TSStatic:getFieldsForEditor(...) end
---@param ... any
---@return any
function TSStatic:getFileName(...) end
---@param ... any
---@return any
function TSStatic:getFirstMaterialName(...) end
---@param ... any
---@return any
function TSStatic:getForwardVector(...) end
---@param ... any
---@return any
function TSStatic:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function TSStatic:getGroup(...) end
---@param ... any
---@return any
function TSStatic:getID(...) end
---@param ... any
---@return any
function TSStatic:getId(...) end
---@param ... any
---@return any
function TSStatic:getIdString(...) end
---@param ... any
---@return any
function TSStatic:getInternalName(...) end
---@param ... any
---@return any
function TSStatic:getMaterialNames(...) end
---@param ... any
---@return any
function TSStatic:getMeshMaterialNames(...) end
---@param ... any
---@return any
function TSStatic:getModelFile(...) end
---@param ... any
---@return any
function TSStatic:getName(...) end
---@param ... any
---@return any
function TSStatic:getNodeTransform(...) end
---@param ... any
---@return any
function TSStatic:getObjBox(...) end
---@param ... any
---@return any
function TSStatic:getObjectBox(...) end
---@param ... any
---@return any
function TSStatic:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function TSStatic:getPosition(...) end
---@param ... any
---@return any
function TSStatic:getPositionXYZ(...) end
---@param ... any
---@return any
function TSStatic:getRotation(...) end
---@param ... any
---@return any
function TSStatic:getScale(...) end
---@param ... any
---@return any
function TSStatic:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function TSStatic:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function TSStatic:getTargetCount(...) end
---@param ... any
---@return any
function TSStatic:getTargetName(...) end
---@param ... any
---@return any
function TSStatic:getTransform(...) end
---@param ... any
---@return any
function TSStatic:getTransformF(...) end
---@param ... any
---@return any
function TSStatic:getType(...) end
---@param ... any
---@return any
function TSStatic:getWorldBox(...) end
---@param ... any
---@return any
function TSStatic:getWorldBoxCenter(...) end
---@param ... any
---@return any
function TSStatic:getWorldCollisionBBox(...) end
---@param ... any
---@return any
function TSStatic:getWorldTransform(...) end
---@param ... any
---@return any
function TSStatic:hideInRenderView(...) end
---@param ... any
---@return any
function TSStatic:incRefCount(...) end
---@param ... any
---@return any
function TSStatic:inheritParentFields(...) end
---@param ... any
---@return any
function TSStatic:inspectUpdate(...) end
---@param ... any
---@return any
function TSStatic:isChildOfGroup(...) end
---@param ... any
---@return any
function TSStatic:isEditorDirty(...) end
---@param ... any
---@return any
function TSStatic:isGlobalBounds(...) end
---@param ... any
---@return any
function TSStatic:isHidden(...) end
---@param ... any
---@return any
function TSStatic:isLocked(...) end
---@param ... any
---@return any
function TSStatic:isNameChangeAllowed(...) end
---@param ... any
---@return any
function TSStatic:isRenderEnabled(...) end
---@param ... any
---@return any
function TSStatic:isSelected(...) end
---@param ... any
---@return any
function TSStatic:isSelectionEnabled(...) end
---@param ... any
---@return any
function TSStatic:isSubClassOf(...) end
---@param ... any
---@return any
function TSStatic:onEditorDisable(...) end
---@param ... any
---@return any
function TSStatic:onEditorEnable(...) end
---@param ... any
---@return any
function TSStatic:playAnim(...) end
---@param ... any
---@return any
function TSStatic:postApply(...) end
---@param ... any
---@return any
function TSStatic:preApply(...) end
---@param ... any
---@return any
function TSStatic:registerObject(...) end
---@param ... any
---@return any
function TSStatic:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function TSStatic:renderViewMaskClear(...) end
---@param ... any
---@return any
function TSStatic:save(...) end
---@param ... any
---@return any
function TSStatic:serialize(...) end
---@param ... any
---@return any
function TSStatic:serializeForEditor(...) end
---@param ... any
---@return any
function TSStatic:serializeToDirectories(...) end
---@param ... any
---@return any
function TSStatic:serializeToNameDictFile(...) end
---@param ... any
---@return any
function TSStatic:setCanFloatAboveGround(...) end
---@param ... any
---@return any
function TSStatic:setCanSave(...) end
---@param ... any
---@return any
function TSStatic:setDeclarationLine(...) end
---@param ... any
---@return any
function TSStatic:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function TSStatic:setEditorDirty(...) end
---@param ... any
---@return any
function TSStatic:setEditorOnly(...) end
---@param ... any
---@return any
function TSStatic:setField(...) end
---@param ... any
---@return any
function TSStatic:setFileName(...) end
---@param ... any
---@return any
function TSStatic:setHidden(...) end
---@param ... any
---@return any
function TSStatic:setInternalName(...) end
---@param ... any
---@return any
function TSStatic:setIsSelected(...) end
---@param ... any
---@return any
function TSStatic:setLocked(...) end
---@param ... any
---@return any
function TSStatic:setName(...) end
---@param ... any
---@return any
function TSStatic:setNameChangeAllowed(...) end
---@param ... any
---@return any
function TSStatic:setPosRot(...) end
---@param ... any
---@return any
function TSStatic:setPosition(...) end
---@param ... any
---@return any
function TSStatic:setPositionXYZ(...) end
---@param ... any
---@return any
function TSStatic:setRenderEnabled(...) end
---@param ... any
---@return any
function TSStatic:setScale(...) end
---@param ... any
---@return any
function TSStatic:setScaleXYZ(...) end
---@param ... any
---@return any
function TSStatic:setSelected(...) end
---@param ... any
---@return any
function TSStatic:setSelectionEnabled(...) end
---@param ... any
---@return any
function TSStatic:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function TSStatic:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function TSStatic:setTaggedTextureDrawPrim(...) end
---@param ... any
---@return any
function TSStatic:setTransform(...) end
---@param ... any
---@return any
function TSStatic:setTransformF(...) end
---@param ... any
---@return any
function TSStatic:showOnlyInRenderView(...) end
---@param ... any
---@return any
function TSStatic:unhideInRenderView(...) end
---@param ... any
---@return any
function TSStatic:unregisterObject(...) end
---@param ... any
---@return any
function TSStatic:updateInstanceRenderData(...) end

---@class TerrainMaterial : SimObject
---@field className any
local TerrainMaterial = {}
---@param ... any
---@return any
function TerrainMaterial:assignFieldsFromObject(...) end
---@param ... any
---@return any
function TerrainMaterial:clone(...) end
---@param ... any
---@return any
function TerrainMaterial:decRefCount(...) end
---@param ... any
---@return any
function TerrainMaterial:delete(...) end
---@param ... any
---@return any
function TerrainMaterial:deleteObject(...) end
---@param ... any
---@return any
function TerrainMaterial:deletePersistentId(...) end
---@param ... any
---@return any
function TerrainMaterial:dump(...) end
---@param ... any
---@return any
function TerrainMaterial:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function TerrainMaterial:generatePersistentId(...) end
---@param ... any
---@return any
function TerrainMaterial:getAnnotation(...) end
---@param ... any
---@return any
function TerrainMaterial:getClassDocString(...) end
---@param ... any
---@return any
function TerrainMaterial:getClassName(...) end
---@param ... any
---@return any
function TerrainMaterial:getDeclarationLine(...) end
---@param ... any
---@return any
function TerrainMaterial:getDetailDistance(...) end
---@param ... any
---@return any
function TerrainMaterial:getDetailMap(...) end
---@param ... any
---@return any
function TerrainMaterial:getDetailSize(...) end
---@param ... any
---@return any
function TerrainMaterial:getDetailStrength(...) end
---@param ... any
---@return any
function TerrainMaterial:getDiffuseMap(...) end
---@param ... any
---@return any
function TerrainMaterial:getDiffuseSize(...) end
---@param ... any
---@return any
function TerrainMaterial:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function TerrainMaterial:getDynamicFields(...) end
---@param ... any
---@return any
function TerrainMaterial:getField(...) end
---@param ... any
---@return any
function TerrainMaterial:getFieldInfo(...) end
---@param ... any
---@return any
function TerrainMaterial:getFieldList(...) end
---@param ... any
---@return any
function TerrainMaterial:getFields(...) end
---@param ... any
---@return any
function TerrainMaterial:getFieldsForEditor(...) end
---@param ... any
---@return any
function TerrainMaterial:getFileName(...) end
---@param ... any
---@return any
function TerrainMaterial:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function TerrainMaterial:getGroundmodelName(...) end
---@param ... any
---@return any
function TerrainMaterial:getGroup(...) end
---@param ... any
---@return any
function TerrainMaterial:getID(...) end
---@param ... any
---@return any
function TerrainMaterial:getId(...) end
---@param ... any
---@return any
function TerrainMaterial:getIdString(...) end
---@param ... any
---@return any
function TerrainMaterial:getInternalName(...) end
---@param ... any
---@return any
function TerrainMaterial:getMacroDistance(...) end
---@param ... any
---@return any
function TerrainMaterial:getMacroMap(...) end
---@param ... any
---@return any
function TerrainMaterial:getMacroSize(...) end
---@param ... any
---@return any
function TerrainMaterial:getMacroStrength(...) end
---@param ... any
---@return any
function TerrainMaterial:getName(...) end
---@param ... any
---@return any
function TerrainMaterial:getNormalMap(...) end
---@param ... any
---@return any
function TerrainMaterial:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function TerrainMaterial:getParallaxScale(...) end
---@param ... any
---@return any
function TerrainMaterial:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function TerrainMaterial:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function TerrainMaterial:incRefCount(...) end
---@param ... any
---@return any
function TerrainMaterial:inheritParentFields(...) end
---@param ... any
---@return any
function TerrainMaterial:inspectUpdate(...) end
---@param ... any
---@return any
function TerrainMaterial:isChildOfGroup(...) end
---@param ... any
---@return any
function TerrainMaterial:isEditorDirty(...) end
---@param ... any
---@return any
function TerrainMaterial:isHidden(...) end
---@param ... any
---@return any
function TerrainMaterial:isLocked(...) end
---@param ... any
---@return any
function TerrainMaterial:isNameChangeAllowed(...) end
---@param ... any
---@return any
function TerrainMaterial:isSelected(...) end
---@param ... any
---@return any
function TerrainMaterial:isSubClassOf(...) end
---@param ... any
---@return any
function TerrainMaterial:onEditorDisable(...) end
---@param ... any
---@return any
function TerrainMaterial:onEditorEnable(...) end
---@param ... any
---@return any
function TerrainMaterial:postApply(...) end
---@param ... any
---@return any
function TerrainMaterial:preApply(...) end
---@param ... any
---@return any
function TerrainMaterial:registerObject(...) end
---@param ... any
---@return any
function TerrainMaterial:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function TerrainMaterial:save(...) end
---@param ... any
---@return any
function TerrainMaterial:serialize(...) end
---@param ... any
---@return any
function TerrainMaterial:serializeForEditor(...) end
---@param ... any
---@return any
function TerrainMaterial:serializeToDirectories(...) end
---@param ... any
---@return any
function TerrainMaterial:serializeToNameDictFile(...) end
---@param ... any
---@return any
function TerrainMaterial:setAnnotation(...) end
---@param ... any
---@return any
function TerrainMaterial:setCanSave(...) end
---@param ... any
---@return any
function TerrainMaterial:setDeclarationLine(...) end
---@param ... any
---@return any
function TerrainMaterial:setDetailDistance(...) end
---@param ... any
---@return any
function TerrainMaterial:setDetailMap(...) end
---@param ... any
---@return any
function TerrainMaterial:setDetailSize(...) end
---@param ... any
---@return any
function TerrainMaterial:setDetailStrength(...) end
---@param ... any
---@return any
function TerrainMaterial:setDiffuseMap(...) end
---@param ... any
---@return any
function TerrainMaterial:setDiffuseSize(...) end
---@param ... any
---@return any
function TerrainMaterial:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function TerrainMaterial:setEditorDirty(...) end
---@param ... any
---@return any
function TerrainMaterial:setEditorOnly(...) end
---@param ... any
---@return any
function TerrainMaterial:setField(...) end
---@param ... any
---@return any
function TerrainMaterial:setFileName(...) end
---@param ... any
---@return any
function TerrainMaterial:setGroundmodelName(...) end
---@param ... any
---@return any
function TerrainMaterial:setHidden(...) end
---@param ... any
---@return any
function TerrainMaterial:setInternalName(...) end
---@param ... any
---@return any
function TerrainMaterial:setIsSelected(...) end
---@param ... any
---@return any
function TerrainMaterial:setLocked(...) end
---@param ... any
---@return any
function TerrainMaterial:setMacroDistance(...) end
---@param ... any
---@return any
function TerrainMaterial:setMacroMap(...) end
---@param ... any
---@return any
function TerrainMaterial:setMacroSize(...) end
---@param ... any
---@return any
function TerrainMaterial:setMacroStrength(...) end
---@param ... any
---@return any
function TerrainMaterial:setName(...) end
---@param ... any
---@return any
function TerrainMaterial:setNameChangeAllowed(...) end
---@param ... any
---@return any
function TerrainMaterial:setNormalMap(...) end
---@param ... any
---@return any
function TerrainMaterial:setParallaxScale(...) end
---@param ... any
---@return any
function TerrainMaterial:setSelected(...) end
---@param ... any
---@return any
function TerrainMaterial:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function TerrainMaterial:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function TerrainMaterial:setUseSideProjection(...) end
---@param ... any
---@return any
function TerrainMaterial:unregisterObject(...) end
---@param ... any
---@return any
function TerrainMaterial:useSideProjection(...) end

---@class TerrainMaterialTextureSet : SimObject
---@field className any
local TerrainMaterialTextureSet = {}
---@param ... any
---@return any
function TerrainMaterialTextureSet:assignFieldsFromObject(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:clone(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:decRefCount(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:delete(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:deleteObject(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:deletePersistentId(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:dump(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:generatePersistentId(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:getClassDocString(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:getClassName(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:getDeclarationLine(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:getDynamicFields(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:getField(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:getFieldInfo(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:getFieldList(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:getFields(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:getFieldsForEditor(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:getFileName(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:getGroup(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:getID(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:getId(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:getIdString(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:getInternalName(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:getName(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:incRefCount(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:inheritParentFields(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:inspectUpdate(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:isChildOfGroup(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:isEditorDirty(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:isHidden(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:isLocked(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:isNameChangeAllowed(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:isSelected(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:isSubClassOf(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:onEditorDisable(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:onEditorEnable(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:postApply(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:preApply(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:registerObject(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:save(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:serialize(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:serializeForEditor(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:serializeToDirectories(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:serializeToNameDictFile(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:setCanSave(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:setDeclarationLine(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:setEditorDirty(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:setEditorOnly(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:setField(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:setFileName(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:setHidden(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:setInternalName(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:setIsSelected(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:setLocked(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:setName(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:setNameChangeAllowed(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:setSelected(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function TerrainMaterialTextureSet:unregisterObject(...) end

---@class TextureDrawPrimitiveRegistry
---@field __gc any
---@field __index any
local TextureDrawPrimitiveRegistry = {}
---@param ... any
---@return any
function TextureDrawPrimitiveRegistry:get(...) end
---@param ... any
---@return any
function TextureDrawPrimitiveRegistry:getListNames(...) end
---@param ... any
---@return any
function TextureDrawPrimitiveRegistry:getOrCreate(...) end
---@param ... any
---@return any
function TextureDrawPrimitiveRegistry:removeName(...) end

---@class WaterBlock : WaterObject
---@field className any
local WaterBlock = {}
---@param ... any
---@return any
function WaterBlock:assignFieldsFromObject(...) end
---@param ... any
---@return any
function WaterBlock:canFloatAboveGround(...) end
---@param ... any
---@return any
function WaterBlock:clone(...) end
---@param ... any
---@return any
function WaterBlock:decRefCount(...) end
---@param ... any
---@return any
function WaterBlock:delete(...) end
---@param ... any
---@return any
function WaterBlock:deleteObject(...) end
---@param ... any
---@return any
function WaterBlock:deletePersistentId(...) end
---@param ... any
---@return any
function WaterBlock:disableCollision(...) end
---@param ... any
---@return any
function WaterBlock:dump(...) end
---@param ... any
---@return any
function WaterBlock:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function WaterBlock:enableCollision(...) end
---@param ... any
---@return any
function WaterBlock:generatePersistentId(...) end
---@param ... any
---@return any
function WaterBlock:getAnchorNames(...) end
---@param ... any
---@return any
function WaterBlock:getClassDocString(...) end
---@param ... any
---@return any
function WaterBlock:getClassName(...) end
---@param ... any
---@return any
function WaterBlock:getDeclarationLine(...) end
---@param ... any
---@return any
function WaterBlock:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function WaterBlock:getDynamicFields(...) end
---@param ... any
---@return any
function WaterBlock:getEulerRotation(...) end
---@param ... any
---@return any
function WaterBlock:getField(...) end
---@param ... any
---@return any
function WaterBlock:getFieldInfo(...) end
---@param ... any
---@return any
function WaterBlock:getFieldList(...) end
---@param ... any
---@return any
function WaterBlock:getFields(...) end
---@param ... any
---@return any
function WaterBlock:getFieldsForEditor(...) end
---@param ... any
---@return any
function WaterBlock:getFileName(...) end
---@param ... any
---@return any
function WaterBlock:getFirstMaterialName(...) end
---@param ... any
---@return any
function WaterBlock:getForwardVector(...) end
---@param ... any
---@return any
function WaterBlock:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function WaterBlock:getGroup(...) end
---@param ... any
---@return any
function WaterBlock:getID(...) end
---@param ... any
---@return any
function WaterBlock:getId(...) end
---@param ... any
---@return any
function WaterBlock:getIdString(...) end
---@param ... any
---@return any
function WaterBlock:getInternalName(...) end
---@param ... any
---@return any
function WaterBlock:getMaterialNames(...) end
---@param ... any
---@return any
function WaterBlock:getMeshMaterialNames(...) end
---@param ... any
---@return any
function WaterBlock:getName(...) end
---@param ... any
---@return any
function WaterBlock:getObjBox(...) end
---@param ... any
---@return any
function WaterBlock:getObjectBox(...) end
---@param ... any
---@return any
function WaterBlock:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function WaterBlock:getPosition(...) end
---@param ... any
---@return any
function WaterBlock:getPositionXYZ(...) end
---@param ... any
---@return any
function WaterBlock:getRotation(...) end
---@param ... any
---@return any
function WaterBlock:getScale(...) end
---@param ... any
---@return any
function WaterBlock:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function WaterBlock:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function WaterBlock:getTransform(...) end
---@param ... any
---@return any
function WaterBlock:getTransformF(...) end
---@param ... any
---@return any
function WaterBlock:getType(...) end
---@param ... any
---@return any
function WaterBlock:getWorldBox(...) end
---@param ... any
---@return any
function WaterBlock:getWorldBoxCenter(...) end
---@param ... any
---@return any
function WaterBlock:getWorldTransform(...) end
---@param ... any
---@return any
function WaterBlock:hideInRenderView(...) end
---@param ... any
---@return any
function WaterBlock:incRefCount(...) end
---@param ... any
---@return any
function WaterBlock:inheritParentFields(...) end
---@param ... any
---@return any
function WaterBlock:inspectUpdate(...) end
---@param ... any
---@return any
function WaterBlock:isChildOfGroup(...) end
---@param ... any
---@return any
function WaterBlock:isEditorDirty(...) end
---@param ... any
---@return any
function WaterBlock:isGlobalBounds(...) end
---@param ... any
---@return any
function WaterBlock:isHidden(...) end
---@param ... any
---@return any
function WaterBlock:isLocked(...) end
---@param ... any
---@return any
function WaterBlock:isNameChangeAllowed(...) end
---@param ... any
---@return any
function WaterBlock:isRenderEnabled(...) end
---@param ... any
---@return any
function WaterBlock:isSelected(...) end
---@param ... any
---@return any
function WaterBlock:isSelectionEnabled(...) end
---@param ... any
---@return any
function WaterBlock:isSubClassOf(...) end
---@param ... any
---@return any
function WaterBlock:onEditorDisable(...) end
---@param ... any
---@return any
function WaterBlock:onEditorEnable(...) end
---@param ... any
---@return any
function WaterBlock:postApply(...) end
---@param ... any
---@return any
function WaterBlock:preApply(...) end
---@param ... any
---@return any
function WaterBlock:registerObject(...) end
---@param ... any
---@return any
function WaterBlock:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function WaterBlock:reloadTextures(...) end
---@param ... any
---@return any
function WaterBlock:renderViewMaskClear(...) end
---@param ... any
---@return any
function WaterBlock:save(...) end
---@param ... any
---@return any
function WaterBlock:serialize(...) end
---@param ... any
---@return any
function WaterBlock:serializeForEditor(...) end
---@param ... any
---@return any
function WaterBlock:serializeToDirectories(...) end
---@param ... any
---@return any
function WaterBlock:serializeToNameDictFile(...) end
---@param ... any
---@return any
function WaterBlock:setCanFloatAboveGround(...) end
---@param ... any
---@return any
function WaterBlock:setCanSave(...) end
---@param ... any
---@return any
function WaterBlock:setDeclarationLine(...) end
---@param ... any
---@return any
function WaterBlock:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function WaterBlock:setEditorDirty(...) end
---@param ... any
---@return any
function WaterBlock:setEditorOnly(...) end
---@param ... any
---@return any
function WaterBlock:setField(...) end
---@param ... any
---@return any
function WaterBlock:setFileName(...) end
---@param ... any
---@return any
function WaterBlock:setHidden(...) end
---@param ... any
---@return any
function WaterBlock:setInternalName(...) end
---@param ... any
---@return any
function WaterBlock:setIsSelected(...) end
---@param ... any
---@return any
function WaterBlock:setLocked(...) end
---@param ... any
---@return any
function WaterBlock:setName(...) end
---@param ... any
---@return any
function WaterBlock:setNameChangeAllowed(...) end
---@param ... any
---@return any
function WaterBlock:setPosRot(...) end
---@param ... any
---@return any
function WaterBlock:setPosition(...) end
---@param ... any
---@return any
function WaterBlock:setPositionXYZ(...) end
---@param ... any
---@return any
function WaterBlock:setRenderEnabled(...) end
---@param ... any
---@return any
function WaterBlock:setScale(...) end
---@param ... any
---@return any
function WaterBlock:setScaleXYZ(...) end
---@param ... any
---@return any
function WaterBlock:setSelected(...) end
---@param ... any
---@return any
function WaterBlock:setSelectionEnabled(...) end
---@param ... any
---@return any
function WaterBlock:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function WaterBlock:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function WaterBlock:setTransform(...) end
---@param ... any
---@return any
function WaterBlock:setTransformF(...) end
---@param ... any
---@return any
function WaterBlock:showOnlyInRenderView(...) end
---@param ... any
---@return any
function WaterBlock:unhideInRenderView(...) end
---@param ... any
---@return any
function WaterBlock:unregisterObject(...) end

---@class WaterObject : SceneObject
---@field className any
local WaterObject = {}
---@param ... any
---@return any
function WaterObject:assignFieldsFromObject(...) end
---@param ... any
---@return any
function WaterObject:canFloatAboveGround(...) end
---@param ... any
---@return any
function WaterObject:clone(...) end
---@param ... any
---@return any
function WaterObject:decRefCount(...) end
---@param ... any
---@return any
function WaterObject:delete(...) end
---@param ... any
---@return any
function WaterObject:deleteObject(...) end
---@param ... any
---@return any
function WaterObject:deletePersistentId(...) end
---@param ... any
---@return any
function WaterObject:disableCollision(...) end
---@param ... any
---@return any
function WaterObject:dump(...) end
---@param ... any
---@return any
function WaterObject:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function WaterObject:enableCollision(...) end
---@param ... any
---@return any
function WaterObject:generatePersistentId(...) end
---@param ... any
---@return any
function WaterObject:getAnchorNames(...) end
---@param ... any
---@return any
function WaterObject:getClassDocString(...) end
---@param ... any
---@return any
function WaterObject:getClassName(...) end
---@param ... any
---@return any
function WaterObject:getDeclarationLine(...) end
---@param ... any
---@return any
function WaterObject:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function WaterObject:getDynamicFields(...) end
---@param ... any
---@return any
function WaterObject:getEulerRotation(...) end
---@param ... any
---@return any
function WaterObject:getField(...) end
---@param ... any
---@return any
function WaterObject:getFieldInfo(...) end
---@param ... any
---@return any
function WaterObject:getFieldList(...) end
---@param ... any
---@return any
function WaterObject:getFields(...) end
---@param ... any
---@return any
function WaterObject:getFieldsForEditor(...) end
---@param ... any
---@return any
function WaterObject:getFileName(...) end
---@param ... any
---@return any
function WaterObject:getFirstMaterialName(...) end
---@param ... any
---@return any
function WaterObject:getForwardVector(...) end
---@param ... any
---@return any
function WaterObject:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function WaterObject:getGroup(...) end
---@param ... any
---@return any
function WaterObject:getID(...) end
---@param ... any
---@return any
function WaterObject:getId(...) end
---@param ... any
---@return any
function WaterObject:getIdString(...) end
---@param ... any
---@return any
function WaterObject:getInternalName(...) end
---@param ... any
---@return any
function WaterObject:getMaterialNames(...) end
---@param ... any
---@return any
function WaterObject:getMeshMaterialNames(...) end
---@param ... any
---@return any
function WaterObject:getName(...) end
---@param ... any
---@return any
function WaterObject:getObjBox(...) end
---@param ... any
---@return any
function WaterObject:getObjectBox(...) end
---@param ... any
---@return any
function WaterObject:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function WaterObject:getPosition(...) end
---@param ... any
---@return any
function WaterObject:getPositionXYZ(...) end
---@param ... any
---@return any
function WaterObject:getRotation(...) end
---@param ... any
---@return any
function WaterObject:getScale(...) end
---@param ... any
---@return any
function WaterObject:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function WaterObject:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function WaterObject:getTransform(...) end
---@param ... any
---@return any
function WaterObject:getTransformF(...) end
---@param ... any
---@return any
function WaterObject:getType(...) end
---@param ... any
---@return any
function WaterObject:getWorldBox(...) end
---@param ... any
---@return any
function WaterObject:getWorldBoxCenter(...) end
---@param ... any
---@return any
function WaterObject:getWorldTransform(...) end
---@param ... any
---@return any
function WaterObject:hideInRenderView(...) end
---@param ... any
---@return any
function WaterObject:incRefCount(...) end
---@param ... any
---@return any
function WaterObject:inheritParentFields(...) end
---@param ... any
---@return any
function WaterObject:inspectUpdate(...) end
---@param ... any
---@return any
function WaterObject:isChildOfGroup(...) end
---@param ... any
---@return any
function WaterObject:isEditorDirty(...) end
---@param ... any
---@return any
function WaterObject:isGlobalBounds(...) end
---@param ... any
---@return any
function WaterObject:isHidden(...) end
---@param ... any
---@return any
function WaterObject:isLocked(...) end
---@param ... any
---@return any
function WaterObject:isNameChangeAllowed(...) end
---@param ... any
---@return any
function WaterObject:isRenderEnabled(...) end
---@param ... any
---@return any
function WaterObject:isSelected(...) end
---@param ... any
---@return any
function WaterObject:isSelectionEnabled(...) end
---@param ... any
---@return any
function WaterObject:isSubClassOf(...) end
---@param ... any
---@return any
function WaterObject:onEditorDisable(...) end
---@param ... any
---@return any
function WaterObject:onEditorEnable(...) end
---@param ... any
---@return any
function WaterObject:postApply(...) end
---@param ... any
---@return any
function WaterObject:preApply(...) end
---@param ... any
---@return any
function WaterObject:registerObject(...) end
---@param ... any
---@return any
function WaterObject:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function WaterObject:reloadTextures(...) end
---@param ... any
---@return any
function WaterObject:renderViewMaskClear(...) end
---@param ... any
---@return any
function WaterObject:save(...) end
---@param ... any
---@return any
function WaterObject:serialize(...) end
---@param ... any
---@return any
function WaterObject:serializeForEditor(...) end
---@param ... any
---@return any
function WaterObject:serializeToDirectories(...) end
---@param ... any
---@return any
function WaterObject:serializeToNameDictFile(...) end
---@param ... any
---@return any
function WaterObject:setCanFloatAboveGround(...) end
---@param ... any
---@return any
function WaterObject:setCanSave(...) end
---@param ... any
---@return any
function WaterObject:setDeclarationLine(...) end
---@param ... any
---@return any
function WaterObject:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function WaterObject:setEditorDirty(...) end
---@param ... any
---@return any
function WaterObject:setEditorOnly(...) end
---@param ... any
---@return any
function WaterObject:setField(...) end
---@param ... any
---@return any
function WaterObject:setFileName(...) end
---@param ... any
---@return any
function WaterObject:setHidden(...) end
---@param ... any
---@return any
function WaterObject:setInternalName(...) end
---@param ... any
---@return any
function WaterObject:setIsSelected(...) end
---@param ... any
---@return any
function WaterObject:setLocked(...) end
---@param ... any
---@return any
function WaterObject:setName(...) end
---@param ... any
---@return any
function WaterObject:setNameChangeAllowed(...) end
---@param ... any
---@return any
function WaterObject:setPosRot(...) end
---@param ... any
---@return any
function WaterObject:setPosition(...) end
---@param ... any
---@return any
function WaterObject:setPositionXYZ(...) end
---@param ... any
---@return any
function WaterObject:setRenderEnabled(...) end
---@param ... any
---@return any
function WaterObject:setScale(...) end
---@param ... any
---@return any
function WaterObject:setScaleXYZ(...) end
---@param ... any
---@return any
function WaterObject:setSelected(...) end
---@param ... any
---@return any
function WaterObject:setSelectionEnabled(...) end
---@param ... any
---@return any
function WaterObject:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function WaterObject:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function WaterObject:setTransform(...) end
---@param ... any
---@return any
function WaterObject:setTransformF(...) end
---@param ... any
---@return any
function WaterObject:showOnlyInRenderView(...) end
---@param ... any
---@return any
function WaterObject:unhideInRenderView(...) end
---@param ... any
---@return any
function WaterObject:unregisterObject(...) end

---@class WaterPlane : WaterObject
---@field className any
local WaterPlane = {}
---@param ... any
---@return any
function WaterPlane:assignFieldsFromObject(...) end
---@param ... any
---@return any
function WaterPlane:canFloatAboveGround(...) end
---@param ... any
---@return any
function WaterPlane:clone(...) end
---@param ... any
---@return any
function WaterPlane:decRefCount(...) end
---@param ... any
---@return any
function WaterPlane:delete(...) end
---@param ... any
---@return any
function WaterPlane:deleteObject(...) end
---@param ... any
---@return any
function WaterPlane:deletePersistentId(...) end
---@param ... any
---@return any
function WaterPlane:disableCollision(...) end
---@param ... any
---@return any
function WaterPlane:dump(...) end
---@param ... any
---@return any
function WaterPlane:dumpGroupHierarchy(...) end
---@param ... any
---@return any
function WaterPlane:enableCollision(...) end
---@param ... any
---@return any
function WaterPlane:generatePersistentId(...) end
---@param ... any
---@return any
function WaterPlane:getAnchorNames(...) end
---@param ... any
---@return any
function WaterPlane:getClassDocString(...) end
---@param ... any
---@return any
function WaterPlane:getClassName(...) end
---@param ... any
---@return any
function WaterPlane:getDeclarationLine(...) end
---@param ... any
---@return any
function WaterPlane:getDynDataFieldbyName(...) end
---@param ... any
---@return any
function WaterPlane:getDynamicFields(...) end
---@param ... any
---@return any
function WaterPlane:getEulerRotation(...) end
---@param ... any
---@return any
function WaterPlane:getField(...) end
---@param ... any
---@return any
function WaterPlane:getFieldInfo(...) end
---@param ... any
---@return any
function WaterPlane:getFieldList(...) end
---@param ... any
---@return any
function WaterPlane:getFields(...) end
---@param ... any
---@return any
function WaterPlane:getFieldsForEditor(...) end
---@param ... any
---@return any
function WaterPlane:getFileName(...) end
---@param ... any
---@return any
function WaterPlane:getFirstMaterialName(...) end
---@param ... any
---@return any
function WaterPlane:getForwardVector(...) end
---@param ... any
---@return any
function WaterPlane:getGeneratedDisplayName(...) end
---@param ... any
---@return any
function WaterPlane:getGroup(...) end
---@param ... any
---@return any
function WaterPlane:getID(...) end
---@param ... any
---@return any
function WaterPlane:getId(...) end
---@param ... any
---@return any
function WaterPlane:getIdString(...) end
---@param ... any
---@return any
function WaterPlane:getInternalName(...) end
---@param ... any
---@return any
function WaterPlane:getMaterialNames(...) end
---@param ... any
---@return any
function WaterPlane:getMeshMaterialNames(...) end
---@param ... any
---@return any
function WaterPlane:getName(...) end
---@param ... any
---@return any
function WaterPlane:getObjBox(...) end
---@param ... any
---@return any
function WaterPlane:getObjectBox(...) end
---@param ... any
---@return any
function WaterPlane:getOrCreatePersistentID(...) end
---@param ... any
---@return any
function WaterPlane:getPosition(...) end
---@param ... any
---@return any
function WaterPlane:getPositionXYZ(...) end
---@param ... any
---@return any
function WaterPlane:getRotation(...) end
---@param ... any
---@return any
function WaterPlane:getScale(...) end
---@param ... any
---@return any
function WaterPlane:getStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function WaterPlane:getStaticDataFieldbyName(...) end
---@param ... any
---@return any
function WaterPlane:getTransform(...) end
---@param ... any
---@return any
function WaterPlane:getTransformF(...) end
---@param ... any
---@return any
function WaterPlane:getType(...) end
---@param ... any
---@return any
function WaterPlane:getWorldBox(...) end
---@param ... any
---@return any
function WaterPlane:getWorldBoxCenter(...) end
---@param ... any
---@return any
function WaterPlane:getWorldTransform(...) end
---@param ... any
---@return any
function WaterPlane:hideInRenderView(...) end
---@param ... any
---@return any
function WaterPlane:incRefCount(...) end
---@param ... any
---@return any
function WaterPlane:inheritParentFields(...) end
---@param ... any
---@return any
function WaterPlane:inspectUpdate(...) end
---@param ... any
---@return any
function WaterPlane:isChildOfGroup(...) end
---@param ... any
---@return any
function WaterPlane:isEditorDirty(...) end
---@param ... any
---@return any
function WaterPlane:isGlobalBounds(...) end
---@param ... any
---@return any
function WaterPlane:isHidden(...) end
---@param ... any
---@return any
function WaterPlane:isLocked(...) end
---@param ... any
---@return any
function WaterPlane:isNameChangeAllowed(...) end
---@param ... any
---@return any
function WaterPlane:isRenderEnabled(...) end
---@param ... any
---@return any
function WaterPlane:isSelected(...) end
---@param ... any
---@return any
function WaterPlane:isSelectionEnabled(...) end
---@param ... any
---@return any
function WaterPlane:isSubClassOf(...) end
---@param ... any
---@return any
function WaterPlane:onEditorDisable(...) end
---@param ... any
---@return any
function WaterPlane:onEditorEnable(...) end
---@param ... any
---@return any
function WaterPlane:postApply(...) end
---@param ... any
---@return any
function WaterPlane:preApply(...) end
---@param ... any
---@return any
function WaterPlane:registerObject(...) end
---@param ... any
---@return any
function WaterPlane:registerObjectWithIdSuffix(...) end
---@param ... any
---@return any
function WaterPlane:reloadTextures(...) end
---@param ... any
---@return any
function WaterPlane:renderViewMaskClear(...) end
---@param ... any
---@return any
function WaterPlane:save(...) end
---@param ... any
---@return any
function WaterPlane:serialize(...) end
---@param ... any
---@return any
function WaterPlane:serializeForEditor(...) end
---@param ... any
---@return any
function WaterPlane:serializeToDirectories(...) end
---@param ... any
---@return any
function WaterPlane:serializeToNameDictFile(...) end
---@param ... any
---@return any
function WaterPlane:setCanFloatAboveGround(...) end
---@param ... any
---@return any
function WaterPlane:setCanSave(...) end
---@param ... any
---@return any
function WaterPlane:setDeclarationLine(...) end
---@param ... any
---@return any
function WaterPlane:setDynDataFieldbyName(...) end
---@param ... any
---@return any
function WaterPlane:setEditorDirty(...) end
---@param ... any
---@return any
function WaterPlane:setEditorOnly(...) end
---@param ... any
---@return any
function WaterPlane:setField(...) end
---@param ... any
---@return any
function WaterPlane:setFileName(...) end
---@param ... any
---@return any
function WaterPlane:setHidden(...) end
---@param ... any
---@return any
function WaterPlane:setInternalName(...) end
---@param ... any
---@return any
function WaterPlane:setIsSelected(...) end
---@param ... any
---@return any
function WaterPlane:setLocked(...) end
---@param ... any
---@return any
function WaterPlane:setName(...) end
---@param ... any
---@return any
function WaterPlane:setNameChangeAllowed(...) end
---@param ... any
---@return any
function WaterPlane:setPosRot(...) end
---@param ... any
---@return any
function WaterPlane:setPosition(...) end
---@param ... any
---@return any
function WaterPlane:setPositionXYZ(...) end
---@param ... any
---@return any
function WaterPlane:setRenderEnabled(...) end
---@param ... any
---@return any
function WaterPlane:setScale(...) end
---@param ... any
---@return any
function WaterPlane:setScaleXYZ(...) end
---@param ... any
---@return any
function WaterPlane:setSelected(...) end
---@param ... any
---@return any
function WaterPlane:setSelectionEnabled(...) end
---@param ... any
---@return any
function WaterPlane:setStaticDataFieldbyIndex(...) end
---@param ... any
---@return any
function WaterPlane:setStaticDataFieldbyName(...) end
---@param ... any
---@return any
function WaterPlane:setTransform(...) end
---@param ... any
---@return any
function WaterPlane:setTransformF(...) end
---@param ... any
---@return any
function WaterPlane:showOnlyInRenderView(...) end
---@param ... any
---@return any
function WaterPlane:unhideInRenderView(...) end
---@param ... any
---@return any
function WaterPlane:unregisterObject(...) end

---@class AIPlayer_static
AIPlayer = {}

---@class ActionMap_static
---@operator call: ActionMap
ActionMap = {}
---@param ... any
---@return any
function ActionMap.addToFilter(...) end
---@param ... any
---@return any
function ActionMap.clearFilters(...) end
---@param ... any
---@return any
function ActionMap.enableBindingCapturing(...) end
---@param ... any
---@return any
function ActionMap.enableCustomModifier(...) end
---@param ... any
---@return any
function ActionMap.getActionUseCounts(...) end
---@param ... any
---@return any
function ActionMap.getInputCommands(...) end
---@param ... any
---@return any
function ActionMap.getList(...) end
---@param ... any
---@return any
function ActionMap.sendInputCommand(...) end
---@param ... any
---@return any
function ActionMap.triggerBindingByNameAnalogue(...) end
---@param ... any
---@return any
function ActionMap.triggerBindingByNameDigital(...) end

---@class ActionMapCommandContext_static
ActionMapCommandContext = {}

---@class AdvancedLightBinManager_static
AdvancedLightBinManager = {}

---@class AngAxisF_static
AngAxisF = {}
---@param ... any
---@return any
function AngAxisF.fromString(...) end

---@class ArrayObject_static
ArrayObject = {}

---@class AssimpAnimatedMesh_static
AssimpAnimatedMesh = {}

---@class BNGBase_FS_IFileSystem_static
---@operator call: BNGBase_FS_IFileSystem
BNGBase_FS_IFileSystem = {}

---@class BNGSceneTileCache_static
BNGSceneTileCache = {}
---@param ... any
---@return any
function BNGSceneTileCache.destroyInstance(...) end
---@param ... any
---@return any
function BNGSceneTileCache.getInstance(...) end

---@class BNGUIDataStreamManager_static
BNGUIDataStreamManager = {}
---@param ... any
---@return any
function BNGUIDataStreamManager.getDebugInfo(...) end
---@param ... any
---@return any
function BNGUIDataStreamManager.getStreamContent(...) end

---@class BNGWSClient_static
BNGWSClient = {}
---@param ... any
---@return any
function BNGWSClient.destroy(...) end
---@param ... any
---@return any
function BNGWSClient.getOrCreate(...) end

---@class BNGWebMgmt_static
BNGWebMgmt = {}
---@param ... any
---@return any
function BNGWebMgmt.getDebugEnabled(...) end
---@param ... any
---@return any
function BNGWebMgmt.setDebugEnabled(...) end

---@class BNGWebWSServer_static
BNGWebWSServer = {}
---@param ... any
---@return any
function BNGWebWSServer.destroy(...) end
---@param ... any
---@return any
function BNGWebWSServer.getNetworkAdapterAddresses(...) end
---@param ... any
---@return any
function BNGWebWSServer.getOrCreate(...) end
---@param ... any
---@return any
function BNGWebWSServer.isTLSAvailable(...) end
---@param ... any
---@return any
function BNGWebWSServer.listServers(...) end

---@class BaseMaterial_static
---@operator call: BaseMaterial
BaseMaterial = {}

---@class BasicClouds_static
BasicClouds = {}

---@class BeamEngine_static
---@operator call: BeamEngine
BeamEngine = {}

---@class BeamNGBooster_static
BeamNGBooster = {}

---@class BeamNGEnvTrigger_static
BeamNGEnvTrigger = {}

---@class BeamNGGameplayArea_static
---@operator call: BeamNGGameplayArea
BeamNGGameplayArea = {}

---@class BeamNGLight_static
BeamNGLight = {}

---@class BeamNGNodeGrabber_static
BeamNGNodeGrabber = {}

---@class BeamNGParking_static
BeamNGParking = {}

---@class BeamNGPointOfInterest_static
---@operator call: BeamNGPointOfInterest
BeamNGPointOfInterest = {}

---@class BeamNGSpecialPointlight_static
BeamNGSpecialPointlight = {}

---@class BeamNGSpecialSpotlight_static
BeamNGSpecialSpotlight = {}

---@class BeamNGTrigger_static
---@operator call: BeamNGTrigger
BeamNGTrigger = {}

---@class BeamNGVehicle_static
---@operator call: BeamNGVehicle
BeamNGVehicle = {}

---@class BeamNGWaypoint_static
---@operator call: BeamNGWaypoint
BeamNGWaypoint = {}

---@class BeamNGWorldIconsRenderer_static
---@operator call: BeamNGWorldIconsRenderer
BeamNGWorldIconsRenderer = {}

---@class Box3F_static
Box3F = {}

---@class Brush_static
Brush = {}

---@class CacheRenderState_static
CacheRenderState = {}

---@class Camera_static
---@operator call: Camera
Camera = {}

---@class CameraBookmark_static
---@operator call: CameraBookmark
CameraBookmark = {}

---@class CameraData_static
---@operator call: CameraData
CameraData = {}

---@class CefGui_static
---@operator call: CefGui
CefGui = {}

---@class CloudLayer_static
CloudLayer = {}
---@param ... any
---@return any
function CloudLayer.getWeatherOffsetKm(...) end
---@param ... any
---@return any
function CloudLayer.regenerateWeatherMap(...) end
---@param ... any
---@return any
function CloudLayer.setWeatherOffsetKm(...) end

---@class ColorF_static
ColorF = {}
---@param ... any
---@return any
function ColorF.fromString(...) end
---@param ... any
---@return any
function ColorF.fromTable(...) end

---@class ColorI_static
ColorI = {}
---@param ... any
---@return any
function ColorI.fromString(...) end
---@param ... any
---@return any
function ColorI.fromTable(...) end

---@class CompoundUndoAction_static
CompoundUndoAction = {}

---@class ConsoleBaseType_static
ConsoleBaseType = {}
---@param ... any
---@return any
function ConsoleBaseType.getListHead(...) end

---@class ConsoleLogger_static
ConsoleLogger = {}

---@class ConsoleObject_static
---@operator call: ConsoleObject
ConsoleObject = {}

---@class ConvexShape_static
ConvexShape = {}

---@class CubemapData_static
---@operator call: CubemapData
CubemapData = {}

---@class CustomMaterial_static
---@operator call: CustomMaterial
CustomMaterial = {}

---@class DebugDrawer_static
---@operator call: DebugDrawer
DebugDrawer = {}

---@class DecalData_static
---@operator call: DecalData
DecalData = {}

---@class DecalInstance_static
DecalInstance = {}

---@class DecalManager_static
DecalManager = {}

---@class DecalProjection_static
DecalProjection = {}

---@class DecalProjectionMaterialData_static
DecalProjectionMaterialData = {}

---@class DecalProjectionShape_static
DecalProjectionShape = {}

---@class DecalRoad_static
---@operator call: DecalRoad
DecalRoad = {}

---@class DecalShapeRenderApp_static
DecalShapeRenderApp = {}
---@param ... any
---@return any
function DecalShapeRenderApp.getActiveApp(...) end

---@class DeferredDecal_static
DeferredDecal = {}

---@class DynamicShapeBatch_static
DynamicShapeBatch = {}

---@class EditorGizmo_static
EditorGizmo = {}

---@class EditorGizmoProfile_static
EditorGizmoProfile = {}

---@class EditorToolBase_static
EditorToolBase = {}

---@class EditorViewportCtrl_static
EditorViewportCtrl = {}

---@class EngineReplayAdapter_static
EngineReplayAdapter = {}

---@class EventManager_static
---@operator call: EventManager
EventManager = {}

---@class FakeInteriorApp_static
FakeInteriorApp = {}
---@param ... any
---@return any
function FakeInteriorApp.getActiveApp(...) end

---@class FileObject_static
FileObject = {}

---@class FlowgraphSceneObject_static
FlowgraphSceneObject = {}

---@class FontRasterizer_static
FontRasterizer = {}
---@param ... any
---@return any
function FontRasterizer.createFontBitmap(...) end

---@class Forest_static
---@operator call: Forest
Forest = {}

---@class ForestBrush_static
ForestBrush = {}

---@class ForestBrushElement_static
ForestBrushElement = {}

---@class ForestBrushTool_static
ForestBrushTool = {}

---@class ForestData_static
ForestData = {}

---@class ForestEditorCtrl_static
ForestEditorCtrl = {}

---@class ForestItem_static
ForestItem = {}

---@class ForestItemData_static
---@operator call: ForestItemData
ForestItemData = {}

---@class ForestSelectionTool_static
ForestSelectionTool = {}

---@class ForestTool_static
ForestTool = {}

---@class ForestWindEmitter_static
ForestWindEmitter = {}

---@class Frustum_static
Frustum = {}
---@param ... any
---@return any
function Frustum.construct(...) end
---@param ... any
---@return any
function Frustum.constructOrtho(...) end

---@class GBitmap_static
GBitmap = {}

---@class GFXDevice_static
GFXDevice = {}
---@param ... any
---@return any
function GFXDevice.describeResources(...) end
---@param ... any
---@return any
function GFXDevice.devicePresent(...) end
---@param ... any
---@return any
function GFXDevice.getAllVideoModes(...) end
---@param ... any
---@return any
function GFXDevice.getDebug(...) end
---@param ... any
---@return any
function GFXDevice.getDesktopMode(...) end
---@param ... any
---@return any
function GFXDevice.getDisplayDesktopResolution(...) end
---@param ... any
---@return any
function GFXDevice.getDisplayRefreshRate(...) end
---@param ... any
---@return any
function GFXDevice.getDisplayRegion(...) end
---@param ... any
---@return any
function GFXDevice.getDisplayVideoModes(...) end
---@param ... any
---@return any
function GFXDevice.getVideoMemoryMB(...) end
---@param ... any
---@return any
function GFXDevice.getVideoMode(...) end
---@param ... any
---@return any
function GFXDevice.setDisplayDevice(...) end
---@param ... any
---@return any
function GFXDevice.setVideoMode(...) end

---@class GFXOcclusionQueryHandle_static
GFXOcclusionQueryHandle = {}

---@class GFXSamplerStateData_static
---@operator call: GFXSamplerStateData
GFXSamplerStateData = {}

---@class GFXStateBlockData_static
---@operator call: GFXStateBlockData
GFXStateBlockData = {}

---@class GameBase_static
---@operator call: GameBase
GameBase = {}

---@class GameBaseData_static
---@operator call: GameBaseData
GameBaseData = {}

---@class GameViewportCtrl_static
---@operator call: GameViewportCtrl
GameViewportCtrl = {}

---@class GroundCover_static
---@operator call: GroundCover
GroundCover = {}

---@class GroundPlane_static
GroundPlane = {}

---@class Gui3DMouseEvent_static
Gui3DMouseEvent = {}

---@class GuiCanvas_static
---@operator call: GuiCanvas
GuiCanvas = {}

---@class GuiContainer_static
---@operator call: GuiContainer
GuiContainer = {}

---@class GuiControl_static
---@operator call: GuiControl
GuiControl = {}

---@class GuiControlProfile_static
---@operator call: GuiControlProfile
GuiControlProfile = {}

---@class GuiCursor_static
---@operator call: GuiCursor
GuiCursor = {}

---@class GuiEditCtrl_static
GuiEditCtrl = {}

---@class GuiEditorRuler_static
GuiEditorRuler = {}

---@class GuiEvent_static
GuiEvent = {}

---@class GuiViewportCtrl_static
---@operator call: GuiViewportCtrl
GuiViewportCtrl = {}

---@class HtmlGui_static
HtmlGui = {}

---@class IconInfo_static
IconInfo = {}

---@class ImGuiInputTextCallbackData_static
ImGuiInputTextCallbackData = {}

---@class ImguiRenderViewControl_static
ImguiRenderViewControl = {}
---@param ... any
---@return any
function ImguiRenderViewControl.destroy(...) end
---@param ... any
---@return any
function ImguiRenderViewControl.getOrCreate(...) end

---@class LevelInfo_static
LevelInfo = {}

---@class LevelLogItem_static
LevelLogItem = {}

---@class LightAnimData_static
---@operator call: LightAnimData
LightAnimData = {}

---@class LightBase_static
---@operator call: LightBase
LightBase = {}

---@class LightDescription_static
LightDescription = {}

---@class LightFlareData_static
---@operator call: LightFlareData
LightFlareData = {}

---@class LightManager_static
LightManager = {}
---@param ... any
---@return any
function LightManager.findByName(...) end

---@class LightShadowMap_static
LightShadowMap = {}

---@class LoadingManagerClass_static
---@operator call: LoadingManagerClass
LoadingManagerClass = {}

---@class LoadingScreenScopedCallbackContext_static
LoadingScreenScopedCallbackContext = {}

---@class LocalTonemapCache_static
LocalTonemapCache = {}

---@class LogSink_static
LogSink = {}

---@class Marker_static
Marker = {}

---@class Material_static
---@operator call: Material
Material = {}

---@class MaterialManager_static
MaterialManager = {}
---@param ... any
---@return any
function MaterialManager.reInitMaterials(...) end

---@class MatrixF_static
MatrixF = {}

---@class MeshRoad_static
MeshRoad = {}

---@class Message_static
Message = {}

---@class MessageForwarder_static
MessageForwarder = {}

---@class MirrorData_static
MirrorData = {}

---@class MissionMarker_static
---@operator call: MissionMarker
MissionMarker = {}

---@class MissionMarkerData_static
---@operator call: MissionMarkerData
MissionMarkerData = {}

---@class NewWorldEditor_static
NewWorldEditor = {}

---@class OcclusionVolume_static
OcclusionVolume = {}

---@class OnlineServiceProvider_static
OnlineServiceProvider = {}
---@param ... any
---@return any
function OnlineServiceProvider.advanceAchievement(...) end
---@param ... any
---@return any
function OnlineServiceProvider.clearAchievement(...) end
---@param ... any
---@return any
function OnlineServiceProvider.clearRichPresence(...) end
---@param ... any
---@return any
function OnlineServiceProvider.getAccountId(...) end
---@param ... any
---@return any
function OnlineServiceProvider.getAccountIdPrefix(...) end
---@param ... any
---@return any
function OnlineServiceProvider.getAuthTicketStatus(...) end
---@param ... any
---@return any
function OnlineServiceProvider.getBranch(...) end
---@param ... any
---@return any
function OnlineServiceProvider.getConnectionId(...) end
---@param ... any
---@return any
function OnlineServiceProvider.getFriendsList(...) end
---@param ... any
---@return any
function OnlineServiceProvider.getLanguage(...) end
---@param ... any
---@return any
function OnlineServiceProvider.getLoggedInStatus(...) end
---@param ... any
---@return any
function OnlineServiceProvider.getPlayerName(...) end
---@param ... any
---@return any
function OnlineServiceProvider.getStat(...) end
---@param ... any
---@return any
function OnlineServiceProvider.getStatFloat(...) end
---@param ... any
---@return any
function OnlineServiceProvider.getStatInt(...) end
---@param ... any
---@return any
function OnlineServiceProvider.isAchievementUnlocked(...) end
---@param ... any
---@return any
function OnlineServiceProvider.isInUse(...) end
---@param ... any
---@return any
function OnlineServiceProvider.isReady(...) end
---@param ... any
---@return any
function OnlineServiceProvider.providerToString(...) end
---@param ... any
---@return any
function OnlineServiceProvider.setRichPresence(...) end
---@param ... any
---@return any
function OnlineServiceProvider.setStat(...) end
---@param ... any
---@return any
function OnlineServiceProvider.setStatFloat(...) end
---@param ... any
---@return any
function OnlineServiceProvider.setStatInt(...) end
---@param ... any
---@return any
function OnlineServiceProvider.showFloatingGamepadTextInput(...) end
---@param ... any
---@return any
function OnlineServiceProvider.triggerScreenshot(...) end
---@param ... any
---@return any
function OnlineServiceProvider.unlockAchievement(...) end

---@class OrientedBox3F_static
OrientedBox3F = {}

---@class PSSMLightShadowMap_static
PSSMLightShadowMap = {}

---@class ParticleData_static
---@operator call: ParticleData
ParticleData = {}

---@class ParticleEmitter_static
ParticleEmitter = {}

---@class ParticleEmitterData_static
---@operator call: ParticleEmitterData
ParticleEmitterData = {}

---@class ParticleEmitterNode_static
---@operator call: ParticleEmitterNode
ParticleEmitterNode = {}

---@class ParticleEmitterNodeData_static
---@operator call: ParticleEmitterNodeData
ParticleEmitterNodeData = {}

---@class PersistenceManager_static
PersistenceManager = {}

---@class PhysicsFlexMesh_static
PhysicsFlexMesh = {}

---@class PhysicsPlugin_static
PhysicsPlugin = {}
---@param ... any
---@return any
function PhysicsPlugin.destroy(...) end
---@param ... any
---@return any
function PhysicsPlugin.init(...) end

---@class PhysicsProp_static
PhysicsProp = {}

---@class Planet_static
Planet = {}

---@class Player_static
Player = {}

---@class PlayerData_static
---@operator call: PlayerData
PlayerData = {}

---@class Point2F_static
Point2F = {}
---@param ... any
---@return any
function Point2F.fromString(...) end
---@param ... any
---@return any
function Point2F.fromTable(...) end

---@class Point2I_static
Point2I = {}
---@param ... any
---@return any
function Point2I.fromString(...) end
---@param ... any
---@return any
function Point2I.fromTable(...) end

---@class Point3D_static
Point3D = {}
---@param ... any
---@return any
function Point3D.fromTable(...) end

---@class Point4F_static
Point4F = {}
---@param ... any
---@return any
function Point4F.fromString(...) end
---@param ... any
---@return any
function Point4F.fromTable(...) end

---@class PointLight_static
---@operator call: PointLight
PointLight = {}

---@class Portal_static
Portal = {}

---@class PostEffect_static
---@operator call: PostEffect
PostEffect = {}

---@class PostEffectBase_static
---@operator call: PostEffectBase
PostEffectBase = {}

---@class PostEffectBloomClass_static
---@operator call: PostEffectBloomClass
PostEffectBloomClass = {}

---@class PostEffectBloomGaussianBlur_static
PostEffectBloomGaussianBlur = {}

---@class PostEffectBrightPass_static
---@operator call: PostEffectBrightPass
PostEffectBrightPass = {}

---@class PostEffectCombinePass_static
---@operator call: PostEffectCombinePass
PostEffectCombinePass = {}

---@class PostEffectDebug_static
PostEffectDebug = {}

---@class PostEffectDownSampleLuminance_static
PostEffectDownSampleLuminance = {}

---@class PostEffectDownScale_static
---@operator call: PostEffectDownScale
PostEffectDownScale = {}

---@class PostEffectFinalLuminance_static
PostEffectFinalLuminance = {}

---@class PostEffectGaussianBlur_static
PostEffectGaussianBlur = {}

---@class PostEffectLocalExposure_static
---@operator call: PostEffectLocalExposure
PostEffectLocalExposure = {}

---@class PostEffectLuminance_static
---@operator call: PostEffectLuminance
PostEffectLuminance = {}

---@class PostEffectMaskedBlur_static
---@operator call: PostEffectMaskedBlur
PostEffectMaskedBlur = {}

---@class PostEffectMotionBlur_static
---@operator call: PostEffectMotionBlur
PostEffectMotionBlur = {}

---@class PostEffectSSAO_static
---@operator call: PostEffectSSAO
PostEffectSSAO = {}

---@class PostEffectSampleLuminanceInitial_static
PostEffectSampleLuminanceInitial = {}

---@class PostFxSMAAT2xResolve_static
---@operator call: PostFxSMAAT2xResolve
PostFxSMAAT2xResolve = {}

---@class PostFxSSSR_static
---@operator call: PostFxSSSR
PostFxSSSR = {}
---@param ... any
---@return any
function PostFxSSSR.isSupported(...) end

---@class PostFxScreenSpaceShadows_static
---@operator call: PostFxScreenSpaceShadows
PostFxScreenSpaceShadows = {}

---@class PostFxTAA_static
PostFxTAA = {}

---@class Precipitation_static
Precipitation = {}

---@class PrecipitationData_static
---@operator call: PrecipitationData
PrecipitationData = {}

---@class Prefab_static
---@operator call: Prefab
Prefab = {}
---@param ... any
---@return any
function Prefab.getPrefabByChild(...) end
---@param ... any
---@return any
function Prefab.isValidChild(...) end

---@class PrefabInstance_static
PrefabInstance = {}

---@class PrefabV2_static
PrefabV2 = {}
---@param ... any
---@return any
function PrefabV2.dumpStats(...) end

---@class ProceduralMesh_static
ProceduralMesh = {}

---@class QuatF_static
QuatF = {}
---@param ... any
---@return any
function QuatF.fromTable(...) end

---@class RectI_static
RectI = {}
---@param ... any
---@return any
function RectI.fromString(...) end

---@class ReflectorDesc_static
---@operator call: ReflectorDesc
ReflectorDesc = {}

---@class RenderAnnotationBinManager_static
RenderAnnotationBinManager = {}

---@class RenderBinManager_static
RenderBinManager = {}

---@class RenderBinSeconday_static
RenderBinSeconday = {}

---@class RenderEditorMgr_static
RenderEditorMgr = {}

---@class RenderExamplePostEffectDesaturate_static
RenderExamplePostEffectDesaturate = {}

---@class RenderFastMgr_static
RenderFastMgr = {}

---@class RenderFormatToken_static
---@operator call: RenderFormatToken
RenderFormatToken = {}

---@class RenderGlowMgr_static
RenderGlowMgr = {}

---@class RenderImposterMgr_static
RenderImposterMgr = {}

---@class RenderObjectMgr_static
RenderObjectMgr = {}

---@class RenderOcclusionMgr_static
RenderOcclusionMgr = {}

---@class RenderParticleMgr_static
RenderParticleMgr = {}

---@class RenderPassManager_static
---@operator call: RenderPassManager
RenderPassManager = {}

---@class RenderPassPipeline_static
RenderPassPipeline = {}

---@class RenderPassStateBin_static
RenderPassStateBin = {}

---@class RenderPassStateToken_static
---@operator call: RenderPassStateToken
RenderPassStateToken = {}

---@class RenderPassfunctionBin_static
RenderPassfunctionBin = {}

---@class RenderPrePassMgr_static
RenderPrePassMgr = {}

---@class RenderSettings_static
RenderSettings = {}
---@param ... any
---@return any
function RenderSettings.getGlobals(...) end

---@class RenderTerrainMgr_static
RenderTerrainMgr = {}

---@class RenderTexTargetBinManager_static
RenderTexTargetBinManager = {}

---@class RenderTranslucentMgr_static
RenderTranslucentMgr = {}

---@class RenderUpscaleOverlayToken_static
---@operator call: RenderUpscaleOverlayToken
RenderUpscaleOverlayToken = {}

---@class RenderUpscaleToken_static
---@operator call: RenderUpscaleToken
RenderUpscaleToken = {}

---@class RenderVehicleVelocityMotionBlurMgr_static
RenderVehicleVelocityMotionBlurMgr = {}

---@class RenderVelocityPassMgr_static
RenderVelocityPassMgr = {}

---@class RenderView_static
RenderView = {}
---@param ... any
---@return any
function RenderView.isUpscaleModeAvailable(...) end
---@param ... any
---@return any
function RenderView.isUpscaleSharpeningSupported(...) end

---@class RenderViewManager_static
---@operator call: RenderViewManager
RenderViewManager = {}

---@class ReplayFileStream_static
ReplayFileStream = {}

---@class River_static
---@operator call: River
River = {}

---@class RopeVisual_static
RopeVisual = {}

---@class SDFGenerator2D_static
SDFGenerator2D = {}

---@class SDFGeneratorApp_static
SDFGeneratorApp = {}
---@param ... any
---@return any
function SDFGeneratorApp.getActiveApp(...) end

---@class SFXAmbience_static
---@operator call: SFXAmbience
SFXAmbience = {}

---@class SFXDescription_static
---@operator call: SFXDescription
SFXDescription = {}

---@class SFXEmitter_static
---@operator call: SFXEmitter
SFXEmitter = {}

---@class SFXEnvironment_static
SFXEnvironment = {}

---@class SFXFMODEventDesc_static
SFXFMODEventDesc = {}

---@class SFXFMODEventDescImpl_static
SFXFMODEventDescImpl = {}

---@class SFXFMODEventDescOverride_static
SFXFMODEventDescOverride = {}

---@class SFXFMODEventSource_static
SFXFMODEventSource = {}

---@class SFXFMODProject_static
---@operator call: SFXFMODProject
SFXFMODProject = {}
---@param ... any
---@return any
function SFXFMODProject.hotloadingCompleted(...) end
---@param ... any
---@return any
function SFXFMODProject.hotloadingTriggered(...) end

---@class SFXParameter_static
SFXParameter = {}

---@class SFXParameterGroup_static
SFXParameterGroup = {}

---@class SFXProfile_static
---@operator call: SFXProfile
SFXProfile = {}

---@class SFXSceneBlendLayer2D_static
SFXSceneBlendLayer2D = {}

---@class SFXSound_static
SFXSound = {}

---@class SFXSource_static
---@operator call: SFXSource
SFXSource = {}

---@class SFXSourceChannel_static
---@operator call: SFXSourceChannel
SFXSourceChannel = {}

---@class SFXSourcesIter_static
SFXSourcesIter = {}

---@class SFXSpace_static
---@operator call: SFXSpace
SFXSpace = {}

---@class SFXTrack_static
---@operator call: SFXTrack
SFXTrack = {}

---@class ScatterSky_static
ScatterSky = {}

---@class SceneCullingState_static
SceneCullingState = {}

---@class SceneManager_static
SceneManager = {}

---@class SceneObject_static
---@operator call: SceneObject
SceneObject = {}

---@class SceneStaticManagerRender_static
SceneStaticManagerRender = {}

---@class ScopeAlwaysShape_static
ScopeAlwaysShape = {}

---@class ScriptMsgListener_static
ScriptMsgListener = {}

---@class ScriptObject_static
ScriptObject = {}

---@class Selection_static
Selection = {}

---@class Settings_static
---@operator call: Settings
Settings = {}

---@class ShaderData_static
---@operator call: ShaderData
ShaderData = {}

---@class ShadowMapManager_static
ShadowMapManager = {}
---@param ... any
---@return any
function ShadowMapManager.updateShadowDisable(...) end

---@class ShadowMapPass_static
ShadowMapPass = {}

---@class ShapeBase_static
---@operator call: ShapeBase
ShapeBase = {}

---@class ShapeBaseData_static
---@operator call: ShapeBaseData
ShapeBaseData = {}

---@class ShapePreview_static
ShapePreview = {}

---@class SimDataBlock_static
---@operator call: SimDataBlock
SimDataBlock = {}

---@class SimGroup_static
---@operator call: SimGroup
SimGroup = {}

---@class SimObject_static
---@operator call: SimObject
SimObject = {}
---@param ... any
---@return any
function SimObject.getDefaultAddGroup(...) end
---@param ... any
---@return any
function SimObject.isNameValid(...) end
---@param ... any
---@return any
function SimObject.setDefaultAddGroup(...) end
---@param ... any
---@return any
function SimObject.setForcedId(...) end
---@param ... any
---@return any
function SimObject.setSerializeForEditor(...) end

---@class SimPath_static
SimPath = {}

---@class SimPersistSet_static
SimPersistSet = {}

---@class SimResponseCurve_static
SimResponseCurve = {}

---@class SimSet_static
---@operator call: SimSet
SimSet = {}

---@class SimXMLDocument_static
SimXMLDocument = {}

---@class SkyBox_static
SkyBox = {}

---@class SpawnSphere_static
---@operator call: SpawnSphere
SpawnSphere = {}

---@class SpotLight_static
---@operator call: SpotLight
SpotLight = {}

---@class StaticShape_static
StaticShape = {}

---@class StaticShapeData_static
StaticShapeData = {}

---@class Steam_static
Steam = {}
---@param ... any
---@return any
function Steam.advanceAchievement(...) end
---@param ... any
---@return any
function Steam.clearAchievement(...) end
---@param ... any
---@return any
function Steam.clearRichPresence(...) end
---@param ... any
---@return any
function Steam.getFriendsList(...) end
---@param ... any
---@return any
function Steam.getStat(...) end
---@param ... any
---@return any
function Steam.getStatFloat(...) end
---@param ... any
---@return any
function Steam.getStatInt(...) end
---@param ... any
---@return any
function Steam.isAchievementUnlocked(...) end
---@param ... any
---@return any
function Steam.setRichPresence(...) end
---@param ... any
---@return any
function Steam.setStat(...) end
---@param ... any
---@return any
function Steam.setStatFloat(...) end
---@param ... any
---@return any
function Steam.setStatInt(...) end
---@param ... any
---@return any
function Steam.showFloatingGamepadTextInput(...) end
---@param ... any
---@return any
function Steam.timelineAddEvent(...) end
---@param ... any
---@return any
function Steam.timelineClearStateDescription(...) end
---@param ... any
---@return any
function Steam.timelineSetGameMode(...) end
---@param ... any
---@return any
function Steam.timelineSetStateDescription(...) end
---@param ... any
---@return any
function Steam.triggerScreenshot(...) end
---@param ... any
---@return any
function Steam.unlockAchievement(...) end

---@class Sun_static
Sun = {}

---@class TSShapeConstructor_static
---@operator call: TSShapeConstructor
TSShapeConstructor = {}

---@class TSStatic_static
---@operator call: TSStatic
TSStatic = {}

---@class TerrainAction_static
TerrainAction = {}

---@class TerrainBlock_static
TerrainBlock = {}

---@class TerrainEditor_static
TerrainEditor = {}

---@class TerrainMaterial_static
---@operator call: TerrainMaterial
TerrainMaterial = {}
---@param ... any
---@return any
function TerrainMaterial.findOrCreate(...) end
---@param ... any
---@return any
function TerrainMaterial.getWarningMaterial(...) end

---@class TerrainMaterialTextureSet_static
---@operator call: TerrainMaterialTextureSet
TerrainMaterialTextureSet = {}

---@class TerrainSmoothAction_static
TerrainSmoothAction = {}

---@class TextureDrawPrimitive_static
TextureDrawPrimitive = {}

---@class TheoraTextureObject_static
TheoraTextureObject = {}

---@class TimeOfDay_static
TimeOfDay = {}

---@class UndoAction_static
UndoAction = {}

---@class UndoManager_static
UndoManager = {}

---@class UndoScriptAction_static
UndoScriptAction = {}

---@class VehicleTrigger_static
VehicleTrigger = {}

---@class VirtualInputManager_static
VirtualInputManager = {}

---@class WaterBlock_static
---@operator call: WaterBlock
WaterBlock = {}

---@class WaterObject_static
---@operator call: WaterObject
WaterObject = {}

---@class WaterPlane_static
---@operator call: WaterPlane
WaterPlane = {}

---@class WayPoint_static
WayPoint = {}

---@class WorldBillboardRenderer_static
WorldBillboardRenderer = {}

---@class ZipArchive_static
ZipArchive = {}

---@class Zone_static
Zone = {}

---@class ground_model_static
ground_model = {}

---@class hptimer_static
hptimer = {}

---@class loadingContext_static
loadingContext = {}

---@class timer_static
timer = {}

---@type Settings
CppSettings = nil

---@type BNGBase_FS_IFileSystem
FS = nil

---@type LoadingManagerClass
LoadingManager = nil

---@type Lua
Lua = nil

---@type PlatformSwitches
PlatformSwitches = nil

---@type RenderViewManager
RenderViewManagerInstance = nil

---@type SurfaceMaskClipmap
SurfaceMaskClipmap = nil

---@type TextureDrawPrimitiveRegistry
TextureDrawPrimitiveRegistry = nil

---@type BeamEngine
be = nil

---@type DebugDrawer
debugDrawer = nil

