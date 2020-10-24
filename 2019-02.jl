function parse_input(path)
    return parse.(Int64, split(readline(path), ","))
end

function translate(int_code, noun, verb)
    int_code = copy(int_code)
    int_code[2] = noun
    int_code[3] = verb

    i = 1
    while i <= length(int_code)
        if int_code[i] == 1 
            int_code[int_code[i + 3] + 1] = int_code[int_code[i + 1] + 1] + int_code[int_code[i + 2] + 1]
            i += 4
        elseif int_code[i] == 2
            int_code[int_code[i + 3] + 1] = int_code[int_code[i + 1] + 1] * int_code[int_code[i + 2] + 1]
            i += 4
        elseif int_code[i] == 99
            break
        end
    end
    return int_code[1]
end

function pt2(int_code)
    for i = 1:99, j = 1:99
        if translate(int_code, i, j) == 19690720
            return(100 * i + j)
        end
    end
end

int_code = parse_input("in/02.in")
println(translate(int_code, 12, 2))
println(pt2(int_code))