## TYPE
uint8 TYPE_INVALID=0
uint8 TYPE_GAS=1
uint8 TYPE_WIND=2
uint8 TYPE_GAS_WIND=3


## OBSERVATION
Header                  header          # timestamp, frame_id
string                  label           # optional sensor label
geometry_msgs/Point     position        # sensor pose with regard to frame_id
uint8                   type		# specify sensor type
float32                 gas             # gas reading
geometry_msgs/Vector3   wind            # wind vector



