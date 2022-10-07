#quicktransfer trigger management
scoreboard players remove @s Diamond_Bank 1
tag @s[scores={Diamond_Bank=0..}] add temp
execute if entity @p[tag=!temp] run tag @s[scores={Diamond_Bank=0..}] add quicktransferring
execute as @s[tag=quicktransferring] run scoreboard players add @p[tag=!quicktransferring] Diamond_Bank 1
scoreboard players remove @s[tag=quicktransferring] quicktransfer 1
scoreboard players add @s[tag=!quicktransferring,scores={quicktransfer=1..}] Diamond_Bank 1
tellraw @s[tag=!quicktransferring,scores={quicktransfer=1..}] {"text":"You don't have that many to transfer!","color":"red"}
scoreboard players set @s[tag=!quicktransferring,scores={quicktransfer=1..}] quicktransfer 0