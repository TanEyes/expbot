local module = {}

function module.chat(m)
    local cur = mods.userdata.getCurrency(m)
    mods.userdata.nUpdate(m, "weight", 1, cur.weight[1] + 10)
    print("up 10")
end

return module
