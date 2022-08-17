(defsystem "heclcl"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ("drakma")
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "heclcl/tests"))))

(defsystem "heclcl/tests"
  :author ""
  :license ""
  :depends-on ("heclcl"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for heclcl"
  :perform (test-op (op c) (symbol-call :rove :run c)))
