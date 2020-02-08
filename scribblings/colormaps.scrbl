#lang scribble/manual
@require[@for-label[colormaps/tol
                    colormaps/utils
                    racket/base
                    plot
                    pict]
         plot/no-gui
         colormaps/utils
         colormaps]

@title{Additional Colormaps for the Racket Plot Package}
@author{Alex Harsáyi}

The @racket[plot] package introduced support for color maps using the
@racket[plot-pen-color-map] and @racket[plot-brush-color-map] and they allow
producing visually atractive plots by using pre-selected colors which work
well together.

Several color maps are defined inside the plot package plus additional ones
can be defined using @racket[register-color-map].  This package defines
additional color maps to be used with the plot pakage.

@section{Using Colormaps}

To use color maps for plots, set the a color map using
@racket[plot-pen-color-map] and use integer indexes for @racket[#:color]
argument of various plot renderers.  For example, this code will produce the
plot below and changing the argument of @racket[plot-pen-color-map] will
automatically change the colors of the plot:

@racketblock[
(require plot)
(parameterize ([plot-pen-color-map 'set1])
    (plot (list (function sin -5 5 #:color 0)
                (function cos -5 5 #:color 1))))]

@centered[@(parameterize ([plot-pen-color-map 'set1]
                        [line-width 4])
          (plot-pict (list (function sin -5 5 #:color 0)
                     (function cos -5 5 #:color 1)) #:height 200 #:width 450))]

The @racket[color-map-names] function can be used to retrieve the list of
installed color maps and you can use the @racket[pp-color-map] and
@racket[pp-color-maps] functions to inspect the colors available in a color
map.  Here are all the colors from the @racket['set1] color map used in the
previous plot:

@centered[@(pp-color-map 'set1)]

Color maps were designed for use with the @racket[plot] package, and
retrieving individual colors from a color map is perhaps unnecessarily
complicated.  You can use @racket[->pen-color] for this purpose like so:

@racketblock[
  (match-define (list red green blue)
    (parameterize ([plot-pen-color-map 'set1])
      (->pen-color 0)))]

@section{Colormaps Defined in this Package}

@defmodule[colormaps/tol]

The color maps defined in @racket[colormaps/tol] are based on
@hyperlink["https://personal.sron.nl/~pault/"]{Paul Tol's} color schemes, see
the link for more detailed description about the design of these color maps
and their intented uses.

Requiring the @racket[colormaps/tol] or @racket[colormaps] modules will
automatically register these color maps for use.

@bold{Qualitative Colour Maps} should be used for nominal or categorical data,
where magnitude differences are not relevant, for example lines in plots.  The
following qualitative color maps are defined:

@tabular[#:style 'boxed
         #:column-properties '(left left left)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Name} @bold{Colors})
         (list @racket['tol-bq] "Bright" @(pp-color-map 'tol-bq #:text-size 16))
         (list @racket['tol-hcq] "High Contrast" @(pp-color-map 'tol-hcq #:text-size 16))
         (list @racket['tol-vq] "Vibrant" @(pp-color-map 'tol-vq #:text-size 16))
         (list @racket['tol-mq] "Muted" @(pp-color-map 'tol-mq #:text-size 16))
         (list @racket['tol-pq] "Pale" @(pp-color-map 'tol-pq #:text-size 16))
         (list @racket['tol-dq] "Dark" @(pp-color-map 'tol-dq #:text-size 16))
         (list @racket['tol-lq] "Light" @(pp-color-map 'tol-lq #:text-size 16)))]

@bold{Diverging Colour Maps} should be used for data that is ordered between
two extremes where the midpoint is important (e.g. positive and negative
deviations from a mean value).  The following diverging colour maps are
defined:

@tabular[#:style 'boxed
         #:column-properties '(left left left)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Name} @bold{Colors})
         (list @racket['tol-sd] "Sunset" @(pp-color-map 'tol-sd #:text-size 16))
         (list @racket['tol-bd] "BuRd" @(pp-color-map 'tol-bd #:text-size 16))
         (list @racket['tol-pd] "PRGn" @(pp-color-map 'tol-pd #:text-size 16)))]

@bold{Sequential Colour Maps} should be used for data that is ordered from a
low to a high value.  The following sequential color maps are defined:

@tabular[#:style 'boxed
         #:column-properties '(left left left)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Name} @bold{Colors})
         (list @racket['tol-ys] "YlOrBr" @(pp-color-map 'tol-ys #:text-size 16))
         (list @racket['tol-is] "Iridescent" @(pp-color-map 'tol-is #:text-size 16 #:width (* 23 25))))]

@defproc[(make-tol-rainbow-colormap (color-count exact-positive-integer?)
                                    (#:register? register? boolean? #f)
                                    (#:name name (or/c #f symbol?) #f))
         (listof (list integer? integer? integer?))]{

  Create and maybe register a rainbow color scheme containing exactly
  @racket[color-count] visually distinct colors.  Returns the list of the
  colors in the color scheme as RGB triplets.

  The color scheme is constructed as described
  @hyperlink["https://personal.sron.nl/~pault/"]{Paul Tol's} notes about
  sequential color schemes.  For color schemes up to 29 colors, the colors are
  selected from a discrete color palette, for larger number of colours the
  colours are interpolated.

  When @racket[register?] is @racket[#t], the color map will be registered
  using @racket[register-color-map] using either a generated name or an user
  supplied one.

  @racket[name] specifies the name of the color scheme to use when registering
  it. When @racket[#f], a default name will be created by appending the number
  of colors to the symbol @racket['tol-rainbow].  For example, the default
  name for a 10 color rainbow will be @racket['tol-rainbow-10].

  Here are the first @racket[10] color schemes created by calling
  @racket[make-tol-rainbow-colormap] with arguments from @racket[1] to
  @racket[10].  The function can generate color maps with larger number of
  colors as well, but the larger the number of colors, the less distinct
  adjacent ones will be.

  @tabular[#:style 'boxed
           #:column-properties '(left center)
           #:row-properties '(bottom-border '())
           (list (list @bold{Tag} @bold{Colors})
           (list @racket['tol-rainbow-1]
           @(begin
             (make-tol-rainbow-colormap 1 #:register? #t)
             (pp-color-map 'tol-rainbow-1 #:text-size 16)))
           (list @racket['tol-rainbow-2]
           @(begin
             (make-tol-rainbow-colormap 2 #:register? #t)
             (pp-color-map 'tol-rainbow-2 #:text-size 16)))
           (list @racket['tol-rainbow-3]
           @(begin
             (make-tol-rainbow-colormap 3 #:register? #t)
             (pp-color-map 'tol-rainbow-3 #:text-size 16)))
           (list @racket['tol-rainbow-4]
           @(begin
             (make-tol-rainbow-colormap 4 #:register? #t)
             (pp-color-map 'tol-rainbow-4 #:text-size 16)))
           (list @racket['tol-rainbow-5]
           @(begin
             (make-tol-rainbow-colormap 5 #:register? #t)
             (pp-color-map 'tol-rainbow-5 #:text-size 16)))
           (list @racket['tol-rainbow-6]
           @(begin
             (make-tol-rainbow-colormap 6 #:register? #t)
             (pp-color-map 'tol-rainbow-6 #:text-size 16)))
           (list @racket['tol-rainbow-7]
           @(begin
             (make-tol-rainbow-colormap 7 #:register? #t)
             (pp-color-map 'tol-rainbow-7 #:text-size 16)))
           (list @racket['tol-rainbow-8]
           @(begin
             (make-tol-rainbow-colormap 8 #:register? #t)
             (pp-color-map 'tol-rainbow-8 #:text-size 16)))
           (list @racket['tol-rainbow-9]
           @(begin
             (make-tol-rainbow-colormap 9 #:register? #t)
             (pp-color-map 'tol-rainbow-9 #:text-size 16)))
           (list @racket['tol-rainbow-10]
           @(begin
             (make-tol-rainbow-colormap 10 #:register? #t)
             (pp-color-map 'tol-rainbow-10 #:text-size 16)))
           )]
  }

@section{Colormap Utilities}

@defmodule[colormaps/utils]

@defproc[(pp-color-map (name symbol?)
                       (#:width width (or/c #f positive?) #f)
                       (#:height height positive? 30)
                       (#:show-text? show-text? boolean? #t)
                       (#:text-style text-style text-style/c null)
                       (#:text-size text-size (integer-in 1 1024) 12))
         pict?]{

  Return a @racket[pict] representing the color map @racket[name], one cell
  for each color, possibly numbered for reference.

  @racket[width] is the total width of the resulting picture.  When
  @racket[@f], the width is determined from the number of colors in the color
  map and the @racket[height] of each cell.  When @racket[width] is a number,
  this will be the total width of the pict, and cells will be scalled to fit
  inside this width.

  @racket[height] is the height of the resulting picture, and the height of
  each individual color cell.

  @racket[show-text?], when @racket[#t], will label each cell with a number
  representing the index of the color in the color map.  This number can be
  passd to the @racket[#:color] parameter of plot renderers to use that color.

  @racket[text-style] is the text style used to render the text inside each
  cell.  Passed to the @racket[text] pict constructor.

  @racket[text-size] is the text size used to render the text inside each
  cell.  Passed to the @racket[text] pict constructor.

  For example to print the colors for the built-in @racket['set1] color map,
  to print out the colors in @racket['set1], use @code{(pp-color-map 'set1)}:

  @centered[@(pp-color-map 'set1)]

  }

@defproc[(pp-color-maps (names ((listof symbol?) (color-map-names)))
                       (#:width width (or/c #f positive?) #f)
                       (#:height height positive? 30)
                       (#:show-text? show-text? boolean? #t)
                       (#:text-style text-style text-style/c null)
                       (#:text-size text-size (integer-in 1 1024) 12))
         pict?]{

  Return a @racket[pict] representing the color maps in @racket[names], one
  line for each color map, along with its name.

  @racket[names] defaults to all installed color maps.  The @racket[width],
  @racket[height], @racket[show-text?], @racket[text-style] and
  @racket[text-size] arguments are the same as for @racket[pp-color-map].

  For example to print the color maps for the built-in @racket['set1] and
  @racket['set2] color maps, use @code{(pp-color-maps '(set1 set2))}:

  @centered[@(pp-color-maps '(set1 set2))]

  }
