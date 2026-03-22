Config = {}

-- ══════════════════════════════════════════════
--  LOCALE  (language / langue)
--  "en" = English  |  "fr" = Français
-- ══════════════════════════════════════════════

Config.Locale = "en"

-- All UI text is defined here. Switch Config.Locale above to change language.
-- Tout le texte de l'interface est défini ici. Changez Config.Locale ci-dessus.

Config.Locales = {

    en = {
        -- Cinematic bottom bar
        subtitle      = "LOS SANTOS  -  SAN ANDREAS",
        spawnHint     = "Press ~b~ENTER~s~ to Join the Server",

        -- Blips menu
        menuTitle     = "Locations & Businesses",

        -- Info card labels
        labelDistrict = "District",
        labelType     = "Type",
        labelOwner    = "Owner",
        labelServices = "Services",
        labelHours    = "Hours",

        -- Status values
        statusOpen    = "Open",
        status24h     = "24h / 7",
        statusClosed  = "Restricted access",
    },

    fr = {
        -- Bande cinématique bas
        subtitle      = "LOS SANTOS  -  SAN ANDREAS",
        spawnHint     = "Appuie sur ~b~ENTRÉE~s~ pour rejoindre le serveur",

        -- Menu blips
        menuTitle     = "Lieux & Entreprises",

        -- Labels carte info
        labelDistrict = "Quartier",
        labelType     = "Type",
        labelOwner    = "Propriétaire",
        labelServices = "Services",
        labelHours    = "Horaires",

        -- Valeurs de statut
        statusOpen    = "Ouvert",
        status24h     = "24h / 24",
        statusClosed  = "Accès restreint",
    },

}

-- ══════════════════════════════════════════════
--  CINEMATIC CAMERA
-- ══════════════════════════════════════════════

Config.TravelingDuration = 18000  -- camera travel duration per spot in ms
Config.SpotDuration      = 20000  -- total time per spot before switching (must be > TravelingDuration)

Config.PedDensity     = 1.0   -- pedestrian density during cinematic (0.0 – 1.0)
Config.VehicleDensity = 1.0   -- vehicle density during cinematic (0.0 – 1.0)
Config.MusicVolume    = 0.4   -- intro music volume (0.0 – 1.0)

Config.Spots = {

    -- [1] Downtown Los Santos
    { name = "Downtown Los Santos",
      camStart = { coords = vector3(-76.0, -818.0, 420.0),  rot = vector3(-45.0, 0.0, -20.0) },
      camEnd   = { coords = vector3(-118.48545074463, -942.18713378906, 384.74676513672), rot = vector3(-25.0, 0.0, -20.0) }, fov = 55.0 },

    -- [2] Vespucci Beach
    { name = "Vespucci Beach",
      camStart = { coords = vector3(-1500.0, -1200.0, 40.0), rot = vector3(-8.0, 0.0, 55.0) },
      camEnd   = { coords = vector3(-1200.0, -1000.0, 30.0), rot = vector3(-5.0, 0.0, 55.0) }, fov = 60.0 },

    -- [3] Los Santos Port
    { name = "Los Santos Port",
      camStart = { coords = vector3(700.0, -2900.0, 80.0),  rot = vector3(-15.0, 0.0, -30.0) },
      camEnd   = { coords = vector3(500.0, -2750.0, 60.0),  rot = vector3(-10.0, 0.0, -30.0) }, fov = 62.0 },

    -- [4] Alamo Sea
    { name = "Alamo Sea",
      camStart = { coords = vector3(1050.0, 3650.0, 50.0),  rot = vector3(-8.0, 0.0, -90.0) },
      camEnd   = { coords = vector3(1050.0, 3800.0, 45.0),  rot = vector3(-6.0, 0.0, -90.0) }, fov = 65.0 },

    -- [5] Del Perro Pier
    { name = "Del Perro Pier",
      camStart = { coords = vector3(-1650.0, -1100.0, 35.0), rot = vector3(-10.0, 0.0, 120.0) },
      camEnd   = { coords = vector3(-1500.0, -1000.0, 25.0), rot = vector3(-6.0,  0.0, 120.0) }, fov = 62.0 },

    -- [6] Sandy Shores
    { name = "Sandy Shores",
      camStart = { coords = vector3(1900.0, 3700.0, 80.0),  rot = vector3(-15.0, 0.0, -160.0) },
      camEnd   = { coords = vector3(1750.0, 3600.0, 60.0),  rot = vector3(-10.0, 0.0, -160.0) }, fov = 63.0 },

    -- [7] Los Santos Airport
    { name = "Los Santos Airport",
      camStart = { coords = vector3(-1400.0, -2950.0, 70.0), rot = vector3(-15.0, 0.0, 60.0) },
      camEnd   = { coords = vector3(-1200.0, -2800.0, 50.0), rot = vector3(-10.0, 0.0, 60.0) }, fov = 65.0 },

    -- [8] Paleto Bay
    { name = "Paleto Bay",
      camStart = { coords = vector3(-200.0, 6400.0, 60.0),  rot = vector3(-12.0, 0.0, 175.0) },
      camEnd   = { coords = vector3(-200.0, 6250.0, 45.0),  rot = vector3(-8.0,  0.0, 175.0) }, fov = 62.0 },

    -- [9] Rockford Hills
    { name = "Rockford Hills",
      camStart = { coords = vector3(-1000.0, 150.0, 120.0), rot = vector3(-20.0, 0.0, -70.0) },
      camEnd   = { coords = vector3(-850.0,  150.0, 100.0), rot = vector3(-15.0, 0.0, -70.0) }, fov = 58.0 },

    -- [10] Fort Zancudo
    { name = "Fort Zancudo",
      camStart = { coords = vector3(-2100.0, 3000.0, 80.0), rot = vector3(-12.0, 0.0, 100.0) },
      camEnd   = { coords = vector3(-2100.0, 2800.0, 65.0), rot = vector3(-8.0,  0.0, 100.0) }, fov = 65.0 },

    -- [11] Chumash
    { name = "Chumash",
      camStart = { coords = vector3(-3100.0, 500.0, 50.0),  rot = vector3(-8.0, 0.0, 130.0) },
      camEnd   = { coords = vector3(-2900.0, 600.0, 40.0),  rot = vector3(-5.0, 0.0, 130.0) }, fov = 63.0 },

    -- [12] Mirror Park
    { name = "Mirror Park",
      camStart = { coords = vector3(1100.0, -650.0, 80.0),  rot = vector3(-18.0, 0.0, -150.0) },
      camEnd   = { coords = vector3(950.0,  -550.0, 65.0),  rot = vector3(-12.0, 0.0, -150.0) }, fov = 60.0 },

}

-- ══════════════════════════════════════════════
--  BLIPS INFO MENU
-- ══════════════════════════════════════════════

Config.BlipsMenu = {
    enabled          = true,   -- enable/disable the entire blips menu
    menuWidth        = 262,    -- side list width in px
    cardWidth        = 295,    -- info card width in px
    showToggleButton = true,   -- show the arrow toggle button on the right edge
    menuOpenOnStart  = true,   -- open the menu automatically when cinematic starts
    -- menuTitle is taken from Config.Locales[Config.Locale].menuTitle automatically
}

-- ──────────────────────────────────────────────
--  BLIPS LOCATIONS
-- ──────────────────────────────────────────────
--
--  Fields:
--    id       : unique identifier (string)
--    name     : display name shown in the list and on the card
--    district : area / district label
--    blip     : SVG fallback symbol id (used if icon fails to load)
--    bg       : fallback background color (CSS hex) if photo fails to load
--    icon     : PNG blip icon filename inside html/ folder
--               → To find or replace icons, browse: https://wiki.rage.mp/wiki/Blips
--                 Download the PNG you want, place it in html/ and declare it in fxmanifest.lua
--    type     : business / location type
--    owner    : known owner or operator
--    status   : "open" | "24h" | "closed"
--    hours    : opening hours string (used when status = "open")
--    desc     : lore description paragraph
--    extras   : services / features (separated by ·)
--    photo    : background photo filename inside html/ folder
--
--  NOTE: Only add entries that have a photo file in html/.
--        Entries without a photo will show a colored fallback background.

Config.BlipsLocations = {

    { id="vanilla_unicorn",  name="Vanilla Unicorn",        district="Strawberry, LS",
      blip="b-strip",   bg="#1a0a2e", icon="unicorn.png",
      type="Adult Club / Strip Club",    owner="Trevor Philips",
      status="open",    hours="18:00 – 05:00",
      desc="Formerly run by Leon, the Vanilla Unicorn was taken over by force by Trevor Philips. The only accessible strip club in GTA V, it becomes Trevor's HQ in Los Santos.",
      extras="Private dancers · Bar · 21+ only",
      photo="vanilla-unicorn.jpg" },

    { id="bahama_mamas",     name="Bahama Mamas West",       district="Vespucci, LS",
      blip="b-bar",     bg="#1a1200", icon="bahamas.png",
      type="Nightclub",                  owner="Bahama Mamas Entertainment",
      status="open",    hours="22:00 – 06:00",
      desc="Trendy nightclub on the Vespucci waterfront. Opened in 2004, it became one of the most popular clubs on the west coast. Several violent incidents have occurred outside.",
      extras="Resident DJs · VIP bottles · Ocean terrace",
      photo="bahamas.jpg" },

    { id="tequilala",        name="Tequi-la-la",             district="West Vinewood, LS",
      blip="b-music",   bg="#1a0800", icon="tequilala.png",
      type="Bar / Concert Venue",        owner="Tequi-la-la LLC",
      status="open",    hours="20:00 – 02:00",
      desc="Iconic rock bar in West Vinewood founded by a former roadie in the 90s. Tequi-la-la has hosted hundreds of local bands and become a cultural institution.",
      extras="Live concerts · Happy hour 20:00–21:00 · Karaoke",
      photo="tequila.jpg" },

    { id="yellow_jack",      name="Yellow Jack Inn",         district="Grand Senora Desert",
      blip="b-bar",     bg="#1a0e00", icon="yellowjack.png",
      type="Bar / Motel",                owner="Unknown",
      status="open",    hours="10:00 – 04:00",
      desc="Isolated bar in the heart of the Grand Senora Desert. Meeting point for bikers, hunters and shady characters from Blaine County. Trevor is a regular.",
      extras="Pool table · Rooms available · Bike parking",
      photo="yellowjack.jpg" },

    { id="hen_house",        name="The Hen House",           district="Paleto Bay",
      blip="b-bar",     bg="#0f0a00", icon="thehenhouse.png",
      type="Bar / Tavern",               owner="Unknown",
      status="open",    hours="11:00 – 02:00",
      desc="Local bar in Paleto Bay, frequented by Blaine County countryside residents. Rustic atmosphere, cheap beer and a questionable clientele.",
      extras="Pool table · Jukebox · Terrace",
      photo="the-hen-house.jpg" },

    { id="fleeca",           name="Fleeca Bank",             district="Rockford Hills, LS",
      blip="b-bank",    bg="#001a10", icon="fleecabank.png",
      type="Retail Bank",                owner="Fleeca Financial Group",
      status="open",    hours="09:00 – 18:00",
      desc="Fleeca expanded in the 2000s by targeting the middle class. Its small branches make them prime targets for quick heists.",
      extras="24h ATMs · Checking accounts · Micro-loans",
      photo="fleeca.jpg" },

    { id="pacific_std",      name="Pacific Standard Bank",   district="Downtown, LS",
      blip="b-bank",    bg="#000d1a", icon="pacificbank.png",
      type="National Bank",              owner="Pacific Standard Financial",
      status="open",    hours="09:00 – 17:00",
      desc="One of the largest banks in San Andreas. It was the target of the famous heist orchestrated by Lester Crest and his crew.",
      extras="High-security vaults · Trading floor · Armed security",
      photo="PacificStandardPublic.jpg" },

    { id="ammu_nation",      name="Ammu-Nation",             district="Pillbox Hill, LS",
      blip="b-gun",     bg="#1a0000", icon="ammu-nation.png",
      type="Gun Store",                  owner="Ammu-Nation Corp.",
      status="open",    hours="08:00 – 22:00",
      desc="Present across San Andreas since the 70s. Ammu-Nation has always adapted to local laws — or worked around them. Official sponsor of several shooting competitions.",
      extras="Shooting range · Suppressors · Extended mags · Discreet delivery",
      photo="ammu-nation.jpg" },

    { id="ls_customs",       name="Los Santos Customs",      district="La Mesa, LS",
      blip="b-car",     bg="#1a0800", icon="lossantoscustom.png",
      type="Garage / Tuning",            owner="LS Customs Inc.",
      status="24h",     hours="Open 24/7",
      desc="Chain founded in the 80s by mechanics from Vespucci. Known for never asking where the vehicles come from. Multiple franchises across San Andreas.",
      extras="Custom plates · Armor · Custom paint",
      photo="los-santos-customs.jpg" },

    { id="lspd",             name="LSPD – Mission Row",      district="Mission Row, LS",
      blip="b-police",  bg="#00081a", icon="lspdmisionrow.png",
      type="Law Enforcement",            owner="City of Los Santos",
      status="24h",     hours="Open 24/7",
      desc="Built in 1962, the Mission Row precinct has weathered several corruption scandals. It remains the symbol of the relative order that reigns in Los Santos.",
      extras="Report filing · Vehicle recovery · Holding cells",
      photo="lspd.jpg" },

    { id="fort_zancudo",     name="Fort Zancudo",            district="Lago Zancudo",
      blip="b-shield",  bg="#0a0a0a", icon="fortzancudo.png",
      type="Military Base",              owner="US Army / IAA",
      status="closed",  hours="Restricted military zone",
      desc="Secret military base in the hills of Lago Zancudo. Houses jet fighters, tanks and armed personnel. Any intrusion is met with immediate lethal force.",
      extras="F-16 fighters · Rhino tanks · No-fly zone",
      photo="fordzancudo.jpg" },

    { id="fib",              name="FIB Headquarters",        district="Downtown, LS",
      blip="b-shield",  bg="#00001a", icon="fib.png",
      type="Federal Agency",             owner="Federal Government",
      status="closed",  hours="Restricted access",
      desc="The Federal Investigation Bureau monitors large-scale criminal activity. Their Downtown LS tower was the target of a daring heist. They often operate outside the law.",
      extras="Surveillance · Covert ops · Diplomatic immunity",
      photo="fib.jpg" },

    { id="pillbox",          name="Pillbox Hill Medical",    district="Pillbox Hill, LS",
      blip="b-hospital",bg="#1a0000", icon="pillboxhill.png",
      type="Public Hospital",            owner="San Andreas Health Authority",
      status="24h",     hours="ER open 24/7",
      desc="Opened in 1978 and expanded several times. Its emergency department is one of the busiest in the country, especially on weekends after shootings.",
      extras="Helipad · Emergency · Pharmacy · Morgue",
      photo="pillbox.jpg" },

    { id="ponsonbys",        name="Ponsonbys",               district="Rockford Hills, LS",
      blip="b-clothes", bg="#111111", icon="ponsonbys.png",
      type="Fashion / Luxury",           owner="Ponsonbys International",
      status="open",    hours="10:00 – 20:00",
      desc="Founded in London in 1887, the Ponsonbys franchise opened in LS in the 70s. It has dressed the city's elite for decades. Bespoke suits for those who want to look rich.",
      extras="Bespoke tailoring · Alterations · Home delivery",
      photo="ponsobys.jpg" },

    { id="suburban",         name="Sub Urban",               district="Vespucci, LS",
      blip="b-clothes", bg="#001a08", icon="suburban.png",
      type="Streetwear Fashion",         owner="Sub Urban Corp.",
      status="open",    hours="09:00 – 21:00",
      desc="Streetwear chain popular with Los Santos youth. Sub Urban offers casual outfits at affordable prices, unlike Ponsonbys.",
      extras="Streetwear · Caps · Shoes · Accessories",
      photo="suburban.jpg" },

    { id="binco",            name="Binco",                   district="Strawberry, LS",
      blip="b-clothes", bg="#0d001a", icon="binco.png",
      type="Discount Fashion",           owner="Binco Retail Group",
      status="open",    hours="09:00 – 20:00",
      desc="Binco is the cheapest clothing chain in Los Santos. Frequented by the working class, it offers basic outfits without pretension.",
      extras="Discount clothing · Permanent sales",
      photo="binco.jpg" },

    { id="ls_golf",          name="Los Santos Golf Club",    district="Richman, LS",
      blip="b-golf",    bg="#001500", icon="lossantosgolfclub.png",
      type="Golf / Private Club",        owner="LS Golf Club Inc.",
      status="open",    hours="07:00 – 20:00",
      desc="The most exclusive golf club in Los Santos, frequented by the elite of Richman and Rockford Hills. Michael De Santa plays here regularly to unwind between heists.",
      extras="18 holes · Pro shop · Fine dining · VIP",
      photo="lsgolf.jpg" },

    { id="humane_labs",      name="Humane Labs & Research",  district="Blaine County",
      blip="b-lab",     bg="#00101a", icon="humanelabs.png",
      type="Research Laboratory",        owner="Humane Labs & Research",
      status="closed",  hours="Restricted access",
      desc="Private scientific research center in the Blaine County desert. Officially specializing in biotechnology, rumors speak of experiments with neurotoxic agents.",
      extras="Badge access required · Armed security · Restricted zone",
      photo="humanlabs.jpg" },

    { id="tattoo",           name="Tattoo Parlor",           district="Mirror Park, LS",
      blip="b-tattoo",  bg="#1a0010", icon="tattoparlor.png",
      type="Tattoo Studio",              owner="Various owners",
      status="open",    hours="10:00 – 22:00",
      desc="Los Santos tattoo parlors are frequented by all walks of life, from gang members to Vinewood celebrities. Each neighborhood has its own style.",
      extras="Tattoos · Piercings · Touch-ups",
      photo="tattoo.jpg" },

    { id="barber",           name="Herr Kutz Barber",        district="Downtown, LS",
      blip="b-barber",  bg="#001a15", icon="herrkurtzbarber.png",
      type="Barbershop",                 owner="Herr Kutz Inc.",
      status="open",    hours="09:00 – 19:00",
      desc="Barbershop chain present throughout Los Santos. Offers classic and modern cuts for all budgets.",
      extras="Haircuts · Beard trim · Coloring",
      photo="barber.jpg" },

}
