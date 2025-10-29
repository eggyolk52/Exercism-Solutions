#include "resistor_color.h"

resistor_band_t resistor_band_colors[] = { BLACK, BROWN, RED, ORANGE, YELLOW, GREEN, BLUE, VIOLET, GREY, WHITE, };

int color_code(resistor_band_t color) {
    return color;
}

resistor_band_t *colors() {
    return resistor_band_colors;
}
