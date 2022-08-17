(defpackage heclcl/tests/main
  (:use :cl
        :heclcl
        :rove))
(in-package :heclcl/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :heclcl)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
