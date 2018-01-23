# fudge
Summary:  <br>  An application for scewing image color. Go ahead, hold your mouse click down...

Dependency:  <br>  processing js <br> http://processingjs.org/


Inspiration:    <br> YouTube Coding Train Challenge #90: Floyd-Steinberg Dithering <br> https://www.youtube.com/watch?v=0L2n8Tg2FwI


Every pixel is adjusted based on the values of the pixels around it. As the pixel dist value is adjusted by holding the mouse click, the red, green, and blue colors of the image are dispersed into different directions.
<pre>
RED
   [p1r * 1/8],[p2r * 2/8],[p3r * 3/8]
   [p4r * 4/8],[ new val ],[p5r * 5/8]
   [p6r * 6/8],[p7r * 7/8],[p8r * 8/8]
 GREEN
   [p1r * 4/8],[p2r * 5/8],[p3r * 6/8]
   [p4r * 7/8],[ new val ],[p5r * 8/8]
   [p6r * 1/8],[p7r * 2/8],[p8r * 3/8]
 BLUE
   [p1r * 8/8],[p2r * 7/8],[p3r * 6/8]
   [p4r * 5/8],[ new val ],[p5r * 4/8]
   [p6r * 3/8],[p7r * 2/8],[p8r * 1/8]


 PIXEL MAP:
        [p1]                    [p2]                 [p3]
        [p4]                    [p ]                 [p5]
        [p6]                    [p7]                 [p8]

   [x - dist,  y - dist]   [ x,  y - dist]   [x + dist, y - dist]
   [x - dist,      y   ]   [     val     ]   [x + dist,     y   ]
   [x - dist,  y + dist]   [ x,  y + dist]   [x + dist, y + dist]
 </pre>
