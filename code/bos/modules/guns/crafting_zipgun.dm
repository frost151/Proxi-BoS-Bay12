//GUN PARTS
//These all act like base components that go into construction. They're needed for ALL guns; the end result is determined by a final specification part.
//These parts can all be made using other base materials like steel and aluminum, and/or through a autolathe. Barrels can be substituted with pipes.
///I'm not going to fuck around with Bay's shitty crafting code. Instead, I'm going to use some other functions that arguably perform better.
/obj/item/firearmpart_internals
	name = "firearm internals"
	desc = "A collection of more advanced miscellaneous parts vital to the function of a gun."
	icon = 'icons/bos/obj/crafting_icons.dmi'
	icon_state = "gunparts_internals"
	item_state = "gunparts_internals"
	matter = list(MATERIAL_STEEL = 200)

/obj/item/firearmpart_grip
	name = "firearm grip"
	desc = "A smooth grip. Required to properly hold most guns."
	icon = 'icons/bos/obj/crafting_icons.dmi'
	icon_state = "gunparts_grip"
	item_state = "gunparts_grip"
	matter = list(MATERIAL_STEEL = 50,MATERIAL_ALUMINIUM = 200)

/obj/item/firearmpart_body
	name = "firearm chassis"
	desc = "The hollow exoskeleton of a future gun. Tighten the screws with a screwdriver to begin construction."
	icon = 'icons/bos/obj/crafting_icons.dmi'
	icon_state = "gunparts_chassis"
	item_state = "gunparts_chassis"
	matter = list(MATERIAL_STEEL = 10000)

/obj/item/firearmpart_body/attackby(var/obj/item/W, var/mob/user) //Hee-hoo I hope this works
	if(isScrewdriver(W))
		qdel(src)
		user.put_in_hands(new /obj/item/firearmframe(user))
		to_chat(usr, SPAN_NOTICE("You tighten the screws on the chassis. Now, it needs some internal parts."))
	else
		to_chat(user, SPAN_WARNING("You need a screwdriver to tighten this chassis!"))
		return

/obj/item/firearmpart_barrel
	name = "firearm barrel"
	desc = "A shaped tube which can function as the barrel for a gun."
	icon = 'icons/bos/obj/crafting_icons.dmi'
	icon_state = "gunparts_barrel"
	item_state = "gunparts_barrel"
	matter = list(MATERIAL_STEEL = 1000)

/obj/item/firearmpart_flashpowder
	name = "flashpowder"
	desc = "A tough bottle of flashpowder, critical in the production of munitions. Or improvised explosives."
	icon = 'icons/bos/obj/crafting_icons.dmi'
	icon_state = "gunparts_flashpowder"
	item_state = "gunparts_flashpowder"

///Begin WEAPON SPECIFICATIONS. These are used at the very end of the crafting process to decide what gun is actually made.
/obj/item/firearmpart_spec
	name = "unlabelled armspecs"
	desc = "A unqiue part for the creation of a firearm."
	icon = 'icons/bos/obj/crafting_icons.dmi'
	icon_state = "spec_none"
	item_state = "spec_none"
	matter = list(MATERIAL_STEEL = 5000,MATERIAL_GLASS = 5000,MATERIAL_ALUMINIUM = 5000)

/obj/item/firearmpart_spec/pistol
	name = "pistol barrel"
	icon_state = "spec_pistol"
	item_state = "spec_pistol"

/obj/item/firearmpart_spec/revolver
	name = "revolver cylinder"
	icon_state = "spec_revolver"
	item_state = "spec_revolver"
	matter = list(MATERIAL_STEEL = 6000)

/obj/item/firearmpart_spec/shotgun
	name = "shotgun body"
	icon_state = "spec_shotgun"
	item_state = "spec_shotgun"
	matter = list(MATERIAL_STEEL = 8000)

/obj/item/firearmpart_spec/rifle
	name = "rifle body"
	icon_state = "spec_rifle"
	item_state = "spec_rifle"
	matter = list(MATERIAL_STEEL = 10000)

/obj/item/firearmpart_spec/nail //Currently not available due to how shell casings work fucking up how I wanted nails to work. Keeping here for legacy/future fix material.
	name = "nailgun body"
	icon_state = "spec_nail"
	item_state = "spec_nail"

//Begin FRAMES and CRAFTING STEPS. FRAMES are the construction itself in different levels.
/obj/item/firearmframe
	name = "improvised gun frame"
	desc = "A pile of base parts utilized in the construction of basic firearms."
	icon = 'icons/bos/obj/crafting_icons.dmi'
	icon_state = "weaponcraft0"
	item_state = "weaponcraft0"
	var/buildstate = 0

/obj/item/firearmframe/on_update_icon()
	. = ..()
	icon_state = "weaponcraft[buildstate]"

/obj/item/firearmframe/examine(mob/user)
	. = ..(user)
	switch(buildstate)
		if(0) to_chat(user, "It needs some internal parts if you want it to actually do anything.")
		if(1) to_chat(user, "It has loose parts dangling from its side. Needs to be tightened with a screwdriver.")
		if(2) to_chat(user, "It has internal parts tightened inside of the chassis. It still needs a barrel.")
		if(3) to_chat(user, "It has a loose barrel dangling off of one end. Could use a tightening with a wrench.")
		if(4) to_chat(user, "It has a barrel fastened to one end. It still needs a grip.")
		if(5) to_chat(user, "It has a grip loosely stuck at one side. It needs to be tightened with a screwdriver.")
		if(6) to_chat(user, "The chassis has the shape, but its still a bit wobbly. Looks like it could use some welding.")
		if(7) to_chat(user, "It is nearly complete, but its missing a specification part.")

/obj/item/firearmframe/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/firearmpart_internals))
		if(buildstate == 0)
			user.drop_from_inventory(W)
			qdel(W)
			to_chat(user, "<span class='notice'>You insert the internal parts into the chassis. They need to be tightened still, or else they'll fall out.</span>")
			buildstate++
			update_icon()
			return
		if(buildstate != 0)
			to_chat(user, "<span class='notice'>It already has internal parts. What are you trying to make here, a car?</span>")
			return
	else if(istype(W,/obj/item/screwdriver))
		if(buildstate == 1)
			to_chat(user, "<span class='notice'>You secure the internal parts. Now it shouldn't shatter immediately.</span>")
			buildstate++
			playsound(src.loc, 'sound/items/Screwdriver2.ogg', 100, 1)
			return
		if(buildstate == 5)
			to_chat(user, "<span class='notice'>You secure the grip. Now you can hold it without the whole thing coming apart.</span>")
			buildstate++
			playsound(src.loc, 'sound/items/Screwdriver2.ogg', 100, 1)
			return
	else if(istype(W,/obj/item/firearmpart_barrel || /obj/item/pipe))
		if(buildstate == 2)
			user.drop_from_inventory(W)
			qdel(W)
			to_chat(user, "<span class='notice'>You attach the barrel to one end. Hopefully the correct one. Hopefully.</span>")
			buildstate++
			update_icon()
			return
		if(buildstate != 2)
			to_chat(user, "<span class='notice'>Theres no room for this.</span>")
			return
	else if(istype(W,/obj/item/wrench))
		if(buildstate == 3)
			to_chat(user, "<span class='notice'>You tighten the barrel fixture, and it stops wobbling. You hope it stays that way.</span>")
			buildstate++
			playsound(src.loc, 'sound/items/Ratchet.ogg', 100, 1)
			return
	else if(istype(W,/obj/item/firearmpart_grip))
		if(buildstate == 4)
			user.drop_from_inventory(W)
			qdel(W)
			to_chat(user, "<span class='notice'>You attach the grip, tentatively. It looks like it could still use a bit of support, though.</span>")
			buildstate++
			update_icon()
			return
		if(buildstate != 4)
			to_chat(user, "<span class='notice'>Theres no room for this.</span>")
			return
	else if(istype(W,/obj/item/weldingtool))
		if(buildstate == 6)
			var/obj/item/weldingtool/T = W
			if(T.remove_fuel(5,user))
				if(!src || !T.isOn()) return
				playsound(src.loc, 'sound/items/Welder2.ogg', 100, 1)
			to_chat(user, "<span class='notice'>You secure the improvised rifle's various parts.</span>")
			buildstate++
			update_icon()
		return
	else if(istype(W,/obj/item/firearmpart_spec/pistol)) //HERE BEGINS THE SPECIFICATION PARTS. I HAD TO DO THEM EACH IN INDIVIDUAL BLOCKS. I AM SO, SO SORRY.
		if(buildstate == 7)
			user.drop_from_inventory(W)
			qdel(W)
			to_chat(user, "<span class='notice'>With the specification part installed, you're left with a complete pistol!</span>")
			new /obj/item/gun/projectile/pistol/improvised(get_turf(src))
			qdel(src)
		return
	else if(istype(W,/obj/item/firearmpart_spec/shotgun))
		if(buildstate == 7)
			user.drop_from_inventory(W)
			qdel(W)
			to_chat(user, "<span class='notice'>With the specification part installed, you're left with a complete shotgun!</span>")
			new /obj/item/gun/projectile/shotgun/pump/improvised(get_turf(src))
			qdel(src)
		return
	else if(istype(W,/obj/item/firearmpart_spec/rifle))
		if(buildstate == 7)
			user.drop_from_inventory(W)
			qdel(W)
			to_chat(user, "<span class='notice'>With the specification part installed, you're left with a complete rifle!</span>")
			new /obj/item/gun/projectile/automatic/assault_rifle/improvised(get_turf(src))
			qdel(src)
		return
	else if(istype(W,/obj/item/firearmpart_spec/nail))
		if(buildstate == 7)
			user.drop_from_inventory(W)
			qdel(W)
			to_chat(user, "<span class='notice'>With the specification part installed, you're left with a complete... nailgun? Why would you make a nailgun?</span>")
			new /obj/item/gun/projectile/pistol/nailgun(get_turf(src))
			qdel(src)
		return
	else if(istype(W,/obj/item/firearmpart_spec/revolver))
		if(buildstate == 7)
			user.drop_from_inventory(W)
			qdel(W)
			to_chat(user, "<span class='notice'>With the specification part installed, you're left with a complete... revolver?</span>")
			new /obj/item/gun/projectile/revolver/improvised_revolver(get_turf(src))
			qdel(src)
		return
