execute if score @s Diamond_Bank matches 1.. run tag @s add paying
scoreboard players remove @s[tag=paying] Diamond_Bank 1
tell @s[tag=paying] Payment Successful!
tell @s[tag=!paying] Payment Failed, Money Still Owed!