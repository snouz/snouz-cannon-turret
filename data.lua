require("prototypes.cannon-turret")
require("prototypes.cannon-turret-ammo")
require("prototypes.technology-cannon-turret")
require("prototypes.explosive-shells-scortch")


if mods["quality"] then
  table.insert(data.raw["ammo-turret"]["vtk-cannon-turret"], {heating_energy = "50kW"})
  table.insert(data.raw["ammo-turret"]["vtk-cannon-turret-heavy"], {heating_energy = "100kW"})
end
