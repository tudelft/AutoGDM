
(cl:in-package :asdf)

(defsystem "olfaction_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :nav_msgs-msg
)
  :components ((:file "_package")
    (:file "suggestNextObservationLocation" :depends-on ("_package_suggestNextObservationLocation"))
    (:file "_package_suggestNextObservationLocation" :depends-on ("_package"))
  ))