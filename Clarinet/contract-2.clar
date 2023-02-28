;; Contract-2.clar

;; Define a data variable to store the maintenance schedule
(define-data-var maintenance-schedule (tuple
    (last-maintenance-time uint)
    (maintenance-interval uint)
) '(0 60))

;; Define a private function to get the current block timestamp
(define-private (get-current-time)
  (tuple-get (chain-get-block-info (block-info) 'block-height-info) 'timestamp)
)

;; Define a public function to check if maintenance is needed
(define-public (needs-maintenance)
  ;; Get the last maintenance time and maintenance interval from the maintenance schedule
  (let ((last-time (get-tuple maintenance-schedule 0))
        (interval (get-tuple maintenance-schedule 1))
        (current-time (get-current-time)))
    ;; If the current time is greater than the sum of the last maintenance time and the maintenance interval, return true
    (if (lt (add last-time interval) current-time)
      (ok true)
      ;; Otherwise, return false
      (ok false)
    )
  )
)

;; Define a public function to set the maintenance schedule
(define-public (set-maintenance-schedule (new-schedule (tuple
    (last-maintenance-time uint)
    (maintenance-interval uint)
))))
  ;; Set the maintenance schedule to the new schedule
  (ok (set-data! maintenance-schedule new-schedule))
)