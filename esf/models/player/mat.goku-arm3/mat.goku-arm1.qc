$modelname "C:\Documents and Settings\Matias Argüello\Escritorio\asd\mat.goku-arm1\mat.goku-arm1.mdl"
$cd "\Documents and Settings\Matias Argüello\Escritorio\asd\mat.goku-arm1\"
$cdtexture "\Documents and Settings\Matias Argüello\Escritorio\asd\mat.goku-arm1\"
$cliptotextures

$scale 1.0

// 3 attachments
$attachment 0 "Bip01 R Hand" 0.800000 0.000000 0.800000 
$attachment 1 "Bip01 R Hand" 0.800000 0.000000 0.800000 
$attachment 2 "Bip01 R Hand" 0.800000 0.000000 0.800000 

// 4 bone controllers
$controller 0 "Bip01 Spine" YR -30 30
$controller 1 "Bip01 Spine1" ZR -30 30
$controller 2 "Bip01 Spine2" ZR -30 30
$controller 3 "Bip01 Spine3" ZR -30 30

// 16 hit boxes
$hbox 0 "Bip01 Pelvis" -0.960000 -0.830000 -0.990000  0.960000 0.323418 1.230000
$hbox 0 "Bip01 L Leg" -1.880000 -1.050000 -0.260000  0.810000 1.330000 4.511430
$hbox 0 "Bip01 L Leg1" -2.490000 -0.690000 -0.760000  0.770000 2.360000 4.399392
$hbox 0 "Bip01 L Foot" -0.730000 -2.840000 -0.230000  1.050000 0.000000 1.861451
$hbox 0 "Bip01 R Leg" -1.790000 -1.280000 -0.250000  0.760000 1.230000 4.511431
$hbox 0 "Bip01 R Leg1" -2.580000 -2.130000 -0.750000  0.530000 1.080000 4.399399
$hbox 0 "Bip01 R Foot" -0.360000 0.000000 -0.230000  1.390000 2.700000 1.861451
$hbox 0 "Bip01 Spine1" -1.450000 -1.020000 -0.550000  1.440000 1.080000 1.206698
$hbox 0 "Bip01 Spine2" -1.910000 -1.450000 -0.420000  1.910000 1.070000 1.448192
$hbox 0 "Bip01 Spine3" -2.200000 -1.240000 -0.280000  2.200000 1.440000 1.665579
$hbox 0 "Bip01 Neck" -2.590000 -0.940000 -0.865206  2.590000 1.220000 0.455974
$hbox 0 "Bip01 Head" -1.370000 -1.300000 -0.530000  1.830000 1.520000 2.620000
$hbox 0 "Bip01 L Arm1" -0.820000 -0.770000 0.000000  1.110000 1.140000 2.980000
$hbox 0 "Bip01 L Arm2" -0.730000 -0.580000 0.000000  0.680000 0.930000 2.578650
$hbox 0 "Bip01 R Arm1" -0.790000 -1.140000 0.000000  1.130000 0.770000 2.960000
$hbox 0 "Bip01 R Arm2" -0.730000 -0.920000 0.000000  0.670000 0.590000 2.531763

$bodygroup byMatias_Esf
{
studio "ssj"
}

// 229 sequences
$sequence look_idle "look_idle" loop fps 14 ACT_IDLE 5 
$sequence idle "idle" loop fps 16 ACT_IDLE 1 
$sequence deep_idle "deep_idle" loop fps 15 ACT_IDLE 4 
$sequence run "run" LX loop fps 70 ACT_RUN 1 
$sequence run2 "run2" LX loop fps 70 ACT_RUN 1 
$sequence turbo_run "turbo_run" loop fps 28 
$sequence run_backward "run_backward" loop fps 35 
$sequence walk2handed "walk2handed" LX loop fps 32 ACT_WALK 1 
$sequence walk "walk" LX loop fps 32 
$sequence walk_backward "walk_backward" loop fps 25 
$sequence jump "jump" fps 28 ACT_HOP 1 
$sequence long_jump "long_jump" LX fps 28 ACT_LEAP 1 
$sequence back_flip "back_flip" fps 22 
$sequence grabwall_forward "grabwall_forward" fps 20 
$sequence walljump_forward "walljump_forward" fps 20 
$sequence grabwall_back "grabwall_back" fps 20 
$sequence walljump_back "walljump_back" fps 20 
$sequence grabwall_left "grabwall_left" fps 20 
$sequence walljump_left "walljump_left" fps 20 
$sequence grabwall_right "grabwall_right" fps 20 
$sequence walljump_right "walljump_right" fps 20 
$sequence swim "swim" loop fps 16 ACT_SWIM 1 
$sequence treadwater "treadwater" loop fps 14 ACT_HOVER 1 
$sequence swim_backwards "swim_backwards" loop fps 23 
$sequence ref_powerup "ref_powerup" fps 20 
$sequence ref_powerup_charge "ref_powerup_charge" loop fps 32 
$sequence fly_powerup "fly_powerup" fps 24 
$sequence fly_powerup_charge "fly_powerup_charge" loop fps 30 
$sequence fly_idle "fly_idle" loop fps 15 
$sequence fly_forward "fly_forward" loop fps 18 
$sequence fly_backward "fly_backward" loop fps 18 
$sequence fly_left "fly_left" loop fps 18 
$sequence fly_right "fly_right" loop fps 18 
$sequence fly_up "fly_up" loop fps 18 
$sequence fly_down "fly_down" loop fps 18 
$sequence fly_fall "fly_fall" fps 18 
$sequence swoop_up "swoop_up" loop fps 20 
$sequence swoop_down "swoop_down" loop fps 20 
$sequence swoop_left "swoop_left" loop fps 20 
$sequence swoop_right "swoop_right" loop fps 20 
$sequence swoop_forward "swoop_forward" loop fps 20 
$sequence swoop_backward "swoop_backward" loop fps 20 
$sequence ref_block "ref_block" loop fps 10 
$sequence fly_block "fly_block" loop fps 15 
$sequence ref_forward_swataway "ref_forward_swataway" fps 20 
$sequence ref_right_swataway "ref_right_swataway" fps 20 { event 5004 1 "mat.bardock/golpe1.wav" } 
$sequence ref_left_swataway "ref_left_swataway" fps 20 { event 5004 1 "mat.bardock/golpe1.wav" } 
$sequence blow_down "blow_down" fps 20 { event 7005 1 "1" } { event 5004 1 "mat.bardock/golpe3.wav" } 
$sequence blow_up "blow_up" fps 20 { event 7005 1 "1" } { event 5004 1 "mat.bardock/golpe.wav" } 
$sequence blow_left "blow_left" fps 20 { event 7005 1 "1" } { event 5004 1 "mat.bardock/golpe3.wav" } 
$sequence blow_right "blow_right" fps 20 { event 7005 1 "1" } { event 5004 1 "mat.bardock/golpe.wav" } 
$sequence blow_kick_front "blow_kick_front" fps 20 { event 7005 1 "1" } { event 5004 1 "mat.bardock/golp3.wav" } 
$sequence hit_blow_back "hit_blow_back" loop fps 25 
$sequence hit_blow_back_recover "hit_blow_back_recover" loop fps 25 
$sequence hit_blow_front "hit_blow_front" loop fps 25 
$sequence hit_blow_front_recover "hit_blow_front_recover" loop fps 25 
$sequence hit_blow_down "hit_blow_down" loop fps 25 
$sequence hit_blow_down_recover "hit_blow_down_recover" loop fps 25 
$sequence hit_blow_up "hit_blow_up" loop fps 25 
$sequence hit_blow_up_recover "hit_blow_up_recover" loop fps 25 
$sequence hit_blow_left "hit_blow_left" loop fps 25 
$sequence hit_blow_left_recover "hit_blow_left_recover" loop fps 25 
$sequence hit_blow_right "hit_blow_right" loop fps 25 
$sequence hit_blow_right_recover "hit_blow_right_recover" loop fps 25 
$sequence tumble_forward "tumble_forward" loop fps 28 
$sequence tumble_forward_recover "tumble_forward_recover" loop fps 28 
$sequence tumble_back "tumble_back" loop fps 28 
$sequence tumble_back_recover "tumble_back_recover" loop fps 28 
$sequence tumble_left "tumble_left" loop fps 28 
$sequence tumble_left_recover "tumble_left_recover" loop fps 28 
$sequence tumble_right "tumble_right" loop fps 28 
$sequence tumble_right_recover "tumble_right_recover" loop fps 28 
$sequence lay_ground "lay_ground" loop fps 16 
$sequence lay_ground_recover "lay_ground_recover" fps 26 
$sequence lay_ground2 "lay_ground2" loop fps 16 
$sequence lay_ground_recover2 "lay_ground_recover2" fps 26 
$sequence die_simple "die_simple" fps 18 ACT_DIESIMPLE 1 
$sequence die_backwards1 "die_backwards1" fps 23 ACT_DIEBACKWARD 4 
$sequence die_backwards "die_backwards" fps 24 ACT_DIEBACKWARD 1 
$sequence die_forwards "die_forwards" fps 22 ACT_DIEFORWARD 1 
$sequence die_spin "die_spin" fps 24 ACT_DIE_HEADSHOT 1 
$sequence die_fall_up "die_fall_up" loop fps 20 
$sequence die_fall_up_hit "die_fall_up_hit" fps 20 
$sequence die_fall_down "die_fall_down" loop fps 20 
$sequence die_fall_down_hit "die_fall_down_hit" fps 20 
$sequence deadback "deadback" fps 10 
$sequence deadsitting "deadsitting" fps 10 
$sequence deadstomach "deadstomach" fps 10 
$sequence deadtable "deadtable" fps 10 
$sequence ref_shoot_bean "ref_shoot_bean" fps 16 
$sequence ref_shoot2_bean "ref_shoot2_bean" fps 20 
$sequence ref_aim_bean "ref_aim_bean" fps 16 
$sequence ref_aim_dragonball "ref_aim_dragonball" loop fps 16 
$sequence ref_shoot_dragonball "ref_shoot_dragonball_blend1" "ref_shoot_dragonball_blend2" fps 18 
$sequence ref_shoot2_dragonball "ref_shoot2_dragonball" fps 20 
$sequence ref_shoot_kiblast "ref_shoot_kiblast_blend1" "ref_shoot_kiblast_blend2" fps 30 blend XR -65 65 
$sequence ref_shoot2_kiblast "ref_shoot2_kiblast_blend1" "ref_shoot2_kiblast_blend2" fps 30 blend XR -65 65 
$sequence ref_charge_genericbeam "ref_charge_genericbeam" fps 20 
$sequence ref_control_genericbeam "ref_control_genericbeam" loop fps 20 
$sequence ref_shoot_genericbeam "ref_shoot_genericbeam" fps 20 
$sequence ref_beam_push "ref_beam_push" loop fps 20 
$sequence change_long "change_long" fps 24 
$sequence change_normal "change_normal" loop fps 24 
$sequence change_finish "change_finish" fps 24 
$sequence throw_land "throw_land" fps 25 
$sequence throw_recover_jump "throw_recover_jump" fps 30 
$sequence throw_recover_forward "throw_recover_forward" fps 30 
$sequence throw_recover_backward "throw_recover_backward" fps 30 
$sequence throw_recover_left "throw_recover_left" fps 30 
$sequence throw_recover_right "throw_recover_right" fps 30 
$sequence ref_charge_kamehameha "ref_charge_kamehameha" fps 18 
$sequence ref_control_kamehameha "ref_control_kamehameha" loop fps 14 
$sequence ref_charge_spiritbomb "ref_charge_spiritbomb" fps 18 
$sequence ref_shoot_spiritbomb "ref_shoot_spiritbomb" fps 24 
$sequence ref_charge2_spiritbomb "ref_charge2_spiritbomb" fps 22 
$sequence ref_shoot2_spiritbomb "ref_shoot2_spiritbomb" fps 26 
$sequence ref_charge_kametorpedo "ref_charge_kametorpedo" loop fps 20 
$sequence ref_shoot_kametorpedo "ref_shoot_kametorpedo" fps 22 
$sequence ref_shoot2_kametorpedo "ref_shoot2_kametorpedo" fps 20 
$sequence ref_charge_solarflare "ref_charge_solarflare" fps 20 
$sequence ref_shoot_solarflare "ref_shoot_solarflare" fps 16 
$sequence ref_autopunch "ref_autopunch" loop fps 70 { event 5004 13 "g/2.wav" } { event 5004 31 "g/1.wav" } { event 5004 41 "g/2.wav" } { event 5004 55 "g/1.wav" } { event 5004 78 "g/2.wav" } { event 5001 6 } { event 5001 13 } { event 5001 24 } { event 5001 27 } { event 5001 31 } { event 5001 37 } { event 5001 41 } { event 5001 45 } { event 5001 55 } { event 5001 63 } { event 5001 78 } 
$sequence ref_autopunch_hit "ref_autopunch_hit" loop fps 35 
$sequence ref_autopunch_hit_back "ref_autopunch_hit_back" loop fps 70 
$sequence ref_autopunch_spin "ref_autopunch_spin" fps 20 
$sequence ref_autopunch_block "ref_autopunch_block" loop fps 70 
$sequence ref_stance "ref_stance" loop fps 20 
$sequence ref_stun "ref_stun" loop fps 20 
$sequence ref_grapple "ref_grapple" loop fps 20 
$sequence left_weak_attack1 "left_weak_attack1" fps 20 { event 5004 1 "mat.bardock/golpe1.wav" } 
$sequence left_medium_attack1 "left_medium_attack1" fps 20 { event 5004 1 "mat.bardock/golpe1.wav" } 
$sequence left_strong_attack1 "left_strong_attack1" fps 20 { event 7005 1 "2" } { event 7005 14 "0" } { event 5004 1 "mat.bardock/golpe3.wav" } 
$sequence left_weak_attack2 "left_weak_attack2" fps 20 { event 5004 1 "mat.bardock/golpe1.wav" } 
$sequence left_medium_attack2 "left_medium_attack2" fps 20 { event 5004 1 "mat.bardock/golpe2.wav" } 
$sequence left_strong_attack2 "left_strong_attack2" fps 20 { event 5004 1 "mat.bardock/golpe3.wav" } 
$sequence right_weak_attack1 "right_weak_attack1" fps 20 { event 5004 1 "mat.bardock/golpe1.wav" } 
$sequence right_medium_attack1 "right_medium_attack1" fps 20 { event 7005 5 "1" } { event 7005 2 "0" } { event 5004 1 "mat.bardock/golpe2.wav" } 
$sequence right_strong_attack1 "right_strong_attack1" fps 20 { event 5004 1 "mat.bardock/golpe3.wav" } 
$sequence right_weak_attack2 "right_weak_attack2" fps 20 { event 5004 1 "mat.bardock/golpe1.wav" } 
$sequence right_medium_attack2 "right_medium_attack2" fps 20 { event 5004 1 "mat.bardock/golpe2.wav" } 
$sequence right_strong_attack2 "right_strong_attack2" fps 20 { event 5004 1 "mat.bardock/golpe3.wav" } 
$sequence top_weak_attack1 "top_weak_attack1" fps 20 { event 5004 1 "mat.bardock/golpe1.wav" } 
$sequence top_medium_attack1 "top_medium_attack1" fps 20 { event 5004 1 "mat.bardock/golpe2.wav" } 
$sequence top_strong_attack1 "top_strong_attack1" fps 20 { event 7005 1 "1" } { event 7005 7 "0" } { event 5004 1 "mat.bardock/golpe3.wav" } 
$sequence top_weak_attack2 "top_weak_attack2" fps 20 { event 5004 1 "mat.bardock/golpe1.wav" } 
$sequence top_medium_attack2 "top_medium_attack2" fps 20 { event 5004 1 "mat.bardock/golpe2.wav" } 
$sequence top_strong_attack2 "top_strong_attack2" fps 20 { event 5004 1 "mat.bardock/golpe3.wav" } 
$sequence bottom_weak_attack1 "bottom_weak_attack1" fps 20 { event 5004 1 "mat.bardock/golpe1.wav" } 
$sequence bottom_medium_attack1 "bottom_medium_attack1" fps 20 { event 7005 4 "1" } { event 7005 7 "0" } { event 5004 1 "mat.bardock/golpe2.wav" } 
$sequence bottom_strong_attack1 "bottom_strong_attack1" fps 20 { event 7005 7 "1" } { event 5004 1 "mat.bardock/golpe3.wav" } 
$sequence bottom_weak_attack2 "bottom_weak_attack2" fps 20 { event 5004 1 "mat.bardock/golpe1.wav" } 
$sequence bottom_medium_attack2 "bottom_medium_attack2" fps 20 { event 5004 1 "mat.bardock/golpe2.wav" } 
$sequence bottom_strong_attack2 "bottom_strong_attack2" fps 20 { event 5004 1 "mat.bardock/golpe3.wav" } 
$sequence left_weak_attack1_hit "left_weak_attack1_hit" fps 20 
$sequence left_medium_attack1_hit "left_medium_attack1_hit" fps 20 
$sequence left_strong_attack1_hit "left_strong_attack1_hit" fps 20 
$sequence left_weak_attack2_hit "left_weak_attack2_hit" fps 20 
$sequence left_medium_attack2_hit "left_medium_attack2_hit" fps 20 
$sequence left_strong_attack2_hit "left_strong_attack2_hit" fps 20 
$sequence right_weak_attack1_hit "right_weak_attack1_hit" fps 20 
$sequence right_medium_attack1_hit "right_medium_attack1_hit" fps 20 
$sequence right_strong_attack1_hit "right_strong_attack1_hit" fps 20 
$sequence right_weak_attack2_hit "right_weak_attack2_hit" fps 20 
$sequence right_medium_attack2_hit "right_medium_attack2_hit" fps 20 
$sequence right_strong_attack2_hit "right_strong_attack2_hit" fps 20 
$sequence top_weak_attack1_hit "top_weak_attack1_hit" fps 20 
$sequence top_medium_attack1_hit "top_medium_attack1_hit" fps 20 
$sequence top_strong_attack1_hit "top_strong_attack1_hit" fps 20 
$sequence top_weak_attack2_hit "top_weak_attack2_hit" fps 20 
$sequence top_medium_attack2_hit "top_medium_attack2_hit" fps 20 
$sequence top_strong_attack2_hit "top_strong_attack2_hit" fps 20 
$sequence bottom_weak_attack1_hit "bottom_weak_attack1_hit" fps 20 
$sequence bottom_medium_attack1_hit "bottom_medium_attack1_hit" fps 20 
$sequence bottom_strong_attack1_hit "bottom_strong_attack1_hit" fps 20 
$sequence bottom_weak_attack2_hit "bottom_weak_attack2_hit" fps 20 
$sequence bottom_medium_attack2_hit "bottom_medium_attack2_hit" fps 20 
$sequence bottom_strong_attack2_hit "bottom_strong_attack2_hit" fps 20 
$sequence left_weak_attack1_block "left_weak_attack1_block" fps 20 
$sequence left_medium_attack1_block "left_medium_attack1_block" fps 20 
$sequence left_strong_attack1_block "left_strong_attack1_block" fps 20 
$sequence left_weak_attack2_block "left_weak_attack2_block" fps 20 
$sequence left_medium_attack2_block "left_medium_attack2_block" fps 20 
$sequence left_strong_attack2_block "left_strong_attack2_block" fps 20 
$sequence right_weak_attack1_block "right_weak_attack1_block" fps 20 
$sequence right_medium_attack1_block "right_medium_attack1_block" fps 20 
$sequence right_strong_attack1_block "right_strong_attack1_block" fps 20 
$sequence right_weak_attack2_block "right_weak_attack2_block" fps 20 
$sequence right_medium_attack2_block "right_medium_attack2_block" fps 20 
$sequence right_strong_attack2_block "right_strong_attack2_block" fps 20 
$sequence top_weak_attack1_block "top_weak_attack1_block" fps 20 
$sequence top_medium_attack1_block "top_medium_attack1_block" fps 20 
$sequence top_strong_attack1_block "top_strong_attack1_block" fps 20 
$sequence top_weak_attack2_block "top_weak_attack2_block" fps 20 
$sequence top_medium_attack2_block "top_medium_attack2_block" fps 20 
$sequence top_strong_attack2_block "top_strong_attack2_block" fps 20 
$sequence bottom_weak_attack1_block "bottom_weak_attack1_block" fps 20 
$sequence bottom_medium_attack1_block "bottom_medium_attack1_block" fps 20 
$sequence bottom_strong_attack1_block "bottom_strong_attack1_block" fps 20 
$sequence bottom_weak_attack2_block "bottom_weak_attack2_block" fps 20 
$sequence bottom_medium_attack2_block "bottom_medium_attack2_block" fps 20 
$sequence bottom_strong_attack2_block "bottom_strong_attack2_block" fps 20 
$sequence ref_start_throw "ref_start_throw" fps 20 
$sequence ref_start_swung "ref_start_swung" fps 20 
$sequence ref_swinger_slow "ref_swinger_slow" loop fps 30 
$sequence ref_swinger_fast "ref_swinger_fast" loop fps 50 
$sequence ref_swinger_letgo "ref_swinger_letgo" fps 20 
$sequence ref_swung "ref_swung" loop fps 20 
$sequence wall_collide "wall_collide" fps 20 
$sequence wall_idle "wall_idle" loop fps 20 
$sequence wall_autopunched "wall_autopunched" loop fps 70 
$sequence wall_attacked "wall_attacked" fps 20 
$sequence wall_recover "wall_recover" fps 20 
$sequence combo_1 "combo_1" fps 20 { event 5004 1 "mat.gohan-ad/combo.wav" } { event 5001 3 } { event 5001 13 } { event 5001 17 } { event 5001 25 } { event 5001 30 } { event 5001 35 } 
$sequence combo_1_hit "combo_1_hit" fps 20 
$sequence combo_2 "combo_2" fps 20 { event 5004 1 "mat.gohan-ad/combo.wav" } { event 5001 3 } { event 5001 13 } { event 5001 17 } { event 5001 25 } { event 5001 30 } { event 5001 35 } 
$sequence combo_2_hit "combo_2_hit" fps 20 
$sequence fusion_goku "fusion_goku" fps 25 
$sequence ref_charge_kaioken "ref_charge_kaioken" loop fps 25 
$sequence ref_charge_powerbeam "ref_charge_powerbeam" fps 20 
$sequence ref_control_powerbeam "ref_control_powerbeam" loop fps 20 
$sequence ref_charge_masenko "ref_charge_masenko" fps 20 
$sequence ref_control_masenko "ref_control_masenko" loop fps 20 
$sequence ref_charge_finalflash "ref_charge_finalflash" fps 10 
$sequence ref_control_finalflash "ref_control_finalflash" fps 14 
$sequence ref_charge_mouthblast "ref_charge_mouthblast" fps 20 
$sequence ref_control_mouthblast "ref_control_mouthblast" loop fps 20 
$sequence ref_charge_bigbang "ref_charge_bigbang" fps 20 
$sequence ref_shoot_bigbang "ref_shoot_bigbang" fps 20 
$sequence charge_ultra "charge_ultra" fps 15 
