path = "__tarantulator_V2__"

data:extend({
{
    type = 'recipe',
    name = "tarantulator",
    enabled = false,
    energy_required = 20,
    ingredients = 
    {
        {type = "item", name = "nuclear-reactor", amount = 1},
        {type = "item", name = "spidertron", amount = 1},
        {type = "item", name = "electric-engine-unit", amount = 200},
        {type = "item", name = "processing-unit", amount = 400},
        {type = "item", name = "satellite", amount = 2},
        {type = "item", name = "uranium-fuel-cell", amount = 20},
        {type = "item", name = "low-density-structure", amount = 50}
    },
    results = {{type = "item", name = "tarantulator", amount = 1}},
    icon = path .. "/graphics/icons/tarantulator.png",
    icon_size = 64,
},
{
    type = 'recipe',
    name = 'tarantulator-railgun-shell',
    ingredients = {
        {type = "item", name = "uranium-rounds-magazine", amount = 6},
        {type = "item", name = "cluster-grenade", amount = 1},
    },
    energy_required = 20,
    results = {{type = "item", name = "tarantulator-railgun-shell", amount = 6}},
    enabled = false,
},
})