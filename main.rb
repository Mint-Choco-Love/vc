require './VC'

a = VC::Vec2.new(1, 2)
b = VC::Vec2.new(7, -1)
p a.multiply(3)
p a.is_orthogonal_with(b)

i = VC::Vec2.unit(:i)
j = VC::Vec2.unit(:j)
p i.dot_product(j)
p i.is_orthogonal_with(j)

p VC::Vec2.angle(a, b)

pa = VC::Vec2.new(-1 * Math.cos(30 * Math::PI / 180), -1 * Math.sin(30 * Math::PI / 180))
p pa
pf = VC::Vec2.new(0, 9.8 * (-2))
p pf
p pf.project_on(pa)

ta = VC::Vec3.new(3, 1, 0)
tb = VC::Vec3.new(2, -1, 0)
tc = VC::Vec3.new(0, 2, 0)

p VC::Vec3.area_of_triangle(ta, tb, tc)


va = VC::Vec3.new(1, 5, 0)
vb = VC::Vec3.new(-4, 2, 0)
vc = VC::Vec3.new(1, 1, 6)

p VC::Vec3.volume_of_parallelepiped(va, vb, vc)


