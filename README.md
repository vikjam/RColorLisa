# RColorLisa
Easily load color palettes from great painters into R. Based on the wonderful work of Ryan McGuire who created the beautiful site [Color Lisa](http://colorlisa.com).

## Usage

### Create a sequential palette for usage and show colors
```R
pretty.palette <- color.lisa.pal(5, "The Dream by Pablo Picasso")
image(1:5, 1, as.matrix(1:5), col = pretty.palette, xlab = "The Dream by Pablo Picasso",
      ylab = "", xaxt = "n", yaxt = "n", bty = "n")
```

