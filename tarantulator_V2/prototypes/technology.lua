path = "__tarantulator_V2__"

data:extend({
    {
        type = 'technology',
        name = 'tarantulator',
        icon = path .. '/graphics/technology/tarantulator.png',
        icon_size = 128,
        effects = {
            {
                recipe = 'tarantulator',
                type = 'unlock-recipe'
            },
            {
                recipe = 'tarantulator-railgun-shell',
                type = 'unlock-recipe'
            }
        },
        prerequisites = {
            'spidertron',
            'space-science-pack',
            'artillery',
            'nuclear-power'
        },
        unit = {
            count = 4000,
            ingredients = {
                {'automation-science-pack', 1},
                {'logistic-science-pack', 1},
                {'military-science-pack', 1},
                {'chemical-science-pack', 1},
                {'production-science-pack', 1},
                {'utility-science-pack', 1},
                {'space-science-pack', 1}
            },
            time = 30
        }
    }
})
