# landfire.gov data files

this directory contains data to process WMS products from https://landfire.gov/

## color maps

the primary content are JSON files containing color maps that are generated from respective CSV files for the landfire data products, which can be downloaded from https://landfire.gov/library_list.php?cat=1

Since ODIN uses a standard color map format:

    [.. {"color":"#d6604d","code":"131","descr":"Fire, High, One Year"},..]

the CSV files have to be post-processed, for which we provide respective *.awk scripts that are included in this directory.
 
