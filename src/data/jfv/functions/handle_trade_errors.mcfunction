#needs counting to already be done
#errors that are already procedurally checked to be logically impossible are not checked here
scoreboard players set #global error_code 0
execute if score #global offerer_flag_counter matches 2.. run scoreboard players set #global error_code 1
execute if score #global accepter_flag_counter matches 2.. run scorebaord players set #global error_code 2
execute if score #global offerer_flag_counter matches 1 if score #global offerer_counter matches 0.. run scoreboard players set #global error_code 3
execute if score #global accepter_flag_counter matches 1 if score #global accepter_counter matches 0.. run scoreboard players set #global error_code 4
execute if score #global offerer_flag_counter matches 0 if score #global offerer_counter matches 1.. run scoreboard players set #global error_code 5
execute if score #global accepter_flag_counter matches 0 if score #global accepter_counter matches 1.. run scoreboard players set #global error_code 6
execute if score #global error_code matches 1 run tellraw @a {"text":"Error! Multiple offering chests found! All active trades are now reset!", "color":"red"}
execute if score #global error_code matches 2 run tellraw @a {"text":"Error! Multiple accepting chests found! All active trades are now reset!", "color":"red"}
execute if score #global error_code matches 3 run tellraw @a {"text":"Error! Stray offering chest! All active trades are now reset!", "color":"red"}
execute if score #global error_code matches 4 run tellraw @a {"text":"Error! Stray accepting chest! All active trades are now reset!", "color":"red"}
execute if score #global error_code matches 5 run tellraw @a {"text":"Error! Stray offerer! All active trades are now reset!", "color":"red"}
execute if score #global error_code matches 6 run tellraw @a {"text":"Error! Stray accepter! All active trades are now reset!", "color":"red"}
execute if score #global error_code matches 1.. run function jfv:end_trade