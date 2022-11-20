local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local function iterPageItems(pages)
	return coroutine.wrap(function()
		local pagenum = 1
		while true do
			for _, item in ipairs(pages:GetCurrentPage()) do
				coroutine.yield(item, pagenum)
			end
			if pages.IsFinished then
				break
			end
			pages:AdvanceToNextPageAsync()
			pagenum = pagenum + 1
		end
	end)
end

-- Then, get a FriendPages object for their friends
local friendPages = Players:GetFriendsAsync(Player.UserId)
-- Iterate over the items in the pages. For FriendPages, these
-- are tables of information about the friend, including Username.
-- Collect each username in a table
local usernames = {}
for item, _pageNo in iterPageItems(friendPages) do
    if item.IsOnline == true then
	table.insert(usernames, item.Username)
	end
end

print(table.concat(usernames, "\n"))