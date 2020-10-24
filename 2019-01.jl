function module_fuel(mass::Int32)
    return mass ÷ 3 - 2
end

function fuel_fuel(mass::Int32)
    fuel = module_fuel(mass)
    if fuel <= 0
        return 0
    else
        return fuel_fuel(fuel) + fuel
    end
end

module_mass_list = parse.(Int32, readlines("in/01.in"))
fuel_sum = sum(module_fuel.(module_mass_list))

println(sum(fuel_fuel.(module_mass_list)))
