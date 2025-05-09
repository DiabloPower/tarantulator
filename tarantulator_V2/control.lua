-- Global table to store Tarantulators
local global = {}

-- Runs every 240 game ticks to check Tarantulators and manage their energy
script.on_nth_tick(240, function(event)
    global.tarantulators = global.tarantulators or {}

    for id, spider in pairs(global.tarantulators) do
        if spider and spider.valid and spider.grid then
            local grid = spider.grid
            -- Loops through all equipment in the spider's grid
            for _, equipment in pairs(grid.equipment) do
                if equipment.max_energy and equipment.energy then
                    local missing = equipment.max_energy - equipment.energy
                    -- Transfers fuel energy to equipment if needed
                    if missing > 0 and spider.burner and spider.burner.remaining_burning_fuel then
                        if spider.burner.remaining_burning_fuel > 0 then
                            if missing > 0 then
                                if spider.burner.remaining_burning_fuel < missing / global.transfer_efficiency then
                                    -- Transfers all remaining fuel energy to the equipment
                                    equipment.energy = equipment.energy + spider.burner.remaining_burning_fuel * global.transfer_efficiency
                                    spider.burner.remaining_burning_fuel = 0
                                else
                                    -- Reduces fuel and fully charges the equipment
                                    spider.burner.remaining_burning_fuel = spider.burner.remaining_burning_fuel - (missing / global.transfer_efficiency)
                                    equipment.energy = equipment.energy + missing
                                end
                            end
                        end                        
                    end
                end
            end
        else
            -- Removes invalid Tarantulator references
            global.tarantulators[id] = nil
        end
    end
end)

-- Function triggered when a Tarantulator is built
local function tarantulator_built(event)
    local entity = event.created_entity or event.entity
    -- Automatically places a reactor in the equipment grid
    entity.grid.put{
        name = 'tarantulator-reactor',
        position = {3, 4},
    }
    -- Registers the new Tarantulator in the global table
    global.tarantulators[entity.unit_number] = entity
end

-- Filters for detecting Tarantulator entity creation events
local filter = {{filter = 'name', name = 'tarantulator'}, {filter = 'type', type = 'spider-vehicle', mode = 'and'}}

-- Triggers when a Tarantulator is built manually, by a robot, or revived
script.on_event(defines.events.on_built_entity, tarantulator_built, filter)
script.on_event(defines.events.on_robot_built_entity, tarantulator_built, filter)
script.on_event(defines.events.script_raised_built, tarantulator_built, filter)
script.on_event(defines.events.script_raised_revive, tarantulator_built, filter)

-- Ensures the Tarantulator reactor is always present in the equipment grid
script.on_event(defines.events.on_player_removed_equipment, function(event)
    if event.equipment == 'tarantulator-reactor' then
        event.grid.put{
            name = 'tarantulator-reactor',
            position = {3, 4},
        }
        -- Prevents players from removing the reactor entirely
        game.players[event.player_index].remove_item{name = 'tarantulator-reactor', count = 100}
    end
end)

-- Initial setup for the mod when loaded or reconfigured
local function setup()
    global.transfer_efficiency = settings.startup["tarantulator-energy-grid-efficiency"].value / 100 * 0.05
    global.tarantulators = global.tarantulators or {}
end

script.on_init(setup)
script.on_configuration_changed(setup)

-- Runs every 60 ticks to update friendly fire settings
script.on_event(defines.events.on_tick, function(event)  
    if math.fmod(event.tick, 60) == 0 then
        local friendly_fire_setting = settings.startup["tarantulator-enable-friendly-fire"].value
        -- Updates friendly fire settings for the player force
        game.forces["player"].friendly_fire = friendly_fire_setting
    end
end)