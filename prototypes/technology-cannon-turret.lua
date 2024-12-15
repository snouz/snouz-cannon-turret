local path = "__snouz-cannon-turret__"

-- New cannon turret technology
data:extend(
{
  {
    type = "technology",
    name = "vtk-cannon-turret-unlock",
    icon_size = 256,
    icon = path .. "/graphics/technology/cannon-turret-tech.png",
    effects = 
    {
        {
          type = "unlock-recipe",
          recipe = "vtk-cannon-turret"
        },
      },
    prerequisites = {"gun-turret", "tank"}, 
    unit =
    {
      count = 350,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
      },
      time = 30,
    },
    upgrade = true,
    order = "e-c-c-a"
  },
  {
    type = "technology",
    name = "vtk-cannon-turret-heavy-unlock",
    icon_size = 256,
    icon = path .. "/graphics/technology/cannon-turret-heavy-tech.png",
    effects = 
    {
        {
          type = "unlock-recipe",
          recipe = "vtk-cannon-turret-heavy"
        },
      },
    prerequisites = {"vtk-cannon-turret-unlock"}, 
    unit =
    {
      count = 350,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"production-science-pack", 1},
      },
      time = 30,
    },
    upgrade = true,
    order = "e-c-c-a"
  },
  {
    type = "technology",
    name = "vtk-cannon-turret-wall-resistance",
    icons = {
      {
        icon = path .. "/graphics/technology/vtk-cannon-turret-wall-resistance.png",
        icon_size = 256,
      },
      {
        icon = path .. "/graphics/technology/constant-defense.png",
        icon_size = 128,
        scale = 0.5,
        shift = {50, 50}
      }
    },
    effects = 
    {
      {
        type = "nothing",
        effect_description = "Walls and gates explosion 90% resistance bonus"
      },
    },
    prerequisites = {"vtk-cannon-turret-unlock", "stone-wall"}, 
    unit =
    {
      count = 600,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
      },
      time = 30,
    },
    upgrade = true,
    order = "e-c-c-a"
  },
})