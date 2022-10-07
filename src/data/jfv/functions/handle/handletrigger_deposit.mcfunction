#deposit trigger management
execute store success score @s deduceSucess run clear @s diamond 1
execute if score @s deduceSucess matches 1 run tag @s add depositing
scoreboard players reset @s deduceSucess
execute as @s[tag=depositing] run scoreboard players add @s Diamond_Bank 1
execute as @s[tag=depositing] run scoreboard players remove @s deposit 1
tellraw @s[tag=!depositing] {"text":"You don't have that many to deposit!","color":"red"}
execute as @a[tag=!depositing] run scoreboard players set @s deposit 0