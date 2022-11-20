function tickets(player)
    ticketInfo = isfile("Ticket Keeper/"..player..".txt")

if ticketInfo == false then
    writefile("Ticket Keeper/"..player..".txt", "1")
end

contents = readfile("Ticket Keeper/"..player..".txt")
print(contents)
newNumber = tonumber(contents) + 1

writefile("Ticket Keeper/"..player..".txt", tostring(newNumber))
end

tickets("noob")