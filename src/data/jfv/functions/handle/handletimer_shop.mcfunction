scoreboard players remove @s shoptimer 1
#playsound minecraft:entity.egg.throw master @a[scores={shoptimer=0}] ~ ~ ~ 
execute as @s[scores={shoptimer=0}] run tp 50 70 120
tellraw @s[scores={shoptimer=0}] {"text":"Teleporting to the Shopping District!","color":"dark_purple"}