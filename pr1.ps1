#define two arrays
$a1 = @(1, 2, 3)
$a2 = @(4, 5, 6)

#define empty array
$a3 = @()

#add new values to arrays
$a3 += $a1[0] + $a2[0]
$a3 += $a1[1] + $a2[1]
$a3 += $a1[2] + $a2[2]

#echo array3
$a3