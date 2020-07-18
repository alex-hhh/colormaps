#lang scribble/manual
@require[@for-label[colormaps/tol
                    colormaps/cb
                    colormaps/utils
                    racket/base
                    plot
                    racket/match
                    (only-in plot/utils ->pen-color)
                    pict]
         plot/no-gui
         colormaps/utils
         colormaps]

@title{colormaps -- Additional Colormaps for the Racket Plot Package}
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

@subsection{Paul Tol's Colormaps}

@defmodule[colormaps/tol]

The color maps defined in @racket[colormaps/tol] are based on
@hyperlink["https://personal.sron.nl/~pault/"]{Paul Tol's} color schemes, see
the link for more detailed description about the design of these color maps
and their intented uses.

Requiring the @racket[colormaps/tol] or @racket[colormaps] modules will
automatically register these color maps for use.

@subsubsection{TOL Qualitative}

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

@subsubsection{TOL Diverging}

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

@subsubsection{TOL Sequential}

@bold{Sequential Colour Maps} should be used for data that is ordered from a
low to a high value.  The following sequential color maps are defined:

@tabular[#:style 'boxed
         #:column-properties '(left left left)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Name} @bold{Colors})
         (list @racket['tol-ys] "YlOrBr" @(pp-color-map 'tol-ys #:text-size 16))
         (list @racket['tol-is] "Iridescent" @(pp-color-map 'tol-is #:text-size 16 #:width (* 23 25))))]

@subsubsection{TOL Rainbow}

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

@subsection{ColorBrewer 2.0 Colormaps}

@defmodule[colormaps/cb]

The color maps defined in @racket[colormaps/cb] are based on
@hyperlink["https://colorbrewer2.org/"]{Color Brewer 2.0} color schemes, see
the link for more detailed description about the design of these color maps
and their intented uses.  Note that the qualitative color maps provided by
Color Brewer are already provided as part of the default color maps provided
by the plot package itself, this module defines the sequential and diverging
color schemes, as well as one additional qualitative color map.

Requiring the @racket[colormaps/cb] or @racket[colormaps] modules will
automatically register these color maps for use.

@subsubsection{CB Qualitative}

@bold{Qualitative Colour Maps} should be used for nominal or categorical data,
where magnitude differences are not relevant, for example lines in plots.  The
package provides one color map in this category:

@tabular[#:style 'boxed
         #:column-properties '(left left left)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Name} @bold{Colors})
         (list @racket['cb-accent] "Accent" @(pp-color-map 'cb-accent #:text-size 16)))]

@subsubsection{CB Diverging}

@bold{Diverging Colour Maps} should be used for data that is ordered between
two extremes where the midpoint is important (e.g. positive and negative
deviations from a mean value).  Several color maps are defined for the same
hue change and an appropiate color map should be used based on the number of
categories in the data.  For example, if there are 5 categories in the data,
use the @racket['cb-brbg-5] color map, but for 7 categories, use the
@racket['cb-brbg-7].

@tabular[#:style 'boxed
         #:column-properties '(left center)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Colors})
         (list @racket['cb-brbg-3] @(pp-color-map 'cb-brbg-3))
         (list @racket['cb-brbg-4] @(pp-color-map 'cb-brbg-4))
         (list @racket['cb-brbg-5] @(pp-color-map 'cb-brbg-5))
         (list @racket['cb-brbg-6] @(pp-color-map 'cb-brbg-6))
         (list @racket['cb-brbg-7] @(pp-color-map 'cb-brbg-7))
         (list @racket['cb-brbg-8] @(pp-color-map 'cb-brbg-8))
         (list @racket['cb-brbg-9] @(pp-color-map 'cb-brbg-9))
         (list @racket['cb-brbg-10] @(pp-color-map 'cb-brbg-10))
         (list @racket['cb-brbg-11] @(pp-color-map 'cb-brbg-11)))]

@tabular[#:style 'boxed
         #:column-properties '(left center)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Colors})
         (list @racket['cb-piyg-3] @(pp-color-map 'cb-piyg-3))
         (list @racket['cb-piyg-4] @(pp-color-map 'cb-piyg-4))
         (list @racket['cb-piyg-5] @(pp-color-map 'cb-piyg-5))
         (list @racket['cb-piyg-6] @(pp-color-map 'cb-piyg-6))
         (list @racket['cb-piyg-7] @(pp-color-map 'cb-piyg-7))
         (list @racket['cb-piyg-8] @(pp-color-map 'cb-piyg-8))
         (list @racket['cb-piyg-9] @(pp-color-map 'cb-piyg-9))
         (list @racket['cb-piyg-10] @(pp-color-map 'cb-piyg-10))
         (list @racket['cb-piyg-11] @(pp-color-map 'cb-piyg-11)))]

@tabular[#:style 'boxed
         #:column-properties '(left center)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Colors})
         (list @racket['cb-prgn-3] @(pp-color-map 'cb-prgn-3))
         (list @racket['cb-prgn-4] @(pp-color-map 'cb-prgn-4))
         (list @racket['cb-prgn-5] @(pp-color-map 'cb-prgn-5))
         (list @racket['cb-prgn-6] @(pp-color-map 'cb-prgn-6))
         (list @racket['cb-prgn-7] @(pp-color-map 'cb-prgn-7))
         (list @racket['cb-prgn-8] @(pp-color-map 'cb-prgn-8))
         (list @racket['cb-prgn-9] @(pp-color-map 'cb-prgn-9))
         (list @racket['cb-prgn-10] @(pp-color-map 'cb-prgn-10))
         (list @racket['cb-prgn-11] @(pp-color-map 'cb-prgn-11)))]

@tabular[#:style 'boxed
         #:column-properties '(left center)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Colors})
         (list @racket['cb-puor-3] @(pp-color-map 'cb-puor-3))
         (list @racket['cb-puor-4] @(pp-color-map 'cb-puor-4))
         (list @racket['cb-puor-5] @(pp-color-map 'cb-puor-5))
         (list @racket['cb-puor-6] @(pp-color-map 'cb-puor-6))
         (list @racket['cb-puor-7] @(pp-color-map 'cb-puor-7))
         (list @racket['cb-puor-8] @(pp-color-map 'cb-puor-8))
         (list @racket['cb-puor-9] @(pp-color-map 'cb-puor-9))
         (list @racket['cb-puor-10] @(pp-color-map 'cb-puor-10))
         (list @racket['cb-puor-11] @(pp-color-map 'cb-puor-11)))]

@tabular[#:style 'boxed
         #:column-properties '(left center)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Colors})
         (list @racket['cb-rdbu-3] @(pp-color-map 'cb-rdbu-3))
         (list @racket['cb-rdbu-4] @(pp-color-map 'cb-rdbu-4))
         (list @racket['cb-rdbu-5] @(pp-color-map 'cb-rdbu-5))
         (list @racket['cb-rdbu-6] @(pp-color-map 'cb-rdbu-6))
         (list @racket['cb-rdbu-7] @(pp-color-map 'cb-rdbu-7))
         (list @racket['cb-rdbu-8] @(pp-color-map 'cb-rdbu-8))
         (list @racket['cb-rdbu-9] @(pp-color-map 'cb-rdbu-9))
         (list @racket['cb-rdbu-10] @(pp-color-map 'cb-rdbu-10))
         (list @racket['cb-rdbu-11] @(pp-color-map 'cb-rdbu-11)))]

@tabular[#:style 'boxed
         #:column-properties '(left center)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Colors})
         (list @racket['cb-rdgy-3] @(pp-color-map 'cb-rdgy-3))
         (list @racket['cb-rdgy-4] @(pp-color-map 'cb-rdgy-4))
         (list @racket['cb-rdgy-5] @(pp-color-map 'cb-rdgy-5))
         (list @racket['cb-rdgy-6] @(pp-color-map 'cb-rdgy-6))
         (list @racket['cb-rdgy-7] @(pp-color-map 'cb-rdgy-7))
         (list @racket['cb-rdgy-8] @(pp-color-map 'cb-rdgy-8))
         (list @racket['cb-rdgy-9] @(pp-color-map 'cb-rdgy-9))
         (list @racket['cb-rdgy-10] @(pp-color-map 'cb-rdgy-10))
         (list @racket['cb-rdgy-11] @(pp-color-map 'cb-rdgy-11)))]

@tabular[#:style 'boxed
         #:column-properties '(left center)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Colors})
         (list @racket['cb-rdylbu-3] @(pp-color-map 'cb-rdylbu-3))
         (list @racket['cb-rdylbu-4] @(pp-color-map 'cb-rdylbu-4))
         (list @racket['cb-rdylbu-5] @(pp-color-map 'cb-rdylbu-5))
         (list @racket['cb-rdylbu-6] @(pp-color-map 'cb-rdylbu-6))
         (list @racket['cb-rdylbu-7] @(pp-color-map 'cb-rdylbu-7))
         (list @racket['cb-rdylbu-8] @(pp-color-map 'cb-rdylbu-8))
         (list @racket['cb-rdylbu-9] @(pp-color-map 'cb-rdylbu-9))
         (list @racket['cb-rdylbu-10] @(pp-color-map 'cb-rdylbu-10))
         (list @racket['cb-rdylbu-11] @(pp-color-map 'cb-rdylbu-11)))]

@tabular[#:style 'boxed
         #:column-properties '(left center)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Colors})
         (list @racket['cb-rdylgn-3] @(pp-color-map 'cb-rdylgn-3))
         (list @racket['cb-rdylgn-4] @(pp-color-map 'cb-rdylgn-4))
         (list @racket['cb-rdylgn-5] @(pp-color-map 'cb-rdylgn-5))
         (list @racket['cb-rdylgn-6] @(pp-color-map 'cb-rdylgn-6))
         (list @racket['cb-rdylgn-7] @(pp-color-map 'cb-rdylgn-7))
         (list @racket['cb-rdylgn-8] @(pp-color-map 'cb-rdylgn-8))
         (list @racket['cb-rdylgn-9] @(pp-color-map 'cb-rdylgn-9))
         (list @racket['cb-rdylgn-10] @(pp-color-map 'cb-rdylgn-10))
         (list @racket['cb-rdylgn-11] @(pp-color-map 'cb-rdylgn-11)))]

@tabular[#:style 'boxed
         #:column-properties '(left center)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Colors})
         (list @racket['cb-spectral-3] @(pp-color-map 'cb-spectral-3))
         (list @racket['cb-spectral-4] @(pp-color-map 'cb-spectral-4))
         (list @racket['cb-spectral-5] @(pp-color-map 'cb-spectral-5))
         (list @racket['cb-spectral-6] @(pp-color-map 'cb-spectral-6))
         (list @racket['cb-spectral-7] @(pp-color-map 'cb-spectral-7))
         (list @racket['cb-spectral-8] @(pp-color-map 'cb-spectral-8))
         (list @racket['cb-spectral-9] @(pp-color-map 'cb-spectral-9))
         (list @racket['cb-spectral-10] @(pp-color-map 'cb-spectral-10))
         (list @racket['cb-spectral-11] @(pp-color-map 'cb-spectral-11)))]

@subsubsection{CB Multi-Hue Sequential}

@bold{Sequential Colour Maps} should be used for data that is ordered from a
low to a high value, the package provides both single-hue and multi hue color
maps.  Several color maps are defined for the same hue change and an
appropiate color map should be used based on the number of categories in the
data.  For example, if there are 5 categories in the data, use the
@racket['cb-bugn] color map, but for 7 categories, use the
@racket['cb-bugn-7].

@tabular[#:style 'boxed
         #:column-properties '(left center)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Colors})
         (list @racket['cb-bugn-3] @(pp-color-map 'cb-bugn-3))
         (list @racket['cb-bugn-4] @(pp-color-map 'cb-bugn-4))
         (list @racket['cb-bugn-5] @(pp-color-map 'cb-bugn-5))
         (list @racket['cb-bugn-6] @(pp-color-map 'cb-bugn-6))
         (list @racket['cb-bugn-7] @(pp-color-map 'cb-bugn-7))
         (list @racket['cb-bugn-8] @(pp-color-map 'cb-bugn-8))
         (list @racket['cb-bugn-9] @(pp-color-map 'cb-bugn-9)))]

@tabular[#:style 'boxed
         #:column-properties '(left center)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Colors})
         (list @racket['cb-bupu-3] @(pp-color-map 'cb-bupu-3))
         (list @racket['cb-bupu-4] @(pp-color-map 'cb-bupu-4))
         (list @racket['cb-bupu-5] @(pp-color-map 'cb-bupu-5))
         (list @racket['cb-bupu-6] @(pp-color-map 'cb-bupu-6))
         (list @racket['cb-bupu-7] @(pp-color-map 'cb-bupu-7))
         (list @racket['cb-bupu-8] @(pp-color-map 'cb-bupu-8))
         (list @racket['cb-bupu-9] @(pp-color-map 'cb-bupu-9)))]

@tabular[#:style 'boxed
         #:column-properties '(left center)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Colors})
         (list @racket['cb-gnbu-3] @(pp-color-map 'cb-gnbu-3))
         (list @racket['cb-gnbu-4] @(pp-color-map 'cb-gnbu-4))
         (list @racket['cb-gnbu-5] @(pp-color-map 'cb-gnbu-5))
         (list @racket['cb-gnbu-6] @(pp-color-map 'cb-gnbu-6))
         (list @racket['cb-gnbu-7] @(pp-color-map 'cb-gnbu-7))
         (list @racket['cb-gnbu-8] @(pp-color-map 'cb-gnbu-8))
         (list @racket['cb-gnbu-9] @(pp-color-map 'cb-gnbu-9)))]

@tabular[#:style 'boxed
         #:column-properties '(left center)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Colors})
         (list @racket['cb-orrd-3] @(pp-color-map 'cb-orrd-3))
         (list @racket['cb-orrd-4] @(pp-color-map 'cb-orrd-4))
         (list @racket['cb-orrd-5] @(pp-color-map 'cb-orrd-5))
         (list @racket['cb-orrd-6] @(pp-color-map 'cb-orrd-6))
         (list @racket['cb-orrd-7] @(pp-color-map 'cb-orrd-7))
         (list @racket['cb-orrd-8] @(pp-color-map 'cb-orrd-8))
         (list @racket['cb-orrd-9] @(pp-color-map 'cb-orrd-9)))]

@tabular[#:style 'boxed
         #:column-properties '(left center)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Colors})
         (list @racket['cb-pubu-3] @(pp-color-map 'cb-pubu-3))
         (list @racket['cb-pubu-4] @(pp-color-map 'cb-pubu-4))
         (list @racket['cb-pubu-5] @(pp-color-map 'cb-pubu-5))
         (list @racket['cb-pubu-6] @(pp-color-map 'cb-pubu-6))
         (list @racket['cb-pubu-7] @(pp-color-map 'cb-pubu-7))
         (list @racket['cb-pubu-8] @(pp-color-map 'cb-pubu-8))
         (list @racket['cb-pubu-9] @(pp-color-map 'cb-pubu-9)))]

@tabular[#:style 'boxed
         #:column-properties '(left center)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Colors})
         (list @racket['cb-pubugn-3] @(pp-color-map 'cb-pubugn-3))
         (list @racket['cb-pubugn-4] @(pp-color-map 'cb-pubugn-4))
         (list @racket['cb-pubugn-5] @(pp-color-map 'cb-pubugn-5))
         (list @racket['cb-pubugn-6] @(pp-color-map 'cb-pubugn-6))
         (list @racket['cb-pubugn-7] @(pp-color-map 'cb-pubugn-7))
         (list @racket['cb-pubugn-8] @(pp-color-map 'cb-pubugn-8))
         (list @racket['cb-pubugn-9] @(pp-color-map 'cb-pubugn-9)))]

@tabular[#:style 'boxed
         #:column-properties '(left center)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Colors})
         (list @racket['cb-purd-3] @(pp-color-map 'cb-purd-3))
         (list @racket['cb-purd-4] @(pp-color-map 'cb-purd-4))
         (list @racket['cb-purd-5] @(pp-color-map 'cb-purd-5))
         (list @racket['cb-purd-6] @(pp-color-map 'cb-purd-6))
         (list @racket['cb-purd-7] @(pp-color-map 'cb-purd-7))
         (list @racket['cb-purd-8] @(pp-color-map 'cb-purd-8))
         (list @racket['cb-purd-9] @(pp-color-map 'cb-purd-9)))]

@tabular[#:style 'boxed
         #:column-properties '(left center)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Colors})
         (list @racket['cb-rdpu-3] @(pp-color-map 'cb-rdpu-3))
         (list @racket['cb-rdpu-4] @(pp-color-map 'cb-rdpu-4))
         (list @racket['cb-rdpu-5] @(pp-color-map 'cb-rdpu-5))
         (list @racket['cb-rdpu-6] @(pp-color-map 'cb-rdpu-6))
         (list @racket['cb-rdpu-7] @(pp-color-map 'cb-rdpu-7))
         (list @racket['cb-rdpu-8] @(pp-color-map 'cb-rdpu-8))
         (list @racket['cb-rdpu-9] @(pp-color-map 'cb-rdpu-9)))]

@tabular[#:style 'boxed
         #:column-properties '(left center)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Colors})
         (list @racket['cb-ylgn-3] @(pp-color-map 'cb-ylgn-3))
         (list @racket['cb-ylgn-4] @(pp-color-map 'cb-ylgn-4))
         (list @racket['cb-ylgn-5] @(pp-color-map 'cb-ylgn-5))
         (list @racket['cb-ylgn-6] @(pp-color-map 'cb-ylgn-6))
         (list @racket['cb-ylgn-7] @(pp-color-map 'cb-ylgn-7))
         (list @racket['cb-ylgn-8] @(pp-color-map 'cb-ylgn-8))
         (list @racket['cb-ylgn-9] @(pp-color-map 'cb-ylgn-9)))]

@tabular[#:style 'boxed
         #:column-properties '(left center)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Colors})
         (list @racket['cb-ylgnbu-3] @(pp-color-map 'cb-ylgnbu-3))
         (list @racket['cb-ylgnbu-4] @(pp-color-map 'cb-ylgnbu-4))
         (list @racket['cb-ylgnbu-5] @(pp-color-map 'cb-ylgnbu-5))
         (list @racket['cb-ylgnbu-6] @(pp-color-map 'cb-ylgnbu-6))
         (list @racket['cb-ylgnbu-7] @(pp-color-map 'cb-ylgnbu-7))
         (list @racket['cb-ylgnbu-8] @(pp-color-map 'cb-ylgnbu-8))
         (list @racket['cb-ylgnbu-9] @(pp-color-map 'cb-ylgnbu-9)))]

@tabular[#:style 'boxed
         #:column-properties '(left center)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Colors})
         (list @racket['cb-ylorbr-3] @(pp-color-map 'cb-ylorbr-3))
         (list @racket['cb-ylorbr-4] @(pp-color-map 'cb-ylorbr-4))
         (list @racket['cb-ylorbr-5] @(pp-color-map 'cb-ylorbr-5))
         (list @racket['cb-ylorbr-6] @(pp-color-map 'cb-ylorbr-6))
         (list @racket['cb-ylorbr-7] @(pp-color-map 'cb-ylorbr-7))
         (list @racket['cb-ylorbr-8] @(pp-color-map 'cb-ylorbr-8))
         (list @racket['cb-ylorbr-9] @(pp-color-map 'cb-ylorbr-9)))]

@tabular[#:style 'boxed
         #:column-properties '(left center)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Colors})
         (list @racket['cb-ylorrd-3] @(pp-color-map 'cb-ylorrd-3))
         (list @racket['cb-ylorrd-4] @(pp-color-map 'cb-ylorrd-4))
         (list @racket['cb-ylorrd-5] @(pp-color-map 'cb-ylorrd-5))
         (list @racket['cb-ylorrd-6] @(pp-color-map 'cb-ylorrd-6))
         (list @racket['cb-ylorrd-7] @(pp-color-map 'cb-ylorrd-7))
         (list @racket['cb-ylorrd-8] @(pp-color-map 'cb-ylorrd-8))
         (list @racket['cb-ylorrd-9] @(pp-color-map 'cb-ylorrd-9)))]

@subsubsection{CB Single-Hue Sequential}

@tabular[#:style 'boxed
         #:column-properties '(left center)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Colors})
         (list @racket['cb-blues-3] @(pp-color-map 'cb-blues-3))
         (list @racket['cb-blues-4] @(pp-color-map 'cb-blues-4))
         (list @racket['cb-blues-5] @(pp-color-map 'cb-blues-5))
         (list @racket['cb-blues-6] @(pp-color-map 'cb-blues-6))
         (list @racket['cb-blues-7] @(pp-color-map 'cb-blues-7))
         (list @racket['cb-blues-8] @(pp-color-map 'cb-blues-8))
         (list @racket['cb-blues-9] @(pp-color-map 'cb-blues-9)))]

@tabular[#:style 'boxed
         #:column-properties '(left center)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Colors})
         (list @racket['cb-greens-3] @(pp-color-map 'cb-greens-3))
         (list @racket['cb-greens-4] @(pp-color-map 'cb-greens-4))
         (list @racket['cb-greens-5] @(pp-color-map 'cb-greens-5))
         (list @racket['cb-greens-6] @(pp-color-map 'cb-greens-6))
         (list @racket['cb-greens-7] @(pp-color-map 'cb-greens-7))
         (list @racket['cb-greens-8] @(pp-color-map 'cb-greens-8))
         (list @racket['cb-greens-9] @(pp-color-map 'cb-greens-9)))]

@tabular[#:style 'boxed
         #:column-properties '(left center)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Colors})
         (list @racket['cb-greys-3] @(pp-color-map 'cb-greys-3))
         (list @racket['cb-greys-4] @(pp-color-map 'cb-greys-4))
         (list @racket['cb-greys-5] @(pp-color-map 'cb-greys-5))
         (list @racket['cb-greys-6] @(pp-color-map 'cb-greys-6))
         (list @racket['cb-greys-7] @(pp-color-map 'cb-greys-7))
         (list @racket['cb-greys-8] @(pp-color-map 'cb-greys-8))
         (list @racket['cb-greys-9] @(pp-color-map 'cb-greys-9)))]

@tabular[#:style 'boxed
         #:column-properties '(left center)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Colors})
         (list @racket['cb-oranges-3] @(pp-color-map 'cb-oranges-3))
         (list @racket['cb-oranges-4] @(pp-color-map 'cb-oranges-4))
         (list @racket['cb-oranges-5] @(pp-color-map 'cb-oranges-5))
         (list @racket['cb-oranges-6] @(pp-color-map 'cb-oranges-6))
         (list @racket['cb-oranges-7] @(pp-color-map 'cb-oranges-7))
         (list @racket['cb-oranges-8] @(pp-color-map 'cb-oranges-8))
         (list @racket['cb-oranges-9] @(pp-color-map 'cb-oranges-9)))]

@tabular[#:style 'boxed
         #:column-properties '(left center)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Colors})
         (list @racket['cb-purples-3] @(pp-color-map 'cb-purples-3))
         (list @racket['cb-purples-4] @(pp-color-map 'cb-purples-4))
         (list @racket['cb-purples-5] @(pp-color-map 'cb-purples-5))
         (list @racket['cb-purples-6] @(pp-color-map 'cb-purples-6))
         (list @racket['cb-purples-7] @(pp-color-map 'cb-purples-7))
         (list @racket['cb-purples-8] @(pp-color-map 'cb-purples-8))
         (list @racket['cb-purples-9] @(pp-color-map 'cb-purples-9)))]

@tabular[#:style 'boxed
         #:column-properties '(left center)
         #:row-properties '(bottom-border '())
         (list (list @bold{Tag} @bold{Colors})
         (list @racket['cb-reds-3] @(pp-color-map 'cb-reds-3))
         (list @racket['cb-reds-4] @(pp-color-map 'cb-reds-4))
         (list @racket['cb-reds-5] @(pp-color-map 'cb-reds-5))
         (list @racket['cb-reds-6] @(pp-color-map 'cb-reds-6))
         (list @racket['cb-reds-7] @(pp-color-map 'cb-reds-7))
         (list @racket['cb-reds-8] @(pp-color-map 'cb-reds-8))
         (list @racket['cb-reds-9] @(pp-color-map 'cb-reds-9)))]

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
