# Better Car On Keyboard
_also known as lowerTorque_

## _check out the FiveM forum here : PLACEHOLDER_

#### This script modifies vehicle torque in real-time when specific keys are pressed, allowing players to adjust vehicle acceleration dynamically, similar to gradual throttle control with a controller. Using keyboard inputs, the script adjusts torque to make a vehicle accelerate faster or slower based on specified torque levels.

## Features

- **Dynamic Acceleration Control**: Increase or decrease vehicle torque with assigned keys.
- **Configurable Torque Range**: Set minimum and maximum torque values.
- **In-Game UI Option**: Display current torque level and wheel power metrics (debug only).
- **Controller Compatibility**: Automatically disables torque adjustments if a controller is detected.

## Configuration

Adjust script behavior in the `config.lua` file.

- **Debug Mode**: Enable or disable debug messages (`Config.debug`).
- **Torque Range**:
  - `Config.lowestTorque`: Minimum torque allowed (e.g., `0.2`).
  - `Config.HighestTorque`: Maximum torque allowed (e.g., `1.8`).
- **On-Screen Data**:
  - `Config.onScreenData.enabled`: Show torque level on-screen.
  - `Config.onScreenData.location`: Set display location for torque text.
  - `Config.onScreenData.scale`: Text scale for on-screen torque display.

- **Controls**: Customize keys for torque control in `Config.Controls`:
  - `modifierKey`: Optional modifier key to press with the main key.
  - `key`: Main key to adjust torque (check [game-refrences](https://docs.fivem.net/docs/game-references/controls/) for keys).
  - `disableKeyDefaultFunc`: Disable default in-game action for the key.
  - `torque`: Torque adjustment increment/decrement per key press.

### Default Controls

- **Increase Torque**: Mouse scroll-up (configurable in `Config.Controls[1].key`)
- **Decrease Torque**: Mouse scroll-down (configurable in `Config.Controls[2].key`)

## Installation

1. Download the script from github : https://github.com/ali-exacute/BetterCarOnKeyboard

2. Copy the script files to your server's resources directory.

3. Edit `config.lua` to customize torque values, debug mode, and UI settings if you want.

4. Add the resource to your server's start-up configuration:

```ts
   ensure BetterCarOnKeyboard
```
-----
# my other projects :

[Second Hand Vehicle Remastered](https://forum.cfx.re/t/second-hand-vehicle-remastered-sell-your-used-cars-to-other-players-with-style/2114411)

[Advanced Spectate](https://forum.cfx.re/t/standalone-onesync-advanced-spectate/4107435)

[Better FPS | Dynamic FPS Booster](https://forum.cfx.re/t/paid-better-fps-dynamic-resolution-fps-booster/4863840)

[ESX Advanced Needs](https://forum.cfx.re/t/esx-advancedneeds-advancedstatus/2859389)

[ESX Advanced Job System](https://forum.cfx.re/t/esx-advanced-job-system/2616104)

[Advanced Kit System](https://forum.cfx.re/t/standalone-esx-advanced-kit-system)

[ESX Adminplus](https://forum.cfx.re/t/esx-v1-exm-esx-adminplus/1202550)