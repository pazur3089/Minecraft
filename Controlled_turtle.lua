local modem = peripheral.wrap("right")
local channel = tonumber(read())

function dig()
	if turtle.detectUp() then
		turtle.digUp()
	end
	if turtle.detect() then
		turtle.dig()
	end
	if turtle.detectDown() then
		turtle.digDown()
	end
end

function drop()
	for i = 2,16,1 do
		turtle.select(i)
		turtle.drop()
	end
end

function get() 
	turtle.select(2)
	turtle.suckUp()
	turtle.select(turtle.getSelectedSlot()+1)
	turtle.suck()
	turtle.select(turtle.getSelectedSlot()+1)
	turtle.suckDown()
end

function fuel()
	for i=1,16,1 do
		turtle.select(i)
		turtle.refuel()
	end
end

function move(arr)
	if arr == "left" then
		turtle.turnLeft()
	elseif arr == "right" then
		turtle.turnRight()
	elseif arr == "back" then
		turtle. turnRight()
		turtle. turnRight()
	elseif arr == "up" then
		turtle.up()
		return 0
	elseif arr == "down" then
		turtle.down()
		return 0
	elseif arr == "dig" then
		dig()
		return 0
	elseif arr == "drop" then
		drop()
		return 0
	elseif arr == "get" then
		get()
		return 0
	elseif arr == "fuel" then
		fuel()
		return 0
	end
	if turtle.detect() then
		turtle.dig()
	end
	turtle.forward()
end

function message(channel)
	modem.open(channel)
	local event, syf1,syf2,syf3, message = os.pullEvent("modem_message")
	return message
end

while true do
	move(message(channel))
end