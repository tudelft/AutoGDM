
(cl:in-package :asdf)

(defsystem "olfaction_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Observation" :depends-on ("_package_Observation"))
    (:file "_package_Observation" :depends-on ("_package"))
    (:file "anemometer" :depends-on ("_package_anemometer"))
    (:file "_package_anemometer" :depends-on ("_package"))
    (:file "gas_sensor" :depends-on ("_package_gas_sensor"))
    (:file "_package_gas_sensor" :depends-on ("_package"))
    (:file "gas_sensor_array" :depends-on ("_package_gas_sensor_array"))
    (:file "_package_gas_sensor_array" :depends-on ("_package"))
  ))