const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#21274d", /* black   */
  [1] = "#662B99", /* red     */
  [2] = "#3B549F", /* green   */
  [3] = "#952EA9", /* yellow  */
  [4] = "#F9128F", /* blue    */
  [5] = "#F616A2", /* magenta */
  [6] = "#DD63AB", /* cyan    */
  [7] = "#c7c9d2", /* white   */

  /* 8 bright colors */
  [8]  = "#707388",  /* black   */
  [9]  = "#662B99",  /* red     */
  [10] = "#3B549F", /* green   */
  [11] = "#952EA9", /* yellow  */
  [12] = "#F9128F", /* blue    */
  [13] = "#F616A2", /* magenta */
  [14] = "#DD63AB", /* cyan    */
  [15] = "#c7c9d2", /* white   */

  /* special colors */
  [256] = "#21274d", /* background */
  [257] = "#c7c9d2", /* foreground */
  [258] = "#c7c9d2",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
