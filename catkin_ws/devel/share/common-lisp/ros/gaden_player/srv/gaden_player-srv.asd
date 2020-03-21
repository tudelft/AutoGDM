
(cl:in-package :asdf)

(defsystem "gaden_player-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "GasPosition" :depends-on ("_package_GasPosition"))
    (:file "_package_GasPosition" :depends-on ("_package"))
    (:file "WindPosition" :depends-on ("_package_WindPosition"))
    (:file "_package_WindPosition" :depends-on ("_package"))
  ))