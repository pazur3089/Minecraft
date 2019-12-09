local modem = peripheral.wrap("right")
local channel = tonumber(read())

while true do
	arr = read()
	modem.transmit(channel, channel+1, arr)
end