static const char norm_fg[] = "#c2c2c5";
static const char norm_bg[] = "#0b0b19";
static const char norm_border[] = "#5a5a6e";

static const char sel_fg[] = "#c2c2c5";
static const char sel_bg[] = "#353A8E";
static const char sel_border[] = "#c2c2c5";

static const char urg_fg[] = "#c2c2c5";
static const char urg_bg[] = "#144D72";
static const char urg_border[] = "#144D72";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
