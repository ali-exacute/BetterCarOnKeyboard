Config = {}
Config.debug = false
-- torque : to put it simply , its the amount of force that a vehicle can apply to its wheels, so lower force, slower acceleration, higher torque, higher acceleration
Config.lowestTorque = 0.2   -- lowest torque can be 0.2, lower than 0.2 will probably cause issue with cars moving at all
Config.HighestTorque = 3.0  -- going higher than 1.0 will result in vehicles having more power than they normally have by default

Config.onScreenData = {
    enabled = true,
    location = { x=0.03, y =0.005 },
    scale = 0.3
}
Config.Controls = {
    {
        modifierKey = false,    -- this key need to be pressed before the actual key to work    (false to disable)
        key = 99,   -- scrollup key on mouse
        disableKeyDefaultFunc = true,  -- disable key default functionality in game (if modifierKey is set , will only disable the key while modifierKey is pressed)
        torque = 0.1,   -- adds 0.1 to torque on keypress (recommended : 0.1)
    },
    {
        modifierKey = false,    -- this key need to be pressed before the actual key to work    (false to disable)
        key = 81,   -- scrolldown key on mouse
        disableKeyDefaultFunc = true,  -- disable key default functionality in game (if modifierKey is set , will only disable the key while modifierKey is pressed)
        torque = -0.1,   -- adds 0.1 to torque on keypress (recommended : 0.1)
    },
}