---@meta
-- tim19Atlas stub generated from lua/common/filters.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fixed-step exponential average.
---@class filters_exponentialSmoothing
local filters_exponentialSmoothing = {}

--- One smoothing step toward sample with the constructor's coefficient.
---Source: lua/common/filters.lua:513
---@param sample number sample
---@return number  filtered value
function filters_exponentialSmoothing:get(sample) end

--- One step with a window (in samples, min 2) provided in the call.
---Source: lua/common/filters.lua:520
---@param sample number sample
---@param window number window in samples
---@return number  filtered value
function filters_exponentialSmoothing:getWindow(sample, window) end

--- Resets the state to value, or to the start value.
---Source: lua/common/filters.lua:535
---@param value number|nil reset value
function filters_exponentialSmoothing:reset(value) end

--- Forces the value.
---Source: lua/common/filters.lua:531
---@param value number value
function filters_exponentialSmoothing:set(value) end

--- Current value.
---Source: lua/common/filters.lua:527
---@return number  state
function filters_exponentialSmoothing:value() end

--- Exponential average with trend compensation.
---@class filters_exponentialSmoothingT
local filters_exponentialSmoothingT = {}

--- One smoothing step (constructor windows).
---Source: lua/common/filters.lua:549
---@param sample number sample
---@return number  filtered value
function filters_exponentialSmoothingT:get(sample) end

--- One step with windows provided in the call.
---Source: lua/common/filters.lua:567
---@param sample number sample
---@param window number main window
---@param window2 number|nil trend window, default infinite
---@return number  filtered value
function filters_exponentialSmoothingT:getWindow(sample, window, window2) end

--- Resets the state to value (or start value) and clears the trend.
---Source: lua/common/filters.lua:593
---@param value number|nil reset value
function filters_exponentialSmoothingT:reset(value) end

--- Forces the value (does not clear the trend).
---Source: lua/common/filters.lua:589
---@param value number value
function filters_exponentialSmoothingT:set(value) end

--- Current value.
---Source: lua/common/filters.lua:585
---@return number  state
function filters_exponentialSmoothingT:value() end

--- Estimates the period, amplitude and DC bias of an oscillating signal by tracking peaks and troughs.
---@class filters_freqDetector
local filters_freqDetector = {}

--- Updates with a sample. Returns period, peak amplitude, time since the previous peak (prevPeakDt) and DC bias. The approximated signal is cos(peakDt*2*pi/(period+1e-30))*ampl + bias.
---Source: lua/common/filters.lua:101
---@param sample number sample
---@param dt number time step (s)
---@return number  period (s)
---@return number  peak amplitude
---@return number  prevPeakDt
---@return number  DC bias
function filters_freqDetector:get(sample, dt) end

--- Resets peaks, troughs, period, amplitude and bias to zero.
---Source: lua/common/filters.lua:141
function filters_freqDetector:reset() end

--- Returns the latest estimate (period, amplitude, prevPeakDt, bias) while advancing the timers by dt (0 by default).
---Source: lua/common/filters.lua:146
---@param dt number|nil time elapsed since the last get, default 0
---@return number  period
---@return number  amplitude
---@return number  prevPeakDt
---@return number  bias
function filters_freqDetector:value(dt) end

--- Measures the amplitude of a specific frequency in a signal (Goertzel algorithm).
---@class filters_freqExists
local filters_freqExists = {}

--- Adds a sample to the current batch.
---Source: lua/common/filters.lua:192
---@param sample number sample
function filters_freqExists:bufferAdd(sample) end

--- Ends the batch and returns the amplitude of the frequency.
---Source: lua/common/filters.lua:198
---@return number  amplitude
function filters_freqExists:bufferEnd() end

--- Starts batch processing (buffer) for frequency freq at step dt. Follow with bufferAdd for each sample then bufferEnd.
---Source: lua/common/filters.lua:188
---@param dt number time step (s)
---@param freq number target frequency (Hz)
function filters_freqExists:bufferStart(dt, freq) end

--- Cycle mode: accumulates samples and, every cycleCount cycles of freq, updates and returns the amplitude (otherwise returns the last amplitude). More cycles = more accurate but more latency.
---Source: lua/common/filters.lua:163
---@param sample number sample
---@param dt number time step (s)
---@param freq number target frequency (Hz)
---@param cycleCount number|nil number of cycles per measurement, default 1
---@return number  amplitude of freq
function filters_freqExists:get(sample, dt, freq, cycleCount) end

--- Per-sample sliding mode: returns the amplitude on each call; returns 0 if freq*dt >= 0.5 (beyond Nyquist). Larger winCoef = more accurate but slower.
---Source: lua/common/filters.lua:177
---@param sample number sample
---@param dt number time step (s)
---@param freq number target frequency (Hz)
---@param winCoef number|nil window coefficient, default 10
---@return number  amplitude
function filters_freqExists:getS(sample, dt, freq, winCoef) end

--- Resets the state to zero.
---Source: lua/common/filters.lua:204
function filters_freqExists:reset() end

--- First-order filter (state: state, state2, x). All methods take (sample, dt, ...) and return the filtered value. Mix only one type of filter per object (shared states).
---@class filters_freqFilter1
local filters_freqFilter1 = {}

--- Band-pass (high-pass at lowFreq then low-pass at highFreq).
---Source: lua/common/filters.lua:53
---@param sample number sample
---@param dt number time step (s)
---@param lowFreq number low frequency (Hz)
---@param highFreq number high frequency (Hz)
---@return number  filtered output
function filters_freqFilter1:getBandPassFreq(sample, dt, lowFreq, highFreq) end

--- Band-pass with periods.
---Source: lua/common/filters.lua:62
---@param sample number sample
---@param dt number time step (s)
---@param lowPeriod number low period
---@param highPeriod number high period
---@return number  filtered output
function filters_freqFilter1:getBandPassPeriod(sample, dt, lowPeriod, highPeriod) end

--- Band-stop (sum of a high-pass at highFreq and a low-pass at lowFreq).
---Source: lua/common/filters.lua:70
---@param sample number sample
---@param dt number time step (s)
---@param lowFreq number low frequency (Hz)
---@param highFreq number high frequency (Hz)
---@return number  filtered output
function filters_freqFilter1:getBandStopFreq(sample, dt, lowFreq, highFreq) end

--- Band-stop with periods.
---Source: lua/common/filters.lua:79
---@param sample number sample
---@param dt number time step (s)
---@param lowPeriod number low period
---@param highPeriod number high period
---@return number  filtered output
function filters_freqFilter1:getBandStopPeriod(sample, dt, lowPeriod, highPeriod) end

--- High-pass, cutoff in Hz.
---Source: lua/common/filters.lua:41
---@param sample number sample
---@param dt number time step (s)
---@param cutOffFreq number cutoff frequency (Hz)
---@return number  filtered output
function filters_freqFilter1:getHighPassFreq(sample, dt, cutOffFreq) end

--- High-pass, cutoff as a period.
---Source: lua/common/filters.lua:47
---@param sample number sample
---@param dt number time step (s)
---@param cutOffPeriod number cutoff period (s)
---@return number  filtered output
function filters_freqFilter1:getHighPassPeriod(sample, dt, cutOffPeriod) end

--- Low-pass, cutoff in Hz.
---Source: lua/common/filters.lua:27
---@param sample number sample
---@param dt number time step (s)
---@param cutOffFreq number cutoff frequency (Hz)
---@return number  filtered output
function filters_freqFilter1:getLowPassFreq(sample, dt, cutOffFreq) end

--- Low-pass, cutoff given by a period (time constant 2*pi*... see code: pdt = 2*pi*dt, filter pdt/(pdt+period)).
---Source: lua/common/filters.lua:34
---@param sample number sample
---@param dt number time step (s)
---@param cutOffPeriod number cutoff period (s)
---@return number  filtered output
function filters_freqFilter1:getLowPassPeriod(sample, dt, cutOffPeriod) end

--- Exponentially weighted recursive linear regression. Public fields: weight, bias, plus bounds weightMin/Max and biasMin/Max.
---@class filters_lineFitting
local filters_lineFitting = {}

--- Update with a time step (window in seconds). Returns the slope and intercept.
---Source: lua/common/filters.lua:645
---@param x number input x
---@param y number output y
---@param dt number time step (s)
---@return number  weight
---@return number  bias
function filters_lineFitting:get(x, y, dt) end

--- Per-sample update (window in samples). Returns the estimated slope and intercept.
---Source: lua/common/filters.lua:621
---@param x number input x
---@param y number output y
---@return number  weight (slope)
---@return number  bias (intercept)
function filters_lineFitting:getS(x, y) end

--- Estimated x for y (inverse of the line, guards against a zero slope).
---Source: lua/common/filters.lua:678
---@param y number y
---@return number  x
function filters_lineFitting:getX(y) end

--- Estimated y for x: weight*x + bias.
---Source: lua/common/filters.lua:674
---@param x number x
---@return number  y
function filters_lineFitting:getY(x) end

--- Resets slope, intercept and covariance matrix to the initial state.
---Source: lua/common/filters.lua:688
function filters_lineFitting:reset() end

--- Changes window (decay), slope, intercept and bounds (nil arguments keep the current value).
---Source: lua/common/filters.lua:682
---@param window number|nil new window (samples)
---@param weight number|nil slope
---@param bias number|nil intercept
---@param weightMin number|nil slope lower bound
---@param weightMax number|nil slope upper bound
---@param biasMin number|nil intercept lower bound
---@param biasMax number|nil intercept upper bound
function filters_lineFitting:set(window, weight, bias, weightMin, weightMax, biasMin, biasMax) end

--- Current slope and intercept.
---Source: lua/common/filters.lua:670
---@return number  weight
---@return number  bias
function filters_lineFitting:value() end

--- Linear smoothing with a fixed time step given to the constructor.
---@class filters_linearSmoothing
local filters_linearSmoothing = {}

--- Advances one step toward sample (no dt argument).
---Source: lua/common/filters.lua:469
---@param sample number setpoint
---@return number  filtered value
function filters_linearSmoothing:get(sample) end

--- Resets the state to 0.
---Source: lua/common/filters.lua:481
function filters_linearSmoothing:reset() end

--- Forces the value.
---Source: lua/common/filters.lua:477
---@param v number value
function filters_linearSmoothing:set(v) end

--- Bypass filter (no smoothing).
---@class filters_nopSmoothing
local filters_nopSmoothing = {}

--- Returns sample as is.
---Source: lua/common/filters.lua:493
---@param sample number value
---@return number  sample
function filters_nopSmoothing:get(sample) end

--- Does nothing.
---Source: lua/common/filters.lua:500
function filters_nopSmoothing:reset() end

--- Does nothing.
---Source: lua/common/filters.lua:497
function filters_nopSmoothing:set() end

--- S-curve smoothing with speed (rate) and acceleration limiting.
---@class filters_temporalSigmoidSmoothing
local filters_temporalSigmoidSmoothing = {}

--- Advances one step toward sample. The max speed is that of the constructor (inRate / outRate depending on whether the value moves away from 0).
---Source: lua/common/filters.lua:251
---@param sample number setpoint
---@param dt number time step (s)
---@return number  filtered value
function filters_temporalSigmoidSmoothing:get(sample, dt) end

--- Like get with the given max speed and accelerations (stopAccel default startAccel).
---Source: lua/common/filters.lua:273
---@param sample number setpoint
---@param dt number time step (s)
---@param ratelimit number max speed
---@param startAccel number start acceleration
---@param stopAccel number|nil arrival deceleration
---@return number  filtered value
function filters_temporalSigmoidSmoothing:getWithRateAccel(sample, dt, ratelimit, startAccel, stopAccel) end

--- Resets state and velocity to 0 (not to the constructor's initial value).
---Source: lua/common/filters.lua:298
function filters_temporalSigmoidSmoothing:reset() end

--- Forces the value and cancels the velocity.
---Source: lua/common/filters.lua:293
---@param sample number value
function filters_temporalSigmoidSmoothing:set(sample) end

--- Current value.
---Source: lua/common/filters.lua:303
---@return number  state
function filters_temporalSigmoidSmoothing:value() end

--- Time-dependent linear smoothing (bounded speed). Aliases: getUncapped = get, getWithRateUncapped = getWithRate.
---@class filters_temporalSmoothing
local filters_temporalSmoothing = {}

--- Advances one step toward sample at speed (units/s) inRate/outRate; never overshoots the setpoint.
---Source: lua/common/filters.lua:418
---@param sample number setpoint
---@param dt number time step (s)
---@return number  filtered value
function filters_temporalSmoothing:get(sample, dt) end

--- getUncapped then bounds the output to [-1, 1].
---Source: lua/common/filters.lua:426
---@param sample number setpoint
---@param dt number time step (s)
---@return number  value in [-1,1]
function filters_temporalSmoothing:getCapped(sample, dt) end

--- Like get but with auto-centering: if sample == 0 the speed is autoCenterRate. Becomes getUncapped when autoCenterRate ~= inRate.
---Source: lua/common/filters.lua:403
---@param sample number setpoint
---@param dt number time step (s)
---@return number  filtered value
function filters_temporalSmoothing:getUncappedAutoCenter(sample, dt) end

--- Like get with a given speed.
---Source: lua/common/filters.lua:430
---@param sample number setpoint
---@param dt number time step (s)
---@param rate number speed (units/s)
---@return number  filtered value
function filters_temporalSmoothing:getWithRate(sample, dt, rate) end

--- getWithRate bounded to [-1, 1].
---Source: lua/common/filters.lua:438
---@param sample number setpoint
---@param dt number time step (s)
---@param rate number speed (units/s)
---@return number  value in [-1,1]
function filters_temporalSmoothing:getWithRateCapped(sample, dt, rate) end

--- Resets the state to the constructor's startingValue.
---Source: lua/common/filters.lua:445
function filters_temporalSmoothing:reset() end

--- Forces the value.
---Source: lua/common/filters.lua:453
---@param v number value
function filters_temporalSmoothing:set(v) end

--- Current value.
---Source: lua/common/filters.lua:449
---@return number  state
function filters_temporalSmoothing:value() end

--- Exponential smoothing with a linear minimum speed.
---@class filters_temporalSmoothingHybrid
local filters_temporalSmoothingHybrid = {}

--- Advances one step toward sample (rate chosen according to direction, see notes).
---Source: lua/common/filters.lua:317
---@param sample number setpoint
---@param dt number time step (s)
---@return number  filtered value
function filters_temporalSmoothingHybrid:get(sample, dt) end

--- Like get with the given rate and linear speed.
---Source: lua/common/filters.lua:326
---@param sample number setpoint
---@param dt number time step (s)
---@param rate number exponential rate (1/s)
---@param linearRate number|nil minimum speed, default 0
---@return number  filtered value
function filters_temporalSmoothingHybrid:getWithRate(sample, dt, rate, linearRate) end

--- Sets the state to 0 (not to startingValue).
---Source: lua/common/filters.lua:343
function filters_temporalSmoothingHybrid:reset() end

--- Forces the value.
---Source: lua/common/filters.lua:335
---@param sample number value
function filters_temporalSmoothingHybrid:set(sample) end

--- Current value.
---Source: lua/common/filters.lua:339
---@return number  state
function filters_temporalSmoothingHybrid:value() end

--- Time-dependent exponential smoothing.
---@class filters_temporalSmoothingNonLinear
local filters_temporalSmoothingNonLinear = {}

--- Advances one step toward sample.
---Source: lua/common/filters.lua:357
---@param sample number setpoint
---@param dt number time step (s)
---@return number  filtered value
function filters_temporalSmoothingNonLinear:get(sample, dt) end

--- Like get with the given rate.
---Source: lua/common/filters.lua:366
---@param sample number setpoint
---@param dt number time step (s)
---@param rate number rate (1/s)
---@return number  filtered value
function filters_temporalSmoothingNonLinear:getWithRate(sample, dt, rate) end

--- Sets the state to 0.
---Source: lua/common/filters.lua:382
function filters_temporalSmoothingNonLinear:reset() end

--- Forces the value.
---Source: lua/common/filters.lua:374
---@param sample number value
function filters_temporalSmoothingNonLinear:set(sample) end

--- Current value.
---Source: lua/common/filters.lua:378
---@return number  state
function filters_temporalSmoothingNonLinear:value() end

--- Damped spring filter: the value accelerates toward the setpoint with inertia (vel).
---@class filters_temporalSpring
local filters_temporalSpring = {}

--- Advances one step toward sample with the stiffness/damping of the constructor.
---Source: lua/common/filters.lua:219
---@param sample number setpoint
---@param dt number time step (s)
---@return number  filtered value
function filters_temporalSpring:get(sample, dt) end

--- Like get with the given stiffness and damping.
---Source: lua/common/filters.lua:225
---@param sample number setpoint
---@param dt number time step (s)
---@param spring number stiffness
---@param damp number damping
---@return number  filtered value
function filters_temporalSpring:getWithSpringDamp(sample, dt, spring, damp) end

--- Forces the value and cancels the velocity.
---Source: lua/common/filters.lua:231
---@param sample number value
function filters_temporalSpring:set(sample) end

--- Current value.
---Source: lua/common/filters.lua:236
---@return number  state
function filters_temporalSpring:value() end

--- Cosine generator: cos(2*pi*t/period) * ampl. Useful for test signals.
---Source: lua/common/filters.lua:12
---@param period number period in seconds (1e-30 added to avoid division by zero)
---@param ampl number amplitude
---@param t number time in seconds
---@return number  signal value
function freqGenC(period, ampl, t) end

--- Creates a fixed-step exponential average, parameterized by a window in number of samples (minimum 2).
---Source: lua/common/filters.lua:506
---@param window number window in samples
---@param startingValue number|nil initial value, default 0
---@param fixedDt number|nil reference time step, default 0.0005 s
---@return exponentialSmoothing  filter
function newExponentialSmoothing(window, startingValue, fixedDt) end

--- Creates an exponential average with trend tracking (reduces lag on ramps); window2 sets the trend memory.
---Source: lua/common/filters.lua:543
---@param window number window in samples (min 2)
---@param window2 number|nil trend window, default infinite
---@param startingValue number|nil initial value, default 0
---@return exponentialSmoothingT  filter
function newExponentialSmoothingT(window, window2, startingValue) end

--- Creates a frequency detector for an oscillating signal (tracks peaks and troughs). See the freqDetector class.
---Source: lua/common/filters.lua:91
---@return freqDetector  detector
function newFreqDetector() end

--- Creates an amplitude detector at a target frequency (Goertzel algorithm). See the freqExists class.
---Source: lua/common/filters.lua:157
---@return freqExists  detector
function newFreqExists() end

--- Creates a first-order filter (low-pass, high-pass, band-pass, band-stop), with internal state. Each method is called once per step with the new sample.
---Source: lua/common/filters.lua:20
---@return freqFilter1  filter
function newFreqFilter1() end

--- Creates an estimator of the line y = weight*x + bias by exponentially weighted least squares (recursive update). Scale the inputs to [0,1] or [-1,1] for stability.
---Source: lua/common/filters.lua:603
---@param window number memory: in samples (getS) or in seconds (get)
---@param weight number|nil initial slope, default 0
---@param bias number|nil initial intercept, default 0
---@param scale number|nil initialization scale of the covariance matrix, default 1000
---@param weightMin number|nil slope lower bound
---@param weightMax number|nil slope upper bound
---@param biasMin number|nil intercept lower bound
---@param biasMax number|nil intercept upper bound
---@return lineFitting  estimator
function newLineFitting(window, weight, bias, scale, weightMin, weightMax, biasMin, biasMax) end

--- Creates a linear smoothing with a FIXED time step dt (get does not take dt); no auto-centering.
---Source: lua/common/filters.lua:463
---@param dt number fixed time step in seconds
---@param inRate number|nil speed when the value comes back toward 0, default 1
---@param outRate number|nil speed when it moves away from 0, default inRate
---@return linearSmoothing  filter
function newLinearSmoothing(dt, inRate, outRate) end

--- Neutral filter: get(sample) returns sample. Used to disable a smoothing without changing the calling code.
---Source: lua/common/filters.lua:489
---@return nopSmoothing  filter
function newNopSmoothing() end

--- Creates an S-curve smoothing (acceleration limited at start and stop, speed bounded by the rate). Less abrupt than linear smoothing.
---Source: lua/common/filters.lua:244
---@param inRate number|nil max speed (units/s), default 1
---@param startAccel number|nil start acceleration, default +infinity
---@param stopAccel number|nil arrival deceleration, default startAccel
---@param outRate number|nil max speed when the value moves away from 0 (key true), default inRate
---@param startingValue number|nil initial value, default 0
---@return temporalSigmoidSmoothing  filter
function newTemporalSigmoidSmoothing(inRate, startAccel, stopAccel, outRate, startingValue) end

--- Creates a linear smoothing over time (the value moves at a bounded speed toward the setpoint). Typical for pedals, steering. Can have an auto-centering rate when the setpoint is exactly 0.
---Source: lua/common/filters.lua:390
---@param inRate number|nil speed (units/s) when the value comes back toward 0, default 1, min 1e-307
---@param outRate number|nil speed when it moves away from 0, default inRate
---@param autoCenterRate number|nil auto-centering speed when sample == 0, default inRate
---@param startingValue number|nil initial value (also reset value), default 0
---@return temporalSmoothing  filter
function newTemporalSmoothing(inRate, outRate, autoCenterRate, startingValue) end

--- Creates an exponential smoothing with a linear minimum speed (avoids the infinite tail of the exponential).
---Source: lua/common/filters.lua:311
---@param inRate number|nil exponential rate (1/s), default 1, capped at 1e30
---@param outRate number|nil rate when the difference has the same sign as the state, default inRate
---@param startingValue number|nil initial value, default 0
---@param linearRate number|nil minimum speed (units/s), default 0
---@return temporalSmoothingHybrid  filter
function newTemporalSmoothingHybrid(inRate, outRate, startingValue, linearRate) end

--- Creates a pure exponential smoothing: st += (sample - st) * r/(1+r) with r = rate*dt.
---Source: lua/common/filters.lua:351
---@param inRate number|nil rate (1/s), default 1, capped at 1e30
---@param outRate number|nil rate when the difference has the same sign as the state, default inRate
---@param startingValue number|nil initial value, default 0
---@return temporalSmoothingNonLinear  filter
function newTemporalSmoothingNonLinear(inRate, outRate, startingValue) end

--- Creates a damped spring filter that follows the setpoint (smoothed value with velocity and inertia).
---Source: lua/common/filters.lua:214
---@param spring number|nil stiffness, default 10
---@param damp number|nil damping, default 2
---@param startingValue number|nil initial value, default 0
---@return temporalSpring  filter
function newTemporalSpring(spring, damp, startingValue) end

