from sumadora.sumadora import sumar

def test_sumar():
	assert sumar(1, 1, 1, 1, 1) == 5
	assert sumar(1, -1) == 0 