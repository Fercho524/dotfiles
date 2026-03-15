const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0b0b19", /* black   */
  [1] = "#6D6D70", /* red     */
  [2] = "#B29967", /* green   */
  [3] = "#7D7C82", /* yellow  */
  [4] = "#8E8E91", /* blue    */
  [5] = "#9D9DA2", /* magenta */
  [6] = "#ADADB0", /* cyan    */
  [7] = "#c2c2c5", /* white   */

  /* 8 bright colors */
  [8]  = "#5a5a6e",  /* black   */
  [9]  = "#6D6D70",  /* red     */
  [10] = "#B29967", /* green   */
  [11] = "#7D7C82", /* yellow  */
  [12] = "#8E8E91", /* blue    */
  [13] = "#9D9DA2", /* magenta */
  [14] = "#ADADB0", /* cyan    */
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
