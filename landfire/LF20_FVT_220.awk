# awk script to produce color map for landfire.gov Fuel Vegetation Type (FVT) data product:

# VALUE,EVT_FUEL,EVT_FUEL_N,R,G,B,RED,GREEN,BLUE
# ..
# 21,21,Bau Developed-Open Space,52,52,52,0.203922,0.203922,0.203922
# ..

BEGIN { 
  # field sep has to account for commas in quoted strings
  FPAT = "([^,]*)|(\"[^\"]+\")"
  printf("[\n")
}

NR==1 { next }

{
  clr = sprintf("#%02x%02x%02x", $4,$5,$6);
  if (!($1 in array)) {
    array[$1]
    gsub(/"/, "", $3)
    if (NR > 2) printf(",\n")  
    printf("{\"color\":\"%s\",\"code\":\"%s\",\"descr\":\"%s\"}", clr, $1, $3)
  }
}

END {
  printf("\n]");
}

