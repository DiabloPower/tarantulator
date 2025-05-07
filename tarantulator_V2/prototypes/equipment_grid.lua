path = "__tarantulator_V2__"

data:extend({
    {
        type = 'equipment-grid',
        name = 'tarantulator-equipment-grid',
        width = 10,
        height = 8,
        equipment_categories = {'tarantulator'},
    },
    {
        type = 'equipment-category',
        name = 'tarantulator',
    },
})

data:extend({
    {
        name = "tarantulator-reactor",
        type = "generator-equipment",
        power = "1W",
        categories = {"tarantulator"},
        shape = {
            type = "full",
            width = 4,
            height = 4,
        },
        energy_source = {
            type = "electric",
            usage_priority = "secondary-output",
        },
        sprite = {
            filename = path .. "/graphics/equipment/reactor.png",
            size = {128, 128},
        },
    }
})