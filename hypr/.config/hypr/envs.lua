-- Extra env variables
-- env = MY_GLOBAL_ENV,setting

-- Screenshot and screen recording output directories
hl.env("OMARCHY_SCREENSHOT_DIR", os.getenv("HOME") .. "/Pictures/Screenshots")
hl.env("OMARCHY_SCREENRECORD_DIR", os.getenv("HOME") .. "/Videos/Screen Recordings")