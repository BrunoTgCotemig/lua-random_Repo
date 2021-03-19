print("Before continuing, make sure the modem is")
print("connected on the top of the computer")
print("Press anything to continue...")
local dummy = os.pullEvent("key")
rednet.open("top")

-- Variables

local A = " "
local LCId = os.getComputerID()
local tId = " "
local rId = 0
local rMs = " "

local redstone_signal = false
-- End



-- Functions

function header() 
  term.clear()
  term.setCursorPos(1, 1)
  print("RedNet reciver MK-1")
  print("This computer's id is: #"..LCId)
  if tId ~= " " then
      print("Host ID: "..tId)
  else
  end
  print(" ")
  print(" ")
end

-- Command functions



-- end


-- Part that gets the host's id
local repeat0 = true
repeat
    header()
    print("Please inset the host id")
    A = read()
    header()
    print("The id is: "..A)
    print("Is that correct? (y/n)")
    if read() == "y" or "yes" then
        tId = A
        answer = 0
        repeat0 = false
    else
     A = ""
    end
until repeat0 == false


-- Part that interprets the host's commands
header()

local repeat1 = true
repeat
    header()
    print("waiting for orders")
    rId, rMs = rednet.receive()
    if tonumber(rId) == tonumber(tId) then
        if tostring(rMs) == tostring("changeSignal") then
            if redstone_dignal == false then
                redstone.setOutput("back", true)
                redstone_signal = true
                rednet.send(tonumber(tId), "redstone signal id on")
                print("Redstone signal is on")
            else if redstone_signal == true then
                redstone.setOutput("back", false)
                redstone_signal = false
                rednet.send(tonumber(tId), "Redstone signal is off")
                print("Back redstone signal is off")
                else
                end
            end
        else
        end
    else
    end
until repeat1 == false





