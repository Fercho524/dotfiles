const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#544561", /* black   */
  [1] = "#B0A5BA", /* red     */
  [2] = "#C3A6BE", /* green   */
  [3] = "#979EC1", /* yellow  */
  [4] = "#97A9C2", /* blue    */
  [5] = "#B1AEC5", /* magenta */
  [6] = "#CBB1C8", /* cyan    */
  [7] = "#e2cfdd", /* white   */

  /* 8 bright colors */
  [8]  = "#9e909a",  /* black   */
  [9]  = "#B0A5BA",  /* red     */
  [10] = "#C3A6BE", /* green   */
  [11] = "#979EC1", /* yellow  */
  [12] = "#97A9C2", /* blue    */
  [13] = "#B1AEC5", /* magenta */
  [14] = "#CBB1C8", /* cyan    */
  [15] = "#e2cfdd", /* white   */

  /* special colors */
  [256] = "#544561", /* background */
  [257] = "#e2cfdd", /* foreground */
  [258] = "#e2cfdd",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
