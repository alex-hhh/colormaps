#lang racket/base

;; utils.rkt -- colormap utilities
;;
;; This file is part of colormaps -- additional colormaps for Racket plots
;; Copyright (c) 2020 Alex Harsányi <AlexHarsanyi@gmail.com>
;;
;; This program is free software: you can redistribute it and/or modify it
;; under the terms of the GNU Lesser General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at your
;; option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but WITHOUT
;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
;; FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
;; License for more details.
;;
;; You should have received a copy of the GNU Lesser General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(require plot/utils
         pict
         racket/match
         racket/class
         racket/draw
         racket/format
         racket/contract)

(define (pp-color-map cm
                      #:width (width #f)
                      #:height (height 30)
                      #:show-text? (show-text? #t)
                      #:text-style (text-style null)
                      #:text-size (text-size 12))
  (parameterize ([plot-pen-color-map cm])
    (define w
      (if width
          (/ width (color-map-size cm))
          (* 1.62 height)))
    (apply
     hc-append 0
     (for/list ([(c index) (in-indexed (in-range (color-map-size cm)))])
       (match-define (list r g b) (->pen-color c))
       (define color (make-object color% r g b))
       (if show-text?
           (cc-superimpose
            (filled-rectangle w height #:draw-border? #f #:color color)
            (text (~a index) text-style text-size))
           (filled-rectangle w height #:draw-border? #f #:color color))))))

(define (default-cm-names)
  (sort (color-map-names)
        (lambda (a b)
          (string<=? (symbol->string a) (symbol->string b)))))

(define (pp-color-maps (cm-names (default-cm-names))
                       #:width (width #f)
                       #:height (height 30)
                       #:show-text? (show-text? #t)
                       #:text-style (text-style null)
                       #:text-size (text-size 12))
  (define cm-labels
    (for/list ([cm cm-names])
      (text (~a cm) text-style text-size)))
  (define cm-picts
    (for/list ([cm cm-names])
      (pp-color-map cm #:width width #:height height #:show-text? show-text?
                    #:text-style text-style #:text-size text-size)))
  (define picts
    (let loop ([result '()]
               [labels cm-labels]
               [picts cm-picts])
      (if (null? labels)
          (reverse result)
          (loop (cons (car picts) (cons (car labels) result))
                (cdr labels)
                (cdr picts)))))
  (table 2 picts lc-superimpose cc-superimpose 15 3))

(provide/contract
 (pp-color-map (->* (symbol?)
                    (#:width (or/c #f positive?)
                     #:height positive?
                     #:show-text? boolean?
                     #:text-style text-style/c
                     #:text-size (integer-in 1 1024))
                    pict?))
 (pp-color-maps (->* ()
                     ((listof symbol?)
                      #:width (or/c #f positive?)
                      #:height positive?
                      #:show-text? boolean?
                      #:text-style text-style/c
                      #:text-size (integer-in 1 1024))
                     pict?)))
