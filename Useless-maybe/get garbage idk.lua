for i,v in pairs(getgc()) do
    if type(v) == 'function' and not is_synapse_function(v) and getinfo(v).name then
        print(getinfo(v).name)
    end
end