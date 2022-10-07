scoreboard players remove @a fighttimer 1
#playsound minecraft:entity.egg.throw master @a[scores={fighttimer=0}] ~ ~ ~ 
execute as @a[scores={fighttimer=0}] run tp 50 270 120
tellraw @a[scores={fighttimer=0}] {"text":"Teleporting to the Fight Zone!","color":"dark_purple"}