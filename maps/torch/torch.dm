#if !defined(using_map_DATUM)

	#include "torch_announcements.dm"
	#include "torch_antagonism.dm"
	#include "torch_areas.dm"
	#include "torch_define.dm"
	#include "torch_elevator.dm"
	#include "torch_events.dm"
	#include "torch_holodecks.dm"
	#include "torch_lobby.dm"
	#include "torch_machinery.dm"
	#include "torch_map_templates.dm"
	#include "torch_misc_overrides.dm"
	#include "torch_npcs.dm"
	#include "torch_overmap.dm"
	#include "torch_presets.dm"
	#include "torch_procs.dm"
	#include "torch_ranks.dm"
	#include "torch_ranks_scg.dm"
	#include "torch_security_state.dm"
	#include "torch_setup.dm"
	#include "torch_shuttles.dm"
	#include "torch_submaps.dm"
	#include "torch_turfs.dm"
	#include "torch_unit_testing.dm"

	#include "bos/effects/decal.dm"

	#include "bos/items/choco.dm"
	#include "bos/items/tableflags.dm"
	#include "bos/items/underwear.dm"

	#include "bos/items/clothing/lordania-feet.dm"
	#include "bos/items/clothing/lordania-hands.dm"
	#include "bos/items/clothing/lordania-head.dm"
	#include "bos/items/clothing/lordania-suit.dm"
	#include "bos/items/clothing/lordania-under.dm"
	#include "bos/items/clothing/lordanian-accessory.dm"

	#include "bos/items/clothing/terran-accessory.dm"
	#include "bos/items/clothing/terran-feet.dm"
	#include "bos/items/clothing/terran-hands.dm"
	#include "bos/items/clothing/terran-head.dm"
	#include "bos/items/clothing/terran-suit.dm"
	#include "bos/items/clothing/terran-under.dm"

	#include "bos/structures/lordbanner.dm"
	#include "bos/structures/memorial.dm"
	#include "bos/structures/signs.dm"
	#include "bos/structures/statue.dm"

	#include "datums/access.dm"
	#include "datums/uniforms.dm"
	#include "datums/uniforms_fleet.dm"
	#include "datums/uniforms_terran.dm"
	#include "datums/uniforms_marine-corps.dm"
	#include "datums/game_modes/torch_traitor.dm"
	#include "datums/game_modes/torch_revolution.dm"
	#include "datums/game_modes/torch_siege.dm"
	#include "datums/game_modes/torch_meteor.dm"
	#include "datums/game_modes/torch_uprising.dm"
	#include "datums/reports/command.dm"
	#include "datums/reports/corporate.dm"
	#include "datums/reports/exploration.dm"
	#include "datums/reports/engineering.dm"
	#include "datums/reports/medical.dm"
	#include "datums/reports/science.dm"
	#include "datums/reports/security.dm"
	#include "datums/reports/solgov.dm"
	#include "datums/reports/deck.dm"
	#include "datums/shackle_law_sets.dm"
	#include "datums/supplypacks/security.dm"
	#include "datums/supplypacks/science.dm"
	#include "datums/department_exploration.dm"

	#include "game/antagonist/outsider/deathsquad.dm"
	#include "game/antagonist/outsider/ert.dm"
	#include "game/antagonist/outsider/foundation.dm"
	#include "game/antagonist/outsider/mercenary.dm"
	#include "game/antagonist/outsider/raider.dm"

	#include "infantry/firearms.dm"
	#include "infantry/outfits.dm"
	#include "infantry/storage.dm"
	#include "infantry/vending.dm"
	#include "infantry/hardsuit.dm"

	#include "items/cards_ids.dm"
	#include "items/encryption_keys.dm"
	#include "items/headsets.dm"
	#include "items/items.dm"
	#include "items/machinery.dm"
	#include "items/manuals.dm"
	#include "items/stamps.dm"
	#include "items/uniform_vendor.dm"
	#include "items/rigs.dm"
	#include "items/solbanner.dm"
	#include "items/explo_shotgun.dm"
	#include "items/mecha.dm"
	#include "items/memos.dm"

	#include "../../packs/faction_iccgn/_pack.dm"

	#include "items/clothing/ec_skillbadges.dm"
	#include "items/clothing/solgov-accessory.dm"
	#include "items/clothing/solgov-armor.dm"
	#include "items/clothing/solgov-feet.dm"
	#include "items/clothing/solgov-hands.dm"
	#include "items/clothing/solgov-head.dm"
	#include "items/clothing/solgov-suit.dm"
	#include "items/clothing/solgov-under.dm"

	#include "items/weapon/storage/wallets.dm"

	#include "job/torch_departments.dm"
	#include "job/torch_access.dm"
	#include "job/torch_jobs.dm"
	#include "job/command_jobs.dm"
	#include "job/engineering_jobs.dm"
	#include "job/medical_jobs.dm"
	#include "job/misc_jobs.dm"
	#include "job/security_jobs.dm"
	#include "job/marine_jobs.dm"
	#include "job/aux_jobs.dm"
	#include "job/research_jobs.dm"

	#include "job/outfits/torch_outfits.dm"
	#include "job/outfits/command_outfits.dm"
	#include "job/outfits/sortthislater_outfits.dm"
	#include "job/outfits/engineering_outfits.dm"
	#include "job/outfits/exploration_outfits.dm"
	#include "job/outfits/medical_outfits.dm"
	#include "job/outfits/misc_outfits.dm"
	#include "job/outfits/security_outfits.dm"
	#include "job/outfits/service_outfits.dm"
	#include "job/outfits/supply_outfits.dm"
	#include "job/outfits/marine_outfits.dm"

	#include "language/human/euro.dm"
	#include "language/human/misc/spacer.dm"

	#include "machinery/apc_shuttle.dm"
	#include "machinery/keycard authentication.dm"
	#include "machinery/suit_storage.dm"

	#include "outfits/scgec.dm"

	#include "robot/module_flying_surveyor.dm"

	#include "structures/signs.dm"
	#include "structures/closets.dm"
	#include "structures/closets/closet_appearances.dm"
	#include "structures/closets/command.dm"
	#include "structures/closets/engineering.dm"
	#include "structures/closets/medical.dm"
	#include "structures/closets/misc.dm"
	#include "structures/closets/research.dm"
	#include "structures/closets/security.dm"
	#include "structures/closets/services.dm"
	#include "structures/closets/supply.dm"
	#include "structures/closets/exploration.dm"

	#include "loadout/_defines.dm"
	#include "loadout/loadout_accessories.dm"
	#include "loadout/loadout_accessories_boh.dm"
	#include "loadout/loadout_ec_skillbadges.dm"
	#include "loadout/loadout_eyes.dm"
	#include "loadout/loadout_gloves.dm"
	#include "loadout/loadout_head.dm"
	#include "loadout/loadout_head_boh.dm"
	#include "loadout/loadout_shoes.dm"
	#include "loadout/loadout_suit.dm"
	#include "loadout/loadout_suit_boh.dm"
	#include "loadout/loadout_uniform.dm"
	#include "loadout/loadout_xeno.dm"
	#include "loadout/loadout_augments.dm"
	#include "loadout/loadout_sikits.dm"
	#include "loadout/loadout_military.dm"
	#include "loadout/~defines.dm"

	#include "torch1_deck5.dmm"
	#include "torch2_deck4.dmm"
	#include "torch3_deck3.dmm"
	#include "torch4_deck2.dmm"
	#include "torch5_deck1.dmm"
	#include "torch6_bridge.dmm"
	#include "z1_admin.dmm"
	#include "z2_transit.dmm"

	#include "../away/empty.dmm"
	#include "../away/rawl/rawl.dm"
	#include "../away/solship/solship.dm"
	#include "../away/mining/mining.dm"
	#include "../away/derelict/derelict.dm"
	#include "../away/bearcat/bearcat.dm"
	#include "../away/lost_supply_base/lost_supply_base.dm"
	#include "../away/smugglers/smugglers.dm"
	#include "../away/magshield/magshield.dm"
	#include "../away/casino/casino.dm"
	#include "../away/yacht/yacht.dm"
	#include "../away/venera/venera.dm"
	#include "../away/blueriver/blueriver.dm"
	#include "../away/slavers/slavers_base.dm"
	#include "../away/mobius_rift/mobius_rift.dm"
	#include "../away/errant_pisces/errant_pisces.dm"
	#include "../away/lar_maria/lar_maria.dm"
//	#include "../away/voxship/voxship.dm"
	#include "../away/skrellscoutship/skrellscoutship.dm"
	#include "../away/meatstation/meatstation.dm"
	#include "../away/miningstation/miningstation.dm"
	#include "../away/mininghome/mininghome.dm"
	#include "../away/scavver/scavver_gantry.dm"

	#include "../event/iccgn_ship/icgnv_hound.dm"


	#define using_map_DATUM /datum/map/torch

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Torch

#endif
