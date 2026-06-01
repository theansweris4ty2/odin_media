package main 


BEL     :: "\a" // Bell
BS      :: "\b" // Backspace
ESC     :: "\e" // Escape

// Fe Escape sequences

CSI     :: ESC + "["  // Control Sequence Introducer
OSC     :: ESC + "]"  // Operating System Command
ST      :: ESC + "\\" // String Terminator

// CSI sequences

CUU     :: "A"  // Cursor Up
CUD     :: "B"  // Cursor Down
CUF     :: "C"  // Cursor Forward
CUB     :: "D"  // Cursor Back
CNL     :: "E"  // Cursor Next Line
CPL     :: "F"  // Cursor Previous Line
CHA     :: "G"  // Cursor Horizontal Absolute
CUP     :: "H"  // Cursor Position
ED      :: "J"  // Erase in Display
EL      :: "K"  // Erase in Line
SU      :: "S"  // Scroll Up
SD      :: "T"  // Scroll Down
HVP     :: "f"  // Horizontal Vertical Position
SGR     :: "m"  // Select Graphic Rendition
AUX_ON  :: "5i" // AUX Port On
AUX_OFF :: "4i" // AUX Port Off
DSR     :: "6n" // Device Status Report

// CSI: private sequences

SCP          :: "s"    // Save Current Cursor Position
RCP          :: "u"    // Restore Saved Cursor Position
DECAWM_ON    :: "?7h"  // Auto Wrap Mode (Enabled)
DECAWM_OFF   :: "?7l"  // Auto Wrap Mode (Disabled)
DECTCEM_SHOW :: "?25h" // Text Cursor Enable Mode (Visible)
DECTCEM_HIDE :: "?25l" // Text Cursor Enable Mode (Invisible)

// SGR sequences

RESET                   :: "\e[0m"
BOLD                    :: "\e[1m"
FAINT                   :: "\e[2m"
ITALIC                  :: "\e[3m" // Not widely supported.
UNDERLINE               :: "\e[4m"
BLINK_SLOW              :: "\e[5m"
BLINK_RAPID             :: "\e[6m" // Not widely supported.
INVERT                  :: "\e[7m" // Also known as reverse video.
HIDE                    :: "\e[8m" // Not widely supported.
STRIKE                  :: "\e[9m"
FONT_PRIMARY            :: "\e[10m"
FONT_ALT1               :: "\e[11m"
FONT_ALT2               :: "\e[12m"
FONT_ALT3               :: "\e[13m"
FONT_ALT4               :: "\e[14m"
FONT_ALT5               :: "\e[15m"
FONT_ALT6               :: "\e[16m"
FONT_ALT7               :: "\e[17m"
FONT_ALT8               :: "\e[18m"
FONT_ALT9               :: "\e[19m"
FONT_FRAKTUR            :: "\e[20m" // Rarely supported.
UNDERLINE_DOUBLE        :: "\e[21m" // May be interpreted as "disable bold."
NO_BOLD_FAINT           :: "\e[22m"
NO_ITALIC_BLACKLETTER   :: "\e[23m"
NO_UNDERLINE            :: "\e[24m"
NO_BLINK                :: "\e[25m"
PROPORTIONAL_SPACING    :: "\e[26m"
NO_REVERSE              :: "\e[27m"
NO_HIDE                 :: "\e[28m"
NO_STRIKE               :: "\e[29m"

FG_BLACK                :: "\e[30m"
FG_RED                  :: "\e[31m"
FG_GREEN                :: "\e[32m"
FG_YELLOW               :: "\e[33m"
FG_BLUE                 :: "\e[34m"
FG_MAGENTA              :: "\e[35m"
FG_CYAN                 :: "\e[36m"
FG_WHITE                :: "\e[37m"
FG_COLOR                :: "\e[38m"
// FG_COLOR_8_BIT          :: "\e[38;5" // Followed by ";n" where n is in 0..=255
// FG_COLOR_24_BIT         :: "\e[38;2" // Followed by ";r;g;b" where r,g,b are in 0..=255
FG_DEFAULT              :: "\e[39m"

BG_BLACK                :: "\e[40"
BG_RED                  :: "\e[41m"
BG_GREEN                :: "\e[42m"
BG_YELLOW               :: "\e[43m"
BG_BLUE                 :: "\e[44m"
BG_MAGENTA              :: "\e[45m"
BG_CYAN                 :: "\e[46m"
BG_WHITE                :: "\e[47m"
BG_COLOR                :: "\e[48m"
BG_COLOR_8_BIT          :: "48;5" // Followed by ";n" where n is in 0..=255
BG_COLOR_24_BIT         :: "48;2" // Followed by ";r;g;b" where r,g,b are in 0..=255
BG_DEFAULT              :: "\e[49m"

NO_PROPORTIONAL_SPACING :: "\e[50m"
FRAMED                  :: "\e[51m"
ENCIRCLED               :: "\e[52m"
OVERLINED               :: "\e[53m"
NO_FRAME_ENCIRCLE       :: "\e[54m"
NO_OVERLINE             :: "\e[55m"

// SGR: non-standard bright colors

FG_BRIGHT_BLACK         :: "\e[90m" // Also known as grey.
FG_BRIGHT_RED           :: "\e[91m"
FG_BRIGHT_GREEN         :: "\e[92m"
FG_BRIGHT_YELLOW        :: "\e[93m"
FG_BRIGHT_BLUE          :: "\e[94m"
FG_BRIGHT_MAGENTA       :: "\e[95m"
FG_BRIGHT_CYAN          :: "\e[96m"
FG_BRIGHT_WHITE         :: "\e[97m"

BG_BRIGHT_BLACK         :: "\e[100m" // Also known as grey.
BG_BRIGHT_RED           :: "\e[101m"
BG_BRIGHT_GREEN         :: "\e[102m"
BG_BRIGHT_YELLOW        :: "\e[103m"
BG_BRIGHT_BLUE          :: "\e[104m"
BG_BRIGHT_MAGENTA       :: "\e[105m"
BG_BRIGHT_CYAN          :: "\e[106m"
BG_BRIGHT_WHITE         :: "\e[107m"

// Fp Escape sequences

DECSC :: ESC + "7" // DEC Save Cursor
DECRC :: ESC + "8" // DEC Restore Cursor

// OSC sequences

WINDOW_TITLE :: "2"  // Followed by ";<text>" ST.
HYPERLINK    :: "8"  // Followed by ";[params];<URI>" ST. Closed by OSC HYPERLINK ";;" ST.
CLIPBOARD    :: "52" // Followed by ";c;<Base64-encoded string>" ST.