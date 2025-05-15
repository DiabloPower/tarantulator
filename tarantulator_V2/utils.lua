local sounds = require("__base__.prototypes.entity.sounds")

local function get_spidertron_legs()
    local arachnophobia_enabled = settings.startup["tarantulator-enable-arachnophobia-mode"].value == "active"

    local legs -- Definiere `legs` zuerst global in der Funktion

    if arachnophobia_enabled then
        legs = {
            { leg = "tarantulator-leg", mount_position = util.by_pixel(15, -20), ground_position = {3.375 * 2, -3.75}, blocking_legs = {2}, walking_group = 1 },
            { leg = "tarantulator-leg", mount_position = util.by_pixel(-15, -20), ground_position = {-3.375 * 2, -3.75}, blocking_legs = {5}, walking_group = 2 },
            { leg = "tarantulator-leg", mount_position = util.by_pixel(-15, 20), ground_position = {-3.375 * 2, 3.75}, blocking_legs = {8}, walking_group = 3 },
            { leg = "tarantulator-leg", mount_position = util.by_pixel(15, 20), ground_position = {3.375 * 2, 3.75}, blocking_legs = {7}, walking_group = 4 }
        }
    else
        legs = {
            { leg = "tarantulator-leg", mount_position = util.by_pixel(15, -20), ground_position = {3.375 * 2, -3.75}, blocking_legs = {2}, walking_group = 1 },
            { leg = "tarantulator-leg-small", mount_position = util.by_pixel(25, 0), ground_position = {3.5, -1.25}, blocking_legs = {1, 3}, walking_group = 2 },
            { leg = "tarantulator-leg-small", mount_position = util.by_pixel(15, 18), ground_position = {3.5, 1.25}, blocking_legs = {2}, walking_group = 3 },
            { leg = "tarantulator-leg", mount_position = util.by_pixel(-15, -20), ground_position = {-3.375 * 2, -3.75}, blocking_legs = {5}, walking_group = 4 },
            { leg = "tarantulator-leg-small", mount_position = util.by_pixel(-25, 0), ground_position = {-3.5, -1.25}, blocking_legs = {4, 6}, walking_group = 5 },
            { leg = "tarantulator-leg-small", mount_position = util.by_pixel(-15, 18), ground_position = {-3.5, 1.25}, blocking_legs = {5}, walking_group = 6 },
            { leg = "tarantulator-leg", mount_position = util.by_pixel(-15, 20), ground_position = {-3.375 * 2, 3.75}, blocking_legs = {8}, walking_group = 7 },
            { leg = "tarantulator-leg", mount_position = util.by_pixel(15, 20), ground_position = {3.375 * 2, 3.75}, blocking_legs = {7}, walking_group = 8 }
        }    
    end

    return legs
end

return {
    get_spidertron_legs = get_spidertron_legs
}
