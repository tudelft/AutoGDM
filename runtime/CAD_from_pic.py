# These coords are just an example and can be any length.
# They can be from a numpy array or loaded from a file.
coords = [
    (0.1, 0.21),
    (0.4, 0.24),
    (0.6, 0.4),
    (0.7, 0.1),
    (-0.2, -0.3),
    ]

import bpy

cu = bpy.data.curves.new(name="MyCurve", type='CURVE')

# setup curve
cu.fill_mode = 'NONE'
cu.extrude = 0.02
cu.bevel_depth = 0.02

# link to scene
ob = bpy.data.objects.new(name="MyObject", object_data=cu)
scene = bpy.context.scene
scene.objects.link(ob)

# fill curve with data
spline = cu.splines.new(type='POLY')
# -1 because we already have a point
spline.points.add(len(coords) - 1)
for i, point in enumerate(spline.points):
    point.co[0:2] = coords[i]