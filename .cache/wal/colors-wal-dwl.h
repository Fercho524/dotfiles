/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x21274dff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc7c9d2ff, 0x21274dff, 0x707388ff },
	[SchemeSel]  = { 0xc7c9d2ff, 0x3B549Fff, 0x662B99ff },
	[SchemeUrg]  = { 0xc7c9d2ff, 0x662B99ff, 0x3B549Fff },
};
