df1 <- read.table("http://www.physics.mcmaster.ca/~harris/GCS_table.txt", header = F, skip = 39, sep="", nrows=422); 
## check if it has done the right thing
headers = c("Galaxy.Name", #Galaxy identification
            "Galaxy.ID", #Galaxy identification
            "RA.hr", #Galaxy right ascension (decimal hours)
            "DEC.deg", #declination (decimal degrees)
            "Morphological.Type", #Morphological type
            "Distance.Mpc", #Galaxy distance, 
            "Distance.uncertainty", #Galaxy distance uncertainty
            "Distance.estimation.Method", #distance estimation method adopted
            "Foreground.Extinction.A_V", #Foreground extinction,
            "Absolute.Visual.Magnitude.M_V^T", #absolute visual magnitude 
            "Absolute.Visual.Magnitude.uncertainty", #absolute visual magnitude estimated uncertainty
            "K.band.mag.M_K", #Absolute K-band magnitude (near infrared)
            "K.band.mag.uncertainty",#Absolute K-band magnitude uncertainty
            "num.GC.in.galaxy.N(GC)",# Estimated total number of globular clusters in the galaxy
            "num.GC.in.galaxy.uncertainty", #Total number of globular clusters in the galaxy estimated uncertainty,
            "Lit.Source", #literature source (see reference list following the table)
            "vel.dispersion.sig_e.km.s", #Velocity dispersion of the central bulge of the galaxy
            "vel.dispersion.uncertainty", # Velocity dispersion of the central bulge of the galaxy uncertainty
            "radius.half.galaxy.light.R_e.kpc", #Effective radius enclosing half the galaxy light
            "radius.half.galaxy.light.uncertainty", # Effective radius enclosing half the galaxy light unvertainty
            "dynamical.mass.lg.M_d.M_sun", # "Dynamical mass" of galaxy, defined as  (4 R_e sig_e^2 / G)
            "dynamical.mass.uncertainty", #Dynamical mass uncertainty
            "calc.tot.mass.Cluster.lg.M_G.M_sun", #Calculated total mass in the globular cluster system
            "calc.tot.mass.Cluster.uncertainty",#Calculated total mass in the globular cluster system uncertainty
            "mass.central.blackhole.lg.M_B.M_sun",#Mass of central black hole in the galaxy
            "mass.central.blackhole.upper.uncertainty", #Mass of central black hole in the galaxy upper uncertainty
            "mass.central.blackhole.lower.uncertainty"); 
names(df1) = headers