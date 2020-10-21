function module_fuel(mass::Int64)
    return mass ÷ 3 - 2
end

function fuel_fuel(mass)
    fuel = module_fuel(mass)
    if fuel <= 0
        return 0
    else
        return fuel_fuel(fuel) + fuel
    end
end

module_mass_list = parse.(Int64, readlines("01.txt"))
fuel_sum = sum(module_fuel.(module_mass_list))

println(sum(fuel_fuel.(module_mass_list)))
