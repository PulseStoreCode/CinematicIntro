# skycam

Cinematic intro resource for FiveM. Traveling camera shots across Los Santos with a GTA Online-style blips info menu. Press ENTER to spawn.

---

## Features / Fonctionnalités

- Cinematic black bars with location name and spawn hint
- Slow traveling camera shots across configurable spots
- Forced sunny weather at 12:00 during cinematic, restored on spawn
- NPC & vehicle density configurable
- Looping intro music (MP3 via NUI)
- GTA Online-style side menu with PNG blip icons and info cards
- Info cards: real photo, cursive title, stats table, lore description
- Toggle button to hide/show the blips menu
- Mouse interaction enabled during cinematic
- ENTER spawns the player and exits the cinematic
- RageUI click sound on menu item click
- Full locale system: English & French built-in, easily extensible

---

## Installation

1. Drop the `skycam` folder into your server's `resources/` directory
2. Add `ensure skycam` to your `server.cfg`
3. Restart your server

---

## Music

Place your intro music at `html/intro-sound.mp3` (MP3 format).  
It loops when the cinematic starts and stops automatically on spawn.

---

## How it works

The cinematic launches automatically when a player spawns on the server (`playerSpawned` event). No command needed. The player presses ENTER to exit the cinematic and spawn at their position.

---

## Configuration — `config.lua`

### Language / Langue

```lua
Config.Locale = "en"   -- "en" for English, "fr" for French / Français
```

Changing this one line switches all UI text: cinematic bar hints, menu title, info card labels and status values.

To add a new language, duplicate one of the locale blocks in `Config.Locales` and translate the strings:

```lua
Config.Locales.de = {
    subtitle      = "LOS SANTOS  -  SAN ANDREAS",
    spawnHint     = "Drücke ~b~ENTER~s~ um dem Server beizutreten",
    menuTitle     = "Orte & Unternehmen",
    labelDistrict = "Bezirk",
    labelType     = "Typ",
    labelOwner    = "Eigentümer",
    labelServices = "Dienste",
    labelHours    = "Öffnungszeiten",
    statusOpen    = "Geöffnet",
    status24h     = "24h / 7",
    statusClosed  = "Kein Zugang",
}
```

### Cinematic settings

```lua
Config.TravelingDuration = 18000  -- camera travel duration per spot in ms
Config.SpotDuration      = 20000  -- total time per spot before switching (keep > TravelingDuration)
Config.PedDensity        = 1.0    -- pedestrian density (0.0 – 1.0)
Config.VehicleDensity    = 1.0    -- vehicle density (0.0 – 1.0)
Config.MusicVolume       = 0.4    -- intro music volume (0.0 – 1.0)
```

### Camera spots

```lua
{ name = "Spot Name",
  camStart = { coords = vector3(x, y, z), rot = vector3(pitch, roll, yaw) },
  camEnd   = { coords = vector3(x, y, z), rot = vector3(pitch, roll, yaw) },
  fov = 60.0 },
```

You can use `look = vector3(tx, ty, tz)` instead of `rot` to point the camera at a world coordinate.

### Blips menu settings

```lua
Config.BlipsMenu = {
    enabled          = true,   -- enable/disable the entire blips menu
    menuWidth        = 262,    -- side list width in px
    cardWidth        = 295,    -- info card width in px
    showToggleButton = true,   -- show the arrow toggle button on the right edge
    menuOpenOnStart  = true,   -- open the menu automatically when cinematic starts
}
```

### Blips locations

Each entry in `Config.BlipsLocations`:

```lua
{ id      = "unique_id",
  name    = "Display Name",
  district= "Area, LS",
  blip    = "b-bank",          -- SVG fallback symbol id (if icon fails to load)
  bg      = "#001a10",         -- fallback background color if photo fails
  icon    = "myicon.png",      -- PNG blip icon in html/ (see below for sources)
  type    = "Business type",
  owner   = "Owner name",
  status  = "open",            -- "open" | "24h" | "closed"
  hours   = "09:00 – 18:00",   -- used when status = "open"
  desc    = "Lore description.",
  extras  = "Service 1 · Service 2",
  photo   = "filename.jpg" },  -- background photo in html/
```

---

## Blip Icons (PNG)

Icons are plain PNG files placed in `html/` and declared in `fxmanifest.lua`.

To find, browse or replace icons, visit:  
**https://wiki.rage.mp/wiki/Blips**

This page lists all GTA V blip sprites with their IDs and preview images.  
Download the PNG you want, place it in `html/`, declare it in `fxmanifest.lua`, then set `icon = "yourfile.png"` in the location entry.

### Current icons

| File | Location |
|---|---|
| `unicorn.png` | Vanilla Unicorn |
| `bahamas.png` | Bahama Mamas West |
| `tequilala.png` | Tequi-la-la |
| `yellowjack.png` | Yellow Jack Inn |
| `thehenhouse.png` | The Hen House |
| `fleecabank.png` | Fleeca Bank |
| `pacificbank.png` | Pacific Standard Bank |
| `ammu-nation.png` | Ammu-Nation |
| `lossantoscustom.png` | Los Santos Customs |
| `lspdmisionrow.png` | LSPD Mission Row |
| `fortzancudo.png` | Fort Zancudo |
| `fib.png` | FIB Headquarters |
| `pillboxhill.png` | Pillbox Hill Medical |
| `ponsonbys.png` | Ponsonbys |
| `suburban.png` | Sub Urban |
| `binco.png` | Binco |
| `lossantosgolfclub.png` | Los Santos Golf Club |
| `humanelabs.png` | Humane Labs & Research |
| `tattoparlor.png` | Tattoo Parlor |
| `herrkurtzbarber.png` | Herr Kutz Barber |

---

## Adding a new location

1. Place the photo `.jpg` in `html/`
2. Place the blip icon `.png` in `html/`
3. Declare both in `fxmanifest.lua` under `files {}`
4. Add an entry to `Config.BlipsLocations` in `config.lua`

---

## File structure

```
skycam/
├── fxmanifest.lua              — resource manifest
├── config.lua                  — all settings, locales, camera spots, blips locations
├── client.lua                  — main client logic
└── html/
    ├── index.html              — NUI interface (blips menu + audio)
    ├── intro-sound.mp3         — intro music (replace with your own)
    │
    ├── [location photos .jpg]
    │   ├── ammu-nation.jpg
    │   ├── bahamas.jpg
    │   ├── barber.jpg
    │   ├── binco.jpg
    │   ├── fib.jpg
    │   ├── fleeca.jpg
    │   ├── fordzancudo.jpg
    │   ├── humanlabs.jpg
    │   ├── los-santos-customs.jpg
    │   ├── lsgolf.jpg
    │   ├── lspd.jpg
    │   ├── PacificStandardPublic.jpg
    │   ├── pillbox.jpg
    │   ├── ponsobys.jpg
    │   ├── suburban.jpg
    │   ├── tattoo.jpg
    │   ├── tequila.jpg
    │   ├── the-hen-house.jpg
    │   ├── vanilla-unicorn.jpg
    │   └── yellowjack.jpg
    │
    └── [blip icons .png]       — source: https://wiki.rage.mp/wiki/Blips
        ├── ammu-nation.png
        ├── bahamas.png
        ├── binco.png
        ├── fib.png
        ├── fleecabank.png
        ├── fortzancudo.png
        ├── herrkurtzbarber.png
        ├── humanelabs.png
        ├── lossantoscustom.png
        ├── lossantosgolfclub.png
        ├── lspdmisionrow.png
        ├── pacificbank.png
        ├── pillboxhill.png
        ├── ponsonbys.png
        ├── suburban.png
        ├── tattoparlor.png
        ├── tequilala.png
        ├── thehenhouse.png
        ├── unicorn.png
        └── yellowjack.png
```

---

## Requirements

- FiveM server (OneSync or legacy)
- No dependencies

---

## License

MIT — free to use, modify and redistribute.
