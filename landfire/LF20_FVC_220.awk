# awk script to produce color map for landfire.gov Fuel Vegetation Cover (FVC) data product:

# VALUE,CLASSNAMES,R,G,B,RED,GREEN,BLUE
# 11,Open Water,0,0,255,0.000000,0.000000,1.000000
# ...

BEGIN { 
  FPAT = "([^,]*)|(\"[^\"]+\")"
  printf("[\n"); 
}

NR==1 { next }

{ 
  clr = sprintf( "#%02x%02x%02x", $3, $4, $5)
  if (!($1 in seen)){
    seen[$1]
    gsub(/"/, "", $2)
    if (NR > 2) printf(",\n")
    printf("{\"color\":\"%s\",\"code\":\"%s\",\"descr\":\"%s\"}", clr, $1, $2)
  }
}

END {
  printf("\n]");
}
;
