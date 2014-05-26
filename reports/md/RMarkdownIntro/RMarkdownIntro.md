Title
========================================================

```r
opts_knit$set(root.dir = "../../../")
```


text.


```r
# source(file='data/starRmake.R')
star <- read.csv("~/RStudioProjects/Rtutorials/RinRStudioIntro/data/star.csv")
library(Hmisc)
```

```
## Loading required package: grid
## Loading required package: lattice
## Loading required package: survival
## Loading required package: splines
## Loading required package: Formula
## 
## Attaching package: 'Hmisc'
## 
## The following objects are masked from 'package:base':
## 
##     format.pval, round.POSIXt, trunc.POSIXt, units
```

```r
library(psych)
```

```
## 
## Attaching package: 'psych'
## 
## The following object is masked from 'package:Hmisc':
## 
##     describe
```

```r
library(tables)
```



```r
psych::describe(star)
```

```
##              vars   n     mean       sd  median  trimmed      mad  min
## X               1 150 94667.25 52486.41 95463.0 95028.94 59042.32 1561
## gender*         2 150     1.49     0.50     1.0     1.49     0.00    1
## ethnicity*      3 150     1.74     0.44     2.0     1.80     0.00    1
## birth*          4 150     6.54     1.31     7.0     6.66     1.48    1
## stark*          5 150     1.95     0.80     2.0     1.94     1.48    1
## star1*          6 103     1.95     0.82     2.0     1.94     1.48    1
## star2*          7  82     1.99     0.79     2.0     1.98     1.48    1
## star3*          8  72     2.08     0.78     2.0     2.10     1.48    1
## readk           9 136   436.39    30.88   433.0   433.69    27.43  360
## read1          10  97   524.07    56.59   516.0   520.57    56.34  430
## read2          11  77   595.23    45.77   593.0   594.71    50.41  500
## read3          12  67   628.45    44.57   622.0   627.05    37.06  547
## mathk          13 137   483.28    49.25   478.0   481.28    43.00  320
## math1          14 101   533.48    45.97   529.0   531.56    48.93  441
## math2          15  77   590.79    48.72   590.0   589.68    53.37  497
## math3          16  69   634.36    45.90   629.0   633.84    44.48  546
## lunchk*        17 148     1.57     0.50     2.0     1.59     0.00    1
## lunch1*        18  99     1.59     0.50     2.0     1.60     0.00    1
## lunch2*        19  80     1.65     0.48     2.0     1.69     0.00    1
## lunch3*        20  70     1.67     0.47     2.0     1.71     0.00    1
## schoolk*       21 150     2.23     0.88     2.0     2.17     1.48    1
## school1*       22 103     2.27     0.84     2.0     2.22     0.00    1
## school2*       23  82     2.11     0.72     2.0     2.08     0.00    1
## school3*       24  72     2.14     0.72     2.0     2.10     0.00    1
## degreek*       25 150     1.41     0.65     1.0     1.31     0.00    1
## degree1*       26 103     1.34     0.48     1.0     1.30     0.00    1
## degree2*       27  81     1.37     0.51     1.0     1.32     0.00    1
## degree3*       28  70     1.41     0.52     1.0     1.38     0.00    1
## ladderk*       29 133     2.16     0.88     2.0     2.02     0.00    1
## ladder1*       30 103     2.68     1.51     2.0     2.48     0.00    1
## ladder2*       31  81     2.46     1.31     2.0     2.25     0.00    1
## ladder3*       32  71     2.80     1.49     2.0     2.56     0.00    1
## experiencek    33 150     8.91     5.46     9.0     8.73     5.93    0
## experience1    34 103    10.04     8.10     9.0     9.08     7.41    0
## experience2    35  81    12.69     9.05    11.0    11.75    10.38    0
## experience3    36  71    15.00     9.06    15.0    14.61     7.41    0
## tethnicityk*   37 148     1.83     0.38     2.0     1.91     0.00    1
## tethnicity1*   38 103     1.86     0.34     2.0     1.95     0.00    1
## tethnicity2*   39  81     1.85     0.36     2.0     1.94     0.00    1
## tethnicity3*   40  71     1.87     0.34     2.0     1.96     0.00    1
## systemk        41 150    18.12    11.47    13.0    17.42    11.86    1
## system1        42 103    19.80    11.87    19.0    19.51    13.34    1
## system2        43  82    21.00    11.96    21.0    20.85    14.83    1
## system3        44  72    21.11    12.11    20.5    20.95    15.57    1
## schoolidk      45 150    38.52    23.90    37.0    38.33    31.13    1
## schoolid1      46 103    42.00    24.29    47.0    42.63    29.65    1
## schoolid2      47  82    43.94    24.48    50.0    44.83    29.65    1
## schoolid3      48  72    44.12    24.59    49.0    45.00    31.13    1
##                 max  range  skew kurtosis      se
## X            185345 183784 -0.07    -1.10 4285.50
## gender*           2      1  0.03    -2.01    0.04
## ethnicity*        2      1 -1.08    -0.83    0.04
## birth*            8      7 -1.04     1.70    0.11
## stark*            3      2  0.08    -1.43    0.07
## star1*            3      2  0.09    -1.53    0.08
## star2*            3      2  0.02    -1.43    0.09
## star3*            3      2 -0.14    -1.38    0.09
## readk           580    220  1.25     3.40    2.65
## read1           651    221  0.53    -0.51    5.75
## read2           709    209  0.17    -0.60    5.22
## read3           753    206  0.41    -0.10    5.44
## mathk           626    306  0.32     0.59    4.21
## math1           653    212  0.37    -0.48    4.57
## math2           721    224  0.23    -0.43    5.55
## math3           752    206  0.19    -0.53    5.53
## lunchk*           2      1 -0.30    -1.92    0.04
## lunch1*           2      1 -0.34    -1.90    0.05
## lunch2*           2      1 -0.62    -1.64    0.05
## lunch3*           2      1 -0.71    -1.51    0.06
## schoolk*          4      3  0.42    -0.47    0.07
## school1*          4      3  0.53    -0.23    0.08
## school2*          4      3  0.62     0.61    0.08
## school3*          4      3  0.70     0.73    0.08
## degreek*          4      3  1.72     3.39    0.05
## degree1*          2      1  0.67    -1.57    0.05
## degree2*          3      2  0.80    -0.75    0.06
## degree3*          3      2  0.64    -0.97    0.06
## ladderk*          5      4  2.16     4.94    0.08
## ladder1*          6      5  1.29     0.26    0.15
## ladder2*          6      5  1.64     1.54    0.15
## ladder3*          6      5  1.26     0.08    0.18
## experiencek      27     27  0.37     0.08    0.45
## experience1      39     39  1.20     1.86    0.80
## experience2      34     34  0.73    -0.33    1.01
## experience3      36     36  0.27    -0.34    1.08
## tethnicityk*      2      1 -1.75     1.07    0.03
## tethnicity1*      2      1 -2.09     2.41    0.03
## tethnicity2*      2      1 -1.94     1.80    0.04
## tethnicity3*      2      1 -2.20     2.87    0.04
## systemk          42     41  0.51    -0.96    0.94
## system1          42     41  0.24    -1.24    1.17
## system2          42     41  0.12    -1.40    1.32
## system3          42     41  0.14    -1.42    1.43
## schoolidk        80     79  0.04    -1.30    1.95
## schoolid1        80     79 -0.19    -1.30    2.39
## schoolid2        80     79 -0.28    -1.35    2.70
## schoolid3        80     79 -0.26    -1.36    2.90
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

