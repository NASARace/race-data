import s3fs

# Use the anonymous credentials to access public data
fs = s3fs.S3FileSystem(anon=True)

# List contents of GOES-16 bucket.
#files = fs.ls('s3://noaa-goes16/')
#print(files)

yr = 2020
startDoY = 229 # DoY
endDoY = 236

# file pattern OR_ABI-L2-FDCC-M6_G17_s20202360456177_e20202360458549_c20202360459091.nc

for d in range(startDoY,endDoY+1):
   for h in range(0,24):
       dirPattern = "noaa-goes16/ABI-L2-FDCC/{}/{:02d}/{}".format(yr,d,h)
       files = fs.ls(dirPattern)
       for f in files:
           print("..downloading ", f) 
           fs.get(f, f.split('/')[-1])

