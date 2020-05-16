
Set obj = CreateObject("testlua.Teste")

Wscript.Echo obj.Sum(2,3)

Wscript.Echo obj.I2A(3)

Dim quotient
Dim remainder

obj.IntDivide 5,2,quotient,remainder

Wscript.Echo quotient

Wscript.Echo remainder

