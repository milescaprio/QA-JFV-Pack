#withdraw trigger management
scoreboard players remove @s Diamond_Bank 1
tag @s[scores={Diamond_Bank=0..}] add withdrawing
give @s[tag=withdrawing] diamond
scoreboard players remove @s[tag=withdrawing] withdraw 1
scoreboard players add @s[tag=!withdrawing] Diamond_Bank 1
tellraw @s[tag=!withdrawing] {"text":"You don't have that many to withdraw!","color":"red"}
scoreboard players set @s[tag=!withdrawing] withdraw 0