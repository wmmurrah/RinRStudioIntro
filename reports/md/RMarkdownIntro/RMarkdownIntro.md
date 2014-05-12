Title
========================================================

```r
opts_knit$set(root.dir = "../../../")
```


text.


```r
source(file = "data/starRmake.R")
```

```
## Loading required package: Hmisc
## Loading required package: grid
## Loading required package: lattice
## Loading required package: survival
## Loading required package: splines
## Loading required package: Formula
## 
## Attaching package: 'Hmisc'
## 
## The following object is masked from 'package:psych':
## 
##     describe
## 
## The following objects are masked from 'package:base':
## 
##     format.pval, round.POSIXt, trunc.POSIXt, units
## 
## Loading required package: tcltk
## Loading required package: tkrplot
## Loading required package: VIM
## Loading required package: colorspace
## VIM is ready to use. 
##  Since version 4.0.0 the GUI is in its own package VIMGUI.
## 
##           Please use the package to use the new (and old) GUI.
## 
## 
## Attaching package: 'VIM'
## 
## The following object is masked from 'package:datasets':
## 
##     sleep
## 
## Loading required package: survey
## 
## Attaching package: 'survey'
## 
## The following object is masked from 'package:Hmisc':
## 
##     deff
## 
## The following object is masked from 'package:graphics':
## 
##     dotchart
## 
## Loading required package: gWidgetsRGtk2
## Loading required package: RGtk2
## Loading required package: gWidgets
## VIM is ready to use. 
##  (Enter vmGUImenu() to start the OLD graphical user interface.)
## 
##     Enter VIMGUI() to start the NEW graphical user interface.
```

```r
library(Hmisc)
library(psych)
library(tables)
```



```r
psych::describe(star)
```

```
##            vars   n   mean    sd median trimmed   mad min max range  skew
## gender*       1 150   1.49  0.50      1    1.49  0.00   1   2     1  0.03
## ethnicity*    2 150   1.74  0.44      2    1.80  0.00   1   2     1 -1.08
## birth*        3 150   6.54  1.31      7    6.66  1.48   1   8     7 -1.04
## stark*        4 150   1.95  0.80      2    1.94  1.48   1   3     2  0.08
## readk         5 136 436.39 30.88    433  433.69 27.43 360 580   220  1.25
## read1         6  97 524.07 56.59    516  520.57 56.34 430 651   221  0.53
## mathk         7 137 483.28 49.25    478  481.28 43.00 320 626   306  0.32
## math1         8 101 533.48 45.97    529  531.56 48.93 441 653   212  0.37
## lunchk*       9 148   1.57  0.50      2    1.59  0.00   1   2     1 -0.30
## schoolk*     10 150   2.23  0.88      2    2.17  1.48   1   4     3  0.42
## schoolidk    11 150  38.52 23.90     37   38.33 31.13   1  80    79  0.04
##            kurtosis   se
## gender*       -2.01 0.04
## ethnicity*    -0.83 0.04
## birth*         1.70 0.11
## stark*        -1.43 0.07
## readk          3.40 2.65
## read1         -0.51 5.75
## mathk          0.59 4.21
## math1         -0.48 4.57
## lunchk*       -1.92 0.04
## schoolk*      -0.47 0.07
## schoolidk     -1.30 1.95
```


You can also embed plots, for example:


```r
plot(cars)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 

# Title

```r
Mean <- function(x) {
    mean(x, na.rm = TRUE)
}
html(tabular(ethnicity + Heading("Total") * 1 ~ Mean * mathk, star))
```

<table frame="hsides" rules="groups">
<thead>
<tr class="center">
  <th>&nbsp;</th>
  <th>Mean</th>
</tr>
 <tr class="center">
  <th>ethnicity</th>
  <th>mathk</th>
</tr>
</thead>
<tbody>
<tr class="center">
  <th class="left">afam</th>
  <td>459.4</td>
</tr>
 <tr class="center">
  <th class="left">cauc</th>
  <td>491.8</td>
</tr>
 <tr class="center">
  <th class="left">Total</th>
  <td>483.3</td>
</tr>
</tbody>
</table>

