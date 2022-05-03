def infinity(v)
    puts v
    puts "-"
    if v <= 4
        infinity(v+1)
        puts v
        puts "-"
    end
end

puts infinity(0)