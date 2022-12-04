local function formatInt(amount)
    if (not amount) then
      return "NaN"
    end
  
    while true do
        amount, k = string.gsub(amount, "^(-?%d+)(%d%d%d)", '%1,%2')
        if (k==0) then
            break
        end
    end
    return amount
end

return {
  intToString = intToString
}
