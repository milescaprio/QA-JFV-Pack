scoreboard players remove @s respawntimer 1
#on, kill, off, they go home, and death counter decrements
#5 seconds before keepinventory and doimmediaterespawn are disabled again
tellraw @s[scores={respawntimer=112}] {"text":"Teleporting to Respawn Point!","color":"dark_purple"}
execute as @s[scores={respawntimer=108}] run gamerule keepInventory true 
execute as @s[scores={respawntimer=108}] run gamerule doImmediateRespawn true
kill @s[scores={respawntimer=104}]
execute as @s[scores={respawntimer=0}] run gamerule keepInventory false
execute as @s[scores={respawntimer=0}] run gamerule doImmediateRespawn false
scoreboard players remove @s[scores={respawntimer=0}] Deaths 1
#playsound minecraft:entity.egg.throw master @a[scores={respawntimer=0}] ~ ~ ~