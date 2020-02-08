#lang racket/base
;; tol.rkt -- colormaps based on Paul Tol's color schemes
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

;; See https://personal.sron.nl/~pault/ for how the color schemes are designed
;; and intended to be used.

(require plot/utils
         racket/math
         racket/match
         racket/contract)

;; Colour blind safe color scheme.  main scheme for lines and their labels
(define tol-bright-qualitative
  #((68 119 170)                        ; blue
    (102 204 238)                       ; cyan
    (34 136 51)                         ; green
    (204 187 68)                        ; yellow
    (238 102 119)                       ; red
    (170 51 119)                        ; purple
    (187 187 187)                       ; grey
    ))

;; Alternative color scheme, color blind safe and optimized for contrast
(define tol-high-contrast-qualitative
  #((255 255 255)                       ; white
    (221 170 51)                        ; yellow
    (187 85 102)                        ; red
    (0 68 136)                          ; blue
    (0 0 0)                             ; black
  ))

;; Alternative color scheme, also color-blind safe
(define tol-vibrant-qualitative
  #((0 119 187)                         ; blue
    (51 187 238)                        ; cyan
    (0 153 136)                         ; teal
    (238 119 51)                        ; orange
    (204 51 17)                         ; red
    (238 51 119)                        ; magenta
    (187 187 187)                       ; grey
    ))

;; Alternative color scheme, with more colors, lacks a clear red or medium blue.  The last color
;; is meant for bad data
(define tol-muted-qualitative
  #((51 34 136)                         ; indigo
    (136 204 238)                       ; cyan
    (68 170 153)                        ; teal
    (17 119 51)                         ; green
    (153 153 51)                        ; olive
    (221 204 119)                       ; sand
    (204 102 119)                       ; rose
    (136 34 85)                         ; wine
    (170 68 153)                        ; purple
    (221 221 221)                       ; pale grey
    ))

;; Not very distinct in either normal or color blind vision -- meant as a background for black text
(define tol-pale-qualitative
  #((187 204 238)                       ; pale blue
    (204 238 255)                       ; pale cyan
    (204 221 170)                       ; pale green
    (238 238 187)                       ; pale yellow
    (255 204 204)                       ; pale red
    (221 221 221)                       ; pale gray
    ))

;; Not very distinct in either normal or color blind vision -- meant as a background for white text
(define tol-dark-qualitative
  #((34 34 85)                          ; dark blue
    (34 85 85)                          ; dark cyan
    (34 85 34)                          ; dark green
    (102 102 51)                        ; dark yellow
    (102 51 51)                         ; dark red
    (85 85 85)                          ; dark grey
    ))

(define tol-light-qualitative
  #((119 170 221)                       ; light blue
    (153 221 255)                       ; light cyan
    (68 187 153)                        ; mint
    (187 204 51)                        ; pear
    (170 170 0)                         ; olive
    (238 221 136)                       ; light yellow
    (238 136 102)                       ; orange
    (255 170 187)                       ; pink
    (221 221 221)                       ; pale grey
    ))

;; NOTE: (255 255 255) can be used for bad data
(define tol-sunset-diverging
  #((54 75 154)
    (74 123 183)
    (110 166 205)
    (152 202 225)
    (194 228 239)
    (234 236 204)
    (254 218 139)
    (253 179 102)
    (246 126 75)
    (221 61 45)
    (165 0 38)))

;; NOTE: 255 238 153 can be used for bad data
(define tol-burd-diverging
  #((33 102 172)
    (67 147 195)
    (146 197 222)
    (209 229 240)
    (247 247 247)
    (253 219 199)
    (244 165 130)
    (214 96 77)
    (178 24 43)
    ))

;; NOTE: 255 238 153 can be used for bad data
(define tol-prgn-diverging
  #((118 42 131)
    (153 112 171)
    (194 165 207)
    (231 212 232)
    (247 247 247)
    (217 240 211)
    (172 211 158)
    (90 174 97)
    (27 120 55)
    ))

;; NOTE: 136 136 136 can be used for bad data
(define tol-ylorbr-sequential
  #((255 255 229)
    (255 247 188)
    (254 227 145)
    (254 196 79)
    (251 154 41)
    (236 112 20)
    (204 76 2)
    (153 52 4)
    (102 37 6)
    ))

;; NOTE: 153 153 153 can be used for bad data
(define tol-iridescent-sequential
  #((254 251 233)
    (252 247 213)
    (245 243 193)
    (234 240 181)
    (221 236 191)
    (208 231 202)
    (194 227 210)
    (181 221 216)
    (168 216 220)
    (155 210 225)
    (141 203 228)
    (129 196 231)
    (123 188 231)
    (126 178 228)
    (136 165 221)
    (147 152 210)
    (155 138 196)
    (157 125 178)
    (154 112 158)
    (144 99 136)
    (128 87 112)
    (104 73 87)
    (70 53 58)
    ))

;; NOTE: 119, 119, 119 can be used for bad data
(define tol-discrete-rainbow-14
  #((209 187 215)                       ; 3 
    (174 118 163)                       ; 6 
    (136 46 114)                        ; 9 
    (25 101 176)                        ; 10
    (82 137 199)                        ; 12
    (123 175 222)                       ; 14
    (78 178 101)                        ; 15
    (144 201 135)                       ; 16
    (202 224 171)                       ; 17
    (247 240 86)                        ; 18
    (246 193 65)                        ; 20
    (241 147 45)                        ; 22
    (232 96 28)                         ; 24
    (220 5 12)                          ; 26
    ))

;; NOTE: 119, 119, 119 can be used for bad data
(define tol-discrete-rainbow-23
  #((232 236 251)                       ; 1 
    (217 204 227)                       ; 2
    (202 172 203)                       ; 4
    (186 141 180)                       ; 5
    (170 111 158)                       ; 7
    (153 79 136)                        ; 8
    (136 46 114)                        ; 9
    (25 101 176)                        ; 10
    (67 125 191)                        ; 11
    (97 149 207)                        ; 13
    (123 175 222)                       ; 14
    (78 178 101)                        ; 15
    (144 201 135)                       ; 16
    (202 224 171)                       ; 17
    (247 240 86)                        ; 18
    (247 203 69)                        ; 19
    (244 167 54)                        ; 21
    (238 128 38)                        ; 23
    (230 85 24)                         ; 25
    (220 5 12)                          ; 26
    (165 23 14)                         ; 27
    (114 25 14)                         ; 28
    (66 21 10)                          ; 29
    ))

;; NOTE 102, 102 102 can be used for invalid data
(define tol-smooth-rainbow
  #((232 236 251)
    (221 216 239)
    (209 193 225)
    (195 168 209)
    (181 143 194)
    (167 120 180)
    (155 98 167)
    (140 78 153)
    (111 76 155)
    (96 89 169)
    (85 104 184)
    (78 121 197)
    (77 138 198)
    (78 150 188)
    (84 158 179)
    (89 165 169)
    (96 171 158)
    (105 177 144)
    (119 183 125)
    (140 188 104)
    (166 190 84)
    (190 188 72)
    (209 181 65)
    (221 170 60)
    (228 156 57)
    (231 140 53)
    (230 121 50)
    (228 99 45)
    (223 72 40)
    (218 34 34)
    (184 34 30)
    (149 33 27)
    (114 30 23)
    (82 26 19)
    ))

(define tol-rainbow-discrete
  #((232 236 251)                       ; 1 
    (217 204 227)                       ; 2
    (209 187 215)                       ; 3 
    (202 172 203)                       ; 4
    (186 141 180)                       ; 5
    (174 118 163)                       ; 6 
    (170 111 158)                       ; 7
    (153 79 136)                        ; 8
    (136 46 114)                        ; 9
    (25 101 176)                        ; 10
    (67 125 191)                        ; 11
    (82 137 199)                        ; 12
    (97 149 207)                        ; 13
    (123 175 222)                       ; 14
    (78 178 101)                        ; 15
    (144 201 135)                       ; 16
    (202 224 171)                       ; 17
    (247 240 86)                        ; 18
    (247 203 69)                        ; 19
    (246 193 65)                        ; 20
    (244 167 54)                        ; 21
    (241 147 45)                        ; 22    
    (238 128 38)                        ; 23
    (232 96 28)                         ; 24    
    (230 85 24)                         ; 25
    (220 5 12)                          ; 26
    (165 23 14)                         ; 27
    (114 25 14)                         ; 28
    (66 21 10)                          ; 29
    ))

(define tol-rainbow-discrete-tower
  #((10)
    (10 26)
    (10 18 26)
    (10 15 18 26)
    (10 14 15 18 26)
    (10 14 15 17 18 26)
    (9 10 14 15 17 18 26)
    (9 10 14 15 17 18 23 26)
    (9 10 14 15 17 18 23 26 28)
    (9 10 14 15 17 18 21 24 26 28)
    (9 10 12 14 15 17 18 21 24 26 28)
    (3 6 9 10 12 14 15 17 18 21 24 26)
    (3 6 9 10 12 14 15 16 17 18 21 24 26)
    (3 6 9 10 12 14 15 16 17 18 20 22 24 26)
    (3 6 9 10 12 14 15 16 17 18 20 22 24 26 28)
    (3 5 7 9 10 12 14 15 16 17 18 20 22 24 26 28)
    (3 5 7 8 9 10 12 14 15 16 17 18 20 22 24 26 28)
    (3 5 7 8 9 10 12 14 15 16 17 18 20 22 24 26 27 28)
    (2 4 5 7 8 9 10 12 14 15 16 17 18 20 22 24 26 27 28)
    (2 4 5 7 8 9 10 11 13 14 15 16 17 18 20 22 24 26 27 28)
    (2 4 5 7 8 9 10 11 13 14 15 16 17 18 19 21 23 25 26 27 28)
    (2 4 5 7 8 9 10 11 13 14 15 16 17 18 19 21 23 25 26 27 28 29)
    (1 2 4 5 7 8 9 10 11 13 14 15 16 17 18 19 21 23 25 26 27 28 29)))

(define (register-tol-colormaps)
  (register-color-map 'tol-bq tol-bright-qualitative)
  (register-color-map 'tol-hcq tol-high-contrast-qualitative)
  (register-color-map 'tol-vq tol-vibrant-qualitative)
  (register-color-map 'tol-pq tol-pale-qualitative)
  (register-color-map 'tol-dq tol-dark-qualitative)
  (register-color-map 'tol-mq tol-muted-qualitative)
  (register-color-map 'tol-lq tol-light-qualitative)
  (register-color-map 'tol-sd tol-sunset-diverging)
  (register-color-map 'tol-bd tol-burd-diverging)
  (register-color-map 'tol-pd tol-prgn-diverging)
  (register-color-map 'tol-ys tol-ylorbr-sequential)
  (register-color-map 'tol-is tol-iridescent-sequential))

(define (make-tol-rainbow-colormap num #:register? (register? #f) #:name (name #f))
  (define colormap
    (if (<= num (vector-length tol-rainbow-discrete-tower))
        (for/vector ([index (in-list (vector-ref tol-rainbow-discrete-tower (sub1 num)))])
          (vector-ref tol-rainbow-discrete (sub1 index)))
        ;; todo interpolate in tol-smooth-rainbow
        (let ((step (/ (sub1 (vector-length tol-smooth-rainbow)) (sub1 num))))
          (for/vector ([index (in-range num)])
            (define nindex (* index step))
            (define alpha (- nindex (exact-truncate nindex)))
            (if (zero? alpha)
                (vector-ref tol-smooth-rainbow (exact-truncate nindex))
                (match-let ([(list ar ag ab) (vector-ref tol-smooth-rainbow (exact-truncate nindex))]
                            [(list br bg bb) (vector-ref tol-smooth-rainbow (add1 (exact-truncate nindex)))])
                  (list
                   (exact-round (+ ar (* alpha (- br ar))))
                   (exact-round (+ ag (* alpha (- bg ag))))
                   (exact-round (+ ab (* alpha (- bb ab)))))))))))
  (when register?
    (define cm-name (or name (string->symbol (format "tol-rainbow-~a" num))))
    (register-color-map cm-name colormap))
  colormap)

(register-tol-colormaps)

(provide/contract
 (make-tol-rainbow-colormap (->* (exact-positive-integer?)
                                 (#:register? boolean? #:name (or/c #f symbol?))
                                 (vectorof (list/c integer? integer? integer?)))))
