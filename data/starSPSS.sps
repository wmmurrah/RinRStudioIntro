DATA LIST FILE= "C:/FOCAL/DARA/RinRStudioIntro/data/starSPSS.txt"  free (",")
/ gender ethnicty birth stark readk read1 mathk math1 lunchk schoolk schooldk  .

VARIABLE LABELS
gender "gender" 
 ethnicty "ethnicity" 
 birth "birth" 
 stark "stark" 
 readk "readk" 
 read1 "read1" 
 mathk "mathk" 
 math1 "math1" 
 lunchk "lunchk" 
 schoolk "schoolk" 
 schooldk "schoolidk" 
 .

VALUE LABELS
/
gender 
1 "female" 
 2 "male" 
/
ethnicty 
1 "afam" 
 2 "cauc" 
/
birth 
1 "1978 Q4" 
 2 "1979 Q1" 
 3 "1979 Q2" 
 4 "1979 Q3" 
 5 "1979 Q4" 
 6 "1980 Q1" 
 7 "1980 Q2" 
 8 "1980 Q3" 
/
stark 
1 "regular" 
 2 "regular+aide" 
 3 "small" 
/
lunchk 
1 "free" 
 2 "non-free" 
/
schoolk 
1 "inner-city" 
 2 "rural" 
 3 "suburban" 
 4 "urban" 
.

EXECUTE.
