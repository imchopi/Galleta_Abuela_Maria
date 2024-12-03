;; Base de conocimiento

(deftemplate galleta
  0 10
  (
    ;; (cruda (0 1) (4 0))
    (poco_cruda (4 1) (6 0.5) (7 0))
    (medio_hechas (3 0) (5 1) (6 1) (8 0))
    (doraditas (5 0) (7 1))
    ;; (chamuscada (10 1))
  )
)

(deftemplate temperatura
  0 250
  (
    (baja (150 0) (160 1) (180 1) (190 0))
    (media (170 0) (190 1) (210 1) (230 0))
    (alta (210 0) (220 1) (240 1) (250 0))
  )
)

(defrule regla_1
  (galleta poco_cruda)
  =>
  (assert (temperatura media))
)

(defrule regla_2
  (galleta medio_hechas)
  =>
  (assert (temperatura alta))
)

(defrule regla_3
  (galleta doraditas)
  =>
  (assert (temperatura baja))
)