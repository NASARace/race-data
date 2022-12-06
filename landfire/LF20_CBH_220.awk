# awk script to produce color table from Canopy Base Height (CBH) CSV file:
#  1,CBH = 01 meters X 10,CBH = 00.1 meters,255,170,0,1.000000,0.666667,0.000000

BEGIN { 
  FS = ",";
  printf("[\n"); 
}

NR<2 { next }

{ 
  printf("{ color: [%d,%d,%d], descr: \"%s (%d)\" },\n", $4,$5,$6, get_descr($3),$1)
}

function get_descr(s) {
    gsub(/00/,"0", s);
    return s;
}

END {
  printf("]");
}
;
