# Read in county-level vaccine data from DPH json file
illinois <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Illinois"))
adams <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Adams"))
alexander <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Alexander"))
bond <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Bond"))
boone <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Boone"))
brown <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Brown"))
bureau <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Bureau"))
calhoun <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Calhoun"))
carroll <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Carroll"))
cass <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Cass"))
champaign <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Champaign"))
chicago <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Chicago"))
christian <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Christian"))
clark <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Clark"))
clay <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Clay"))
clinton <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Clinton"))
coles <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Coles"))
cook <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Cook"))
crawford <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Crawford"))
cumberland <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Cumberland"))
dekalb <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=DeKalb"))
dewitt <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=De%20Witt"))
douglas <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Douglas"))
dupage <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=DuPage"))
edgar <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Edgar"))
edwards <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Edwards"))
effingham <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Effingham"))
fayette <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Fayette"))
ford <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Ford"))
franklin <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Franklin"))
fulton <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Fulton"))
gallatin <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Gallatin"))
greene <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Greene"))
grundy <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Grundy"))
hamilton <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Hamilton"))
hancock <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Hancock"))
hardin <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Hardin"))
henderson <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Henderson"))
henry <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Henry"))
iroquois <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Iroquois"))
jackson <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Jackson"))
jasper <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Jasper"))
jefferson <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Jefferson"))
jersey <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Jersey"))
jodaviess <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Jo%20Daviess"))
johnson <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Johnson"))
kane <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Kane"))
kankakee <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Kankakee"))
kendall <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Kendall"))
knox <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Knox"))
lake <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Lake"))
lasalle <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=LaSalle"))
lawrence <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Lawrence"))
lee <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Lee"))
livingston <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Livingston"))
logan <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Logan"))
mcdonough <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=McDonough"))
mchenry <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=McHenry"))
mclean <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=McLean"))
macon <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Macon"))
macoupin <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Macoupin"))
madison <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Madison"))
marion <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Marion"))
marshall <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Marshall"))
mason <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Mason"))
massac <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Massac"))
menard <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Menard"))
mercer <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Mercer"))
monroe <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Monroe"))
montgomery <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Montgomery"))
morgan <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Morgan"))
moultrie <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Moultrie"))
ogle <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Ogle"))
peoria <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Peoria"))
perry <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Perry"))
piatt <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Piatt"))
pike <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Pike"))
pope <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Pope"))
pulaski <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Pulaski"))
putnam <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Putnam"))
randolph <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Randolph"))
richland <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Richland"))
rockisland <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Rock%20Island"))
stclair <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=St.%20Clair"))
saline <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Saline"))
sangamon <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Sangamon"))
schuyler <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Schuyler"))
scott <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Scott"))
shelby <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Shelby"))
stark <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Stark"))
stephenson <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Stephenson"))
tazewell <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Tazewell"))
union <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Union"))
vermilion <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Vermilion"))
wabash <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Wabash"))
warren <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Warren"))
washington <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Washington"))
wayne <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Wayne"))
white <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=White"))
whiteside <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Whiteside"))
will <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Will"))
williamson <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Williamson"))
winnebago <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Winnebago"))
woodford <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Woodford"))

county_vaccine_data <- bind_rows(
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