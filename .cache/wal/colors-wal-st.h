const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#070118", /* black   */
  [1] = "#60045E", /* red     */
  [2] = "#D94627", /* green   */
  [3] = "#930356", /* yellow  */
  [4] = "#E2054D", /* blue    */
  [5] = "#DE8157", /* magenta */
  [6] = "#361594", /* cyan    */
  [7] = "#f4e9c9", /* white   */

  /* 8 bright colors */
  [8]  = "#aaa38c",  /* black   */
  [9]  = "#60045E",  /* red     */
  [10] = "#D94627", /* green   */
  [11] = "#930356", /* yellow  */
  [12] = "#E2054D", /* blue    */
  [13] = "#DE8157", /* magenta */
  [14] = "#361594", /* cyan    */
  [15] = "#f4e9c9", /* white   */

  /* special colors */
  [256] = "#070118", /* background */
  [257] = "#f4e9c9", /* foreground */
  [258] = "#f4e9c9",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
