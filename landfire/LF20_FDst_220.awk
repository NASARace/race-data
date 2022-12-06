# awk script to produce color map for landfire.gov Fuel Vegetation Type (FVT) data product:
# https://landfire.gov/CSV/LF2020/LF20_FDst_220.csv

# VALUE,D_TYPE,D_SEVERITY,D_TIME,R,G,B,RED,GREEN,BLUE
# ...
# 111,Fire,Low,One Year,214,96,77,0.839216,0.376471,0.301961

BEGIN { 
  # field sep has to account for commas in quoted strings
  FPAT = "([^,]*)|(\"[^\"]+\")"
  printf("[\n")
}

NR==1 { next }

{
  clr = sprintf("#%02x%02x%02x", $5,$6,$7);
  if (!($1 in array)) {
    array[$1]
    gsub(/"/, "", $3)
    if (NR > 2) printf(",\n")  
    printf("{\"color\":\"%s\",\"code\":\"%s\",\"descr\":\"%s, %s, %s\"}", clr, $1, $2,$3,$4)
  }
}

END {
  printf("\n]");
}

