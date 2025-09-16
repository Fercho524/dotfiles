const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0E1855", /* black   */
  [1] = "#662B99", /* red     */
  [2] = "#3B549F", /* green   */
  [3] = "#952EA9", /* yellow  */
  [4] = "#F9128F", /* blue    */
  [5] = "#F616A2", /* magenta */
  [6] = "#DD63AB", /* cyan    */
  [7] = "#a5c2da", /* white   */

  /* 8 bright colors */
  [8]  = "#738798",  /* black   */
  [9]  = "#662B99",  /* red     */
  [10] = "#3B549F", /* green   */
  [11] = "#952EA9", /* yellow  */
  [12] = "#F9128F", /* blue    */
  [13] = "#F616A2", /* magenta */
  [14] = "#DD63AB", /* cyan    */
  [15] = "#a5c2da", /* white   */

  /* special colors */
  [256] = "#0E1855", /* background */
  [257] = "#a5c2da", /* foreground */
  [258] = "#a5c2da",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
