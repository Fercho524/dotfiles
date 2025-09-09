static const char norm_fg[] = "#e2c9e4";
static const char norm_bg[] = "#250d25";
static const char norm_border[] = "#9e8c9f";

static const char sel_fg[] = "#e2c9e4";
static const char sel_bg[] = "#CB5CB0";
static const char sel_border[] = "#e2c9e4";

static const char urg_fg[] = "#e2c9e4";
static const char urg_bg[] = "#A55FA3";
static const char urg_border[] = "#A55FA3";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
