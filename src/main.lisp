(defpackage heclcl
  (:import-from :drakma :http-request)
  (:use :cl)
  (:export
   #:GET-ALL-SERVER-TYPES
   #:MAKE-CLIENT
   )
  )
(in-package :heclcl)
(push '("application" . "json") drakma:*text-content-types*)

(defclass client ()
  ((api-token :initarg :api-token
	      :accessor api-token)
   ))

(defun make-client (api-token)
  (let ((token (concatenate 'string "Bearer " api-token)))
  (make-instance 'client :api-token token)))

(defmethod get-all-server-types ((client client))
  "https://docs.hetzner.cloud/#server-types-get-all-server-types"
  
  (LET ((HOST "https://api.hetzner.cloud")
        (BASEPATH "/v1")
        (URI "https://api.hetzner.cloud/v1/server_types"))
    (with-accessors ((api-token api-token)
		     ) client
    (MULTIPLE-VALUE-BIND
        (RESP-BODY STATUS-CODE HEADERS URI RESP-STREAM MUST-CLOSE
         REASON-PHRASE)
        (DRAKMA:HTTP-REQUEST URI :METHOD :GET :ADDITIONAL-HEADERS
                             (LIST (CONS "Authorization" api-token)))
      (LIST RESP-BODY STATUS-CODE HEADERS URI)))))
