colums = ["name",
"id",
"fac.right.ascension.hr",
"fac.declination.deg",
"type",
"fac.dist",
"fac.dist.o",
"dist.method",
"fac.foreground.extinction",
"fac.vis.mag",
"fac.vis.mag.o",
"fac.k.band.mag",
"fac.k.band.mag.o",
"fac.N.GC",
"fac.N.GC.o",
"lit.source",
"fac.vel.dispersion",
"fac.vel.dispersion.o",
"fac.radius.half",
"fac.radius.half.o",
"fac.dyn.mass",
"fac.dynl.mass.o",
"fac.mass.cluster",
"fac.mass.cluster.o",
"fac.mass.CBH",
"fac.mass.CBH.upper.o",
"fac.mass.CBH.lower.o"]

for col in colums:
      if "fac" in col:

            #  Code to replace nd with NA
            ## print("GCs$"+col+"[GCs$"+col+' == "nd"] = NA')
            ## #GCs$fac.mass.CBH[GCs$fac.mass.CBH == "nd"] = NA

            #  Code to convert factors to numbers and append to dataframe
            flCol = col.replace("fac.", "") #fac less (fl) column
            print(flCol+" = as.numeric(as.character(GCs$"+col+")); GCs = cbind(GCs, "+flCol+")")
            


