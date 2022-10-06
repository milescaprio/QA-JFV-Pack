function jfv:sync_storage
execute at @e[tag=offerer_flag] run data modify block ~ ~-0.5 ~ Items set from storage offer2 Items
execute at @e[tag=accepter_flag] run data modify block ~ ~-0.5 ~ Items set from storage offer1 Items