# `filters`

*File: `lua/common/filters.lua` · VM: Common (GE + vehicle) · 693 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("filters")`

Collection of stateful numeric filters (smoothing, low-pass/high-pass, spring, frequency detector, linear regression) used throughout the vehicle code (pedal/steering inputs, sensors, controllers). Each filter is created by a global function newXxx(...) that returns an object with a get(sample, dt) method (or get(sample) for fixed-step filters) that updates the internal state and returns the filtered value. The constructors are global variables: `require('filters')` is not necessary once the module is loaded (loaded by default in both VMs).

## Example

```lua
local smoother = newTemporalSmoothing(5, 5)          -- 5 units/s when rising and falling
function updateGFX(dt)
  local out = smoother:get(rawInput, dt)
end

local lp = newFreqFilter1()
local y = lp:getLowPassFreq(sample, dt, 10) -- 10 Hz low-pass
```

## Notes

- This file does not return a table M: everything is global (freqGenC, newFreqFilter1, newFreqDetector, newFreqExists, newTemporalSpring, newTemporalSigmoidSmoothing, newTemporalSmoothingHybrid, newTemporalSmoothingNonLinear, newTemporalSmoothing, newLinearSmoothing, newNopSmoothing, newExponentialSmoothing, newExponentialSmoothingT, newLineFitting). The classes (metatables) are local and only accessible through the created objects.
- IMPORTANT: the snippets of the auto page give signatures without the sample (e.g. get(dt)). In the code, the sample is ALWAYS the first argument after self: get(sample, dt), getLowPassFreq(sample, dt, cutOffFreq), lineFitting:getS(x, y), lineFitting:get(x, y, dt), etc.
- Input/output rate filters (temporalSmoothing, temporalSmoothingNonLinear, temporalSmoothingHybrid, temporalSigmoidSmoothing, linearSmoothing): the object stores two rates in the boolean keys [false] = inRate and [true] = outRate. At each step, the key used is (sample - state) * state >= 0: so when the difference has the same sign as the state (the value moves away from 0, or the state is 0), the rate stored in [true] (= outRate) applies; when the value comes back toward 0, it is [false] (= inRate). This is the code's behavior, regardless of the parameter names.
- temporalSmoothing is LINEAR (speed bounded to rate units/s), temporalSmoothingNonLinear is EXPONENTIAL (st += dif * rate*dt/(1+rate*dt)), temporalSmoothingHybrid = exponential with a minimum speed linearRate. Infinite input rates are brought to 1e30 (NonLinear, Hybrid) or the lower bound to 1e-307 (Linear).
- temporalSmoothing:getCapped/getWithRateCapped bound the output to [-1, 1]; getUncapped = get (alias) and getWithRateUncapped = getWithRate (alias). If autoCenterRate (3rd constructor argument) differs from inRate, getUncapped becomes getUncappedAutoCenter; getCapped goes through getUncapped, so auto-centering is only active via getCapped/getUncapped, not via get().
- newExponentialSmoothing: the internal constant is computed with fixedDt (0.0005 s by default); the window is expressed as a number of samples (minimum 2). Do not use it with a variable time step (use getWindow or a temporal filter).
- lineFitting: samples x, y; weight = slope, bias = intercept. window is in samples for getS, in seconds for get. For numerical stability, scale the inputs to [0,1] or [-1,1] (code note). If scale <= 0 or nil, scale = 1000. lineFitting:set(window, ...) only sets decay with the sample-based formula (1 - 2/(window+1)), but get() recomputes decay on each call.
- freqExists:get / getS / bufferStart-bufferAdd-bufferEnd implement the Goertzel algorithm to measure the amplitude of a given frequency in a signal.
- In the code, getUncapped is referenced in temporalSmoothing:getCapped but is only defined by alias after the class definition (temporalSmoothing.getUncapped = temporalSmoothing.get): OK.
- temporalSigmoidSmoothing and temporalSpring have their own convention: see the description of each method.

## Class `exponentialSmoothing`

Fixed-step exponential average.

| Method | Description | Line |
|---|---|---|
| `exponentialSmoothing:get(sample)` | One smoothing step toward sample with the constructor's coefficient. | 513 |
| `exponentialSmoothing:getWindow(sample, window)` | One step with a window (in samples, min 2) provided in the call. | 520 |
| `exponentialSmoothing:reset(value)` | Resets the state to value, or to the start value. | 535 |
| `exponentialSmoothing:set(value)` | Forces the value. | 531 |
| `exponentialSmoothing:value()` | Current value. | 527 |

## Class `exponentialSmoothingT`

Exponential average with trend compensation.

| Method | Description | Line |
|---|---|---|
| `exponentialSmoothingT:get(sample)` | One smoothing step (constructor windows). | 549 |
| `exponentialSmoothingT:getWindow(sample, window, window2)` | One step with windows provided in the call. | 567 |
| `exponentialSmoothingT:reset(value)` | Resets the state to value (or start value) and clears the trend. | 593 |
| `exponentialSmoothingT:set(value)` | Forces the value (does not clear the trend). | 589 |
| `exponentialSmoothingT:value()` | Current value. | 585 |

## Class `freqDetector`

Estimates the period, amplitude and DC bias of an oscillating signal by tracking peaks and troughs.

| Method | Description | Line |
|---|---|---|
| `freqDetector:get(sample, dt)` | Updates with a sample. Returns period, peak amplitude, time since the previous peak (prevPeakDt) and DC bias. The approximated signal is cos(peakDt*2*pi/(period+1e-30))*ampl + bias. | 101 |
| `freqDetector:reset()` | Resets peaks, troughs, period, amplitude and bias to zero. | 141 |
| `freqDetector:value(dt)` | Returns the latest estimate (period, amplitude, prevPeakDt, bias) while advancing the timers by dt (0 by default). | 146 |

## Class `freqExists`

Measures the amplitude of a specific frequency in a signal (Goertzel algorithm).

| Method | Description | Line |
|---|---|---|
| `freqExists:bufferAdd(sample)` | Adds a sample to the current batch. | 192 |
| `freqExists:bufferEnd()` | Ends the batch and returns the amplitude of the frequency. | 198 |
| `freqExists:bufferStart(dt, freq)` | Starts batch processing (buffer) for frequency freq at step dt. Follow with bufferAdd for each sample then bufferEnd. | 188 |
| `freqExists:get(sample, dt, freq, cycleCount)` | Cycle mode: accumulates samples and, every cycleCount cycles of freq, updates and returns the amplitude (otherwise returns the last amplitude). More cycles = more accurate but more latency. | 163 |
| `freqExists:getS(sample, dt, freq, winCoef)` | Per-sample sliding mode: returns the amplitude on each call; returns 0 if freq*dt >= 0.5 (beyond Nyquist). Larger winCoef = more accurate but slower. | 177 |
| `freqExists:reset()` | Resets the state to zero. | 204 |

## Class `freqFilter1`

First-order filter (state: state, state2, x). All methods take (sample, dt, ...) and return the filtered value. Mix only one type of filter per object (shared states).

| Method | Description | Line |
|---|---|---|
| `freqFilter1:getBandPassFreq(sample, dt, lowFreq, highFreq)` | Band-pass (high-pass at lowFreq then low-pass at highFreq). | 53 |
| `freqFilter1:getBandPassPeriod(sample, dt, lowPeriod, highPeriod)` | Band-pass with periods. | 62 |
| `freqFilter1:getBandStopFreq(sample, dt, lowFreq, highFreq)` | Band-stop (sum of a high-pass at highFreq and a low-pass at lowFreq). | 70 |
| `freqFilter1:getBandStopPeriod(sample, dt, lowPeriod, highPeriod)` | Band-stop with periods. | 79 |
| `freqFilter1:getHighPassFreq(sample, dt, cutOffFreq)` | High-pass, cutoff in Hz. | 41 |
| `freqFilter1:getHighPassPeriod(sample, dt, cutOffPeriod)` | High-pass, cutoff as a period. | 47 |
| `freqFilter1:getLowPassFreq(sample, dt, cutOffFreq)` | Low-pass, cutoff in Hz. | 27 |
| `freqFilter1:getLowPassPeriod(sample, dt, cutOffPeriod)` | Low-pass, cutoff given by a period (time constant 2*pi*... see code: pdt = 2*pi*dt, filter pdt/(pdt+period)). | 34 |

## Class `lineFitting`

Exponentially weighted recursive linear regression. Public fields: weight, bias, plus bounds weightMin/Max and biasMin/Max.

| Method | Description | Line |
|---|---|---|
| `lineFitting:get(x, y, dt)` | Update with a time step (window in seconds). Returns the slope and intercept. | 645 |
| `lineFitting:getS(x, y)` | Per-sample update (window in samples). Returns the estimated slope and intercept. | 621 |
| `lineFitting:getX(y)` | Estimated x for y (inverse of the line, guards against a zero slope). | 678 |
| `lineFitting:getY(x)` | Estimated y for x: weight*x + bias. | 674 |
| `lineFitting:reset()` | Resets slope, intercept and covariance matrix to the initial state. | 688 |
| `lineFitting:set(window, weight, bias, weightMin, weightMax, biasMin, biasMax)` | Changes window (decay), slope, intercept and bounds (nil arguments keep the current value). | 682 |
| `lineFitting:value()` | Current slope and intercept. | 670 |

## Class `linearSmoothing`

Linear smoothing with a fixed time step given to the constructor.

| Method | Description | Line |
|---|---|---|
| `linearSmoothing:get(sample)` | Advances one step toward sample (no dt argument). | 469 |
| `linearSmoothing:reset()` | Resets the state to 0. | 481 |
| `linearSmoothing:set(v)` | Forces the value. | 477 |

## Class `nopSmoothing`

Bypass filter (no smoothing).

| Method | Description | Line |
|---|---|---|
| `nopSmoothing:get(sample)` | Returns sample as is. | 493 |
| `nopSmoothing:reset()` | Does nothing. | 500 |
| `nopSmoothing:set()` | Does nothing. | 497 |

## Class `temporalSigmoidSmoothing`

S-curve smoothing with speed (rate) and acceleration limiting.

| Method | Description | Line |
|---|---|---|
| `temporalSigmoidSmoothing:get(sample, dt)` | Advances one step toward sample. The max speed is that of the constructor (inRate / outRate depending on whether the value moves away from 0). | 251 |
| `temporalSigmoidSmoothing:getWithRateAccel(sample, dt, ratelimit, startAccel, stopAccel)` | Like get with the given max speed and accelerations (stopAccel default startAccel). | 273 |
| `temporalSigmoidSmoothing:reset()` | Resets state and velocity to 0 (not to the constructor's initial value). | 298 |
| `temporalSigmoidSmoothing:set(sample)` | Forces the value and cancels the velocity. | 293 |
| `temporalSigmoidSmoothing:value()` | Current value. | 303 |

## Class `temporalSmoothing`

Time-dependent linear smoothing (bounded speed). Aliases: getUncapped = get, getWithRateUncapped = getWithRate.

| Method | Description | Line |
|---|---|---|
| `temporalSmoothing:get(sample, dt)` | Advances one step toward sample at speed (units/s) inRate/outRate; never overshoots the setpoint. | 418 |
| `temporalSmoothing:getCapped(sample, dt)` | getUncapped then bounds the output to [-1, 1]. | 426 |
| `temporalSmoothing:getUncappedAutoCenter(sample, dt)` | Like get but with auto-centering: if sample == 0 the speed is autoCenterRate. Becomes getUncapped when autoCenterRate ~= inRate. | 403 |
| `temporalSmoothing:getWithRate(sample, dt, rate)` | Like get with a given speed. | 430 |
| `temporalSmoothing:getWithRateCapped(sample, dt, rate)` | getWithRate bounded to [-1, 1]. | 438 |
| `temporalSmoothing:reset()` | Resets the state to the constructor's startingValue. | 445 |
| `temporalSmoothing:set(v)` | Forces the value. | 453 |
| `temporalSmoothing:value()` | Current value. | 449 |

## Class `temporalSmoothingHybrid`

Exponential smoothing with a linear minimum speed.

| Method | Description | Line |
|---|---|---|
| `temporalSmoothingHybrid:get(sample, dt)` | Advances one step toward sample (rate chosen according to direction, see notes). | 317 |
| `temporalSmoothingHybrid:getWithRate(sample, dt, rate, linearRate)` | Like get with the given rate and linear speed. | 326 |
| `temporalSmoothingHybrid:reset()` | Sets the state to 0 (not to startingValue). | 343 |
| `temporalSmoothingHybrid:set(sample)` | Forces the value. | 335 |
| `temporalSmoothingHybrid:value()` | Current value. | 339 |

## Class `temporalSmoothingNonLinear`

Time-dependent exponential smoothing.

| Method | Description | Line |
|---|---|---|
| `temporalSmoothingNonLinear:get(sample, dt)` | Advances one step toward sample. | 357 |
| `temporalSmoothingNonLinear:getWithRate(sample, dt, rate)` | Like get with the given rate. | 366 |
| `temporalSmoothingNonLinear:reset()` | Sets the state to 0. | 382 |
| `temporalSmoothingNonLinear:set(sample)` | Forces the value. | 374 |
| `temporalSmoothingNonLinear:value()` | Current value. | 378 |

## Class `temporalSpring`

Damped spring filter: the value accelerates toward the setpoint with inertia (vel).

| Method | Description | Line |
|---|---|---|
| `temporalSpring:get(sample, dt)` | Advances one step toward sample with the stiffness/damping of the constructor. | 219 |
| `temporalSpring:getWithSpringDamp(sample, dt, spring, damp)` | Like get with the given stiffness and damping. | 225 |
| `temporalSpring:set(sample)` | Forces the value and cancels the velocity. | 231 |
| `temporalSpring:value()` | Current value. | 236 |

## Global functions defined here

| Function | Description | Line |
|---|---|---|
| `freqGenC(period, ampl, t)` | Cosine generator: cos(2*pi*t/period) * ampl. Useful for test signals. | 12 |
| `newExponentialSmoothing(window, startingValue, fixedDt)` | Creates a fixed-step exponential average, parameterized by a window in number of samples (minimum 2). | 506 |
| `newExponentialSmoothingT(window, window2, startingValue)` | Creates an exponential average with trend tracking (reduces lag on ramps); window2 sets the trend memory. | 543 |
| `newFreqDetector()` | Creates a frequency detector for an oscillating signal (tracks peaks and troughs). See the freqDetector class. | 91 |
| `newFreqExists()` | Creates an amplitude detector at a target frequency (Goertzel algorithm). See the freqExists class. | 157 |
| `newFreqFilter1()` | Creates a first-order filter (low-pass, high-pass, band-pass, band-stop), with internal state. Each method is called once per step with the new sample. | 20 |
| `newLineFitting(window, weight, bias, scale, weightMin, weightMax, biasMin, biasMax)` | Creates an estimator of the line y = weight*x + bias by exponentially weighted least squares (recursive update). Scale the inputs to [0,1] or [-1,1] for stability. | 603 |
| `newLinearSmoothing(dt, inRate, outRate)` | Creates a linear smoothing with a FIXED time step dt (get does not take dt); no auto-centering. | 463 |
| `newNopSmoothing()` | Neutral filter: get(sample) returns sample. Used to disable a smoothing without changing the calling code. | 489 |
| `newTemporalSigmoidSmoothing(inRate, startAccel, stopAccel, outRate, startingValue)` | Creates an S-curve smoothing (acceleration limited at start and stop, speed bounded by the rate). Less abrupt than linear smoothing. | 244 |
| `newTemporalSmoothing(inRate, outRate, autoCenterRate, startingValue)` | Creates a linear smoothing over time (the value moves at a bounded speed toward the setpoint). Typical for pedals, steering. Can have an auto-centering rate when the setpoint is exactly 0. | 390 |
| `newTemporalSmoothingHybrid(inRate, outRate, startingValue, linearRate)` | Creates an exponential smoothing with a linear minimum speed (avoids the infinite tail of the exponential). | 311 |
| `newTemporalSmoothingNonLinear(inRate, outRate, startingValue)` | Creates a pure exponential smoothing: st += (sample - st) * r/(1+r) with r = rate*dt. | 351 |
| `newTemporalSpring(spring, damp, startingValue)` | Creates a damped spring filter that follows the setpoint (smoothed value with velocity and inertia). | 214 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/filters.lua`.*
