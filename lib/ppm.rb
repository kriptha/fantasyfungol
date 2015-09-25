# ppm ( points per minute ) is the basal unit of measurement
# for everything we want to calculate and compare
def ppm(points, minutes)
points = points.to_f
minutes = minutes.to_f
points_per_minute = ( points / minutes )
return points_per_minute
end

def ppmpp(ppm, price)
price = ( price.to_f / 10 )
ppmpp = ( ppm / price )
return ppmpp
end
