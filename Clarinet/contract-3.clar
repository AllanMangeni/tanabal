;; Contract-3.clar

;; Define a data variable to store the maintenance log
(define-data-var maintenance-log (list (tuple
    (maintenance-time uint)
    (maintenance-type uint)
)))

;; Define a public function to log a maintenance event
(define-public (log-maintenance (maintenance-time uint) (maintenance-type uint))
  ;; Create a new maintenance entry as a tuple
  (let ((new-entry (tuple (maintenance-time maintenance-time)
                          (maintenance-type maintenance-type))))
    ;; Add the new entry to the maintenance log using the push function
    (ok (push new-entry (get-data maintenance-log))))
)

;; Define a public function to get the maintenance log
(define-public (get-maintenance-log)
  ;; Return the entire maintenance log list
  (ok (get-data maintenance-log)))
)