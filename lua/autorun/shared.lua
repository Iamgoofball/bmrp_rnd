print("INIT RECIPES")
Recipes = {}
Recipes[1] = {
			name = "Steyr AUG",
			ingredients = {copper_ore = 5, gold_ore = 5, silver_ore = 5, iron_ore = 5},
			crafting_result = "tfcss_aug"
			}
Recipes[2] = {
			name = "AWP",
			ingredients = {copper_ore = 5, gold_ore = 10, silver_ore = 5, iron_ore = 5},
			crafting_result = "tfcss_awp"
			}
Recipes[3] = {
			name = "P90",
			ingredients = {copper_ore = 10, gold_ore = 0, silver_ore = 0, iron_ore = 0},
			crafting_result = "tfcss_p90"
			}
Recipes[4] = {
			name = "Mac10",
			ingredients = {copper_ore = 5, gold_ore = 0, silver_ore = 0, iron_ore = 0},
			crafting_result = "tfcss_mac10_alt"
			}
Recipes[5] = {
			name = "MP5",
			ingredients = {copper_ore = 10, gold_ore = 10, silver_ore = 0, iron_ore = 0},
			crafting_result = "tfcss_mp5"
			}
Recipes[6] = {
			name = "Pickaxe",
			ingredients = {copper_ore = 0, gold_ore = 0, silver_ore = 0, iron_ore = 2},
			crafting_result = "tfa_nmrih_pickaxe"
			}
Recipes[7] = {
			name = "Chainsaw",
			ingredients = {copper_ore = 0, gold_ore = 15, silver_ore = 0, iron_ore = 0},
			crafting_result = "tfa_nmrih_chainsaw"
			}
Recipes[8] = {
			name = "Gluon Gun",
			ingredients = {copper_ore = 0, gold_ore = 5, silver_ore = 0, iron_ore = 20},
			crafting_result = "weapon_egon"
			}
Recipes[9] = {
			name = "Tau Cannon",
			ingredients = {copper_ore = 5, gold_ore = 20, silver_ore = 5, iron_ore = 20},
			crafting_result = "weapon_gauss"
			}
print(Recipes[1].name)
print(Recipes[2].name)
print(Recipes[3].name)