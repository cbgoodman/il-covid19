# Read in county-level data from DPH json file
illinois <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Illinois"))
adams <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Adams"))
alexander <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Alexander"))
bond <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Bond"))
boone <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Boone"))
brown <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Brown"))
bureau <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Bureau"))
calhoun <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Calhoun"))
carroll <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Carroll"))
cass <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Cass"))
champaign <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Champaign"))
chicago <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Chicago"))
christian <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Christian"))
clark <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Clark"))
clay <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Clay"))
clinton <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Clinton"))
coles <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Coles"))
cook <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Cook"))
crawford <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Crawford"))
cumberland <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Cumberland"))
dekalb <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=DeKalb"))
dewitt <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=De%20Witt"))
douglas <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Douglas"))
dupage <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=DuPage"))
edgar <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Edgar"))
edwards <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Edwards"))
effingham <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Effingham"))
fayette <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Fayette"))
ford <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Ford"))
franklin <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Franklin"))
fulton <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Fulton"))
gallatin <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Gallatin"))
greene <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Greene"))
grundy <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Grundy"))
hamilton <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Hamilton"))
hancock <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Hancock"))
hardin <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Hardin"))
henderson <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Henderson"))
henry <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Henry"))
iroquois <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Iroquois"))
jackson <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Jackson"))
jasper <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Jasper"))
jefferson <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Jefferson"))
jersey <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Jersey"))
jodaviess <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Jo%20Daviess"))
johnson <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Johnson"))
kane <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Kane"))
kankakee <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Kankakee"))
kendall <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Kendall"))
knox <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Knox"))
lake <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Lake"))
lasalle <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=LaSalle"))
lawrence <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Lawrence"))
lee <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Lee"))
livingston <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Livingston"))
logan <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Logan"))
mcdonough <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=McDonough"))
mchenry <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=McHenry"))
mclean <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=McLean"))
macon <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Macon"))
macoupin <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Macoupin"))
madison <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Madison"))
marion <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Marion"))
marshall <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Marshall"))
mason <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Mason"))
massac <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Massac"))
menard <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Menard"))
mercer <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Mercer"))
monroe <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Monroe"))
montgomery <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Montgomery"))
morgan <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Morgan"))
moultrie <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Moultrie"))
ogle <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Ogle"))
peoria <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Peoria"))
perry <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Perry"))
piatt <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Piatt"))
pike <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Pike"))
pope <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Pope"))
pulaski <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Pulaski"))
putnam <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Putnam"))
randolph <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Randolph"))
richland <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Richland"))
rockisland <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Rock%20Island"))
stclair <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=St.%20Clair"))
saline <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Saline"))
sangamon <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Sangamon"))
schuyler <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Schuyler"))
scott <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Scott"))
shelby <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Shelby"))
stark <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Stark"))
stephenson <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Stephenson"))
tazewell <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Tazewell"))
union <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Union"))
vermilion <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Vermilion"))
wabash <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Wabash"))
warren <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Warren"))
washington <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Washington"))
wayne <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Wayne"))
white <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=White"))
whiteside <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Whiteside"))
will <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Will"))
williamson <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Williamson"))
winnebago <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Winnebago"))
woodford <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Woodford"))

county_data <- bind_rows(
  illinois,
  adams,
  alexander,
  bond,
  boone,
  brown,
  bureau,
  calhoun,
  carroll,
  cass,
  champaign,
  chicago,
  christian,
  clark,
  clay,
  clinton,
  coles,
  cook,
  crawford,
  cumberland,
  dekalb,
  dewitt,
  douglas,
  dupage,
  edgar,
  edwards,
  effingham,
  fayette,
  ford,
  franklin,
  fulton,
  gallatin,
  greene,
  grundy,
  hamilton,
  hancock,
  hardin,
  henderson,
  henry,
  iroquois,
  jackson,
  jasper,
  jefferson,
  jersey,
  jodaviess,
  johnson,
  kane,
  kankakee,
  kendall,
  knox,
  lake,
  lasalle,
  lawrence,
  lee,
  livingston,
  logan,
  mcdonough,
  mchenry,
  mclean,
  macon,
  macoupin,
  madison,
  marion,
  marshall,
  mason,
  massac,
  menard,
  mercer,
  monroe,
  montgomery,
  morgan,
  moultrie,
  ogle,
  peoria,
  perry,
  piatt,
  pike,
  pope,
  pulaski,
  putnam,
  randolph,
  richland,
  rockisland,
  stclair,
  saline,
  sangamon,
  schuyler,
  scott,
  shelby,
  stark,
  stephenson,
  tazewell,
  union,
  vermilion,
  wabash,
  warren,
  washington,
  wayne,
  white,
  whiteside,
  will,
  williamson,
  winnebago,
  woodford
)
rm(illinois,
   adams,
   alexander,
   bond,
   boone,
   brown,
   bureau,
   calhoun,
   carroll,
   cass,
   champaign,
   chicago,
   christian,
   clark,
   clay,
   clinton,
   coles,
   cook,
   crawford,
   cumberland,
   dekalb,
   dewitt,
   douglas,
   dupage,
   edgar,
   edwards,
   effingham,
   fayette,
   ford,
   franklin,
   fulton,
   gallatin,
   greene,
   grundy,
   hamilton,
   hancock,
   hardin,
   henderson,
   henry,
   iroquois,
   jackson,
   jasper,
   jefferson,
   jersey,
   jodaviess,
   johnson,
   kane,
   kankakee,
   kendall,
   knox,
   lake,
   lasalle,
   lawrence,
   lee,
   livingston,
   logan,
   mcdonough,
   mchenry,
   mclean,
   macon,
   macoupin,
   madison,
   marion,
   marshall,
   mason,
   massac,
   menard,
   mercer,
   monroe,
   montgomery,
   morgan,
   moultrie,
   ogle,
   peoria,
   perry,
   piatt,
   pike,
   pope,
   pulaski,
   putnam,
   randolph,
   richland,
   rockisland,
   stclair,
   saline,
   sangamon,
   schuyler,
   scott,
   shelby,
   stark,
   stephenson,
   tazewell,
   union,
   vermilion,
   wabash,
   warren,
   washington,
   wayne,
   white,
   whiteside,
   will,
   williamson,
   winnebago,
   woodford
)
