""" minimize_newton!(x, f, g, h)
Newton minimization of "f", with first and second derivatives "g" and "h" respectively.
Starts the iteration from "x0".
"""
function optimize_newton(x, f, g, h;
	                     grtol=1e-4,
	                     gatol=1e-4,
	                     prints=false)
    while true # aqui se pone "true" para no poner una condic extra, y siempre entre al "while"
    	fx = f(x)
    	gx = g(x)
    	hx = h(x)

    	# check convergence
    	if abs(abs(gx) / fx) <= grtol # si alguna de las 2 desigualdades se cumple, hace el "break" y sale del "while" pq ya se llego al punto de optimizacion
    		break
    	end

    	abs(gx) <= gatol && break

    	if prints
    		println("|G|=$(abs(gx))")
    	end

    	# move point to next position
    	x -= gx / hx
    end

    return x
end