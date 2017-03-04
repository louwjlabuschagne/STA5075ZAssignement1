GCs <- read.table("http://www.physics.mcmaster.ca/~harris/GCS_table.txt", header = F, skip = 39, sep="", nrows=422); 
## check if it has done the right thing

#defintion of columns
#o represents uncertainty
#
headers = c("name", #Galaxy identification
            "id", #Galaxy identification
            "fac.right.ascension.hr", #Galaxy right ascension (decimal hours)
            "fac.declination.deg", #declination (decimal degrees)
            "type", #Morphological type
            "fac.dist", #Galaxy distance,  pc is a parsec and is equal to about 3.26 light-years, 31 trillion kilometres, Mpc is 10^6*pc
            "fac.dist.o", #Galaxy distance uncertainty
            "dist.method", #distance estimation method adopted
            "fac.foreground.extinction", #Foreground extinction,
            "fac.vis.mag", #absolute visual magnitude 
            "fac.vis.mag.o", #absolute visual magnitude estimated uncertainty
            "fac.k.band.mag", #Absolute K-band magnitude (near infrared)
            "fac.k.band.mag.o",#Absolute K-band magnitude uncertainty
            "fac.N.GC",# Estimated total number of globular clusters in the galaxy
            "fac.N.GC.o", #Total number of globular clusters in the galaxy estimated uncertainty,
            "lit.source", #literature source (see reference list following the table)
            "fac.vel.dispersion", #Velocity dispersion of the central bulge of the galaxy
            "fac.vel.dispersion.o", # Velocity dispersion of the central bulge of the galaxy uncertainty
            "fac.radius.half", #Effective radius enclosing half the galaxy light
            "fac.radius.half.o", # Effective radius enclosing half the galaxy light unvertainty
            "fac.dyn.mass", # "Dynamical mass" of galaxy, defined as  (4 R_e sig_e^2 / G)
            "fac.dynl.mass.o", #Dynamical mass uncertainty
            "fac.mass.cluster", #Calculated total mass in the globular cluster system
            "fac.mass.cluster.o",#Calculated total mass in the globular cluster system uncertainty
            "fac.mass.CBH",#Mass of central black hole in the galaxy
            "fac.mass.CBH.upper.o", #Mass of central black hole in the galaxy upper uncertainty
            "fac.mass.CBH.lower.o"); 
names(GCs) = headers

#convert nid to NA for id column
GCs$id[GCs$id == "nid"] = NA

#convert all nd to NA 
GCs$fac.right.ascension.hr[GCs$fac.right.ascension.hr == "nd"] = NA
GCs$fac.declination.deg[GCs$fac.declination.deg == "nd"] = NA
GCs$fac.dist[GCs$fac.dist == "nd"] = NA
GCs$fac.dist.o[GCs$fac.dist.o == "nd"] = NA
GCs$fac.foreground.extinction[GCs$fac.foreground.extinction == "nd"] = NA
GCs$fac.vis.mag[GCs$fac.vis.mag == "nd"] = NA
GCs$fac.vis.mag.o[GCs$fac.vis.mag.o == "nd"] = NA
GCs$fac.k.band.mag[GCs$fac.k.band.mag == "nd"] = NA
GCs$fac.k.band.mag.o[GCs$fac.k.band.mag.o == "nd"] = NA
GCs$fac.N.GC[GCs$fac.N.GC == "nd"] = NA
GCs$fac.N.GC.o[GCs$fac.N.GC.o == "nd"] = NA
GCs$fac.vel.dispersion[GCs$fac.vel.dispersion == "nd"] = NA
GCs$fac.vel.dispersion.o[GCs$fac.vel.dispersion.o == "nd"] = NA
GCs$fac.radius.half[GCs$fac.radius.half == "nd"] = NA
GCs$fac.radius.half.o[GCs$fac.radius.half.o == "nd"] = NA
GCs$fac.dyn.mass[GCs$fac.dyn.mass == "nd"] = NA
GCs$fac.dynl.mass.o[GCs$fac.dynl.mass.o == "nd"] = NA
GCs$fac.mass.cluster[GCs$fac.mass.cluster == "nd"] = NA
GCs$fac.mass.cluster.o[GCs$fac.mass.cluster.o == "nd"] = NA
GCs$fac.mass.CBH[GCs$fac.mass.CBH == "nd"] = NA
GCs$fac.mass.CBH.upper.o[GCs$fac.mass.CBH.upper.o == "nd"] = NA
GCs$fac.mass.CBH.lower.o[GCs$fac.mass.CBH.lower.o == "nd"] = NA

#detected a >3 in NGC, forcefully replacing it with 3 
levels(GCs$fac.N.GC) = c(levels(GCs$fac.N.GC), "3")
GCs$fac.N.GC[GCs$fac.N.GC == ">3"]
GCs$fac.N.GC[GCs$fac.N.GC == ">3"] = "3"

#convert factors to floats
right.ascension.hr = as.numeric(as.character(GCs$fac.right.ascension.hr)); GCs = cbind(GCs, right.ascension.hr)
declination.deg = as.numeric(as.character(GCs$fac.declination.deg)); GCs = cbind(GCs, declination.deg)
dist = as.numeric(as.character(GCs$fac.dist)); GCs = cbind(GCs, dist)
dist.o = as.numeric(as.character(GCs$fac.dist.o)); GCs = cbind(GCs, dist.o)
foreground.extinction = as.numeric(as.character(GCs$fac.foreground.extinction)); GCs = cbind(GCs, foreground.extinction)
vis.mag = as.numeric(as.character(GCs$fac.vis.mag)); GCs = cbind(GCs, vis.mag)
vis.mag.o = as.numeric(as.character(GCs$fac.vis.mag.o)); GCs = cbind(GCs, vis.mag.o)
k.band.mag = as.numeric(as.character(GCs$fac.k.band.mag)); GCs = cbind(GCs, k.band.mag)
k.band.mag.o = as.numeric(as.character(GCs$fac.k.band.mag.o)); GCs = cbind(GCs, k.band.mag.o)
N.GC = as.numeric(as.character(GCs$fac.N.GC)); GCs = cbind(GCs, N.GC)
N.GC.o = as.numeric(as.character(GCs$fac.N.GC.o)); GCs = cbind(GCs, N.GC.o)
vel.dispersion = as.numeric(as.character(GCs$fac.vel.dispersion)); GCs = cbind(GCs, vel.dispersion)
vel.dispersion.o = as.numeric(as.character(GCs$fac.vel.dispersion.o)); GCs = cbind(GCs, vel.dispersion.o)
radius.half = as.numeric(as.character(GCs$fac.radius.half)); GCs = cbind(GCs, radius.half)
radius.half.o = as.numeric(as.character(GCs$fac.radius.half.o)); GCs = cbind(GCs, radius.half.o)
dyn.mass = as.numeric(as.character(GCs$fac.dyn.mass)); GCs = cbind(GCs, dyn.mass)
dynl.mass.o = as.numeric(as.character(GCs$fac.dynl.mass.o)); GCs = cbind(GCs, dynl.mass.o)
mass.cluster = as.numeric(as.character(GCs$fac.mass.cluster)); GCs = cbind(GCs, mass.cluster)
mass.cluster.o = as.numeric(as.character(GCs$fac.mass.cluster.o)); GCs = cbind(GCs, mass.cluster.o)
mass.CBH = as.numeric(as.character(GCs$fac.mass.CBH)); GCs = cbind(GCs, mass.CBH)
mass.CBH.upper.o = as.numeric(as.character(GCs$fac.mass.CBH.upper.o)); GCs = cbind(GCs, mass.CBH.upper.o)
mass.CBH.lower.o = as.numeric(as.character(GCs$fac.mass.CBH.lower.o)); GCs = cbind(GCs, mass.CBH.lower.o)
