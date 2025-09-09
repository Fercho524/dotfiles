const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#35170f", /* black   */
  [1] = "#FFD26E", /* red     */
  [2] = "#0C44A5", /* green   */
  [3] = "#6C8DC0", /* yellow  */
  [4] = "#E3B198", /* blue    */
  [5] = "#FED2AA", /* magenta */
  [6] = "#FEDEC8", /* cyan    */
  [7] = "#f5eade", /* white   */

  /* 8 bright colors */
  [8]  = "#aba39b",  /* black   */
  [9]  = "#FFD26E",  /* red     */
  [10] = "#0C44A5", /* green   */
  [11] = "#6C8DC0", /* yellow  */
  [12] = "#E3B198", /* blue    */
  [13] = "#FED2AA", /* magenta */
  [14] = "#FEDEC8", /* cyan    */
  [15] = "#f5eade", /* white   */

  /* special colors */
  [256] = "#35170f", /* background */
  [257] = "#f5eade", /* foreground */
  [258] = "#f5eade",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
