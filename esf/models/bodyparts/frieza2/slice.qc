$modelname "C:\Dokumente und Einstellungen\Halili\Desktop\bodyparts\frieza2\slice.mdl"
$cd "\Dokumente und Einstellungen\Halili\Desktop\bodyparts\frieza2\"
$cdtexture "\Dokumente und Einstellungen\Halili\Desktop\bodyparts\frieza2\"
$cliptotextures

$scale 1.0

// 0 attachments

// 0 bone controllers

// 16 hit boxes
$hbox 0 "Bip01 Pelvis" -1.880000 -0.840000 -0.840000  2.080000 1.550000 1.480000
$hbox 0 "Bip01 L Leg" -2.140000 -1.680000 0.000000  0.970000 1.460000 5.896171
$hbox 0 "Bip01 L Leg1" -2.440000 -1.260000 -13.110000  2.820000 1.920000 5.340000
$hbox 0 "Bip01 Spine1" -1.570000 -1.420000 -0.420000  1.780000 1.100000 1.339794
$hbox 0 "Bip01 Spine2" -2.490000 -1.640000 -0.200000  2.270000 1.720000 1.096511
$hbox 0 "Bip01 Spine3" -2.400000 -1.970000 -0.640000  2.300000 2.140000 2.520000
$hbox 0 "Bip01 Head" -2.240000 -1.430000 -0.550000  2.450000 1.980000 4.290000
$hbox 0 "Bip01 L Arm1" -1.390000 -1.400000 -1.080000  3.970000 0.990000 3.200000
$hbox 0 "Bip01 R Arm1" -1.340000 -0.990000 -1.050000  0.900000 1.400000 3.280000
$hbox 0 "Bip01 R Arm2" -1.270000 -1.290000 0.000000  0.840000 1.320000 2.900000
$hbox 0 "Bip01 R Leg" -1.800000 -1.250000 0.000000  1.100000 1.750000 5.896736
$hbox 0 "Bip01 R Leg1" -2.160000 -1.690000 -0.770000  0.750000 1.360000 5.120000
$hbox 0 "tail1" -0.930000 -0.810000 0.000000  1.140000 0.690000 4.120000
$hbox 0 "Bip01 L Arm2" -1.250000 -1.320000 0.000000  0.870000 1.290000 3.010000
$hbox 0 "Bip01 R Foot" -0.840000 0.000000 0.000000  0.790000 1.950000 2.809756
$hbox 0 "Bip01 L Foot" -0.750000 -2.390000 0.000000  0.860000 0.000000 2.809690

$bodygroup body
{
studio "./f2top"
studio "./f2groin"
studio "./f2lhand"
studio "./f2rleg"
studio "./f2lleg"
studio "./f2head"
}

// 2 sequences
$sequence idle "idle" loop fps 30 ACT_IDLE 1 
$sequence shake "shake" loop fps 20 
