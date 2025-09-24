static const char norm_fg[] = "#f4e9c9";
static const char norm_bg[] = "#070118";
static const char norm_border[] = "#aaa38c";

static const char sel_fg[] = "#f4e9c9";
static const char sel_bg[] = "#D94627";
static const char sel_border[] = "#f4e9c9";

static const char urg_fg[] = "#f4e9c9";
static const char urg_bg[] = "#60045E";
static const char urg_border[] = "#60045E";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
