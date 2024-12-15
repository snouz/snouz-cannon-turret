require("prototypes.cannon-turret")
require("prototypes.technology-cannon-turret")


if mods["quality"] then
  table.insert(data.raw["ammo-turret"]["vtk-cannon-turret"], {heating_energy = "50kW"})
  table.insert(data.raw["ammo-turret"]["vtk-cannon-turret-heavy"], {heating_energy = "100kW"})
end
