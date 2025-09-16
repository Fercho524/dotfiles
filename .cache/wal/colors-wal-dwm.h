static const char norm_fg[] = "#e2cfdd";
static const char norm_bg[] = "#544561";
static const char norm_border[] = "#9e909a";

static const char sel_fg[] = "#e2cfdd";
static const char sel_bg[] = "#C3A6BE";
static const char sel_border[] = "#e2cfdd";

static const char urg_fg[] = "#e2cfdd";
static const char urg_bg[] = "#B0A5BA";
static const char urg_border[] = "#B0A5BA";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
