#lang racket/base
;; cb.rkt -- colormaps based on Colow Brewer 2.0
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

;; See https://colorbrewer2.org for how the color schemes are designed and
;; intended to be used.

(require plot/utils
         racket/math
         racket/match
         racket/contract)

;;; Sequential
;;;; Multi Hue

;;;;; BuGn

(define cb-bugn-3
  #((#xe5 #xf5 #xf9)
    (#x99 #xd8 #xc9)
    (#x2c #xa2 #x5f)))

(define cb-bugn-4
  #((#xed #xf8 #xfb)
    (#xb2 #xe2 #xe2)
    (#x66 #xc2 #xa4)
    (#x23 #x8b #x45)))

(define cb-bugn-5
  #((#xed #xf8 #xfb)
    (#xb2 #xe2 #xe2)
    (#x66 #xc2 #xa4)
    (#x2c #xa2 #x5f)
    (#x00 #x6d #x2c)))

(define cb-bugn-6
  #((#xed #xf8 #xfb)
    (#xcc #xec #xe6)
    (#x99 #xd8 #xc9)
    (#x66 #xc2 #xa4)
    (#x2c #xa2 #x5f)
    (#x00 #x6d #x2c)))

(define cb-bugn-7
  #((#xed #xf8 #xfb)
    (#xcc #xec #xe6)
    (#x99 #xd8 #xc9)
    (#x66 #xc2 #xa4)
    (#x41 #xae #x76)
    (#x23 #x8b #x45)
    (#x00 #x58 #x24)))

(define cb-bugn-8
  #((#xf7 #xfc #xfd)
    (#xe5 #xf5 #xf9)
    (#xcc #xec #xe6)
    (#x99 #xd8 #xc9)
    (#x66 #xc2 #xa4)
    (#x41 #xae #x76)
    (#x23 #x8b #x45)
    (#x00 #x58 #x24)))

(define cb-bugn-9
  #((#xf7 #xfc #xfd)
    (#xe5 #xf5 #xf9)
    (#xcc #xec #xe6)
    (#x99 #xd8 #xc9)
    (#x66 #xc2 #xa4)
    (#x41 #xae #x76)
    (#x23 #x8b #x45)
    (#x00 #x6d #x2c)
    (#x00 #x44 #x1b)))

;;;;; BuPu

(define cb-bupu-3
  #((#xe0 #xec #xf4)
    (#x9e #xbc #xda)
    (#x88 #x56 #xa7)))

(define cb-bupu-4
  #((#xed #xf8 #xfb)
    (#xb3 #xcd #xe3)
    (#x8c #x96 #xc6)
    (#x88 #x41 #x9d)))

(define cb-bupu-5
  #((#xed #xf8 #xfb)
    (#xb3 #xcd #xe3)
    (#x8c #x96 #xc6)
    (#x88 #x56 #xa7)
    (#x81 #x0f #x7c)))

(define cb-bupu-6
  #((#xed #xf8 #xfb)
    (#xbf #xd3 #xe6)
    (#x9e #xbc #xda)
    (#x8c #x96 #xc6)
    (#x88 #x56 #xa7)
    (#x81 #x0f #x7c)))

(define cb-bupu-7
  #((#xed #xf8 #xfb)
    (#xbf #xd3 #xe6)
    (#x9e #xbc #xda)
    (#x8c #x96 #xc6)
    (#x8c #x6b #xb1)
    (#x88 #x41 #x9d)
    (#x6e #x01 #x6b)))

(define cb-bupu-8
  #((#xf7 #xfc #xfd)
    (#xe0 #xec #xf4)
    (#xbf #xd3 #xe6)
    (#x9e #xbc #xda)
    (#x8c #x96 #xc6)
    (#x8c #x6b #xb1)
    (#x88 #x41 #x9d)
    (#x6e #x01 #x6b)))

(define cb-bupu-9
  #((#xf7 #xfc #xfd)
    (#xe0 #xec #xf4)
    (#xbf #xd3 #xe6)
    (#x9e #xbc #xda)
    (#x8c #x96 #xc6)
    (#x8c #x6b #xb1)
    (#x88 #x41 #x9d)
    (#x81 #x0f #x7c)
    (#x4d #x00 #x4b)))

;;;;; GnBu

(define cb-gnbu-3
  #((#xe0 #xf3 #xdb)
    (#xa8 #xdd #xb5)
    (#x43 #xa2 #xca)))

(define cb-gnbu-4
  #((#xf0 #xf9 #xe8)
    (#xba #xe4 #xbc)
    (#x7b #xcc #xc4)
    (#x2b #x8c #xbe)))

(define cb-gnbu-5
  #((#xf0 #xf9 #xe8)
    (#xba #xe4 #xbc)
    (#x7b #xcc #xc4)
    (#x43 #xa2 #xca)
    (#x08 #x68 #xac)))

(define cb-gnbu-6
  #((#xf0 #xf9 #xe8)
    (#xcc #xeb #xc5)
    (#xa8 #xdd #xb5)
    (#x7b #xcc #xc4)
    (#x43 #xa2 #xca)
    (#x08 #x68 #xac)))

(define cb-gnbu-7
  #((#xf0 #xf9 #xe8)
    (#xcc #xeb #xc5)
    (#xa8 #xdd #xb5)
    (#x7b #xcc #xc4)
    (#x4e #xb3 #xd3)
    (#x2b #x8c #xbe)
    (#x08 #x58 #x9e)))

(define cb-gnbu-8
  #((#xf7 #xfc #xf0)
    (#xe0 #xf3 #xdb)
    (#xcc #xeb #xc5)
    (#xa8 #xdd #xb5)
    (#x7b #xcc #xc4)
    (#x4e #xb3 #xd3)
    (#x2b #x8c #xbe)
    (#x08 #x58 #x9e)))

(define cb-gnbu-9
  #((#xf7 #xfc #xf0)
    (#xe0 #xf3 #xdb)
    (#xcc #xeb #xc5)
    (#xa8 #xdd #xb5)
    (#x7b #xcc #xc4)
    (#x4e #xb3 #xd3)
    (#x2b #x8c #xbe)
    (#x08 #x68 #xac)
    (#x08 #x40 #x81)))

;;;;; OrRd

(define cb-orrd-3
  #((#xfe #xe8 #xc8)
    (#xfd #xbb #x84)
    (#xe3 #x4a #x33)))

(define cb-orrd-4
  #((#xfe #xf0 #xd9)
    (#xfd #xcc #x8a)
    (#xfc #x8d #x59)
    (#xd7 #x30 #x1f)))

(define cb-orrd-5
  #((#xfe #xf0 #xd9)
    (#xfd #xcc #x8a)
    (#xfc #x8d #x59)
    (#xe3 #x4a #x33)
    (#xb3 #x00 #x00)))

(define cb-orrd-6
  #((#xfe #xf0 #xd9)
    (#xfd #xd4 #x9e)
    (#xfd #xbb #x84)
    (#xfc #x8d #x59)
    (#xe3 #x4a #x33)
    (#xb3 #x00 #x00)))

(define cb-orrd-7
  #((#xfe #xf0 #xd9)
    (#xfd #xd4 #x9e)
    (#xfd #xbb #x84)
    (#xfc #x8d #x59)
    (#xef #x65 #x48)
    (#xd7 #x30 #x1f)
    (#x99 #x00 #x00)))

(define cb-orrd-8
  #((#xff #xf7 #xec)
    (#xfe #xe8 #xc8)
    (#xfd #xd4 #x9e)
    (#xfd #xbb #x84)
    (#xfc #x8d #x59)
    (#xef #x65 #x48)
    (#xd7 #x30 #x1f)
    (#x99 #x00 #x00)))

(define cb-orrd-9
  #((#xff #xf7 #xec)
    (#xfe #xe8 #xc8)
    (#xfd #xd4 #x9e)
    (#xfd #xbb #x84)
    (#xfc #x8d #x59)
    (#xef #x65 #x48)
    (#xd7 #x30 #x1f)
    (#xb3 #x00 #x00)
    (#x7f #x00 #x00)))

;;;;; PuBu

(define cb-pubu-3
  #((#xec #xe7 #xf2)
    (#xa6 #xbd #xdb)
    (#x2b #x8c #xbe)))

(define cb-pubu-4
  #((#xf1 #xee #xf6)
    (#xbd #xc9 #xe1)
    (#x74 #xa9 #xcf)
    (#x05 #x70 #xb0)))

(define cb-pubu-5
  #((#xf1 #xee #xf6)
    (#xbd #xc9 #xe1)
    (#x74 #xa9 #xcf)
    (#x2b #x8c #xbe)
    (#x04 #x5a #x8d)))

(define cb-pubu-6
  #((#xf1 #xee #xf6)
    (#xd0 #xd1 #xe6)
    (#xa6 #xbd #xdb)
    (#x74 #xa9 #xcf)
    (#x2b #x8c #xbe)
    (#x04 #x5a #x8d)))

(define cb-pubu-7
  #((#xf1 #xee #xf6)
    (#xd0 #xd1 #xe6)
    (#xa6 #xbd #xdb)
    (#x74 #xa9 #xcf)
    (#x36 #x90 #xc0)
    (#x05 #x70 #xb0)
    (#x03 #x4e #x7b)))

(define cb-pubu-8
  #((#xff #xf7 #xfb)
    (#xec #xe7 #xf2)
    (#xd0 #xd1 #xe6)
    (#xa6 #xbd #xdb)
    (#x74 #xa9 #xcf)
    (#x36 #x90 #xc0)
    (#x05 #x70 #xb0)
    (#x03 #x4e #x7b)))

(define cb-pubu-9
  #((#xff #xf7 #xfb)
    (#xec #xe7 #xf2)
    (#xd0 #xd1 #xe6)
    (#xa6 #xbd #xdb)
    (#x74 #xa9 #xcf)
    (#x36 #x90 #xc0)
    (#x05 #x70 #xb0)
    (#x04 #x5a #x8d)
    (#x02 #x38 #x58)))

;;;;; PuBuGn

(define cb-pubugn-3
  #((#xec #xe2 #xf0)
    (#xa6 #xbd #xdb)
    (#x1c #x90 #x99)))

(define cb-pubugn-4
  #((#xf6 #xef #xf7)
    (#xbd #xc9 #xe1)
    (#x67 #xa9 #xcf)
    (#x02 #x81 #x8a)))

(define cb-pubugn-5
  #((#xf6 #xef #xf7)
    (#xbd #xc9 #xe1)
    (#x67 #xa9 #xcf)
    (#x1c #x90 #x99)
    (#x01 #x6c #x59)))

(define cb-pubugn-6
  #((#xf6 #xef #xf7)
    (#xd0 #xd1 #xe6)
    (#xa6 #xbd #xdb)
    (#x67 #xa9 #xcf)
    (#x1c #x90 #x99)
    (#x01 #x6c #x59)))

(define cb-pubugn-7
  #((#xf6 #xef #xf7)
    (#xd0 #xd1 #xe6)
    (#xa6 #xbd #xdb)
    (#x67 #xa9 #xcf)
    (#x36 #x90 #xc0)
    (#x02 #x81 #x8a)
    (#x01 #x64 #x50)))

(define cb-pubugn-8
  #((#xff #xf7 #xfb)
    (#xec #xe2 #xf0)
    (#xd0 #xd1 #xe6)
    (#xa6 #xbd #xdb)
    (#x67 #xa9 #xcf)
    (#x36 #x90 #xc0)
    (#x02 #x81 #x8a)
    (#x01 #x64 #x50)))

(define cb-pubugn-9
  #((#xff #xf7 #xfb)
    (#xec #xe2 #xf0)
    (#xd0 #xd1 #xe6)
    (#xa6 #xbd #xdb)
    (#x67 #xa9 #xcf)
    (#x36 #x90 #xc0)
    (#x02 #x81 #x8a)
    (#x01 #x6c #x59)
    (#x01 #x46 #x36)))

;;;;; PuRd

(define cb-purd-3
  #((#xe7 #xe1 #xef)
    (#xc9 #x94 #xc7)
    (#xdd #x1c #x77)))

(define cb-purd-4
  #((#xf1 #xee #xf6)
    (#xd7 #xb5 #xd8)
    (#xdf #x65 #xb0)
    (#xce #x12 #x56)))

(define cb-purd-5
  #((#xf1 #xee #xf6)
    (#xd7 #xb5 #xd8)
    (#xdf #x65 #xb0)
    (#xdd #x1c #x77)
    (#x98 #x00 #x43)))

(define cb-purd-6
  #((#xf1 #xee #xf6)
    (#xd4 #xb9 #xda)
    (#xc9 #x94 #xc7)
    (#xdf #x65 #xb0)
    (#xdd #x1c #x77)
    (#x98 #x00 #x43)))

(define cb-purd-7
  #((#xf1 #xee #xf6)
    (#xd4 #xb9 #xda)
    (#xc9 #x94 #xc7)
    (#xdf #x65 #xb0)
    (#xe7 #x29 #x8a)
    (#xce #x12 #x56)
    (#x91 #x00 #x3f)))

(define cb-purd-8
  #((#xf7 #xf4 #xf9)
    (#xe7 #xe1 #xef)
    (#xd4 #xb9 #xda)
    (#xc9 #x94 #xc7)
    (#xdf #x65 #xb0)
    (#xe7 #x29 #x8a)
    (#xce #x12 #x56)
    (#x91 #x00 #x3f)))

(define cb-purd-9
  #((#xf7 #xf4 #xf9)
    (#xe7 #xe1 #xef)
    (#xd4 #xb9 #xda)
    (#xc9 #x94 #xc7)
    (#xdf #x65 #xb0)
    (#xe7 #x29 #x8a)
    (#xce #x12 #x56)
    (#x98 #x00 #x43)
    (#x67 #x00 #x1f)))

;;;;; RdPu

(define cb-rdpu-3
  #((#xfd #xe0 #xdd)
    (#xfa #x9f #xb5)
    (#xc5 #x1b #x8a)))

(define cb-rdpu-4
  #((#xfe #xeb #xe2)
    (#xfb #xb4 #xb9)
    (#xf7 #x68 #xa1)
    (#xae #x01 #x7e)))

(define cb-rdpu-5
  #((#xfe #xeb #xe2)
    (#xfb #xb4 #xb9)
    (#xf7 #x68 #xa1)
    (#xc5 #x1b #x8a)
    (#x7a #x01 #x77)))

(define cb-rdpu-6
  #((#xfe #xeb #xe2)
    (#xfc #xc5 #xc0)
    (#xfa #x9f #xb5)
    (#xf7 #x68 #xa1)
    (#xc5 #x1b #x8a)
    (#x7a #x01 #x77)))

(define cb-rdpu-7
  #((#xfe #xeb #xe2)
    (#xfc #xc5 #xc0)
    (#xfa #x9f #xb5)
    (#xf7 #x68 #xa1)
    (#xdd #x34 #x97)
    (#xae #x01 #x7e)
    (#x7a #x01 #x77)))

(define cb-rdpu-8
  #((#xff #xf7 #xf3)
    (#xfd #xe0 #xdd)
    (#xfc #xc5 #xc0)
    (#xfa #x9f #xb5)
    (#xf7 #x68 #xa1)
    (#xdd #x34 #x97)
    (#xae #x01 #x7e)
    (#x7a #x01 #x77)))

(define cb-rdpu-9
  #((#xff #xf7 #xf3)
    (#xfd #xe0 #xdd)
    (#xfc #xc5 #xc0)
    (#xfa #x9f #xb5)
    (#xf7 #x68 #xa1)
    (#xdd #x34 #x97)
    (#xae #x01 #x7e)
    (#x7a #x01 #x77)
    (#x49 #x00 #x6a)))

;;;;; YlGn

(define cb-ylgn-3
  #((#xf7 #xfc #xb9)
    (#xad #xdd #x8e)
    (#x31 #xa3 #x54)))

(define cb-ylgn-4
  #((#xff #xff #xcc)
    (#xc2 #xe6 #x99)
    (#x78 #xc6 #x79)
    (#x23 #x84 #x43)))

(define cb-ylgn-5
  #((#xff #xff #xcc)
    (#xc2 #xe6 #x99)
    (#x78 #xc6 #x79)
    (#x31 #xa3 #x54)
    (#x00 #x68 #x37)))

(define cb-ylgn-6
  #((#xff #xff #xcc)
    (#xd9 #xf0 #xa3)
    (#xad #xdd #x8e)
    (#x78 #xc6 #x79)
    (#x31 #xa3 #x54)
    (#x00 #x68 #x37)))

(define cb-ylgn-7
  #((#xff #xff #xcc)
    (#xd9 #xf0 #xa3)
    (#xad #xdd #x8e)
    (#x78 #xc6 #x79)
    (#x41 #xab #x5d)
    (#x23 #x84 #x43)
    (#x00 #x5a #x32)))

(define cb-ylgn-8
  #((#xff #xff #xe5)
    (#xf7 #xfc #xb9)
    (#xd9 #xf0 #xa3)
    (#xad #xdd #x8e)
    (#x78 #xc6 #x79)
    (#x41 #xab #x5d)
    (#x23 #x84 #x43)
    (#x00 #x5a #x32)))

(define cb-ylgn-9
  #((#xff #xff #xe5)
    (#xf7 #xfc #xb9)
    (#xd9 #xf0 #xa3)
    (#xad #xdd #x8e)
    (#x78 #xc6 #x79)
    (#x41 #xab #x5d)
    (#x23 #x84 #x43)
    (#x00 #x68 #x37)
    (#x00 #x45 #x29)))

;;;;; YlGnBu

(define cb-ylgnbu-3
  #((#xed #xf8 #xb1)
    (#x7f #xcd #xbb)
    (#x2c #x7f #xb8)))

(define cb-ylgnbu-4
  #((#xff #xff #xcc)
    (#xa1 #xda #xb4)
    (#x41 #xb6 #xc4)
    (#x22 #x5e #xa8)))

(define cb-ylgnbu-5
  #((#xff #xff #xcc)
    (#xa1 #xda #xb4)
    (#x41 #xb6 #xc4)
    (#x2c #x7f #xb8)
    (#x25 #x34 #x94)))

(define cb-ylgnbu-6
  #((#xff #xff #xcc)
    (#xc7 #xe9 #xb4)
    (#x7f #xcd #xbb)
    (#x41 #xb6 #xc4)
    (#x2c #x7f #xb8)
    (#x25 #x34 #x94)))

(define cb-ylgnbu-7
  #((#xff #xff #xcc)
    (#xc7 #xe9 #xb4)
    (#x7f #xcd #xbb)
    (#x41 #xb6 #xc4)
    (#x1d #x91 #xc0)
    (#x22 #x5e #xa8)
    (#x0c #x2c #x84)))

(define cb-ylgnbu-8
  #((#xff #xff #xd9)
    (#xed #xf8 #xb1)
    (#xc7 #xe9 #xb4)
    (#x7f #xcd #xbb)
    (#x41 #xb6 #xc4)
    (#x1d #x91 #xc0)
    (#x22 #x5e #xa8)
    (#x0c #x2c #x84)))

(define cb-ylgnbu-9
  #((#xff #xff #xd9)
    (#xed #xf8 #xb1)
    (#xc7 #xe9 #xb4)
    (#x7f #xcd #xbb)
    (#x41 #xb6 #xc4)
    (#x1d #x91 #xc0)
    (#x22 #x5e #xa8)
    (#x25 #x34 #x94)
    (#x08 #x1d #x58)))

;;;;; YlOrBr

(define cb-ylorbr-3
  #((#xff #xf7 #xbc)
    (#xfe #xc4 #x4f)
    (#xd9 #x5f #x0e)))

(define cb-ylorbr-4
  #((#xff #xff #xd4)
    (#xfe #xd9 #x8e)
    (#xfe #x99 #x29)
    (#xcc #x4c #x02)))

(define cb-ylorbr-5
  #((#xff #xff #xd4)
    (#xfe #xd9 #x8e)
    (#xfe #x99 #x29)
    (#xd9 #x5f #x0e)
    (#x99 #x34 #x04)))

(define cb-ylorbr-6
  #((#xff #xff #xd4)
    (#xfe #xe3 #x91)
    (#xfe #xc4 #x4f)
    (#xfe #x99 #x29)
    (#xd9 #x5f #x0e)
    (#x99 #x34 #x04)))

(define cb-ylorbr-7
  #((#xff #xff #xd4)
    (#xfe #xe3 #x91)
    (#xfe #xc4 #x4f)
    (#xfe #x99 #x29)
    (#xec #x70 #x14)
    (#xcc #x4c #x02)
    (#x8c #x2d #x04)))

(define cb-ylorbr-8
  #((#xff #xff #xe5)
    (#xff #xf7 #xbc)
    (#xfe #xe3 #x91)
    (#xfe #xc4 #x4f)
    (#xfe #x99 #x29)
    (#xec #x70 #x14)
    (#xcc #x4c #x02)
    (#x8c #x2d #x04)))

(define cb-ylorbr-9
  #((#xff #xff #xe5)
    (#xff #xf7 #xbc)
    (#xfe #xe3 #x91)
    (#xfe #xc4 #x4f)
    (#xfe #x99 #x29)
    (#xec #x70 #x14)
    (#xcc #x4c #x02)
    (#x99 #x34 #x04)
    (#x66 #x25 #x06)))

;;;;; YlOrRd

(define cb-ylorrd-3
  #((#xff #xed #xa0)
    (#xfe #xb2 #x4c)
    (#xf0 #x3b #x20)))

(define cb-ylorrd-4
  #((#xff #xff #xb2)
    (#xfe #xcc #x5c)
    (#xfd #x8d #x3c)
    (#xe3 #x1a #x1c)))

(define cb-ylorrd-5
  #((#xff #xff #xb2)
    (#xfe #xcc #x5c)
    (#xfd #x8d #x3c)
    (#xf0 #x3b #x20)
    (#xbd #x00 #x26)))

(define cb-ylorrd-6
  #((#xff #xff #xb2)
    (#xfe #xd9 #x76)
    (#xfe #xb2 #x4c)
    (#xfd #x8d #x3c)
    (#xf0 #x3b #x20)
    (#xbd #x00 #x26)))

(define cb-ylorrd-7
  #((#xff #xff #xb2)
    (#xfe #xd9 #x76)
    (#xfe #xb2 #x4c)
    (#xfd #x8d #x3c)
    (#xfc #x4e #x2a)
    (#xe3 #x1a #x1c)
    (#xb1 #x00 #x26)))

(define cb-ylorrd-8
  #((#xff #xff #xcc)
    (#xff #xed #xa0)
    (#xfe #xd9 #x76)
    (#xfe #xb2 #x4c)
    (#xfd #x8d #x3c)
    (#xfc #x4e #x2a)
    (#xe3 #x1a #x1c)
    (#xb1 #x00 #x26)))

(define cb-ylorrd-9
  #((#xff #xff #xcc)
    (#xff #xed #xa0)
    (#xfe #xd9 #x76)
    (#xfe #xb2 #x4c)
    (#xfd #x8d #x3c)
    (#xfc #x4e #x2a)
    (#xe3 #x1a #x1c)
    (#xbd #x00 #x26)
    (#x80 #x00 #x26)))

;;;; Single Hue
;;;;; Blues

(define cb-blues-3
  #((#xde #xeb #xf7)
    (#x9e #xca #xe1)
    (#x31 #x82 #xbd)))

(define cb-blues-4
  #((#xef #xf3 #xff)
    (#xbd #xd7 #xe7)
    (#x6b #xae #xd6)
    (#x21 #x71 #xb5)))

(define cb-blues-5
  #((#xef #xf3 #xff)
    (#xbd #xd7 #xe7)
    (#x6b #xae #xd6)
    (#x31 #x82 #xbd)
    (#x08 #x51 #x9c)))

(define cb-blues-6
  #((#xef #xf3 #xff)
    (#xc6 #xdb #xef)
    (#x9e #xca #xe1)
    (#x6b #xae #xd6)
    (#x31 #x82 #xbd)
    (#x08 #x51 #x9c)))

(define cb-blues-7
  #((#xef #xf3 #xff)
    (#xc6 #xdb #xef)
    (#x9e #xca #xe1)
    (#x6b #xae #xd6)
    (#x42 #x92 #xc6)
    (#x21 #x71 #xb5)
    (#x08 #x45 #x94)))

(define cb-blues-8
  #((#xf7 #xfb #xff)
    (#xde #xeb #xf7)
    (#xc6 #xdb #xef)
    (#x9e #xca #xe1)
    (#x6b #xae #xd6)
    (#x42 #x92 #xc6)
    (#x21 #x71 #xb5)
    (#x08 #x45 #x94)))

(define cb-blues-9
  #((#xf7 #xfb #xff)
    (#xde #xeb #xf7)
    (#xc6 #xdb #xef)
    (#x9e #xca #xe1)
    (#x6b #xae #xd6)
    (#x42 #x92 #xc6)
    (#x21 #x71 #xb5)
    (#x08 #x51 #x9c)
    (#x08 #x30 #x6b)))

;;;;; Greens

(define cb-greens-3
  #((#xe5 #xf5 #xe0)
    (#xa1 #xd9 #x9b)
    (#x31 #xa3 #x54)))

(define cb-greens-4
  #((#xed #xf8 #xe9)
    (#xba #xe4 #xb3)
    (#x74 #xc4 #x76)
    (#x23 #x8b #x45)))

(define cb-greens-5
  #((#xed #xf8 #xe9)
    (#xba #xe4 #xb3)
    (#x74 #xc4 #x76)
    (#x31 #xa3 #x54)
    (#x00 #x6d #x2c)))

(define cb-greens-6
  #((#xed #xf8 #xe9)
    (#xc7 #xe9 #xc0)
    (#xa1 #xd9 #x9b)
    (#x74 #xc4 #x76)
    (#x31 #xa3 #x54)
    (#x00 #x6d #x2c)))

(define cb-greens-7
  #((#xed #xf8 #xe9)
    (#xc7 #xe9 #xc0)
    (#xa1 #xd9 #x9b)
    (#x74 #xc4 #x76)
    (#x41 #xab #x5d)
    (#x23 #x8b #x45)
    (#x00 #x5a #x32)))

(define cb-greens-8
  #((#xf7 #xfc #xf5)
    (#xe5 #xf5 #xe0)
    (#xc7 #xe9 #xc0)
    (#xa1 #xd9 #x9b)
    (#x74 #xc4 #x76)
    (#x41 #xab #x5d)
    (#x23 #x8b #x45)
    (#x00 #x5a #x32)))

(define cb-greens-9
  #((#xf7 #xfc #xf5)
    (#xe5 #xf5 #xe0)
    (#xc7 #xe9 #xc0)
    (#xa1 #xd9 #x9b)
    (#x74 #xc4 #x76)
    (#x41 #xab #x5d)
    (#x23 #x8b #x45)
    (#x00 #x6d #x2c)
    (#x00 #x44 #x1b)))

;;;;; Greys

(define cb-greys-3
  #((#xf0 #xf0 #xf0)
    (#xbd #xbd #xbd)
    (#x63 #x63 #x63)))

(define cb-greys-4
  #((#xf7 #xf7 #xf7)
    (#xcc #xcc #xcc)
    (#x96 #x96 #x96)
    (#x52 #x52 #x52)))

(define cb-greys-5
  #((#xf7 #xf7 #xf7)
    (#xcc #xcc #xcc)
    (#x96 #x96 #x96)
    (#x63 #x63 #x63)
    (#x25 #x25 #x25)))

(define cb-greys-6
  #((#xf7 #xf7 #xf7)
    (#xd9 #xd9 #xd9)
    (#xbd #xbd #xbd)
    (#x96 #x96 #x96)
    (#x63 #x63 #x63)
    (#x25 #x25 #x25)))

(define cb-greys-7
  #((#xf7 #xf7 #xf7)
    (#xd9 #xd9 #xd9)
    (#xbd #xbd #xbd)
    (#x96 #x96 #x96)
    (#x73 #x73 #x73)
    (#x52 #x52 #x52)
    (#x25 #x25 #x25)))

(define cb-greys-8
  #((#xff #xff #xff)
    (#xf0 #xf0 #xf0)
    (#xd9 #xd9 #xd9)
    (#xbd #xbd #xbd)
    (#x96 #x96 #x96)
    (#x73 #x73 #x73)
    (#x52 #x52 #x52)
    (#x25 #x25 #x25)))

(define cb-greys-9
  #((#xff #xff #xff)
    (#xf0 #xf0 #xf0)
    (#xd9 #xd9 #xd9)
    (#xbd #xbd #xbd)
    (#x96 #x96 #x96)
    (#x73 #x73 #x73)
    (#x52 #x52 #x52)
    (#x25 #x25 #x25)
    (#x00 #x00 #x00)))

;;;;; Oranges

(define cb-oranges-3
  #((#xfe #xe6 #xce)
    (#xfd #xae #x6b)
    (#xe6 #x55 #x0d)))

(define cb-oranges-4
  #((#xfe #xed #xde)
    (#xfd #xbe #x85)
    (#xfd #x8d #x3c)
    (#xd9 #x47 #x01)))

(define cb-oranges-5
  #((#xfe #xed #xde)
    (#xfd #xbe #x85)
    (#xfd #x8d #x3c)
    (#xe6 #x55 #x0d)
    (#xa6 #x36 #x03)))

(define cb-oranges-6
  #((#xfe #xed #xde)
    (#xfd #xd0 #xa2)
    (#xfd #xae #x6b)
    (#xfd #x8d #x3c)
    (#xe6 #x55 #x0d)
    (#xa6 #x36 #x03)))

(define cb-oranges-7
  #((#xfe #xed #xde)
    (#xfd #xd0 #xa2)
    (#xfd #xae #x6b)
    (#xfd #x8d #x3c)
    (#xf1 #x69 #x13)
    (#xd9 #x48 #x01)
    (#x8c #x2d #x04)))

(define cb-oranges-8
  #((#xff #xf5 #xeb)
    (#xfe #xe6 #xce)
    (#xfd #xd0 #xa2)
    (#xfd #xae #x6b)
    (#xfd #x8d #x3c)
    (#xf1 #x69 #x13)
    (#xd9 #x48 #x01)
    (#x8c #x2d #x04)))

(define cb-oranges-9
  #((#xff #xf5 #xeb)
    (#xfe #xe6 #xce)
    (#xfd #xd0 #xa2)
    (#xfd #xae #x6b)
    (#xfd #x8d #x3c)
    (#xf1 #x69 #x13)
    (#xd9 #x48 #x01)
    (#xa6 #x36 #x03)
    (#x7f #x27 #x04)))

;;;;; Purples

(define cb-purples-3
  #((#xef #xed #xf5)
    (#xbc #xbd #xdc)
    (#x75 #x6b #xb1)))

(define cb-purples-4
  #((#xf2 #xf0 #xf7)
    (#xcb #xc9 #xe2)
    (#x9e #x9a #xc8)
    (#x6a #x51 #xa3)))

(define cb-purples-5
  #((#xf2 #xf0 #xf7)
    (#xcb #xc9 #xe2)
    (#x9e #x9a #xc8)
    (#x75 #x6b #xb1)
    (#x54 #x27 #x8f)))

(define cb-purples-6
  #((#xf2 #xf0 #xf7)
    (#xda #xda #xeb)
    (#xbc #xbd #xdc)
    (#x9e #x9a #xc8)
    (#x75 #x6b #xb1)
    (#x54 #x27 #x8f)))

(define cb-purples-7
  #((#xf2 #xf0 #xf7)
    (#xda #xda #xeb)
    (#xbc #xbd #xdc)
    (#x9e #x9a #xc8)
    (#x80 #x7d #xba)
    (#x6a #x51 #xa3)
    (#x4a #x14 #x86)))

(define cb-purples-8
  #((#xfc #xfb #xfd)
    (#xef #xed #xf5)
    (#xda #xda #xeb)
    (#xbc #xbd #xdc)
    (#x9e #x9a #xc8)
    (#x80 #x7d #xba)
    (#x6a #x51 #xa3)
    (#x4a #x14 #x86)))

(define cb-purples-9
  #((#xfc #xfb #xfd)
    (#xef #xed #xf5)
    (#xda #xda #xeb)
    (#xbc #xbd #xdc)
    (#x9e #x9a #xc8)
    (#x80 #x7d #xba)
    (#x6a #x51 #xa3)
    (#x54 #x27 #x8f)
    (#x3f #x00 #x7d)))

;;;;; Reds

(define cb-reds-3
  #((#xfe #xe0 #xd2)
    (#xfc #x92 #x72)
    (#xde #x2d #x26)))

(define cb-reds-4
  #((#xfe #xe5 #xd9)
    (#xfc #xae #x91)
    (#xfb #x6a #x4a)
    (#xcb #x18 #x1d)))

(define cb-reds-5
  #((#xfe #xe5 #xd9)
    (#xfc #xae #x91)
    (#xfb #x6a #x4a)
    (#xde #x2d #x26)
    (#xa5 #x0f #x15)))

(define cb-reds-6
  #((#xfe #xe5 #xd9)
    (#xfc #xbb #xa1)
    (#xfc #x92 #x72)
    (#xfb #x6a #x4a)
    (#xde #x2d #x26)
    (#xa5 #x0f #x15)))

(define cb-reds-7
  #((#xfe #xe5 #xd9)
    (#xfc #xbb #xa1)
    (#xfc #x92 #x72)
    (#xfb #x6a #x4a)
    (#xef #x3b #x2c)
    (#xcb #x18 #x1d)
    (#x99 #x00 #x0d)))

(define cb-reds-8
  #((#xff #xf5 #xf0)
    (#xfe #xe0 #xd2)
    (#xfc #xbb #xa1)
    (#xfc #x92 #x72)
    (#xfb #x6a #x4a)
    (#xef #x3b #x2c)
    (#xcb #x18 #x1d)
    (#x99 #x00 #x0d)))

(define cb-reds-9
  #((#xff #xf5 #xf0)
    (#xfe #xe0 #xd2)
    (#xfc #xbb #xa1)
    (#xfc #x92 #x72)
    (#xfb #x6a #x4a)
    (#xef #x3b #x2c)
    (#xcb #x18 #x1d)
    (#xa5 #x0f #x15)
    (#x67 #x00 #x0d)))

;;; Diverging

;;;; BrBG

(define cb-brbg-3
  #((#xd8 #xb3 #x65)
    (#xf5 #xf5 #xf5)
    (#x5a #xb4 #xac)))

(define cb-brbg-4
  #((#xa6 #x61 #x1a)
    (#xdf #xc2 #x7d)
    (#x80 #xcd #xc1)
    (#x01 #x85 #x71)))

(define cb-brbg-5
  #((#xa6 #x61 #x1a)
    (#xdf #xc2 #x7d)
    (#xf5 #xf5 #xf5)
    (#x80 #xcd #xc1)
    (#x01 #x85 #x71)))

(define cb-brbg-6
  #((#x8c #x51 #x0a)
    (#xd8 #xb3 #x65)
    (#xf6 #xe8 #xc3)
    (#xc7 #xea #xe5)
    (#x5a #xb4 #xac)
    (#x01 #x66 #x5e)))

(define cb-brbg-7
  #((#x8c #x51 #x0a)
    (#xd8 #xb3 #x65)
    (#xf6 #xe8 #xc3)
    (#xf5 #xf5 #xf5)
    (#xc7 #xea #xe5)
    (#x5a #xb4 #xac)
    (#x01 #x66 #x5e)))

(define cb-brbg-8
  #((#x8c #x51 #x0a)
    (#xbf #x81 #x2d)
    (#xdf #xc2 #x7d)
    (#xf6 #xe8 #xc3)
    (#xc7 #xea #xe5)
    (#x80 #xcd #xc1)
    (#x35 #x97 #x8f)
    (#x01 #x66 #x5e)))

(define cb-brbg-9
  #((#x8c #x51 #x0a)
    (#xbf #x81 #x2d)
    (#xdf #xc2 #x7d)
    (#xf6 #xe8 #xc3)
    (#xf5 #xf5 #xf5)
    (#xc7 #xea #xe5)
    (#x80 #xcd #xc1)
    (#x35 #x97 #x8f)
    (#x01 #x66 #x5e)))

(define cb-brbg-10
  #((#x54 #x30 #x05)
    (#x8c #x51 #x0a)
    (#xbf #x81 #x2d)
    (#xdf #xc2 #x7d)
    (#xf6 #xe8 #xc3)
    (#xc7 #xea #xe5)
    (#x80 #xcd #xc1)
    (#x35 #x97 #x8f)
    (#x01 #x66 #x5e)
    (#x00 #x3c #x30)))

(define cb-brbg-11
  #((#x54 #x30 #x05)
    (#x8c #x51 #x0a)
    (#xbf #x81 #x2d)
    (#xdf #xc2 #x7d)
    (#xf6 #xe8 #xc3)
    (#xf5 #xf5 #xf5)
    (#xc7 #xea #xe5)
    (#x80 #xcd #xc1)
    (#x35 #x97 #x8f)
    (#x01 #x66 #x5e)
    (#x00 #x3c #x30)))

;;;; PiYG

(define cb-piyg-3
  #((#xe9 #xa3 #xc9)
    (#xf7 #xf7 #xf7)
    (#xa1 #xd7 #x6a)))

(define cb-piyg-4
  #((#xd0 #x1c #x8b)
    (#xf1 #xb6 #xda)
    (#xb8 #xe1 #x86)
    (#x4d #xac #x26)))

(define cb-piyg-5
  #((#xd0 #x1c #x8b)
    (#xf1 #xb6 #xda)
    (#xf7 #xf7 #xf7)
    (#xb8 #xe1 #x86)
    (#x4d #xac #x26)))

(define cb-piyg-6
  #((#xc5 #x1b #x7d)
    (#xe9 #xa3 #xc9)
    (#xfd #xe0 #xef)
    (#xe6 #xf5 #xd0)
    (#xa1 #xd7 #x6a)
    (#x4d #x92 #x21)))

(define cb-piyg-7
  #((#xc5 #x1b #x7d)
    (#xe9 #xa3 #xc9)
    (#xfd #xe0 #xef)
    (#xf7 #xf7 #xf7)
    (#xe6 #xf5 #xd0)
    (#xa1 #xd7 #x6a)
    (#x4d #x92 #x21)))

(define cb-piyg-8
  #((#xc5 #x1b #x7d)
    (#xde #x77 #xae)
    (#xf1 #xb6 #xda)
    (#xfd #xe0 #xef)
    (#xe6 #xf5 #xd0)
    (#xb8 #xe1 #x86)
    (#x7f #xbc #x41)
    (#x4d #x92 #x21)))

(define cb-piyg-9
  #((#xc5 #x1b #x7d)
    (#xde #x77 #xae)
    (#xf1 #xb6 #xda)
    (#xfd #xe0 #xef)
    (#xf7 #xf7 #xf7)
    (#xe6 #xf5 #xd0)
    (#xb8 #xe1 #x86)
    (#x7f #xbc #x41)
    (#x4d #x92 #x21)))

(define cb-piyg-10
  #((#x8e #x01 #x52)
    (#xc5 #x1b #x7d)
    (#xde #x77 #xae)
    (#xf1 #xb6 #xda)
    (#xfd #xe0 #xef)
    (#xe6 #xf5 #xd0)
    (#xb8 #xe1 #x86)
    (#x7f #xbc #x41)
    (#x4d #x92 #x21)
    (#x27 #x64 #x19)))

(define cb-piyg-11
  #((#x8e #x01 #x52)
    (#xc5 #x1b #x7d)
    (#xde #x77 #xae)
    (#xf1 #xb6 #xda)
    (#xfd #xe0 #xef)
    (#xf7 #xf7 #xf7)
    (#xe6 #xf5 #xd0)
    (#xb8 #xe1 #x86)
    (#x7f #xbc #x41)
    (#x4d #x92 #x21)
    (#x27 #x64 #x19)))

;;;; PRGn

(define cb-prgn-3
  #((#xaf #x8d #xc3)
    (#xf7 #xf7 #xf7)
    (#x7f #xbf #x7b)))

(define cb-prgn-4
  #((#x7b #x32 #x94)
    (#xc2 #xa5 #xcf)
    (#xa6 #xdb #xa0)
    (#x00 #x88 #x37)))

(define cb-prgn-5
  #((#x7b #x32 #x94)
    (#xc2 #xa5 #xcf)
    (#xf7 #xf7 #xf7)
    (#xa6 #xdb #xa0)
    (#x00 #x88 #x37)))

(define cb-prgn-6
  #((#x76 #x2a #x83)
    (#xaf #x8d #xc3)
    (#xe7 #xd4 #xe8)
    (#xd9 #xf0 #xd3)
    (#x7f #xbf #x7b)
    (#x1b #x78 #x37)))

(define cb-prgn-7
  #((#x76 #x2a #x83)
    (#xaf #x8d #xc3)
    (#xe7 #xd4 #xe8)
    (#xf7 #xf7 #xf7)
    (#xd9 #xf0 #xd3)
    (#x7f #xbf #x7b)
    (#x1b #x78 #x37)))

(define cb-prgn-8
  #((#x76 #x2a #x83)
    (#x99 #x70 #xab)
    (#xc2 #xa5 #xcf)
    (#xe7 #xd4 #xe8)
    (#xd9 #xf0 #xd3)
    (#xa6 #xdb #xa0)
    (#x5a #xae #x61)
    (#x1b #x78 #x37)))

(define cb-prgn-9
  #((#x76 #x2a #x83)
    (#x99 #x70 #xab)
    (#xc2 #xa5 #xcf)
    (#xe7 #xd4 #xe8)
    (#xf7 #xf7 #xf7)
    (#xd9 #xf0 #xd3)
    (#xa6 #xdb #xa0)
    (#x5a #xae #x61)
    (#x1b #x78 #x37)))

(define cb-prgn-10
  #((#x40 #x00 #x4b)
    (#x76 #x2a #x83)
    (#x99 #x70 #xab)
    (#xc2 #xa5 #xcf)
    (#xe7 #xd4 #xe8)
    (#xd9 #xf0 #xd3)
    (#xa6 #xdb #xa0)
    (#x5a #xae #x61)
    (#x1b #x78 #x37)
    (#x00 #x44 #x1b)))

(define cb-prgn-11
  #((#x40 #x00 #x4b)
    (#x76 #x2a #x83)
    (#x99 #x70 #xab)
    (#xc2 #xa5 #xcf)
    (#xe7 #xd4 #xe8)
    (#xf7 #xf7 #xf7)
    (#xd9 #xf0 #xd3)
    (#xa6 #xdb #xa0)
    (#x5a #xae #x61)
    (#x1b #x78 #x37)
    (#x00 #x44 #x1b)))

;;;; PuOr

(define cb-puor-3
  #((#xf1 #xa3 #x40)
    (#xf7 #xf7 #xf7)
    (#x99 #x8e #xc3)))

(define cb-puor-4
  #((#xe6 #x61 #x01)
    (#xfd #xb8 #x63)
    (#xb2 #xab #xd2)
    (#x5e #x3c #x99)))

(define cb-puor-5
  #((#xe6 #x61 #x01)
    (#xfd #xb8 #x63)
    (#xf7 #xf7 #xf7)
    (#xb2 #xab #xd2)
    (#x5e #x3c #x99)))

(define cb-puor-6
  #((#xb3 #x58 #x06)
    (#xf1 #xa3 #x40)
    (#xfe #xe0 #xb6)
    (#xd8 #xda #xeb)
    (#x99 #x8e #xc3)
    (#x54 #x27 #x88)))

(define cb-puor-7
  #((#xb3 #x58 #x06)
    (#xf1 #xa3 #x40)
    (#xfe #xe0 #xb6)
    (#xf7 #xf7 #xf7)
    (#xd8 #xda #xeb)
    (#x99 #x8e #xc3)
    (#x54 #x27 #x88)))

(define cb-puor-8
  #((#xb3 #x58 #x06)
    (#xe0 #x82 #x14)
    (#xfd #xb8 #x63)
    (#xfe #xe0 #xb6)
    (#xd8 #xda #xeb)
    (#xb2 #xab #xd2)
    (#x80 #x73 #xac)
    (#x54 #x27 #x88)))

(define cb-puor-9
  #((#xb3 #x58 #x06)
    (#xe0 #x82 #x14)
    (#xfd #xb8 #x63)
    (#xfe #xe0 #xb6)
    (#xf7 #xf7 #xf7)
    (#xd8 #xda #xeb)
    (#xb2 #xab #xd2)
    (#x80 #x73 #xac)
    (#x54 #x27 #x88)))

(define cb-puor-10
  #((#x7f #x3b #x08)
    (#xb3 #x58 #x06)
    (#xe0 #x82 #x14)
    (#xfd #xb8 #x63)
    (#xfe #xe0 #xb6)
    (#xd8 #xda #xeb)
    (#xb2 #xab #xd2)
    (#x80 #x73 #xac)
    (#x54 #x27 #x88)
    (#x2d #x00 #x4b)))

(define cb-puor-11
  #((#x7f #x3b #x08)
    (#xb3 #x58 #x06)
    (#xe0 #x82 #x14)
    (#xfd #xb8 #x63)
    (#xfe #xe0 #xb6)
    (#xf7 #xf7 #xf7)
    (#xd8 #xda #xeb)
    (#xb2 #xab #xd2)
    (#x80 #x73 #xac)
    (#x54 #x27 #x88)
    (#x2d #x00 #x4b)))

;;;; RdBu

(define cb-rdbu-3
  #((#xef #x8a #x62)
    (#xf7 #xf7 #xf7)
    (#x67 #xa9 #xcf)))

(define cb-rdbu-4
  #((#xca #x00 #x20)
    (#xf4 #xa5 #x82)
    (#x92 #xc5 #xde)
    (#x05 #x71 #xb0)))

(define cb-rdbu-5
  #((#xca #x00 #x20)
    (#xf4 #xa5 #x82)
    (#xf7 #xf7 #xf7)
    (#x92 #xc5 #xde)
    (#x05 #x71 #xb0)))

(define cb-rdbu-6
  #((#xb2 #x18 #x2b)
    (#xef #x8a #x62)
    (#xfd #xdb #xc7)
    (#xd1 #xe5 #xf0)
    (#x67 #xa9 #xcf)
    (#x21 #x66 #xac)))

(define cb-rdbu-7
  #((#xb2 #x18 #x2b)
    (#xef #x8a #x62)
    (#xfd #xdb #xc7)
    (#xf7 #xf7 #xf7)
    (#xd1 #xe5 #xf0)
    (#x67 #xa9 #xcf)
    (#x21 #x66 #xac)))

(define cb-rdbu-8
  #((#xb2 #x18 #x2b)
    (#xd6 #x60 #x4d)
    (#xf4 #xa5 #x82)
    (#xfd #xdb #xc7)
    (#xd1 #xe5 #xf0)
    (#x92 #xc5 #xde)
    (#x43 #x93 #xc3)
    (#x21 #x66 #xac)))

(define cb-rdbu-9
  #((#xb2 #x18 #x2b)
    (#xd6 #x60 #x4d)
    (#xf4 #xa5 #x82)
    (#xfd #xdb #xc7)
    (#xf7 #xf7 #xf7)
    (#xd1 #xe5 #xf0)
    (#x92 #xc5 #xde)
    (#x43 #x93 #xc3)
    (#x21 #x66 #xac)))

(define cb-rdbu-10
  #((#x67 #x00 #x1f)
    (#xb2 #x18 #x2b)
    (#xd6 #x60 #x4d)
    (#xf4 #xa5 #x82)
    (#xfd #xdb #xc7)
    (#xd1 #xe5 #xf0)
    (#x92 #xc5 #xde)
    (#x43 #x93 #xc3)
    (#x21 #x66 #xac)
    (#x05 #x30 #x61)))

(define cb-rdbu-11
  #((#x67 #x00 #x1f)
    (#xb2 #x18 #x2b)
    (#xd6 #x60 #x4d)
    (#xf4 #xa5 #x82)
    (#xfd #xdb #xc7)
    (#xf7 #xf7 #xf7)
    (#xd1 #xe5 #xf0)
    (#x92 #xc5 #xde)
    (#x43 #x93 #xc3)
    (#x21 #x66 #xac)
    (#x05 #x30 #x61)))

;;;; RdGy

(define cb-rdgy-3
  #((#xef #x8a #x62)
    (#xff #xff #xff)
    (#x99 #x99 #x99)))

(define cb-rdgy-4
  #((#xca #x00 #x20)
    (#xf4 #xa5 #x82)
    (#xba #xba #xba)
    (#x40 #x40 #x40)))

(define cb-rdgy-5
  #((#xca #x00 #x20)
    (#xf4 #xa5 #x82)
    (#xff #xff #xff)
    (#xba #xba #xba)
    (#x40 #x40 #x40)))

(define cb-rdgy-6
  #((#xb2 #x18 #x2b)
    (#xef #x8a #x62)
    (#xfd #xdb #xc7)
    (#xe0 #xe0 #xe0)
    (#x99 #x99 #x99)
    (#x4d #x4d #x4d)))

(define cb-rdgy-7
  #((#xb2 #x18 #x2b)
    (#xef #x8a #x62)
    (#xfd #xdb #xc7)
    (#xff #xff #xff)
    (#xe0 #xe0 #xe0)
    (#x99 #x99 #x99)
    (#x4d #x4d #x4d)))

(define cb-rdgy-8
  #((#xb2 #x18 #x2b)
    (#xd6 #x60 #x4d)
    (#xf4 #xa5 #x82)
    (#xfd #xdb #xc7)
    (#xe0 #xe0 #xe0)
    (#xba #xba #xba)
    (#x87 #x87 #x87)
    (#x4d #x4d #x4d)))

(define cb-rdgy-9
  #((#xb2 #x18 #x2b)
    (#xd6 #x60 #x4d)
    (#xf4 #xa5 #x82)
    (#xfd #xdb #xc7)
    (#xff #xff #xff)
    (#xe0 #xe0 #xe0)
    (#xba #xba #xba)
    (#x87 #x87 #x87)
    (#x4d #x4d #x4d)))

(define cb-rdgy-10
  #((#x67 #x00 #x1f)
    (#xb2 #x18 #x2b)
    (#xd6 #x60 #x4d)
    (#xf4 #xa5 #x82)
    (#xfd #xdb #xc7)
    (#xe0 #xe0 #xe0)
    (#xba #xba #xba)
    (#x87 #x87 #x87)
    (#x4d #x4d #x4d)
    (#x1a #x1a #x1a)))

(define cb-rdgy-11
  #((#x67 #x00 #x1f)
    (#xb2 #x18 #x2b)
    (#xd6 #x60 #x4d)
    (#xf4 #xa5 #x82)
    (#xfd #xdb #xc7)
    (#xff #xff #xff)
    (#xe0 #xe0 #xe0)
    (#xba #xba #xba)
    (#x87 #x87 #x87)
    (#x4d #x4d #x4d)
    (#x1a #x1a #x1a)))

;;;; RdYlBu

(define cb-rdylbu-3
  #((#xfc #x8d #x59)
    (#xff #xff #xbf)
    (#x91 #xbf #xdb)))

(define cb-rdylbu-4
  #((#xd7 #x19 #x1c)
    (#xfd #xae #x61)
    (#xab #xd9 #xe9)
    (#x2c #x7b #xb6)))

(define cb-rdylbu-5
  #((#xd7 #x19 #x1c)
    (#xfd #xae #x61)
    (#xff #xff #xbf)
    (#xab #xd9 #xe9)
    (#x2c #x7b #xb6)))

(define cb-rdylbu-6
  #((#xd7 #x30 #x27)
    (#xfc #x8d #x59)
    (#xfe #xe0 #x90)
    (#xe0 #xf3 #xf8)
    (#x91 #xbf #xdb)
    (#x45 #x75 #xb4)))

(define cb-rdylbu-7
  #((#xd7 #x30 #x27)
    (#xfc #x8d #x59)
    (#xfe #xe0 #x90)
    (#xff #xff #xbf)
    (#xe0 #xf3 #xf8)
    (#x91 #xbf #xdb)
    (#x45 #x75 #xb4)))

(define cb-rdylbu-8
  #((#xd7 #x30 #x27)
    (#xf4 #x6d #x43)
    (#xfd #xae #x61)
    (#xfe #xe0 #x90)
    (#xe0 #xf3 #xf8)
    (#xab #xd9 #xe9)
    (#x74 #xad #xd1)
    (#x45 #x75 #xb4)))

(define cb-rdylbu-9
  #((#xd7 #x30 #x27)
    (#xf4 #x6d #x43)
    (#xfd #xae #x61)
    (#xfe #xe0 #x90)
    (#xff #xff #xbf)
    (#xe0 #xf3 #xf8)
    (#xab #xd9 #xe9)
    (#x74 #xad #xd1)
    (#x45 #x75 #xb4)))

(define cb-rdylbu-10
  #((#xa5 #x00 #x26)
    (#xd7 #x30 #x27)
    (#xf4 #x6d #x43)
    (#xfd #xae #x61)
    (#xfe #xe0 #x90)
    (#xe0 #xf3 #xf8)
    (#xab #xd9 #xe9)
    (#x74 #xad #xd1)
    (#x45 #x75 #xb4)
    (#x31 #x36 #x95)))

(define cb-rdylbu-11
  #((#xa5 #x00 #x26)
    (#xd7 #x30 #x27)
    (#xf4 #x6d #x43)
    (#xfd #xae #x61)
    (#xfe #xe0 #x90)
    (#xff #xff #xbf)
    (#xe0 #xf3 #xf8)
    (#xab #xd9 #xe9)
    (#x74 #xad #xd1)
    (#x45 #x75 #xb4)
    (#x31 #x36 #x95)))

;;;; RdYlGn

(define cb-rdylgn-3
  #((#xfc #x8d #x59)
    (#xff #xff #xbf)
    (#x91 #xcf #x60)))

(define cb-rdylgn-4
  #((#xd7 #x19 #x1c)
    (#xfd #xae #x61)
    (#xa6 #xd9 #x6a)
    (#x1a #x96 #x41)))

(define cb-rdylgn-5
  #((#xd7 #x19 #x1c)
    (#xfd #xae #x61)
    (#xff #xff #xbf)
    (#xa6 #xd9 #x6a)
    (#x1a #x96 #x41)))

(define cb-rdylgn-6
  #((#xd7 #x30 #x27)
    (#xfc #x8d #x59)
    (#xfe #xe0 #x8b)
    (#xd9 #xef #x8b)
    (#x91 #xcf #x60)
    (#x1a #x98 #x50)))

(define cb-rdylgn-7
  #((#xd7 #x30 #x27)
    (#xfc #x8d #x59)
    (#xfe #xe0 #x8b)
    (#xff #xff #xbf)
    (#xd9 #xef #x8b)
    (#x91 #xcf #x60)
    (#x1a #x98 #x50)))

(define cb-rdylgn-8
  #((#xd7 #x30 #x27)
    (#xf4 #x6d #x43)
    (#xfd #xae #x61)
    (#xfe #xe0 #x8b)
    (#xd9 #xef #x8b)
    (#xa6 #xd9 #x6a)
    (#x66 #xbd #x63)
    (#x1a #x98 #x50)))

(define cb-rdylgn-9
  #((#xd7 #x30 #x27)
    (#xf4 #x6d #x43)
    (#xfd #xae #x61)
    (#xfe #xe0 #x8b)
    (#xff #xff #xbf)
    (#xd9 #xef #x8b)
    (#xa6 #xd9 #x6a)
    (#x66 #xbd #x63)
    (#x1a #x98 #x50)))

(define cb-rdylgn-10
  #((#xa5 #x00 #x26)
    (#xd7 #x30 #x27)
    (#xf4 #x6d #x43)
    (#xfd #xae #x61)
    (#xfe #xe0 #x8b)
    (#xd9 #xef #x8b)
    (#xa6 #xd9 #x6a)
    (#x66 #xbd #x63)
    (#x1a #x98 #x50)
    (#x00 #x68 #x37)))

(define cb-rdylgn-11
  #((#xa5 #x00 #x26)
    (#xd7 #x30 #x27)
    (#xf4 #x6d #x43)
    (#xfd #xae #x61)
    (#xfe #xe0 #x8b)
    (#xff #xff #xbf)
    (#xd9 #xef #x8b)
    (#xa6 #xd9 #x6a)
    (#x66 #xbd #x63)
    (#x1a #x98 #x50)
    (#x00 #x68 #x37)))

;;;; Spectral

(define cb-spectral-3
  #((#xfc #x8d #x59)
    (#xff #xff #xbf)
    (#x99 #xd5 #x94)))

(define cb-spectral-4
  #((#xd7 #x19 #x1c)
    (#xfd #xae #x61)
    (#xab #xdd #xa4)
    (#x2b #x83 #xba)))

(define cb-spectral-5
  #((#xd7 #x19 #x1c)
    (#xfd #xae #x61)
    (#xff #xff #xbf)
    (#xab #xdd #xa4)
    (#x2b #x83 #xba)))

(define cb-spectral-6
  #((#xd5 #x3e #x4f)
    (#xfc #x8d #x59)
    (#xfe #xe0 #x8b)
    (#xe6 #xf5 #x98)
    (#x99 #xd5 #x94)
    (#x32 #x88 #xbd)))

(define cb-spectral-7
  #((#xd5 #x3e #x4f)
    (#xfc #x8d #x59)
    (#xfe #xe0 #x8b)
    (#xff #xff #xbf)
    (#xe6 #xf5 #x98)
    (#x99 #xd5 #x94)
    (#x32 #x88 #xbd)))

(define cb-spectral-8
  #((#xd5 #x3e #x4f)
    (#xf4 #x6d #x43)
    (#xfd #xae #x61)
    (#xfe #xe0 #x8b)
    (#xe6 #xf5 #x98)
    (#xab #xdd #xa4)
    (#x66 #xc2 #xa5)
    (#x32 #x88 #xbd)))

(define cb-spectral-9
  #((#xd5 #x3e #x4f)
    (#xf4 #x6d #x43)
    (#xfd #xae #x61)
    (#xfe #xe0 #x8b)
    (#xff #xff #xbf)
    (#xe6 #xf5 #x98)
    (#xab #xdd #xa4)
    (#x66 #xc2 #xa5)
    (#x32 #x88 #xbd)))

(define cb-spectral-10
  #((#x9e #x01 #x42)
    (#xd5 #x3e #x4f)
    (#xf4 #x6d #x43)
    (#xfd #xae #x61)
    (#xfe #xe0 #x8b)
    (#xe6 #xf5 #x98)
    (#xab #xdd #xa4)
    (#x66 #xc2 #xa5)
    (#x32 #x88 #xbd)
    (#x5e #x4f #xa2)))

(define cb-spectral-11
  #((#x9e #x01 #x42)
    (#xd5 #x3e #x4f)
    (#xf4 #x6d #x43)
    (#xfd #xae #x61)
    (#xfe #xe0 #x8b)
    (#xff #xff #xbf)
    (#xe6 #xf5 #x98)
    (#xab #xdd #xa4)
    (#x66 #xc2 #xa5)
    (#x32 #x88 #xbd)
    (#x5e #x4f #xa2)))

;;; Qualitative

;; NOTE: the accent qualitative color map simply adds colors at the end, as
;; such, we only define one color map, since if the user only needs 4 colors,
;; they can use just the first four entries.

(define cb-accent
  #((#x7f #xc9 #x7f)
    (#xbe #xae #xd4)
    (#xfd #xc0 #x86)
    (#xff #xff #x99)
    (#x38 #x6c #xb0)
    (#xf0 #x02 #x7f)
    (#xbf #x5b #x17)
    (#x66 #x66 #x66)))

;; NOTE: the rest of the ColorBrewer color maps are available by default in
;; the plot package.  These are: ;;;; dark2, paired, pastel1, pastel2, set1,
;; set2 and set3.

(define (register-cb-colormaps)
  ;; Sequential MultiHue: Blue-Green
  (register-color-map 'cb-bugn-3 cb-bugn-3)
  (register-color-map 'cb-bugn-4 cb-bugn-4)
  (register-color-map 'cb-bugn-5 cb-bugn-5)
  (register-color-map 'cb-bugn-6 cb-bugn-6)
  (register-color-map 'cb-bugn-7 cb-bugn-7)
  (register-color-map 'cb-bugn-8 cb-bugn-8)
  (register-color-map 'cb-bugn-9 cb-bugn-9)

  ;; Sequential MultiHue: Blue-Purple
  (register-color-map 'cb-bupu-3 cb-bupu-3)
  (register-color-map 'cb-bupu-4 cb-bupu-4)
  (register-color-map 'cb-bupu-5 cb-bupu-5)
  (register-color-map 'cb-bupu-6 cb-bupu-6)
  (register-color-map 'cb-bupu-7 cb-bupu-7)
  (register-color-map 'cb-bupu-8 cb-bupu-8)
  (register-color-map 'cb-bupu-9 cb-bupu-9)

  ;; Sequential MultiHue: Green-Blue
  (register-color-map 'cb-gnbu-3 cb-gnbu-3)
  (register-color-map 'cb-gnbu-4 cb-gnbu-4)
  (register-color-map 'cb-gnbu-5 cb-gnbu-5)
  (register-color-map 'cb-gnbu-6 cb-gnbu-6)
  (register-color-map 'cb-gnbu-7 cb-gnbu-7)
  (register-color-map 'cb-gnbu-8 cb-gnbu-8)
  (register-color-map 'cb-gnbu-9 cb-gnbu-9)

  ;; Sequential MultiHue: Orange-Red
  (register-color-map 'cb-orrd-3 cb-orrd-3)
  (register-color-map 'cb-orrd-4 cb-orrd-4)
  (register-color-map 'cb-orrd-5 cb-orrd-5)
  (register-color-map 'cb-orrd-6 cb-orrd-6)
  (register-color-map 'cb-orrd-7 cb-orrd-7)
  (register-color-map 'cb-orrd-8 cb-orrd-8)
  (register-color-map 'cb-orrd-9 cb-orrd-9)

  ;; Sequential MultiHue: Purple-Blue
  (register-color-map 'cb-pubu-3 cb-pubu-3)
  (register-color-map 'cb-pubu-4 cb-pubu-4)
  (register-color-map 'cb-pubu-5 cb-pubu-5)
  (register-color-map 'cb-pubu-6 cb-pubu-6)
  (register-color-map 'cb-pubu-7 cb-pubu-7)
  (register-color-map 'cb-pubu-8 cb-pubu-8)
  (register-color-map 'cb-pubu-9 cb-pubu-9)

  ;; Sequential MultiHue: Purple-Blue-Green
  (register-color-map 'cb-pubugn-3 cb-pubugn-3)
  (register-color-map 'cb-pubugn-4 cb-pubugn-4)
  (register-color-map 'cb-pubugn-5 cb-pubugn-5)
  (register-color-map 'cb-pubugn-6 cb-pubugn-6)
  (register-color-map 'cb-pubugn-7 cb-pubugn-7)
  (register-color-map 'cb-pubugn-8 cb-pubugn-8)
  (register-color-map 'cb-pubugn-9 cb-pubugn-9)

  ;; Sequential MultiHue: Purple-Red
  (register-color-map 'cb-purd-3 cb-purd-3)
  (register-color-map 'cb-purd-4 cb-purd-4)
  (register-color-map 'cb-purd-5 cb-purd-5)
  (register-color-map 'cb-purd-6 cb-purd-6)
  (register-color-map 'cb-purd-7 cb-purd-7)
  (register-color-map 'cb-purd-8 cb-purd-8)
  (register-color-map 'cb-purd-9 cb-purd-9)

  ;; Sequential MultiHue: Red-Purple
  (register-color-map 'cb-rdpu-3 cb-rdpu-3)
  (register-color-map 'cb-rdpu-4 cb-rdpu-4)
  (register-color-map 'cb-rdpu-5 cb-rdpu-5)
  (register-color-map 'cb-rdpu-6 cb-rdpu-6)
  (register-color-map 'cb-rdpu-7 cb-rdpu-7)
  (register-color-map 'cb-rdpu-8 cb-rdpu-8)
  (register-color-map 'cb-rdpu-9 cb-rdpu-9)

  ;; Sequential MultiHue: Yellow-Green
  (register-color-map 'cb-ylgn-3 cb-ylgn-3)
  (register-color-map 'cb-ylgn-4 cb-ylgn-4)
  (register-color-map 'cb-ylgn-5 cb-ylgn-5)
  (register-color-map 'cb-ylgn-6 cb-ylgn-6)
  (register-color-map 'cb-ylgn-7 cb-ylgn-7)
  (register-color-map 'cb-ylgn-8 cb-ylgn-8)
  (register-color-map 'cb-ylgn-9 cb-ylgn-9)

  ;; Sequential MultiHue: Yelow-Green-Blue
  (register-color-map 'cb-ylgnbu-3 cb-ylgnbu-3)
  (register-color-map 'cb-ylgnbu-4 cb-ylgnbu-4)
  (register-color-map 'cb-ylgnbu-5 cb-ylgnbu-5)
  (register-color-map 'cb-ylgnbu-6 cb-ylgnbu-6)
  (register-color-map 'cb-ylgnbu-7 cb-ylgnbu-7)
  (register-color-map 'cb-ylgnbu-8 cb-ylgnbu-8)
  (register-color-map 'cb-ylgnbu-9 cb-ylgnbu-9)

  ;; Sequential MultiHue: Yellow-Orange-Brown
  (register-color-map 'cb-ylorbr-3 cb-ylorbr-3)
  (register-color-map 'cb-ylorbr-4 cb-ylorbr-4)
  (register-color-map 'cb-ylorbr-5 cb-ylorbr-5)
  (register-color-map 'cb-ylorbr-6 cb-ylorbr-6)
  (register-color-map 'cb-ylorbr-7 cb-ylorbr-7)
  (register-color-map 'cb-ylorbr-8 cb-ylorbr-8)
  (register-color-map 'cb-ylorbr-9 cb-ylorbr-9)

  ;; Sequential MultiHue: Yellow-Orange-Red
  (register-color-map 'cb-ylorrd-3 cb-ylorrd-3)
  (register-color-map 'cb-ylorrd-4 cb-ylorrd-4)
  (register-color-map 'cb-ylorrd-5 cb-ylorrd-5)
  (register-color-map 'cb-ylorrd-6 cb-ylorrd-6)
  (register-color-map 'cb-ylorrd-7 cb-ylorrd-7)
  (register-color-map 'cb-ylorrd-8 cb-ylorrd-8)
  (register-color-map 'cb-ylorrd-9 cb-ylorrd-9)

  ;; Sequential SingleHue: Blues
  (register-color-map 'cb-blues-3 cb-blues-3)
  (register-color-map 'cb-blues-4 cb-blues-4)
  (register-color-map 'cb-blues-5 cb-blues-5)
  (register-color-map 'cb-blues-6 cb-blues-6)
  (register-color-map 'cb-blues-7 cb-blues-7)
  (register-color-map 'cb-blues-8 cb-blues-8)
  (register-color-map 'cb-blues-9 cb-blues-9)

  ;; Sequential SingleHue: Greens
  (register-color-map 'cb-greens-3 cb-greens-3)
  (register-color-map 'cb-greens-4 cb-greens-4)
  (register-color-map 'cb-greens-5 cb-greens-5)
  (register-color-map 'cb-greens-6 cb-greens-6)
  (register-color-map 'cb-greens-7 cb-greens-7)
  (register-color-map 'cb-greens-8 cb-greens-8)
  (register-color-map 'cb-greens-9 cb-greens-9)

  ;; Sequential SingleHue: Greys
  (register-color-map 'cb-greys-3 cb-greys-3)
  (register-color-map 'cb-greys-4 cb-greys-4)
  (register-color-map 'cb-greys-5 cb-greys-5)
  (register-color-map 'cb-greys-6 cb-greys-6)
  (register-color-map 'cb-greys-7 cb-greys-7)
  (register-color-map 'cb-greys-8 cb-greys-8)
  (register-color-map 'cb-greys-9 cb-greys-9)

  ;; Sequential SingleHue: Oranges
  (register-color-map 'cb-oranges-3 cb-oranges-3)
  (register-color-map 'cb-oranges-4 cb-oranges-4)
  (register-color-map 'cb-oranges-5 cb-oranges-5)
  (register-color-map 'cb-oranges-6 cb-oranges-6)
  (register-color-map 'cb-oranges-7 cb-oranges-7)
  (register-color-map 'cb-oranges-8 cb-oranges-8)
  (register-color-map 'cb-oranges-9 cb-oranges-9)

  ;; Sequential SingleHue: Purples
  (register-color-map 'cb-purples-3 cb-purples-3)
  (register-color-map 'cb-purples-4 cb-purples-4)
  (register-color-map 'cb-purples-5 cb-purples-5)
  (register-color-map 'cb-purples-6 cb-purples-6)
  (register-color-map 'cb-purples-7 cb-purples-7)
  (register-color-map 'cb-purples-8 cb-purples-8)
  (register-color-map 'cb-purples-9 cb-purples-9)

  ;; Sequential SingleHue: Reds
  (register-color-map 'cb-reds-3 cb-reds-3)
  (register-color-map 'cb-reds-4 cb-reds-4)
  (register-color-map 'cb-reds-5 cb-reds-5)
  (register-color-map 'cb-reds-6 cb-reds-6)
  (register-color-map 'cb-reds-7 cb-reds-7)
  (register-color-map 'cb-reds-8 cb-reds-8)
  (register-color-map 'cb-reds-9 cb-reds-9)

  ;; Diverging: Brown-Blue-Green
  (register-color-map 'cb-brbg-3 cb-brbg-3)
  (register-color-map 'cb-brbg-4 cb-brbg-4)
  (register-color-map 'cb-brbg-5 cb-brbg-5)
  (register-color-map 'cb-brbg-6 cb-brbg-6)
  (register-color-map 'cb-brbg-7 cb-brbg-7)
  (register-color-map 'cb-brbg-8 cb-brbg-8)
  (register-color-map 'cb-brbg-9 cb-brbg-9)
  (register-color-map 'cb-brbg-10 cb-brbg-10)
  (register-color-map 'cb-brbg-11 cb-brbg-11)

  ;; Diverging: Pink-Yellow-Green
  (register-color-map 'cb-piyg-3 cb-piyg-3)
  (register-color-map 'cb-piyg-4 cb-piyg-4)
  (register-color-map 'cb-piyg-5 cb-piyg-5)
  (register-color-map 'cb-piyg-6 cb-piyg-6)
  (register-color-map 'cb-piyg-7 cb-piyg-7)
  (register-color-map 'cb-piyg-8 cb-piyg-8)
  (register-color-map 'cb-piyg-9 cb-piyg-9)
  (register-color-map 'cb-piyg-10 cb-piyg-10)
  (register-color-map 'cb-piyg-11 cb-piyg-11)
  
  ;; Diverging: Purple-Green
  (register-color-map 'cb-prgn-3 cb-prgn-3)
  (register-color-map 'cb-prgn-4 cb-prgn-4)
  (register-color-map 'cb-prgn-5 cb-prgn-5)
  (register-color-map 'cb-prgn-6 cb-prgn-6)
  (register-color-map 'cb-prgn-7 cb-prgn-7)
  (register-color-map 'cb-prgn-8 cb-prgn-8)
  (register-color-map 'cb-prgn-9 cb-prgn-9)
  (register-color-map 'cb-prgn-10 cb-prgn-10)
  (register-color-map 'cb-prgn-11 cb-prgn-11)

  ;; Diverging: Purple-Orange
  (register-color-map 'cb-puor-3 cb-puor-3)
  (register-color-map 'cb-puor-4 cb-puor-4)
  (register-color-map 'cb-puor-5 cb-puor-5)
  (register-color-map 'cb-puor-6 cb-puor-6)
  (register-color-map 'cb-puor-7 cb-puor-7)
  (register-color-map 'cb-puor-8 cb-puor-8)
  (register-color-map 'cb-puor-9 cb-puor-9)
  (register-color-map 'cb-puor-10 cb-puor-10)
  (register-color-map 'cb-puor-11 cb-puor-11)

  ;; Diverging: Red-Blue
  (register-color-map 'cb-rdbu-3 cb-rdbu-3)
  (register-color-map 'cb-rdbu-4 cb-rdbu-4)
  (register-color-map 'cb-rdbu-5 cb-rdbu-5)
  (register-color-map 'cb-rdbu-6 cb-rdbu-6)
  (register-color-map 'cb-rdbu-7 cb-rdbu-7)
  (register-color-map 'cb-rdbu-8 cb-rdbu-8)
  (register-color-map 'cb-rdbu-9 cb-rdbu-9)
  (register-color-map 'cb-rdbu-10 cb-rdbu-10)
  (register-color-map 'cb-rdbu-11 cb-rdbu-11)

  ;; Diverging: Red-Grey
  (register-color-map 'cb-rdgy-3 cb-rdgy-3)
  (register-color-map 'cb-rdgy-4 cb-rdgy-4)
  (register-color-map 'cb-rdgy-5 cb-rdgy-5)
  (register-color-map 'cb-rdgy-6 cb-rdgy-6)
  (register-color-map 'cb-rdgy-7 cb-rdgy-7)
  (register-color-map 'cb-rdgy-8 cb-rdgy-8)
  (register-color-map 'cb-rdgy-9 cb-rdgy-9)
  (register-color-map 'cb-rdgy-10 cb-rdgy-10)
  (register-color-map 'cb-rdgy-11 cb-rdgy-11)

  ;; Diverging: Red-Yellow-Blue
  (register-color-map 'cb-rdylbu-3 cb-rdylbu-3)
  (register-color-map 'cb-rdylbu-4 cb-rdylbu-4)
  (register-color-map 'cb-rdylbu-5 cb-rdylbu-5)
  (register-color-map 'cb-rdylbu-6 cb-rdylbu-6)
  (register-color-map 'cb-rdylbu-7 cb-rdylbu-7)
  (register-color-map 'cb-rdylbu-8 cb-rdylbu-8)
  (register-color-map 'cb-rdylbu-9 cb-rdylbu-9)
  (register-color-map 'cb-rdylbu-10 cb-rdylbu-10)
  (register-color-map 'cb-rdylbu-11 cb-rdylbu-11)

  ;; Diverging: Red-Yellow-Green
  (register-color-map 'cb-rdylgn-3 cb-rdylgn-3)
  (register-color-map 'cb-rdylgn-4 cb-rdylgn-4)
  (register-color-map 'cb-rdylgn-5 cb-rdylgn-5)
  (register-color-map 'cb-rdylgn-6 cb-rdylgn-6)
  (register-color-map 'cb-rdylgn-7 cb-rdylgn-7)
  (register-color-map 'cb-rdylgn-8 cb-rdylgn-8)
  (register-color-map 'cb-rdylgn-9 cb-rdylgn-9)
  (register-color-map 'cb-rdylgn-10 cb-rdylgn-10)
  (register-color-map 'cb-rdylgn-11 cb-rdylgn-11)

  ;; Diverging: Spectral
  (register-color-map 'cb-spectral-3 cb-spectral-3)
  (register-color-map 'cb-spectral-4 cb-spectral-4)
  (register-color-map 'cb-spectral-5 cb-spectral-5)
  (register-color-map 'cb-spectral-6 cb-spectral-6)
  (register-color-map 'cb-spectral-7 cb-spectral-7)
  (register-color-map 'cb-spectral-8 cb-spectral-8)
  (register-color-map 'cb-spectral-9 cb-spectral-9)
  (register-color-map 'cb-spectral-10 cb-spectral-10)
  (register-color-map 'cb-spectral-11 cb-spectral-11)

  (register-color-map 'cb-accent cb-accent)
  )

(register-cb-colormaps)
