;; Contract-1.clar

;; Define a data variable to store the current sensor readings
(define-data-var sensor-readings (tuple
    (temperature uint)
    (humidity uint)
    (pressure uint)
))

;; Define a public function to update the sensor readings
(define-public (update-sensor-readings (new-temperature uint) (new-humidity uint) (new-pressure uint))
  ;; Set the sensor readings to the new values
  (ok (set-data! sensor-readings (tuple (new-temperature new-humidity new-pressure))))
)

;; Define a public function to get the current sensor readings
(define-public (get-sensor-readings)
  ;; Return the sensor readings tuple
  (ok (get-data sensor-readings))
)
