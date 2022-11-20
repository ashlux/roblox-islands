local Str1, Str2 = "INSANE", "JHASDFKJKLDJASGNAadswfsf"

function firstToUpper(String)
    return (string.sub(String, 1, 1)):upper()..(string.sub(String, 2, -1):lower())
end

print(firstToUpper(Str1))
print(firstToUpper(Str2))