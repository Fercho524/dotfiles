const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#250d25", /* black   */
  [1] = "#A55FA3", /* red     */
  [2] = "#CB5CB0", /* green   */
  [3] = "#DF2ECF", /* yellow  */
  [4] = "#E451D8", /* blue    */
  [5] = "#7691C5", /* magenta */
  [6] = "#AD9BCF", /* cyan    */
  [7] = "#e2c9e4", /* white   */

  /* 8 bright colors */
  [8]  = "#9e8c9f",  /* black   */
  [9]  = "#A55FA3",  /* red     */
  [10] = "#CB5CB0", /* green   */
  [11] = "#DF2ECF", /* yellow  */
  [12] = "#E451D8", /* blue    */
  [13] = "#7691C5", /* magenta */
  [14] = "#AD9BCF", /* cyan    */
  [15] = "#e2c9e4", /* white   */

  /* special colors */
  [256] = "#250d25", /* background */
  [257] = "#e2c9e4", /* foreground */
  [258] = "#e2c9e4",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
