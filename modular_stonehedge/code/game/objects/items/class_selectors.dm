//By DREAMKEEP, Vide Noir https://github.com/EaglePhntm.
//allows class selection for non adventurer roles.
/obj/item/class_selector
	name = "Book of memories"
	desc = "Activate to remember."
	icon = 'icons/obj/library.dmi'
	icon_state ="book1"
	embedding = list("embedded_pain_multiplier" = 0, "embed_chance" = 0, "embedded_fall_chance" = 0)
	var/datum/job/roguetown/intended_job
	var/inventory_items = list()
	var/classes = list()

/obj/item/class_selector/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOEMBED, TRAIT_GENERIC)

//guildmaster
/obj/item/class_selector/veteran/attack_self(mob/living/carbon/human/H)
	. = ..()
	//basicest classes basically
	classes = list(
	"Warrior",
	"Rogue",
	"Cleric",
	"Mage",
	"Ranger"
	)
	//todo add more classes.
	var/classchoice = input("Choose your past", "Available archetypes") as anything in classes
	switch(classchoice)
		if("Warrior")
			inventory_items = list(
				/obj/item/clothing/neck/roguetown/bervor,
				/obj/item/clothing/suit/roguetown/armor/plate/scale,
				/obj/item/clothing/suit/roguetown/armor/chainmail,
				/obj/item/clothing/under/roguetown/chainlegs,
				/obj/item/clothing/shoes/roguetown/boots/armor,
				/obj/item/storage/belt/rogue/leather/black,
				/obj/item/rogueweapon/sword/sabre,
				/obj/item/storage/belt/rogue/pouch/coins/rich,
				/obj/item/storage/backpack/rogue/satchel,
				/obj/item/rogueweapon/huntingknife/idagger/steel/special,
				/obj/item/storage/keyring/veteran
			)
			if(H.mind)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 6, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 6, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 5, TRUE)		//Actual cancer but he fucks. Hard.
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 4, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 5, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 4, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 4, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 4, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 2, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 3, TRUE)
				H.change_stat("strength", 2)
				H.change_stat("intelligence", 1)
				H.change_stat("constitution", 2)
				H.change_stat("endurance", 2)
			ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			dressup(H, inventory_items)
		if("Rogue")
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/rogue_vanish)
			inventory_items = list(
				/obj/item/clothing/neck/roguetown/bervor,
				/obj/item/clothing/shoes/roguetown/boots/armor,
				/obj/item/storage/belt/rogue/leather,
				/obj/item/clothing/gloves/roguetown/chain,
				/obj/item/clothing/wrists/roguetown/hiddenblade,
				/obj/item/storage/backpack/rogue/satchel,
				/obj/item/gun/ballistic/revolver/grenadelauncher/crossbow,
				/obj/item/quiver/Pbolts,
				/obj/item/rogueweapon/sword/estoc,
				/obj/item/lockpickring/mundane,
				/obj/item/rogueweapon/huntingknife/idagger/steel/parrying,
				/obj/item/storage/keyring/veteran,
				/obj/item/storage/belt/rogue/pouch/coins/rich,
			)
			if(H.gender == FEMALE) //funny
				inventory_items += /obj/item/clothing/suit/roguetown/armor/leather/studded/bikini
				inventory_items += /obj/item/clothing/suit/roguetown/armor/chainmail/bikini
				inventory_items += /obj/item/clothing/under/roguetown/chainlegs/fishnet
			else
				inventory_items += /obj/item/clothing/suit/roguetown/armor/leather/studded
				inventory_items += /obj/item/clothing/suit/roguetown/armor/chainmail
				inventory_items += /obj/item/clothing/under/roguetown/chainlegs
			if(H.mind)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 5, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 5, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 6, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 6, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 5, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 4, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 4, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 6, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 6, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/stealing, 6, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3 , TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/craft/hunting, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/craft/engineering, 1, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/lockpicking, 4, TRUE)
			ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_USEMAGIC, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)
			H.change_stat("perception", 1)
			H.change_stat("speed", 4)
			H.change_stat("intelligence", 2)
			dressup(H, inventory_items)
		if("Cleric")
			inventory_items = list(
				/obj/item/clothing/neck/roguetown/bervor,
				/obj/item/clothing/suit/roguetown/armor/plate/scale,
				/obj/item/clothing/gloves/roguetown/chain,
				/obj/item/clothing/shoes/roguetown/boots/armor,
				/obj/item/storage/belt/rogue/leather/black,
				/obj/item/rogueweapon/mace/steel,
				/obj/item/storage/belt/rogue/pouch/coins/rich,
				/obj/item/storage/backpack/rogue/satchel,
				/obj/item/rogueweapon/shield/wood,
				/obj/item/rogueweapon/huntingknife/idagger/steel/parrying,
				/obj/item/storage/keyring/veteran,
			)
			if(H.gender == FEMALE) //funny
				inventory_items += /obj/item/clothing/suit/roguetown/armor/chainmail/bikini
				inventory_items += /obj/item/clothing/under/roguetown/chainlegs/fishnet
			else
				inventory_items += /obj/item/clothing/suit/roguetown/armor/chainmail
				inventory_items += /obj/item/clothing/under/roguetown/chainlegs
			var/datum/devotion/C = new /datum/devotion(H, H.patron)
			switch(H.patron?.type)
				if(/datum/patron/divine/astrata)
					inventory_items += /obj/item/clothing/neck/roguetown/psicross/astrata
				if(/datum/patron/inhumen/zizo)
					inventory_items += /obj/item/clothing/neck/roguetown/psicross/skull
				if(/datum/patron/divine/noc)
					inventory_items += /obj/item/clothing/neck/roguetown/psicross/noc
					H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 2, TRUE)
					H.mind.adjust_spellpoints(2)
					H.verbs += list(/mob/living/carbon/human/proc/magicreport, /mob/living/carbon/human/proc/magiclearn)
					H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
				if(/datum/patron/divine/dendor)
					inventory_items += /obj/item/clothing/neck/roguetown/psicross/dendor
					H.mind.adjust_skillrank_up_to(/datum/skill/magic/druidic, 2, TRUE) // enough to craft druid mask, at least
				if(/datum/patron/divine/necra)
					inventory_items += /obj/item/clothing/neck/roguetown/psicross/necra
				if(/datum/patron/divine/pestra)
					inventory_items += /obj/item/clothing/neck/roguetown/psicross/pestra
				if(/datum/patron/divine/eora) //Eora content from Stonekeep
					inventory_items += /obj/item/clothing/neck/roguetown/psicross/eora
			C.grant_spells_cleric(H)
			if(H.mind)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 4, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 2, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 2, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 6, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 5, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 4, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 6, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 6, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 3, TRUE)
			H.change_stat("strength", 1)
			H.change_stat("constitution", 2)
			H.change_stat("endurance", 2) // Stronger but less intelligent/quick compared to life clerics.
			H.change_stat("intelligence", 2)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_USEMAGIC, TRAIT_GENERIC)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
			H.mind.AddSpell(new	/obj/effect/proc_holder/spell/targeted/churn)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/bladeward5e)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/conjure/createbonfire5e)
			H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
			dressup(H, inventory_items)
		if("Mage")
			inventory_items = list(
				/obj/item/clothing/neck/roguetown/bervor,
				/obj/item/clothing/head/roguetown/roguehood/mage,
				/obj/item/clothing/suit/roguetown/shirt/robe/mageblue,
				/obj/item/clothing/gloves/roguetown/chain,
				/obj/item/clothing/shoes/roguetown/boots/armor,
				/obj/item/storage/belt/rogue/leather/black,
				/obj/item/rogueweapon/woodstaff,
				/obj/item/storage/belt/rogue/pouch/coins/rich,
				/obj/item/storage/backpack/rogue/satchel,
				/obj/item/reagent_containers/glass/bottle/rogue/manapot,
				/obj/item/rogueweapon/huntingknife/idagger/steel/parrying,
				/obj/item/storage/keyring/veteran,
			)
			if(H.gender == FEMALE) //funny
				inventory_items += /obj/item/clothing/suit/roguetown/armor/chainmail/bikini
				inventory_items += /obj/item/clothing/under/roguetown/chainlegs/fishnet
			else
				inventory_items += /obj/item/clothing/suit/roguetown/armor/chainmail
				inventory_items += /obj/item/clothing/under/roguetown/chainlegs
			H.mind.adjust_spellpoints(5)
			H.verbs += list(/mob/living/carbon/human/proc/magicreport, /mob/living/carbon/human/proc/magiclearn)
			H.set_blindness(0)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 5, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 5, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 5, TRUE)
			H.change_stat("intelligence", 3)
			H.change_stat("constitution", 2)
			H.change_stat("endurance", 2)
			//cant really give him much legendaries in this point cause mf is a magician, cant teach arcane. So he will get artificer instead
			ADD_TRAIT(H, TRAIT_ARTIFICER, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_LEARNMAGIC, TRAIT_GENERIC)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fireball/greater)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/acidsplash5e)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/rayoffrost5e)
			dressup(H, inventory_items)
		if("Ranger")
			inventory_items = list(
				/obj/item/clothing/neck/roguetown/bervor,
				/obj/item/quiver/arrows,
				/obj/item/clothing/under/roguetown/trou/leather/advanced,
				/obj/item/reagent_containers/glass/bottle/waterskin,
				/obj/item/clothing/wrists/roguetown/bracers/leather,
				/obj/item/clothing/gloves/roguetown/chain,
				/obj/item/clothing/shoes/roguetown/boots/armor,
				/obj/item/storage/belt/rogue/leather/black,
				/obj/item/storage/belt/rogue/pouch/coins/rich,
				/obj/item/storage/backpack/rogue/satchel,
				/obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow,
				/obj/item/rogueweapon/huntingknife/idagger/steel/parrying,
				/obj/item/flashlight/flare/torch/lantern,
				/obj/item/reagent_containers/glass/bottle/rogue/trekkersdelight,
				/obj/item/storage/keyring/veteran,
			)
			if(H.gender == FEMALE) //funny
				inventory_items += /obj/item/clothing/suit/roguetown/armor/leather/studded/bikini
				inventory_items += /obj/item/clothing/suit/roguetown/armor/chainmail/bikini
				inventory_items += /obj/item/clothing/under/roguetown/chainlegs/fishnet
			else
				inventory_items += /obj/item/clothing/suit/roguetown/armor/leather/studded
				inventory_items += /obj/item/clothing/suit/roguetown/armor/chainmail
				inventory_items += /obj/item/clothing/under/roguetown/chainlegs
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 6, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 5, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 6, TRUE) //cant teach bows either, grim.
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 5, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 5, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/hunting, 5, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 5, TRUE)
			H.change_stat("perception", 4)
			H.change_stat("endurance", 2)
			H.change_stat("speed", 2)
			ADD_TRAIT(H, TRAIT_BLINDFIGHTING, TRAIT_GENERIC)
			if(!HAS_TRAIT(H, TRAIT_NIGHT_VISION))
				ADD_TRAIT(H, TRAIT_NIGHT_VISION, "[type]")
				H.update_sight()
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_BOG_TREKKING, TRAIT_GENERIC)
			if(!H.has_language(/datum/language/elvish))
				H.grant_language(/datum/language/elvish)
				to_chat(H, span_info("I can speak Elvish with ,e before my speech."))
			dressup(H, inventory_items)

/obj/item/class_selector/proc/equip_items(mob/living/carbon/human/H, list/items)
    for(var/item_path in items)
        var/obj/item/I = new item_path(get_turf(H))
        if(istype(I, /obj/item/clothing/under))
            H.equip_to_slot_if_possible(I, SLOT_PANTS)
        else if(istype(I, /obj/item/clothing/suit/roguetown/shirt))
            H.equip_to_slot_if_possible(I, SLOT_SHIRT)
        else if(istype(I, /obj/item/clothing/suit))
            H.equip_to_slot_if_possible(I, SLOT_ARMOR)
        else if(istype(I, /obj/item/clothing/shoes))
            H.equip_to_slot_if_possible(I, SLOT_SHOES)
        else if(istype(I, /obj/item/storage/belt))
            H.equip_to_slot_if_possible(I, SLOT_BELT)
        else if(istype(I, /obj/item/clothing/gloves))
            H.equip_to_slot_if_possible(I, SLOT_GLOVES)
        else if(istype(I, /obj/item/clothing/head))
            H.equip_to_slot_if_possible(I, SLOT_HEAD)
        else if(istype(I, /obj/item/clothing/neck))
            H.equip_to_slot_if_possible(I, SLOT_NECK)
        else if(istype(I, /obj/item/clothing/wrists))
            H.equip_to_slot_if_possible(I, SLOT_WRISTS)
        else if(istype(I, /obj/item/storage/backpack))
            H.equip_to_slot_if_possible(I, SLOT_BACK)
        else if(istype(I, /obj/item/clothing/cloak))
            H.equip_to_slot_if_possible(I, SLOT_CLOAK)
        else
            H.put_in_hands(I)
    qdel(src)

/obj/item/class_selector/acadmage
	name = "Academy Spellbook"
	desc = "A leather-bound tome containing the specialized teachings of the Academy. It allows a mage to choose their magical focus."

/obj/item/class_selector/acadmage/attack_self(mob/living/carbon/human/H)
    . = ..()
    classes = list(
        "Evoker",
        "Guardmage",
        "Scholar"
    )
    var/classchoice = input("Choose your specialization", "Available paths") as anything in classes
    switch(classchoice)
        if("Evoker")
            if(H.mind)
                H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 4, TRUE)
                H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 4, TRUE)
                H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 2, TRUE)
                H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 1, TRUE)
                H.change_stat("strength", -2)
                H.change_stat("constitution", -1)
                H.change_stat("intelligence", 3)
                H.change_stat("perception", 1)
                H.mind.adjust_spellpoints(4)
            ADD_TRAIT(H, TRAIT_FIENDKISS, TRAIT_GENERIC)
            H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/push_spell)
            H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/mindsliver5e)
            H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/spitfire)
            equip_items(H, list(
                /obj/item/clothing/suit/roguetown/shirt/undershirt/puritan,
                /obj/item/clothing/under/roguetown/tights/black,
                /obj/item/clothing/shoes/roguetown/boots,
                /obj/item/rogueweapon/woodstaff,
            ))

        if("Guardmage")
            if(H.mind)
                H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 2, TRUE)
                H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
                H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
                H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
                H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
                H.change_stat("strength", 2)
                H.change_stat("constitution", 2)
                H.change_stat("speed", 1)
                H.change_stat("endurance", 2)
                H.change_stat("intelligence", 0)
                H.mind.adjust_spellpoints(2)
            ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
            ADD_TRAIT(H, TRAIT_CHARGER, TRAIT_GENERIC)
            ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
            H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/bladeward5e)
            H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/slowdown_spell_aoe)
            H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/greenflameblade5e)
            equip_items(H, list(
                /obj/item/clothing/suit/roguetown/armor/gambeson,
                /obj/item/clothing/under/roguetown/trou/leather,
                /obj/item/clothing/shoes/roguetown/boots,
                /obj/item/rogueweapon/sword/rapier
            ))

        if("Scholar")
            if(H.mind)
                H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 4, TRUE)
                H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 4, TRUE)
                H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 3, TRUE)
                H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3, TRUE)
                H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 3, TRUE)
                H.change_stat("strength", -2)
                H.change_stat("constitution", -1)
                H.change_stat("intelligence", 4)
                H.change_stat("perception", 2)
                H.mind.adjust_spellpoints(3)
            ADD_TRAIT(H, TRAIT_ARTIFICER, TRAIT_GENERIC)
            ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)
            ADD_TRAIT(H, TRAIT_SOUL_EXAMINE, TRAIT_GENERIC)
            ADD_TRAIT(H, TRAIT_SEEDKNOW, TRAIT_GENERIC)
            H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/encodethoughts5e())
            H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/magicstone5e())
            H.mind.AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/rogue_knock())
            equip_items(H, list(
                /obj/item/clothing/suit/roguetown/shirt/undershirt/puritan,
                /obj/item/clothing/under/roguetown/tights/black,
                /obj/item/clothing/shoes/roguetown/boots,
                /obj/item/rogueweapon/woodstaff
            ))

/obj/item/class_selector/acadarchmage
	name = "Archmage's Grand Grimoire"
	desc = "An ornate tome bound in rich leather and adorned with mystical runes. It contains the highest teachings of the Academy, allowing an Archmage to choose their mastery."

/obj/item/class_selector/acadarchmage/attack_self(mob/living/carbon/human/H)
    . = ..()
    classes = list(
        "Arcanist",
        "Battlemage",
        "Professor"
    )
    var/classchoice = input("Choose your mastery", "Available paths") as anything in classes
    switch(classchoice)
        if("Arcanist")
            if(H.mind)
                H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 6, TRUE)
                H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 6, TRUE)
                H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 4, TRUE)
                H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 2, TRUE)
                H.change_stat("strength", -3)
                H.change_stat("constitution", -2)
                H.change_stat("intelligence", 5)
                H.change_stat("perception", 2)
                H.mind.adjust_spellpoints(7)
            ADD_TRAIT(H, TRAIT_FIENDKISS, TRAIT_GENERIC)
            to_chat(H, span_notice("You have chosen the path of the Arcanist, mastering the highest forms of pure destructive and eldritch magic."))
            H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/arcyne_storm)
            H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/firebolt5e)
            H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/rayoffrost5e)
            H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/invisibility)
            H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/mindsliver5e)
            H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/eldritchblast5e)
            H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/chilltouch5e)
            equip_items(H, list(
                /obj/item/clothing/suit/roguetown/shirt/undershirt/puritan,
                /obj/item/clothing/under/roguetown/tights/black,
                /obj/item/clothing/shoes/roguetown/boots,
            ))

        if("Battlemage")
            if(H.mind)
                H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 4, TRUE)
                H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 6, TRUE)
                H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 5, TRUE)
                H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 4, TRUE)
                H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)
                H.change_stat("strength", 3)
                H.change_stat("constitution", 3)
                H.change_stat("speed", 2)
                H.change_stat("endurance", 3)
                H.change_stat("intelligence", 1)
                H.mind.adjust_spellpoints(3)
            ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
            ADD_TRAIT(H, TRAIT_BREADY, TRAIT_GENERIC)
            ADD_TRAIT(H, TRAIT_MISSILESNARING, TRAIT_GENERIC)
            ADD_TRAIT(H, TRAIT_CHARGER, TRAIT_GENERIC)
            ADD_TRAIT(H, TRAIT_STRONGTHROW, TRAIT_GENERIC)
            ADD_TRAIT(H, TRAIT_BLINDFIGHTING, TRAIT_GENERIC)
            ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
            to_chat(H, span_notice("You have chosen the path of the Battlemage, mastering the art of combining martial combat with magical enhancement."))
            H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/bladeward5e)
            H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/slowdown_spell_aoe)
            H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/featherfall)
            H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/spitfire)
            H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/blade_burst)
            H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/greenflameblade5e)
            H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/longjump)
            equip_items(H, list(
                /obj/item/clothing/suit/roguetown/armor/chainmail,
                /obj/item/clothing/under/roguetown/chainlegs,
                /obj/item/clothing/shoes/roguetown/boots,
                /obj/item/rogueweapon/sword/estoc,
                /obj/item/rogueweapon/woodstaff,
            ))

        if("Professor")
            if(H.mind)
                H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 6, TRUE)
                H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 6, TRUE)
                H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 5, TRUE)
                H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 5, TRUE)
                H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 4, TRUE)
                H.change_stat("strength", -3)
                H.change_stat("constitution", -2)
                H.change_stat("intelligence", 6)
                H.change_stat("perception", 3)
                H.mind.adjust_spellpoints(5)
            ADD_TRAIT(H, TRAIT_ARTIFICER, TRAIT_GENERIC)
            ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)
            ADD_TRAIT(H, TRAIT_SOUL_EXAMINE, TRAIT_GENERIC)
            ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC)
            ADD_TRAIT(H, TRAIT_SEEDKNOW, TRAIT_GENERIC)
            to_chat(H, span_notice("You have chosen the path of the Professor, mastering the scholarly and supportive aspects of magic."))
            H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/encodethoughts5e)
            H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/magicstone5e)
            H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/mending5e)
            H.mind.AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/rogue_knock)
            H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/ethereal_jaunt)
            H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/guidance5e)
            equip_items(H, list(
                /obj/item/clothing/suit/roguetown/shirt/undershirt/puritan,
                /obj/item/clothing/under/roguetown/tights/black,
                /obj/item/clothing/shoes/roguetown/boots,
                /obj/item/rogueweapon/woodstaff,
                /obj/item/scrying,
            ))

/obj/item/class_selector/proc/dressup(mob/living/carbon/human/H, list/inventory_items)
	to_chat(H, span_warning("I shouldn't move until I am done dressing up."))
	for(var/obj/item/invitem as anything in inventory_items)
		var/spawneditem = new invitem(H.loc)
		H.pickup_and_wear(spawneditem)
	qdel(src)
