function has_double(vec)
    for i in 1:length(vec)-1
        if vec[i] == vec[i+1]
            return true
        end
    end
    return false
end

function has_strict_double(vec)
    lengths = []
    prev = -1
    len = 0
    for number in vec
        if number == prev
            len += 1
        else
            append!(lengths, [len])
            len = 1
        end
        prev = number
    end
    append!(lengths, [len])
    if 2 in lengths
        return true
    end
    return false
end

function is_monotonic(vec)
    for i in 1:length(vec)-1
        if vec[i+1] < vec[i]
            return false
        end
    end
    return true
end

function part_1(lower_bound, upper_bound)
    count = 0
    for i in lower_bound:upper_bound
        vec = reverse(digits(i))
        if is_monotonic(vec) && has_double(vec)
            count += 1
        end
    end
    return count
end

function part_2(lower_bound, upper_bound)
    count = 0
    for i in lower_bound:upper_bound
        vec = reverse(digits(i))
        if is_monotonic(vec) && has_strict_double(vec)
            count += 1
        end
    end
    return count
end