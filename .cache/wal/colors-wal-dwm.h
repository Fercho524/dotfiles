static const char norm_fg[] = "#f5eade";
static const char norm_bg[] = "#35170f";
static const char norm_border[] = "#aba39b";

static const char sel_fg[] = "#f5eade";
static const char sel_bg[] = "#0C44A5";
static const char sel_border[] = "#f5eade";

static const char urg_fg[] = "#f5eade";
static const char urg_bg[] = "#FFD26E";
static const char urg_border[] = "#FFD26E";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
