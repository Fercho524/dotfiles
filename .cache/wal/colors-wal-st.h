const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0b0b19", /* black   */
  [1] = "#144D72", /* red     */
  [2] = "#353A8E", /* green   */
  [3] = "#572D8B", /* yellow  */
  [4] = "#2B5C92", /* blue    */
  [5] = "#5B5FA3", /* magenta */
  [6] = "#8B67B6", /* cyan    */
  [7] = "#c2c2c5", /* white   */

  /* 8 bright colors */
  [8]  = "#5a5a6e",  /* black   */
  [9]  = "#144D72",  /* red     */
  [10] = "#353A8E", /* green   */
  [11] = "#572D8B", /* yellow  */
  [12] = "#2B5C92", /* blue    */
  [13] = "#5B5FA3", /* magenta */
  [14] = "#8B67B6", /* cyan    */
  [15] = "#c2c2c5", /* white   */

  /* special colors */
  [256] = "#0b0b19", /* background */
  [257] = "#c2c2c5", /* foreground */
  [258] = "#c2c2c5",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
