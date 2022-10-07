scoreboard players remove @s hometimer 1
execute as @s[scores={hometimer=0}] run tp 56 84 24
tellraw @s[scores={hometimer=0}] {"text":"Teleporting home!","color":"dark_purple"}
#playsound minecraft:entity.egg.throw master @a[scores={hometimer=0}] ~ ~ ~