#todo: optimize by subtracting all we can: max of quicktransfer number and balance
#quicktransfer trigger management
scoreboard players remove @s Diamond_Bank 1
tag @s add temp
#if both theres a player to transfer to and we arent in debt now then we are capable of quicktransfer
execute if entity @p[tag=!temp] run tag @s[scores={Diamond_Bank=0..}] add quicktransferring
execute as @s[tag=quicktransferring] run scoreboard players add @p[tag=!temp] Diamond_Bank 1
scoreboard players remove @s[tag=quicktransferring] quicktransfer 1
scoreboard players add @s[tag=!quicktransferring,scores={quicktransfer=1..}] Diamond_Bank 1
tellraw @s[tag=!quicktransferring] {"text":"You don't have that many to transfer / No one else to transfer to!","color":"red"}
scoreboard players set @s[tag=!quicktransferring,scores={quicktransfer=1..}] quicktransfer 0